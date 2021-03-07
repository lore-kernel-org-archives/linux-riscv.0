Return-Path: <SRS0=YBN+=IF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B0CC433DB
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Mar 2021 15:25:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFFF66501E
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Mar 2021 15:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFFF66501E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i5ZSKgTzY+TPIBxdFOXt3QgdvM/ADQRBlmAYktJLH0Q=; b=Ej1IjUILlXUVGn9XXn6QCPVb/
	a/6JuouJ15Mo2o6iTOVy/HJDLtWlnQELZzr7TX/dhE6DqhJ/McAOYhwNS1AZKi3riEIEC9wbYF/ci
	YWrBbLH35AfYDDeOfQZ6JBT6RiB51TwvbYYOc+W+eHCiD/TFa7PY0as4yTdY0OisbBco2ITfWTv7w
	7VmaG9nqix6/wipIruKR0JjApP0fYf2nbmO7BWE4p6JbKnIlywMtyChn7QEgTSmiVxN6zfdCadl7u
	JAMbd6BpbPlKSIS1EzVdpEa4iggz3Ov10PoN/EWXvkeQ1L2Xwp4nzHz/qFLrIwoBMNcRF+m0hKMH/
	BEabUdLPA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIvH3-00Afod-Hr; Sun, 07 Mar 2021 15:24:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIvGn-00AflQ-Gr; Sun, 07 Mar 2021 15:24:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6801765004;
 Sun,  7 Mar 2021 15:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615130674;
 bh=v6Hpp6iOc56BzTgKF0Lqlq7f36GA6UOn7qkPYeygLDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o6t0vl1XcJjABVvkwrDtqIn65aMIJLWlZ+nmr8ab6DZR/FskYnSQHoMXgM8bYpvjx
 aZzeCCIQLPLclXQ3vkrCVeCGbCdrBobrVFuIXY6mpG4qype9tqbCEHi/HhV8e0kUtz
 Wb1TJoCLJL4EHeel7y0nywBZMkfJV7jxGcYYBULw=
Date: Sun, 7 Mar 2021 16:24:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Jing Xiangfeng <jingxiangfeng@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 rppt@kernel.org, lorenzo.pieralisi@arm.com, guohanjun@huawei.com,
 sudeep.holla@arm.com, rjw@rjwysocki.net, lenb@kernel.org,
 song.bao.hua@hisilicon.com, ardb@kernel.org,
 anshuman.khandual@arm.com, bhelgaas@google.com, guro@fb.com,
 robh+dt@kernel.org, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, frowand.list@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 wangkefeng.wang@huawei.com
Subject: Re: [PATCH stable v5.10 0/7] arm64: Default to 32-bit wide ZONE_DMA
Message-ID: <YETwL6QGWFyJTAzk@kroah.com>
References: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
 <YEDkmj6cchMPAq2h@kroah.com>
 <9bc396116372de5b538d71d8f9ae9c3259f1002e.camel@suse.de>
 <YEDr/lYZHew88/Ip@kroah.com>
 <827b317d7f5da6e048806922098291faacdb19f9.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <827b317d7f5da6e048806922098291faacdb19f9.camel@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210307_152437_800360_9328DA17 
X-CRM114-Status: GOOD (  15.98  )
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

On Thu, Mar 04, 2021 at 04:09:28PM +0100, Nicolas Saenz Julienne wrote:
> On Thu, 2021-03-04 at 15:17 +0100, Greg KH wrote:
> > On Thu, Mar 04, 2021 at 03:05:32PM +0100, Nicolas Saenz Julienne wrote:
> > > Hi Greg.
> > > 
> > > On Thu, 2021-03-04 at 14:46 +0100, Greg KH wrote:
> > > > On Wed, Mar 03, 2021 at 03:33:12PM +0800, Jing Xiangfeng wrote:
> > > > > Using two distinct DMA zones turned out to be problematic. Here's an
> > > > > attempt go back to a saner default.
> > > > 
> > > > What problem does this solve?  How does this fit into the stable kernel
> > > > rules?
> > > 
> > > We changed the way we setup memory zones in arm64 in order to cater for
> > > Raspberry Pi 4's weird DMA constraints: ZONE_DMA spans the lower 1GB of memory
> > > and ZONE_DMA32 the rest of the 32bit address space. Since you can't allocate
> > > memory that crosses zone boundaries, this broke crashkernel allocations on big
> > > machines. This series fixes all this by parsing the HW description and checking
> > > for DMA constrained buses. When not found, the unnecessary zone creation is
> > > skipped.
> > 
> > What kernel/commit caused this "breakage"?
> 
> 1a8e1cef7603 arm64: use both ZONE_DMA and ZONE_DMA32

Thanks for the info, all now queued up.

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
