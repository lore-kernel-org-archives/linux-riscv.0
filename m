Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CA7C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:59:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF9E120840
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:59:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XRFAyjxg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWNlemfB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF9E120840
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DP2UrZPljgM06WsB6XHhIkXLY7CHiC6s9gRXuAFLzfA=; b=XRFAyjxgKesVxC
	29vvtYqU2z2EdIQkwNrT74vKkFBui9/XdOthc8zZghHxv4TlcTXm4l3/HBZEgMelcVyDdU/J0Kzwo
	lYQ/ypDAfT736qhfNxxvAbotAiCQtgAA7X4sTVeY3wXUcOH/CM7MMtV7AoCDaFvm+0XUl1wGaBHSH
	+M9D+ByoPYX8qHGc6IHsPnU1WQqEA7fLFgizm7h6NCOXVAb9qBGfujJZqdw6/lip/5BqNxcUOjwWd
	CD80LcAQBM0xpYuqqNjy/SM/LbTLrQOtD72YElTeskKFeZuHEWOtDmMV1bkLHOzTNn4hXp2Uq8e68
	gGesNnEr0bDn2/FPialQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLXXo-0003JE-Vf; Sat, 10 Nov 2018 17:59:40 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXXm-0003Hx-Ew
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:59:39 +0000
Received: by mail-ed1-x542.google.com with SMTP id n19-v6so4199396edq.11
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 09:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+5HruORnFBVAq2fDRgFgXC5C9i/QLo76jIsYKHbppEY=;
 b=KWNlemfBbRpOI0v4rA0CJT9nM3RIvWtNOMacGHd33doZSu/KkTZwaynKIAMhHvj62U
 N56YYYVrSYuzDaLZv0s9di9DCKcaBH8Rektk3fYzlyElmjGIvfLaYqa4h20lcV7CTO/a
 sty8RuvE26Rb08PjVLjm87E1wfN4H5bxeMmDRMJdd7ceCr+kFiKbpQzuUYrlJ+Qeqxx8
 yedZAh9PoQevI8Ptn1osUkNjz2ivz1mEIWte5N5VFlZTieTIIpTCx0O5/zydw7AW+aE4
 +JznYX2D+1t3zdIUT7PKgygtpPGaknWOfshwKq/hTV0mLytCElzI/KKBC0Ntrcwb9CgI
 R5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+5HruORnFBVAq2fDRgFgXC5C9i/QLo76jIsYKHbppEY=;
 b=B5T6f8gCQ1/5D3rrQLCkodVfN+OmWMoYj4kLPcyY3gz38x/snPMVZDTvNuN1hkYD/0
 kUxTK4Bi7Y4Jjpm/+p61MZhNDKW0cD5j2IWEyzmSJieFsVOitZpBNzk3X8esAPZK/sQD
 Nk6XzNxy6QaMQZH1zFIoBN4MVVMeoOwF6WpgSkE9hzxyaMUrUSnU+Jb2dirmqGeNe8pV
 nHCHT7HnrsydWvYuEJ20VRSSkIYOC6+hLmc1LNuazuDJxZgEDgx4lDVjbx12w6eSyaAc
 ws9cWE/O3Ry2vLzbryXko70V8LGE60yE41jSbPRIHKdOUl3+UPOfT8qAcZESjeCPVDgf
 imRw==
X-Gm-Message-State: AGRZ1gKI8UGyLBxXUu71JU6mKHPI/FOu4OCplY3D3z6sh+Yir7X4S6/Y
 shBwetT10TQ6xnDHkt8s8idUYN4lOrO7ZPV7rqXixg==
X-Google-Smtp-Source: AJdET5deyfm+ftrMl2uGG31ae5k7u8yhib5R3QqWUka73hsnjBbCohmhx794uYpxatOhYBKfEDp1Bue8wnqR6/g7rc0=
X-Received: by 2002:a17:906:828b:: with SMTP id
 h11-v6mr4904566ejx.115.1541872766593; 
 Sat, 10 Nov 2018 09:59:26 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
In-Reply-To: <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
From: ron minnich <rminnich@gmail.com>
Date: Sat, 10 Nov 2018 09:59:15 -0800
Message-ID:
 <CAP6exYLVC==NbX=pTbNZxgZsBPR+8HOooFFQE7pqRaqHRo40_A@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: olof@lixom.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_095938_525126_7A75A787 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, Christoph Hellwig <hch@infradead.org>,
 Damien.LeMoal@wdc.com, Olof Johansson <olof.johansson@gmail.com>,
 alankao@andestech.com, abner.chang@hpe.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, agraf@suse.de, zong@andestech.com,
 atish.patra@wdc.com, sw-dev@groups.riscv.org,
 Paul Walmsley <paul.walmsley@sifive.com>, mick@ics.forth.gr,
 Alistair.Francis@wdc.com, Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110175915.-i_nCCCirHGSLtnzYNMvMpALqPRBTJq2TLkDswIw4Wc@z>

On Sat, Nov 10, 2018 at 9:42 AM Olof Johansson <olof@lixom.net> wrote:

> The case of console is in this case pretty simple: It's intended for
> early boot for very simplistic environments (before the rest of the
> kernel is up, etc). Keeping the SBI console around beyond early boot,
> and somehow trying to optimize for it for those use cases is a
> misdirected effort; that's what native drivers are for.
>
> Having to do fine-grained arbitration of device ownership between
> firmware and kernel at runtime is usually error prone and awkward and
> best to avoid.


Totally agree. OK, so, at least we don't need the "index" in the SBI
call to pick a console, right?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
