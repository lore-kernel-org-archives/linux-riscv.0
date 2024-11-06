Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BE4D44D62
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 13:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QJbt7L2SAkU8I4Cm4qqDO+RsokigRzU54TOwWwaqus=; b=4dY0f0O1wLsRc7egqowWjPKvmq
	/dvtyHJtF09T6Aup3PcYEenKYEc3QCK3yanaHRyRZuKCA7DkDlGHeN4R9THHclgEy4Gz1vdjwxJ0I
	AO/WLH4171vPZpvip+hylf+ZsN5eyoOvMrC3oFwkwWmIVIuM7aTacSUTMqM/4b8G3xXEJ7DZkfQr7
	DXRdFYp34gIhHytY/74cXnYXoAujj95jUimJTgcmyYT/YhIkyoEBWlwrwIC4UpPioNydorUEqcqu5
	4njzjR4QgoEcc9HJXizilrnO4tC7WzWD0WufjzeacPJbYCMIpCRt6dokZNXDdYI8u4NyaIAuU/u7l
	qrKtVe3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gHM-00000003SGr-0aTh;
	Wed, 06 Nov 2024 13:41:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fpk-00000003MhH-2Vd4
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 13:13:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 642285C54E2;
	Wed,  6 Nov 2024 13:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AE1C4CED4;
	Wed,  6 Nov 2024 13:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730898747;
	bh=3SfESvrKfdyPsR2Toa1m1lCX2fQeSf+A2nGffmF11BM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BGmwz3OAHtxzQimhPb+0ta8GU6ekMnC0Nr55rDVo5Z3eBQBSlzx2R0yCIlpqJTOug
	 j2jouZOq2FDue45FB9L57askeLY0wQvdBhk/Gs0RrA+xfuh6r844UNGSxzP1OQXWIs
	 WXhKJLIxD2erc+Tx9VY3wDSHDZY+JfqC87LI5/t4yCyTb2NIa+Jd6NPO6/Ndk+e/sn
	 7wPD0pSWLEOAvVSYTLYShwVsWDCllhThbE4uSdrDpnIealbuz3ZctYPnh6JBIFnxXG
	 77B/lfXugrwKHs9CL6LdpZVWzV+0Ah6f+DmjxZMCmxviBIoCDOqDZRF9mx6ufS7cB3
	 YKiC40WL00LVg==
Date: Wed, 6 Nov 2024 13:12:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, conor.dooley@microchip.com,
	Jason Montleon <jmontleo@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: Re: FAILED: Patch "RISC-V: disallow gcc + rust builds" failed to
 apply to v6.11-stable tree
Message-ID: <20241106-undead-cupbearer-a22f27c8b9e2@spud>
References: <20241106020840.164364-1-sashal@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241106020840.164364-1-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_051228_701627_80960CDB 
X-CRM114-Status: GOOD (  11.09  )
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
Content-Type: multipart/mixed; boundary="===============2228213637622721855=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2228213637622721855==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T7IwLFePnUSWKnbZ"
Content-Disposition: inline


--T7IwLFePnUSWKnbZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 05, 2024 at 09:08:39PM -0500, Sasha Levin wrote:
> The patch below does not apply to the v6.11-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.

I sent 20241106-happily-unknotted-9984b07a414e@spud that should be a
6.11 viable version of this change.

Cheers,
Conor.

--T7IwLFePnUSWKnbZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZytrNwAKCRB4tDGHoIJi
0lrZAQDwZgrJpDCrMBOUflphmluD0ARCIvhYF9shsNzm9sAm5gEA4dQEww2rvB2W
ETWhXsstVjfNvdt4kg8SZh+nFLTwKQc=
=IEMP
-----END PGP SIGNATURE-----

--T7IwLFePnUSWKnbZ--


--===============2228213637622721855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2228213637622721855==--

