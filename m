Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FECC54E60
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 21:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfM9XukODaKzE9ebIA9XqzjhmNT9YT0d3YTTg2uR0+g=; b=jUGz8T2XZN5Ay7vZF4uBXtSzpp
	BopNPg7+bz/BdWpOaO4PtS8jHqj9qehZcoJ8HvgrXzoeRKrK7xEVJ/53lkpsxGvPk2AeAI7WWyTRN
	Ke/Zg4khGiNiNL7k5XndnBgUEoPeL5XNqdGDjnuPSkhXhLISH652YOLszTNRWMbInLR2GZqtecSBC
	+Ins1QouFHxvnmVqfVeX5gm6lhsgjOM63xTovgZ0vrcBr7sYhWW+ZzWxmOOF8gHVMYV/D0S/9/5Ar
	Ax8RRmr60ygnqdcIQ8s3kPlfpZ7n8qQG8ELlrXC1aO9X4sCdsDJqM/k859RrXrMwk67n1ZzHsQCPE
	JMHcz+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rksuW-0000000FlI9-3hNO;
	Thu, 14 Mar 2024 21:46:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rksuT-0000000FlG6-1AFH
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 21:46:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A103C61647;
	Thu, 14 Mar 2024 21:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3266C43394;
	Thu, 14 Mar 2024 21:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710452804;
	bh=/2od1+DS2akp8OKCYAE5pl/cHr9uEBHeLESjE/2dc88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4DLrRARj2zmrrmzBtZx1Am32ATALTBimfIcBHdt8rBy+ZteyZkklbW6rQt4BUSBM
	 qT+9SlGVguYxJSZX0MGlLy/ojp2P8phVeVU5rhKNFpCSQKWulO81Uosk0b12Sh5BHe
	 WmltGWurLBW9XXlbYvEDETl3Cr7ycbj78CB3Q5sJK/1EJHXwvNXusUCwX8w/Or3UAx
	 5GsVAFsThfyef6YLUqMs+xDxN6+HKb7fmRI6tJxAPFk1lexLvKbJ37qFGYKzIxPH5D
	 kpDtS/avjYd7m56x5wekY5WlZMq9b62JYGc1LqSCpL9cQa+0fjAzPUlbRTqxgRTaPc
	 0kftrIUf/Fh5A==
Date: Thu, 14 Mar 2024 21:46:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Eva Kurchatova <nyandarknessgirl@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, bugs@lists.linux.dev,
	linux-i2c@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: Boot hang with SiFive PLIC when routing I2C-HID level-triggered
 interrupts
Message-ID: <20240314-sublevel-jargon-4234df3fa614@spud>
References: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_144645_434345_F196916F 
X-CRM114-Status: GOOD (  38.47  )
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
Content-Type: multipart/mixed; boundary="===============8955054970799215571=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8955054970799215571==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iXQ/4Ga64dEQTg/D"
Content-Disposition: inline


--iXQ/4Ga64dEQTg/D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

I'm not really all that familar with the plic driver itself, so adding
Samuel and Thomas who will (hopefully) understand this better than me.

On Thu, Mar 14, 2024 at 09:12:40AM +0200, Eva Kurchatova wrote:
> If an I2C-HID controller level-triggered IRQ line is routed directly as
> a PLIC IRQ, and we spam input early enough in kernel boot process
> (Somewhere between initializing NET, ALSA subsystems and before
> i2c-hid driver init), then there is a chance of kernel locking up
> completely and not going any further.
>=20
> There are no kernel messages printed with all the IRQ, task hang
> debugging enabled - other than (sometimes) it reports sched RT
> throttling after a few seconds. Basic timer interrupt handling is
> intact - fbdev tty cursor is still blinking.
>=20
> It appears that in such a case the I2C-HID IRQ line is raised; PLIC
> notifies the (single) boot system hart, kernel claims the IRQ and
> immediately completes it by writing to CLAIM/COMPLETE register.
> No access to the I2C controller (OpenCores) or I2C-HID registers
> is made,

