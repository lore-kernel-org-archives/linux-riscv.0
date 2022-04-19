Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFBBC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 09:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=we1S4+Jg6r8vySDJXqcHj0WWoaaAs4wbyLyYiXF7BNA=; b=13upOFZTupxOyj
	rdSGbnoOoCSYB3VbZYfpaMiWJM3JhrNWVgizjXS4N8VPnHk142Bb6lYkyj06IuqN2UEoG9D5v70jp
	9J2Or6t+nhpEEshZsUlTw0eMTMditKmotzXRWD/gHo99wETSwgWTDsp9/LRUa2X6t0E3pquk5bjrG
	Dr+ZCYy91iiHyPR3j3F8EkWMQSSjBTtRXpSLqxWfPel6MKoeS0tuF9LaZ6fKMmnA3QokvyHGsecCW
	zAolsUOOErm7BfFxsKB9u5GT9kmMeKZj0N26hB4QgJRFXhhtKrF/+Cn9u3NTe435iP/rFvWS0V+jP
	o5YzcOemOrQFAm8UQQFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngkAe-002YZH-2e; Tue, 19 Apr 2022 09:29:16 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngkAS-002YUA-01; Tue, 19 Apr 2022 09:29:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 317031042;
 Tue, 19 Apr 2022 02:29:01 -0700 (PDT)
Received: from [10.163.40.223] (unknown [10.163.40.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 708A43F5A1;
 Tue, 19 Apr 2022 02:28:52 -0700 (PDT)
Message-ID: <1671baf7-046e-7c52-183f-fd654125fd67@arm.com>
Date: Tue, 19 Apr 2022 14:59:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next v4 1/4] mm: page_table_check: move
 pxx_user_accessible_page into x86
Content-Language: en-US
To: Tong Tiangen <tongtiangen@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
References: <20220418034444.520928-1-tongtiangen@huawei.com>
 <20220418034444.520928-2-tongtiangen@huawei.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20220418034444.520928-2-tongtiangen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_022904_129271_747D1AEE 
X-CRM114-Status: UNSURE (   8.36  )
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



On 4/18/22 09:14, Tong Tiangen wrote:
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -10,6 +10,14 @@
>  #undef pr_fmt
>  #define pr_fmt(fmt)	"page_table_check: " fmt
>  
> +#ifndef PMD_PAGE_SIZE
> +#define PMD_PAGE_SIZE	PMD_SIZE
> +#endif
> +
> +#ifndef PUD_PAGE_SIZE
> +#define PUD_PAGE_SIZE	PUD_SIZE
> +#endif

Why cannot PMD_SIZE/PUD_SIZE be used on every platform instead ? What is the
need for using PUD_PAGE_SIZE/PMD_PAGE_SIZE ? Are they different on x86 ?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
