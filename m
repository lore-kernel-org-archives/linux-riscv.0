Return-Path: <SRS0=X6bA=GR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF0FC433E0
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 19:47:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 076742343B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jan 2021 19:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 076742343B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=nelha+8jwlm8Ohx0AyS2BzzwRQLWria/v7CX3ov0Z4Q=; b=nO7NBwGYTyhQGjTcPvW7kMauD
	d+2I6S4ghVaKBMb02fi3IHUFhKg5rtTMsMun1+z2kKva8o68cNN3U/pJf2OTNzDiJqrrOnrwjCf1z
	1Oa7vca/ZYkdwbD1Fp73VHGLqtWhkwgXCfUZkm/SU577UeAZH2v2gf/02HQn55TNsh1vGBdBAkhJG
	zkLnHRWuvAP/aXgX0WVKzul2+2qL5GRgjt6zC/lW85zLmfphxfwxi+o31thmhvZVqkFNZMPTnVGjP
	kewgFL3kGDzbdxyYJE7LFFsrwo1Maa4vTYRn/5SiWTwMhAW4t9Ptf96JXSBAh4exvaYJ6pLUp2QTb
	ngdt7Ze+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l08a6-000140-Pr; Thu, 14 Jan 2021 19:46:54 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l08a4-00013Q-EL
 for linux-riscv@lists.infradead.org; Thu, 14 Jan 2021 19:46:53 +0000
Received: by mail-pf1-x42c.google.com with SMTP id c79so3997826pfc.2
 for <linux-riscv@lists.infradead.org>; Thu, 14 Jan 2021 11:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=zhioZvV+r4fFwCqQkXpsP5zDQ159hRRkEm/rP3sSAhw=;
 b=jLpR+y7JcSVCEWiVGH0PQhcticHXkso7HHKSFRnbUplsQy9azcPgakQrOVqfX2lGG0
 TxXTfaafryZFSDC0kYOSZYSEHYvql2xtRAw4ZqMK9oiHkp1lhKixpCE2bO3/4iGyVcO1
 RudVAMy4VCGx51m2JXaMMUU9HSSMPfenZzF/qfsksrcIUE1FgZazDHp0LWdk6iPHB4aw
 vRERbCX0dc8rhaZn/dig7YipISfCEsMEy/nQf1ycsDtuHiExFlMz2AdtwNUT+nJfWZzQ
 yKUT4jjwxL7YlKh7GlwEJg79UmCatv9Ng8VBrFKANozUNoGRHug0EqzAAj2q3aFLEz0Y
 Fq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=zhioZvV+r4fFwCqQkXpsP5zDQ159hRRkEm/rP3sSAhw=;
 b=Ga9skmZlXpM/PgvnF29UpBVouiKLq+usJOJ87UgdQyveqKRGnZxWNygj+Z/CQKfEoA
 o+H0H8gYViSeY0O1ALmb7SxPyjwFp/laLPocLNbFEaIonSRebtREyvQ8totxBPR+FNbv
 gBarCGo+ZoPtgxgqCOkbEAiji31bUsMcNFX146q2O4AbEv11FinRRTwR6nYy/R78SUPm
 amfJdMB0rVvWD+l9TGZ4rmDJrqFWDiLJNJZQ9AbA/pFSh7niif5SZWvk5+Ooa6CK5mcW
 aLVDvd4zCgTqbLVEsVcc4q4KxYTJG2M1EX5LGU7/8YsQl7Awf8Kq05oOVp4fXRAyoFXo
 yisA==
X-Gm-Message-State: AOAM532RWlz9cG/j3RwSubCwfm+VkS9j+ErYnC4mEF8iQT6cbNR2Cyuw
 l1/mj/3DOvX95tAGOBKZ5rryyg==
