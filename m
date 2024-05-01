Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93355C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 09:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78anHwPH7ATyXEpINeDi7UFH4HjZM3bbwTUN48NlPvE=; b=Kl+FuZhpShR8+8dGfaHp369Qwk
	BUuvQco55aw0xUA4ebWj8SRWm856h9s6PtQ3eD/U3XGP6/ZvHSYX2eREDOIfItRK6yiSnVcm29yHn
	tvo96fJ0fdZUaiM5HBorWuNUZ2nrzwmHDWp5Di3HXfZCkL6RTKv/MhlGRZGbZEbzp5po72G5eO3Ns
	HakRYYwL/w6o0RW9EsCP79DrcQhGVhUxh4Acym6/jfLhzRcSp3NYCdBCLDsYdYmRitXx3yVSDGysO
	mRBQj8AHZ7/i1+7n0F5AdXTyR7C7vpWz6BEaoEpWDduZW2ftj3qG/j1+pibNyPn260syGuyT250Ij
	QfHJ4Xrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s26IQ-00000008z1i-3dTo;
	Wed, 01 May 2024 09:30:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s26IO-00000008z1I-3fsZ
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 May 2024 09:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VKb2Qv4Q48BFrbkgCtOU+TMtJVAe3nV1glvc9i3axIk=; b=U853Z1AEVszfYy9k9XiCJKSTkY
	/f4cDnm6/+hrAMvbCEnXuC+lC0ljjCfGVct7nT+HfdP1bNLpdu2ne9sMxmqU4EGTHGYbnVjQpt8VQ
	Rs2T/WVxK4ZsMvvCJMXeLeH+fInU+ZmHahLQhxp6QNml++/Ya2wr1KuVzJ0BPdxDGVLnjHU266jZi
	cc+8T156smqhCZtP6c+Cv/40Bvi+CKwBDuMdZbpkdyyfko24jNZDL0/90dHVJ89Vxn1gUWMWxM4VF
	5aK8BdK10TiMylUa/PO9i/qj8zMFqDLhe2SvP6+frTxQwp4MHYiRqfe2oUPWBLVrrESi+yllV/GfD
	AMP3ppOw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s26IH-0000000HKBd-2G9x
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 09:30:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 13435619B6;
	Wed,  1 May 2024 09:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75548C113CC;
	Wed,  1 May 2024 09:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714555810;
	bh=VKb2Qv4Q48BFrbkgCtOU+TMtJVAe3nV1glvc9i3axIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uXiZGDT68FNRdgJJs8fQk/wLVPy+9rj+Vple1CDy4aaCAVWDW87ayl5ZHIqmrkSiZ
	 6cd7vIpAbsfRShV61HV5CLeHJM7oqPnlIjz2MnLgMt5V4tWCFlwcqyh91EBc9BwuQV
	 ctStwncTyY+1u0Ec+2T0VwMVn7XifXUyFm5Aj+WcwmhcF0c5sTOQyh9VXelBGfRdKI
	 c+LipyiB5/TL0O+omtfQixm0FEIDLYCEDiQY2CPnowg0kP934YsllnkjPIs22MJMoi
	 U69rn8xUzHUdbIrw7T0UFmAHVAzZO5kjJ4cwB1uv0rnzISIySVOKmyrK10gjs70On3
	 yB4T49c5+rsww==
Date: Wed, 1 May 2024 10:30:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: iommu: riscv: Add bindings for
 RISC-V IOMMU
Message-ID: <20240501-glare-occupier-2aee6a0aab06@spud>
References: <cover.1714494653.git.tjeznach@rivosinc.com>
 <ef946892252b18f541986a461fc4d37957cc805e.1714494653.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <ef946892252b18f541986a461fc4d37957cc805e.1714494653.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_103030_244145_2CA7CDB1 
X-CRM114-Status: UNSURE (   9.03  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4270955924898677518=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4270955924898677518==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/Z5SiWKVwvbIGEtZ"
Content-Disposition: inline


--/Z5SiWKVwvbIGEtZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 01:01:51PM -0700, Tomasz Jeznach wrote:
> Add bindings for the RISC-V IOMMU device drivers.
>=20
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--/Z5SiWKVwvbIGEtZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjILnAAKCRB4tDGHoIJi
0oaeAQDoRn7fJYpDDfUn0qu2MHETNws6s/wADmGEMh9cFwVRSwD/XtiAqhDnwD1g
YDrbG5pZWpjKXqM3zLJ9OKiDXJqO7QE=
=3DCc
-----END PGP SIGNATURE-----

--/Z5SiWKVwvbIGEtZ--


--===============4270955924898677518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4270955924898677518==--

