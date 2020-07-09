Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9124EC433DF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 20:54:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BEC320672
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 20:54:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VAj43oAf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="RmcOQKDr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BEC320672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=VvDUkhkSUXxuPEkhZKJ8F5GZmTt6Tdjlqr7PARpVii8=; b=VAj43oAfU3/mvWhIi5F+USme7
	qFs3fbVRNwBFV07J+x5DYek2aI/hZq1TCcbLP1zvB69XB67rBD+cdsH7VHTVC4TdyTefG5HUNULeR
	6obmZrc1xe0yS/hp4Rggwzkvw72MsPi9Cp7MiDIW2x1TRdxKfdGpsez+RMocSgsxcVGa5zQF2tSi1
	untoHBC5GYPedridX47Ol5HWDHmW9ElFLD0a9rUXRqAUioBdwxqiLWs1YrhpSanbQvQX7jClaKx+E
	+vj+R7VQ/hkhhE+10vPZAqVyf+ELLWE8brxKHs4scbZoXfczi2gHI4hdFyDhhfdM4NpMZzLE/L/pc
	6dJQ5Q+vg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtdZ3-0000eg-I2; Thu, 09 Jul 2020 20:54:41 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtdYy-0000cQ-0y
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 20:54:37 +0000
Received: by mail-pl1-x641.google.com with SMTP id x9so1316549plr.2
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 13:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=TVsRdosVdOrgb86VUqLK7jhphF0DWrgDdhx+LVQ5W9o=;
 b=RmcOQKDrKS4TjND+INPK5tStmtBHyi5qtg3Y2/m9cYCZFW0uO+IsLknrvepsIgymvM
 1rl8Qh9/awqelifoBxaCYJMhnqffwoXjTs28EWlKt/CYudymkz1bs5PReyMJxMNTy+kP
 VLBVpcaqzusSMmJ0G2K7yF/PXcUGPYm2ytCjhz+pZTEsf1xaskMKyxLQ7VN4tyQWYhT5
 uCR73NTeWBkQNZGAK+oBDrbqr+Wdo37GJKjNCSc9EjpVYVpEnN4c+t+NA2rCRpG4xao1
 S/e+ZozWba84kJcqWLJpfkRM3NcJ/IAYnDfAqxHH7dreMJytVTh97TQQMiu68P1KnCos
 35yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=TVsRdosVdOrgb86VUqLK7jhphF0DWrgDdhx+LVQ5W9o=;
 b=Apd0IgIxazkgPv7wtYp5Jq0M1XjKJvBLeG1WuHV1MPQdWv9u9g04oWZcNPyuumfJQe
 H89hrlBAs93Lno+nFuJ+9HtBvnlF9IafWjkYmWrY+0fAF5Qjju/rY+LIQtwi5ipSXIR1
 l9yhXDwbt9U/53dT0AJAORLu48Ml7pFONYOqVkGkCZ8t9OJUBzNH6CsSMuUBT6LejXU8
 vfoB8erSu7tSMfSAF8JLKVCSmu1MxiaD9nsRfJOr8bvkxwqNKHB/POm8B/EXT9MJVX/h
 EyJH+3ZoLDKbFINXByEFz1hR8e6dWxOZOfj2lXUCbexCbLcV8fuEjovTxea2VeiOCGS0
 aNZg==
X-Gm-Message-State: AOAM532s3+B9ON9HY/IuvlYPEnSLvdLokGAytHkAPRz4j6E4SC3X2zkL
 G+a+K8guRGzRfe4oz5p9jDmIomkgTafc3vWW
X-Google-Smtp-Source: ABdhPJziIZaC2dw+9NZRbd8F8njrpqBsYNP/YdbUiTKDLO5hKbULu6MH/NnhmS/fwOD8OTxyeRAVaQ==
X-Received: by 2002:a17:90b:4c0f:: with SMTP id
 na15mr1998077pjb.33.1594328073688; 
 Thu, 09 Jul 2020 13:54:33 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f131sm3700561pgc.14.2020.07.09.13.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 13:54:33 -0700 (PDT)
Date: Thu, 09 Jul 2020 13:54:33 -0700 (PDT)
X-Google-Original-Date: Thu, 09 Jul 2020 13:54:30 PDT (-0700)
Subject: Re: [PATCH 1/5] lib: Add a generic version of devmem_is_allowed()
In-Reply-To: <20200709204921.GJ781326@linux.ibm.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rppt@linux.ibm.com
Message-ID: <mhng-809d2d2d-add0-4f43-9225-610485ee46d5@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_165436_108975_B5AE0088 
X-CRM114-Status: GOOD (  24.73  )
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
Cc: mark.rutland@arm.com, steve@sk2.org, davidgow@google.com,
 catalin.marinas@arm.com, linus.walleij@linaro.org, elver@google.com,
 glider@google.com, willy@infradead.org, zong.li@sifive.com,
 mchehab+samsung@kernel.org, linux-riscv@lists.infradead.org,
 alex.shi@linux.alibaba.com, will@kernel.org, dan.j.williams@intel.com,
 linux-arch@vger.kernel.org, uwe@kleine-koenig.org, alex@ghiti.fr,
 takahiro.akashi@linaro.org, paulmck@kernel.org, masahiroy@kernel.org,
 linux@armlinux.org.uk, krzk@kernel.org, ardb@kernel.org,
 bgolaszewski@baylibre.com, kernel-team@android.com, pmladek@suse.com,
 zaslonko@linux.ibm.com, aou@eecs.berkeley.edu, keescook@chromium.org,
 Arnd Bergmann <arnd@arndb.de>, rostedt@goodmis.org, broonie@kernel.org,
 matti.vaittinen@fi.rohmeurope.com, gregory.0xf0@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, rdunlap@infradead.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 mcgrof@kernel.org, james.morse@arm.com, mhiramat@kernel.org,
 akpm@linux-foundation.org, davem@davemloft.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 09 Jul 2020 13:49:21 PDT (-0700), rppt@linux.ibm.com wrote:
