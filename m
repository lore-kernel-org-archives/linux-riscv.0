Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BC0C982EA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 07:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipOfQTxb14SVvISOn8uePOgrXz0AXaYtV+N4s4hcl+k=; b=ssxj4NN5e6lt8v
	pOqb82P08CfgRr8+lv2qLBZJIeDIKbtXOjkvvwWfQ0of7SPK6jAYrq/ocwDLEDYz6bgMEz0PSN+48
	3ZKRTyj6FbL+cy9DU0yLIqoHhQY5EnQozo5se2wV8JT+z3gFhtN+BNHcSGwUSg9HismecJYWkRG9W
	aZlK3gHRUcrQtQ1roS/AhoHEArjZSHY+XqX/CYmB7S5sWvfcjPEQAytpY1Tu9lf0oys+iFLOC7ya3
	nL1oaF6O5u8/SMaiOQqqSlMKh9Dt/QHjt3/ye6ddfRKXdTpokFiPXLpToNZpIr5SMZtZcH9C6D8OI
	60Z3Bs2z4cemidypsN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HFc-00000007OCT-3IJj;
	Wed, 23 Sep 2026 07:18:44 +0000
Received: from out-212.mta0.migadu.com ([2001:41d0:1004:224b::d4] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HFZ-00000007OAW-3byo
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 07:18:43 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ftIfSiBGVQtCnPrtNG2sYlwb3kX4tGScpi67ufltGms=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790147919; v=1; x=1790752719;
 b=FHSXsCJQcp2gatF8FVoRNlCOC3RUxKusFciABMnOKMktthHKbq2b2ZOwx6kOrSPpjx7os3yI
 /95+roTwVxLT2tjaAarjwQKWhn3YLdPJjaciTqRQgVH3GfSdXApZMeQ2B5NE3PfXb01CQo8kzCM
 iInnn1P+PNiR0Pz5fazcaZ9g=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a804e1edd13ff3f4;
	Wed, 23 Sep 2026 07:18:38 +0000
X-Mizu-Trace-ID: a804e1edd13ff3f4
X-Migadu-Flow: FLOW_OUT
Message-ID: <8769d7a8-9442-4dbb-9828-01447e4320d1@linux.dev>
Date: Wed, 23 Sep 2026 15:17:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for MMU
 riscv
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 usama.arif@linux.dev, kas@kernel.org, guoren@kernel.org, bcain@kernel.org,
 geert@linux-m68k.org, dinguyen@kernel.org,
 schuster.simon@siemens-energy.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com, dalias@libc.org,
 glaubitz@physik.fu-berlin.de, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, linux@armlinux.org.uk,
 vgupta@kernel.org, monstr@monstr.eu, chris@zankel.net, jcmvbkbc@gmail.com,
 will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 peterz@infradead.org, davem@davemloft.net, andreas@gaisler.com,
 richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com,
 catalin.marinas@arm.com, mark.rutland@arm.com, chenhuacai@kernel.org,
 kernel@xen0n.name, tsbogend@alpha.franken.de,
 James.Bottomley@hansenpartnership.com, deller@gmx.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, chleroy@kernel.org, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
 johannes@sipsolutions.net, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, arnd@arndb.de,
 vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 jgg@ziepe.ca, jhubbard@nvidia.com, peterx@redhat.com,
 ysato@users.sourceforge.jp, shakeel.butt@linux.dev, corbet@lwn.net,
 rdunlap@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-arch@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-alpha@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, hughd@google.com, qi.zheng@linux.dev,
 linux-doc@vger.kernel.org
References: <20260922-rcu-pagetable-freeing-v4-3-fe1ad1f1e303@kernel.org>
 <20260923061551.84398-1-lance.yang@linux.dev> <arN6JBJixHUjX2CJ@gremlin>
Content-Language: en-US
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <arN6JBJixHUjX2CJ@gremlin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_001842_137495_461AB11D 
X-CRM114-Status: UNSURE (   8.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 2026/9/23 15:05, Lorenzo Stoakes (ARM) wrote:
> On Wed, Sep 23, 2026 at 02:15:51PM +0800, Lance Yang wrote:
>>
>> On Tue, Sep 22, 2026 at 04:35:34PM +0100, Lorenzo Stoakes (ARM) wrote:
>>> Currently riscv gates MMU_GATHER_RCU_TABLE_FREE on CONFIG_SMP and
>>> CONFIG_MMU.
>>>
>>> Commit 69be3fb111e7 ("riscv: enable MMU_GATHER_RCU_TABLE_FREE for SMP &&
>>> MMU") enabled CONFIG_MMU_GATHER_RCU_TABLE_FREE for CONFIG_SMP, CONFIG_MMU
>>> riscv builds.
>>>
>>> This is expressly for the safety of GUP-fast walkers (CONFIG_HAVE_GUP_FAST
>>> is enabled if CONFIG_MMU is enabled).
>>>
>>> Naturally a single core system does not encounter issues with software page
>>> table walkers being correctly synchronised across cores, as there is only a
>>> single core.
>>>
>>> However, CONFIG_PREEMPT_RCU is still available on a riscv UP system, so for
>>> a future RCU-only page table walker, this guarantee is required to prevent
>>> concurrent page table teardown.
>>>
>>> All page table freeing is already done via tlb_remove_ptdesc() so the
>>> conditions of CONFIG_MMU_GATHER_RCU_TABLE_FREE are already met.
>>>
>>> This forms part of an overall effort to switch every architecture to this
>>> mode.
>>>
>>> Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>>> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>>> ---
>>
>> Yeah, for RISC-V, page-table freeing already goes through
>> tlb_remove_ptdesc() :) Tested on QEMU, no issues seen :)
>>
>> Tested-by: Lance Yang <lance.yang@linux.dev>
> 
> Thanks! :)

Cheers!

> A cheeky A-b tag possible too? :P

Sure thing! Here it is :D

Acked-by: Lance Yang <lance.yang@linux.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
