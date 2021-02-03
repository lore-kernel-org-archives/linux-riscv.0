Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70640C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 03:05:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28EA161606
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 03:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28EA161606
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=i1Dn8HRSdmZ46Acl91aAJotzlufvWFhPPtwKxnCS4qA=; b=v5SMFwIUX7Zy6UL6Av3LIhil/
	FPIouiPftTEwOinbQAt+lkrCElp9aLqBBBhtRsfU84W9YadoaRQN1B4+mJ3+cYKrrM5LlAGx8ruR7
	w5yyRsI4eMd/vcNa4/vZkVUBxP+wKEpKuonOqYQM13lKkzfN8UT6yMLg29bixdJWKSluBYy2I9UTS
	1mOJbIuVRZmdbvRIx5KZ/wt68QkxJr0iuE1EJy4fqTR0BChvDT5ns+rO3eS+2HxpfmxPulj6B0zk6
	OurCHRpOn++pV9vWcIJewemQ9MTSqPpOPaMIMJbaY8aYiuzivLEPS9IzYPJrBlllDeeLwUtdFa+XW
	SBu/FQomA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l78TQ-0008CS-Dm; Wed, 03 Feb 2021 03:04:56 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l78TN-00089d-PF
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 03:04:54 +0000
Received: by mail-pg1-x52b.google.com with SMTP id s23so15027932pgh.11
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 19:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Vdh1Qq63m3XfmV6DImv16T62V42d9pjMQXcqf3Ym7EI=;
 b=wgBkFphGweD3WECMTHTmbOH4w02odKqMUOdnQM3s7BMucZQ6IIzBeW7ZeyOq+iZ4kB
 wGo9RbJlt91NeM+RFug+FuigT1br4iUJD1XRBbLgwqpiEYiph8kX8ZDK1MPFcwAz7Y0L
 sNwZdy79RqP/gxQr+bCa0iYka6cCIunrnfrkrI8TmJE3wHBNq7jXaW4eWd+N+P9zAJcy
 ci4Dex33qOWS7OBKeXfnx1BVBimDM/qJzmQrsM0Pl7WQDt48lKnbl2FjvmZQqMNAV8r6
 KHkx4Ui8jlzbsHtJPl0xn88GCpFThOZPPHBhR61MQygy4rks7yJ026chqYViX0T7eSFL
 sAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Vdh1Qq63m3XfmV6DImv16T62V42d9pjMQXcqf3Ym7EI=;
 b=EdSbiieHanqDGEk18qZSH/kK80Atr5oxttOtZeMKoH1kF5jUFrsmq+IDJtVnqkCjtt
 +xGVXGjcaH2wDlKu4dwSTqo0GNnS9cUV8Xo97UOmmAn4PSP2mByF3WKW5ol/wE9xa7AG
 jzoLVwDCYNjo2CWW/Zt1TJ8tvw2hZbevzjt+ZjJR1NKsvVU/GDwuhXIyyOaSnw2l9zTQ
 ks0t0S5yJ+oorumc0GLzDQctgcYFKcuAFYWDlHN4OyQOrc08/1u/CTN0ggA3suYzJ4VT
 i6Ld6tZ0cRW4wuLk9pLe7+YgfWcW2fh2w4FuMbO5PkJKpg/OQk3dR5ty/cLjBOSlPwXB
 7Fmg==
X-Gm-Message-State: AOAM5322PELjcI/B2RxaZF6L+mBxDdawaOw4QLmeVsig8E92ETCCh34y
 L+JsOw1V0aH9aw+1T7c83LHfMA==
X-Google-Smtp-Source: ABdhPJyuyGSBM/5g+/5Iuy++F6uNnW110xi5tioCbX0ogE3WZP9UD91lzEs7Nrq937k1kDrynd8ykw==
X-Received: by 2002:a63:4444:: with SMTP id t4mr1256237pgk.329.1612321486466; 
 Tue, 02 Feb 2021 19:04:46 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id lf4sm334800pjb.0.2021.02.02.19.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 19:04:45 -0800 (PST)