This immediately seemed odd to me, but I have no reason to disbelieve
you, given you say this was discovered in RVVM which is an emulator and
you should know whether or not registers are accessed.
The very first action taken by the ocores i2c controller driver when it
gets an interrupt though is to read a register:

	u8 stat =3D oc_getreg(i2c, OCI2C_STATUS);

I would expect that this handler would be called, and therefore you'd
see the register read, had the probe function of that driver run to
completion. I'd also expect that the interrupt would not even be
unmasked if that probe function had failed.
In your case though, you can see that the interrupt is not masked,
since it is being raised and handled repeatedly by the PLIC driver.
Has the i2c controller driver probed in the period of boot that you say
this problem manifests?

> so the HID report is never consumed and IRQ line stays
> raised forever. The kernel endlessly claims & completes IRQs
> without doing any work with the device. It doesn't always end up this
> way; sometimes boot process completes and there are no signs of
> interrupt storm or stuck IRQ processing afterwards.
>=20
> There was a suspicion this has to do with SiFive PLIC being
> not-so-explicit about level triggered interrupts. The research of this
> issue led this way: There is another DT PLIC binding; a THead one,
> and it has a flag `PLIC_QUIRK_EDGE_INTERRUPT` which allows
> to define IRQ source behavior as 2-cells in DT; and has some other
> changes to the logic (more on that below).
> When attempting to mimic a THead PLIC in kernel DT, and rewriting
> all DT interrupt sources to use 2-cell description, the hang ceases to
> happen. Curious as to what are the kernel side implications of this,
> I went to see what `PLIC_QUIRK_EDGE_INTERRUPT` actually does and
> bit-by-bit disabled the actual differences this flag makes in the
> driver logic.
>=20
> This return path in irq-sifive-plic.c@223
> (https://elixir.bootlin.com/linux/latest/source/drivers/irqchip/irq-sifiv=
e-plic.c#L223)
> is only enabled for SiFive PLIC, but not for THead one. Removing
> those 2 lines of code from the driver (whilst keeping the DT binding
> properly reporting a SiFive PLIC) fixes the hang. I am not an expert
> on the PLIC driver to debug further or determine what would be a
> proper fix to this, but this probably gets more experienced devs
> somewhere (I hope).

I'm not really familiar with this code either, but just checking what
the affect of your changes are, AFAICT it just sets the handler to be
handle_fasteoi_irq(), I noticed that that function has some code that
will mask the irq if there's no handler registered for that particular
interrupt:
https://elixir.bootlin.com/linux/latest/source/kernel/irq/chip.c#L710

It seems like in your case there might not be one registered (as the
i2c controller's interrupt handler never performs it's first access),
so I'm wondering if that masking of the interrupt when no action is
registered is what solves the problem for you.

That's mostly just speculation though, because I am not an expert on the
PLIC driver either.

> This is reproducible at least from Linux 6.4.1 to Linux 6.7.9 on RVVM;

I clearly cannot make any definitive statements because I'm just
speculating here after all based on this mail, as there's no logs and I
have not tried to reproduce this, but this does seem like the interrupt
is unmasked before the i2c controller driver has even requested it.
Ordinarily (at least on the hardware I have done any testing of
interrupts on) the interrupts are masked by default and only get
unmasked when there's a user for it in the kernel.

Are interrupts unmasked by default on RVVM?

> Affects any hardware that would have SiFive PLIC + I2C-HID combination;

Have you checked that this actually affects any actual hardware?

Thanks,
Conor.

> Most likely this is reproducible on QEMU as well if it had i2c-hid emulat=
ion,
> or if we passthrough physical I2C-HID device & inject PLIC IRQs from
> it's IRQ line.

--iXQ/4Ga64dEQTg/D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfNwQAAKCRB4tDGHoIJi
0j/gAP49veZAGuKcvAfq0Lh0oFqcH3fKhBfWU9XHTyak9/a5iwD9FrxTiWU0yMSf
xQBVMWw1oap+RZ6q9cZRv422KdRtFAI=
=jDN5
-----END PGP SIGNATURE-----

--iXQ/4Ga64dEQTg/D--


--===============8955054970799215571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8955054970799215571==--

