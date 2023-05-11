Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18FAC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 22:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjvSpACYeJhXwYCt20Uof335TPeroKunvq9DbQacQno=; b=JmcOb12n80WiTu
	7nPPrpd0564SMyUN4gxPUzOQ6N6/zBdlFPmwjrvYWzGaXLaX/+Ig1ERp0cNcORLu64rGNN6+x6CPI
	97d6JEK0JaBbR6xhU/ZVPBy9DwPpL3GWBEhGh/daKhjfjERNkq7/13U0vl874y53zXXAYIljE+U3B
	+imooCw2CJtPjcn58jENZr0Q1L1K/j31ZfSZ0ujddP8FG4q4YsQZgyaCmJIKtPqroF4rYWmodjJku
	hZxqU6p4NmA1uEu5f9517lO1tL8n3t6fA72OSZfXwcNV3El/Ie96dVMLOntsz959RQ58/v7O06Onx
	LEcxADtQNbELSLXhvjxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEuc-00AClI-0m;
	Thu, 11 May 2023 22:37:26 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEuZ-00ACiF-0I
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 22:37:24 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-55a76ed088aso138529027b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 15:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683844637; x=1686436637;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7hKTTTuYzAS0vkkDuN/hWvEkav8P49YQtcFz2W5wMI=;
        b=leqASNj4yXDwWkS3XyfGWIhxAw4SXxeg+extgQ/D3LGDyC8VCP1/fZdCDvzoBwFKI4
         QsCpGgSaYJ3A6Zsn21DOX95W5x878ZXSFyOvGdFILF6cniMlbGpQ7kGstvh8Z0S2dYcr
         KAZan2e+K8+hIYGfwKwpNjm5N5qCVBq6paKd8Ge6TYCsDubNG0nFnc28YyshVIf+H1TB
         XtjHozhI9s8vKDiN1ralH7fr2aSIYGrsjfbuSUekrZzkfIqSGnPlfgmSzyftn9ttXqkA
         wtISLC6kLw6VjZt4HnbIKNxY1VCI8P1bODtk830M8QQedX+j6RlN/KsBHhJiNcIqK0oT
         5pFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683844637; x=1686436637;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7hKTTTuYzAS0vkkDuN/hWvEkav8P49YQtcFz2W5wMI=;
        b=iqzDCklNdeFjERCCI+es7ZEIwn/vqyEGuTBRqvQMKAm0lvifmDdPkKHTdiEjViu5As
         qyojr8JpD9WMqQs6vYc9/6uxJ3wB2TMaLYnjNIpydjEfmK1xkHAqQ9zXGmaaZwiIMrI0
         e1FQrSC4R/KP2ESVvbtLPiGYE3yS7rD6Lu/4sqUnatPCkUY8tCv1pRYwLaxDAv+tfOVR
         Ip9YeSLdLuLFACA7ZsF3MaaOK/E+YsyqDGQN03cvYLHjyHIxigZL+r6UFGIwHFfhAVWn
         2lbGu3Dn3Cg892ucwCD58z27bL+6N7ZF4IHtkQsy18BHuA4bQ5qwCG+zFHoVrcIYhw8i
         x+Ow==
X-Gm-Message-State: AC+VfDxSYP2gyhe6Owu5P5/1efmUcThuuv7CHGkEZipEviF4I2hVnrQf
	nQvqLdFx3Yb1WsIGFONgrykE3g==
X-Google-Smtp-Source: ACHHUZ5ulkW3cY83+IL8attIxR7bTyRhvIioTTYSGrJhrY5IS/y6LwBFwFzMwChvIicQOTRvegivGA==
X-Received: by 2002:a0d:d993:0:b0:559:d294:1c48 with SMTP id b141-20020a0dd993000000b00559d2941c48mr22473279ywe.24.1683844637583;
        Thu, 11 May 2023 15:37:17 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id k189-20020a0dfac6000000b0054fa5f6c0cdsm5262641ywf.53.2023.05.11.15.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:37:17 -0700 (PDT)
Date: Thu, 11 May 2023 15:37:06 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Matthew Wilcox <willy@infradead.org>
cc: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
    Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
    "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
    David Hildenbrand <david@redhat.com>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Qi Zheng <zhengqi.arch@bytedance.com>, 
    Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Helge Deller <deller@gmx.de>, John David Anglin <dave.anglin@bell.net>, 
    "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, 
    Alexandre Ghiti <alexghiti@rivosinc.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    "David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, 
    Max Filippov <jcmvbkbc@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
    x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
    linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
    sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, Michel Lespinasse <michel@lespinasse.org>
Subject: Re: [PATCH 00/23] arch: allow pte_offset_map[_lock]() to fail
In-Reply-To: <ZFz1j1slZHCQmwMJ@casper.infradead.org>
Message-ID: <5f1dd6f-1e75-8d98-3083-e1bd2163dcc6@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com> <ZFs0k2rrLPH9A/UU@casper.infradead.org> <d7f3c7b2-25b8-ef66-98a8-43d68f4499f@google.com> <ZFz1j1slZHCQmwMJ@casper.infradead.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_153723_126666_03BD77BD 
X-CRM114-Status: GOOD (  20.61  )
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

On Thu, 11 May 2023, Matthew Wilcox wrote:
> 
> I was thinking that removing CONFIG_HIGHPTE might simplify the page
> fault handling path a little, but now I've looked at it some more, and
> I'm not sure there's any simplification to be had.  It should probably
> use kmap_local instead of kmap_atomic(), though.

Re kmap_local, yes, one of the patches in the next series does make
that change.

> 
> I infer that what you need is a pte_access_start() and a
> pte_access_end() which look like they can be plausibly rcu_read_lock()
> and rcu_read_unlock(), but might need to be local_irq_save() and
> local_irq_restore() in some configurations?

Yes, except that the local_irq_restore() in PAE-like configurations
(if we need it at all) is not delayed until the pte_access_end() or
pte_unmap() - it's internal to the pte_access_start() or pte_offset_map():
interrupts only disabled across the getting of a consistent pmd entry.

Over-generalizing a little, any user of pte_offset_map() (as opposed to
pte_offset_map_lock()) has to be prepared for the ptes to change under
them: but we do need to give them something that is or was recently the
relevant page table, rather than a random page mishmashed from mismatched
pmd_low and pmd_high.

> 
> We also talked about moving x86 to always RCU-free page tables in
> order to make accessing /proc/$pid/smaps lockless.  I believe Michel
> is going to take a swing at this project.

(And /proc/$pid/numa_maps, I hope: that's even worse in some way, IIRC.)

That might be orthogonal to what I'm doing: many non-x86 architectures
already do RCU-freeing of page tables via the TLB route, but that doesn't
cover a pte_free() from retract_page_tables() or collapse_and_free_pmd().

Hugh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
