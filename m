Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63646C25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2i/r3L14q5+A9eTqC3pwsVAo4sLHgIjRmigeOBTwH3k=; b=wLue6EdFmiTJ8Y/S73xwKvhRMW
	qGnEK9WVKhLcxvBW0YyOBTUangikgPkJURtEz2ZfOJog97Xo+VPqPXZ+ttQO6Esjkw3QVXn97wAxj
	qgRIGGJvTflnc+csV2MR3hu6U0u/ncaf41DOjIE2YO2dfyCsS4Bkj5nsZLA/+HyuwtEHrbHUhSezO
	dK4AQZn4O0YHOmiX6rI56SL86BIVciXtDCzTeCcsQ/Iq53Yb6d6wzl75MPRAGAcGRfxvvSJzIEriB
	pAR53n4qrztYbV8HpNT8IUiDQX8APMmdVWLRDMrd2vTCu2vOS/CFlM2rL7LxB8ja1BlrzfLrWJov/
	Mul7/uHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBv2e-00000000Mns-3Yd5;
	Tue, 28 May 2024 11:30:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBv2b-00000000Mm4-2upY
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 11:30:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DD16ECE1140;
	Tue, 28 May 2024 11:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B148AC3277B;
	Tue, 28 May 2024 11:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716895851;
	bh=J2mWDdJtos/H4lrmEII8x+5AKEqMgDmRzY9/k9sRI38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fjavsE/HR1q6SqX7BknI3GNgr/s/PsVb+eMfFgjREQ7IvE0102h6PO0ItgahJRsvS
	 O+6Ov04jlmuFGEWdk15DdtKkD0MDC5evcOFELwmk9rGCyTgKmO5GPkD18GW92lNxnK
	 9QIBY/rKZn0Mb+UzXNUTfiNGYBDNA9aiVgQbNG/DGXbpmJv1YnqYz+W1D4KtEhsElc
	 KnYy/XU6bYZAR/GqL9m2fPU8O8IhYbIdWxlTqpcYj2o1w8yGrnWLrmE2O2rTqz6rdv
	 PiGFWRVYtA77wLaxY6fZhp6HX/ePoIWi9p+QC/ATgaI9PUGQNRl1yxVNV2uctFbIli
	 7bhNLMUfB+eJA==
Date: Tue, 28 May 2024 12:30:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 0/2] riscv: dts: starfive: Enable Bluetooth on JH7100
 boards
Message-ID: <20240528-outpost-subduing-2e84f77427a4@spud>
References: <20240508111604.887466-1-emil.renner.berthing@canonical.com>
 <87wmo2nmee.fsf@linux-m68k.org>
 <CAJM55Z-F6N6ua5LoqyMFogDtLp=FaRPoDv4osXFDMjR1b8r9nw@mail.gmail.com>
 <87zfsy102h.fsf@igel.home>
MIME-Version: 1.0
In-Reply-To: <87zfsy102h.fsf@igel.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_043054_110313_06FF93E6 
X-CRM114-Status: GOOD (  15.07  )
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
Content-Type: multipart/mixed; boundary="===============0968358994952388578=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0968358994952388578==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dcH1rd/ToVgelCkf"
Content-Disposition: inline


--dcH1rd/ToVgelCkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Emil,

On Fri, May 10, 2024 at 11:35:34AM +0200, Andreas Schwab wrote:
> On Mai 10 2024, Emil Renner Berthing wrote:
>=20
> > You don't include any information useful for debugging this, but if it =
get's
> > far enough to load the firmware could you at least make sure you run the
> > version below, so that's at least the same.
> >
> > https://github.com/esmil/linux/blob/visionfive/firmware/brcm/BCM43430A1=
=2Ehcd
>=20
> That didn't change anything (and there are no messages related to
> firmware loading from hci_uart).

Looking at things to apply post -rc1, are you still looking into this
issue?

Thanks,
Conor.

>=20
> [  +0.879623] Bluetooth: Core ver 2.22
> [  +0.004843] NET: Registered PF_BLUETOOTH protocol family
> [  +0.008787] Bluetooth: HCI device and connection manager initialized
> [  +0.021944] Bluetooth: HCI socket layer initialized
> [  +0.008488] Bluetooth: L2CAP socket layer initialized
> [  +0.006333] Bluetooth: SCO socket layer initialized
> [  +0.097478] Bluetooth: HCI UART driver ver 2.3
> [  +0.007943] Bluetooth: HCI UART protocol H4 registered
> [  +0.006066] Bluetooth: HCI UART protocol BCSP registered
> [  +0.006962] Bluetooth: HCI UART protocol LL registered
> [  +0.000015] Bluetooth: HCI UART protocol ATH3K registered
> [  +0.000084] Bluetooth: HCI UART protocol Three-wire (H5) registered
> [  +0.000247] Bluetooth: HCI UART protocol Intel registered
> [  +0.000455] Bluetooth: HCI UART protocol Broadcom registered
> [  +0.000084] Bluetooth: HCI UART protocol QCA registered
> [  +0.000008] Bluetooth: HCI UART protocol AG6XX registered
> [  +0.000057] Bluetooth: HCI UART protocol Marvell registered
> [  +0.051854] hci_uart_bcm serial0-0: supply vbat not found, using dummy =
regulator
> [  +0.000387] hci_uart_bcm serial0-0: supply vddio not found, using dummy=
 regulator
> [  +0.094658] hci_uart_bcm serial0-0: No reset resource, using default ba=
ud rate
> [  +0.990297] Bluetooth: hci0: command 0x1001 tx timeout
> [  +0.022893] Bluetooth: hci0: BCM: Reading local version info failed (-1=
10)
> [  +3.306159] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [  +0.013336] Bluetooth: BNEP filters: protocol multicast
> [  +0.124262] Bluetooth: BNEP socket layer initialized
>=20
> --=20
> Andreas Schwab, schwab@linux-m68k.org
> GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
> "And now for something completely different."

--dcH1rd/ToVgelCkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlXAZgAKCRB4tDGHoIJi
0rRYAQCPV3NyOXggUlW5QYTcZrOknlvRNJsQPgvriNuR3R88agD/b1uTRd5yeqxu
DGOC09v8twvgMfBK721fZgjGYgug3wQ=
=k8pT
-----END PGP SIGNATURE-----

--dcH1rd/ToVgelCkf--


--===============0968358994952388578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0968358994952388578==--

