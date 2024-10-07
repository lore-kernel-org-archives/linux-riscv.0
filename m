Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C20DCFB443
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 05:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1sa9Vo2oTWyUSCXykLuImUCvNjxcFK3ngG4qHrHtyLY=; b=MXrehKCaWIhyd3
	qSEHYBKOcfzFE0HOPh9kmUPXNpgbK9REqodtJBEhYDV8SCl1J9f+ysnV/7+ArDPUZ8V6yV8Xhyn1c
	nUe/ahhRosya6mdyxHOQ98Qdckt3zl0WhYrjKPzDsLoktVrcW5J4rRog0Y05p6A+SL0JcTLKE+52m
	mlLXETh7WF5IaP1Iw264QTrQL0qGcQzVrTn0yFaAhmHKRwFItjqUBZH/bHwz0LfOVXcCLU1ir7/hv
	nzFU5NST8IINeQMMQbLYwAwMzSd0QCec66ZtkibNAw4eHzxkZRL9Fj0749OfHhMJtKly9bDnbbsZx
	pNxzovDcDVPt2bJj0uTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxgVA-00000001KCe-28Ux;
	Mon, 07 Oct 2024 05:41:48 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1sxgV5-00000001KBz-43dM;
	Mon, 07 Oct 2024 05:41:43 +0000
Date: Sun, 6 Oct 2024 22:41:43 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH v1] riscv: make ZONE_DMA32 optional
Message-ID: <ZwN0l0Y_oUfDX8jl@infradead.org>
References: <20240827113611.537302-1-vladimir.kondratiev@mobileye.com>
 <e8f6ed93-d47c-4c07-963c-8f16f498abed@ghiti.fr>
 <VI1PR09MB2333FEC324AA0B3E5F1D7F98947C2@VI1PR09MB2333.eurprd09.prod.outlook.com>
 <VI1PR09MB233370D7BD8553E7891EF46F947C2@VI1PR09MB2333.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1PR09MB233370D7BD8553E7891EF46F947C2@VI1PR09MB2333.eurprd09.prod.outlook.com>
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

On Sun, Oct 06, 2024 at 10:55:39AM +0000, Vladimir Kondratiev wrote:
> It is not necessary any RISCV platform has ZONE_DMA32.
> Platforms that not support ZONE_DMA32 should set
> CONFIG_NONPORTABLE because lack of ZONE_DMA32
> makes such platform non-portable indeed

Well, this doesn't get any more true by just irgnoring the previous
discussion and just reposting :(


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
