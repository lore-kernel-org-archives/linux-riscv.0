Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D66EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wM9BoPPTlXdjhkonkTZ3TY6Rb8edP5BoP8szo1g3hOU=; b=XfCGkU19o7jcgU43sXUPVBxOb2
	1POCSVKkdVm+oH6nrV/OAi48Jsjc3O3juJ+Y+eTqskEiqmwuDAjbd/++pnG6X5ySCD+wJcDq9TWJe
	ICOW0Qbchimkkhohr9ms9rGsAchxT6anDMT57kwyE/U87Sg5B0SdVAWiyaR8DQT2RPmprHCDbFZeT
	S5i9HFzojWbzJHAb3jeJhR0p+KaPZKJ8B5N5pxaqofEvi8ygiGdYnDD4KPGwsbAB4AoPxtQC+GcBR
	05FWTpV8Hl+jm2zYyDz7E74+tdWTGoJQYj5OhfM0G/PowPxxlKUB24kfqm8E9hT+nygATdaIbcn5d
	kDyVg13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdzb-000oU2-3D;
	Wed, 12 Jul 2023 17:51:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdzZ-000oTE-1F
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 17:51:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 89ED56189F;
	Wed, 12 Jul 2023 17:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E858DC433C8;
	Wed, 12 Jul 2023 17:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689184268;
	bh=Cp1aI+fc+P9DejxRV+rOKeNNAXqjZv56Y8hzH777L+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X2ZIYBSWoLBLTyUcJDkxwbMOen1+zJrTeoZFDGz4p/opeqFB17sKE5MZRuDpf9AkS
	 l/HMuBjf9DPow9iS3qAtbDy2HlVCQ1QQ8bYsVsJM1hq7Vxb/0i4Efl4A2rcMXWpD2W
	 IhzG9rmmb+VrHBB2rx90A2jpp2nxKDxAt1xhn2tdndBswHT6Kh8dMlnMm9oRIb0SWI
	 uf+Lei/zvwb1JL5yD+NI99EnUcv9QnqHTh5xp0SKqJQNPtsn+GizlZ0NsLAuJbNB7o
	 NDzTdxJ080QD9lZ+IAiO5vHVieZlD9ZQkTZk34T277rL09EQ0GeABLw3DgJPLMOrpz
	 Jo8uMizkxWHRA==
Date: Wed, 12 Jul 2023 18:51:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>, linux@rivosinc.com,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	devicetree@vger.kernel.org, sorear@fastmail.com,
	Jiatai He <jiatai2021@iscas.ac.cn>
Subject: Re: [PATCH v4 1/4] RISC-V: Add Bitmanip/Scalar Crypto parsing from DT
Message-ID: <20230712-emote-onscreen-c11aa71b00a3@spud>
References: <20230712084134.1648008-1-sameo@rivosinc.com>
 <20230712084134.1648008-2-sameo@rivosinc.com>
 <20230712-bulldozer-affected-199042dc3afd@wendy>
 <CALs-HsuxxVcwX=mSwktPiEiAFkfK+5qJ6zg1Bzf2t37L=pZWjw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-HsuxxVcwX=mSwktPiEiAFkfK+5qJ6zg1Bzf2t37L=pZWjw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_105109_467429_952D4CC1 
X-CRM114-Status: GOOD (  14.33  )
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
Content-Type: multipart/mixed; boundary="===============2422187330143251139=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2422187330143251139==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v3mGsgwTVrXCWkzs"
Content-Disposition: inline


--v3mGsgwTVrXCWkzs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 12, 2023 at 10:43:33AM -0700, Evan Green wrote:

> This looks alright to me. At the risk of getting into bikeshedding

I very much do not think that that is bikeshedding FWIW.

> territory, the only awkward bit of it is it composes the extensions in
> sort of the opposite way you'd expect. I tend to think of Zks as being
> comprised of {zbkb, zbkc, zksed, zksh}, rather than zbkb being a part
> of {zks, zkn, zk}, though both are of course correct. Here's an
> untested version of the other way. You can decide if you like it
> better or worse than what you've got, and I'm fine either way.

I'm happy to do it this way too, just wanna see how it interacts with
the new property stuff. I actually found it confusing to implement the
arrays, it just seemed easier to integrate with the new property stuff
this way.

> Sorry
> gmail mangles it, if you want the patch for real I can get it to you:

Please, reading the line-wrapped mangling hurts my head unfortunately.
Tree or attachment WFM :)

Thanks,
Conor.

--v3mGsgwTVrXCWkzs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK7oBQAKCRB4tDGHoIJi
0mIFAP92dJfa+U4vPOtK6HIzhgoVC2mg0JyOI8zgfJzRRSzV0gEAieics5MVx9MA
WEUAz/SetjYFkBa4tO96h0am7lSlSAc=
=jwFk
-----END PGP SIGNATURE-----

--v3mGsgwTVrXCWkzs--


--===============2422187330143251139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2422187330143251139==--

