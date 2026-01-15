Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC29CD4660D
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 19:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+oXfNgN1aL9wIDHDpxBWzy6BNxmwhG0t7lqHPSzakg=; b=RHNqMr8hm/sLd+
	XtLxEpvACpZCkiM5ka1WxGGnF8rKWOM1p90+WrgaoJpyCAIMcE2PUIcHwHXEwyzMY4pmbVDiGjpyJ
	Wsan0x3Tk2oEVJBMHXXI/8fm6jhflOqgHX69w1n5GXC8K3ZB/8NdNaWTmCOmgJahmLtfBL4AGL+My
	Y+vyAjA4rUxNk7GjBIVus50QWcptQp2L8xSmHlzbXvDFNrhSk13QoeFpIVVz+Ze95S+wt9DW+x6rh
	EIEZ4loM/rP9HW4rN9NumB34CP+g5A8/BrcY/6ni/ISLD4gmTqZZz/Z75IFu8wqo+nzEcy4OiJML7
	GDEs7iGrd3bJUkefsG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgScr-0000000D0z7-3kde;
	Thu, 15 Jan 2026 19:03:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgScp-0000000D0ym-0Q6h
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 19:03:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D59C40DDA;
	Thu, 15 Jan 2026 19:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D5FC16AAE;
	Thu, 15 Jan 2026 19:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768503798;
	bh=cAzv/LU+oeabYJ4VWS6ngaY4OY/wwq3rm7xmVI/ASeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PPR/OuglugWWQwVMTspqVz+y+geAyS7upHs5SIem+PhSqI3gKPE5gia8sPilwLAKd
	 UqP8AhA6hgR0nk9MNCNpLNsL0MlBLPPdntAQtg9aZEypc5egPSWkTteW96IUd5lWyM
	 4JmFQ9Iuq8OiSg+36T3KQK0nSmmwk4j0iIngQ4RO2Rr3n23UX8xE84K0vm9dgkP9ES
	 db/Yvc7rAm+WhLPSEUdGvoW5+f09SeonNBlnxscJqj6UFG9icAceYEiU7fzChidSSC
	 YS3O5dxU6cVrGyqMFidzrVI6KIw2PiUnm/P0D6JB/ABERwY9qL306dmygsGQr2hfDo
	 zWOyjQ/mZyTUg==
Date: Thu, 15 Jan 2026 11:03:16 -0800
From: Drew Fustini <fustini@kernel.org>
To: Thomas Gerner <thomas.gerner@muenchen-mail.de>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Linus Walleij <linusw@kernel.org>, linux-riscv@lists.infradead.org
Subject: Re: Typo in pinctrl-th1520.c
Message-ID: <aWk59MT8yWcxiYKr@x1>
References: <029e5e79-ae9c-4d31-b75f-8f48f359d539@muenchen-mail.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <029e5e79-ae9c-4d31-b75f-8f48f359d539@muenchen-mail.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_110319_160523_0F2D4B9C 
X-CRM114-Status: GOOD (  15.58  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 14, 2026 at 04:20:17PM +0100, Thomas Gerner wrote:
> Hello,
> =

> in the pincontrol file for the TH1520 SOC a pad is named wrong. According=
 to
> TH1520 System User Manual, chapter 3.2.1 (page 38) pad 8 in pad group 3 is
> named QSPI0_D3_HOLD. With the wrong name QSPI1_D3_HOLD one cannot select =
the
> right pad in a device tree because the name is not unique.=A0QSPI1_D3_HOL=
D is
> defined in pad group 2. This patch fixes the the pad name.
> =

> diff --git a/drivers/pinctrl/pinctrl-th1520.c
> b/drivers/pinctrl/pinctrl-th1520.c
> index e641bad6728c..83e9c9f77370 100644
> --- a/drivers/pinctrl/pinctrl-th1520.c
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -287,7 +287,7 @@ static const struct pinctrl_pin_desc
> th1520_group3_pins[] =3D {
> =A0 =A0 =A0 =A0 TH1520_PAD(5,=A0 QSPI0_D0_MOSI, QSPI, PWM,=A0 I2S,=A0 GPI=
O, ____, ____,
> 0),
> =A0 =A0 =A0 =A0 TH1520_PAD(6,=A0 QSPI0_D1_MISO, QSPI, PWM,=A0 I2S,=A0 GPI=
O, ____, ____,
> 0),
> =A0 =A0 =A0 =A0 TH1520_PAD(7,=A0 QSPI0_D2_WP,=A0 =A0QSPI, PWM,=A0 I2S,=A0=
 GPIO, ____, ____,
> 0),
> -=A0 =A0 =A0 =A0TH1520_PAD(8,=A0 QSPI1_D3_HOLD, QSPI, ____, I2S,=A0 GPIO,=
 ____, ____,
> 0),
> +=A0 =A0 =A0 =A0TH1520_PAD(8,=A0 QSPI0_D3_HOLD, QSPI, ____, I2S,=A0 GPIO,=
 ____, ____,
> 0),
> =A0 =A0 =A0 =A0 TH1520_PAD(9,=A0 I2C2_SCL,=A0 =A0 =A0 I2C,=A0 UART, ____,=
 GPIO, ____, ____,
> 0),
> =A0 =A0 =A0 =A0 TH1520_PAD(10, I2C2_SDA,=A0 =A0 =A0 I2C,=A0 UART, ____, G=
PIO, ____, ____,
> 0),
> =A0 =A0 =A0 =A0 TH1520_PAD(11, I2C3_SCL,=A0 =A0 =A0 I2C,=A0 ____, ____, G=
PIO, ____, ____,
> 0),
> ---
> =

> Best regards
> Thomas

Hello, thank you catching this and providing a fix. The change looks
correct me, but I believe there is something wrong with the patch.

Did you just paste a diff into an email?

I would suggest using git send-email. KernelNewbies [1] has some good
tips as well as Nick's guide [2].

Thanks,
Drew

[1] https://kernelnewbies.org/FirstKernelPatch
[2] https://nickdesaulniers.github.io/blog/2017/05/16/submitting-your-first=
-patch-to-the-linux-kernel-and-responding-to-feedback/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
