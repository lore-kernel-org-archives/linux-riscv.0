Return-Path: <SRS0=Z+hV=TZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAD0C04AB0
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 25 May 2019 08:23:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2D5B2168B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 25 May 2019 08:23:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ops8O2jI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2D5B2168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGQZMbyPw/eUU4Zu50US231b3bXVT4G0rELa4B24UWs=; b=Ops8O2jIcKwXta
	AnePVcazLo79eHNNuJx9HitsO8U+TIqChx3gDfMU3y2ZF8T70D53yIYj97AIle7U53ZC9hz22jkmX
	+1zdgzKCdOrfMK3gp9HTkGkzHRg0XdgtZP4KKu22yhzoQ+GwX7quCvj3t5pK48Jc7s0CA+AN/r/Qq
	wD8wJ5vLoELV/OGe4nBPfixtNRJmaQgcdIV1YoCmkPj30PYSmaehicUoYGCcPaW3nU4a6LnSLJR0S
	+WUu5K4r/cOZwKfiUcVcQnXOlH57JYo2rY4Tv4eu8ZNbuAyfCrNzaDJ4EdZ1f92SF8z6a18SONFzw
	hMYNu1UNtuu4W+OcjAQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hURxd-0001E0-Sz; Sat, 25 May 2019 08:23:25 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hURxc-0001Dg-S5; Sat, 25 May 2019 08:23:24 +0000
Date: Sat, 25 May 2019 01:23:24 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alan Mikhak <alan.mikhak@sifive.com>
Subject: Re: [PATCH v2] PCI: endpoint: Set endpoint controller pointer to null
Message-ID: <20190525082324.GB18854@infradead.org>
References: <1558647944-13816-1-git-send-email-alan.mikhak@sifive.com>
 <20190524063809.GA25866@infradead.org>
 <CABEDWGxUDkNOcpT1K+Ez2i47TKi8bHRn-32NaVNkCQgkbPbvmw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABEDWGxUDkNOcpT1K+Ez2i47TKi8bHRn-32NaVNkCQgkbPbvmw@mail.gmail.com>
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
Cc: Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 24, 2019 at 11:23:04AM -0700, Alan Mikhak wrote:
> Chrisoph,
> 
> These changes were implemented in Linux PCI Endpoint framework to
> exercise PCIe endpoint mode on RISCV.

Well, arch/riscv isn't involved in this patch (which having an interest
in the PCIe EP stuff I really like).  I still don't see how it relates
to riscv except that you apparently have been able to use it on a
RISCV SOC somehow.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
