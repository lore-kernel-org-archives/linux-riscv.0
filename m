Return-Path: <SRS0=diLN=LP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCADC4743C
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 14:13:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E381F6124B
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jun 2021 14:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E381F6124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Cc:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qBw6CdWq6KFmZZYaZH7QEdUr1ckiVjr2qN8zrdm8aP4=; b=PZasMNHP3R3rIRPNJPHssX3ZI5
	VT/Rbv2ucK5YyFjIvrK26J3MBpF2QCxpGoYyeMpK3O21FeTerH3EkOB9OrkWdyFlMiCzDbGPaY1nH
	FOMwhUJm9x+e3XEZJ709+EfXtSfNjNVQY+HLaHkHni/aidHj3kGffM+75uEP/PhsfZj36Hcuyxddi
	pCBtF0ySG/VUnijsqllBAc5L3rl4GiC9YCILHeF9BxSmAXlugAerOXsdgjUPNEpPWRZVPtAwQRhlc
	/m3XFzExp3ib/IAcv0Tto0z9KCWrsxocqbqtXkPwj7IDcIgqCp8agyl533d3csN5z9iuTq2X2HPU3
	+bRzlDBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvKgE-003hT7-7n; Mon, 21 Jun 2021 14:13:38 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvKgB-003hRM-76
 for linux-riscv@lists.infradead.org; Mon, 21 Jun 2021 14:13:36 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 o10-20020a17090aac0ab029016e92770073so59667pjq.5
 for <linux-riscv@lists.infradead.org>; Mon, 21 Jun 2021 07:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=cc:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uYXsev2NikLvniwUbGy7LLHqgqCmmM6+EMtNEtpgAt0=;
 b=A3E/kkKI7oDrgwcYmlIm7TxoWXPEMeBFJgw/BEl3Wi45bV6g18XiUpXkJCTvnYNnYa
 v9cL6izMATY3rsTGfQBgQhesZGDhpyf+0cWXOv0MGFTAYqz+46+mWIWKyhJKCOCZx2Av
 pT6rNqAbmIt9zP6MTs1NwRGNXj/jRXx/ofzYzHDSy9aD+Q8AHhJwOPCS0oA0TO+W1mzN
 JQdst+2QBrU/kw4WVLoA0XVWtRvnNlwLCVHmtrcyLjGqLA4yT1uH2oGLsvLGh9tggtMS
 QZLc6cOLqtCb7Nmd+EnnIAevvfhHi0DsV5YzbN+GnILNbmCFJ33Kwsbq5aiGrT+GFWbQ
 XBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:cc:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uYXsev2NikLvniwUbGy7LLHqgqCmmM6+EMtNEtpgAt0=;
 b=KuQt8M69ZmWJSEDAtCUHHlej9cu+qZNKCES9Iy5KX9ARu0Od+FPIxqCP+G4IGg3Y66
 jbW5GXQkyBcWCaVsp3i8zuVSvbwyBXSqVk+euRgu1ggG/XtTHCdDVX98WMfFmGD1/YMz
 XGNDI2Jn608wdXQWr2XpwKGaZJ6YFRTBxKuqtV+Gb/yAaW7jBDBDOma3c2vYt46kZoJY
 7A0LG65sNetDQr0iCspeybEisJ6We+mFyPTcjqSpKsQsH6vMYYS9y0GXKwCjTPxpHzqE
 Z6/su8y1L/7QtefPvglCtW2we3PgULIuol+ibAOOk5KeGXd6010VfyEILeLRBokuObxK
 DTww==
X-Gm-Message-State: AOAM531bMmBDSepb8tJfICt9Nuh5S4JcHNCbBmTrgLurFANIBVwplUxj
 SHS25NSlC4yTKLzLTA9jAs8=
X-Google-Smtp-Source: ABdhPJyg8hcybMXuKce2vGFsGlAouy8e9etcrrkQ6y6X7cXx5IaygdCtBCUIFnRuNPE7Va6f7684qw==
X-Received: by 2002:a17:90a:4101:: with SMTP id
 u1mr37335458pjf.59.1624284814088; 
 Mon, 21 Jun 2021 07:13:34 -0700 (PDT)
Received: from [192.168.1.123] (163.128.178.217.shared.user.transix.jp.
 [217.178.128.163])
 by smtp.gmail.com with ESMTPSA id d131sm15982113pfd.176.2021.06.21.07.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 07:13:33 -0700 (PDT)
Cc: akira.tsukamoto@gmail.com
Subject: Re: [PATCH 5/5] riscv: __asm_to/copy_from_user: Bulk copy when both
 src, dst are aligned
