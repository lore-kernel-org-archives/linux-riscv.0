Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AEFE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 11:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CbXRaKrbI9QttyJS6yPyIJtGNOiyXORCDdP0klSZdrA=; b=AFBlhARsWydqDT
	dd4Tvnxt1+4BD/8IfoKAlO46Q5aYxvCCTxahxmmNcDBJ7bI/c44sV+wcQVbaAZ3/9109pa2CGEkFM
	APp1/z9iiKPFw/gg+9SPtCYvFmqk8JPncwZ41KzVw92uy0Y9sITO8Wq7dtb8sFZwjxTjmONP5Duvf
	JGUOeS+bGJvfAb/oeBSvA79rXwIUMjnOG57+tdXIREU8NZ/N8fshn8RGJ/HL6VtSVakb4qZ+QqbVl
	XYDDr53LQ2I2/DDuG4yB/LkBOnKzQyyYJTsN31wpjf8JjMkI4bukx82NFtAf6V5HlPTSaUTsPrv6q
	J8aSIK0il7+jqTx39YeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObTe-00000004olJ-0592;
	Fri, 20 Dec 2024 11:47:30 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObSS-00000004oYT-3LUp
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 11:46:19 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21675fd60feso20921345ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2024 03:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734695175; x=1735299975; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mBRlMffFmN+hz5HGm/qsvwuPzuwmJovQ60y3/xe1EoY=;
        b=ebwtpK7IIoH28LnyqjcYWkmWPPc3T38g7rzHUvDlCDDAToJkKjkisqqolYFrzO8VIx
         HMeK4v8sfbtxpc5RhFtZnG89PKYriLOG7AYGcgjuFOGy5/dP1yx8GJcyph/sWqndTVwI
         DTBBQv27tyQ2YDFfFPE9ASqCjIv7QPiSysn2mje/4oT+y5aEdsbqKQ48s8temTqR4x/a
         jut9Yjufk7QWz2m31teCJpfdilvIyhAU2+TVYVbOI1XCX/7Np2EdTrle0lYHVSCWM916
         U0mDWvbfQLEiaWvg8gwxfHqGvecel1+/M/4QNn1cTFtdC4GhtjGbLsB08Mm9z39gOgri
         pkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734695175; x=1735299975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBRlMffFmN+hz5HGm/qsvwuPzuwmJovQ60y3/xe1EoY=;
        b=q4cLrgllhZN+2k1rYU1WSS127H+q06325Zoi9d9i5DHXW+5LD4u4u8y00CSnz/adck
         4e5khmXtk8ktd70MG9QfCOCpZ0YalYLFj6lUvZXf1AOrva40a4Zuu4YodbPEL0xlqd5K
         fHOZiaW6omBC/oFeEV8KJbTk27f8GElsBQwseHwecY0YdPLoqbH7vlj/e+bM/IQMGh1p
         lcoehctBmX5VsKqpiKnrAE8HDYXDczoSUetlmiKN7F9nxkOMiO6Wr+ho8BR9MMcMlUgZ
         DwgQp6G4zsgAum4Utjsk0WWtHCTXBh5NDcXPII457TF52OOTh/bVSiFPTJMYvXVSdX+e
         RNVw==
X-Forwarded-Encrypted: i=1; AJvYcCWCJ6o7Vjsl/LSRp8VTmR956ZAQvLUKCQflepjRe9/wxmYGjnYtIWjYKQ8tL39+vemL7iyku642D/B2Ww==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjvJn9DHMqMelzPco5/qhVZVKi9iBMqguoFYmtdE78wsGy5BhX
	r1JAX4PwMSeF6zhRKsOIS3YYy6+rREla9o2mAD6J8vBxx1XES+wlaZiTVKvrybo=
X-Gm-Gg: ASbGnctAzuQR2qiKHduTegBoJZTY7h2wFsNfrFGsBaipaDMhiYj93KN5gue9kpKbrEr
	+Vas6TzFytI9Ym+tBowX7wvScL40z7+cEb9UJWpMY0z5vy/aEqVox0v4o+HU9NdCgvJdTjQOgi3
	N0Qfv5LnpeTvGql2IkTDf+2b0UEcj7GfnLPs7ZkNvPLSo3Gv410bBsvF1P5rxPilwvHBPXXlMkh
	5DWliWemf/AO2FYCCA9LUH5hIRk6xevEOa6P8AsR23Ivqf/QnLUoFlr2PqiTLF2byu1NinYKhH6
	cqHBUnblJa9wAqTELeYfRHRt2YTQ8tzlRtyDjxrv0P0JiMhfrPr7H2s=
