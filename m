Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEC6C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Mar 2023 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhpyYWsjF5V5UQD3H2Y+bcK8YF5gX33tLqPiT16rKgs=; b=ekKiNxuaHOY0WcRn0w9u6lWGaU
	cISqM3ifQFcIA7Ge0bBEigt6cuR/GyWjjdkFxlvJvmsx7kj9fAn0lP0puMU/FN6JPUfrs5Zv4Vu17
	dQs0zTzDPbWb5FqaP7R/nLDjNFxNVvhDu6kEj53cKVR2jSHt7FoDCPqZgXrzl1sYIZYQTckNRbmvt
	JiTqIowpWxjacGLil8SzJo5cZAcyjxdBN1zCUfw9K3F3OSvbBTIDutAkl2PjPrIW6yRwCmeiEHRnk
	31swSU/EtZDS4o1Fm1s7PDlokQ7e+Iz5VGtp+3oNL1y1QQdGPaHXlBMqf8EjYvPmHczsZbeymPRsu
	bxOxXnaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pg2WS-006eKZ-0B;
	Sat, 25 Mar 2023 11:57:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pg2WO-006eJo-2h
	for linux-riscv@lists.infradead.org;
	Sat, 25 Mar 2023 11:57:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5C6B9B8075A;
	Sat, 25 Mar 2023 11:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4F9C433EF;
	Sat, 25 Mar 2023 11:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679745438;
	bh=SO6La1Bfj9RCTD1Pb6AjuC2LMQRpiSJIGJOAvIQKZek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GlAdcNwQVVQaacGPFavVd/KFp8a0sMdwyt+fSpMxrmmd5oHAp5ftvsmyU24+e7P7Z
	 0f319zF0lY4r76PkEOwUF0wDszpC1KBVRDcNib5PuFS3htIbAkE/3vxac1XjSff6F7
	 nD5kFxI5aBsx1Z+8TqnCuY2ftpaVsu2lFLtQffhuZYsr82Y4dQOFvkIi5aZ3FH6dbI
	 KZvXNkqo6k+J7mu83D4P4uUfQDSgfuoP0XXSh6Pt+enVk+DojL2FrvXBYByDd3WUAr
	 +23ciwdshyyN2KKVv7fhaiUMov5gDFv+gzWZo3ZrJNKw4s29JKg8mnK7IgBgPsIJOy
	 ngdVCGj6ZrmBA==
Date: Sat, 25 Mar 2023 11:57:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yimin Gu <ustcymgu@gmail.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Waldemar Brodkorb <wbx@openadk.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v3 0/3]  Add RISC-V 32 NOMMU support
Message-ID: <f7df17e4-e05e-4b66-8b53-72b90d13eecf@spud>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_045721_015284_588222C6 
X-CRM114-Status: GOOD (  12.56  )
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
Content-Type: multipart/mixed; boundary="===============4986939203125910343=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4986939203125910343==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EDBkoLcIyrEpbBAz"
Content-Disposition: inline


--EDBkoLcIyrEpbBAz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 28, 2023 at 07:26:54PM -0500, Jesse Taube wrote:
> This patch-set aims to add NOMMU support to RV32.
> Many people want to build simple emulators or HDL
> models of RISC-V this patch makes it possible to
> run linux on them.

> Jesse Taube (1):
>   riscv: configs: Add nommu PHONY defconfig for RV32
> Yimin Gu (1):
>   riscv: Kconfig: Allow RV32 to build with no MMU

For these two:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I'll add an rv32 nommu build to the patchwork CI once this lands I
suppose!

Thanks,
Conor.


--EDBkoLcIyrEpbBAz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZB7hmQAKCRB4tDGHoIJi
0lF/AP0Y0rYosV/eXnRN2ahOEPdVLjpABAgV4zSCmtNkuR6BjQD+O9RhKOyYg0N8
fkPU2E1AIcKWuhjQStoFFCCEgX5hjAc=
=ShSr
-----END PGP SIGNATURE-----

--EDBkoLcIyrEpbBAz--


--===============4986939203125910343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4986939203125910343==--