> Hi Palmer,
>
> On Thu, Jul 09, 2020 at 01:05:48PM -0700, Palmer Dabbelt wrote:
>> From: Palmer Dabbelt <palmerdabbelt@google.com>
>>
>> As part of adding support for STRICT_DEVMEM to the RISC-V port, Zong
>> provided a devmem_is_allowed() implementation that's exactly the same as
>> all the others I checked.  Instead I'm adding a generic version, which
>> will soon be used.
>>
>> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> ---
>>  include/asm-generic/io.h |  4 ++++
>>  lib/Kconfig              |  4 ++++
>>  lib/Makefile             |  2 ++
>>  lib/devmem_is_allowed.c  | 27 +++++++++++++++++++++++++++
>>  4 files changed, 37 insertions(+)
>>  create mode 100644 lib/devmem_is_allowed.c
>>
>> diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
>> index 8b1e020e9a03..69e3db65fba0 100644
>> --- a/include/asm-generic/io.h
>> +++ b/include/asm-generic/io.h
>> @@ -1122,6 +1122,10 @@ static inline void memcpy_toio(volatile void __iomem *addr, const void *buffer,
>>  }
>>  #endif
>>
>> +#ifndef CONFIG_GENERIC_DEVMEM_IS_ALLOWED
>> +extern int devmem_is_allowed(unsigned long pfn);
>> +#endif
>> +
>>  #endif /* __KERNEL__ */
>>
>>  #endif /* __ASM_GENERIC_IO_H */
>> diff --git a/lib/Kconfig b/lib/Kconfig
>> index df3f3da95990..3b1b6481e073 100644
>> --- a/lib/Kconfig
>> +++ b/lib/Kconfig
>> @@ -676,3 +676,7 @@ config GENERIC_LIB_CMPDI2
>>
>>  config GENERIC_LIB_UCMPDI2
>>  	bool
>> +
>> +config GENERIC_LIB_DEVMEM_IS_ALLOWED
>> +	bool
>> +	select ARCH_HAS_DEVMEM_IS_ALLOWED
>
> This seems to work the other way around from the usual Kconfig chains.
> In the most cases ARCH_HAS_SOMETHING selects GENERIC_SOMETHING.

Ya, it seemed kind of odd.

>
> I believe nicer way would be to make
>
> config STRICT_DEVMEM
> 	bool "Filter access to /dev/mem"
> 	depends on MMU && DEVMEM
> 	depends on ARCH_HAS_DEVMEM_IS_ALLOWED || GENERIC_LIB_DEVMEM_IS_ALLOWED
>
> config GENERIC_LIB_DEVMEM_IS_ALLOWED
> 	bool
>
> and then s/select ARCH_HAS_DEVMEM_IS_ALLOWED/select GENERIC_LIB_DEVMEM_IS_ALLOWED/
> in the arch Kconfigs and drop ARCH_HAS_DEVMEM_IS_ALLOWED in the end.

There's some arches that can't be converted to the generic version, at least
not trivially, so we wouldn't drop it.  I think it's still cleaner, though.
I'll send a v2.

>
>> diff --git a/lib/Makefile b/lib/Makefile
>> index b1c42c10073b..554ef14f9be5 100644
>> --- a/lib/Makefile
>> +++ b/lib/Makefile
>> @@ -318,3 +318,5 @@ obj-$(CONFIG_OBJAGG) += objagg.o
>>  # KUnit tests
>>  obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
>>  obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
>> +
>> +obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
>> diff --git a/lib/devmem_is_allowed.c b/lib/devmem_is_allowed.c
>> new file mode 100644
>> index 000000000000..c0d67c541849
>> --- /dev/null
>> +++ b/lib/devmem_is_allowed.c
>> @@ -0,0 +1,27 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * A generic version of devmem_is_allowed.
>> + *
>> + * Based on arch/arm64/mm/mmap.c
>> + *
>> + * Copyright (C) 2020 Google, Inc.
>> + * Copyright (C) 2012 ARM Ltd.
>> + */
>> +
>> +#include <linux/mm.h>
>> +#include <linux/ioport.h>
>> +
>> +/*
>> + * devmem_is_allowed() checks to see if /dev/mem access to a certain address
>> + * is valid. The argument is a physical page number.  We mimic x86 here by
>> + * disallowing access to system RAM as well as device-exclusive MMIO regions.
>> + * This effectively disable read()/write() on /dev/mem.
>> + */
>> +int devmem_is_allowed(unsigned long pfn)
>> +{
>> +	if (iomem_is_exclusive(pfn << PAGE_SHIFT))
>> +		return 0;
>> +	if (!page_is_ram(pfn))
>> +		return 1;
>> +	return 0;
>> +}
>> --
>> 2.27.0.383.g050319c2ae-goog
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
