Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B740CD343B
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 14:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=EPWnLu21PDCUD7W3VdZTZogEzzly2cRT9d+xmv0nRfw=; b=huzz18kyoiC08qkATq8rEhGlgY
	O2CBJ9BHsP3PwXqBvmS/dWaYrAX4R+mCLmlpFMx3wmFAVUGIR9qL0mDpym2ML87+sbF9WmOrHR7h+
	TwGhloXQC8Kd97NJ+3CqaPvPdusV+IJQGjdFEfHVBzNh73NCv3c0JZPTddUDezWKw7VW0EdKnARFA
	EFAf8NCluqB7vgeHm5hZldF1cckYotVks/3MGTMaEr9/CqYx/HQ8nq27IHhEzk8YxtvgrCG0HZ+KW
	a+aidaNFCz9sgM9KlxAxqpqLBOWyR9zz+uMquElNHj29gmw9913wynCXtWFL2DNGOO3dFUEknI0dE
	e9UegsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUac-00000000bXT-0g46;
	Tue, 03 Sep 2024 14:33:02 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slUUr-00000000ZH2-2cDH
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 14:27:07 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2057917c493so16034705ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Sep 2024 07:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1725373624; x=1725978424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoTw6t0Be8aKNozeOjjMtSaTe5hpCqncxCg69X7v8Z4=;
        b=H1eOl6pRlTagQ/lHcW8b/CtN5gYAtLySluxdOvPRlvgDJa8tL+MCnmTCgQYQIoLXqs
         3/IwNS3VNDdfTBuNTzZvzpCN9LdAXw70P+d9SFRHXfbRlARUMPdTRoaXSxkPRLFvgmGI
         LDP23MSmjLnCUTKmTcYGvF1/2mOVwc3JfGH1HVdDpomVrTFH1JcOdoABgjPaacYMLl+d
         EHBLVLT4BXPYv/JSlmt+qge8aznB+04/yNyOYK5lmutDEMsVRjhaD1mkDjbaAu3OZuPA
         cWovQh0gK5cAZU3j/Vo2tc8XXV2Eirf0jJN54lQSEq4+Ql0yG9/hqf5Rv/Hyrg2nyrFe
         7QFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725373624; x=1725978424;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoTw6t0Be8aKNozeOjjMtSaTe5hpCqncxCg69X7v8Z4=;
        b=nGGcyp266CUktOLdEkTg3kFtsQjcDTIzOtegnztyIPxHbkIeWYVLuI4sXJXw4kthzf
         X+DPkqgfgKroY4+61X/ZxfU0zDAag+cn1N/zDgylc+5DRckqYFR3RlQjBjcagDcJCj58
         BywlD2wJ9hDRfY7k660IR9jxqyhW/mKvHE2nRCG1/Mo6Y2Z0+yiiV8fd7bKTXMx9Q2Nx
         DqBCJbkk6gYbbCZYoeXgn22R5m8xlRJe4RvF92hPYpPng7C2+nv+F0WbBSCNNeeDFUhb
         Wv6Hm/4lPL/wMk0PR8zsVr6HjY9BSOLeq933voh5NW5Q0he5gBgeCmWWbit5L0hXQTha
         xAWg==
X-Forwarded-Encrypted: i=1; AJvYcCWpfiCWMNxSRl1pOMTmB1J66seHEXw+zvGFaxuppEBitDK/vy/0Jucknq2x0cp0IiSew9GbdCszetwrVg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx08uVh7Zt2Hp+kNmjAEM55z44S1hPxu7KlYEl35fTVAIsq2s5e
	8v+6IVIsbBDJK04x5vnR+awWaH5D6/J9y1z6jaSod9sL5pdMJUQhsDMjK21xyd8=
X-Google-Smtp-Source: AGHT+IFEJHC4rZXRkLgfnKMPzqA7B9JvTzO3tbZukAMVMQi69t3KSZUdjoFwdxWGHbJK+agz7xqErg==
X-Received: by 2002:a17:902:dace:b0:205:8b84:d5e8 with SMTP id d9443c01a7336-2058b84dad4mr100289045ad.18.1725373623730;
        Tue, 03 Sep 2024 07:27:03 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051555140csm82048875ad.244.2024.09.03.07.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 07:27:03 -0700 (PDT)
