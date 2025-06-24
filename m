Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39560C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 13:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YFlv9LOm3/fl2CGr6pET2B+kbL8eFR7WPSfxA7sXtlY=; b=TtUdwUyzTNcYQl
	Js5Q3oHBRGwLQte09awePp3/mP8wmioZ8LLV7WPLGxBZZZZ2bRKdvnwqnaeRPOXIwdH4ErTYEYESc
	WI5EdbAm+G2xNjj01EdMOb5QHO+F9E0rF8uqw6NzTehJVR+gil2RIsO0x4ar/JDyYSBk3XaIawKkL
	27IsTfnbsljxwsJAP4FtH4qE2ETace8x7AjLQq71PhQbetKDkCmGBbfWDZ4K7j+VOOeiC598p1Reg
	gql9uyvKSQDSyt48Yw9NiXlFY68dEfyrYN6qKzfkxhKpEVOPRWgsmnQhQi1WGP2FsiZAk/EcMVF+v
	Nyxne6Irz1YsdHdBhZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3Ol-00000005fuf-3LTS;
	Tue, 24 Jun 2025 13:09:15 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3Oi-00000005fu0-30bd
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 13:09:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4536c6b2506so437835e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 06:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750770551; x=1751375351; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbX9Uex4uDqQrjo1IMKC5QJV+aFv1JyAj570tEl8UMs=;
        b=CG1BG98psA+OdXXiGLLVgErWb831wJ4JHYuH9F4NI8lozSie6T6KLxDRUmCFdsASqp
         m29rj8sTc9cyBJzoq3SO05g/M66YyClpStUmJyiGliasrG0De39fVGjlJ//EBmXa4WDz
         HYrCaciZyt3ZTtLtsnX37s9I83CZGKvkek/4d+DD7rLePxCRLDzHituSvGJmPPowdQEB
         Y9T29bYJ8+exvARQPCIJkOE3W0cewJI1XMTAnZkx3imVGpEONrrKRTTcXw+WeCKl2n6N
         ldf98WY4ErrE0+5lu6xuI+Pp1ABO/x2Rbz4jptmEQowAYNnhJXpvwe+JSIeXr851EAm/
         Cmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750770551; x=1751375351;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tbX9Uex4uDqQrjo1IMKC5QJV+aFv1JyAj570tEl8UMs=;
        b=cwUAR6L1f03bhiJGD8f0Z8izwvtJzdw+CMWOdCCxryVK75DPSdsetYNeLz7EZNlmKl
         wwgpNGyBElOOqtkJiDAiUC23BaFrJDKKYv2Rjgn5Ha5jj/bVu+v7NY/TIEJukWlHh8E7
         /242R2v7CcFGUYSffpsW9J7Jl2KZD+yM+8XagEOnpBNeWMlYwz+zIeo+eGlK9Edk/psU
         5bMig8fj1pesZ4kpQui488gapeuGnvXefL+jL5mYu6y4sjjUkHhymcgbMPft/7wjDAIV
         187jStxclrlXzjbDSEs5ffNoNVTIG3QgtwLt0f8yy9yL4xBTUeRRG46WuIyO8mbVq+1H
         pSpQ==
X-Gm-Message-State: AOJu0YwrgEY6shle5QVbezECHCQgk/pQAvUKkQSaO8leDm9L37dKPNsC
	Dj7PSmuX42Kmh4fYu6KqFlMOz90xyMMqZcboHbWSLk8c4ZA3EiCZ2qL4kalBGKENrpM=
X-Gm-Gg: ASbGncsGYXVVLWhQykQFBoKROLJDRYv1LFbG3kUVhL0qZOh4+J5faaQP2Wv6nSbfVXc
	6vPMGm07NIXKwhfYv68eXJPn2He5q4Qz4rMkEUKzBIIvsijMVFwr1jjLkYZ1Hm6hcTvmhW/Ww6/
	AM9NTOFU+CeSS31HbIckcSWP6UnJBIros8h2vPMDpaLTLSA6JpJTB0p4DIZqLmb9IoM5t1KQgj0
	1Pz3/fbvtGmr+ffXd9hl0OdeO7NDe7XYqzQiov7ezBqdlPKdS+VHrqTjhy+tcCwwNtvAKohrjz6
	pOuiyS44e3WAfCRVEfNo7y+Uc39iu+2t0GIkKVPcGzhklUJ3xf/Ga60FwPXny0DEpSuhyA==
X-Google-Smtp-Source: AGHT+IHLyqpQ2L0/HxAVYH8zaUo9/78YcAJU66JWhWRRX6Iocb5sQWqQnegkrlHDzIHVDiiRW2HaGg==
X-Received: by 2002:a05:600c:1e8a:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-453659dd769mr67708255e9.8.1750770550920;
        Tue, 24 Jun 2025 06:09:10 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b00d:6d5f:6e67:f5e8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e741b43sm178430385e9.0.2025.06.24.06.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:09:10 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 24 Jun 2025 15:09:09 +0200
