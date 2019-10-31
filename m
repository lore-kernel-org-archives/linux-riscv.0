Return-Path: <SRS0=iNPO=YY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37C7CA9ECE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2019 15:52:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B11272087F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2019 15:52:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EO43JSDZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B11272087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vm0iWhF5UlOPe9r9hDYFRX8IFIX/n7Cp+wS63BiDzQU=; b=EO43JSDZqFiqaZ
	hZB+6zwrsWvHYCaFfXHob8hTsIeE1Eop5ktZAlOJ+i/2NQ0gBl5KcxPbwpHCR4sAQAt7O3j+U85gx
	XBjo9eL7gxwD7mQUHbrJcJYJRnh2T2i7fGJQE3G7hMML/RzqAD+1BnGTRgzrlXQS4EV/xX5+B0gOE
	Yn0MCL2gOfESxOFTgPU1jE7dljcJHiwzWomwaBPdeuALZL1RBW6JT734eBpX1dRvaqhM6f1J9CR5y
	NKEYY6fvhiJOeweIqlKfbB5ihfmxF5tmVqwlFzE2Kfss8XRiVW4bvN1j3Pxrh1yhKLBeuONEbqVay
	GLSojipmhi0plJNZPdbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQCkM-0000wi-IH; Thu, 31 Oct 2019 15:52:26 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQCkK-0000wD-HY
 for linux-riscv@lists.infradead.org; Thu, 31 Oct 2019 15:52:25 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4526368BE1; Thu, 31 Oct 2019 16:52:22 +0100 (CET)
Date: Thu, 31 Oct 2019 16:52:22 +0100
From: Christoph Hellwig <hch@lst.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: RISC-V nommu support v6
Message-ID: <20191031155222.GA7270@lst.de>
References: <20191028121043.22934-1-hch@lst.de>
 <alpine.DEB.2.21.9999.1910301311240.6452@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1910301311240.6452@viisi.sifive.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_085224_729794_564175D8 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <damien.lemoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@lst.de>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 30, 2019 at 01:21:21PM -0700, Paul Walmsley wrote:
> I tried building this series from your git branch mentioned above, and 
> booted it with a buildroot userspace built from your custom buildroot 
> tree.  Am seeing some segmentation faults from userspace (below). 
> 
> Am still planning to merge your patches.
> 
> But I'm wondering whether you are seeing these segmentation faults also? 
> Or is it something that might be specific to my test setup?

I just built a fresh image using make -j4 with that report and it works
perfectly fine with my tree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
