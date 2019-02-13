Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A179DC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 11:27:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D9BE2070D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 11:27:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aVxfWRcC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D9BE2070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6dKFjayCTh8K+4RHQQlAxUsZIni7uHf0cTVcMQbQY0=; b=aVxfWRcCqGyl7x
	t6TbJ9CR9uaW2oNUDSYt70ryskADVHzkH1ECVkdAF0p/x30QoKJY54Wy+DgbGyq2p0whfP/mFtXrG
	4Q04NZ61qQg86AjqMaIwIhvE+54g0UE5rKbDZGpUizRY2cTdwMXwYgjJ7evW4EzjAjCvvxxBBs00O
	njd3bkaLGakKn1V1/injHmtPEo2VQ+LcxizVJp7f4i3zuGz2/3EeCd/BZbQ62ervtWQ6tNALz/Bci
	Zw0KCeie1GXn/19uBIKVggT2CkTuNqWnDQxw4NS8CFYrFo4PcdI5Ct7OMmotoUwmKA8YsnbN1vwUk
	L4due/29N+iMpnISyzXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtshc-00053U-Tq; Wed, 13 Feb 2019 11:27:44 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtshT-0004ua-7S; Wed, 13 Feb 2019 11:27:36 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2EF02ABAC;
 Wed, 13 Feb 2019 11:27:31 +0000 (UTC)
Subject: Re: [PATCH] hugetlb: allow to free gigantic pages regardless of the
 configuration
To: Alexandre Ghiti <aghiti@upmem.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will.deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20190117183953.5990-1-aghiti@upmem.com>
From: Vlastimil Babka <vbabka@suse.cz>
Message-ID: <16a6209c-868b-8fd5-a70a-6e0e1ecb62d4@suse.cz>
Date: Wed, 13 Feb 2019 12:27:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190117183953.5990-1-aghiti@upmem.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_032735_417963_B18A6FCA 
X-CRM114-Status: GOOD (  15.52  )
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
Cc: hch@infradead.org, linux-riscv@lists.infradead.org,
 Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/17/19 7:39 PM, Alexandre Ghiti wrote:
> From: Alexandre Ghiti <alex@ghiti.fr>
> 
> On systems without CMA or (MEMORY_ISOLATION && COMPACTION) activated but
> that support gigantic pages, boottime reserved gigantic pages can not be
> freed at all. This patchs simply enables the possibility to hand back
> those pages to memory allocator.
> 
> This commit then renames gigantic_page_supported and
> ARCH_HAS_GIGANTIC_PAGE to make them more accurate. Indeed, those values
> being false does not mean that the system cannot use gigantic pages: it
> just means that runtime allocation of gigantic pages is not supported,
> one can still allocate boottime gigantic pages if the architecture supports
> it.
> 
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

I'm fine with the change, but wonder if this can be structured better in a way
which would remove the duplicated "if (MEMORY_ISOLATION && COMPACTION) || CMA"
from all arches, as well as the duplicated
gigantic_page_runtime_allocation_supported()

something like:

- "select ARCH_HAS_GIGANTIC_PAGE" has no conditions, it just says the arch can
support them either at boottime or runtime (but runtime is usable only if other
conditions are met)
- gigantic_page_runtime_allocation_supported() is a function that returns true
if ARCH_HAS_GIGANTIC_PAGE && ((MEMORY_ISOLATION && COMPACTION) || CMA) and
there's a single instance, not per-arch.
- code for freeing gigantic pages can probably still be conditional on
ARCH_HAS_GIGANTIC_PAGE

BTW I wanted also to do something about the "(MEMORY_ISOLATION && COMPACTION) ||
CMA" ugliness itself, i.e. put the common parts behind some new kconfig
(COMPACTION_CORE ?) and expose it better to users, but I can take a stab on that
once the above part is settled.

Vlastimil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
