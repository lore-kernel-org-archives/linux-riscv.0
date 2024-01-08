Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1A9C3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 09:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/uZtjLl/YB+Pcnum8U/qSeD4F18PVS9XsVxOkEJAk/w=; b=S9x1eBh8YUh2GR
	Pxt0eU6SbNGj14m/E1tCch9rzvzptYpHQKRLLBe4Xf5MleEgQwN+IafqsGzNtIFKZq7ZaZhB68uuz
	LNq7U49U3MO9VBFSFXCLlM4adWxrwjYobIOQJB5a3xwtFdL55lo8oCCs9OZ8xDmFX2IKeVa5arq8b
	7DNTVmo82CMxndvbrv0GKfPUy3C9I3kQsISipXIBsQkm4C/KU1NZlEZyRawR7lEANouLdlwQZHGVH
	pm/QPO3+3DFzHD+RluhxojPQniN7VWeTfOTdIya6TUQQgWVxNidUAx+VZhEE2K54sLX7aeMFx9dvI
	dOxv2GzNkH2grcHhF+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMm47-004Upe-19;
	Mon, 08 Jan 2024 09:37:03 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rMm44-004Uoy-0z;
	Mon, 08 Jan 2024 09:37:00 +0000
Date: Mon, 8 Jan 2024 01:37:00 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org, WANG Xuerui <git@xen0n.name>
Subject: Re: [PATCH v2 07/14] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Message-ID: <ZZvCPMcYq6KBs7ND@infradead.org>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
 <20231228014220.3562640-8-samuel.holland@sifive.com>
 <CAAhV-H5TJPqRcgS6jywWDSNsCvd-PsVacgxgoiF-fJ00ZnS4uA@mail.gmail.com>
 <84389bc3-f2e7-49c5-a820-de60ee00f8a7@sifive.com>
 <CAAhV-H4JxP-j5A7KuNSBncZkHF9i3O1njCtMjVkd3=RNbE5Q7w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhV-H4JxP-j5A7KuNSBncZkHF9i3O1njCtMjVkd3=RNbE5Q7w@mail.gmail.com>
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

On Sun, Jan 07, 2024 at 10:39:07AM +0800, Huacai Chen wrote:
> > Do you mean that LoongArch32 does not support double-precision FP in hardware?
> > At least both of the consumers in this series use double-precision, so my first
> > thought is that LoongArch32 could not select ARCH_HAS_KERNEL_FPU_SUPPORT.
> Then is it possible to introduce CC_FLAGS_SP_FPU and CC_FLAGS_DP_FPU?
> I think there may be some place where SP FP is enough.

Let's defer that until it is actually neeed.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
