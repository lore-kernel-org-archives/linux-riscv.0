Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A8DC04FDE
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 19:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=EdL+3TCd1aQSkSMu0L0n0n3O2bsw90cKgyzAy0fLIBA=; b=Vl+wxohEfmedYNctaEx0Mn7MJp
	bu3yfE8kWUrO/ZzIp1Nr1WjWflidsI1w4rQs7kCDDfyNh2dD50UtVSzJc3BXyqImG3+eZQvxBKVe+
	R6IDkJtQ6iA3S4tB6T0V3zCDKiODj8/Mc0qmmPVTf4vz5AMjy/av51qauBLbCsJG7Hay3I1UhEOBk
	8trXGGV87AWoeJDJkwlk6V3GT+VJzt59xShNUkfTDZRZTORHDl5LBPad1Sk0Ft0iXPvtuxCFwLK4e
	h05Y75++y0NKkget1PqCeh39UthU9PoZdjdxSNfimcS46u1W5vU75z3Zzg8NGOH2ctn2H4ZaSrMsm
	D9uqVezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3idb-00AYEP-OF; Fri, 09 Dec 2022 19:02:23 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3idY-00AYCU-N2
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 19:02:22 +0000
Received: by mail-pl1-x633.google.com with SMTP id s7so5836051plk.5
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 11:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifbs+XvCCj88/lcEt+puLfhmeo1egK0Vk+w9LlAMKCg=;
        b=4Rux6t4XmWwM+AknbpI8EYJc9d8VlB3qnwjbOs49K3WO+P5jJU1+SQ464MA3SixwIF
         HXx9q016B9LtUUNhDzn7MkogCb6STF29kNMA/FkejErP+M+0OLHG720Cip1FpFvfuFDr
         HSIgQ03aKzkWHpNMNzwlJUs61r7NvVoJIJPYoXcczX4hzP0bC3dAHycWmISlTudW0uew
         XwAGc64f154MvDdb+8+DDQOzzZ30IolvjuUiJ4bQn5bTfH2NcHdJUrMYASykY3KtiEYY
         BCx7jxkJlYFqUkBTBj5g/C2PgGRuHZi7SCWUVkiIMtyByuICcB0Sa5ca+p4HgIXBYeGD
         nmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifbs+XvCCj88/lcEt+puLfhmeo1egK0Vk+w9LlAMKCg=;
        b=EeiCboSZIqvFAA0c+tHAOL2S7zAFurX/U7FjGxWyT+f1W/bP1kY7DvQPtWywx9PS6k
         PlNv5N7asHXAGX5//ZAZGcMsso59jlihcIKKOOiqQreX9oQzQ3czKrMjo/IWABF8EZKQ
         zh699uz/mRjZyMtJ+iPscxk2xswpKV+oei1sPV7QRtuhjTOEkMHPZMb7P+bMCkwtbnzU
         whKoLZC89MCpfBPkfVsih3FiZ62Q3MXCrHHaGw+evYTaZw+ECe6Gy65jP2CDqZQcReOV
         faJF4zuvjgqMsy7VLBX63cM25FlKVAVJw0JLhNve2akzVd0UZ/QTbnuydle27ikThzkf
         gpaw==
X-Gm-Message-State: ANoB5plub1iX7zeFcmDv4KY9IEzyCvbNGu2tNrS8ZomftV1+GhKoJEMw
	iqDJ1Hyp9F11QDamYhDEdRl+Ag==
X-Google-Smtp-Source: AA0mqf73AMcFFrVohNub6mN09kcuHEzO/Hjroa+swPIGqWYmTtnt7v9b2T2Xg9Oh7qblqYdsuiF+gA==
X-Received: by 2002:a17:902:cf06:b0:187:261a:8441 with SMTP id i6-20020a170902cf0600b00187261a8441mr7902841plg.16.1670612538799;
        Fri, 09 Dec 2022 11:02:18 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id b14-20020a170903228e00b00189c536c72asm1669977plh.148.2022.12.09.11.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 11:02:18 -0800 (PST)
Date: Fri, 09 Dec 2022 11:02:18 -0800 (PST)
X-Google-Original-Date: Fri, 09 Dec 2022 11:02:12 PST (-0800)
Subject: Re: [RFC PATCH] riscv: vdso: remove hardcoded 0x800 .text section start addr
In-Reply-To: <Y3+XmWazrB0RURfI@xhacker>
CC: ajones@ventanamicro.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-599fbea8-24d0-4d59-896f-7ce09eb6c1c6@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_110220_781773_E9FEF608 
X-CRM114-Status: GOOD (  28.84  )
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

On Thu, 24 Nov 2022 08:11:05 PST (-0800), jszhang@kernel.org wrote:
> On Thu, Nov 24, 2022 at 11:32:55AM +0100, Andrew Jones wrote:
>> On Thu, Nov 24, 2022 at 12:18:05AM +0800, Jisheng Zhang wrote:
>> > It seems the hardcoded 0x800 isn't necessary, but removing it brings a
>>
>> s/, but/and/
>>
>> > small vdso.so and aligns with other architectures.
>>
>> This commit message didn't really satisfy my desire to understand why
>> the comment and '. = 0x800' were there in the first place and if its safe
>> to remove now, so I tried to do some of my own digging. I found
>>
>> commit 5b9304933730 ("x86 vDSO: generate vdso-syms.lds")
>> commit f6b46ebf904f ("x86 vDSO: new layout")
>>
>> which removes the comment and hard coding for x86 by changing the vdso
>> Makefile. Then looking at
>>
>> commit 9031fefde6f2 ("arm64: VDSO support")
>>
>> we see that it starts with the new Makefile approach and doesn't bother
>> with the hard coding from the start. As riscv also started with the new
>> Makefile approach it also could have dropped the hard coding from the
>> start (I guess).
>>
>> >
>> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>> > ---
>> >  arch/riscv/kernel/vdso/vdso.lds.S | 8 +-------
>> >  1 file changed, 1 insertion(+), 7 deletions(-)
>> >
>> > diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
>> > index 150b1a572e61..7be7e618d59c 100644
>> > --- a/arch/riscv/kernel/vdso/vdso.lds.S
>> > +++ b/arch/riscv/kernel/vdso/vdso.lds.S
>> > @@ -31,13 +31,7 @@ SECTIONS
>> >
>> >  	.rodata		: { *(.rodata .rodata.* .gnu.linkonce.r.*) }
>> >
>> > -	/*
>> > -	 * This linker script is used both with -r and with -shared.
>> > -	 * For the layouts to match, we need to skip more than enough
>> > -	 * space for the dynamic symbol table, etc. If this amount is
>> > -	 * insufficient, ld -shared will error; simply increase it here.
>> > -	 */
>> > -	. = 0x800;
>> > +	. = ALIGN(4);
>>
>> I realize 4 is used here now because I questioned the 16, but after doing
>> my digging I think a larger alignment may be better. Loading the text may
>> be done with 8 byte or larger reads, so having the section aligned to a
>> larger size would be better reading it. We might as well use 16, like
>> arm64 does, and like you had before?
>>
>> Also, having enough separation between data and text seems to be
>> important for cache reasons, based on the comment in
>> ./arch/x86/entry/vdso/vdso-layout.lds.S and other vdso history.
>> Maybe we should move .note, .eh_frame_hdr, and .eh_frame below
>> .rodata like x86 has it?
>>
>
> Thank you so much for pointing out the two commits and above
> separation, new version will be sent out soon.

Not sure if I missed the v2?  I can't find one.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
