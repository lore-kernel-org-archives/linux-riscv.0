Return-Path: <SRS0=8slP=YC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0ABEC47404
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2019 10:56:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7256A20B7C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2019 10:56:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aYTE2rkh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7256A20B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SvXQL6eg+nNqwXFJzftqoF1qf+WHnmsMEb4jxGdf1oo=; b=aYTE2rkhZVxlUI
	PekUw9dvM6+7FovhN8wfpMnaXzhLl04lBkTxBScUATcU9x+1ncrJlphAQDl2CQv11/S2ta/XBfdD2
	7DPiLtC5LhJYg1AP4lH0et2XSUtGkiYEeuo8qfIt6aqQP3LUBviO21B2Gh6vB/FH21kEuVZTOzSnI
	trWSR9uJeR00tbEweZLAsu5QyvPwxb47fO84fBDki4mgS4cW+QlM7HwyyNMMGIM8mYo55muSV1M/p
	1VAQ4lXRQSmE7tocMLQs6tlugBJYkjr1dULrLdHAvilPrIAb7P4dfSHYeJSsyuroEhghiX0/baJjw
	gVFmy6BLcu9lhEdL05CQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iI9dQ-0006Bw-Tr; Wed, 09 Oct 2019 10:56:01 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iI9dG-00063O-Mp; Wed, 09 Oct 2019 10:55:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A51628;
 Wed,  9 Oct 2019 03:55:47 -0700 (PDT)
Received: from [10.1.196.133] (unknown [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F3443F703;
 Wed,  9 Oct 2019 03:55:44 -0700 (PDT)
Subject: Re: [PATCH v11 07/22] riscv: mm: Add p?d_leaf() definitions
To: Paul Walmsley <paul.walmsley@sifive.com>, alex@ghiti.fr
References: <20191007153822.16518-1-steven.price@arm.com>
 <20191007153822.16518-8-steven.price@arm.com>
 <alpine.DEB.2.21.9999.1910081431310.11044@viisi.sifive.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <b0ed95cd-703f-9ac2-a2e8-9a059f4095f9@arm.com>
Date: Wed, 9 Oct 2019 11:55:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.9999.1910081431310.11044@viisi.sifive.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191009_035550_790200_034F7D16 
X-CRM114-Status: GOOD (  15.51  )
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, "Liang, Kan" <kan.liang@linux.intel.com>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 08/10/2019 22:33, Paul Walmsley wrote:
> On Mon, 7 Oct 2019, Steven Price wrote:
> 
>> walk_page_range() is going to be allowed to walk page tables other than
>> those of user space. For this it needs to know when it has reached a
>> 'leaf' entry in the page tables. This information is provided by the
>> p?d_leaf() functions/macros.
>>
>> For riscv a page is a leaf page when it has a read, write or execute bit
>> set on it.
>>
>> CC: Palmer Dabbelt <palmer@sifive.com>
>> CC: Albert Ou <aou@eecs.berkeley.edu>
>> CC: linux-riscv@lists.infradead.org
>> Signed-off-by: Steven Price <steven.price@arm.com>
> 
> Acked-by: Paul Walmsley <paul.walmsley@sifive.com> # for arch/riscv  
> 
> Alex has a good point, but probably the right thing to do is to replace 
> the contents of the arch/riscv/mm/hugetlbpage.c p{u,m}d_huge() functions 
> with calls to Steven's new static inline functions.

The intention is to create new functions that are not dependent on
hugepage support in user space. hugetlbpage.c is only built if
CONFIG_HUGETLB_PAGE is defined.

As you say - the p{u,m}d_huge() functions can be reimplemented using the
new static inline functions if desired.

Thanks for the review.

Steve

> 
> - Paul
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
