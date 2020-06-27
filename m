Return-Path: <SRS0=1V8E=AI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071A9C433DF
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 19:03:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D01E2207FC
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 19:03:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pWDSRIho";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rq00ouSx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D01E2207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PKD+4ybK9MzpjULyqstDYdwdvwqI5g4ra6Fx921nOQ4=; b=pWDSRIhomOHdiEhD1g7XpgZWV
	3/cVq4wbz7d8VR5Thof+tqGA1qRgPeB36uPvbaAdJx6Kw2jTlnPya29k+Y/fWp60Y5Na+S2o9euq/
	f9Vh5go3ezC77ixfuFRNR9PkmlUdXEfG4AWzqMmNrI2bLcVVF9+Imn/BtvjG5sEVdilIKn8PhuiWF
	e5BVD3Sl7Cg3Xsa7rH0iHc1mlgZKNBwBqy2Hm6lOQN1PzkEbrxfM7GTHQ+0YCz26Ych8uwBmx7acv
	8yfaNN3nuiqBRUuE/Kjjh9CeeDsyZvmANFxzVqDJEsYvasAXXATK8sqkb7IH4wIZCZtWM3gbJdtnz
	Nyua3WH8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpG6d-0007AK-Um; Sat, 27 Jun 2020 19:03:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpG6V-00078V-Sv; Sat, 27 Jun 2020 19:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OR7OBaJyU20QVLaZTPXddMLTo5rxOsqU6iEIJEupuWE=; b=rq00ouSxMdTmSFa28hDOUKTHBg
 3dXyfPXkTUDZyQHTetqsyMna5fwntHa6QKcic/h71IwcUCnGNbErGyqkiwiLcgU2nYHZh16/QaPeb
 b5zkBVG9gFL5QSc/VNDuNclsIuluvuMI/LYza+5r2JW/cLhLN6jZ5ik5eKIuodERFMabxSNfOI2Bi
 +dL26IWnzvmxsRx2Z0NmVql7PiiPOtRewW4aUiQeNyCevs8ZZkzP0faCH2uqSnyC23QLvVtj1Wi9z
 Fo+73sfYzK5rnUfqtXfFwYUwyfilRDtoIcUUPTCSGsmVmOCF5BvgZD7yS/O5QwZNMhirY3o8KlkeY
 6JIFEkYQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jpG6S-0005fe-2n; Sat, 27 Jun 2020 19:03:04 +0000
Date: Sat, 27 Jun 2020 20:03:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 4/8] asm-generic: pgalloc: provide generic
 pmd_alloc_one() and pmd_free_one()
Message-ID: <20200627190304.GG25039@casper.infradead.org>
References: <20200627143453.31835-1-rppt@kernel.org>
 <20200627143453.31835-5-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200627143453.31835-5-rppt@kernel.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jun 27, 2020 at 05:34:49PM +0300, Mike Rapoport wrote:
> More elaborate versions on arm64 and x86 account memory for the user page
> tables and call to pgtable_pmd_page_ctor() as the part of PMD page
> initialization.
> 
> Move the arm64 version to include/asm-generic/pgalloc.h and use the generic
> version on several architectures.
> 
> The pgtable_pmd_page_ctor() is a NOP when ARCH_ENABLE_SPLIT_PMD_PTLOCK is
> not enabled, so there is no functional change for most architectures except
> of the addition of __GFP_ACCOUNT for allocation of user page tables.

Thanks for including this line; it reminded me that we're not setting
the PageTable flag on the page, nor accounting it to the zone page stats.
Hope you don't mind me tagging a patch to do that on as 9/8.

We could also do with a pud_page_[cd]tor and maybe even p4d/pgd versions.
But that brings me to the next question -- could/should some of this
be moved over to asm-generic/pgalloc.h?  The ctor/dtor aren't called
from anywhere else, and there's value to reducing the total amount of
code in mm.h, but then there's also value to keeping all the ifdef
ARCH_ENABLE_SPLIT_PMD_PTLOCK code together too.  So I'm a bit torn.
What do you think?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
