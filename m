Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B66C27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 16:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9/0l1OOsTe342iWmvqd4OjyjzOneOTob9vK1NCdcFAg=; b=zXTd8s8wZOsH0a
	ybT09JUkbk9XzGahk1OMD+M7jnpTNu/AtghwAWta5qDa0pRb+3UYqGZ4t1GANt+z37y0C88ZVXIo3
	cIoRILLgbTIA6uh5E8FTz1IB5kfs2M15+9u90HcLBEqh2X/cKODkthb0wNioE7idqSOfDDoiTsxb0
	h5eUFq1zePLnB4f1aAsFa5MQHgXxmqAmqw1+wYl1rslwMgIzcuGHZTmb7rW3j1I7ZIF9DFgLVYOq2
	3epJRYrAVf1nnTlm3C/GP0zUF2w21eAYTxT2tt2OZlMxJFvbHQi4/jKvtd/1TFAmK4aqOMNgNjBx3
	Tz775XFg8z2qtnn+jwLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKTG-00000005nXM-0Ysc;
	Thu, 20 Jun 2024 16:17:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKTC-00000005nTH-1ois
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 16:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3564621D6;
	Thu, 20 Jun 2024 16:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D79C2BD10;
	Thu, 20 Jun 2024 16:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718900225;
	bh=cIn4IAYucHLlyNmqD+MKWztwW70sK5v69/WFTeyPL3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYBFF2he35hujPNRuM19I3BCEqxslTAsV8egyyB7QyHq7LznsRXWuR0CKO4++Yd4c
	 o4Zm050RcjM1V6yp+o0ADU+ZBdyRCGcVYGxaJLo8tzunUoCF+A4vynyqF+oCXQxfsO
	 MNCbwjnDGDkA2W/oobBjp0vHqL1noMZ6hydlExxslQL1OUVhAf6erSZFBzOo9Ueji1
	 So+mqMiMAD9gzbTt1lbzqfb9EQpg39mpKsjTRzWkMnxIj0gPc89oAIUv15j93ELR01
	 zDCiue0bedpKbHVUiCCJmd+OsM+kEx+p+eMKtcZWulz0xtmHJ6/VNzGdrCr98ngzhr
	 +BBZtALOiW2WA==
Date: Thu, 20 Jun 2024 21:47:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Jie Hai <haijie1@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Li Zetao <lizetao1@huawei.com>, Guanhua Gao <guanhua.gao@nxp.com>,
	"open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:FREESCALE eDMA DRIVER" <imx@lists.linux.dev>,
	"open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2] dmaegine: virt-dma : Fix multi-user with vchan
Message-ID: <ZnRV_fE8QViZG66o@matsya>
References: <20230720114212.51224-1-haijie1@huawei.com>
 <20240620025400.3300641-1-haijie1@huawei.com>
 <ZnQ/AyffdW+u9C8P@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZnQ/AyffdW+u9C8P@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_091706_604309_0E371502 
X-CRM114-Status: GOOD (  14.51  )
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

On 20-06-24, 10:38, Frank Li wrote:
> On Thu, Jun 20, 2024 at 10:53:53AM +0800, Jie Hai wrote:
> > List desc_allocated was introduced for the case of a transfer
> > submitted multiple times. But elegating descriptors on the list
> > causes other problems.
> > 
> > For example, in the multi-thread scenario, which tasks are
> > continuously created and submitted by each thread. If one of
> > the threads calls dmaengine_terminate_all, for dirvers using
> > vchan_get_all_descriptors, all descriptors will be freed. If
> > there's another thread submitting a transfer A by
> > vchan_tx_submit, the following results may be generated:
> > 1. desc A is freeing -> visit wrong address of node prep/next.
> > 2. desc A is freed -> visit invalid address of A.
> > 
> > In the above case, calltrace is generated and the system is
> > suspended. This can be tested by dmatest.
> 
> What's test steps to reproduce this problem?

I think I have asked in past (dont recall if that was this or some other
one), hopefully will get to hear on this one..

PS: Good hygiene to trim replies

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
