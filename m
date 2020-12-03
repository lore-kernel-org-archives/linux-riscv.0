Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C841DC4361A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 23:36:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FA7F223C8
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 23:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FA7F223C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QYcydZ/gbSJO76JmVebbewWHm7NsB7fkWq9mu7uvF7I=; b=eiEmRcRFhvIA1yrcePUJPo3Dy
	YUtrDk7E9bMFOB3NsIb0uLzfVad2mZWNEoD8TkiCjl5F4iVTD7bhKbPZs2pUU9ZAA3naTcymBLsAn
	+4HRI2gR6h7MG/7pkwtBdxG64GxzRL3rJx5+j/o/vD0NG6x4u9DrJvfm+A76+Utul4uDWAsZVJZvh
	/X/sf0IGfAares0eC/X0iyDIhW3B8z2Y5ZoamQN1TvH4gAES+ibzgkVnaGqmHjBLayFJwkTy57GGd
	fPmN+3YSKJS7AOVNgR3FXtHo0AAOsjTHjTSAcICF0cdGBbtPYkFusVzSaSxaEiitF2oizU74Vw6O6
	NYuUa/nww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kky96-0002Wz-IT; Thu, 03 Dec 2020 23:36:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kky92-0002V6-5G; Thu, 03 Dec 2020 23:36:17 +0000
Date: Thu, 3 Dec 2020 15:36:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1607038573;
 bh=Pa4oRfRRHtvNG6DkXhfCABnpMt5dHNY/S5ZIo3xu0I8=;
 h=From:To:Cc:Subject:In-Reply-To:References:From;
 b=kuOijURD2S/LKZN7m2xU1Yqs8aTgSaE+8PAXCjOUF+k6SmWXgnBX1a127MGk9xsxD
 Zehgx/bS+bttrniAwVRGaqKRk/HeHmkpC5g5mw+66gde6sKC1WxOhrIrOWZsRz9QI2
 m7IWOOo+Ox/qds8Kx515xXzlhgz0bQmTT4jC/P9M=
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v14 04/10] set_memory: allow querying whether
 set_direct_map_*() is actually enabled
Message-Id: <20201203153610.724f40f26ca1620247bc6b09@linux-foundation.org>
In-Reply-To: <20201203062949.5484-5-rppt@kernel.org>
References: <20201203062949.5484-1-rppt@kernel.org>
 <20201203062949.5484-5-rppt@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_183616_303184_1903D34C 
X-CRM114-Status: GOOD (  18.19  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu,  3 Dec 2020 08:29:43 +0200 Mike Rapoport <rppt@kernel.org> wrote:

> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> On arm64, set_direct_map_*() functions may return 0 without actually
> changing the linear map. This behaviour can be controlled using kernel
> parameters, so we need a way to determine at runtime whether calls to
> set_direct_map_invalid_noflush() and set_direct_map_default_noflush() have
> any effect.
> 
> Extend set_memory API with can_set_direct_map() function that allows
> checking if calling set_direct_map_*() will actually change the page table,
> replace several occurrences of open coded checks in arm64 with the new
> function and provide a generic stub for architectures that always modify
> page tables upon calls to set_direct_map APIs.
> 
> ...
>
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -22,6 +22,7 @@
>  #include <linux/io.h>
>  #include <linux/mm.h>
>  #include <linux/vmalloc.h>
> +#include <linux/set_memory.h>
>  
>  #include <asm/barrier.h>
>  #include <asm/cputype.h>
> @@ -477,7 +478,7 @@ static void __init map_mem(pgd_t *pgdp)
>  	int flags = 0;
>  	u64 i;
>  
> -	if (rodata_full || debug_pagealloc_enabled())
> +	if (can_set_direct_map())
>  		flags = NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;

Changes in -next turned this into

	if (can_set_direct_map() || crash_mem_map)



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