To: David Laight <David.Laight@ACULAB.COM>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <5a5c07ac-8c11-79d3-46a3-a255d4148f76@gmail.com>
 <4637f0f2-2da9-1056-37bf-17c0861b6bff@gmail.com>
 <4a847070ad494e839de1d3fc5b39ba57@AcuMS.aculab.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <061be1e7-9941-58fb-c2b5-feb2163883af@gmail.com>
Date: Mon, 21 Jun 2021 23:13:30 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4a847070ad494e839de1d3fc5b39ba57@AcuMS.aculab.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_071335_331547_071CF9F9 
X-CRM114-Status: GOOD (  24.69  )
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

On 6/21/2021 8:55 PM, David Laight wrote:
> From: Akira Tsukamoto
>> Sent: 19 June 2021 12:43
>>
>> In the lucky situation that the both source and destination address are on
>> the aligned boundary, perform load and store with register size to copy the
>> data.
>>
>> Without the unrolling, it will reduce the speed since the next store
>> instruction for the same register using from the load will stall the
>> pipeline.
> ...
>> diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
>> index e2e57551fc76..bceb0629e440 100644
>> --- a/arch/riscv/lib/uaccess.S
>> +++ b/arch/riscv/lib/uaccess.S
>> @@ -67,6 +67,39 @@ ENTRY(__asm_copy_from_user)
>>  	bnez	a3, .Lshift_copy
>>
>>  .Lword_copy:
>> +        /*
>> +	 * Both src and dst are aligned, unrolled word copy
>> +	 *
>> +	 * a0 - start of aligned dst
>> +	 * a1 - start of aligned src
>> +	 * a3 - a1 & mask:(SZREG-1)
>> +	 * t0 - end of aligned dst
>> +	 */
>> +	addi	t0, t0, -(8*SZREG-1) /* not to over run */
>> +2:
>> +	fixup REG_L   a4,        0(a1), 10f
>> +	fixup REG_L   a5,    SZREG(a1), 10f
>> +	fixup REG_L   a6,  2*SZREG(a1), 10f
>> +	fixup REG_L   a7,  3*SZREG(a1), 10f
>> +	fixup REG_L   t1,  4*SZREG(a1), 10f
>> +	fixup REG_L   t2,  5*SZREG(a1), 10f
>> +	fixup REG_L   t3,  6*SZREG(a1), 10f
>> +	fixup REG_L   t4,  7*SZREG(a1), 10f
>> +	fixup REG_S   a4,        0(a0), 10f
>> +	fixup REG_S   a5,    SZREG(a0), 10f
>> +	fixup REG_S   a6,  2*SZREG(a0), 10f
>> +	fixup REG_S   a7,  3*SZREG(a0), 10f
>> +	fixup REG_S   t1,  4*SZREG(a0), 10f
>> +	fixup REG_S   t2,  5*SZREG(a0), 10f
>> +	fixup REG_S   t3,  6*SZREG(a0), 10f
>> +	fixup REG_S   t4,  7*SZREG(a0), 10f
>> +	addi	a0, a0, 8*SZREG
>> +	addi	a1, a1, 8*SZREG
>> +	bltu	a0, t0, 2b
>> +
>> +	addi	t0, t0, 8*SZREG-1 /* revert to original value */
>> +	j	.Lbyte_copy_tail
>> +
> 
> Are there any riscv chips than can do a memory read and a
> memory write int the same cycle but don't have significant
> 'out of order' execution?
> 
> Such chips will execute that code very badly.
> Or, rather, there are loops that allow concurrent read+write
> that will be a lot faster.

For the above two paragraphs, the boom will be probably one of
them and perhaps U8, but I do not have a chance to try it.

I have run the benchmarks both the unrolled load store
and not unrolled load store and always unrolled version
was faster on current cores. We could discuss and optimizing
way when the Out of Order core comes out in the market
with comparing bench results on real hardware.

I really understand of your comments of concurrent read+write
that you have mentioned in the other thread too.

I just would like to make the current risc-v better
as soon as possible, since the difference is significant.

> 
> Also on a cpu that can execute a memory read/write
> at the same time as an add (probably anything supercaler)
> you want to move the two 'addi' further up so they get
> executed 'for free'.

The original assembler version of memcpy does have the `addi`
moving up the few lines up.
You really know the internals, I am in the between of making
the code easy to understand to make the patches in the upstream
and optimizing further more.

If you really like to, I will move the `addi` up at the time of 
when merging the patches to one which do not break bisecting.

Akira

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
