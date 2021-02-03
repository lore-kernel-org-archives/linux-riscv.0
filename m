Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E96DC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 02:27:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3259764F68
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 02:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3259764F68
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=rMqaN273v5b5g9bwfMloTXbCdcYj7ckUvc8PolzNtIs=; b=tljmUGGQvmSKDpULNKbtLbXmQ
	xJvNm6SSfOdiY0dYexkp/pjoGaXrfx+1H9KB+PkwSvVnXgJuHS3cTACM5LfDuU1BSo72Y3Wh8sSU6
	kLXmIhyp8E1Aey8EZxihxftjEQn+7tpYDQU0rNSsjcsES0YFCZPm4dZ6JHGUNgOEMCrMfDOZdHaSA
	7gvR0D1CPT22XNgkrJ6iNfYV/StMqIJChZm7A4XO0WuXg7otQJDV52TV87nRl1JS+iX/adabkrId6
	uC7jeBJQANhJ2s8giDqUc50OBb91uy88h/FgspNjEsl9oikA3ga3r+sXoGBnWjmwKIxqywovOkuSE
	CytbIsraA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l77tV-00051s-7t; Wed, 03 Feb 2021 02:27:49 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l77tS-000510-I9
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 02:27:47 +0000
Received: by mail-pj1-x1033.google.com with SMTP id gx20so3664504pjb.1
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 18:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=MIf4N24Ra3Xxgi/gfbzHMgCkQRiEtd0T6Pa2IWM5Gtk=;
 b=cHZnEnErr6ZHsS8F8ThRlcpP81DQ2KE5eG8MH3gx+QDQhOiVQNYj2CueqymCJxb8GA
 lDGGkSQMupS1ExXcsS1KXm86FMBYBukZ6NALe99uBHzeNuj72uhSVZgjHisVpJwiiKw+
 KQg+24Rdzsp3DLcWfxi2EHO3OnT/KEpIy9kRStUMSkE93RlZF5qRhaIMGEzWjyF6bGwW
 3Clf4I08mLquEtz7LRvedvE01DyC0t8RPVd11jnLcBu0PlXwW8tHsb4zHH+m/Cls7mY+
 AUr3QyBQv8s5CLwdMgn1JvqjE9ipbGkjq+avmENwpbRzFDqMcP8vejzn/P7vhuYT/42O
 59vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=MIf4N24Ra3Xxgi/gfbzHMgCkQRiEtd0T6Pa2IWM5Gtk=;
 b=GLNtAbgLyffkM7UiCLDqISomvDThhXwo4Nq7ARsdAnV0Vqlzr7zODXzu86XuekOkIs
 eSuCdZMK8C/N4iLvQkrVxby4YHLLtwqEM3fgBkbB6Qgu6YZfUSiav0KjJuC5273Tnyhn
 8A0lNic/UZIIiUqJ6glcm3V9IRSzwVRv6vJ/sleVQw/zrLtPx0HW3g6xQjkEoYa3bh+W
 IrOEXrD1pMUsN1nGH1m5tvPUEFkmVdBHl+nOWDzatW4aZD6d6ysE6TSqWVcrBWVKx1JY
 nkvDbieSjsFLGY8lcf3IlHDtpImv/vrQC8dlPArdGZSAGYfdBVMteOSDYuoyAb/MtX1y
 Ookg==
X-Gm-Message-State: AOAM532embGIF4vVFagtIlUWfqzSCTJc7gjEmzINFdPgBUZRj2lc+fWT
 EdqQzJoCLwX2jslXDNYLWn4kSA==
X-Google-Smtp-Source: ABdhPJwrCIbSVemibRCRVFOJKG32f1WNuTK+0z2lQyV26CT0gklaAyDRXTGJdKAGP57dfBFO8URYgg==
X-Received: by 2002:a17:902:12c:b029:e1:aac:e6f4 with SMTP id
 41-20020a170902012cb02900e10aace6f4mr947455plb.26.1612319262976; 
 Tue, 02 Feb 2021 18:27:42 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u3sm297863pfm.144.2021.02.02.18.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 18:27:42 -0800 (PST)
Date: Tue, 02 Feb 2021 18:27:42 -0800 (PST)
X-Google-Original-Date: Tue, 02 Feb 2021 18:22:38 PST (-0800)
Subject: Re: Kconfig-induced build errors: CONFIG_PAGE_OFFSET
In-Reply-To: <CAMuHMdWb8We=-L3mrZi5dSc308rapqH8NyAq9OJU=Qo7YijGpw@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: geert@linux-m68k.org
Message-ID: <mhng-9b4a74fd-62d8-421f-8150-9147da7e39b2@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_212746_758238_7DF285ED 
X-CRM114-Status: GOOD (  18.89  )
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
Cc: aou@eecs.berkeley.edu, atishp@atishpatra.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 29 Jan 2021 05:52:51 PST (-0800), geert@linux-m68k.org wrote:
> Hi Atish,
>
> On Thu, Jan 28, 2021 at 9:09 PM Atish Patra <atishp@atishpatra.org> wrote:
>> On Wed, Jan 27, 2021 at 7:18 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>> > I took a riscv-32 .config from kernel test robot (it was for a clang build)
>> > and did a "make olddefconfig" (using gcc tools) and got build errors
>> > due to this config item from arch/riscv/Kconfig;
>> >
>> >
>> > config PAGE_OFFSET
>> >         hex
>> >         default 0xC0000000 if 32BIT && MAXPHYSMEM_1GB
>> >         default 0x80000000 if 64BIT && !MMU
>> >         default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
>> >         default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
>> >
>> > PAGE_OFFSET is undefined for the case of 32BIT && MAXPHYSMEM_2GB.
>>
>> Because, RV32 doesn't support 2GB physical memory yet.
>>
>> The compilation errors can be fixed by not allowing MAXPHYSMEM_2GB for RV32 and
>> MAXPHYSMEM_1GB for RV64. How about this ?
>>
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -253,8 +253,10 @@ choice
>>         default MAXPHYSMEM_128GB if 64BIT && CMODEL_MEDANY
>>
>>         config MAXPHYSMEM_1GB
>> +               depends on 32BIT
>>                 bool "1GiB"
>>         config MAXPHYSMEM_2GB
>> +               depends on 64BIT && CMODEL_MEDLOW
>>                 bool "2GiB"
>>         config MAXPHYSMEM_128GB
>>                 depends on 64BIT && CMODEL_MEDANY
>
> Thanks, works fine on litex-vexriscv.
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Atish: did I miss an actual patch?  I just see diff here.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
