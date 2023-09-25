Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80FACE7A8C
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 15:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFD7e/+LIe8ghaG979Q4idFIIKrf1FcHQgjNOxxMg0I=; b=c+8ZzFZ5huSRriYCxBHZ1Rgyn/
	4Woh+4xIuGTZy3Uv29JSDDYEzTNMHthcgP2PpfLajZbyqnlaZ+g8aDm/geTAXFo5T9ue+6hjXxear
	2BYshoRwILJlSXTOuxa2CnabyBnHiT6eC+wDuB/06gTWnjBnX7em3F7loXR5CcwUwgMSGxVlNxlWW
	hOICixxvxKsNXVFCvJZ1bbrev8/WdG6tF8qJM5CMB8VGHolo0PNfwcqUE5EtC+tLT6Koz12MjK6wM
	FB2KPaEdZR4WAIvbaXeOTIg3IGZKEb+4WH/1+L6r01g0QY9WDihYQsWyNFiZIu5v/k3IP85rTRP/x
	VA8JCA5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qknaR-00EYnq-0N;
	Mon, 25 Sep 2023 15:33:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qknaN-00EYn0-36;
	Mon, 25 Sep 2023 15:33:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 322A0CE0FED;
	Mon, 25 Sep 2023 15:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605D0C433C8;
	Mon, 25 Sep 2023 15:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695656000;
	bh=LlQZWb94aVblB834U6IwUKmjry1skklBbOsT2TyvxAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RMqq13vXMBhyLOmi1LtSzfzLW0O7BdcmEjHKNmYJ5V7O+I4jDqD2JmxjirQ4e+3gO
	 2B37U9le9l/3NV2eNlAdKm73O5EAtTRwfHA7Gnlmds3uLutLsjSoeUoOezVv4BSibY
	 +7X9yzr45tNYY8BOWkEwnOXsQk8DAdanHYl7dgjIDmZZnc+rteFd7CAoSuQw9KQbWQ
	 7ElJgyU1paGTIZEXxIRLDW6z7tbXlEJYQpuIyNc5VT4sZKaJJ6KxJeqTyrqgqDbaob
	 DM2YswOxsEloaqRHbvO8n9O4beizW9/FyOIRkeXWSDctfTUFgcP878tilySmEkmXC1
	 hIV7v1AE0uMDQ==
Date: Mon, 25 Sep 2023 16:33:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/9] KVM RISC-V Conditional Operations
Message-ID: <20230925-gorged-boxer-3804735e2d18@spud>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230925133859.1735879-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_083324_242118_8D9369B1 
X-CRM114-Status: GOOD (  13.18  )
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
Content-Type: multipart/mixed; boundary="===============6946262906033044978=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6946262906033044978==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HnRIDq6Cwufm8SDg"
Content-Disposition: inline


--HnRIDq6Cwufm8SDg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 07:08:50PM +0530, Anup Patel wrote:
> This series extends KVM RISC-V to allow Guest/VM discover and use
> conditional operations related ISA extensions (namely XVentanaCondOps
> and Zicond).
>=20
> To try these patches, use KVMTOOL from riscv_zbx_zicntr_smstateen_condops=
_v1
> branch at: https://github.com/avpatel/kvmtool.git
>=20
> These patches are based upon the latest riscv_kvm_queue and can also be
> found in the riscv_kvm_condops_v2 branch at:
> https://github.com/avpatel/linux.git
>=20
> Changes since v1:
>  - Rebased the series on riscv_kvm_queue
>  - Split PATCH1 and PATCH2 of v1 series into two patches
>  - Added separate test configs for XVentanaCondOps and Zicond in PATCH7
>    of v1 series.
>=20
> Anup Patel (9):
>   dt-bindings: riscv: Add XVentanaCondOps extension entry
>   RISC-V: Detect XVentanaCondOps from ISA string
>   dt-bindings: riscv: Add Zicond extension entry
>   RISC-V: Detect Zicond from ISA string

For these 4:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for splitting it out,
Conor.

--HnRIDq6Cwufm8SDg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRGoOwAKCRB4tDGHoIJi
0r9rAP4nMvXYlok1V/XcbaH47Y3D800gwvZ9PgMg5igQpnlnlAEAqMfjnm+TcNSW
Io17cdSsNsEy4YSDZCN+vp62z3laxQM=
=ppj2
-----END PGP SIGNATURE-----

--HnRIDq6Cwufm8SDg--


--===============6946262906033044978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6946262906033044978==--

