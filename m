Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459B7C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 04:29:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8007A60F9B
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 04:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8007A60F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=KeiSEqWrgRfA0b7KBwEY4KX1CN+J8Gwf2M/MpCHzVeE=; b=Istw542rcRi2s9zpfsgL0w7swj
	5wpqnTM6jkhX51KcQHeDNbcNXfUfcf/s+G5vWfKf7CXwE+t85PYUMkPWGiLCvJvagLLEEcl+hBMy1
	Uo1mr3+u/NTBsiXb2Xu5srDAssfUbrLN6ytT9PF22rW0ai2IuNRMslcmbgA0BTXJ46ZWjNg7aD78M
	9Y9NhSw5VWkkk5A0McROj179ZVmGPUYRwmUdgu3Xh/MtrOkEmgcmX5lpL/Dz/DEXA9G3hFO0xQVYp
	OWlVy4phIlRn+EJDWUtd/Xx99xK/9+6ntNipGcXY0U3q7ImN9m0tUs9YnfUDRRKnuNJ71YqJMB0X8
	YbQxQW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgJVo-009oUS-Hw; Fri, 29 Oct 2021 04:29:04 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgJVl-009oU4-Ey
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 04:29:03 +0000
Received: by mail-pj1-x102c.google.com with SMTP id np13so6318335pjb.4
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 21:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=1lw9CL6foQSlTHkgeMHIdtLwuJ0uzL85uTSVuDRoqTU=;
 b=4A88KEGK5lrhNn28n8g4+fu6NXvRjD7W437RHy4cNqHn8iB80kxqThDBcjcrk5mRX/
 008A/H33D1cXAKxcegdnF3iedtK1/oC1r7FiF+kcsPkJOAcWyR+Zcdc2Avl2gGKFosNG
 lsoSAMHBroL2nKxHSuBDagm1nnhVID4undXpkHmsZekfg8OpYvz0t+WAIleBKGMefwiK
 oju4ZEdFAKWUPOQVmF+PcPrPONkvDsXLB4HNf5NakjaCcx0seDz7ECG3gOJj82UBZg7s
 YTfopF00P20zEf7K2zyDDto7ZMzGLFTaYZ5JFPRdRim5fSVjIlToesUxbojcFRZES5oX
 ETlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=1lw9CL6foQSlTHkgeMHIdtLwuJ0uzL85uTSVuDRoqTU=;
 b=KzrM+zSib+ucuQXBAL74Nkv7UJ2HgmY1uutkRtxeXtwKowqElkym+rLa9q5PxDQvul
 3rXN4d+1fPLkVdXGjY/XEzHKxAsNEEGi+2utsXR0TwT+S3JLrdpNRfFymUimjWt06VCl
 Qdk3azm94PuErOwSBbj1774v+UQhVph3e/lwJ4PfnPrVIkC0g7OJ9auhXYS5wHb8WMuv
 5EanaFyfhVGp5O0Po90kkcAjGoQ5X7tAXnNBH0C3PUDVnEc9OrKkDCFer344+9PFZyXc
 1mqtNODU02HcIDt99ttCRIRoSWErnVues2XRKmzeotD/n8RtA53W6t6QMf+KpKlVVUIU
 4oyw==
X-Gm-Message-State: AOAM532pybAjXq9KkptogS9AnwQcFxv+FuO5js4Isfevyp3vUcfmyxKS
 u4n32VE70W2ryDUZO8rXlale0Q==
X-Google-Smtp-Source: ABdhPJw8xG0v7xWQxIJa0aMj2CwuoZQd+hB6fK4AAtAvMU+VrzOpOVXpYcs484b4w1MuP4fR36HJ0w==
X-Received: by 2002:a17:902:d2cf:b0:141:b347:df9d with SMTP id
 n15-20020a170902d2cf00b00141b347df9dmr291173plc.37.1635481738594; 
 Thu, 28 Oct 2021 21:28:58 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d11sm5308221pfl.173.2021.10.28.21.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:28:58 -0700 (PDT)
Date: Thu, 28 Oct 2021 21:28:58 -0700 (PDT)
X-Google-Original-Date: Thu, 28 Oct 2021 21:28:55 PDT (-0700)
Subject: Re: [PATCH v1 1/1] delay.h: fix for removed kernel.h
In-Reply-To: <20211028182303.GA711390@roeck-us.net>
CC: andriy.shevchenko@linux.intel.com, gor@linux.ibm.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 hca@linux.ibm.com, borntraeger@de.ibm.com, 
 agordeev@linux.ibm.com, akpm@linux-foundation.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux@roeck-us.net
Message-ID: <mhng-dd929e9e-e3e3-4d04-a6a6-2c005f8c24df@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_212901_625420_ADE35FBA 
X-CRM114-Status: GOOD (  13.59  )
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

On Thu, 28 Oct 2021 11:23:03 PDT (-0700), linux@roeck-us.net wrote:
> On Thu, Oct 28, 2021 at 08:01:43PM +0300, Andy Shevchenko wrote:
>> To be folded to the commit 0d280a9fbbd9 ("include/linux/delay.h:
>> replace kernel.h with the necessary inclusions")

I can't find that in any of my trees, so I'm assuming this is targeted 
at something else.

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

Thanks!

>>
>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
>> ---
>>  arch/riscv/lib/delay.c           | 4 ++++
>>  arch/s390/include/asm/facility.h | 4 ++++
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/arch/riscv/lib/delay.c b/arch/riscv/lib/delay.c
>> index f51c9a03bca1..49d510ba75fd 100644
>> --- a/arch/riscv/lib/delay.c
>> +++ b/arch/riscv/lib/delay.c
>> @@ -4,10 +4,14 @@
>>   */
>>
>>  #include <linux/delay.h>
>> +#include <linux/math.h>
>>  #include <linux/param.h>
>>  #include <linux/timex.h>
>> +#include <linux/types.h>
>>  #include <linux/export.h>
>>
>> +#include <asm/processor.h>
>> +
>>  /*
>>   * This is copies from arch/arm/include/asm/delay.h
>>   *
>> diff --git a/arch/s390/include/asm/facility.h b/arch/s390/include/asm/facility.h
>> index e3aa354ab9f4..94b6919026df 100644
>> --- a/arch/s390/include/asm/facility.h
>> +++ b/arch/s390/include/asm/facility.h
>> @@ -9,8 +9,12 @@
>>  #define __ASM_FACILITY_H
>>
>>  #include <asm/facility-defs.h>
>> +
>> +#include <linux/minmax.h>
>>  #include <linux/string.h>
>> +#include <linux/types.h>
>>  #include <linux/preempt.h>
>> +
>>  #include <asm/lowcore.h>
>>
>>  #define MAX_FACILITY_BIT (sizeof(stfle_fac_list) * 8)
>> --
>> 2.33.0
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
