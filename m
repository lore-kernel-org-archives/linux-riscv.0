Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D81C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 20:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2nrNJGUC1CiCndBrH7h1KMI6uGnGzISskfAQ9A/DQ8=; b=hhV6YHZDXY8Qx8NLy6IkajRxBl
	g9sOFlJ34Ly4G9T+IDU3vgPldowO/1JZK96ttYQmqqtxwOySmYZLNKBtNd+GGMZejx6GuBE1srgHx
	QDZSFhFN2dtDVMHnx2ZN3Q97zE+UKPIEWo4u62JR/dQdrsE7odWvcp/jM7M+26zTQ6fNNHdy2SOja
	c2uDCxka1OR3rEpQNKqElAcDxx+Lrns1BtK8CPQM2XBsmXQygGJS1PhJMMQFu/6xNKK4Qi3RpiuSd
	ay/Jw+ydR9ObYTqPg9x4d/2ogEnBIOq9X7iN8ohjon5HiWW6P+xQ/8nD22is+ALPq7Qzd6jeCsxQK
	a2u8mCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxXvY-00000003Z6p-28Lj;
	Thu, 18 Apr 2024 20:00:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxXvV-00000003Z5b-30s7
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 20:00:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69FDD618E6;
	Thu, 18 Apr 2024 20:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6AAFC113CC;
	Thu, 18 Apr 2024 20:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713470408;
	bh=HWefGnwQI2HwNz4Knpy1Fh114LZYu0wgCLBTdlxtmUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eY4rQTR0vB3nF31du2IEDKNwwn+Arhad3fDAJYF8yZ1FJh3Dhu/OomZi51qGz0+xm
	 yra/nkWPz4cFawkghV0gdBKi6ECmIsqrPWj3/SQU3/50UuGZrAWlq2RS2efp5kTKhn
	 sEsyCi98quhg615KvU+4ANrTH8KbscCy6oiuVNXuib7kuD0Id9WX3lNppWvtA90Im5
	 0AKhCGhrvZTB2b9mhHgqt6RU8CbmlUzz8j1iWRciRpAczvqRefIU8Dz3FAeIcL/OOI
	 zD8tMN5uEBWYh68fDMPlqOQL0e7l0KYx5v22crgl35DzYqXvHmF+v+qdFjxzsYhJvr
	 6SFqrgLNKRXPw==
Date: Thu, 18 Apr 2024 21:00:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Guo Ren <guoren@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Joel Granados <j.granados@samsung.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: Re: [PATCH v4 7/9] riscv: vector: adjust minimum Vector requirement
 to ZVE32X
Message-ID: <20240418-dolphin-epileptic-749c9628e5a9@spud>
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com>
 <20240412-zve-detection-v4-7-e0c45bb6b253@sifive.com>
 <20240418-brook-chili-4d3e61d1a55c@wendy>
 <20240418155256.GA2410@sol.localdomain>
 <20240418-ultimatum-yam-11de4b063b83@spud>
 <20240418173203.GA1081@sol.localdomain>
 <20240418173946.GB1081@sol.localdomain>
 <20240418-sterling-sanding-d59c3b0a2aaa@spud>
 <20240418184129.GA1071@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20240418184129.GA1071@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_130009_841387_EE2883A6 
X-CRM114-Status: GOOD (  12.81  )
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
Content-Type: multipart/mixed; boundary="===============7295067843995009870=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7295067843995009870==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MEYWdzN/KoxvaYBs"
Content-Disposition: inline


--MEYWdzN/KoxvaYBs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 11:41:29AM -0700, Eric Biggers wrote:

> If the RISC-V kernel ever disables V, then it should also disable everyth=
ing
> that depends on V.
>=20
> This would be similar to how on x86, if the kernel decides to disable AVX=
 to
> mitigate the Gather Data Sampling vulnerability, it also disables AVX2, A=
VX512,
> VAES, VPCLMULQDQ, etc.  See cpuid_deps[] in arch/x86/kernel/cpu/cpuid-dep=
s.c.
>=20
> Sometimes CPU features depend on other ones.  That's just the way things =
work.

=F0=9F=A4=A8

> Whenever possible that should be handled centrally, not pushed down to ev=
ery
> user both in-kernel and userspace.

FWIW, anything detected but rejected while probing the DT or ACPI tables
will cause riscv_isa_extension_available() (or other APIs) to return false.


--MEYWdzN/KoxvaYBs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiF7wQAKCRB4tDGHoIJi
0lrQAP0ZnhY2j8dAgcGtM2slb23/HOfAFrbbsZhuBfSx0uoWSAEAubVPWlDs59pJ
eFvw6AB3RzfrfggfMB1wA9nLHCZYzQs=
=Ogch
-----END PGP SIGNATURE-----

--MEYWdzN/KoxvaYBs--


--===============7295067843995009870==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7295067843995009870==--

