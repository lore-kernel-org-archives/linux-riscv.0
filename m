Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150B8C5478C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=I/5kPhX/DuVDkn7ahiMZJag2ng7MxKK1CBRg3R+L21o=; b=UYT
	xu3d2rp8lg4EgTjYxECacY3KZKdMIIUMfW7BaV79LlSdGylCmisotq71DF6ArPzDNpViLv1ZSQySs
	VDIwqkeWzYGi8wrf9TdoQBJTdEKV1dtI7yLU/L+Z+JQ3dyeO+DRqv5zi0Q+yPTVSeCr7GnQRWzLCd
	GxFhxNc/VGSTdmxFXT6E/qoz50W74T0DIvexNFeQeGVSrCnY+6fAOawIJhHl012n7y5atkIJWe2hx
	5yJnjjBDm7CBfbLJexGkCzTQjYTdQO8j+iUVF5jm/lENe4HDAyXmSAUY4mwd2XD4q/XOEwFBBb9PZ
	JYRvaNFIaQyX65knfnnHwypxgsCJCkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfMOX-0000000A1Gp-2czW;
	Wed, 28 Feb 2024 16:02:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfMOS-0000000A1DI-3lqg
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 16:02:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B177ECE2249;
	Wed, 28 Feb 2024 16:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CCFDC433C7;
	Wed, 28 Feb 2024 16:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709136170;
	bh=aXJkIAwWj9xpcFU+o9UjZRp43MneGwGTCwdOS5EUX5U=;
	h=Date:From:To:Subject:From;
	b=KljLfg5U2DO6YFFDOUbOirdqz4PUXrlEHfP3TS6yQjh8rjp/eQon7e/QF3rTu7hM7
	 qZQXgdZ6fYjeFEer5bXgps3KYaxx+Rur9dWCU8N49bYEIrt5BCXP3Izy4v3Sol13J6
	 ZGZBD2B5O/+OsYzUZ2HtriAyk5bq4+nYQLjmEpoUB7cydViwZQUyPIQNNng5rtsByk
	 an/FASSjS4GocdvmpWQDUG9sH4+wuEk3njSvGtmBjkwDT5qbTcR1tNw4OEziMjpQdl
	 XMBVZZg2aMWew+SkuYIJp7NqzQv81ut0tBITFHpC4zxu7XGmW5fL+Q6y6FX9NRhp99
	 YwdlAe0f2V4/Q==
Date: Wed, 28 Feb 2024 16:02:47 +0000
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org, andy.chiu@sifive.com
Subject: vector status when vlen doesn't match
Message-ID: <20240228-vicinity-cornstalk-4b8eb5fe5730@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_080254_410655_DC300759 
X-CRM114-Status: GOOD (  17.96  )
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
Content-Type: multipart/mixed; boundary="===============6174985743152637779=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6174985743152637779==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RnGIVzrQ8eCFEwF8"
Content-Disposition: inline


--RnGIVzrQ8eCFEwF8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Yo Andy,

I was wondering if you could clarify something that came up today on
IRC.

When we enable vector we check vlenb and if it doesn't match the kernel
is suppose to not support vector. We do this in a few places, the first
is in riscv_fill_hwcap():

	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
		riscv_v_setup_vsize();
		/*
		 * ISA string in device tree might have 'v' flag, but
		 * CONFIG_RISCV_ISA_V is disabled in kernel.
		 * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is disabled.
		 */
		if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
	}

Why does this riscv_v_setup_vsize() failing have no impact? Because this
is called only once on the boot CPU, right? I feel like it deserves a
comment as to why.

But the main thing I was wondering about was the other time it is called,
in smp_callin():
	if (has_vector()) {
		if (riscv_v_setup_vsize())
			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
	}

If this fails, we clear the HWCAP bit, but I am not immediately grasping
how this affects the rest of the kernel.
has_vector() just checks if the extension is supported by all cores on
the cpu using either an alternative or the extension support bitmap.
There are lots of sites in the kernel that use has_vector() as the
gating check (as far as I can tell), so if vlen does not match between
CPUs should we not be returning an error for has_vector()?

The alternative that has_vector() relies on is patched before the non-boot
CPUs are enabled, so we cannot modify the result once the non-boot CPUs
are in their callin functions and detect a vlen mismatch while at at the
same time using it in smp_calling(), so should this code be changed to
something along the lines of:

	if (riscv_has_extension_unlikely(v)) {
		if (riscv_v_setup_vsize()) {
			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
			riscv_v_vlen_mismatch = true;
		}
	}
and then has_vector() becomes something like
static __always_inline bool has_vector(void)
{
	return riscv_has_extension_unlikely(RISCV_ISA_EXT_v) && unlikely(riscv_v_vlen_mismatch);
}
Probably there's value to be gained in static branches etc here, but I
was just trying to explain what I was getting at. Maybe I am missing
something though? I do remember talking about this back when the vector
patches were still in review.

Thanks,
Conor.

--RnGIVzrQ8eCFEwF8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZd9ZJgAKCRB4tDGHoIJi
0gU7AQCgVakKCnADApb9BiBg63it5wbo0U3nVWTT++H4q9SK5gEAk9+VES+wq6tH
UGCeZ8xeIcCNkhDQch2N/ho71Y9r7AU=
=q7DL
-----END PGP SIGNATURE-----

--RnGIVzrQ8eCFEwF8--


--===============6174985743152637779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6174985743152637779==--

