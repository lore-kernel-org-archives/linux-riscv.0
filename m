Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A7BC3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 06:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPJgXaN9pnGmaQI9GDqvRQ1j556VQEh0X6K8H+srHN8=; b=hqSj6uvU0QPX6U
	lwjCLjIidmPaL8zMWbkHTt9fqskw/4vz330t71Gn3KTX1uRou2xM6bIpytZQDcOl9xZg8PrIqWXGq
	t5ftPahg8WUoeqm0Xe78t0P1hjp+MhZCjuGljrFSaClUDkHWR+HiB7lyCzGy48EoKYPSBYy60Pq4p
	m97yGQMlfIndrdpAM9NPlCYd9na7DHeHCo9DyWD9tEBKzSEKyO3X3xNYrol/CrXA0sdi3UgsfI9MC
	jOeDh35XarjeyJmW/BO46+xbpxNlRQc4SLXEUWPzL0OsrIuwvoeo7IE9fh0vxMRanfx4cvADRoW5B
	iKt/qZXUFiL3RABUvlRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIjjf-00GDsX-11;
	Thu, 28 Dec 2023 06:19:15 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIjjb-00GDrB-30;
	Thu, 28 Dec 2023 06:19:13 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id C325868C4E; Thu, 28 Dec 2023 07:19:05 +0100 (CET)
Date: Thu, 28 Dec 2023 07:19:04 +0100
From: Christoph Hellwig <hch@lst.de>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org, linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 01/14] arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
Message-ID: <20231228061904.GA12475@lst.de>
References: <20231228014220.3562640-1-samuel.holland@sifive.com> <20231228014220.3562640-2-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231228014220.3562640-2-samuel.holland@sifive.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_221912_113024_E56C1FD7 
X-CRM114-Status: UNSURE (   7.82  )
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

Thanks for all the great documentation!

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
