Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1246FC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 07:18:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D52AD2075E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 07:18:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ubesr5nx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D52AD2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SG4AcAELllpFuHqNmRs46LkL/dPprKSb0eWj1AM4lXw=; b=ubesr5nxCSbL5O
	1Cs5ovezlN6qOco9JhMazqZykiJ/rbzinVFj1i6fWLC0iW0vKrBbeIYZkE5R1PYdjA5tIk2iXHDRU
	GUW1FZPN9Osz4YkwsTHCXTmu0mI2Bv/B4hdggtWWUoM8aR+1cxoEBA70J/Xx6JladNRWWk2bYIsb4
	DncBYFCjW8BD4MPdU4l4tDYdoC5UuyusYGpoD4Oy3jlHt7+/RyhduG85QqBchU0ml+JycKREXb76x
	oAG7L3Lc8TjyRthkCWw4kn0+wTTpmNFY9Btq6DO4a521lyB3K60hVr6jaXpAy8Iy1Vayn33MkK4hu
	93Guv4t+3yCSe3gZSb6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h92pC-0006Kh-6d; Wed, 27 Mar 2019 07:18:14 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h92pA-0006KG-OF; Wed, 27 Mar 2019 07:18:12 +0000
Date: Wed, 27 Mar 2019 00:18:12 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH v4 2/5] riscv: move switch_mm to its own file
Message-ID: <20190327071812.GD3210@infradead.org>
References: <cover.1553647082.git.gary@garyguo.net>
 <862300448c34e225f3fbb4da36ccf18d10753b0b.1553647082.git.gary@garyguo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <862300448c34e225f3fbb4da36ccf18d10753b0b.1553647082.git.gary@garyguo.net>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> +	csr_write(sptbr, virt_to_pfn(next->pgd) | SATP_MODE);
> +	local_flush_tlb_all();
> +
> +	flush_icache_deferred(next);
> +}
> +

Btw, git-am complains about adding a blank line at EOF here, please
consider dropping that empty line.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
