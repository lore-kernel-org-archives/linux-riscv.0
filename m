Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E7DC636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 19:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JE/zwsV+xC6xDNjthFu0Q3TcjHglyUpNeY+hXGi6AE=; b=bht1FSS/TlGUGxkyxmYy8PqJju
	OT4kuukMLJ/WnTZXV6a/qRAhqk7JGE8Qnqf/8xnk+/Y2MuHQVCGPYpVw3+BAEMf1hzLj69woBKC9B
	HeXLRRvkxmgq5Jq+eytE5r+gjs+Da2r6P2E9Ht79yJ7pQnwt1lFd0jPKlXrmH21FFSnpwITIZlXtw
	hBdORO4i7F36774k66M4hZZFO+P9i/t8Cuwog9aj1Snv8gGBCqEBwErGQxzDWmrYq+KcFk6VJQ24b
	xbndWmgV2oiGiH0tpH/4AJgPmo27B0dWREz5fjx9llgBe09byz5XWWfLFrOZHJgl+q9esImIVKes+
	TEDInw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRegB-00G2XH-Bc; Mon, 13 Feb 2023 19:39:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pReg7-00G2Wq-R5
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 19:39:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66A9461229;
	Mon, 13 Feb 2023 19:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13594C433EF;
	Mon, 13 Feb 2023 19:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676317194;
	bh=7U2/daF+AgnPDs66w7IXY4Qu5uxyW/TVhVEoE/73qoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sfC8aRTdyVavtXOgVAmMzlY0bVvw4R8LbZhBcDs0xJU73KE0gKyodIJckItN8vZp4
	 ZfbzXWeGQEi1CCtmovSPj72BfxS6ECN46bm/7hhTx1+EVlqcAMTfzqL60derTl6H4W
	 9d1ssryKMU3IpzOxO5Gy773fYxAGg5F3OrUvU28fQEPqaMgWs1EP/YnK8TANynoQRw
	 RdmyGPe5LXRgeSUE2QeGJMW25lD28CtKDvzdZ9yftNilLTDb5PzKXaEe4k+FWGb0Tb
	 Or0WhTZSKuYn+NXpQFNpOclFk+UFTrDal+bI1SFgcdGR21CJGskL6Xs0if5wAuiuyb
	 8Sxynt2YOfoig==
Date: Mon, 13 Feb 2023 19:39:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Falcon <falcon@tinylab.org>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Guo Ren <guoren@kernel.org>, Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [PATCH] RISC-V: Enable dead code elimination
Message-ID: <Y+qSBu3YZH0JPY4I@spud>
References: <20230213173906.214784-1-falcon@tinylab.org>
MIME-Version: 1.0
In-Reply-To: <20230213173906.214784-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_113955_941038_6A71A9D1 
X-CRM114-Status: GOOD (  13.37  )
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
Content-Type: multipart/mixed; boundary="===============1565144860822581202=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1565144860822581202==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FbVydqyGd3pu6OLb"
Content-Disposition: inline


--FbVydqyGd3pu6OLb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2023 at 01:39:06AM +0800, Falcon wrote:
> Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
> the user to enable dead code elimination. In order for this to work,
> ensure that we keep the alternative table by annotating them with KEEP.
>=20
> This boots well on qemu with both rv32_defconfig & rv64 defconfig, but
> it only shrinks their builds by ~1%, a smaller config is thereforce
> customized to test this feature:
>=20
>           | rv32                   | rv64
>   --------|------------------------|---------------------
>    No DCE | 4460684                | 4893488
>       DCE | 3986716                | 4376400
>    Shrink |  473968 (~10.6%)       |  517088 (~10.5%)
>=20
> The config used above only reserves necessary options to boot on qemu
> with serial console, more like the size-critical embedded scenes:
>=20
>   - rv64 config: https://pastebin.com/crz82T0s
>   - rv32 config: rv64 config + 32-bit.config
>=20
> Signed-off-by: Falcon <falcon@tinylab.org>

I feel like I "need" to ask - is Falcon your actual name?

Sorry,
Conor.

--FbVydqyGd3pu6OLb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+qSBgAKCRB4tDGHoIJi
0qRoAP4mBK6Lcfi/Zt71lZaaebWOHSL/6Sk7uJEypEVaURY9CgEA1iQz8aYHSerV
aHH5Smd6ke5ZSO8FZpU4MoN9VhnovQU=
=GVXJ
-----END PGP SIGNATURE-----

--FbVydqyGd3pu6OLb--


--===============1565144860822581202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1565144860822581202==--

