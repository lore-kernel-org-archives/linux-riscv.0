Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD92C04EBD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 10:53:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 360F82086E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 10:53:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aPwhgAJW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nm0G0f16"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 360F82086E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ymu/sgmJGzHYOBi9InNS9KjO3VCEQ1Z7xCbLXxI2bQQ=; b=aPwhgAJWpsYNuGQ03we0U2OAh
	XnooWbwW21Cu3bSotO1bHeZaOZoQBr28ASnCaq78G7oCfyWacBCOPtfDRpRkJpKjCyzAz/V09Rtr0
	FvTrVp3XK+9WU6Luptv3c4LwiE+RuayDxRpKcYEO/CzFUpoOUJ3EU9YO/WTpZbC8sVhWfcgmQWEwu
	jLJ3BYA7T4aWlixzdbNfNp4z0hP1jnZyOARiE1AAW4rZ3Bu9/KRXP0aPksorY0xi9HlTgogs0KaAW
	MnWC193OUQt5O71UQdWfml2Z8X8R4FDZ3wqOTZcezFKc1gUUf9gtcJKkbJo1NW3o78TFILvqqEcT4
	l/KQqcF0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCMyY-0004fz-9u; Tue, 16 Oct 2018 10:53:22 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCMwY-0003dZ-0w
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 10:53:18 +0000
Received: by mail-wm1-x341.google.com with SMTP id 143-v6so21787674wmf.1
 for <linux-riscv@lists.infradead.org>; Tue, 16 Oct 2018 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/Z5omMibdhkfH61laQLlscE6KIVTzgE7HJTRMjCKg8k=;
 b=nm0G0f16j7oORkRqKVjHYAzJzp342iG3FTy18UyaYjomYYidEkHOoAiP+1hgsIABXY
 ql5K7JwFXhgN4AZI3RT1jCwowpTpdjq2vx/iOPTk6bXPptVLoHhWdHlvWF1BouAVcXPU
 XyUIv/CvnVFWDPhfQXFDOb/lcxFkliWwfR1bfi7Kkwrf+Bv0v/vSt5hzn7r8tDZtXw2R
 OusEu0wj0lH/Ih9SYs+cW4ngSkj1z9PwYZxeqNm20KHFAvHmBOVJa/6fzieejj5J8Vom
 K3cio/X4082up8p+42sadLX3hq/RCBNK00PbB6jmLmDcWHZkHx0Xaf6niNeUETB1HUiz
 YSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/Z5omMibdhkfH61laQLlscE6KIVTzgE7HJTRMjCKg8k=;
 b=gEG3SvjL8HkPSoeZbKiarnCUlxPaC6KfWq56qGX/mUy3JZAW3cKt2ik//HcTHeMGsB
 MSTQ+pCPCGCsUZghTn/bCHYh6dDrHmsO8+blZVSZWBz948gLMPjQfR1KaTV7cYhaYFcf
 lc9r4jPnrPl7pqvgO2to17C+1g4MPDs17//lOp9Gc2Jv3p4omjZY0YYNZDaWtPUcRgHa
 v4HpH+8l02pd03CzWvyum+wWphbjrhPatn17tUV77yRj+wGI9wPdldiO4SD0hcjoLaS5
 OPyEyyjP6ptGVShmCIyBTWWf/vTsjmEojz9Tt/mOK0e7h9k0/LMyMA/ogRQEivfxwbzy
 H5LA==
X-Gm-Message-State: ABuFfohtEsDCp6GnupPvCLAgstJ+3Wa4LB8XfbhzCn8Rn/wJ7OxkMj6d
 xx7VwwCDXQxkpPzJ9EcDgag=
X-Google-Smtp-Source: ACcGV63h5e4swexgw4tqLtjM9NBNXXBvKOroWwOaU2VBUcgT6oRM36bsK2brTp9RgD43oitvkebPrw==
X-Received: by 2002:a1c:4406:: with SMTP id r6-v6mr17125727wma.4.1539687065393; 
 Tue, 16 Oct 2018 03:51:05 -0700 (PDT)
