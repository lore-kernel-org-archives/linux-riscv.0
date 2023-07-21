Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9EAC41513
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 18:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMFkd6qsGewoDdDt3EVlsXETYvPRaS5RyGv5pvsRzHA=; b=WKWtSMRBdMdinb
	xd6LiVwiU7WUfCywljGntBE0N4tC+LQFH2uRsE6XNA4mkrdMLkzCLBoGaKKrjD05pK4/9mv/dK/i5
	BL/G6MwYUR3DlwBDhTS8a4poLPci57RiLUmRBDoDOkRPU/yK6eWiVGAZkWxnU9Z2DdwZKdhKxJ5Vz
	SoIHT84XOUWRkEOoVI07m4ZF7FecKEMnyWNQN2KqtHTOonAhU2WhkHB7oCdeDRtWjYcVUBj8XZY/N
	B0owmqbgLhFPeY441ebBV4EOugnMAuIc4ruyhHltvDGDFGrQ9YzvMEJWsg7OGvYzJcJAcpVRIUR5k
	naqB2smKEJ8Wfe0WJrYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMunI-00EqBH-3A;
	Fri, 21 Jul 2023 18:24:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMunF-00Eq9T-1M;
	Fri, 21 Jul 2023 18:23:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64AFE61D70;
	Fri, 21 Jul 2023 18:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41432C433C9;
	Fri, 21 Jul 2023 18:23:50 +0000 (UTC)
Date: Fri, 21 Jul 2023 11:23:49 -0700
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
	Jonathan.Cameron@huawei.com,
	Anshuman Khandual <khandual@linux.vnet.ibm.com>,
	Barry Song <baohua@kernel.org>
Subject: Re: [PATCH v11 1/4] mm/tlbbatch: Introduce
 arch_tlbbatch_should_defer()
Message-ID: <ZLrNNcApzNLp9pdj@arm.com>
References: <20230717131004.12662-1-yangyicong@huawei.com>
 <20230717131004.12662-2-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230717131004.12662-2-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_112357_496356_0C8E98DB 
X-CRM114-Status: GOOD (  10.41  )
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

On Mon, Jul 17, 2023 at 09:10:01PM +0800, Yicong Yang wrote:
> From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> 
> The entire scheme of deferred TLB flush in reclaim path rests on the
> fact that the cost to refill TLB entries is less than flushing out
> individual entries by sending IPI to remote CPUs. But architecture
> can have different ways to evaluate that. Hence apart from checking
> TTU_BATCH_FLUSH in the TTU flags, rest of the decision should be
> architecture specific.
> 
> Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> [https://lore.kernel.org/linuxppc-dev/20171101101735.2318-2-khandual@linux.vnet.ibm.com/]
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> [Rebase and fix incorrect return value type]
> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Reviewed-by: Barry Song <baohua@kernel.org>
> Reviewed-by: Xin Hao <xhao@linux.alibaba.com>
> Tested-by: Punit Agrawal <punit.agrawal@bytedance.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
