Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2246C4361B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 17:57:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1989125566
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 17:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1989125566
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Pb1KMF1gjUqZaEl+AQLbioJ4jlpQRHJICO2xjfmzE0s=; b=pkigDSqHujZ56Im+m4keu21UO
	jLTgBkIV0DVm3xMsM1Cf+v0z3qEl8S2k1+UDHBuSWdRftJGbh3vcmiSYVZW/eGzBgFbNY7knLzT4U
	gr4TSonkDsTnsQMtAgA1dvAEAjms3KcQy6XDLRw7KjQvniK4SWqhtiBBwaXS6DtZwUTYAn7Qfwm/f
	6p2EjwMGlX35qcSsGNTrVPpmv0pcHLqhrkRLQWOUzsT0oN483UTWtWs8mkD2cT/pTK2wsuJv8A/8h
	nP+eGMbqOpA29GHcHcZe80TEwNbg75/lNQvjHYVKpP2PYYBh9w7NrtKbefPrCA0Xt1iFdOESu76Xx
	eGRswo7/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpb3P-0004Lm-HD; Wed, 16 Dec 2020 17:57:35 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpb3J-0004Kg-J2
 for linux-riscv@lists.infradead.org; Wed, 16 Dec 2020 17:57:32 +0000
Received: by mail-io1-xd2e.google.com with SMTP id w18so10946118iot.0
 for <linux-riscv@lists.infradead.org>; Wed, 16 Dec 2020 09:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xS1MHac8SoJoe4GKos3v2gJOMGVNlLuzMfcAf2FRQIs=;
 b=sEwNSuIZ7s/T4LGRR6MfEePQmUcQGjyD0fxkoVuGW/xO1kDsqam6918Gy+JiCREtD/
 g0Qmuiing3vW+cXQsWyBHm8dqr3/clhwxxxPFIFNW4RQqUzDkexAcDz1Ee72MHcgzAGp
 BrwYVQnS4hh5JEdjYSp/w5HCD1hL07tT8KHk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xS1MHac8SoJoe4GKos3v2gJOMGVNlLuzMfcAf2FRQIs=;
 b=A5RzY5FuwLHdcvSdFk+X8gEOsizmbKhqhuCozZj6TpqFxwdBDN8QtN4WW2fYmLllmm
 YGbTK7UD03EQDFB+e8TqqwcEUKFzDxvNCINLwJJ+YLUe1c/DDkhK074PLzAJsBWAGm8w
 e+aEhdHXnkD01w0UZorA5/7OBfRSM5+O/HPzCsBO0jPfpCecVregr3TzNNtm43sv/eRU
 g8z1SVpAAtTbAxtktZ5OchjItyjsuUomQzEnQKDGNdgLKlEywF7m50q0z/FGsLyBD87U
 f/zoNT6asi7cxD7M+OOib7yN9FzItQgd36q3rTozHcdNNpbj5V2Ee+RZ3OTpMZGtYhJf
 qRzw==
X-Gm-Message-State: AOAM530Us8t69uGde7B33WPtCPqO20UBxWW3Lvqtz+j/XeTu3bnzQ8GZ
 eAdQsw1POk7KYlvbPTIn/fSAzaJKOo9m/S0fXB6H
X-Google-Smtp-Source: ABdhPJxgDSnunJuCjFLW5COV4Z15Lqr9IEKN27KtMvQ3VmKeWBDym1vi5nD17t/6IzOuCYIvu0oV6Xx7hgKQ6XSSjSM=
X-Received: by 2002:a02:6a0e:: with SMTP id l14mr44761195jac.58.1608141446997; 
 Wed, 16 Dec 2020 09:57:26 -0800 (PST)
MIME-Version: 1.0
References: <CAEUhbmX1_3FTO4LwSN37p8itHhsLfUHaJF9qauESEx1E3B1UfA@mail.gmail.com>
In-Reply-To: <CAEUhbmX1_3FTO4LwSN37p8itHhsLfUHaJF9qauESEx1E3B1UfA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 16 Dec 2020 09:57:16 -0800
Message-ID: <CAOnJCUL-BxTBfMaECVP6+A-m9YyE_371gBUfhVBbddeJybPjNw@mail.gmail.com>
Subject: Re: OpenSBI fw_dynamic firmware does not boot 32-bit kernel on QEMU
 'virt'
To: Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_125729_796187_E5D53325 
X-CRM114-Status: GOOD (  15.86  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 OpenSBI <opensbi@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 16, 2020 at 1:15 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi,
>
> With latest QEMU HEAD, 32-bit kernel with the following kernel commit
> reverted [1]
>
> 1bd14a66ee5200d6a24419cbd2e0a0fccd4da36f ("RISC-V: Remove any memblock
> representing unusable memory area")
>
> still does not boot on QEMU 'virt'. However explicitly specifying
> -bios to use the fw_jump firmware will allow the kernel to boot.
>
> When QEMU switched OpenSBI from fw_jump to fw_dynamic during the 5.2.0
> development cycle, I remember at that time I tested this on 32-bit
> machine for both 'virt' and 'sifive_u'. See the following commit
> message as it indicated 32-bit testing.
>
> 2cacd8414daf6a0643926392f05fd397ed1e9b66 "hw/riscv: Use pre-built bios
> image of generic platform for virt & sifive_u"
>
> I don't have too much time to do the debugging. I hope someone could
> pick this up and identify where the problem is.
>
> [1] http://lists.infradead.org/pipermail/linux-riscv/2020-December/003925.html
>

Thanks for reporting the issue. I am going to take a look.

> Regards,
> Bin
>
> --
> opensbi mailing list
> opensbi@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
