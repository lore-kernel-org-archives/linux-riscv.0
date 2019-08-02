Return-Path: <SRS0=TPRL=V6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE5DC32750
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2019 08:44:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36EFA2073D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2019 08:44:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F8QXWyqy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36EFA2073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXFgU4GiOS4GDBo3f1s1HbWKVKAVY8VFwl+8sV/NacI=; b=F8QXWyqy+Bip0I
	pt9VeHSfJsGY8AQupeNA5ioiHqlUbitgJrlWG077BdZWSi7AP9lLR0xXYVIlVppDzpXvPJCsSK1KK
	obmFQh2bgUb7BxfJd7AinPVUWspLW/K6stsy1qHXMKEo0VU+jB7sDjDeadkJlz6UQplEBZAsqQ2Ie
	Ss+4i93jB0EMI8Md1JFNBFZirNgpr+CFq693VhSRmf06ptNSAjtWNqj+ov5AL820/DF46+8Fiitu+
	uFVL1DUL9KeDthQ5QM3AA2B6o8Bhh4kM9EsLgTLLHCW7EcYcGc6+utN/u0a2K66XU7vInRo0JhM4a
	Ud+h/zGcBj6JTBEXx+xA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htTBH-0000mg-7R; Fri, 02 Aug 2019 08:44:55 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1htTBF-0000mV-5w; Fri, 02 Aug 2019 08:44:53 +0000
Date: Fri, 2 Aug 2019 01:44:53 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] riscv: kbuild: add virtual memory system selection
Message-ID: <20190802084453.GA1410@infradead.org>
References: <alpine.DEB.2.21.9999.1907261259420.26670@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1907261259420.26670@viisi.sifive.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 26, 2019 at 01:00:49PM -0700, Paul Walmsley wrote:
> 
> The RISC-V specifications currently define three virtual memory
> translation systems: Sv32, Sv39, and Sv48.  Sv32 is currently specific
> to 32-bit systems; Sv39 and Sv48 are currently specific to 64-bit
> systems.  The current kernel only supports Sv32 and Sv39, but we'd
> like to start preparing for Sv48.  As an initial step, allow the
> virtual memory translation system to be selected via kbuild, and stop
> the build if an option is selected that the kernel doen't currently
> support.
> 
> This patch currently has no functional impact.

It cause the user to be able to select a config which thus won't build.
So it is not just useless, which already is a reason not to merge it,
but actively harmful, which is even worse.

Even if we assume we want to implement Sv48 eventually (which seems
to be a bit off), we need to make this a runtime choice and not a
compile time one to not balloon the number of configs that distributions
(and kernel developers) need to support.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
