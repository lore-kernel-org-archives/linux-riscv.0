Return-Path: <SRS0=17fP=LL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DFDC49361
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 12:09:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4D7161159
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 12:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4D7161159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Au6kAurqi/H6C5qJK9HsO0oLQRQu04d3aeDyfz8c/w=; b=wE06o/O80SZg+llKACmxuWWY3V
	nb9qDeSdL4DaEZfu2sgFJnUPCk01h65q9S0nRJYdvpmgkG+8BBXUFOZ4KMOVxuEbNsstWExuTwZy9
	9gq7JAoWBkWIP46vgi9I7P0HwMYwkq49rhaSdgm7i4ZDcdsVa7tgDBnDApm3uK3lJN5EkH6TAQGLp
	Katia28pDn9TKcGUVz5Hm0SAbSsIt0VDkvVuWY/yAsDPE/1i/wLpavZWw2HQVfCRphvYr1dgKLFmE
	0OpcfHn5Edm+V9v2cJ0tGDcf/ZlqfbssXN5giafgz5bLjZiU3RFaJG8HyhWVf9rsMOelTDurVigR8
	K9BuJ7lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltqp5-00ADlv-Hb; Thu, 17 Jun 2021 12:08:39 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltqp1-00ADkB-RB
 for linux-riscv@lists.infradead.org; Thu, 17 Jun 2021 12:08:37 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C9012C0013;
 Thu, 17 Jun 2021 12:08:28 +0000 (UTC)
Subject: Re: [PATCH v5 0/2] riscv: Map the kernel with correct permissions the
 first time
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210617120124.1752541-1-alex@ghiti.fr>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <3dbfd72c-6d51-5ae6-3e91-49ee52eed5bd@ghiti.fr>
Date: Thu, 17 Jun 2021 14:08:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617120124.1752541-1-alex@ghiti.fr>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_050836_083642_CF5A54BC 
X-CRM114-Status: GOOD (  20.32  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le 17/06/2021 =E0 14:01, Alexandre Ghiti a =E9crit=A0:
> The kernel permissions are fixed after the kernel page table is created:
> avoid that by mapping the kernel 'correctly' the first time.
>       =

> Patch 1 introduces a new helper to set kernel mapping permissions while
> avoiding all the casts when using set_memory_* API.
>                                                                          =
         =

> Patch 2  is the bulk of this work and deals with mapping the kernel with
> the right permissions.
> =

> Changes in v5:
> * Remove non-relevant commits to this patchset that raised issues
> * Make load_sz non-static as it is used in kernel address conversions
>    macros
> * Rebased on top for-next
> =

> Changes in v4:
> * Add patch 1 as noted by Jisheng
> * Changes patch 2 title as suggested by Anup
> * Add Reviewed-by from Anup
>                                                                          =
         =

> Changes in v3:
> * Add a patch that factorizes kernel address conversions
> * Add a helper called set_kernel_memory in its own patch, as suggested by
>    Christoph
> * Prefer IS_ENABLED over #ifdef, as suggested by Christoph
> * Split overly long lines, as suggested by Christoph
> * Simplify kernel mapping by mapping ALL text as readonly and taking adva=
ntage
>    of already present code that enables write for init text before
>    free_initmem_default.
>                                                                          =
         =

> Changes in v2:
> * Rebased on top of for-next (and "riscv: mm: fix build errors caused by
>    mk_pmd()")
> * Get rid of protect_kernel_linear_mapping_text_rodata as suggested by
>    Jisheng
> * Improve code in general compared to previous RFC
> =

> Alexandre Ghiti (2):
>    riscv: Introduce set_kernel_memory helper
>    riscv: Map the kernel with correct permissions the first time
> =

>   arch/riscv/include/asm/page.h       |  13 +++-
>   arch/riscv/include/asm/sections.h   |  17 +++++
>   arch/riscv/include/asm/set_memory.h |  13 ++--
>   arch/riscv/kernel/setup.c           |  11 +--
>   arch/riscv/mm/init.c                | 108 ++++++++++++----------------
>   arch/riscv/mm/pageattr.c            |  10 +++
>   6 files changed, 91 insertions(+), 81 deletions(-)
> =


@Palmer: I removed the previous patchset (v4) you took in for-next and =

cherry-picked those 2 while fixing conflicts, so if you do that in that =

order, you should not have any problem :)

Thanks,

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
