Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6267AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Mar 2022 10:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U1bxVMITiYZftPAUc0B692jrfecqpRRCCKiNkewR3mo=; b=JxmM7iA4usshKw
	1i3iOtLIYU+GYnfZX7r9jtAsUtt60vWl+BnnBG8zpKz6jT5P2PhLukD9D3u+xPpBkTX9DJTNJA8cv
	ymGnNoyrwGF42fB6lVKlkm/ebva5+01LAmbijWTfYCLKakn98vIJO9Jl2bXQxjnRh2TDfyCUrg4yb
	0O3KO+prEP/dUfYw9rZzIMc3X8snNJdnGhYS1ZehqAAnEwITtOhcKs5JtfTMkOsnzbKOyVoDxMnUS
	FpRsSxgEza4DZ1REmuSF8WECFgKoogfnePdgIfqHypKrzUQa1CnDdcbcbNIan2pCUD6ONJ/GPTBDR
	o3JZGLcivYDwjmgNm2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPj9G-0068AI-Bq; Thu, 03 Mar 2022 10:57:30 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPj94-00686U-99; Thu, 03 Mar 2022 10:57:19 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id C476A68AFE; Thu,  3 Mar 2022 11:57:14 +0100 (CET)
Date: Thu, 3 Mar 2022 11:57:14 +0100
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
 x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
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
Message-ID: <20220303105714.GB15103@lst.de>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
 <ca748512-12bb-7d75-13f1-8d5ec9703e26@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca748512-12bb-7d75-13f1-8d5ec9703e26@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_025718_491854_9BA7ACAF 
X-CRM114-Status: GOOD (  14.06  )
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

On Wed, Mar 02, 2022 at 08:15:03AM -0500, Boris Ostrovsky wrote:
> Not for me, I fail to boot with
>
> [   52.202000] bnxt_en 0000:31:00.0: swiotlb buffer is full (sz: 256 bytes), total 0 (slots), used 0 (slots)
>
> (this is iscsi root so I need the NIC).
>
>
> I bisected it to "x86: remove the IOMMU table infrastructure" but haven't actually looked at the code yet.

Thanks. Looks like the sizing is going wrong.  Just to confirm, this is
dom0 on x86 and no special command line options?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
