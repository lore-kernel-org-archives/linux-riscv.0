Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F667C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 09:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LdyHf9dLIk7+Yccxp7ofGHtWHXsXFgdZttU485tf6s=; b=VuFUmP5mglt/2DBDwwc6qI+9dQ
	FjXWX3taRokk26A5z/x0AT9E9XhYe5dwh045vTgC0SHJOTBoM8yzHlrBrd3zREKaKeTYdjKM/5t41
	IWZ+RHxgGUSuce3pqLZmGBq9Vxby1JmeTdSfWksWvpBAyfXl5CiNEfUifd21qZssV+Bg6MTuvxUcl
	vvt4Q0q6TwAyleJ+aFeocpJpCWNYmD1M3izbn6FDUfxf0R6Ksn5UYuo2/8U/82JDbAUZ/Ov2HKSwj
	OwhoBXLW73xMeeGagR1hQsPOrV2b5mrlNVRKGh43GEOMlVfUtTVpl4BRJEkhsiTscjunvlDhWmGwP
	09a6TXEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8FJ-006usa-AR; Thu, 24 Nov 2022 09:10:13 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy8FG-006up1-9S
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 09:10:11 +0000
Received: by mail-pj1-x1033.google.com with SMTP id j10-20020a17090aeb0a00b00218dfce36e5so3463622pjz.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 01:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d7AMntFoCTbaF7u0FxUzgKfkJmKiQktIj1df1EHq8pU=;
        b=1S2l4+owYsD6IrHxF9YOfpJi6VcRr1zuzHv5hwjzVJx8ggKZZcYCuJfFtrBEYkJ4J9
         1UAsRy1WzWayp7b4qCwbAFAzggFuBtbpP9VfjPbfyas20VgiSPDK20VjlBYKjarAUhG2
         9eEzUAHlB55RHaQTSlbuJkfagGnuMQ87x98O2FIiOiaQ2jsiTY4di26D9ChmnEA8Y246
         8R+gMXRQqAQ3kzV9Y93rNP0yyt4MZ+rSvhKg4qqMwBmVxChrFAR2/X9j4NYPZHlTBC/Z
         G6ggEPtVNmVFBULxaDTHw8fMQhGUp/V/Gxc0ffu7+6oLqFFFw/Bhztw+NugmxMLkYOdG
         rFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7AMntFoCTbaF7u0FxUzgKfkJmKiQktIj1df1EHq8pU=;
        b=LNL/NFMQedYPdXpQeBb709CMLYCYoK4/mrTh/O5otGUkSQ1NuVYozwkcjBf3AG3lft
         v2f3JJyIrBoMl8VO4pYpHn4DmtZ3I8WasjQqbYYJq9kvEVDFImg5AtTpgRBMlWBpksBI
         /uTSj8RA3q5hTVIYRgOwgA2wQz1MB5Sbcgan9hh5Lgs/e+DwsypBTpNoIRIliljJs0a9
         YHT8nG+pmemN2k9tLAhI1c0U9xJbbTbbudNQbFdyb/E/4x9Rt+5yl64T0BBjROTmV0ku
         wD1Wy8pmEdxgNhWR4bXf+EvzvaWAj6VLJ6hava1GCkxo4ZuDqCJnS2qTuTVrniLyn6Rc
         RB5A==
X-Gm-Message-State: ANoB5plIRLp4SOiIQrmMIxh3xCfWYJ2YAtwg4zV4TvXEjWNuQwa8uUhx
	INV65+NCAWb6SR2kFsvEBnicXQ==
X-Google-Smtp-Source: AA0mqf42LcyoRzWh9McsWHPxstgGrkf+OE0vINQkkhl36i06YZUTlxob6EKRoCvgVfaoQuZSbV9S7A==
X-Received: by 2002:a17:90a:5909:b0:214:291f:87b5 with SMTP id k9-20020a17090a590900b00214291f87b5mr34624200pji.115.1669281008755;
        Thu, 24 Nov 2022 01:10:08 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id 22-20020a621616000000b0053e468a78a8sm672742pfw.158.2022.11.24.01.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 01:10:08 -0800 (PST)
Date: Thu, 24 Nov 2022 01:10:06 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Guo Ren <guoren@kernel.org>, palmer@dabbelt.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH] riscv: VMAP_STACK overflow detection thread-safe
Message-ID: <20221124091006.GC1896875@debug.ba.rivosinc.com>
References: <20221124005006.1788315-1-debug@rivosinc.com>
 <CAJF2gTQ=Vr6neABtz9JSCei6oPEsyWTpb-Y=Rxt5jy6n1VEtGA@mail.gmail.com>
 <CAKC1njRfxNx8r5SP7qsbouCFfb1L4w63paQibb=cFCBhWDXNXA@mail.gmail.com>
 <CAJF2gTRC-qm76=aaLh75amO0JJLO2P4eZaJXH-TBSV0c7iqUBA@mail.gmail.com>
 <20221124071022.GA1149630@debug.ba.rivosinc.com>
 <Y38ydMoqmqOPfBs0@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y38ydMoqmqOPfBs0@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_011010_346420_A06143FD 
X-CRM114-Status: GOOD (  20.50  )
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

On Thu, Nov 24, 2022 at 08:59:32AM +0000, Conor Dooley wrote:
>On Wed, Nov 23, 2022 at 11:10:22PM -0800, Deepak Gupta wrote:
>> On Thu, Nov 24, 2022 at 02:31:25PM +0800, Guo Ren wrote:
>> > On Thu, Nov 24, 2022 at 1:57 PM Deepak Gupta <debug@rivosinc.com> wrote:
>
>> > > On Wed, Nov 23, 2022 at 5:28 PM Guo Ren <guoren@kernel.org> wrote:
>
>> > > > On Thu, Nov 24, 2022 at 8:50 AM Deepak Gupta <debug@rivosinc.com> wrote:
>
>> > > >> Fixes: 31da94c25aea835ceac00575a9fd206c5a833fed
>> > > >
>> > > > The patch gives more significant change than the Fixes, and Fixes would expand to the previous stable versions. Please don't set it as a Fixes, but an improved OVERSTACK dead path performance feature.
>> > > >
>> > >
>> > > Not a performance feature but more like correctness.
>> > > If kernel died and two CPUs raced to kernel stack overflow,
>> > > death post-mortem should be straightforward.
>> > We already have had a fixup, and your patch likes a feature with a
>> > significant change.
>> > https://lore.kernel.org/linux-riscv/20221030124517.2370-1-jszhang@kernel.org/
>> > If it is for correctness, the simple lock is enough.
>>
>> Sure lock is enough. It's different way to solve the problem. But I don't
>> think it qualifies as significant change.
>
>Something to bear in mind is where in the cycle we are - there's likely
>just over a week left before v6.1.
>Since the lock is sufficient to fix the problem for v6.1, it's easy to
>view this patch as an optimisation or improvement that should go on top
>of that, smaller, patch.
>Especially when you have some questions yourself about the correctness
>for 32 bit!

Yes I'll have to revise the patch to accomodate 32bit.

>I've got no technical comment to make about the discussion here, but
>looking in from the "outside", that's the easy conclusion to jump to.
>
>
>>	REG_S x31, TASK_TI_SPILL_REG(tp)
>>	asm_per_cpu sp, overflow_stack, x31
>>	li x31, OVERFLOW_STACK_SIZE
>>	add sp, sp, x31
>>	REG_L x31, TASK_TI_SPILL_REG(tp)
>
>btw, for this sort of thing, could you please use some whitespace to
>align the operands? Makes things significantly more readable.
>

Noted. I'll do that.

>Thanks,
>Conor.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
