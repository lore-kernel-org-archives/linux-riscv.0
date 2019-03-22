Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFECC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:25:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19147218A5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 13:25:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V29Jn61w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19147218A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8R/lYem7/JLonfxW/fgWrIa94pbWD79WOq72vBXy9oQ=; b=V29Jn61wnsQwwC
	oKuvLBOr0cHBx9jsSRmGeVlK/mPK5AyK2xZjncLqrp1z6bAaptWwaEciBINsse/7LiwAl+lk6qua2
	fIdvPmD2bjh/Ejp995v5c3c4vfvLxVek+gNmaeQZcuyaQJ6TyfGDGLYwXmrcb862Oh1awGr/qbA+d
	37tNIXjf1jfBzcfUvG112OmW7C/P4KUmPHaa4CXF57ZIKAW4CYKZSybo1Q0rrLkx9Kqh4IJYPK3zV
	yD5Es6oLYRWuRjfGXYTP+Z5armTlbgi+skxFycta3j3zYER6cRY7NP+/057wHdx7DRp55wQqOyd+D
	lT64Pv9xExkmlKc75/Nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7KAa-0006dm-BY; Fri, 22 Mar 2019 13:25:12 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h7KAX-0006dR-Tn; Fri, 22 Mar 2019 13:25:09 +0000
Date: Fri, 22 Mar 2019 06:25:09 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH] RISC-V: Fix FIXMAP_TOP to avoid overlap with VMALLOC area
Message-ID: <20190322132509.GA19263@infradead.org>
References: <20190322100414.32221-1-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190322100414.32221-1-anup.patel@wdc.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

Btw, what is the 32-bit test vehicle of choice?  qemu with the
virt machine?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
