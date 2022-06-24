Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5539C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 05:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=re84TjuAq2P3n/jF97VAX7kCuweTHKOT07UBnTA4Be4=; b=I4az93HUqFanEG
	eefKLvul5dvk3G7g2dP7ymkV6EEDadSs36bmaQby50qD3jcmLRGax+UltAyLiaqbyPxq9BTRu7eO9
	QC5IcSdRiOTJcWGX/R4eXGyTM39RKpT7f47/r5KQyq5aZkVdm6ngfTL1pAu2y4BffTO/+6kMRSfXd
	LcYzELNS+e8Mjh8Iz5GwCXPAkN5ycX96vDB9kV+I2PnzvOpyIIc8OryI+ZUPZ9Os7HfgB0D8JQ44R
	a4VmWd/Pb6mUVpIuG36mBlOtApiQa2/V4zQgGkEsSXQzPYMTQH9P3qP7HrGDmaR+A3Z4/rizD6kh3
	IhS6z/k0CsO+GXIksulQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bke-000aCM-Pz; Fri, 24 Jun 2022 05:21:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bkM-000a4r-G8; Fri, 24 Jun 2022 05:20:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BB59176A;
	Thu, 23 Jun 2022 22:20:44 -0700 (PDT)
Received: from [10.162.41.7] (unknown [10.162.41.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB2DF3F66F;
	Thu, 23 Jun 2022 22:20:36 -0700 (PDT)
Message-ID: <33bdac1e-207a-192b-bf43-818abfa49fe1@arm.com>
Date: Fri, 24 Jun 2022 10:50:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V4 00/26] mm/mmap: Drop __SXXX/__PXXX macros from across
 platforms
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-mm@kvack.org, christophe.leroy@csgroup.eu,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, x86@kernel.org, openrisc@lists.librecores.org,
 linux-xtensa@linux-xtensa.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-um@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <YrVHvv0spuMsC1In@infradead.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <YrVHvv0spuMsC1In@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_222046_658546_665AF2EC 
X-CRM114-Status: UNSURE (   9.80  )
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



On 6/24/22 10:42, Christoph Hellwig wrote:
> On Fri, Jun 24, 2022 at 10:13:13AM +0530, Anshuman Khandual wrote:
>> vm_get_page_prot(), in order for it to be reused on platforms that do not
>> require custom implementation. Finally, ARCH_HAS_VM_GET_PAGE_PROT can just
>> be dropped, as all platforms now define and export vm_get_page_prot(), via
>> looking up a private and static protection_map[] array. protection_map[]
>> data type is the following for all platforms without deviation (except the
>> powerpc one which is shared between 32 and 64 bit platforms), keeping it
>> unchanged for now.
>>
>> static pgprot_t protection_map[16] __ro_after_init
> 
> On most architectures this should be const now, only very few ever
> modify it.

Will make it a 'static const pgprot_t protection_map[16] __ro_after_init'
on platforms that do not change the protection_map[] even during boot.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
