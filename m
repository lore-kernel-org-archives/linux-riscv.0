Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEDDFA3755
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 15:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ai1M+33J2nrRrL8NEZNiO5DDI/TsPuBBo04UQKtJpsI=; b=3cQ+ux1orim0clY4GFBUORfQds
	uMxoLPSHHErEMnK5ArH1f8fgZLO4Vr/BuQivdY+G4uhYduzWS3UCXOIZiVlD78M1PsVpblZ1WtU/T
	KfBBAKPDOgsTARfN3PB1c11qw8KNKxmY4bzG/SmuZ7mweSPpNa41rWTU/3IsgXxCH75H5vlcG3xsK
	VmjFIXTOf6H+ClyLpj78m9eLXueN0yEwH7Ws4YFFvWMcA2u0riQnUTkCvN3N8z14QWR/9/E93KMiO
	mfnB4GDh/BORY3Ij+JYBissBjS3clxvbm8h6jYzI3M1D03W/msqqZGSSYJSnI2JSF/y58JwzzNRSF
	d9qqbidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp8C4-0000000GMRe-0wX6;
	Fri, 13 Sep 2024 15:26:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp8C0-0000000GMQA-3O6p
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 15:26:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 17A55A4519D;
	Fri, 13 Sep 2024 15:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DC8C4CEC0;
	Fri, 13 Sep 2024 15:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726241198;
	bh=ztIFbvcKHrPQ+NfdDu5k6kNg3CZWEYi5RfxBXDsqDZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYIsiGg67ZSEYjI+/JpS8X4W0kcxPK+UzDAXAdG1PyIFs3rv2bEQPuAySqIBGc5Xv
	 p5zQiVmUqbRLyMQhk8u2Bg3NCQSYyiwpzHo8fnQoBM34PTLUJC0Gx6Sy5Z2hzqm9tj
	 iD4M7OLvOn/wM9WR66B/vcjCLdmOKn/onYUTW5yrNFYeNUyw78v6GCFu1EYnoH3aJk
	 te0ADuUj45E/VLOfSrJgqCuQPaiJ7sWZcMKLgMdfWGEqshfI7ZLMuockf6xIq9InNR
	 H5RPCmR5HVOAo9q3mCoBMXa5xfX+NPl4SgRRlDcVr5OcbDKBHSWvotFUKFDpmMof6w
	 To7i5QdUXP0qg==
Date: Fri, 13 Sep 2024 16:26:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v4 15/30] riscv/mm: Implement map_shadow_stack() syscall
Message-ID: <8904b159-7798-454e-a615-34566c088fda@sirena.org.uk>
References: <20240912231650.3740732-1-debug@rivosinc.com>
 <20240912231650.3740732-16-debug@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240912231650.3740732-16-debug@rivosinc.com>
X-Cookie: In space, no one can hear you fart.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_082641_012165_083D27F1 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: quic_zhonhan@quicinc.com, jszhang@kernel.org, zong.li@sifive.com, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, cuiyunhui@bytedance.com, palmer@sifive.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, oleg@redhat.com, linux-mm@kvack.org, guoren@kernel.org, alx@kernel.org, linux-kselftest@vger.kernel.org, hpa@zytor.com, puranjay@kernel.org, linux-riscv@lists.infradead.org, shuah@kernel.org, kees@kernel.org, sorear@fastmail.com, linux-arch@vger.kernel.org, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, zev@bewilderbeest.net, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, dave.hansen@linux.intel.com, mingo@redhat.com, ancientmodern4@gmail.com, libang.li@antgroup.com, samitolvanen@google.com, usama.anjum@collabora.com, greentime.hu@sifive.com, ajones@ventanamicro.com, revest@chromium.org, devicetree@vger.kernel.org, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, costa.shul@redhat.com, paul.walmsley@sifive.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, david@redhat.com, akpm@linux-foundation.org, vbabka@suse.cz, osalvador@suse.de, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, linux-kernel@vger.kernel.org, conor@kernel.org, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, linux-fsdevel@vger.kernel.org, krzk+dt@kernel.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: multipart/mixed; boundary="===============0070127667053392267=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0070127667053392267==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EXdCC84RfjoEE1iq"
Content-Disposition: inline


--EXdCC84RfjoEE1iq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 12, 2024 at 04:16:34PM -0700, Deepak Gupta wrote:

> This patch implements this syscall for riscv. riscv doesn't require token
> to be setup by kernel because user mode can do that by itself. However to
> provide compatibility and portability with other architectues, user mode
> can specify token set flag.

The arm64 series also adds SHADOW_STACK_SET_MARKER for a top of stack
marker, if this is only being done for compatibility it might be good to
pick that up as well.  I don't know what the thoughts are on using them
for RISC-V.  On arm64 the top of stack marker is just all bits 0.

--EXdCC84RfjoEE1iq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbkWZsACgkQJNaLcl1U
h9BxgAf+PzUH92Qd8Gx84qFgdXuCpqKnDddOVzhJ/1HXiYtm3Yst508zBxwr03E0
oP3VhAC469mn8uOctrOJqdGHEFcC2/i3SXoyOMIp2gE+YkhdZxatybrRoCF+oNAT
AW4y0dPMgjW0i9h1kbiw/MjiHQgVoxdgULs0eZOFLl2zr+QVAD6PYLIAh/3y/lzl
e4xv7Bdh51DfKjKr7WwnKYJRGG12WjMxyOjHmy37b09h7THnjSTrg+Y/B7uQ6IpD
xS8TYwFAAn9veTqu5LuGRrKm5zBfJ+xSs78Ee/F/MZ+JgzW4ZpDbmQxuBnk33TRe
bsixBm+3DOUSeFsCCg21dGBeFYR0JQ==
=Y+Cs
-----END PGP SIGNATURE-----

--EXdCC84RfjoEE1iq--


--===============0070127667053392267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0070127667053392267==--