X-Google-Smtp-Source: AGHT+IG40UPaAgLiyyOp9k8XqW2vPy2P2eyTWxZSuqMQTAARXLtkQgcz7lH63J8oRPI229SK+RLglg==
X-Received: by 2002:a17:902:ce92:b0:216:4169:f9d7 with SMTP id d9443c01a7336-219e6e8bc7cmr41107195ad.2.1734695174995;
        Fri, 20 Dec 2024 03:46:14 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:3764:680a:144b:d927:5a3b? ([2409:8a28:f44:3764:680a:144b:d927:5a3b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2db9939b5sm5267286a91.1.2024.12.20.03.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 03:46:14 -0800 (PST)
Message-ID: <0daabd32-cba4-4345-baa8-e8c66bc899ff@bytedance.com>
Date: Fri, 20 Dec 2024 19:46:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] mm: Move common parts of pagetable_*_[cd]tor to
 helpers
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
 <20241219164425.2277022-2-kevin.brodsky@arm.com>
 <20241219171920.GB26279@noisy.programming.kicks-ass.net>
 <75cb4ff8-eb0c-4519-a30a-f8be717ba278@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <75cb4ff8-eb0c-4519-a30a-f8be717ba278@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_034616_843833_4AC30CC4 
X-CRM114-Status: GOOD (  20.62  )
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

Hi Kevin,

On 2024/12/20 18:49, Kevin Brodsky wrote:
> Hi Peter, Qi,
> 
> On 19/12/2024 18:19, Peter Zijlstra wrote:
>> On Thu, Dec 19, 2024 at 04:44:16PM +0000, Kevin Brodsky wrote:
>>> Besides the ptlock management at PTE/PMD level, all the
>>> pagetable_*_[cd]tor have the same implementation. Introduce common
>>> helpers for all levels to reduce the duplication.
>> Uff, I forgot to Cc you on the discussion here, sorry!:
>>
>>    https://lkml.kernel.org/r/cover.1734526570.git.zhengqi.arch@bytedance.com
>>
>> we now have two series doing more or less overlapping things :/
>>
>> You can in fact trivially merge the all the implementations -- the
>> apparent non-common bit (ptlock_free) is a no-op for all those other
>> levels because they'll be having ptdesc->lock == NULL.
> 
> Ah that is good to know, thanks for letting me know about that and Qi's
> series! Fortunately there isn't that much overlap between our series - I
> think we can easily sort this out.
> 
> Qi, shall we collaborate to make our series complementary? I believe my
> series covers patch 2 and 4 of your series, but it goes further by
> covering all levels and all architectures, and patches introducing
> ctor/dtor are already split as Alexander suggested on your series. So my
> suggestion would be:
> 
> * Remove patch 1 in my series - I'd just introduce
> pagetable_{p4d,pgd}_[cd]tor with the same implementation as
> pagetable_pud_[cd]tor.
> * Remove patch 2 and 4 from your series and rebase it on mine.

I quickly went through your patch series. It looks like my patch 2 and
your patch 6 are duplicated, so you want me to remove my patch 2.

But I think you may not be able to simple let arm64, riscv and x86 to
use generic p4d_{alloc_one,free}(). Because even if
CONFIG_PGTABLE_LEVELS > 4, the pgtable_l5_enabled() may not be true.

For example, in arm64:

#if CONFIG_PGTABLE_LEVELS > 4

static __always_inline bool pgtable_l5_enabled(void)
{
	if (!alternative_has_cap_likely(ARM64_ALWAYS_BOOT))
		return vabits_actual == VA_BITS;
	return alternative_has_cap_unlikely(ARM64_HAS_VA52);
}

Did I miss something?

My patch series is not only for cleanup, but also for fixes of
UAF issue [1], so is it possible to rebase your patch series onto
mine? I can post v3 ASAP.

[1]. 
https://lore.kernel.org/all/67548279.050a0220.a30f1.015b.GAE@google.com/

Thanks!

> 
> Let me know if that makes sense, if so I'll post a v2.
> 
> Cheers,
> - Kevin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
