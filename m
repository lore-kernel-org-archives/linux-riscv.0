Return-Path: <SRS0=216k=BM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B222C433DF
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2020 18:03:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08AB420738
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2020 18:03:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F+0XUQJD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NClt20d7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08AB420738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rdy/N9eX+RUe0xLLs5Srd7Qgu13xne7hrAI1uBw+q4A=; b=F+0XUQJDHpQIPq4uOndHQHAnV
	ot9JvdLFgEp1HSEz66srRKG1tCStcxNkegYu+cst9RamPTDoCv4ntKr2rhyGrCcscmy2d0tOGpOKV
	UaBFr496UZlxyt1PN7IthXUoH4tbYNOVji4FwMaunbtJjBHGDmUhEp3TU/VKw0b6a2rFzKcR7Ysha
	263v0rZ4sNgUKc5iY+IUeGIkTmsisgCla+Q1+jckN8ZSfNF6DUPkvzcgQ/qHdwpQPNIgv0vIooWRv
	f0nEj3DDM+NwywgtXh/b9Rfzgv2DD2rnacp9AIyO7xkZhkLtadnh23epOkVp7mn46OmU4zMGZzvjW
	gXLQI6/2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2IKJ-00009H-Hl; Sun, 02 Aug 2020 18:03:15 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2IKD-00005u-K8; Sun, 02 Aug 2020 18:03:10 +0000
Received: by mail-ej1-x643.google.com with SMTP id a21so36327856ejj.10;
 Sun, 02 Aug 2020 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fQZKbY0rONiHjM83HibQy63AEJaxpKeGQhQtY04gDSU=;
 b=NClt20d7Ft+K6FkgUCUu4JaE3tIZQCut3LntjJUJhXUsmJc9/hAN8f1uhRfdf1xDS4
 v+mVxDX9o4kozVR+Ah8Xum0mBupoLJJ8sGRFuq+zGUPap92vHCw3QWRVbrRdpExOLg1f
 PfYSYoa+08lkV+ejUHsbzm11vb6ZXDx9wG5OH/PIC6kGD+/IwmcMBK0f+S9Q47Ilfp0r
 CnDK0w5UJZcBtyEbi0uelKFQBUpbqi9svF4nCggxxWbCeGrL/RSClOw7dY42O+RKurT4
 SeQmDc1qACQRwd/qkF4Bl6+EBF1g484NpzCeNGAZebTMM88+MrzhcW/7+ogo+dclYvqf
 xJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=fQZKbY0rONiHjM83HibQy63AEJaxpKeGQhQtY04gDSU=;
 b=m2zdTR+uohM3TR8xWTl5b/YZpG5Kkp4ehi81HwWT9LvpZ3Nxc5CyNL0NpHaseI2MyP
 ed6sMxSEAhB33Ki4FkXJyHiIiQnl9Cil+BnZ1zlhW8wz6VHzfRsWVeVfAxraSBQyHzoq
 mFHz1sTGIFPcg8DiKewL2BmexLArALnr0bThzZePTCTGFG89Ujcip+zWRbIARVCYbZci
 yIIllheUnBLoWEcby8IaRrn5dNttee+30+N+WD5Zvldzno4t+e5OFJmlx8d6Or1NSagC
 9NKqXZVEsho5K6a0j+g/lJWcDTbeYO4PfP90iiYGcxQvXJ3gAL8wkuWOjgc+kb3m4Ocj
 JmIQ==
X-Gm-Message-State: AOAM532ojNzpTBspl3cc0+5C3RQWxIkiMif0zDTFl1Zoe0YH8oTH/Phy
 t7hTpauyDU9n9RKTe/goUoU=
X-Google-Smtp-Source: ABdhPJwRVVa9oTHFz53Gep6kufj7aL7kFTxC9FLC9t+X6tOc6fXoy+b82cv+AC/Z1BhRkxvbjIG1Og==
X-Received: by 2002:a17:907:94ce:: with SMTP id
 dn14mr12944760ejc.351.1596391388538; 
 Sun, 02 Aug 2020 11:03:08 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id x1sm13599477ejc.119.2020.08.02.11.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 11:03:07 -0700 (PDT)
Date: Sun, 2 Aug 2020 20:03:04 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 17/17] memblock: use separate iterators for memory and
 reserved regions
Message-ID: <20200802180304.GC86614@gmail.com>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-18-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-18-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_140309_679984_2992B8BD 
X-CRM114-Status: GOOD (  14.58  )
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


* Mike Rapoport <rppt@kernel.org> wrote:

> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> for_each_memblock() is used to iterate over memblock.memory in
> a few places that use data from memblock_region rather than the memory
> ranges.
> 
> Introduce separate for_each_mem_region() and for_each_reserved_mem_region()
> to improve encapsulation of memblock internals from its users.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  .clang-format                  |  3 ++-
>  arch/arm64/kernel/setup.c      |  2 +-
>  arch/arm64/mm/numa.c           |  2 +-
>  arch/mips/netlogic/xlp/setup.c |  2 +-
>  arch/x86/mm/numa.c             |  2 +-
>  include/linux/memblock.h       | 19 ++++++++++++++++---
>  mm/memblock.c                  |  4 ++--
>  mm/page_alloc.c                |  8 ++++----
>  8 files changed, 28 insertions(+), 14 deletions(-)

The x86 part:

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