Received: from localhost (pD9E5106D.dip0.t-ipconnect.de. [217.229.16.109])
 by smtp.gmail.com with ESMTPSA id a84-v6sm8809125wmf.46.2018.10.16.03.51.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Oct 2018 03:51:04 -0700 (PDT)
Date: Tue, 16 Oct 2018 12:51:03 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
Message-ID: <20181016105103.GB8852@ulmo>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
 <20181010135109.GE21134@ulmo>
 <ef19e79a-d975-bde4-1692-65389ead7c15@wdc.com>
MIME-Version: 1.0
In-Reply-To: <ef19e79a-d975-bde4-1692-65389ead7c15@wdc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181016_035118_119626_97653A6B 
X-CRM114-Status: GOOD (  15.73  )
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
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Wesley Terpstra <wesley@sifive.com>, linus.walleij@linaro.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4792420652979391539=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181016105103.IM628ChSedgzor_rpSnoYLoLTXsGmblJhPHgsg15o0o@z>


--===============4792420652979391539==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 15, 2018 at 03:45:46PM -0700, Atish Patra wrote:
> On 10/10/18 6:51 AM, Thierry Reding wrote:
> > On Tue, Oct 09, 2018 at 11:51:22AM -0700, Atish Patra wrote:
> > [...]
> > > +- interrupts: one interrupt per PWM channel (currently unused in the=
 driver)
> >=20
> > This should probably say what the interrupt is used for. And once you
> > have that, remove the comment about it being unused in the driver. DT
> > is OS agnostic, so "driver" is very unspecific and your claim may
> > actually be false.
> >=20
> > Thierry
> >=20
> As per my understanding, they are generated by hardware but no usage of p=
wm
> interrupts as of now.

It might be useful to say when they are generated. Are they generated
once per period? At the beginning or the end of the period? That kind
of thing.

> I am not sure if removing the entire entry is a good idea.
> What would be the best way to represent that information ?
>=20
> May be this ?
>=20
> +-interrupts: one interrupt per PWM channel. No usage in HiFive Unleashed
> SoC.

Why do you think you need to say that they are unused? If the hardware
generates these interrupts, then they are "used". If no driver currently
has a use for them, that's driver specific and doesn't belong in the DT
bindings.

Thierry

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvFwpcACgkQ3SOs138+
s6GQiQ//cUGJvtTzXfrt/nIdB6bUI2UeshHcJ0hyljO7U2HxZlpf8Du+EPvio9qJ
8Y5SiGyZ1McNwiKhIzk1cw4riC8ezQdCpjlvx9EKumzHSsrBm1IFrg8nm9yb8W1a
T918g96hSfN3uiSPJuVqg/uK41kO0ZHuY12Az+a5U0LAdoN5fx9H9eoWOjRzIOG/
lfZ+afy6GIC94imlKbUjYKhYihTRw7+Xvg1XIVcmNVKSCp8Peyrz6/Pvt34796gj
z4Us9bKUw3P2Z7Iqfn4b9LDKj5ap/pxMdwCd77hFx2UXKJlukVJjQbRsVAAxUi3/
2iSNTvT73JT6E6xoOcqKS8tJs91nWtbkHY44sFar9iy/fiqH59JcdV+r7f2EzH5g
2T8bkSGFw1IBW16QrJbWEqPNW45adFFZTju7kAjYdM9NcMGaoNZ1fxLxw0g+aD8Z
tC7zFStY1MOWNFsOHnUckDTaQp5twZvz5+MvQECU+XbKswcovGstIkNgXe+p+tNP
dL2Tl1UlH8LIjzopB/LwQ1Re+fjMlq+L+uuWCdKkzl4OkY6RgXtdm5kfbqIsGh6m
7XPU8OmUkUlMelHt372Tx/cjEaqLaYyBxtyunydIGaTGGdF8W+WMAw729IUMCQAH
9mBkVv4I+N1XvvZwN1d9RNbQmZoTWa/IBHxuAxVQ5VE/UEGUoBQ=
=f7GF
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--


--===============4792420652979391539==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4792420652979391539==--

