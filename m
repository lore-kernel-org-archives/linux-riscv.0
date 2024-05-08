Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5777EC04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 18:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGypqABWhmEBdy7lW9PKoPe+dJGaIKAgBcWZu9eU+oY=; b=nfB6B2ksBn/YAR
	t11f++HxZTLFjHUVT+yjlKgYfCU3ADX2hCHmKInof2CKbHLeYiWkZZqtrtYcBaXgxpZDPrbVce+rU
	6IP+I+acSHdMO5nuE4lCHwCJck7VZ/3iJO5QLXeTNzoI94+fJlp9XgonDiwR9053n43yuZ9ca51MB
	BE9++XukeM5xNkWCr6CIHu2D2XATxHgqa2KtOJp0MeD7AAZ36bnCUSPThORBayH9F+0owm5DJpdC9
	zHU2+2jDv5/0R7mNYIrHXhj74nTS7GRyYquhHVhX+Tt61WDIhzf4ZIbjdill7aVb/JW50DZ3WkavI
	tGF5MPRNm7jlolJXToHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4m0P-0000000GWsb-3fTP;
	Wed, 08 May 2024 18:27:05 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4lz7-0000000GWV9-24yQ;
	Wed, 08 May 2024 18:25:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 10E491C0005;
	Wed,  8 May 2024 18:25:36 +0000 (UTC)
Message-ID: <3bb94ee6-622d-4dd8-ac11-b8bd2b2849ef@ghiti.fr>
Date: Wed, 8 May 2024 20:25:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] Merge arm64/riscv hugetlbfs contpte support
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
References: <20240508111829.16891-1-alexghiti@rivosinc.com>
 <20240508092756.58fba60e4b6ce0986e8f5f73@linux-foundation.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240508092756.58fba60e4b6ce0986e8f5f73@linux-foundation.org>
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_112545_895539_75C86C23 
X-CRM114-Status: GOOD (  11.57  )
X-Mailman-Approved-At: Wed, 08 May 2024 11:27:03 -0700
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

Hi Andrew,

On 08/05/2024 18:27, Andrew Morton wrote:
> On Wed,  8 May 2024 13:18:20 +0200 Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
>> This patchset intends to merge the contiguous ptes hugetlbfs implementation
>> of arm64 and riscv.
>>
>> ...
>>
>>   arch/arm64/Kconfig                  |   1 +
>>   arch/arm64/include/asm/pgtable.h    |  56 +++++-
>>   arch/arm64/mm/hugetlbpage.c         | 291 +---------------------------
>>   arch/riscv/Kconfig                  |   1 +
>>   arch/riscv/include/asm/hugetlb.h    |   2 +-
>>   arch/riscv/include/asm/pgtable-64.h |  11 ++
>>   arch/riscv/include/asm/pgtable.h    | 153 +++++++++++++--
>>   arch/riscv/mm/hugetlbpage.c         | 227 ----------------------
>>   arch/riscv/mm/pgtable.c             |   6 +-
>>   mm/Kconfig                          |   3 +
>>   mm/Makefile                         |   1 +
>>   mm/contpte.c                        | 272 ++++++++++++++++++++++++++
>>   12 files changed, 480 insertions(+), 544 deletions(-)
>>   create mode 100644 mm/contpte.c
> Hits three subsystems, so I guess mm.git is the place.  I'll await
> reviewer/tester input and let's look at getting this into mm.git after
> 6.10-rc1?


Sure, fine by me :)

Thanks,

Alex


>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
