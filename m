Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6EFC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 17:18:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF9B320851
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 17:18:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QuElwQ4y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF9B320851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bMIJXhg8aci35zxCUKbYJqBwLBOwqAm1UuUn5TnuVlY=; b=QuElwQ4yKR133x
	F/yLw2hqNZlJxC/3MJ+VZwVMX1Oft7RhP5vkRSF7cZZu7ev5dGy4eyBt8pkA8N6XMY+uz3Fu3WaUJ
	fBAH6rn1kzmxPg/CKv6DtfICHv+7gKpcreaxE93VON/hpvEGIkrocvMAzURrjnD2/fr7V4cxitH/U
	J5diA5bax0ou20AzIhBpFOHZqZTHncfL7C1zrVfg0dW5EobgKISasMui43wj7vxEoTh4ltwT7rX0m
	2vGtMkn6H5OgyFPJH0Dc8CxAwnkqvPfAOr1JVzW1NFNGMtLelPTLu1GxAJ3TXaCaml808jXfAa62P
	3EzCu2LWHzYh1ea6fZlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2J8J-00073o-Cx; Fri, 08 Mar 2019 17:18:07 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h2J8G-00073T-Uw; Fri, 08 Mar 2019 17:18:04 +0000
Date: Fri, 8 Mar 2019 09:18:04 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH 3/3] riscv: rewrite tlb flush for performance improvement
Message-ID: <20190308171804.GA27005@infradead.org>
References: <LO2P265MB08471CC8597FD60691334624D64C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <20190308143928.GC32707@infradead.org>
 <04cbcd8e-77b4-b3fa-8f9e-3aa07db781fc@garyguo.net>
 <20190308163125.GB310@infradead.org>
 <CAAhSdy3n4F6EE0RYwozH2U2W+WMGJ_eVYs7-ny8Y2szoUeaksQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy3n4F6EE0RYwozH2U2W+WMGJ_eVYs7-ny8Y2szoUeaksQ@mail.gmail.com>
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
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Gary Guo <gary@garyguo.net>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 08, 2019 at 10:20:49PM +0530, Anup Patel wrote:
> For your information, the IPI triggering is also done using SBI call
> so we are not saving much by not using SBI calls for remote SFENCE.

Not yet.  But all the usual implementation just implement IPIs by
MMIO writes to the CLINT.  Which could easily be delegated and we'd
save the trap.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
