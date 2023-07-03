Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFAEC001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 16:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDv3ijnNlmWHx03621R9bWkYuQ8KUx0fUEMEy5U6CWA=; b=gZnqAIJ2N8r/lF7dnp/SXjNTQL
	jC7ehMIbsWJvkczsebAIPKVzbRqIqzmHWp4bKB9IqFxVltxMxXmGObO/qKa4WpmoTCyzywvjnHWS+
	MVqCS5eExzpbL+iNhTHcoUlClap04936ptoXSVBobXTKNP1Mye+smLZzvJirlhubK4E+C5X85n5TA
	YCm620DsV9djzQReV00hAOnSCUNShgvDo3AEU609F46ZAkUrRyvVWWcdjfjOL4cTeTQfTCsLnO7xD
	6AXqvm+ure8VoIklPpfAKGA8fk4GkFvjxo4itppC66fb10MCWcV/hugWV1XT3FQ5sHxICDSmh/6wS
	dyY1KPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGMG7-00AyIz-1d;
	Mon, 03 Jul 2023 16:18:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGMG4-00AyI3-1F
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 16:18:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D43A460F6F;
	Mon,  3 Jul 2023 16:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B815C433C8;
	Mon,  3 Jul 2023 16:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688401115;
	bh=4LhULQvBv3u4TCWPmGK8mdbqMghJy+yfsY9e+Vry9r4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pD65x7xEqcsiKaRYzuibCnVI2RU/JWnnAlXfqoiFXtZXXcUVq16PIE5wAx5iJBPHj
	 0dolgSwU29ZLQokGMwlIZ1+ltwiebNOhLPmsuP4yGk2QMRQbZ7K7QJVDxg2GWeQLFp
	 VukerBXPlmiMTHHXXOFIt2+4DGI2p65lyIoHyg1Y1es0GYH+HDgjfzr3o44NYZSvIs
	 N3//X+9Ce1i4LRPEyERVeKfHjNvlj25PiyzZqdegD7uA90QEaPQZDXlR/DeP5Vk0cK
	 gW+Nk7kG8Rpk/BeITJO/ODJSZ4EQHJogvmb/Atr/wcev/99Qi1xwNUgrW3CLUsd3AA
	 u6tgoVtgqr9DQ==
Date: Mon, 3 Jul 2023 17:18:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 06/11] RISC-V: add missing single letter extension
 definitions
Message-ID: <20230703-gusto-stout-c5b8bd537885@spud>
References: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
 <20230703-unlocking-straining-5c814e99642b@wendy>
MIME-Version: 1.0
In-Reply-To: <20230703-unlocking-straining-5c814e99642b@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_091836_470111_86DBD5D1 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Evan Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============7769687346528808705=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7769687346528808705==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tNKCvW7BqQMvbnRb"
Content-Disposition: inline


--tNKCvW7BqQMvbnRb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 11:27:58AM +0100, Conor Dooley wrote:
> To facilitate adding single letter extensions to riscv_isa_ext, add
> definitions for the extensions present in base_riscv_exts that do not
> already have them.
>=20
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

=46rom v2 that I forgot:
Reviewed-by: Evan Green <evan@rivosinc.com>
https://lore.kernel.org/all/CALs-Hstveza+RF0EP2XArXv1Xy5jQWv1VxjsgFbFZDn_9M=
03fA@mail.gmail.com/

--tNKCvW7BqQMvbnRb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKL01gAKCRB4tDGHoIJi
0trlAPwMGJBMxUzESKutNZVGGuYbypLVcToW2OIneFcfCB67RwD6Ag1NrRn8cYUv
9H8ePHqMBaHQ11sajyfC15+udAfC+wE=
=9hWq
-----END PGP SIGNATURE-----

--tNKCvW7BqQMvbnRb--


--===============7769687346528808705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7769687346528808705==--

