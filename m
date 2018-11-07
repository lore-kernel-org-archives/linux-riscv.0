Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD5DC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:27:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53C1F2081D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:27:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="slJHHstG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53C1F2081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OKcZ79GoLE8nsN4k9fL8B7AEuteWujNdKTmnBsV7ed0=; b=slJHHstGxN9/ci
	bhgSDRCEJYxl0nIWTMFjsMPzM+alIwfLeMVSrXOcXm94o9VYP0IyEhON2LKq1+2XOE+aIsrxpnY7z
	rd3TePBYlRKI4IsrhksDyTDhIgwQoC/uzY+eURUftCfEZGsSv/OE/RxTE3qiEUrNAac9LgzfKWKRo
	EpWVpgEXOf4d9khkvhrmm6xQ6PPKM2bEwXxSsMSKJTVs2+TV8s6cumMhYmkevNenZb/Q1MRctFYts
	c/mVFtLrGiMCyxShrT9g3ABf5E1IVj3rp0vRghWHcwUAvEpJuprb9dhDV6i+Duceq/bI+/tUKG+e0
	1Wm9Akbp9fQw2gokVPxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKUPz-0004Ll-00; Wed, 07 Nov 2018 20:27:15 +0000
Received: from galois.linutronix.de ([2a01:7a0:2:106d:700::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUPv-00045O-N4; Wed, 07 Nov 2018 20:27:13 +0000
Received: from p5492fe24.dip0.t-ipconnect.de ([84.146.254.36] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1gKUPT-0007tu-1N; Wed, 07 Nov 2018 21:26:43 +0100
Date: Wed, 7 Nov 2018 21:26:42 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 2/2] mm/sparse: add common helper to mark all memblocks
 present
In-Reply-To: <724be9bb-59b6-33f3-7b59-3ca644d59bf7@deltatee.com>
Message-ID: <alpine.DEB.2.21.1811072125280.1666@nanos.tec.linutronix.de>
References: <20181107173859.24096-1-logang@deltatee.com>
 <20181107173859.24096-3-logang@deltatee.com>
 <20181107121207.62cb37cf58484b7cc80a8fd8@linux-foundation.org>
 <724be9bb-59b6-33f3-7b59-3ca644d59bf7@deltatee.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_122711_895328_BC94B54A 
X-CRM114-Status: GOOD (  14.50  )
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
Cc: linux-arch@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Stephen Bates <sbates@raithlin.com>, linux-mm@kvack.org,
 Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107202642.ZnEpBZcS0yZaGu-jBFA8P7hEOWjcQ7_GY375WwPRubU@z>

Logan,

On Wed, 7 Nov 2018, Logan Gunthorpe wrote:
> On 2018-11-07 1:12 p.m., Andrew Morton wrote:
> >> +void __init memblocks_present(void)
> >> +{
> >> +	struct memblock_region *reg;
> >> +
> >> +	for_each_memblock(memory, reg) {
> >> +		memory_present(memblock_get_region_node(reg),
> >> +			       memblock_region_memory_base_pfn(reg),
> >> +			       memblock_region_memory_end_pfn(reg));
> >> +	}
> >> +}
> >> +
> > 
> > I don't like the name much.  To me, memblocks_present means "are
> > memblocks present" whereas this actually means "memblocks are present".
> > But whatever.  A little covering comment which describes what this
> > does and why it does it would be nice.
> 
> The same argument can be made about the existing memory_present()
> function and I think it's worth keeping the naming consistent. I'll add
> a comment and resend shortly.

Actually if both names suck, then there also is the option to rename both
instead of adding a comment to explain the suckage.

Thanks,

	tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
