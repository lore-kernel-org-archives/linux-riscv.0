Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53A8606A319
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 12:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HJltQDu7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YCAzED+Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5FZyo5ZWTE4d/3D/Vw+Fws8ouhvYb+k/Z6fzpsHtUZQ=; b=HJltQDu7aHje8m
	x+KTBvghCJdwt7LD+/D889sDKZf9vlJKCjREq+/Bzk5Iu9tgIhBsBI9ucZOjB4x5Tfw+JSRRMfsgL
	A/JIxCZQkCq55V9GtqQXc2s0xda/w4bCKSBoI1qlGk4OXFaWBbhAm7doardeNhmB5Q6y9M4mT/Iwp
	UlYIZCusmHMr06tlfpQnNOSS6BbihBFD1O4/Ns8BRJK2sERdB4n+IuKMbzxA8X7+W0F10Nn1lYyVU
	lY7b/ajzxnYkWADG0BlqjTPb1dRk19lyEftbfqJwS2AIAnYO0DSwV9vEKkA4HTYrzeKW8I30DJuT6
	kwIdYEHxd00lwH24zLxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8sx-00000009emn-0vO2;
	Tue, 20 Oct 2026 12:24:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8sw-00000009emf-0Nxk
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 12:24:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AFD160229;
	Tue, 20 Oct 2026 12:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A8D1F000C4;
	Tue, 20 Oct 2026 12:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792499044;
	bh=UUPw/s33/7GOIQXj56pVmCo2a1JAObu2BXLVvpm4deY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YCAzED+YqRPe1/kSa35GjlylVG3/cwoP1T7uaDE39aVVXhql4QawqFiVCEijLg/H8
	 lK2s96/1Ybe/VGvrtZPF0tTfULELTjfs+4xNWh/s63oD1w02ofDubBWj58lE3OiU51
	 WyEug0sbodsSc0EGlKc62224Mo33Wk1TyERdERT52Q2KCDLZWFPeLhqogiIyr7BTND
	 IGRkJIYUmzftfKl+zjGGy9CTTxrNnz/sjXmId0GvxUT94mPb+mbuIUU3QFR228icLd
	 cwmajM0AF44Vt7nprvTNUq0AF/SSoUKUmDSQBSsJK/OpM5sXQxw3nDAnnRinvpNcW1
	 BvkAesbHFVg7Q==
Date: Tue, 20 Oct 2026 13:24:00 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Chen Pei <cp0613@linux.alibaba.com>, pjw@kernel.org, palmer@dabbelt.com,
	Sudeep Holla <sudeep.holla@kernel.org>, aou@eecs.berkeley.edu,
	alex@ghiti.fr, conor.dooley@microchip.com, atishp@rivosinc.com,
	guoren@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Populate boot CPU topology on UP kernels
Message-ID: <20261020-frisky-jovial-echidna-2d003c@sudeepholla>
References: <20261012131034.1026-1-cp0613@linux.alibaba.com>
 <20261020-unsent-commuting-91739a882031@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020-unsent-commuting-91739a882031@spud>
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 11:23:34AM +0100, Conor Dooley wrote:
> On Mon, Oct 12, 2026 at 09:10:33PM +0800, Chen Pei wrote:
> > RISC-V selects GENERIC_ARCH_TOPOLOGY unconditionally, so the topology
> > cpumask accessors resolve into cpu_topology[]. The RISC-V calls to
> > init_cpu_topology() and store_cpu_topology() are in smpboot.c, which is
> > only built with CONFIG_SMP. On UP kernels, cpu_topology[] remains
> > zero-initialized and its sibling masks are empty.
> 
> I'm curious about arm64 since they've got the same as us as far as I
> know. Is the same issue there or are they solving it in a different way?
> 

Commit 4b3dc9679cf7 ("arm64: force CONFIG_SMP=y and remove redundant #ifdefs")
removed UP support and made SMP default enabled.

-- 
Regards,
Sudeep

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
