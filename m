Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77B2C7115B
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 19:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ebJO0U7scjBs+0vfoPT0CaxulF7gYiSn8Srs3RrkcQA=; b=gcn7UMhug0mNdQJh1CddEgiOw6
	Nn/Wk7LjEivzaYBsg8L/NgBO0k8lZJY2CVDN+Gn2uBBRiejKNky2EPR9SVS5fRsVnJVlisnj9T+XL
	uVwUU8w5gA+bKUewJf8LHzavT6AV1fvDAuNK6fQ9lNz0y989hIcegEL4+dAHuW6Pe9i1epMe//fgu
	7g6WUiTR2TZaHr5Lpuk3105SgfENSQKVbvk8cLS4KSid4/7hDi+sffytgTFiS5xZLJhELChlIAmMI
	0/stElfirGHTXY3tmTT56ihY3gWfdXfiiaiNTMTHVzVmO8/p/gMqT9OGBk3+6T40nlqOjFizzOExl
	+u/8b1fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRywV-0000000BHi7-0DKR;
	Wed, 18 Jun 2025 19:59:31 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyvl-0000000BHea-3faK
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 19:58:47 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23636167afeso969915ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 12:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750276725; x=1750881525; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I20Ut8doZNHX8U8yLXVDaxEsIOgjNYrMNmiLkf6cgHg=;
        b=V8ybHWRd5JcCd/IfI+C/G/0A8ikPoAlAcuH5ZisGm1mAE5hY8KlGwyzngQ/MQ2Cku+
         15UYb318bh+Sit0H04YO/s9gxui8uwouaOdLk4+P+gZUyc34MhV2OroQV9KdpoKvzbfP
         4mSkIMG9O3NbcxXNg8Pr9t5ujDVOj0hHGu6pu8OPy3MOq0h/c6rtOjv3K0psixM2rTD9
         cju53ram0B3QT00Q+59vdMSPgXFiZmOnAI8sJIJ+vwgZgf7Js2z4P1qSLPQsc75SS3Em
         A7MwGuuwW77F1nlN+BnrWZBhVAyUaRkKsCaRmog/F/PKzklD04JFwXHa68EYuN01vVos
         L7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750276725; x=1750881525;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I20Ut8doZNHX8U8yLXVDaxEsIOgjNYrMNmiLkf6cgHg=;
        b=uPLUGQs4xjeh0fN5a9ll2manvePP36WKrQ7Zc3/QbYWO+Ji4M1DEyGuoeFih49fZsi
         4rNL00unJEbhEeqzlgLjqcLkMBgvCONZw/efvbX+/b/ko1majM1jcUJfjtPOLC+7CLSE
         UH7kVJacP9prryANuG+f48wi3hcBjwTc1SDeoKVjk2BQoWLt9OmrXu4g32aJ+ZXqd5Zl
         uNNuPE1s7b3rEdrOJjJoh+vbYiMJx9VHUFL3iaEnWT0W4ea/hWFKqartUrA6KYSV0pbM
         Bn5K1EoajlLm7rlxACyeDCDXcMqHt2BZt41BX/Xp1KZ3zb/GagDu0EZhVJhwJ+WQhuRv
         A1MA==
X-Forwarded-Encrypted: i=1; AJvYcCWLJIq/YccglaI3Wfg0yILmwftAsevt9Q0NvBSmyzXHl2BYoA9BNT2YIhxGu7XJKdl2qtT+NYW6oLrnjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQD+4kUkyWlXqxE/Q20Ga2OerUXK7Hjj5iZXmkD/DCH5ULr/W3
	J03JW60RiKNo3tYs9DDbXaSvKp5bZXX7onP19v8e939HQzwF9m98SrmBzwzeDOyaBtQ=
X-Gm-Gg: ASbGncse9ks770mc9RsxCVpv+y69hw6+5CM0Duh0Gh0xp5QAgJo6MvrzBnLKUrvPRlH
	a/CvgZwinu1MR8nFhaTShEcSqc5S3kQbhMnMNiHAwwelL5w6Mn4QyNoxotHxwqDYRGaXGEuiL8G
	KOVyGwAcwktpxC9CYlO7QIKBeVXEGzFYdP37NHq/D9fsp2uurI7lrKLGZVQNgkKMoxe1T9C8kT6
	wE9+rQiNd9bmodEtorq6WIycmAR1fDYBGc8zrn5cUrFw/Ki8VkfCM7wtiGJ7WpmspexP2OowI2O
	vJg9bdAH1fulvqMVgT2nh7o9Defodcedyr36OAjlCxFLhOGGDZ+kptER30mx
X-Google-Smtp-Source: AGHT+IGUYYsO2qdcRtNiMa6p2LaT5Au7HiEOyF+g5OMOytBszGUohndY00urZUVU1t/JvFtnxcCJZQ==
X-Received: by 2002:a17:902:f683:b0:232:59b:58fe with SMTP id d9443c01a7336-2366b3169f9mr285322055ad.1.1750276724715;
        Wed, 18 Jun 2025 12:58:44 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:ac69])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365dea8ccbsm104676625ad.167.2025.06.18.12.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 12:58:44 -0700 (PDT)
Date: Wed, 18 Jun 2025 12:58:44 -0700 (PDT)
X-Google-Original-Date: Wed, 18 Jun 2025 12:58:42 PDT (-0700)
Subject: Re: futex(0x1ffffff81300000) on risc-v -> mm panic
In-Reply-To: <20250618132559.J2jP-TbE@linutronix.de>
CC: rtm@csail.mit.edu, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: namcao@linutronix.de
Message-ID: <mhng-CC013FD5-8FF2-40EB-902C-AA0078E99AB4@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_125846_151638_3141EB0B 
X-CRM114-Status: GOOD (  16.37  )
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

On Wed, 18 Jun 2025 06:25:59 PDT (-0700), namcao@linutronix.de wrote:
> On Wed, Jun 18, 2025 at 07:10:28AM -0400, rtm@csail.mit.edu wrote:
>> This program on risc-v:
>>
>> main(){
>>   futex((void*) 0x1ffffff81300000, FUTEX_WAIT, 0, 0, 0, 0);
>> }
>>
>> results in:
>>
>> BUG: Bad page state in process a.out  pfn:81500
>
> I cannot reproduce this issue. Can you please share your .config?

It's also not reproducing for me -- or even compiling for that matter, 
but I stuck one that compiles over at 
<https://github.com/palmer-dabbelt/palmer-tests/blob/main/rtm-futex.c> 
(I figured this was a good excuse to start piling up some tests).

> Also, your kernel seems to have some commits on top. Are you sure none of
> those is the reason?

This is on my fixes branch right now, with defconfig + 
CONFIG_DEBUG_VM=y.  So maybe it's one of these patches, or moybe it's 
some other configuration thing?

I'm also running this in QEMU virt, rv64gc, smp=4 (in case that 
matters).  I've got a buildroot-based userspace with glibc.

>
> Best regards,
> Nam
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
