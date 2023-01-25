Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD9DC27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 22:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPUTLV3cXbatC8Lgpe5Txg/HC8DIJWaUJQM3nxLJ91k=; b=fndBvaM++ZnYakTXDdnmjMgfaQ
	bES0738lDGiImLaqfwpewtaaeCOk+qWGUbjW5R+iYlHCG2FnpnyZ+br8cMc0RkSHeGE/V1B71/7tS
	hJvmWQA2PbjgEHJQ6jNOobgGPc4MUvKvjApG5QAH4REQFdPoeIvK9csxpIxCtTzJfnebcZPSzrGkm
	kQe1sj8mdOTFcLymUyVH6QGNfVMswgRjKtGmwZB3sv3DDafeuK7K/lGtL67iudpFqgTkU/+M61SVn
	cC2Nnls0ld95W92RQf51o0zAWVd9REA98YzVEMXUVuJOy6NNMASat3XtKPB4saNdIPji/YK9oOtjM
	k0scXM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKo41-008xaK-8S; Wed, 25 Jan 2023 22:16:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKo3y-008xZS-Db; Wed, 25 Jan 2023 22:16:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0247BB81C04;
	Wed, 25 Jan 2023 22:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C4BC433EF;
	Wed, 25 Jan 2023 22:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674684971;
	bh=Z6N8d8ZTWONF4O/xScRH1efnkdWjJXAj1xICW0tJuJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hu7MNMUF4mEYAOAygvXEffVTDuc00rawPat2OhRJj/ZSi77mGstoiuKjufHD5mtci
	 /W3uBwJGhK8TAITzb5MjqW6qEDHuAKa2s1VZ9YGW7F/In/yo7M9Vjlo7R9K0oiuLbn
	 DOjrKGvMhhzpMIMr57XEIzNa62BCH7Hk/AM4kUVefrOI7h8ojZfMEFIW/xQOqrZLHY
	 66aZ7QPYIpjTnMZ+E8DqRY5NBL3pNEHpoxULD+K6MN61WeM98aCZ0x6rmvTCeCux+1
	 CiFqghbZdoViT/QEzJh4vh6oRkcybxwa4bLqUnFdet2CpEjkS2QNHxkpQRCGa3dIrC
	 STnvBVPGXrAFA==
Date: Wed, 25 Jan 2023 22:16:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>, Guo Ren <guoren@kernel.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>
Subject: Re: [PATCH -next v13 03/19] riscv: Add new csr defines related to
 vector extension
Message-ID: <Y9GqJbEduVHWY7aU@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-4-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230125142056.18356-4-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_141614_629639_156EB3FC 
X-CRM114-Status: GOOD (  14.15  )
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
Content-Type: multipart/mixed; boundary="===============0843532479135316853=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0843532479135316853==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BzfGwI70yXrNxc4z"
Content-Disposition: inline


--BzfGwI70yXrNxc4z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2023 at 02:20:40PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> Follow the riscv vector spec to add new csr numbers.
>=20
> [guoren@linux.alibaba.com: first porting for new vector related csr]
> Acked-by: Guo Ren <guoren@kernel.org>
> Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>

This series has gone on for so long, that the tags barely seem to make
sense any more. I won't pretend that I understand why quite so many
people are required to add a few definitions of the spec! Nor can I be
bothered reading 12 revisions on lore to find out why it was done this
way...
They do seem to align with what is in the latest release, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I also noticed that you missed some tags from the v12 submission.
Eg Heiko's here:
https://lore.kernel.org/linux-riscv/2096011.OBFZWjSADL@diego/

There's also one for patch 1:
https://lore.kernel.org/linux-riscv/5335635.Sb9uPGUboI@diego/

Thanks,
Conor.

--BzfGwI70yXrNxc4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9GqJQAKCRB4tDGHoIJi
0u6nAQDkxVRl745rt4A0UQYFUQvp0jh+oAclAwrXlroWD4l6kgD9GwhGmcaLm+w+
xi2BtDkFksMvW7O39e12MmxKbsTlYAE=
=rUIb
-----END PGP SIGNATURE-----

--BzfGwI70yXrNxc4z--


--===============0843532479135316853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0843532479135316853==--

