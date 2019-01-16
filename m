Return-Path: <SRS0=8WcR=PY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E326C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Jan 2019 13:12:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E6DA20651
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Jan 2019 13:12:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q2+d/om0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E6DA20651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/ZDZRKCqfUtowteq0w4M6XTU4GdyByGQMCRMlhVYrg=; b=q2+d/om0bntFrz
	JEFahQFnY2UNKr626XjG/Icnzt8jorzo3KXoV2E1iIikINE1EDF6IinK89OiLByzmIHEly1nQSc8o
	CobhJIG+9Cu0EZcU559uZcqJJ0tR6Wsg9lJ4YsucEWu8cUb+33QKVRUqtDcJudR13fCeNHKZBMjzJ
	tUqTD0avO8I/dfg0MQyCnqAGPYKxo985V05jbNsvOLlKuuTY4S+Y8UGpkV75+cgGjX2WyN8GnCiwV
	k98Xs1QC2ZDRF4FkYvZmuq7FEY5jiovPqiVOle8C5QRterpqt+JM0NMggc1XaSTr7h0VHWODSEIYZ
	l5yXqCTYGEEWm1L2VQsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjkzu-0004nO-1e; Wed, 16 Jan 2019 13:12:46 +0000
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjkzi-0004d1-0j; Wed, 16 Jan 2019 13:12:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61DE080D;
 Wed, 16 Jan 2019 05:12:33 -0800 (PST)
Received: from [10.162.42.129] (p8cg001049571a15.blr.arm.com [10.162.42.129])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 89A743F70D; Wed, 16 Jan 2019 05:12:22 -0800 (PST)
Subject: Re: [PATCH V2] mm: Introduce GFP_PGTABLE
To: Matthew Wilcox <willy@infradead.org>, Michal Hocko <mhocko@kernel.org>
References: <1547619692-7946-1-git-send-email-anshuman.khandual@arm.com>
 <20190116065703.GE24149@dhcp22.suse.cz>
 <20190116123018.GF6310@bombadil.infradead.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <07d6a264-dccd-78ab-e8a9-2410bbef7b97@arm.com>
Date: Wed, 16 Jan 2019 18:42:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190116123018.GF6310@bombadil.infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_051234_067493_1EAD97B3 
X-CRM114-Status: GOOD (  20.04  )
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
Cc: mark.rutland@arm.com, linux-sh@vger.kernel.org, peterz@infradead.org,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com, will.deacon@arm.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 mpe@ellerman.id.au, linux@armlinux.org.uk, mingo@redhat.com, vbabka@suse.cz,
 rientjes@google.com, palmer@sifive.com, greentime@andestech.com,
 marc.zyngier@arm.com, rppt@linux.vnet.ibm.com, shakeelb@google.com,
 kirill@shutemov.name, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 ard.biesheuvel@linaro.org, robin.murphy@arm.com, steve.capper@arm.com,
 christoffer.dall@arm.com, james.morse@arm.com, aneesh.kumar@linux.ibm.com,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 01/16/2019 06:00 PM, Matthew Wilcox wrote:
> On Wed, Jan 16, 2019 at 07:57:03AM +0100, Michal Hocko wrote:
>> On Wed 16-01-19 11:51:32, Anshuman Khandual wrote:
>>> All architectures have been defining their own PGALLOC_GFP as (GFP_KERNEL |
>>> __GFP_ZERO) and using it for allocating page table pages. This causes some
>>> code duplication which can be easily avoided. GFP_KERNEL allocated and
>>> cleared out pages (__GFP_ZERO) are required for page tables on any given
>>> architecture. This creates a new generic GFP flag flag which can be used
>>> for any page table page allocation. Does not cause any functional change.
>>>
>>> GFP_PGTABLE is being added into include/asm-generic/pgtable.h which is the
>>> generic page tabe header just to prevent it's potential misuse as a general
>>> allocation flag if included in include/linux/gfp.h.
>>
>> I haven't reviewed the patch yet but I am wondering whether this is
>> really worth it without going all the way down to unify the common code
>> and remove much more code duplication. Or is this not possible for some
>> reason?
> 
> Exactly what I suggested doing in response to v1.
> 
> Also, the approach taken here is crazy.  x86 has a feature that no other
> architecture has bothered to implement yet -- accounting page tables
> to the process.  Yet instead of spreading that goodness to all other
> architectures, Anshuman has gone to more effort to avoid doing that.
> 

The basic objective for this patch is to create a common minimum allocation
flag that can be used by architectures but that still allows archs to add
on additional constraints if they see fit. This patch does not intend to
change functionality for any arch.

Yes. There is opportunity for further clean up and consolidation like the
one you mentioned about accounting. Uses pages tables should have
__GFP_ACCOUNT and kernel ones should not. IIUC unfortunately not all arch
implement this right now. It is something which should not be arch specific.
Accounting semantics should be common for all archs. A default function
switching between GFP_PGTABLE for kernel and GFP_PGTABLE | __GFP_ACCOUNT
looking into mm_struct can help here.

Then there is __GFP_RETRY_MAYFAIL. Some archs use it for multi order page
allocation but some use for a single page as well.

If there is an agreement on __GFP_ACCOUNT and __GFP_RETRY_MAYFAIL we can
clean this up further.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
