Return-Path: <SRS0=fnRf=HB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8977C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Jan 2021 09:33:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C78D464DE3
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Jan 2021 09:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C78D464DE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=50o8s+ab424Bqrxn45hSVJ/tR8abeb0n29AmWBbSPs0=; b=lFfx7S6ZD3H/HhUxE5FUjcy85
	EpM6btmwuxiA2On2SHM6b5u5PCUNsRoRWkb6OtnkO4S7Lg8YK0kSV2cBY+VVyw5Joo6X/5LMzBWoC
	3vQdTC7/wr6L1PdSlpyQq+VkOBFKSMHkTDED8Dt1CUp5fPTDjPpeWt+H8Pvf/pi/5/QaiKpemzpXb
	9//KbN/otK5Mccg+KK+XWWEYKw9+/Q1K+zgjGQ9WGBx8fritgSRWTJd9+8+WUqrQye5F8QCZ5FWKJ
	xuvqYulMYbdgPNmp0CdhzXhHmuURSKirvNzDA4X66AVCtaniDWYv/RhmJmsCKJIVH4FaLYqlH2Cuk
	gJokJFvKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5mdF-0001Tk-Tk; Sat, 30 Jan 2021 09:33:30 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5mdD-0001TO-J7
 for linux-riscv@lists.infradead.org; Sat, 30 Jan 2021 09:33:28 +0000
X-Originating-IP: 92.91.220.130
Received: from [192.168.0.12] (130.220.91.92.rev.sfr.net [92.91.220.130])
 (Authenticated sender: alex@ghiti.fr)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0EDEE40008;
 Sat, 30 Jan 2021 09:33:20 +0000 (UTC)
Subject: Re: [RFC PATCH 00/12] Introduce sv48 support without relocable kernel
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@lst.de>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210104195840.1593-1-alex@ghiti.fr>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <f38979dc-9f8c-6fce-6b1b-70e5f110e14c@ghiti.fr>
Date: Sat, 30 Jan 2021 04:33:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210104195840.1593-1-alex@ghiti.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_043327_817824_7633A4B5 
X-CRM114-Status: GOOD (  26.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

On 1/4/21 2:58 PM, Alexandre Ghiti wrote:
> This patchset, contrary to the previous versions, allows to have a single
> kernel for sv39 and sv48 without being relocatable.
>                                                                                   
> The idea comes from Arnd Bergmann who suggested to do the same as x86,
> that is mapping the kernel to the end of the address space, which allows
> the kernel to be linked at the same address for both sv39 and sv48 and
> then does not require to be relocated at runtime.
>                                                                                   
> This is an RFC because I need to at least rebase a few commits and add
> documentation. The most interesting patches where I expect feedbacks are
> 1/12, 2/12 and 8/12. Note that moving the kernel out of the linear
> mapping and sv48 support can be separate patchsets, I share them together
> today to show that it works (this patchset is rebased on top of v5.10).
> 
> If we agree about the overall idea, I'll rebase my relocatable patchset
> on top of that and then KASLR implementation from Zong will be greatly
> simplified since moving the kernel out of the linear mapping will avoid
> to copy the kernel physically.
>                                                                                   
> This implements sv48 support at runtime. The kernel will try to
> boot with 4-level page table and will fallback to 3-level if the HW does not
> support it. Folding the 4th level into a 3-level page table has almost no
> cost at runtime.
>                                                                                   
> Finally, the user can now ask for sv39 explicitly by using the device-tree
> which will reduce memory footprint and reduce the number of memory accesses
> in case of TLB miss.
> 
> Alexandre Ghiti (12):
>    riscv: Move kernel mapping outside of linear mapping
>    riscv: Protect the kernel linear mapping
>    riscv: Get rid of compile time logic with MAX_EARLY_MAPPING_SIZE
>    riscv: Allow to dynamically define VA_BITS
>    riscv: Simplify MAXPHYSMEM config
>    riscv: Prepare ptdump for vm layout dynamic addresses
>    asm-generic: Prepare for riscv use of pud_alloc_one and pud_free
>    riscv: Implement sv48 support
>    riscv: Allow user to downgrade to sv39 when hw supports sv48
>    riscv: Use pgtable_l4_enabled to output mmu type in cpuinfo
>    riscv: Explicit comment about user virtual address space size
>    riscv: Improve virtual kernel memory layout dump
> 
>   arch/riscv/Kconfig                      |  34 +--
>   arch/riscv/boot/loader.lds.S            |   3 +-
>   arch/riscv/include/asm/csr.h            |   3 +-
>   arch/riscv/include/asm/fixmap.h         |   3 +
>   arch/riscv/include/asm/page.h           |  33 ++-
>   arch/riscv/include/asm/pgalloc.h        |  40 +++
>   arch/riscv/include/asm/pgtable-64.h     | 104 ++++++-
>   arch/riscv/include/asm/pgtable.h        |  68 +++--
>   arch/riscv/include/asm/sparsemem.h      |   6 +-
>   arch/riscv/kernel/cpu.c                 |  23 +-
>   arch/riscv/kernel/head.S                |   6 +-
>   arch/riscv/kernel/module.c              |   4 +-
>   arch/riscv/kernel/vmlinux.lds.S         |   3 +-
>   arch/riscv/mm/context.c                 |   2 +-
>   arch/riscv/mm/init.c                    | 376 ++++++++++++++++++++----
>   arch/riscv/mm/physaddr.c                |   2 +-
>   arch/riscv/mm/ptdump.c                  |  56 +++-
>   drivers/firmware/efi/libstub/efi-stub.c |   2 +-
>   include/asm-generic/pgalloc.h           |  24 +-
>   include/linux/sizes.h                   |   3 +-
>   20 files changed, 648 insertions(+), 147 deletions(-)
> 

Any thought about the idea ? Is it going in the right direction ? I have 
fixed quite a few things since I posted this so don't bother giving this 
patchset a full review.

Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
