Return-Path: <SRS0=diLN=LP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26EB0C4743C
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 14:59:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A73960FF4
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 14:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A73960FF4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j0c5o1GAfDktJlkXluD8+fa44GRQiYrDOaHfbVS+B/w=; b=Jsb3rMEaEhtcgc
	uJDaIU1wRVr24WASsVcai0O2y1twPNNbsAplU4cBxLMveUC75g+Z2U0uYqISzoaUyNBPO1Xn+idWf
	x4qGEudvRRSC164erhHqEnxwxj8LTfE23gDjZz9KvyGxkjLfZFrlV3Vvu/Need3c9rBsbjp7wXZef
	ycqCShZe9tFQNnx3qPlWqiIJ4wJnEwIiz3CTjuLpicz/gAt+0DZg05cgxjLRe2/8Ar6JOy3uX7Ihp
	g6o2XiiABauBQNNzLvYEPTJ9hk5H8gLTDcuvdafcE+6SGwN5vrk2GqG3mL2jUH0ug5Um0CAzrMjh6
	EeBmQ7ytiZLk9glpTf9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvLOT-003rHl-Hz; Mon, 21 Jun 2021 14:59:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvLOS-003rHH-EV
 for linux-riscv@bombadil.infradead.org; Mon, 21 Jun 2021 14:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MeE5VfIcLBkueUaXBU3Nrjbln3thvwwMBj/aCLS5j/4=; b=oBr0Hw9vmpDFKSNZUUeCLbOE5F
 yVoJ+ZyG6xv11HZaLrK8Xuan4/NZ3o+vkj/jSUSl9+PKtPl9LqwQ9Kj3Yp5w8kaS2ProRotfD7Wy8
 pmwdxtSw8liv7MtBo68/GxQ6sPM6TMNUr3ZG2k8Jw8CVmHTEpUM1fkLYWTH6vBankWS8lkgd8N6kB
 OirGjxUHt7SJ1RDCO/AS4fohI3ZT+HpktwNr1DSD430d1n9Iq9PvT0rw+el2C3Cs+qPJdqgWvtnFa
 w2KTWEvNC0reEcGo5FOlU6cXBwO4mB6CGpKatKKSTQD8zE/ZBr0fgHUZZ3A3Bq/jE55pf5NU3mehI
 CaOqoCDQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1lvLNo-00DCuH-EW; Mon, 21 Jun 2021 14:58:47 +0000
Date: Mon, 21 Jun 2021 15:58:40 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] riscv: Introduce set_kernel_memory helper
Message-ID: <YNCpIN3RSgVubHJC@infradead.org>
References: <20210617131734.1923932-1-alex@ghiti.fr>
 <20210617131734.1923932-2-alex@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617131734.1923932-2-alex@ghiti.fr>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Thu, Jun 17, 2021 at 03:17:33PM +0200, Alexandre Ghiti wrote:
> +int set_kernel_memory(char *start, char *end, int (*set_memory)(unsigned long, int));

Pretty unreadable with the crazy long line and the missing parameter
names for the callback.  It probably is worth to implement this as
__always_inline so that the compiler unwinds the indirect call.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