Message-Id: <DAUSD38QIV6D.1YO5ASNI3EUGV@ventanamicro.com>
Subject: Re: [PATCH v2 3/2] RISC-V: sbi: remove sbi_ecall tracepoints
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, "Atish Patra" <atishp@rivosinc.com>,
 <ajones@ventanamicro.com>, <cleger@rivosinc.com>,
 <apatel@ventanamicro.com>, <thomas.weissschuh@linutronix.de>,
 <david.laight.linux@gmail.com>
To: "Palmer Dabbelt" <palmer@dabbelt.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250619190315.2603194-4-rkrcmar@ventanamicro.com>
 <mhng-516082EA-5A9A-4A76-9448-70828749F95F@palmerdabbelt-mac>
In-Reply-To: <mhng-516082EA-5A9A-4A76-9448-70828749F95F@palmerdabbelt-mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_060912_756979_0C672926 
X-CRM114-Status: GOOD (  14.38  )
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

2025-06-23T15:54:00-07:00, Palmer Dabbelt <palmer@dabbelt.com>:
> Having patch 3 of 2 is not normal.

Sorry, I wanted to distinguish it from the original series without
sending a new one, because it's quite radical proposal I don't
necessarily want to get merged.
Would "[RFC 3/2]", "[RFC 3/3]", or something else look better while
raising the same alarms?

> On Thu, 19 Jun 2025 12:03:15 PDT (-0700), rkrcmar@ventanamicro.com wrote:
> So the issue is the extra save/restore on function entry?  That's the 
> sort of think shrink wrapping is supposed to help with.  It's been 
> implemented in GCC for a while, but I'm not sure how well it's been 
> pushed on (IIRC it was just one of the SPEC workloads).

Yes, shrink wrapping could help if compilers can figure out what to do
with static_keys. It's hopefully going to sort itself out in the future.
We'd ideally have some way to tell the compiler to always keep the
tracepoints inside their branches, to make them less fragile, but that
is probably asking too much from C.

I think GCC 15.1 had some shrink-wrapping improvements, but I've only
been using 14.3 so far...

> That said, this is kind of hard to reason about.  Can you pull out a 
> smaller example?

I posted an example of the original 8 argument ecall in v1:
https://lore.kernel.org/linux-riscv/20250612145754.2126147-2-rkrcmar@ventanamicro.com/T/#m1d441ab3de3e6d6b3b8d120b923f2e2081918a98
For another example, let's have the following function:

  struct sbiret some_sbi_ecall(uintptr_t a0, uintptr_t a1)
  {
    return sbi_ecall(123, 456, a0, a1);
  }

The disassembly without tracepoints (with -fno-omit-frame-pointer):
(It could have been just "li;li;ecall;ret" without frame pointer.)

   0xffffffff80016d48 <+0>:	addi	sp,sp,-16
   0xffffffff80016d4a <+2>:	sd	ra,8(sp)
   0xffffffff80016d4c <+4>:	sd	s0,0(sp)
   0xffffffff80016d4e <+6>:	addi	s0,sp,16
   0xffffffff80016d50 <+8>:	li	a7,123
   0xffffffff80016d54 <+12>:	li	a6,456
   0xffffffff80016d58 <+16>:	ecall
   0xffffffff80016d5c <+20>:	ld	ra,8(sp)
   0xffffffff80016d5e <+22>:	ld	s0,0(sp)
   0xffffffff80016d60 <+24>:	addi	sp,sp,16
   0xffffffff80016d62 <+26>:	ret

With tracepoints, the situation is worse... the optimal outcome would
add two nops, but the actual result is:

   0xffffffff80017720 <+0>:	addi	sp,sp,-48
   0xffffffff80017722 <+2>:	sd	ra,40(sp)
   0xffffffff80017724 <+4>:	sd	s0,32(sp)
   0xffffffff80017726 <+6>:	sd	s1,24(sp)
   0xffffffff80017728 <+8>:	sd	s2,16(sp)
   0xffffffff8001772a <+10>:	sd	s3,8(sp)
   0xffffffff8001772c <+12>:	addi	s0,sp,48
   0xffffffff8001772e <+14>:	nop
   0xffffffff80017730 <+16>:	nop
   0xffffffff80017734 <+20>:	li	a7,123
   0xffffffff80017738 <+24>:	li	a6,456
   0xffffffff8001773c <+28>:	ecall
   0xffffffff80017740 <+32>:	nop
   0xffffffff80017744 <+36>:	ld	ra,40(sp)
   0xffffffff80017746 <+38>:	ld	s0,32(sp)
   0xffffffff80017748 <+40>:	ld	s1,24(sp)
   0xffffffff8001774a <+42>:	ld	s2,16(sp)
   0xffffffff8001774c <+44>:	ld	s3,8(sp)
   0xffffffff8001774e <+46>:	addi	sp,sp,48
   0xffffffff80017750 <+48>:	ret
   [Tracing slowpath continues to 202.]

i.e. we spill 3 extra registers, which is at least better v1.  I'll try
again with GCC 15.1, and get back if it actually improves the situation.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
