Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EACC3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 06:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQpuqtaSq3hIipqmz7ji1/Bpi3cn+9FFBiOGPcNnQiE=; b=aY1WpDdgan8sKh
	82AEm+Lq9Fj/W7trzPInzqs2VKYsiJhVxo7lctMlBd8vaFplXI1XX19/fjsuT65uBuhFcZjwy1lbl
	kJZpN+BuM9Um51pBZ3aZocTAgB+XL2K6vG31W2KyJ/ey8Pp9qN7+BQLAkvCACNIk6yahhy5EybhR0
	RsUqMgJxpuYunyluYj9ThfvrDLKptjyTL2O5AjhVyx2HYJl8EELb1LEH0VmUYiBf/lSMQer+BrMsX
	kjRS6+uPdsy2axxQnAwrnYHEIGikwKfd0bM9CzNViJCPog7xAEq8Sq5r3qkeL40+WVPzl/ubXKxw4
	bVfJLScOxvmPT0WLghZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIjkY-00GEC9-3A;
	Thu, 28 Dec 2023 06:20:10 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIjkV-00GEAh-1X;
	Thu, 28 Dec 2023 06:20:08 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id CD2DD68C7B; Thu, 28 Dec 2023 07:20:04 +0100 (CET)
Date: Thu, 28 Dec 2023 07:20:04 +0100
From: Christoph Hellwig <hch@lst.de>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 10/14] riscv: Add support for kernel-mode FPU
Message-ID: <20231228062004.GC12475@lst.de>
References: <20231228014220.3562640-1-samuel.holland@sifive.com> <20231228014220.3562640-11-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231228014220.3562640-11-samuel.holland@sifive.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_222007_654552_FB4C49F1 
X-CRM114-Status: GOOD (  11.58  )
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

On Wed, Dec 27, 2023 at 05:42:00PM -0800, Samuel Holland wrote:
> This is motivated by the amdgpu DRM driver, which needs floating-point
> code to support recent hardware. That code is not performance-critical,
> so only provide a minimal non-preemptible implementation for now.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
