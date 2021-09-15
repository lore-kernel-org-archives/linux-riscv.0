Return-Path: <SRS0=puBH=OF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09590C43217
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Sep 2021 07:50:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE0ED61216
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Sep 2021 07:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE0ED61216
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Se4IUhtwaZollNC/vg+UbejLScclkhTCNfNcTJRWS50=; b=rbbboZBew6Klua
	g5er4xsPjMu6HQWLyEqReXE5EjmG6FUiGUnVBlL+ZFvP+E5AKU3lY2FuarHiENC2Eurs1z/b0se+Z
	w5pp9xzUhPIEVvmQhsD5DIJe8xR8i5npBJM8q0Zm/ys2IY17/GkMTdKzJ3rx7BmILy//cwNRkfrSd
	l3xH9nOboRujC+i+7pXtp+NpFQeQRWnIoBMZp1ypFec94+B6vfSKVk4y31poRquUxuT9mze/c3nlk
	Aulk+d+ywrXBemQCqypweKxN6HValo63hqgln8wy0bmUgVtFeDc5wpbXo08Fh5G633fBPaaS/RC/r
	GxT659OusdmAyemsl/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQPgK-008Lbp-IL; Wed, 15 Sep 2021 07:50:12 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQPgH-008LaC-I2
 for linux-riscv@lists.infradead.org; Wed, 15 Sep 2021 07:50:10 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7C4AC68B05; Wed, 15 Sep 2021 09:50:07 +0200 (CEST)
Date: Wed, 15 Sep 2021 09:50:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Cc: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu, hch@lst.de,
 liush@allwinnertech.com, wefu@redhat.com, lazyparser@gmail.com,
 drew@beagleboard.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, taiten.peng@canonical.com,
 aniket.ponkshe@canonical.com, heinrich.schuchardt@canonical.com,
 gordan.markus@canonical.com
Subject: Re: [RFC PATCH V4 4/6] RISC-V: Implement arch_sync_dma* functions
Message-ID: <20210915075007.GD20024@lst.de>
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-5-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210911092139.79607-5-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_005009_807278_4B726A09 
X-CRM114-Status: GOOD (  10.48  )
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

On Sat, Sep 11, 2021 at 05:21:37PM +0800, guoren@kernel.org wrote:
> +static void __dma_sync(phys_addr_t paddr, size_t size, enum dma_data_direction dir)
> +{
> +	if ((dir == DMA_FROM_DEVICE) && (dma_cache_sync->cache_invalidate))
> +		dma_cache_sync->cache_invalidate(paddr, size);
> +	else if ((dir == DMA_TO_DEVICE) && (dma_cache_sync->cache_clean))
> +		dma_cache_sync->cache_clean(paddr, size);
> +	else if ((dir == DMA_BIDIRECTIONAL) && dma_cache_sync->cache_flush)
> +		dma_cache_sync->cache_flush(paddr, size);
> +}

Despite various snipplets this is a still pretty much the broken previous
versions.  These need to use the CMO instructions directly which are
about to go into review, and then your SBI can trap on those can call
whatever non-standard mess you're using.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