Date: Tue, 02 Feb 2021 19:04:45 -0800 (PST)
X-Google-Original-Date: Tue, 02 Feb 2021 18:39:17 PST (-0800)
Subject: Re: [RFC PATCH 00/12] Introduce sv48 support without relocable kernel
In-Reply-To: <f38979dc-9f8c-6fce-6b1b-70e5f110e14c@ghiti.fr>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-68df8416-8592-48e2-9040-56135ff3bc1d@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_220453_874984_65D74C35 
X-CRM114-Status: GOOD (  28.81  )
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
Cc: linux-arch@vger.kernel.org, linux-efi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, anup@brainfault.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, ardb@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 30 Jan 2021 01:33:20 PST (-0800), alex@ghiti.fr wrote:
> Hi Palmer,
>
> On 1/4/21 2:58 PM, Alexandre Ghiti wrote:
>> This patchset, contrary to the previous versions, allows to have a single
>> kernel for sv39 and sv48 without being relocatable.
>>
>> The idea comes from Arnd Bergmann who suggested to do the same as x86,
>> that is mapping the kernel to the end of the address space, which allows
>> the kernel to be linked at the same address for both sv39 and sv48 and
>> then does not require to be relocated at runtime.
>>
>> This is an RFC because I need to at least rebase a few commits and add
>> documentation. The most interesting patches where I expect feedbacks are
>> 1/12, 2/12 and 8/12. Note that moving the kernel out of the linear
>> mapping and sv48 support can be separate patchsets, I share them together
>> today to show that it works (this patchset is rebased on top of v5.10).
>>
>> If we agree about the overall idea, I'll rebase my relocatable patchset
>> on top of that and then KASLR implementation from Zong will be greatly
>> simplified since moving the kernel out of the linear mapping will avoid
>> to copy the kernel physically.
>>
>> This implements sv48 support at runtime. The kernel will try to
>> boot with 4-level page table and will fallback to 3-level if the HW does not
>> support it. Folding the 4th level into a 3-level page table has almost no
>> cost at runtime.
>>
>> Finally, the user can now ask for sv39 explicitly by using the device-tree
>> which will reduce memory footprint and reduce the number of memory accesses
>> in case of TLB miss.
>>
>> Alexandre Ghiti (12):
>>    riscv: Move kernel mapping outside of linear mapping
>>    riscv: Protect the kernel linear mapping
>>    riscv: Get rid of compile time logic with MAX_EARLY_MAPPING_SIZE
>>    riscv: Allow to dynamically define VA_BITS
>>    riscv: Simplify MAXPHYSMEM config
>>    riscv: Prepare ptdump for vm layout dynamic addresses
>>    asm-generic: Prepare for riscv use of pud_alloc_one and pud_free
>>    riscv: Implement sv48 support
>>    riscv: Allow user to downgrade to sv39 when hw supports sv48
>>    riscv: Use pgtable_l4_enabled to output mmu type in cpuinfo
>>    riscv: Explicit comment about user virtual address space size
>>    riscv: Improve virtual kernel memory layout dump
>>
>>   arch/riscv/Kconfig                      |  34 +--
>>   arch/riscv/boot/loader.lds.S            |   3 +-
>>   arch/riscv/include/asm/csr.h            |   3 +-
>>   arch/riscv/include/asm/fixmap.h         |   3 +
>>   arch/riscv/include/asm/page.h           |  33 ++-
>>   arch/riscv/include/asm/pgalloc.h        |  40 +++
>>   arch/riscv/include/asm/pgtable-64.h     | 104 ++++++-
>>   arch/riscv/include/asm/pgtable.h        |  68 +++--
>>   arch/riscv/include/asm/sparsemem.h      |   6 +-
>>   arch/riscv/kernel/cpu.c                 |  23 +-
>>   arch/riscv/kernel/head.S                |   6 +-
>>   arch/riscv/kernel/module.c              |   4 +-
>>   arch/riscv/kernel/vmlinux.lds.S         |   3 +-
>>   arch/riscv/mm/context.c                 |   2 +-
>>   arch/riscv/mm/init.c                    | 376 ++++++++++++++++++++----
>>   arch/riscv/mm/physaddr.c                |   2 +-
>>   arch/riscv/mm/ptdump.c                  |  56 +++-
>>   drivers/firmware/efi/libstub/efi-stub.c |   2 +-
>>   include/asm-generic/pgalloc.h           |  24 +-
>>   include/linux/sizes.h                   |   3 +-
>>   20 files changed, 648 insertions(+), 147 deletions(-)
>>
>
> Any thought about the idea ? Is it going in the right direction ? I have
> fixed quite a few things since I posted this so don't bother giving this
> patchset a full review.

My only real issue was the relocation stuff, which appears to be fixed.  I 
haven't had the time to look at the patches, but it wouldn't hurt to send 
another revision.  The best bet might be to just wait until 5.11 and send on 
top of that, it's too late for this one anyway and that'll be a stable base to 
test from.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
