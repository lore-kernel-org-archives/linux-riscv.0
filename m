Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C2FC001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 18:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tzyl95iBgh7H3Sm7IQif7QO+ToKwGWjZj/B9XK7FypY=; b=qHZ5g2xKaMNLpr
	Yu9ZI2pEF46mpJxXfqVUMZWLi8MQ5MmKFsbeEHImZGks+4uWWCBTm4vvDNJ/UvG7Zl7a5Il+usB8H
	NFR5PaDkjoO50+VvobDCDWNmDNB4Jy6RNPCgkx/ddab3Z1XRuDq4/P2aESFfehpk9otE/alXmySiY
	kbhqIZSQ32dS5n0eRP9xrSB4GwOde3ejfe0XkWLX6ShaeUD6uQ0kLkkysoUaLgj9KcDha0lvQeEug
	a6ZFYO3QNNFEWdY/op+tPY5HBH6ko0Z6gqJzoNuq8CqCeI+mGqtkGrDRshElR9DtTOR+hxJfQqlvE
	837hkbiDTrP4sB9xgDDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMuna-00EqL8-1M;
	Fri, 21 Jul 2023 18:24:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMunW-00EqHp-0P;
	Fri, 21 Jul 2023 18:24:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A283161D7F;
	Fri, 21 Jul 2023 18:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C336DC433C8;
	Fri, 21 Jul 2023 18:24:06 +0000 (UTC)
Date: Fri, 21 Jul 2023 11:24:05 -0700
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	mark.rutland@arm.com, ryan.roberts@arm.com, will@kernel.org,
	anshuman.khandual@arm.com, linux-doc@vger.kernel.org,
	corbet@lwn.net, peterz@infradead.org, arnd@arndb.de,
	punit.agrawal@bytedance.com, linux-kernel@vger.kernel.org,
	darren@os.amperecomputing.com, yangyicong@hisilicon.com,
	huzhanyuan@oppo.com, lipeifeng@oppo.com, zhangshiming@oppo.com,
	guojian@oppo.com, realmz6@gmail.com, linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	Barry Song <21cnbao@gmail.com>, wangkefeng.wang@huawei.com,
	xhao@linux.alibaba.com, prime.zeng@hisilicon.com,
	Jonathan.Cameron@huawei.com, Barry Song <v-songbaohua@oppo.com>,
	Nadav Amit <namit@vmware.com>, Mel Gorman <mgorman@suse.de>
Subject: Re: [PATCH v11 2/4] mm/tlbbatch: Rename and extend some functions
Message-ID: <ZLrNRSry+Hhn2dxA@arm.com>
References: <20230717131004.12662-1-yangyicong@huawei.com>
 <20230717131004.12662-3-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230717131004.12662-3-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_112414_226651_D4AF7A7A 
X-CRM114-Status: GOOD (  13.28  )
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

On Mon, Jul 17, 2023 at 09:10:02PM +0800, Yicong Yang wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> This patch does some preparation works to extend batched TLB flush to
> arm64. Including:
> - Extend set_tlb_ubc_flush_pending() and arch_tlbbatch_add_mm()
>   to accept an additional argument for address, architectures
>   like arm64 may need this for tlbi.
> - Rename arch_tlbbatch_add_mm() to arch_tlbbatch_add_pending()
>   to match its current function since we don't need to handle
>   mm on architectures like arm64 and add_mm is not proper,
>   add_pending will make sense to both as on x86 we're pending the
>   TLB flush operations while on arm64 we're pending the synchronize
>   operations.
> 
> This intends no functional changes on x86.
> 
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Nadav Amit <namit@vmware.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Tested-by: Yicong Yang <yangyicong@hisilicon.com>
> Tested-by: Xin Hao <xhao@linux.alibaba.com>
> Tested-by: Punit Agrawal <punit.agrawal@bytedance.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> Reviewed-by: Xin Hao <xhao@linux.alibaba.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
