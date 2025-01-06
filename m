Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E890CE77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 03:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JS+Os3r5JR4vxarx76ZQjkj5u/efkEX3OMJe6vSFvEY=; b=m/phYLtkLes2MA
	riPyagYLG3LKuX5A9Sp2kv97HLlMNY+hiDCmkvDsdvxBfUeoIhqj7ah4/cEMXJI78xAO1/YaUCUpe
	EsPSJJtDqM7nTU1WNR1lCByCwR/azctY3vicLP6MBGuHP738f1tpb7xukBcIWCXTOK1FtFaKBh/9t
	bdIEBPXx0f6qj1PS6vclV+6/kVREAQRKgWBXd0WzC2GiscuXZH4e7vJ7HU4cW+FKKTajGHru+52xZ
	FgtvYEnsisQh25TytxEc1ISZrNlJuZLNCc7hcZrFnlzUKKzGQMjigrlJWiQLNffFvM9VI1siwsuws
	vwshAQK2581C4pfldbzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUeCn-00000000AHB-2gpN;
	Mon, 06 Jan 2025 03:55:05 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUeBb-00000000A8i-1BRZ
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 03:53:53 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so20360660a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jan 2025 19:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736135630; x=1736740430; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/q466ctbH84kLf48L1cXJtHFTRzDl7be/n0cI3LGmOM=;
        b=isoXtO3CuYLqt2tyJbp+2B5dmXhmABhJ9wZmXt2QOme+TqUw/AraFkM8Kt+m+Iu866
         moWp8FhZ1aMm/ejkaK180kDGL5OW+KMOvYUbCejAbRc+ZXFfYxr18PHfX1m34qC2T+fM
         wY9It39AP4+BxYIMkX3jvLhF3dDahRttZqsGZj4jq9R/v3LRVeFykTqDSFvZ/VWF7COS
         5F0gOA3N3ua6eFjmwnzVh/wBD/efKXcczvrPhgimM4vLnfFnXOzB7ypZUuMgrMcdCnau
         F0y665LbLVlUMTNJvZeqBRu+0+6BWeCuBBqLKkQxxOGaTPNFUfV+QWC4l+jdjRiSmDZk
         amdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736135630; x=1736740430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/q466ctbH84kLf48L1cXJtHFTRzDl7be/n0cI3LGmOM=;
        b=rU4STUk00y2SaEzl9z/Ou0cU1JgVn4zb6fRe5T/jOkDTpxECUa1f/wKJkHqxHvqsAP
         CvVf0Jp67xb8ipPOvf1hYIMKTxxi4+TosobJeVWQe2m4HYFovJlYlyU0Y45ZDgf1SjSH
         14+fmxv2Xs6En6afOUEav2Z28Aj66A1J4G2DQSXdFcMXFRS/0PB1ll4lmcecFsLcSg0b
         O2qLsMa9TLXMhHzbf2oihTgk+50Y52q2hVssI7Qda+Ba68eWTP1ja9xn5V3w2bPmB4N2
         SuqDLSzR618rNRd2r04iC5kMonfTSFwFKzL6xQKpcFPmu/pDV/PNJu1LLlEPiiKG+thP
         3j7g==
X-Forwarded-Encrypted: i=1; AJvYcCWNPw8XEuOhS46h0wgyghpffGlTQwCAa1VvgaJ8sruItl+JkqryMFC4Np+wmLF/e0pJxZBybj+TNs9SRw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3J8BjrEb5TV/AKJuemEHaDW5nkaF3bG4yNqpbH+PVFWHqaMhx
	6QuZFMgq1YoCy76ALb92IqFpgehC3olRCx6fQSJOgDl46XggVT8lehsUgvViuec=
X-Gm-Gg: ASbGnctaLreTBvVmk4k5TgCaHQnkV1MLzhsV3Gs3qL3a/JaIAIxwZ6z+I91dBICOuQG
	mtPe9Q9vinXADu0986Co1cvAA//rh3s5Y23Hu9Yc3uli2Y89w2M+i9IW8LgC/ZX6CfI2jaO4sS+
	BDWKTYEZgD0aUjyaI8wP34Ad2pHhQC3/VHO+F5r67LOzuBdTh8lhiduHPaEx6mb5tnhLOO3qBls
	fUWJaHnKDF7GvaCl5+qwjlYahaGbMhmfYYKPWKelO6jUcFOyJ1F6EmgQ35DW8QlpypU0r1ggrZz
	GlWPOA==
X-Google-Smtp-Source: AGHT+IE2eKUVGb+J7TSGZASTVnkByt6mt8YLIy++PUNY+VFfsnF7zlybMe8WL3Umwm8kwi4ry/BkkA==
X-Received: by 2002:a17:90b:54c3:b0:2ee:a127:ba8b with SMTP id 98e67ed59e1d1-2f452ee83d9mr71788615a91.36.1736135630440;
        Sun, 05 Jan 2025 19:53:50 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca02f72sm283551435ad.249.2025.01.05.19.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 19:53:49 -0800 (PST)
Message-ID: <a84a7b0f-dad5-4100-9d0c-3b515e7fb71f@bytedance.com>
Date: Mon, 6 Jan 2025 11:53:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/17] mm: pgtable: remove tlb_remove_page_ptdesc()
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>, Mike Rapoport <rppt@kernel.org>
Cc: agordeev@linux.ibm.com, kevin.brodsky@arm.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, rientjes@google.com,
 vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
 <b37435768345e0fcf7ea358f69b4a71767f0f530.1734945104.git.zhengqi.arch@bytedance.com>
 <Z2_EPmOTUHhcBegW@kernel.org>
 <20250103111457.GC22934@noisy.programming.kicks-ass.net>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250103111457.GC22934@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_195351_358368_E2B293B1 
X-CRM114-Status: GOOD (  17.64  )
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



On 2025/1/3 19:14, Peter Zijlstra wrote:
> On Sat, Dec 28, 2024 at 11:26:22AM +0200, Mike Rapoport wrote:
>> On Mon, Dec 23, 2024 at 05:41:01PM +0800, Qi Zheng wrote:
>>> Here we are explicitly dealing with struct page, and the following logic
>>> semms strange:
>>>
>>> tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));
>>>
>>> tlb_remove_page_ptdesc
>>> --> tlb_remove_page(tlb, ptdesc_page(pt));
>>>
>>> So remove tlb_remove_page_ptdesc() and make callers call tlb_remove_page()
>>> directly.
>>
>> Please don't. The ptdesc wrappers are there as a part of reducing the size
>> of struct page project [1].
>>
>> For now struct ptdesc overlaps struct page, but the goal is to have them
>> separate and always operate on struct ptdesc when working with page tables.
> 
> I don't see how the current idiotic code helps with that at all.
> 
> Fundamentally tlb_remove_page() is about removing *pages* as from a PTE,
> there should not be a page-table anywhere near here *ever*.
> 
> Yes, some architectures use tlb_remove_page() for page-tables too, but
> that is more or less an implementation detail that can be fixed.
> 
> So no, please keep these patches and kill this utterly idiotic code.
> 
> The only thing that should eventually care about page-tables is
> tlb_remove_table(), and that takes a 'void *' and is expected to match
> whatever __tlb_remove_table() does.
> 
> Flipping those to pgdesc, once its actually a thing, should be fairly
> straight forward.

Well, since I've already sent v4, and that patch series is mainly for
bug fix, I'll send a separate patch series to do this.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
