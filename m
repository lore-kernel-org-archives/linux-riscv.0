Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2899CC6B19
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 15:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRjdvEsXZ4+tiUV38JDMlncPwfp+xXndMF1ZfzB+hX0=; b=ZRqoF0Zb7mlgX9
	204Np+Yx4+HpTpCFh4+ncYSvNbR8b3JLqYhnj8jp0VMx100P9YBIDNOvOz02S1yVfebEpUru4gw93
	IUf/J+45Cn6XcKRwf9KkET0CKgUJA8+v/p9Io9NuCmzAednJvTrOrcJFyW7NaAQIsF0Rzd9CMUbau
	GKR0G7GoWDJ6LBgCsQvbA1Hy+R8EHGKG/L2uhi2lc6Zy56mZcAYm88keQDAG+qPACvt7XWtQINxA9
	UbW8vU9xjYwoTodW+SsVehJnjm07I9qpav5p29eYKitjxZ/8J2PQztypV6YWOPV2sL4ZrhpALKWhI
	1YWcL6GidnnzfdyFiarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGei9-0000000DPVW-1VMO;
	Tue, 13 Oct 2026 15:46:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGei5-0000000DPTf-3Mii;
	Tue, 13 Oct 2026 15:46:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 210DA1650;
	Tue, 13 Oct 2026 08:46:33 -0700 (PDT)
Received: from [10.57.13.106] (unknown [10.57.13.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C3783FA32;
	Tue, 13 Oct 2026 08:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791906396; bh=0+SkemdQ5RdIVSDhFwk1CDFjL1ey9nZZXcddJZzDyn0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lRhpxucs9r1hSijFNWdvNkrzvM+4YX3s8AQOkMMLTKiDkd8+VFpyiYfcSLMqt9IMJ
	 3VFIrdHZ8R6/NSTrS86UQbde7kSX4GQddPWf1kMf8bMHsbMZ5DaO09ya3CYUSyLmIN
	 qQRasCGUPcCGBWQSeFCJyxvTeA2ok7m6/IW+K14s=
Message-ID: <3eb77f76-1558-4b1d-a8ad-d25da8b0b68c@arm.com>
Date: Tue, 13 Oct 2026 17:46:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] riscv/mm: fix missing destructor for hotplug PUD
 tables
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Dave Hansen <dave.hansen@intel.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Muchun Song <muchun.song@linux.dev>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-4-songmuchun@bytedance.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20261010112457.49485-4-songmuchun@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_084637_888853_25DF69EE 
X-CRM114-Status: UNSURE (   6.03  )
X-CRM114-Notice: Please train this message.
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

On 10/10/2026 13:24, Muchun Song wrote:
> Commit 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel
> pgtable alloc") made alloc_pud_late() run the PUD page-table
> constructor. However, free_pud_table() still frees non-reserved PUD
> tables directly without decrementing NR_PAGETABLE. Free PUD tables
> through the common free_pgtable_page() helper so that
> constructor-backed tables run the matching destructor before being
> freed. Fixes: 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special
> kernel pgtable alloc") Cc: stable@vger.kernel.orgAssisted-by: LLM
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>Acked-by: David
> Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
