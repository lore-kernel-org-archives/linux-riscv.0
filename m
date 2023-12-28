Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B81C46CD4
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 03:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKQjLOW7Y9nbPdMr0vu6KcC+xFbRr84a1zw6cWzCvtk=; b=luVSpNMTQ0FV7Y
	c2XB1lxWTzh4FgxSkS4r7khoeX4gsNlTksQ3WoEdjc7PS1m794OgVMj5R2aqfInwep4MPHAfFj30n
	zlyL3GBFMWD0AQZ2U7xEmMB+HhWzAjodGZVO86W1cPeM2925iVGImdk74kltYDIFmox5u/VjyvwIn
	FF/VNh8wobvFb91eUlIZbWbw2Vj8KczGhbM38ZOf56qX05mk1xyMW3K6qkfGJyx5wS+/K/18ZCa0O
	TEKuFh0EHcqt/NOFLeYjwTca1AqQrI6kcok6TzX2UMDpKHMJIWGLkqotC3Io4x44ilGgGAfYJHlBt
	9waI0rN51l4jEcIhb6HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIgvb-00G1JP-0e;
	Thu, 28 Dec 2023 03:19:23 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIgvX-00G1Ia-2T;
	Thu, 28 Dec 2023 03:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1703733552;
	bh=EfJurZriD67cDIIwfiSM+kPHFvEVVHjMJmp7iWbFTLU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nfF7UQxSvEFaj4zjVVDZFGc/PuImmuvaZ3mEKMBJyLZm//iqAnLT0yisJQwrCU7S0
	 bVxB5akL39HmDbuq/jT4FGLf0kG7kMimzsxsXVIQl/mVEy6wniHoOa3HjFqSvwg89c
	 FwIVvXQps64q92tRsf80IoYSQySfoqSCVs6siW9OBv42MMkw4ViUAtXCJbfNsKG6jA
	 JedpVqkGyrM26BxsJG65GhzLbngP100uf6zRb8p8DvCR1wTRoUbRUvXTe88wX+1nMn
	 fbLyXQTIPhHG72UC0XCwCWZ6EhuHxg/PdFGez6CnLQRSkY31By3C1FxLqqZHNiIIU8
	 bOMIA4nGmREWg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T0tyk6hCKz4wxx;
	Thu, 28 Dec 2023 14:19:10 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Samuel Holland <samuel.holland@sifive.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 x86@kernel.org, linux-riscv@lists.infradead.org, Christoph Hellwig
 <hch@lst.de>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org, Samuel Holland
 <samuel.holland@sifive.com>
Subject: Re: [PATCH v2 08/14] powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
In-Reply-To: <20231228014220.3562640-9-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
 <20231228014220.3562640-9-samuel.holland@sifive.com>
Date: Thu, 28 Dec 2023 14:19:08 +1100
Message-ID: <87wmszj9oz.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_191920_052481_009D162B 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

Samuel Holland <samuel.holland@sifive.com> writes:
> PowerPC provides an equivalent to the common kernel-mode FPU API, but in
> a different header and using different function names. The PowerPC API
> also requires a non-preemptible context. Add a wrapper header, and
> export the CFLAGS adjustments.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> (no changes since v1)
>
>  arch/powerpc/Kconfig           |  1 +
>  arch/powerpc/Makefile          |  5 ++++-
>  arch/powerpc/include/asm/fpu.h | 28 ++++++++++++++++++++++++++++
>  3 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 arch/powerpc/include/asm/fpu.h

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
