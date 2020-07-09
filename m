Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1709DC433DF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 03:31:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D08A0206F6
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 03:31:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s+p36NBG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D08A0206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g2Jv5Ideszrhx6mITYzfespWKvkBOSeiYtAyQUeAEJY=; b=s+p36NBG67u9yvfNj2Roxi0Nx
	8uo8Ta9YX9BpgL+evboNAycTtaaTemIPow+iN0sQPc3w/DtsJoo+SMljcDLh3C27s3kl3cGTc3TRX
	MIeMqg38BgwSIq6IgREaSVQXOaAHuqTDUP3Fw//VQF+kCF65m+RmpdVtzqSAdrP8GQ6iu9FMXX7Pe
	ytLTackz1qcGH/Xo2Z0uyYg4KxuyFmmY6IqNkDJbJfVwbBwBeG8ndj11/hkq7jbaNKE8ra/i9bs62
	lbz7zPFBifJnq/HaBr0hSeIT3CtiCCO/zXAigJ2IizAuyG6+Up7LbMQbjcds2MywPx1ILhXP8rSBk
	Xl9mhl6gg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtNH9-0002xx-1O; Thu, 09 Jul 2020 03:31:07 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtNH5-0002x5-Ni; Thu, 09 Jul 2020 03:31:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0042E31B;
 Wed,  8 Jul 2020 20:30:56 -0700 (PDT)
Received: from [192.168.0.129] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BF133F887;
 Wed,  8 Jul 2020 20:30:46 -0700 (PDT)
Subject: Re: [PATCH V4 0/3] arm64: Enable vmemmap mapping from device memory
To: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
References: <1594004178-8861-1-git-send-email-anshuman.khandual@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <a9157943-d033-f9a8-87fc-dce78540df78@arm.com>
Date: Thu, 9 Jul 2020 09:00:17 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1594004178-8861-1-git-send-email-anshuman.khandual@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_233103_817334_152917F7 
X-CRM114-Status: GOOD (  15.78  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, catalin.marinas@arm.com,
 Dave Hansen <dave.hansen@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, justin.he@arm.com,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fenghua Yu <fenghua.yu@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 07/06/2020 08:26 AM, Anshuman Khandual wrote:
> This series enables vmemmap backing memory allocation from device memory
> ranges on arm64. But before that, it enables vmemmap_populate_basepages()
> and vmemmap_alloc_block_buf() to accommodate struct vmem_altmap based
> alocation requests.
> 
> This series applies on 5.8-rc4.
> 
> Changes in V4:
> 
> - Dropped 'fallback' from vmemmap_alloc_block_buf() per Catalin

Hello Andrew,

This series has been a long running one :) Now that all the three patches
here have been reviewed, could you please consider this series for merging
towards 5.9-rc1. Catalin had suggested earlier [1] that it should go via
the MM tree instead, as it touches multiple architecture. Thank you.

[1] https://patchwork.kernel.org/patch/11611103/

- Anshuman

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
