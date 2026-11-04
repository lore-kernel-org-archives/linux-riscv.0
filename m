Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2059A606A326
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 09:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x0osZMwI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OAf+r0nM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lvcV534Gao1ogrqZwtGMFWQO9QnVILuPOdJugQ8qsJo=; b=x0osZMwIuOcgTRj3LMWxqzMBaR
	BDmMvi6T33U0OIPEf+gxpJ0wn3WusE+7us2iVuDuhRG6cswWZMXlts0RtHzYMejKZXgqePT2Hwc63
	efufWpDb7ueFWudVTfgljt8UyqMp2vUTL/rYpDe+nJvlDkNCfy1J9TuLNOWLoKxtE8NdEHUnxTMEI
	r7ALJ0FonpEkm8sLWd50Qom6etGehUOoYvMBDCaAvK3ZwNnNpnQ3auvhGm/mIbdZFv8kflb6xAcBK
	trLlUFrsxRrozOg10L6ihcl6Xp0W+E+WdBpR7QfIbgumholJPjSFq+GplyNk+uQn80e8ehKCuIJ8E
	AIqcGQGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWwo-00000004pYW-2YCI;
	Wed, 04 Nov 2026 09:06:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWwm-00000004pYQ-3zuE
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 09:06:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F4145600CB;
	Wed,  4 Nov 2026 09:06:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3541B1F000C1;
	Wed,  4 Nov 2026 09:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793783179;
	bh=TL+lpd9Tre0F9K5FTT6m3e9RtyKI/GiJUyTb5HPC2e0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=OAf+r0nM6knPaZzy7i2l3S9Ulid2btsFBPVL8zJPf7pnpRT+28IU4WRY1oYuVtr20
	 i3pNFR3qpETwc1PaZ4bOwR1qkPW0GVhv+WjybdrfswfTqiMG7lB2zIb7AJAODK7/SK
	 ySKZNzlnuyGX8U9HxctuHaayT42ZfDp/RP1gMEZIVJWnV6ozDZB15x6xaCMqOmrO6E
	 yeJi7aMgq6pPaRL9xwqPLTg1vgiW0arxmbX+uihXXKOSHEvMU+XmmDTvj1XYQ/83Ud
	 zkac7NnUuLafRdhCzNqytng+JNdgo0qOrNJzmZY0ZN1aE+Y2CcFWTWa7pZmprOwWHY
	 jm+rT6f4Zu8Lg==
Date: Wed, 4 Nov 2026 02:06:03 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Michael Ellerman <mpe@kernel.org>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: defconfig: Disable COMPAT_BRK
In-Reply-To: <20261029-compat-brk-v1-1-5b2cf86eb453@kernel.org>
Message-ID: <0b81d999-2aa1-83e3-6dce-e419ec5f55ac@kernel.org>
References: <20261029-compat-brk-v1-1-5b2cf86eb453@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026, Michael Ellerman wrote:

> COMPAT_BRK defaults to y, which disables brk (heap) randomisation by
> default (ie. randomize_va_space=1 by default) for compatibility with
> "ancient" binaries, in particular libc5 based binaries.
> 
> libc5 predates RISC-V, so there can't be any libc5 binaries for RISC-V.
> 
> COMPAT_BRK was introduced in 2008, commit 32a932332c8b
> ("brk randomization: introduce CONFIG_COMPAT_BRK"). But even then the
> only non-libc5 binaries mentioned as being broken were ~5 year old
> versions of emacs (see commit c1d171a00294 ("x86: randomize brk")).
> 
> Distro kernels for riscv64 also disable it, including Debian, Fedora,
> openSUSE and Ubuntu. So even if there were riscv binaries out there
> that rely on it, no mainstream distro would support them.
> 
> Most other architectures already disable COMPAT_BRK in their primary
> defconfigs, including arm64, x86_64, powerpc, s390, loongarch and
> sparc64, as do the riscv nommu defconfigs. It is also disabled in
> kernel/configs/hardening.config.
> 
> So disable COMPAT_BRK in the riscv defconfig so that brk is randomised
> by default, matching distro and other arch configs.
> 
> Signed-off-by: Michael Ellerman <mpe@kernel.org>

Thanks, queued for v7.4-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
