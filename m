Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F56C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zTwWr7v/P5iKSPyVlVUf3G2d05xnObPR570O1J7ZxEQ=; b=ct0Bs4DQ492uTM
	gQlQmOxdazLJyR3nBndE8JnK9z7orSRs9I8q0zDxxqZFY6umA5+obXskAXpAjtyde7wigMVIIy/Fm
	fhN8dc0Ssz+tgVeaTxN7y19IpgCPJbo1LtP4iXM5zenJF6t9W/DplbZgpvTFQ+7nYQecM3ANH71Ef
	cYk6hC9YnAOV0QB8WhFlJPLQFxbtLGL9Ln9zAjEN7qLVWUaBAppP1mJjSyCiiuuHFcyO3CotiE6PV
	uAloz3uVzsGlDcWx6VLhlkyzj7AO7LlHzxL01dBCw/AujKYZlRd9+eChfQfnkvDNgl7Lcd6/kTETw
	VlOyD+1qCMpsQuQevwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIn1I-0096Uc-LG; Fri, 20 Jan 2023 08:45:08 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIn1F-0096Rn-2a
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 08:45:06 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 6492B5C004D;
	Fri, 20 Jan 2023 03:44:57 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 20 Jan 2023 03:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674204297; x=1674290697; bh=W68AOCJImw
	pHRIs5a7y9itxihlfIc5G9tOU9qztxPJk=; b=FL0xdJUL2TqldXCT56cm6dd0Vt
	7ITJFEVIzAsZtsl5tQsxGvU1+L2jWz5dWiSPJo6DLTc8JyG4pmJjwP4WZQW9JeJz
	5EHe9aub5VvR9cCelmgaCYxncxTQtjeunrsuMUBv08qQkQ7/sKU8MNMXPerdfLAr
	rtAWnAAd3l1RXFx/PGmZsEvrihUqogGKZ/LT5DnVdnygSuFiyIOLAGLs1SkualD/
	68fNEJkgjiJ+jDEeLFQUMYgMVGGXj5Xj45Pu69Jw1UqnFJi+fz0E46pE1XHim8W0
	3i3AcpDjPVthgfmakxT8TYnIYWBxsMOqG3L6gYfudr19dR6dwMZxD5T7G+pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674204297; x=1674290697; bh=W68AOCJImwpHRIs5a7y9itxihlfI
	c5G9tOU9qztxPJk=; b=Peya+Oxg2/fO936cLmbMgxmjzcD/sySyXoKC/lEsipy/
	yWU4370cTd1sEWvL4Da2ZTsbgnTCL/mgilcozbI6iQ3bGf+hWeTtX94uyW+mSPI1
	k99KYzpqyATceG1ksMh8X6v5EZ2RrGrWz385NAfjeP7Kb/O/7fRp0R78Vug6HZFb
	iN0YqBUV58OwVucFtqwiwQLRPYBXZTbSP4E8UqUN3h5hefiEQRAHdZ3WhUOBeXgK
	iEPCbEcwYBuDwhqcDLPFHL3PBoVlwyZo0Rg/EnlVAWMQ36zueXv1eGWCUlAYCIWR
	WeVTiVxsOTW+FSGr9rhPV68D31BTqfede3k4mCi0/g==
X-ME-Sender: <xms:iVTKY5RS8JmTxqOs02ZgTuJOeYFDYFkBz57ngUoasbKI2MpkNkO1Fg>
    <xme:iVTKYyw96jWRKql5brNqAWbpmeYONXS50GPEWj7GEghHU42twLJgzgCsIy1pY1487
    23UA3l4et6DUZEF0hc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduuddguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:iVTKY-3roeu2AsMZvYxRRhBqMWafNi3yQNkOqkzhWcqa40POWZ8PHQ>
    <xmx:iVTKYxDORxcH7hY8STpczFiaXK35DW53bBWNAY729ji0yXVMX_vjSA>
    <xmx:iVTKYyjhuH9z_eSI8hcm4D7oB-dT5G1n-SoW3oirnYIAecbTy9BMKQ>
    <xmx:iVTKY6K59WWYxNS5plN2bA5Km8x6sBWP5Q5T3hcGHGUVHRwvdH-0Eg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 20B83B60086; Fri, 20 Jan 2023 03:44:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <188721e6-eee2-4b1c-85ee-aae7f6a1180f@app.fastmail.com>
In-Reply-To: <20230119193924.21186-1-palmer@rivosinc.com>
References: <20230119193924.21186-1-palmer@rivosinc.com>
Date: Fri, 20 Jan 2023 09:44:36 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Palmer Dabbelt" <palmer@rivosinc.com>,
 "Alistair Francis" <Alistair.Francis@wdc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: uapi: Lie about having futex()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_004505_650473_B57F6BDC 
X-CRM114-Status: GOOD (  15.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 19, 2023, at 20:39, Palmer Dabbelt wrote:
> Without this libstdc++ correctly detects the lack of a futex() syscall
> on rv32 and uses a fallback that doesn't work because it depends on
> 64-bit atomics.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> ---
> I'm not exactly sure why this is triggering now, as it seems like all
> the conditions have been there for a while, but I had to swizzle around
> the toolchain tuples recently due to some glibc build system
> improvements and I suspect it's related.
>
> It looks viable to update libstdc++ to understand futex_time64, but
> given how common SYS_futex is these days I'm guessing some other bits of
> userspace will end up broken as well.   This certainly feels dirty, but
> it's easy.

Aside from what Andreas said, this is just wrong, riscv definitely
does not have a futex syscall and redirecting it to a different
syscall will lead to worse bugs because of mismatched arguments.

One possibility that we had discussed in the past is to actually
add support for a subset of futex() in configurations without
CONFIG_COMPAT_32BIT, which would include all rv32 kernels.

To avoid having to define an ABI with the incompatible 32-bit
timespec, this partial futex call would either have to reject
all commands that take a timeout (FUTEX_WAIT, FUTEX_LOCK_PI,
FUTEX_LOCK_PI2, FUTEX_WAIT_BITSET, FUTEX_WAIT_REQUEUE_PI) or
reject those calls that set a non-NULL timeout pointer.

I'm not convinced that this would actually be better than
what we have today though: right now any application that
tries to use futex_time32 but does not know futex_time64
will fail to build on riscv32.  If we provide a __NR_futex,
then all of these will build, but anything that actually
uses a timeout will receive -ENOSYS or similar and break
at runtime.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