X-Google-Smtp-Source: ABdhPJwChzvje/sEu0mKBw3x+Gljo8EFgwO/vrqp2ASGrMbMqmQO59kB4L64YDyDW9yC6MKJy06h0Q==
X-Received: by 2002:a65:4347:: with SMTP id k7mr9036167pgq.186.1610653609881; 
 Thu, 14 Jan 2021 11:46:49 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id i7sm5957229pfc.50.2021.01.14.11.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 11:46:49 -0800 (PST)
Date: Thu, 14 Jan 2021 11:46:49 -0800 (PST)
X-Google-Original-Date: Thu, 14 Jan 2021 11:46:47 PST (-0800)
Subject: Re: [PATCH 3/4] RISC-V: Fix L1_CACHE_BYTES for RV32
In-Reply-To: <CAOnJCU+mCPwbeOQpmHmu3ar_17otmgftiKHLL+Z4_nExpj0=cA@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-4458ef4d-9443-491e-9118-aec3596058ed@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_144652_627966_FD87F4B6 
X-CRM114-Status: GOOD (  29.24  )
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
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, ardb@kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 mick@ics.forth.gr, linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 14 Jan 2021 10:33:01 PST (-0800), atishp@atishpatra.org wrote:
> On Wed, Jan 13, 2021 at 9:10 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Thu, 07 Jan 2021 01:26:51 PST (-0800), Atish Patra wrote:
>> > SMP_CACHE_BYTES/L1_CACHE_BYTES should be defined as 32 instead of
>> > 64 for RV32. Otherwise, there will be hole of 32 bytes with each memblock
>> > allocation if it is requested to be aligned with SMP_CACHE_BYTES.
>> >
>> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> > ---
>> >  arch/riscv/include/asm/cache.h | 4 ++++
>> >  1 file changed, 4 insertions(+)
>> >
>> > diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
>> > index 9b58b104559e..c9c669ea2fe6 100644
>> > --- a/arch/riscv/include/asm/cache.h
>> > +++ b/arch/riscv/include/asm/cache.h
>> > @@ -7,7 +7,11 @@
>> >  #ifndef _ASM_RISCV_CACHE_H
>> >  #define _ASM_RISCV_CACHE_H
>> >
>> > +#ifdef CONFIG_64BIT
>> >  #define L1_CACHE_SHIFT               6
>> > +#else
>> > +#define L1_CACHE_SHIFT               5
>> > +#endif
>> >
>> >  #define L1_CACHE_BYTES               (1 << L1_CACHE_SHIFT)
>>
>> Should we not instead just
>>
>> #define SMP_CACHE_BYTES L1_CACHE_BYTES
>>
>> like a handful of architectures do?
>>
>
> The generic code already defines it that way in include/linux/cache.h
>
>> The cache size is sort of fake here, as we don't have any non-coherent
>> mechanisms, but IIRC we wrote somewhere that it's recommended to have 64-byte
>> cache lines in RISC-V implementations as software may assume that for
>> performance reasons.  Not really a strong reason, but I'd prefer to just make
>> these match.
>>
>
> If it is documented somewhere in the kernel, we should update that. I
> think SMP_CACHE_BYTES being 64
> actually degrades the performance as there will be a fragmented memory
> blocks with 32 bit bytes gap wherever
> SMP_CACHE_BYTES is used as an alignment requirement.

I don't buy that: if you're trying to align to the cache size then the gaps are 
the whole point.  IIUC the 64-byte cache lines come from DDR, not XLEN, so 
there's really no reason for these to be different between the base ISAs.

> In addition to that, Geert Uytterhoeven mentioned some panic on vex32
> without this patch.
> I didn't see anything in Qemu though.

Something like that is probably only going to show up on real hardware, QEMU 
doesn't really do anything with the cache line size.  That said, as there's 
nothing in our kernel now related to non-coherent memory there really should 
only be performance issue (at least until we have non-coherent systems).

I'd bet that the change is just masking some other bug, either in the software 
or the hardware.  I'd prefer to root cause this rather than just working around 
it, as it'll probably come back later and in a more difficult way to find.

>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
