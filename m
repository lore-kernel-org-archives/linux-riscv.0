Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAECC4451B
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 00:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bk13Kvcx3gBaGKS+PA0rY9AWQDKL9Xtni3ZrNPUAWV8=; b=1UlSH64XFB7OAf
	6RC/pniQJu3KrA3Nd0ESsEHLmNGVrMd0zmY+1LHrKJlbYEpiQs3uBZ7FpNLiIjVPBTB0Meql5+59W
	wCtkArMqQMfgBY2OXH8LXf9Rt0NwsWgD3x2/NU57lOJYllcObwf+46sZN1MOkrwdfiaTM2qYYDw+O
	oWwpld4LcJhGTXSd877yfICTKcDbMMoBh7brOlAEdTJcqyx8hF5lr4k+7ffBQGiBTQtni3dbEDwSY
	vTxnSk3QkM3PFKw+HdjKBYh580+MuVaQlmzIu6ihyBYtm3hLErm5y3uUhBFXB0KWwkl6geXDWh8Ad
	dCKluUtXErupruxhPWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlcI4-00000005ZCb-0Y7u;
	Mon, 20 Jul 2026 00:55:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlcI3-00000005ZCV-0FWn
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 00:55:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DDBE642E0C;
	Mon, 20 Jul 2026 00:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB59D1F000E9;
	Mon, 20 Jul 2026 00:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784508924;
	bh=6FORciyG6Vd4Eh6Cevu68EC2EKSfE2RGPv8J07wCaTA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=e/hsmzbibPlGivlD9v+Mn7imFbMKMaa3xGlB/qZpnnbnoMPul+Dlu7jSG6MkT4G7y
	 YFXVNsJwE6/VTCRupTJjJDXFvyHDyjOyzoLZ3I1iN9w1YG3ASPrApbgT5URN6rC5fA
	 5Jn3hy/dliwZkv3ZqhWtlAryrQUOBMAwAeuFlPf4xh33lcTmUfcScw0AbnlYJNco4P
	 zp49SfMXAnIqgv58DC5W8vjOPtAHpUO++dD566Q4okE22aA3+PyEDx0mU/bOPRkVfT
	 zKo1DZ8rVWp0jKQWaKdp1DTPW1uRxlG/t3Ax6zura7HmtqdSAPcp0AE99wqC0tmOfX
	 8qDglgVXBjb+w==
Date: Sun, 19 Jul 2026 18:55:19 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
    Troy Mitchell <troy.mitchell@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    spacemit@lists.linux.dev
Subject: Re: [PATCH v2] riscv: mm: fix SWIOTLB initialization for systems
 with DRAM above 4GB
In-Reply-To: <k55h7j5qnn3dryqro2oof7kgjcdhyoarvg7uvtm6sbrgdtnfzy@br6areeqp4ng>
Message-ID: <57a24fb1-1ca6-3bb5-1c1e-bdcb50ce2b7e@kernel.org>
References: <20260429-fix-riscv-swiotlb-v2-1-fa99dfdfc94d@linux.dev> <k55h7j5qnn3dryqro2oof7kgjcdhyoarvg7uvtm6sbrgdtnfzy@br6areeqp4ng>
MIME-Version: 1.0
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

Hi Troy, Anirudh,

a few questions - 

On Tue, 14 Jul 2026, Anirudh Srinivasan wrote:

> On Wed, Apr 29, 2026 at 07:41:54PM +0800, Troy Mitchell wrote:
> > On RISC-V platforms where the entire physical memory (DRAM) resides
> > above the 32-bit address space (i.e., above dma32_phys_limit), the
> > current SWIOTLB initialization logic fails.

Is this primarily for the SpacemiT K3?  Or are there other 
platforms that this fixes?

> > This patch addresses two interconnected issues on such platforms:
> > 
> > 1. Incorrect 32-bit DMA bounce assumption:
> > The existing condition `max_pfn > PFN_DOWN(dma32_phys_limit)` assumes
> > that a 32-bit DMA bounce buffer is required simply because the maximum
> > PFN exceeds the 32-bit limit. However, if all DRAM starts above 4GB,
> > no memory exists below the limit to satisfy this allocation. Fix
> > this by adding a check to ensure `memblock_start_of_DRAM()` is actually
> > below the 32-bit limit before enforcing 32-bit SWIOTLB.
> > 
> > 2. kmalloc() bounce buffer allocation failure on non-coherent systems:
> > For non-coherent hardware, a bounce buffer is still mandatory for
> > cache-line-aligned kmalloc(), even if 32-bit DMA bouncing is skipped.

I'm not sure I'm parsing this correctly.  Shouldn't this read "for 
*non*-cache-aligned kmalloc()" ?  Or am I missing the point?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
