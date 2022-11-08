Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38B9C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 17:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xH5L4gcSKLaNgKJtGfHlhqMUXsSDDRC9Im4IaicNuUw=; b=SWmdBjaVpkxRsA
	IA+3HDkj55EMiXPGAt3itZuf92X+HTB9gVxeuMHWspSlOd2XuhL03qoHeqRnOIbJKu48micUCi2J2
	q4WSStP4tfuxxXG/VJRPT0hJxck1PG1S2HNAdapf4sF7jHoLJritP5TttgvbTeFZ7AcfGNyxixy7J
	9cwK/nHvfQpNzWCfpUsbbH/muBLsr7aXPiZxebR7/lke614MSAnB6/eaU0z5Np5Kof/IoVSXiGW38
	ASKPD3d4uSoeX0+nduaItY3TKRVN+wJFBl7oB/TP/CG04GBg2OybylEOUTSQsM8Eakhxyg4GRbxMG
	Su8p+TnKlW6h9JPfBSsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSMD-0071Ei-Ps; Tue, 08 Nov 2022 17:25:53 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSMB-0071D6-Lu
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 17:25:53 +0000
Received: by mail-pj1-x1031.google.com with SMTP id b11so14425609pjp.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Nov 2022 09:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mck3R94LhYNk406NiNL9I97e3U5JD8+7t2CAdhzICvI=;
        b=41hH195DPKgo007bMbrxjr9I0oWip9wXLMeY4vGMz89oEGfbItSBF2r72B8+mLwh5b
         LwQCRcDOZH/lcNU73TgDtXor+9cughyeUTNpwysFf+d4LqWiPx1Nl7p8kPiIkb3Oxzvi
         zOA+04XqAjEun79374OtU70Z4SEy0yWffqehBwUNjhc+7R1vc9g8P6PnFiu17/Hpsfda
         2o96k0JqekD/GggiS+gnmBELi5Q1wiunCxZ0F3Lv9to/uS8JGY54ikzjWwcR40Hs8GHo
         3Qr9gwjw3mew3Xu/NN1f7raqX5krmfawwRprhT1Z0fOVQK4onQgPF0CAYNQgcmQCFWcd
         hbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mck3R94LhYNk406NiNL9I97e3U5JD8+7t2CAdhzICvI=;
        b=heMfNXxw9rofS1UEudbQ/kKiyJx+npRILbGpGjo5gkYXO2rBLR4JBPFaesIlBlp4N+
         3eno01y2TCoR/oqec71wDnbf9PTMtwLPzOtkLyW9XA0Rdj4naWhQUr+NDQbE8qBiJOP5
         T936HYCCP+2kXdZp5r1XspxY1l5LI6erobVwCpJGX6vNqH/hZ/4IRG7sAQxZyYg7JYfB
         6XV6zII3oFxJj0iiIeUrKggwuq0Q7u87QKXq57B5SMj1/avq8EP9VBTcgMPi3dORMBBV
         RRraHCPt0dbVuRqka/s4vEGfaUgar4PR2Xm6g6CSjw1dlW8y7sYcKlHgsjHqoTLpo1Po
         1I8w==
X-Gm-Message-State: ACrzQf0ncSVfhb9jVU4CW5NriDAW3aBIjVKgGlYwTwIb9utZVxhqL+zD
	GaPxrv6PbQsbspPr9QpD4iIW3Q==
X-Google-Smtp-Source: AMsMyM6sTBnxvY/NsG71n933NQZ67F/l2/Icp154DLO0ppLjfuN27MFxKkBOhJfyYluxvAX3KJcKeA==
X-Received: by 2002:a17:902:b94c:b0:178:336f:13d6 with SMTP id h12-20020a170902b94c00b00178336f13d6mr58156215pls.64.1667928350306;
        Tue, 08 Nov 2022 09:25:50 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id p64-20020a625b43000000b0056bdc3f5b29sm6581656pfb.186.2022.11.08.09.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 09:25:49 -0800 (PST)
Message-ID: <d3dc1dac-a17a-4e5d-2584-88bd7645ac1d@rivosinc.com>
Date: Tue, 8 Nov 2022 09:25:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v10 05/16] riscv: Add has_vector/riscv_vsize to save
 vector features.
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>,
 Greentime Hu <greentime.hu@sifive.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Guo Ren <guoren@kernel.org>, Conor Dooley <Conor.Dooley@microchip.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
 <221f72a2ee62cd5350edb5d6a7e8ebb17a7bc321.1652257230.git.greentime.hu@sifive.com>
 <YoHzkxDmMegp5oOz@infradead.org>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <YoHzkxDmMegp5oOz@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_092551_726108_6D375ECB 
X-CRM114-Status: GOOD (  16.41  )
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

On 5/15/22 23:47, Christoph Hellwig wrote:
> On Wed, May 11, 2022 at 08:31:15AM +0000, Greentime Hu wrote:
>> +#ifdef CONFIG_VECTOR
>> +#include <asm/vector.h>
>> +EXPORT_SYMBOL(rvv_enable);
>> +EXPORT_SYMBOL(rvv_disable);
>> +#endif
> 
> As far as I can tell these are not used by any modular code, just by
> the later added kernel mode vector enable helpers.
> 
> Even if they were used this would need to be EXPORT_SYMBOL_GPL.

In the new version, I've made them static inline given the size and 
frequency of them being called. So this becomes moot.

> 
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2012 Regents of the University of California
>> + * Copyright (C) 2017 SiFive
>> + * Copyright (C) 2019 Alibaba Group Holding Limited
>> + *
>> + *   This program is free software; you can redistribute it and/or
>> + *   modify it under the terms of the GNU General Public License
>> + *   as published by the Free Software Foundation, version 2.
>> + *
>> + *   This program is distributed in the hope that it will be useful,
>> + *   but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + *   GNU General Public License for more details.
>> + */
> 
> No need for all the GPL boilerplate text when you have an SPDX tag.

OK.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
