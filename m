Return-Path: <SRS0=g6PI=EJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29938C2D0A3
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 10:01:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 975DE22409
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2020 10:01:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EKYRnO2Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cs/xi2Ep"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 975DE22409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4QajGbcvO43n1gxgHcNNORW783CTVhwRdWuIg2MVMqI=; b=EKYRnO2ZsEcivyKOjxM2UE/tJ
	uHzXfSXRCQAfAhjgEEIbAuA6SPcm7fvl2pm94u/C/8nmP6eK2vIHtWI+VhFgNp1Rxyh4vY8fdWprR
	rgffUGNRgxbPSFjAw7vydAnJHbpRv0mFlKvn+pmo8wYsjMUyzhHsU0ADc1i0JlANGqQ+9BFR2mnol
	uqeRPSB64w3jtI2fJ/a6wUyG5jhw2wZ3zPOAtEYNN8MJBSokf6kpjM0TnJtG67/sbH3rVu6KENlMW
	Coc6852zbDPjKrGzOFmZjNncVVbwK5GlFV7KMiGSqXLHlwI/Jj9KAXVEe+8m7NM61v+ilZj+8rYTP
	srMOD5fNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZt7K-0003Mm-Se; Tue, 03 Nov 2020 10:00:42 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZt7G-0003LS-8D
 for linux-riscv@lists.infradead.org; Tue, 03 Nov 2020 10:00:40 +0000
Received: by mail-yb1-xb42.google.com with SMTP id f6so14362623ybr.0
 for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2020 02:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0pYiU3lXK+jystxaKH+sxvcQtmhQVjgO3tVqUS8438E=;
 b=cs/xi2EpfFHUPI17/QF4ssFf7CdMQ4OqwJt9DLmIWEurK7jAB4a1+4HIfVRbNQlEDx
 II0yHB7R3QB0DVUtRX7CNSzyg5nzwbj5dcZxCLO2usYXGjLTqyD9DVZhrcfp1tfrgwT8
 UD7Zwp9jbSJpUsYsPWQX72aszEQKpr4kYNCf/TXcudNWJBYi3NnIA7sa9oxfjPRMSJzq
 vxsj5U0nVJnEfGBn4mLZZlDoyCTgxevzNuJq3Z1d0avJo681mrcjXuPMd2WXRbI4SI2a
 XQc2pC+TUMXeaSIdIXSs/9rZz5rfQbNOqM4HUFvav3vC2GvB/QZYSaAmjP15dmmMSs3K
 JGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0pYiU3lXK+jystxaKH+sxvcQtmhQVjgO3tVqUS8438E=;
 b=MYjZTub1cBD5pouy+47O35geHzUOovuSrz18DD77MyW8TglLehLrf4/diWRC0mtDzM
 U8HFztys8kYneNcmSnylgFJsz24e3PdpaTAmuFXP/1F/cWPIngXZg/yoecQp3ta8G3p/
 JyNJHPIrtbjIKMjTbpuM/sHezwKpQLJN3gYnZpt4Nk/Xx5CE5fA7vGezk9+7RS0ie8sw
 BIdNHcbQz0sqheAp7hG7JlBoSjcVsDf9jXI1bIxcOsl7QD/hnKSLGY1AjHNCCBiTyScS
 5AH9HwjPVVq5EUNf7TFYNJg29/D2+9uRGqQHkow7Lj5zCzwQnT9Z4G0I25z0Lv8KxqWv
 HIVQ==
X-Gm-Message-State: AOAM533LnLg30sarpte4YdeDwqNPlx4vb+Sctt1+2TUJbme5Ru5Fz4EG
 H1gW1r7mNddVP6SWGpM98kVEVbILRrqMsvB5pBQ=
X-Google-Smtp-Source: ABdhPJzwK5OJBwmkhIfZ55negrHImNV14+iO939LGyydy5v9JU4bBlOnmiVTVesZWmqDN25CD/mCHkqeh0E11CSDDhI=
X-Received: by 2002:a25:328a:: with SMTP id
 y132mr25819789yby.306.1604397636640; 
 Tue, 03 Nov 2020 02:00:36 -0800 (PST)
MIME-Version: 1.0
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-3-atish.patra@wdc.com>
 <CAAhSdy0pW8AFCDtFkEO_4zjg8Exp+XTb09AjhErdX9u-Jw3OuQ@mail.gmail.com>
In-Reply-To: <CAAhSdy0pW8AFCDtFkEO_4zjg8Exp+XTb09AjhErdX9u-Jw3OuQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 3 Nov 2020 18:00:25 +0800
Message-ID: <CAEUhbmUm6EyP33FU1n4LhEk-xcBtR13-xS+Tpt76ug1HQv8CEg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] RISC-V: Initial DTS for Microchip ICICLE board
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_050039_739771_2FAD8A13 
X-CRM114-Status: GOOD (  14.63  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Padmarao Begari <padmarao.begari@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 30, 2020 at 5:08 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Oct 29, 2020 at 4:58 AM Atish Patra <atish.patra@wdc.com> wrote:
> >
> > Add initial DTS for Microchip ICICLE board having only
> > essential devcies (clocks, sdhci, ethernet, serial, etc).
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  arch/riscv/boot/dts/Makefile                  |   1 +
> >  arch/riscv/boot/dts/microchip/Makefile        |   2 +
> >  .../microchip/microchip-icicle-kit-a000.dts   | 313 ++++++++++++++++++
>
> I suggest we split this DTS into two parts:
> 1. SOC (microchip-polarfire.dtsi)
> 2. Board (microchip-icicle-kit-a000.dts)

I also doubt what is the correct board name. I suspect the -a000 comes
from the SiFive board name convention, but does not apply to the
Icicle Kit board.

@Cyril, please confirm.

>
> This will be much cleaner and aligned with what is done
> on other architectures.
>
> >  3 files changed, 316 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/microchip/Makefile
> >  create mode 100644 arch/riscv/boot/dts/microchip/microchip-icicle-kit-a000.dts
> >

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
