Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD473C001DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 18:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SoyXO2YFYMDg7OKTAbVEBdACgkOXV910MrODwpW5UyU=; b=MzAAjec2dUhL5d
	dk4M7lcxXH8Aov8T2WL9EUsd6/gNCuH1uG20Af8Gym3XH1UaBeY7ABQD2pUnN6ywtCFyEStl1Qu1U
	I/2PHv5cChnjnVBGO3iBnstS5AjCGJgqJUhpTpuzzE9sb3q/vUcFU7neybiFdpBCoTnQ0W+mMnuxg
	EC+VgaCRp6tuDOjB5DjnaQcIF8dIwlSuCMNXOKjokRBK6i5J3Nj+tIUHWT4ewzez23mFiDfrI7pKV
	YuQOTA9Ed9rNhnCCvV/W6kfRwXMccg9T1efrX8/DtTVXeGXWilGxyp0/DhiBYfYH9bSKy4Q49Zm8w
	7KVooisfEKUeBmhhkXyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMuo0-00EqWP-17;
	Fri, 21 Jul 2023 18:24:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMunx-00EqTr-1F;
	Fri, 21 Jul 2023 18:24:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DED9B61D70;
	Fri, 21 Jul 2023 18:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C25C433C8;
	Fri, 21 Jul 2023 18:24:35 +0000 (UTC)
Date: Fri, 21 Jul 2023 19:24:34 +0100
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
	Jonathan.Cameron@huawei.com
Subject: Re: [PATCH v11 3/4] mm/tlbbatch: Introduce
 arch_flush_tlb_batched_pending()
Message-ID: <ZLrNYtekYsMFZuVK@arm.com>
References: <20230717131004.12662-1-yangyicong@huawei.com>
 <20230717131004.12662-4-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230717131004.12662-4-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_112441_464047_FCDAE40E 
X-CRM114-Status: UNSURE (   9.24  )
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

On Mon, Jul 17, 2023 at 09:10:03PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Currently we'll flush the mm in flush_tlb_batched_pending() to
> avoid race between reclaim unmaps pages by batched TLB flush
> and mprotect/munmap/etc. Other architectures like arm64 may
> only need a synchronization barrier(dsb) here rather than
> a full mm flush. So add arch_flush_tlb_batched_pending() to
> allow an arch-specific implementation here. This intends no
> functional changes on x86 since still a full mm flush for
> x86.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
