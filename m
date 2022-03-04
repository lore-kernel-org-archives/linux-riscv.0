Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0BBC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 21:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cRCnaOV+JHi8yn69zcy9ea79dJKenK4VjmMD2CosJq0=; b=ZjT1Ifq4BgFKwg
	8yM52YUFb3S/NJ5tU1qgz2mXnw7Pxr54W4HkLHca8ioFmMSTAV8GzVrgtOg+sVob/vm4CTcnUR12K
	S7medCc5tlRblSGArwd9GbqnPx0OkzehAbsNpKPX2yvqiurZQrW+jJPcjnY7j1Faf7iJCgsb+/osi
	E6D2sSp4Bc9ArvV0FGmWz5VVRrvWwQ512O0VykPG1lRAtyXckgW3LJEe/La44eiTZOi57JGn2uBOZ
	VacipVZNwhwBhsPHPMkL6S1PuI2JSl2odcuTt/OdQ68lOzRUofAy2hlvWUb9rCfQS5YgVM07RJhlC
	rG7ewBSQfeXMxycvSKNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQF5N-00C4Cz-9d; Fri, 04 Mar 2022 21:03:37 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQF5B-00C49t-VN; Fri, 04 Mar 2022 21:03:27 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0D8E068BEB; Fri,  4 Mar 2022 22:03:18 +0100 (CET)
Date: Fri, 4 Mar 2022 22:03:16 +0100
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 iommu@lists.linux-foundation.org, x86@kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Message-ID: <20220304210316.GA17365@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
 <ca748512-12bb-7d75-13f1-8d5ec9703e26@oracle.com>
 <20220304172859.GA12860@lst.de>
 <fc3992a8-896b-f0fc-e500-9010ec085c57@oracle.com>
 <20220304174308.GA13515@lst.de>
 <75cb15b5-d861-1b88-5413-df326c3f1144@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75cb15b5-d861-1b88-5413-df326c3f1144@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_130326_183473_EE7B046B 
X-CRM114-Status: GOOD (  11.07  )
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

On Fri, Mar 04, 2022 at 03:18:23PM -0500, Boris Ostrovsky wrote:
> This indeed allows dom0 to boot. Not sure I see where in the next patch this would have been fixed?

I thought it did, but it doesn't.  In the meantime I've pushed out an
updated branch with this folded in to:

git://git.infradead.org/users/hch/misc.git swiotlb-init-cleanup

> (BTW, just noticed in iommu_setup() you set this variable to 1. Should be 'true')

Thank, I'll fix this up.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