Date: Tue, 03 Sep 2024 07:27:03 -0700 (PDT)
X-Google-Original-Date: Tue, 03 Sep 2024 07:27:01 PDT (-0700)
Subject: Re: [PATCH 3/3] riscv: mm: Do not restrict mmap address based on hint
In-Reply-To: <tencent_A414DA7D8E69B831317A21368D057C378208@qq.com>
CC: Charlie Jenkins <charlie@rivosinc.com>, corbet@lwn.net,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, shuah@kernel.org, rsworktech@outlook.com,
  alexghiti@rivosinc.com, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: cyy@cyyself.name
Message-ID: <mhng-ad0c8c3b-568a-484d-bc3d-49b56a11dcd6@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_072705_689422_D20FD456 
X-CRM114-Status: GOOD (  24.70  )
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

On Mon, 26 Aug 2024 19:24:38 PDT (-0700), cyy@cyyself.name wrote:
>
>
>> On Aug 27, 2024, at 00:36, Charlie Jenkins <charlie@rivosinc.com> wrote:
>> 
>> The hint address should not forcefully restrict the addresses returned
>> by mmap as this causes mmap to report ENOMEM when there is memory still
>> available.
>> 
>
> Fixing in this way will break userspace on Sv57 machines as some
> issues mentioned in the patch [1].
>
> I suggest restricting to BIT(47) by default, like patch [2], to
> align with kernel behavior on x86 and aarch64, and this does exist
> on x86 and aarch64 for quite a long time. In that way, we will also
> solve the problem mentioned in the first patch [1], as QEMU enables
> Sv57 by default now and will not break userspace.
>
> [1] https://lore.kernel.org/linux-riscv/20230809232218.849726-1-charlie@rivosinc.com/
> [2] https://lore.kernel.org/linux-riscv/tencent_B2D0435BC011135736262764B511994F4805@qq.com/

I'm going to pick this up as it's a revert and a bug fix, so we can 
backport it.  If the right answer is to just forget about the sv39 
userspace and only worry about sv48 userspace then your patches are 
likely the way to go, but there's a handful of discussions around that 
which might take a bit.

>
> Thanks,
> Yangyu Chen
>
>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>> Fixes: b5b4287accd7 ("riscv: mm: Use hint address in mmap if available")
>> Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
>> Closes: https://lore.kernel.org/linux-kernel/ZbxTNjQPFKBatMq+@ghost/T/#mccb1890466bf5a488c9ce7441e57e42271895765
>> ---
>> arch/riscv/include/asm/processor.h | 26 ++------------------------
>> 1 file changed, 2 insertions(+), 24 deletions(-)
>> 
>> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
>> index 8702b8721a27..efa1b3519b23 100644
>> --- a/arch/riscv/include/asm/processor.h
>> +++ b/arch/riscv/include/asm/processor.h
>> @@ -14,36 +14,14 @@
>> 
>> #include <asm/ptrace.h>
>> 
>> -/*
>> - * addr is a hint to the maximum userspace address that mmap should provide, so
>> - * this macro needs to return the largest address space available so that
>> - * mmap_end < addr, being mmap_end the top of that address space.
>> - * See Documentation/arch/riscv/vm-layout.rst for more details.
>> - */
>> #define arch_get_mmap_end(addr, len, flags) \
>> ({ \
>> - unsigned long mmap_end; \
>> - typeof(addr) _addr = (addr); \
>> - if ((_addr) == 0 || is_compat_task() || \
>> -    ((_addr + len) > BIT(VA_BITS - 1))) \
>> - mmap_end = STACK_TOP_MAX; \
>> - else \
>> - mmap_end = (_addr + len); \
>> - mmap_end; \
>> + STACK_TOP_MAX; \
>> })
>> 
>> #define arch_get_mmap_base(addr, base) \
>> ({ \
>> - unsigned long mmap_base; \
>> - typeof(addr) _addr = (addr); \
>> - typeof(base) _base = (base); \
>> - unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base); \
>> - if ((_addr) == 0 || is_compat_task() || \
>> -    ((_addr + len) > BIT(VA_BITS - 1))) \
>> - mmap_base = (_base); \
>> - else \
>> - mmap_base = (_addr + len) - rnd_gap; \
>> - mmap_base; \
>> + base; \
>> })
>> 
>> #ifdef CONFIG_64BIT
>> 
>> -- 
>> 2.45.0
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
