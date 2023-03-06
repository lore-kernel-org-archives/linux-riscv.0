Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2632C6FD1A
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 21:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8Tp6i9/oj3L8G0KqPcH1V4obQVDdtXtzBur/h20vlk=; b=mS0fgU0yxK3bxrUyGYzhmhjwTA
	V/gS/NBKWLWmwcCi0OfKPi90L0Cule/MYmzwiQtRQcrjgyEa6nIynk1t9qzYJUV7PZnNq75CreUyP
	aUSVCdS9tm9uln0UAuBtQrs6hPEhD5Lbh0g22K0Qiq06wJYkJRrA07lGl5uVTf7kJ4ICdAajFDmOo
	BWg8QGs8oDb/GSCp13x0Kc2SE5QXqVOpAFeBIb1x4/NfhJgArcF8DDFdYj1A0+m3Mu5thIudNKi6j
	dktK7nn8ysGtpZxvyClj/yulHbt9Oj1ej+Xhy5T8WHuEGtUMKSyN8i99S4SwaLv6pzdsWteYObkf1
	MTTsa1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZIEA-00F4SQ-5j; Mon, 06 Mar 2023 21:18:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZIE7-00F4Rt-99
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 21:18:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D33B060BB1;
	Mon,  6 Mar 2023 21:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86E3C433D2;
	Mon,  6 Mar 2023 21:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678137514;
	bh=AxsVbuTwD9lcAnQSfFTEOvc+VhNCMa+HpFqJypkBt0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owU5F1dBzl1UY142Ecej4ZNLS+vSVLIEXpquSYfLOKDDfeSoyxtj8WTOQ3IK/uLW+
	 kyCwiewSs2RPsW5StQntBvNpumdvYaOGSolVMZUKApbzQqefTSqATPomdRZ7Ri5rpq
	 pZqTYHUBUCoZIh8us2Ydqc2U8PfssIo4LGqm06JBgJ/OpYFMs4hsob8Dne5NPR8rll
	 kA9D42AUrXNaIwGUAozx3BsYx7NNBj0zMJtFAfG7jPEPCI6J8CtevHL85MVUdDCuRW
	 LtiGA9LiQIwcc6s0LULPb+1OF/YXlQiB2D/zwsoSur35EOy28pmoIkCeU1blqtlS8I
	 ZpNEWbx5ClT8g==
Date: Mon, 6 Mar 2023 21:18:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V3 19/20] RISC-V: Enable ACPI in defconfig
Message-ID: <91cf4ebd-f22c-4cf9-9fb4-fa6349ea00ab@spud>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
 <20230303133647.845095-20-sunilvl@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230303133647.845095-20-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_131835_399413_57A780DA 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============3646693679391296373=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3646693679391296373==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oiK0djp9YUeJc/e1"
Content-Disposition: inline


--oiK0djp9YUeJc/e1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--oiK0djp9YUeJc/e1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAZYpAAKCRB4tDGHoIJi
0gqPAQCEd5ofg+gQPDBDKWon4HPq/76ep5PMObYQ6wu4ecu2tAEAlaiu6jQSgrVT
f8AT4d+fR8d2MHS4Dwh74nQBrfzfRQI=
=55B+
-----END PGP SIGNATURE-----

--oiK0djp9YUeJc/e1--


--===============3646693679391296373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3646693679391296373==--

