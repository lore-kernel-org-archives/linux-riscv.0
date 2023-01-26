Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC98C05027
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 19:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogt7qwPYe53COfmPy8JhhuJqFTqQzQRX4weZUqvkAlg=; b=pUqZhI/vJGalMXvlglvNGECW3N
	ltfkj6SJ0tX8hSX0NTggG9BdQJwCLooMJIK2Xo7VB92o+z/dCbYd+I8Q84N6s1dlMT7xtaB6vbZDg
	GKIdILCa70/hB2hxvQix7lSiAucdgUwsRUSi8Iuly5QJJe6h3AZNIaJZSrzBJXkC9VHiXQ+Gz6vpz
	B3B4cxnaN2h1mjysaJNvPFy7XWbJK43BelbMr0LWqJBEUTDnKHHFmJfj603gHsTFJQRVUJckdV3O5
	28ydsRBXLMonM8+S/7faXzBwVxbljJPw14lNN/Q5Jwp3ealKgt+1V/QYl/xb3rvCUz2G5FS16zkeq
	8UuwxY6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7sD-00CIP5-4c; Thu, 26 Jan 2023 19:25:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7sA-00CIOJ-6H
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 19:25:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 875C960B55;
	Thu, 26 Jan 2023 19:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD99C433EF;
	Thu, 26 Jan 2023 19:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674761120;
	bh=2kKRmpXmW7pSeOdhY3ltZQoZ4ekCXsd1oLHvZRkYUOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dUBy17h0+Y1S6MwZNQhyJ0P1rNelF1hq1VKWF8KFwRQ1T9wrnu5hDFb1Zh0OAvCgZ
	 qMj5/7okFppd2VELvaSzIZ1ULc9rvqTg0Me/DiVGwK0+U1wnKGI9bd8H37FT1IJUjB
	 gJnRfTH574jhbrPAD7xO1vknKlKMh734gbywqlVw69l8BSO/PLWY9h/5yigQt9OaKL
	 z3uc8g+n7ih0YWRgxCibvWwwi0+EPRI7lgOTyJfn4qk3uWsUCEEtevkSlPW4UZJ4RQ
	 qwe1Y9zJgoudBAbSpeoI/ST60u9z/PNg4nh0VjrNfDAmNN84DfmpQlrAxPs/4ywrbJ
	 uraJFgpqn6rOg==
Date: Thu, 26 Jan 2023 19:25:14 +0000
From: Conor Dooley <conor@kernel.org>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
	falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
	atishp@atishpatra.org, mark.rutland@arm.com, ben@decadent.org.uk,
	bjorn@kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH -next V15 0/7] riscv: Add GENERIC_ENTRY support
Message-ID: <Y9LTmmYuEWKNmyl2@spud>
References: <20230126172516.1580058-1-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230126172516.1580058-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_112522_293129_EDAE960A 
X-CRM114-Status: GOOD (  13.19  )
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
Content-Type: multipart/mixed; boundary="===============7445570759234325784=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7445570759234325784==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JjxsvIAoWe1e1dRO"
Content-Disposition: inline


--JjxsvIAoWe1e1dRO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Guo Ren,

On Thu, Jan 26, 2023 at 12:25:09PM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>=20
> The patches convert riscv to use the generic entry infrastructure from
> kernel/entry/*. Some optimization for entry.S with new .macro and merge
> ret_from_kernel_thread into ret_from_fork.
>=20
> The 1,2 are the preparation of generic entry. 3~7 are the main part
> of generic entry.
>=20
> All tested with rv64, rv32, rv64 + 32rootfs, all are passed.
>=20
> You can directly try it with:
> [1] https://github.com/guoren83/linux/tree/generic_entry_v15
>=20
> Any reviews and tests are helpful.
>=20
> v15:
>  - Fixup compile error for !MMU (Thx Conor)
>  - Rebase on riscv for-next (20230127)

nommu build looks fine now, thanks for fixing it up. Hopefully you're
good to now now after 15 versions!

Thanks,
Conor.


--JjxsvIAoWe1e1dRO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9LTmgAKCRB4tDGHoIJi
0lTeAQC/KKw9bBB/ItyFtaPy1LxOnpMqgQ3niF2fYcVRG5bzvgD/VcCyMPuxOMVx
fqcpkVl4ijwDZF+pcTNNu/X3lLDHvQY=
=m20Q
-----END PGP SIGNATURE-----

--JjxsvIAoWe1e1dRO--


--===============7445570759234325784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7445570759234325784==--

