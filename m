Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D54C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Mar 2022 22:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77++7LVoMpahba9dnPjyH/K2sGRePxMof7Ps6ND9JbU=; b=MnVYIWLw1Asz7U
	T+dO+41DgXYmq6pNujS44TaFeBi+/5K+4xiM6ZWTNZrpPrk7kY4RQpqaU5OuLQGr93VERuEmmAI5n
	FgXtGCqZitT9JuDq9M0SdbnQzRCKfzMfhKRctMRdhdbFztOg2c0y43jBNxueTbTQmqmpWVN+TpBmb
	vYVki1LRqbYXd9VJs26y0XMpjRBwR9mkcV+f7IEaY1t65NQFkNTx3YKxa3t36weF+CbREBmerNe8h
	FTMyR8CLRqCZ+50e4MGQV1hxN3WvA+Fiijn0QGaPTkCxJtdIqqqxKkXYrsdibaexcUOk4cTuFkyie
	NFMOQyb3vrsbIZ5nnLsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPuGb-007zjm-IA; Thu, 03 Mar 2022 22:49:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPuGN-007zfx-6o; Thu, 03 Mar 2022 22:49:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF430B826F7;
 Thu,  3 Mar 2022 22:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF27C004E1;
 Thu,  3 Mar 2022 22:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646347770;
 bh=8T7CokGxWBKJfPW1pG0VCMscny/1l39AXb6Fw4feFiI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=mDE8XGmJRPXC3FhUExxfC/Tg8r8q5kqje46aVpKcSpgATjCrTOmm8dyL5+N0ARFUl
 igEkDLka8/5AR112e4UmftTK6LTw6MIVEq72/1WbVxD/BN6jvq1CQNSmYNX2eOZkoM
 C7Y6r4k/M1DH2K4tAUOZ5dfMEE8n9On9bbDAQYejM/m/pVednlfOiQ+0ILLxk+xuq6
 0Hivc3idTv5Og15E95hL8KOwRNZ6gfWfd8YTyoWKgbowpFGJ7UwyLwEnr/Ub/zQ8kx
 OW2VcyhCSn0JN1ypiUZLYah5Kofhllw9xygmCFN3oPTfqf6bSdXRFiDe95KnoglrOU
 yMQm9xneH86Yg==
Date: Thu, 3 Mar 2022 14:49:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christoph Hellwig <hch@lst.de>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
 iommu@lists.linux-foundation.org, x86@kernel.org, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
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
In-Reply-To: <20220303105931.GA15137@lst.de>
Message-ID: <alpine.DEB.2.22.394.2203031447120.3261@ubuntu-linux-20-04-desktop>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
 <20220302081500.GB23075@lst.de>
 <alpine.DEB.2.22.394.2203021709470.3261@ubuntu-linux-20-04-desktop>
 <20220303105931.GA15137@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_144935_446132_E1A91ABB 
X-CRM114-Status: GOOD (  13.15  )
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

On Thu, 3 Mar 2022, Christoph Hellwig wrote:
> On Wed, Mar 02, 2022 at 05:25:10PM -0800, Stefano Stabellini wrote:
> > Thinking more about it we actually need to drop the xen_initial_domain()
> > check otherwise some cases won't be functional (Dom0 not 1:1 mapped, or
> > DomU 1:1 mapped).
> 
> Hmm, but that would be the case even before this series, right?

Before this series we only have the xen_swiotlb_detect() check in
xen_mm_init, we don't have a second xen_initial_domain() check.

The issue is that this series is adding one more xen_initial_domain()
check in xen_mm_init.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
