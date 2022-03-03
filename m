Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01231C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Mar 2022 10:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qojDbXRcoLTRm3khHdesA2uHghO/B0/n4d8YqRaDzSY=; b=J/EmGNfQZia3Z7
	ufY8mAgT6G8ickOt7wp9HQqNgy1OOoZfoYAvAoyRUuLK6kBKJJ9ehQ2y3DNFGKdGHsm2IP4lKknmH
	LhhCumaxx09ZCya0RmcfNQKD/hXzEevcAPSn9giNrS4+rgH/QL19hHYaDixGYkgbOnMieaIZUkGVN
	7XeEDffMRniAzmYjh41qffTcYa5/1J0KoWccd3F/ldXLI8FxpD/zmo+NmAUuRHkMjZZ0EvhEXvsRj
	VxWIw+oSTgRawhKEY73LgJOvQHM2KMCOzofIyGb/lQ8XTYuQB7LyxjgfesTYp1KqEYax+V7+a0Ted
	FFwdt7FKtFkV9xXD/IYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPjBV-0068oN-1e; Thu, 03 Mar 2022 10:59:49 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPjBH-0068hq-L0; Thu, 03 Mar 2022 10:59:37 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id DB58D68AFE; Thu,  3 Mar 2022 11:59:31 +0100 (CET)
Date: Thu, 3 Mar 2022 11:59:31 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
 x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
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
Message-ID: <20220303105931.GA15137@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
 <20220302081500.GB23075@lst.de>
 <alpine.DEB.2.22.394.2203021709470.3261@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2203021709470.3261@ubuntu-linux-20-04-desktop>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_025935_843551_FC887E22 
X-CRM114-Status: GOOD (  10.29  )
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

On Wed, Mar 02, 2022 at 05:25:10PM -0800, Stefano Stabellini wrote:
> Thinking more about it we actually need to drop the xen_initial_domain()
> check otherwise some cases won't be functional (Dom0 not 1:1 mapped, or
> DomU 1:1 mapped).

Hmm, but that would be the case even before this series, right?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
