Return-Path: <SRS0=/aKF=IC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD62C433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 14:18:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24CE464F23
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 14:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24CE464F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c3vsZDXVZS7NlNefq4/kanhxjMHtyubd2yy2umjHApY=; b=dX3SRxWJb561ye0n9FFJ9wQ8j
	Xy5cvd3jhdaVyEt9GLlkyD21lrnHacSsjcisV/OOILABM+3bKE1HxO2rWb94lXRITs/QnvXmvDdUt
	Bx/7GKbm5bq8/Kkx04pUHuXc1wrQVEedrigK0k5hacryeYR5UUKCHT3+sYWii63NOSA1AyiW1muEs
	iMnyRHdpa6jkDcN7XR9sAXn13BF8XdSKmvk+sEsGvizCJCYcDLaiDvJ7SP1sCRkGg7Rnqenn3pW3y
	dKFGowm9Vk+b+gqyA84iiHWtsov5BQRvIj9KP78NSNHU9JFZDNKm7njt14S4MNUCJd0LUGdTCBN5E
	fyT8U94pA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHonW-008sA8-WB; Thu, 04 Mar 2021 14:17:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHonK-008s8w-0q; Thu, 04 Mar 2021 14:17:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38AC164EF6;
 Thu,  4 Mar 2021 14:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614867456;
 bh=5SFoOpkNOISja2bka7WY1xY3Xu6DHtOUpfvK1KKO0Ho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KmSdKQPpfL8NUZTjBgr8+DvFEaxjKTvLNf2mi07XjFMqkkhK2Wdm0PdGbpJ1Ml5uQ
 dnNvPSaNnj9YiUrkr3hPxBKjrOs8rA1yvnUUv3ONmKgy5v87x3AASqOgqtnN02pDa2
 z1hwXqWqpgjmYJN7O8sM35kkT/bZypmcKNvWHPqk=
Date: Thu, 4 Mar 2021 15:17:34 +0100
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
Message-ID: <YEDr/lYZHew88/Ip@kroah.com>
References: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
 <YEDkmj6cchMPAq2h@kroah.com>
 <9bc396116372de5b538d71d8f9ae9c3259f1002e.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9bc396116372de5b538d71d8f9ae9c3259f1002e.camel@suse.de>
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

On Thu, Mar 04, 2021 at 03:05:32PM +0100, Nicolas Saenz Julienne wrote:
> Hi Greg.
> 
> On Thu, 2021-03-04 at 14:46 +0100, Greg KH wrote:
> > On Wed, Mar 03, 2021 at 03:33:12PM +0800, Jing Xiangfeng wrote:
> > > Using two distinct DMA zones turned out to be problematic. Here's an
> > > attempt go back to a saner default.
> > 
> > What problem does this solve?  How does this fit into the stable kernel
> > rules?
> 
> We changed the way we setup memory zones in arm64 in order to cater for
> Raspberry Pi 4's weird DMA constraints: ZONE_DMA spans the lower 1GB of memory
> and ZONE_DMA32 the rest of the 32bit address space. Since you can't allocate
> memory that crosses zone boundaries, this broke crashkernel allocations on big
> machines. This series fixes all this by parsing the HW description and checking
> for DMA constrained buses. When not found, the unnecessary zone creation is
> skipped.

What kernel/commit caused this "breakage"?

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
