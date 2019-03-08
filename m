Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7A6C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 16:28:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5BC02081B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 16:28:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lHxJHewh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5BC02081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTNYE6NLmmTgniurO4GYE7TlrhZAjhbWcfLc4OQfpOQ=; b=lHxJHewhLEAsHd
	37yzFq2dpqi/6L8N7LQi1rc03uNISmgXNZ/wrPNJcvuUBBWNLGTUhBEkOk3xLNKqXBlvth3a7BiPL
	zAAUhXm0SZg/sHHtmdu0JAx3cIvAjswfJTWIIjDMkx1DAxJ6aKnTH1VVfz5CYeswuLXYiBjaUTuIZ
	40gOZWGfhg+/R7ABBNxbEExCIhh9dcWkt2tDJ5scZQIDOsOKSFhzOPW2jG9lq0eHzZejEyK2RgMku
	LgGnw4u8f82tmnEL6t+Qleb+hSYwlgWIaoI27J7iiX9NUa1dvrRk+T6Vc/14TWGGVHvOOuACIcG1M
	v71OCP0UXb0G6SCXR7Bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2IMM-00040W-8T; Fri, 08 Mar 2019 16:28:34 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h2IMJ-00040B-4P; Fri, 08 Mar 2019 16:28:31 +0000
Date: Fri, 8 Mar 2019 08:28:30 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH] riscv: move flush_icache_{all, mm} code to proper location
Message-ID: <20190308162830.GA310@infradead.org>
References: <LO2P265MB0847855A503C55BB11A59A89D6730@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <20190308142421.GA32707@infradead.org>
 <1cc5bffd-7e0b-a5c5-0a5e-0e8b2d62d9f1@garyguo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1cc5bffd-7e0b-a5c5-0a5e-0e8b2d62d9f1@garyguo.net>
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
Cc: Christoph Hellwig <hch@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 08, 2019 at 03:23:22PM +0000, Gary Guo wrote:
> Thanks for reply. I wonder what is the purpose for moving the non-SMP 
> version? The non-SMP are just plain fence.i instructions that could just 
> be inlined directly isn't it?

Sorry, I missed a few additional users, I'm fine with keeping it inline.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
