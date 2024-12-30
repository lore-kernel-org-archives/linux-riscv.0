Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F104AE7718B
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Dec 2024 03:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BX2imCQrH8k09kkXvh3Obp6SaMyhV2Kg1vXgPBHlXQ=; b=ulmtREgzUiIsl+
	vqsUVEPBCY2c4I4KjopQyqC9cPbQ2iKTY6r0+P3t8J8lcIv/8JO5XmJIfvz40WwrXL+LfXoDewDmY
	TGtqM+45aPIpj+fU/HcREyqkH6DDgMmgtXuyd6gSxBe7Jq+jlHRPIsaSFbsByco1jisD1vRdVUdI2
	yui7BThTr2a6abSiyt4Ggz6onFTn5Rd8OI6AZz5SuBaCAZY3hYfGG0aVqhr4y9BGwWyqyZHt9+zsw
	gmBbm9JfMdtF1XPuERq5rPdYgqidI3HVNyttEPMQ/uKbSLc8GUwAZbZBZzmqErV1YzgE1LplTzR/f
	sfWI1rF4gxM6/vK5zlbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS6Cc-00000004Pnl-1lmu;
	Mon, 30 Dec 2024 03:12:22 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tS6CZ-00000004Plh-2z15
	for linux-riscv@lists.infradead.org;
	Mon, 30 Dec 2024 03:12:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21634338cfdso163100995ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 29 Dec 2024 19:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735528335; x=1736133135; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00MV44O/wLuPQ/RpQp8S/rpHXiOskq9DnLB00pReqmw=;
        b=KdeJYZ85LnWSIN52afzyVDJMSMjXApoS7eupT5t0oXiPDQb6r8d/dvWcsGvGRndKpf
         64353f8c49gWpoGkrTnP7U0Q3jLonUNcfYIjSpOLWuzyjVzUqvhTo0hKih3pGGgItgAT
         QyJb+fTnOxIdFUpVOh8QKCCicfVlWgbE3DvB+/AwZUZpoRQO/3DK0iCdo0/fKhvEjo5E
         8EISg5+4ae0WDnpGkgQ/B1ilWYGVFa9ITXoxYxg/ozhsMzsOyWsGp96ItvYwX6yOEuHn
         FG8qLrk83uqVQZ9mNlfWO3rxRElozLH860qK2yidEwfD8OVRXh3JG+lqEkX67HQRgPuk
         t8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735528335; x=1736133135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00MV44O/wLuPQ/RpQp8S/rpHXiOskq9DnLB00pReqmw=;
        b=dUFqpBrNsfxs51OWgS0oOnbtD62V8SqmQmmUdEh4gKp4esqhf6hkfKi7mNJXPlfcNa
         SlVEpd/58we+KZE8QXLO9zJGrr26PGgaY0LrvGqrjquGxiQFrNht7Mi1r2wi47T/kziH
         XDIsSBAQ7dakXRqTDCmgjejwWc7P/8Qb9abIpoxW7q0s/tq0GV8Pt/Aa2VHsGvdt0vJU
         DmNyM3FahW3/5GDUMB9owYYoi4aT2mNNEJxt2UciUBQsmujGa8f7wyU6ts2N8m1fOYNX
         zb+xvhZcGoqQQ9FMG/Tl8u2Ct8SST5ROHdv+hipgkVQrvcxINaEnvCEohnQ6w5JYtJ8p
         o3xw==
X-Forwarded-Encrypted: i=1; AJvYcCU6BqBdg632yFNyu84ZHBvRyD/xedYKQauSL225TWZuJj/LbCPCruNCP8Rv+W2xtedVln8zFyvQAYy07w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7/4ll+PLgBp4afdkYRk/4UJylISN1i7lmUbNVL3sDUGzbY+Xp
	6eOxMUca61CUXMhPVfxlc+vKpJY2JSKb/erxy/ZCKGkA+rDZianzKczgKVvf9EU=
X-Gm-Gg: ASbGncthOGYNhPn/P0S2MXJJChpESV9rglRyDHGGd6h00cd9P5HcToxnphygRi+/LVK
	2qY+l0vopYWnJZe7Ipi89IRRwQRi6MkUpj0rGftAk36cuAz0e6uqVyoJNABfNtDUy8eT5tlO/Cg
	Y9hMCIu12emi7Ippt3RLZilrFs/BlodJOqH80c1Tz2aWnSqlscbubF0Bx92+FuVUjq/8xHBAafW
	tqps0dodKeWhxQnwX44AcXsUF1xuULX6HWE1dMq0L5DTpGKXAZvG+mB4KxeBfGQ+WNofeB8pPmS
	KQTAiQ==
X-Google-Smtp-Source: AGHT+IHVtuGTDJKnXgo1JS5AtVrvj0I/cg1dyieo6seko5BYBtWvsXqnYPIAVAFKhaTndzKmWg8VgQ==
X-Received: by 2002:a05:6a20:9185:b0:1e5:7db5:d6e7 with SMTP id adf61e73a8af0-1e5e083f019mr66304616637.46.1735528334820;
        Sun, 29 Dec 2024 19:12:14 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad84eb45sm18191842b3a.88.2024.12.29.19.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 19:12:14 -0800 (PST)
Message-ID: <9cac5690-c570-4d43-a6bc-2b59b85497ae@bytedance.com>
Date: Mon, 30 Dec 2024 11:12:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/17] mm: pgtable: remove tlb_remove_page_ptdesc()
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>, akpm@linux-foundation.org,
 kevin.brodsky@arm.com, peterz@infradead.org
Cc: agordeev@linux.ibm.com, tglx@linutronix.de, david@redhat.com,
 jannh@google.com, hughd@google.com, yuzhao@google.com, willy@infradead.org,
 muchun.song@linux.dev, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
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
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z2_EPmOTUHhcBegW@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_191220_041315_3EC1A1CC 
X-CRM114-Status: UNSURE (   9.22  )
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

Hi Mike,

On 2024/12/28 17:26, Mike Rapoport wrote:
> On Mon, Dec 23, 2024 at 05:41:01PM +0800, Qi Zheng wrote:
>> Here we are explicitly dealing with struct page, and the following logic
>> semms strange:
>>
>> tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));
>>
>> tlb_remove_page_ptdesc
>> --> tlb_remove_page(tlb, ptdesc_page(pt));
>>
>> So remove tlb_remove_page_ptdesc() and make callers call tlb_remove_page()
>> directly.
> 
> Please don't. The ptdesc wrappers are there as a part of reducing the size
> of struct page project [1].
> 
> For now struct ptdesc overlaps struct page, but the goal is to have them
> separate and always operate on struct ptdesc when working with page tables.

OK, so tlb_remove_page_ptdesc() and tlb_remove_ptdesc() are somewhat
intermediate products of the project.

Hi Andrew, can you help remove [PATCH v3 15/17], [PATCH v3 16/17] and
[PATCH v3 17/17] from the mm-unstable branch?

For [PATCH v3 17/17], I can send it separately later, or Kevin Brodsky
can help do this in his patch series. ;)

Thanks,
Qi

> 
> [1] https://kernelnewbies.org/MatthewWilcox/Memdescs
>   


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
