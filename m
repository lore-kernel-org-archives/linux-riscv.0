Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D78EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 22:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWuYO3V+7S/3G4X2UCdhtmra03abksQToSoF5XBSBZI=; b=DXfUG/pLCZOYPS5bohh79kXACa
	94CWdUp/wA66f7Zc3DO317VGh4DPo+WPOxTeYGGGWrKEB00nM+xgx1mne/CWUJPiUjgFDKUvHYNDl
	DShIX7/kIXgzt02C+ve+EdGaatV220rCI4q1Si+SG736NAb7y39HJ7ztbUQA9ohF9hSp9+IDzv8zF
	9i9+v9FPwE+npZ/9w5WbXbZgeODjDpfRnnXxy7jN0p8E2U8Y/fqQZzuFnd48G2Z7lVwZHsaKu4UNo
	liCrm25lYgigIkQQnk0kroJurtV74w31h7OixQ0ZSbZ2OJGyTMQfjNVCoRJjF9K9HOfaL5feJPHoG
	9T5v3t3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBkDY-00CWT1-1t;
	Tue, 20 Jun 2023 22:52:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBkDW-00CWSQ-0a
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 22:52:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1E59160EB7;
	Tue, 20 Jun 2023 22:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4EBC433C0;
	Tue, 20 Jun 2023 22:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687301572;
	bh=J3EgEpt+Xo4EHMGQ9rhqqELAOOLQCNRzgg8Uw4ATbsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kk0IVbQCO1hQAYvvcGZOX/qt/Ut3MYFzLr4WYYWwH0rHw5gkHtq/I8YlFvjXLk8ff
	 7HAS0qSNdDVRq8kNnYBmPzqgp8b8vHD0ZQywmMh8Tup/neufSHq3NoYz8+36uOpd7f
	 +LgolFNRpXxW6zr/JqjQaCjuJTy/KtDc1w6FX3eedfZjWWv1Kow4F/UaIDz+3f+U1w
	 RwLbZFv6FseqNWOZgYCemsbP8TgECCJngAepp76Y5kLzCtmfhkFyu9kEc9N3Tpi3hV
	 JQModJag9LexqiMOHXHVWe1eLC+u5aW40y1cjaB9mp977ZLI6WsJDUHnynPEdAc/ug
	 eDdA249kPhXfQ==
Date: Tue, 20 Jun 2023 23:52:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, arnd@arndb.de
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
Message-ID: <20230620-catcher-jaybird-945d26a4f642@spud>
References: <20230617161529.2092-1-jszhang@kernel.org>
 <20230617-duress-phantom-3da79e33f204@spud>
 <ZI8wEp52bpqaCHAl@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZI8wEp52bpqaCHAl@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_155254_278258_94E17B09 
X-CRM114-Status: GOOD (  14.70  )
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
Content-Type: multipart/mixed; boundary="===============4382877312227414781=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4382877312227414781==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2oHa4guy7ghistNk"
Content-Disposition: inline


--2oHa4guy7ghistNk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 12:25:54AM +0800, Jisheng Zhang wrote:
> On Sat, Jun 17, 2023 at 07:20:43PM +0100, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>

> > I'll send it to Arnd as a "RISC-V Devicetrees for v6.5 Part 2" once it
> > has been in linux-next for a day or two.
>=20
> Thank you so much for helping the PR this time.

Just FYI, since I think only I get the notif emails, Arnd has merged it:
https://git.kernel.org/soc/soc/c/c9a5aa0e53d0

Cheers,
Conor.

--2oHa4guy7ghistNk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJItvgAKCRB4tDGHoIJi
0q5oAQD0U2WdmDEwFxLUHGeOYdSuiPCZnmm81xEa3Njmye//qQD/QZh5UdvnVUp5
Yw1KIPNM2IkrNs5apM9qSmiwTzQSfgs=
=BlB5
-----END PGP SIGNATURE-----

--2oHa4guy7ghistNk--


--===============4382877312227414781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4382877312227414781==--

