Return-Path: <SRS0=216k=BM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C7DC433DF
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2020 18:01:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6AF120738
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2020 18:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VKLSHr0Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uknpQ4DM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6AF120738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ue2SYQupT1/SVeTtkWKo20Q0VsU0zNEXR0hY1BLb4fc=; b=VKLSHr0Z2cIqZCiy1iBoMdkVC
	RjzRwK7tPjxMUqQpo5p+cYE3xRhhMeC3O2xxiaogozXV7SD529cIJ0Lt2tDR7GfmYI2AH6FBbm4pv
	kTHI1F75Uf3/Do2XpHgevQ1oQdm2D2GDmyP4iJ+/7jMg46a3ZYaHrDYlz/+vsm3X0Pz9hLc/tPfWE
	e17NeH8qvGtIO0ld6qCAtcCl+v6pmFLoQ0mQF6cWxM1PcJv+M0nL1lLrxKIqFJdaEcGt1/nSZK9rT
	ERmNgTxoixJARWoPQfryg7BgQuoG+joeEXMzTtrKY1+bH/gyq0nyLvEY0LKa5g0dMMcd0nceVf/hs
	nradESnDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2IIT-0008DJ-1r; Sun, 02 Aug 2020 18:01:21 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2IIP-0008BT-NV; Sun, 02 Aug 2020 18:01:18 +0000
Received: by mail-ej1-x643.google.com with SMTP id d6so22500036ejr.5;
 Sun, 02 Aug 2020 11:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cWqP425OZ00Oz4x2XaCg5sL4Bi3BuFHBZ9fhbstEoPo=;
 b=uknpQ4DMxgwRI+7RXzKKaxSHSsHT4JX+qN+G3Zw62I+z7K+v0oM82e+YsM5L2ibFwZ
 ZtPLnfzJt8IFqkH991n5kK4zcZ2/fsZTMmLNrFK7hPe3auCniFr0qepP8+PKlvq/+X4Y
 6FOXivLK6+BH8tYzSACnWRFDv80Xb8yKxgJKQm36t4gslbAugHoQp37YMrGD2IIEXvEW
 lHLgWw9HHo88+yhhI1SsXvM9DHpmveOnmArUrLkNHDmUxgOR5yVJEiJKHqYfS7BI8LbU
 2xANFxjuEWzWjHDwLiCM886yebnNr5jnEbr0RMGk15mMx04KzIUKhAfWZe7dw+zaroY/
 roWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=cWqP425OZ00Oz4x2XaCg5sL4Bi3BuFHBZ9fhbstEoPo=;
 b=k1Lnpkn3qic30B+fEjxsJlIgP7X+YXrjU12aJ6NSv9B+++OJsxS8927vj49c+o3Jez
 UFYddJbCzKVnP5XZD5apHy/P7dmR3crvEylQ0/nIIu3Wn9UebvhLC6W6DRiqNUQqwTbX
 dgskfW2Ligp0Ijw52N4L3kvgdK6Iv2S4uQHVCDvElyPODLTAguOxmRsnmucABlHGHMUM
 l0dm7X6Oo0xTZY7DBGP/ks1gcW7uCH4QH19Indz0JqClHTUfmOMuI6xzbYFRrg1Fdldp
 js0zziz2jKtMXSvNPdncAUxkY5p4LJWsPiIc7+feyrFqxaazDxq+LDjwSbaex9/u1fiJ
 3EYg==
X-Gm-Message-State: AOAM531ku18MEpGDVL8udgrMuHESXL+DIbr2s0VuW2lxN5r5T9iUdtGO
 OZgkhj1cJfB7SCcjxO/rJss=
X-Google-Smtp-Source: ABdhPJzKJVSrfGoQ7+sK5UMaqi5wNpNE5CXoSPOw/FVAw4VikTzayUXH2AGSuVR6AmkbWWniCTFE/A==
X-Received: by 2002:a17:906:c187:: with SMTP id
 g7mr13929214ejz.108.1596391275076; 
 Sun, 02 Aug 2020 11:01:15 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id t19sm14191760edw.63.2020.08.02.11.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 11:01:13 -0700 (PDT)
Date: Sun, 2 Aug 2020 20:01:10 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 13/17] x86/setup: simplify initrd relocation and
 reservation
Message-ID: <20200802180110.GA86614@gmail.com>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-14-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-14-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_140117_855130_8F643CC7 
X-CRM114-Status: GOOD (  15.26  )
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
> Currently, initrd image is reserved very early during setup and then it
> might be relocated and re-reserved after the initial physical memory
> mapping is created. The "late" reservation of memblock verifies that mapped
> memory size exceeds the size of initrd, the checks whether the relocation
> required and, if yes, relocates inirtd to a new memory allocated from
> memblock and frees the old location.
> 
> The check for memory size is excessive as memblock allocation will anyway
> fail if there is not enough memory. Besides, there is no point to allocate
> memory from memblock using memblock_find_in_range() + memblock_reserve()
> when there exists memblock_phys_alloc_range() with required functionality.
> 
> Remove the redundant check and simplify memblock allocation.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Assuming there's no hidden dependency here breaking something:

  Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
