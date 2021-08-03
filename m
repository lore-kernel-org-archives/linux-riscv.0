Return-Path: <SRS0=9VPL=M2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2984C4338F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 08:24:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 676E360EFF
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 08:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 676E360EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cAL4ZMWuVGIJZYxF5avWutr54J+gCtWs9AX0ZcUkzoc=; b=wrMZ9y0Sd4gn0S
	Ta4OhArMhE9g8L51jvCgtZ8Ecnw77siFNvg5dLn5qNHLN21CL48DHZI/ejc0Ng+bs6zkUm5uI2C3v
	eCYUJGMLP10eEN86LJcFgltDmy39uh71WFMmoh5xycTapv9wUtzrfz3EWxpssR/ASmebJsDek/d7f
	MYdy7X2Xy8meCrt01fqcFIKFqLOeVJdwnWll/KavOMexWlDNFsdH7WCiQROAvdBxQCOMNlFxKrVwU
	G06litHGVUBsFsMpXJ1mqqOqp2tSnl+NPm/hYOXRHeTdpZh7/YWASKs+OaTGbA5fb3/YPwcj8EDXW
	BKXmjhIDiR+YNqlWbveg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mApig-001bfn-Dx; Tue, 03 Aug 2021 08:24:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mApie-001bed-6V
 for linux-riscv@bombadil.infradead.org; Tue, 03 Aug 2021 08:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=lL1kXiG3pTLigs618iernO7W8b3PJxh8h+51xziiEUU=; b=ulAjcBAEaEyhdLjXBVpi6GziUj
 9nu3c+gCgIFia2odHsZdxFJadUWY6jwcIm1vhX0jnVLdspg9mq5DCpEVjzXBiUfV880fGgsItVjLU
 xABwG2D1G/V+phjY00k67qXPmPe9XPheW4ucnbKY7vjtXmmT+lD5BFtAwuIq0xfZg21h6kPCynQ/0
 HdfefcvmhM01a9kCfniOuh29mJdba7sKnq7/HtOBJ8CrzDZyftc1Q5qYsdFSeDqgJwiIq5Z6UgwAh
 0mcm0OFeiZHMpcJyfjND2Fp4DQbM/3Q20DyagdE8IdxjG0PPhqw7yR+g58BDQChxy+4loU2oKE2iE
 Tg0oKn5w==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mApgP-004PCn-1i; Tue, 03 Aug 2021 08:22:19 +0000
Date: Tue, 3 Aug 2021 09:21:53 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v2] riscv: Kconfig: do not select PCI_MSI if CONIFG_PCI
 is enabled
Message-ID: <YQj8oUbJh+ko3LoC@infradead.org>
References: <1626838752-7013-1-git-send-email-vincent.chen@sifive.com>
 <YPe3XuYfxBkbDzHf@infradead.org>
 <CABvJ_xiGZ29LQ+YFnraJbTSBihKi7t7VSDF0+AXcFQzA34VvtA@mail.gmail.com>
 <CABvJ_xhm=ZVfEpzQxTp7=OUrxxjdcJJmHzdwVcRmLuDqfdEYzg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABvJ_xhm=ZVfEpzQxTp7=OUrxxjdcJJmHzdwVcRmLuDqfdEYzg@mail.gmail.com>
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

Nothing changed at all from my previous reply.  This patch is wrong,
and you need to implement proper runtime detection.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
