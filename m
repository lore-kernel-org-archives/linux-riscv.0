Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B25C11F64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 19:32:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17BA36140D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 19:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17BA36140D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QnWKrzoAL/mJbbp/Gqj6B4S0U1v1ym3TibQzwJ5Kc0=; b=1Y9Ztnsb1HAPuOqSsCo+79H8ss
	1gD3dSVG4AsHm1F0MzfwBdjK1fHHpdOEzSoBSibL7k8YWf6qDKKiQDolDqWTlaG+RTjNGyTZ96zq0
	hFAY1LqMplmvkQsnGS7lNEvaO+wJk+blOJpCiecoAJYYvtIXqSYtLRQMLPWhQVOhM+YA2EQb24EoY
	cNYPhjEQsoPpk4ekoydBAeRG5EOZLexVYIA2xZ5BSb4lfon68TU87m90KzoBD/QdspLc7DI7yGidz
	wOZLQonVow44LEfWHzsC4sm0SNhkq9TB3erWdh42qiEhz5IJpmk1s5AnYUEbxGFOVk0LA1ksmRmaA
	0w01qrzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz2PD-000seB-VD; Thu, 01 Jul 2021 19:31:23 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz2PA-000sbg-4A
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 19:31:22 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id F0ED4240009;
 Thu,  1 Jul 2021 19:31:13 +0000 (UTC)
Subject: Re: [PATCH v8 0/2] Map the kernel with correct permissions the first
 time
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 jszhang@kernel.org, Christoph Hellwig <hch@infradead.org>,
 zong.li@sifive.com, anup@brainfault.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <mhng-0f00c990-c928-4a9d-ab2c-5036b29b2861@palmerdabbelt-glaptop>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <62e6dfc9-8d8d-d1df-1847-d6b8ad681eab@ghiti.fr>
Date: Thu, 1 Jul 2021 21:31:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <mhng-0f00c990-c928-4a9d-ab2c-5036b29b2861@palmerdabbelt-glaptop>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_123120_508341_F4D3FE10 
X-CRM114-Status: GOOD (  24.35  )
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

Le 1/07/2021 =E0 07:37, Palmer Dabbelt a =E9crit=A0:
> On Thu, 24 Jun 2021 05:00:39 PDT (-0700), alex@ghiti.fr wrote:
>> The kernel permissions are fixed after the kernel page table is created:
>> avoid that by mapping the kernel 'correctly' the first time.
>>
>> Patch 1 introduces a new helper to set kernel mapping permissions while
>> avoiding all the casts when using set_memory_* API.
>>
>> Patch 2=A0 is the bulk of this work and deals with mapping the kernel wi=
th
>> the right permissions.
>>
>> Changes in v8:
>> * Move set_kernel_memory inline function into set_memory.h header as =

>> suggested
>> =A0 by Jisheng
>> * Make set_kernel_memory arguments name consistent
>>
>> Changes in v7:
>> * Split long lines and reintroduce parameters names of set_kernel_memory
>> =A0 callback, as suggested by Christoph
>> * Make set_kernel_memory __always_inline as suggested by Christoph
>> * Change 64b spelling into 64-bit, as suggested by Christoph
>>
>> Changes in v6:
>> * load_sz was placed in init section but is now used in kernel address
>> =A0 conversions macros, so remove this attribute.
>>
>> Changes in v5:
>> * Remove non-relevant commits to this patchset that raised issues
>> * Make load_sz non-static as it is used in kernel address conversions
>> =A0 macros
>> * Rebased on top for-next
>>
>> Changes in v4:
>> * Add patch 1 as noted by Jisheng
>> * Changes patch 2 title as suggested by Anup
>> * Add Reviewed-by from Anup
>>
>> Changes in v3:
>> * Add a patch that factorizes kernel address conversions
>> * Add a helper called set_kernel_memory in its own patch, as suggested by
>> =A0 Christoph
>> * Prefer IS_ENABLED over #ifdef, as suggested by Christoph
>> * Split overly long lines, as suggested by Christoph
>> * Simplify kernel mapping by mapping ALL text as readonly and taking =

>> advantage
>> =A0 of already present code that enables write for init text before
>> =A0 free_initmem_default.
>>
>> Changes in v2:
>> * Rebased on top of for-next (and "riscv: mm: fix build errors caused by
>> =A0 mk_pmd()")
>> * Get rid of protect_kernel_linear_mapping_text_rodata as suggested by
>> =A0 Jisheng
>> * Improve code in general compared to previous RFC
>>
>> Alexandre Ghiti (2):
>> =A0 riscv: Introduce set_kernel_memory helper
>> =A0 riscv: Map the kernel with correct permissions the first time
>>
>> =A0arch/riscv/include/asm/page.h=A0=A0=A0=A0=A0=A0 |=A0 13 +++-
>> =A0arch/riscv/include/asm/sections.h=A0=A0 |=A0 17 +++++
>> =A0arch/riscv/include/asm/set_memory.h |=A0 24 ++++--
>> =A0arch/riscv/kernel/setup.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 12 +--
>> =A0arch/riscv/mm/init.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 1=
12 ++++++++++++----------------
>> =A05 files changed, 97 insertions(+), 81 deletions(-)
> =

> I had what looks to be two earlier versions of these patches on =

> for-next.=A0 I've fixed that up, but there were some merge conflicts. Let =

> me know if there were any issues, but it's really getting too late in =

> the cycle to be rebasing so I'd prefer just a fixup.
> =


The first 2 patches:

riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED
riscv: Simplify xip and !xip kernel address conversion macros

should *not* be merged as they assume the DRAM physical base address is =

0x8000_0000 for *all* rv64 chips. I have another patchset coming to =

replace those 2 patches.

Alex

> Thanks!
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
