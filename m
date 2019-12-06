Return-Path: <SRS0=e5Sa=Z4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0287C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2019 00:07:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97DFB2466E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2019 00:07:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D6NFeuWj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="r1Bedri4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97DFB2466E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=kUpOJQefmiRWaqiccWD5rTSjoLJgGcTJ0W8QqP0Mn44=; b=D6NFeuWjiiZo/t
	Yw2Hm8vUWoG++E7FOmU3hx4MhwX3e42F36xhjK8PZAztbQnCnQy67v7X6PQuLRt3jsT60/L+wXXQp
	68q3cQVLY/1Jw/mw5SJVVbmTV7wQTT6Dzg1iK6v2j5Xwgh8de1cWzqT9Hib+BjJvLS/rqSXJJfTZc
	wa1sVQu72lzkq6SPK6LTeV7eUbn5bxRD7+VVp+lFIxQ7zpr2Uxo7GN+3x5UdlhyznOzLaigm8rArI
	04XgL03b4jF4ktYEMY3j5YunEwZ3WJUp1s/SVcKp84I63ua+zRxrXX6DmKplHX9lncLp9I5ul7EOk
	vTeTsG6MwEwkFIJ1Sevw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1id19L-0004WM-80; Fri, 06 Dec 2019 00:07:11 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1id19I-0004W1-8h
 for linux-riscv@lists.infradead.org; Fri, 06 Dec 2019 00:07:09 +0000
Received: by mail-pj1-x1044.google.com with SMTP id z21so1930122pjq.13
 for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2019 16:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=kUpOJQefmiRWaqiccWD5rTSjoLJgGcTJ0W8QqP0Mn44=;
 b=r1Bedri4QBDLhwq3y/zBM4j/+JZcv+RtyTMClHCllt2i2+4tt7K5jx+dOPEx+fckDX
 ksL9Qr1VX9au938oOw+7zA5GRj9lEt6d/3wSXeCtCUVZ0+RvIMtrP163qk7DpKaK1hk3
 mTgruym2XxcX/h4oK+UZtvwLNHeOYfyKLhN9rwznDT5ZmtkmV1C8I2FRuXzcTDgdOXB8
 qYFFyu2IERM5EladsF8Sd8FZFnc5Lt27Iylkd/WNgTRpSXM6/VlqBSEW6ZKnnUjgVy7M
 bvrK77/cPq9WuU48jXh8hk6ayz+XKRE2R4oBuRq2VPusQ6gFsXK7s7SUDL+O6u+y2syf
 ZuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=kUpOJQefmiRWaqiccWD5rTSjoLJgGcTJ0W8QqP0Mn44=;
 b=E4UEy9K6ZZPwhHtRaxIt2z8FrwC6d4LfAO6bQejewQ6TFCxNcnGidKEYe5qMdlhwmD
 MDYNrShXIUqdj0VBx1mvRICXkAOTOMwvbBaZZ887InyFyB8xPk8qUwAm845PQvxj8o83
 elrr3hc2gC3DIhehDsWmyXshndxYhgvckk/0fcv5QkIFm2WI0TbnqJYvZtmGhn09BuNP
 DCwGZnBdWAz9RiukE8vhD9gma4yhMEONHqPXr5/Hgpgf9iAISn1Zp2+wILdyXdJJse1g
 1jX/Ne8zoyFd3yFZsl8B6aGGZN6zC+Lbt6vrETanX1BOoD4a1iulLA5JFCkRTo9wtPEE
 wFoQ==
X-Gm-Message-State: APjAAAUP2QHde1ea5Cp/+6k9voVeDc4LsrMIb+ZCtaZkSH+EZ3QU1P7H
 +DBMaXGYmbW4/Jci0Er8AI6BjTeEzyI=
X-Google-Smtp-Source: APXvYqxbZvIoeUEaRi1mNVsIXFTds7DsWwO7uwUlg67dqWvhAn3lf24GxieJ45r0WU6TWflmbMNdaw==
X-Received: by 2002:a17:902:7d98:: with SMTP id
 a24mr11967939plm.321.1575590825316; 
 Thu, 05 Dec 2019 16:07:05 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7f69:cd98:a2a2:a03d])
 by smtp.gmail.com with ESMTPSA id s60sm832298pjb.3.2019.12.05.16.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 16:07:04 -0800 (PST)
Date: Thu, 05 Dec 2019 16:07:04 -0800 (PST)
X-Google-Original-Date: Thu, 05 Dec 2019 16:07:01 PST (-0800)
Subject: Re: [PATCH v2 2/2] riscv: Set SHMLBA according to cache geometry
In-Reply-To: <7faf1c8c-86cb-f47a-511b-bcc6a916b9c4@gstardust.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: consult-mg@gstardust.com
Message-ID: <mhng-56d3620d-5177-4c78-a353-a9e8c5b1a567@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_160708_333369_7D10253C 
X-CRM114-Status: GOOD (  23.96  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 05 Dec 2019 15:58:25 PST (-0800), consult-mg@gstardust.com wrote:
> Palmer Dabbelt wrote on 2019-12-05 18:03:
>> On Tue, 26 Nov 2019 14:44:46 PST (-0800), consult-mg@gstardust.com wrote:
>>> Set SHMLBA to the maximum cache "span" (line size * number of sets) of
>>> all CPU L1 instruction and data caches (L2 and up are rarely VIPT).
>>> This avoids VIPT cache aliasing with minimal alignment constraints.
>>>
>>> If the device tree does not provide cache parameters, use a conservative
>>> default of 16 KB:  only large enough to avoid aliasing in most VIPT
>>> caches.
>>>
>>> Signed-off-by: Marc Gauthier <consult-mg@gstardust.com>
>>> ---
>>>  arch/riscv/include/asm/Kbuild     |  1 -
>>>  arch/riscv/include/asm/shmparam.h | 12 +++++++
>>>  arch/riscv/kernel/cacheinfo.c     | 52 +++++++++++++++++++++++++++++++
>>>  3 files changed, 64 insertions(+), 1 deletion(-)
>>>  create mode 100644 arch/riscv/include/asm/shmparam.h
>>>
>>> diff --git a/arch/riscv/include/asm/Kbuild
>>> b/arch/riscv/include/asm/Kbuild
>>> index 16970f246860..3905765807af 100644
>>> --- a/arch/riscv/include/asm/Kbuild
>>> +++ b/arch/riscv/include/asm/Kbuild
>>> @@ -27,7 +27,6 @@ generic-y += percpu.h
>>>  generic-y += preempt.h
>>>  generic-y += sections.h
>>>  generic-y += serial.h
>>> -generic-y += shmparam.h
>>>  generic-y += topology.h
>>>  generic-y += trace_clock.h
>>>  generic-y += unaligned.h
>>> diff --git a/arch/riscv/include/asm/shmparam.h
>>> b/arch/riscv/include/asm/shmparam.h
>>> new file mode 100644
>>> index 000000000000..9b6a98153648
>>> --- /dev/null
>>> +++ b/arch/riscv/include/asm/shmparam.h
>>> @@ -0,0 +1,12 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +#ifndef _ASM_RISCV_SHMPARAM_H
>>> +#define _ASM_RISCV_SHMPARAM_H
>>> +
>>> +/*
>>> + * Minimum alignment of shared memory segments as a function of
>>> cache geometry.
>>> + */
>>> +#define    SHMLBA    arch_shmlba()
>>
>> I'd prefer if we inline the memoization, which would avoid the cost of a
>> function call in the general case.  You can also avoid that 0 test by
>> initializing the variable to PAGE_SIZE and the filling it out in our
>> early init
>> code -- maybe setup_vm()?  That's what SPARC is doing.
>
> Good point.
> Unlike SPARC, this patch re-uses existing code in
> drivers/base/cacheinfo.c to compute cache parameters.  To preserve that,
> it'll be more robust to initialize shmlba at a point certain to have
> those parameters -- at the comment far below, "Force recalculating
> SHMLBA if cache parameters are updated."  That way it keeps working if
> that point in time changes.

Works for me.

>>> +
>>> +long arch_shmlba(void);
>>> +
>>> +#endif /* _ASM_RISCV_SHMPARAM_H */
>>> diff --git a/arch/riscv/kernel/cacheinfo.c
>>> b/arch/riscv/kernel/cacheinfo.c
>>> index 4c90c07d8c39..1bc7df8577d6 100644
>>> --- a/arch/riscv/kernel/cacheinfo.c
>>> +++ b/arch/riscv/kernel/cacheinfo.c
>>> @@ -1,12 +1,61 @@
>>>  // SPDX-License-Identifier: GPL-2.0-only
>>>  /*
>>>   * Copyright (C) 2017 SiFive
>>> + * Copyright (C) 2019 Aril Inc
>>>   */
>>>
>>>  #include <linux/cacheinfo.h>
>>>  #include <linux/cpu.h>
>>>  #include <linux/of.h>
>>>  #include <linux/of_device.h>
>>> +#include <linux/mm.h>
>>> +
>>> +static long shmlba;
>>> +
>>> +
>>> +/*
>>> + * Assuming  cache size = line size * #sets * N  for N-way
>>> associative caches,
>>> + * return the max cache "span" == (line size * #sets) == (cache size
>>> / N)
>>> + * across all L1 caches, or 0 if cache parameters are not available.
>>> + * VIPT caches with span > min page size are susceptible to aliasing.
>>> + */
>>> +static long get_max_cache_span(void)
>>> +{
>>> +    struct cpu_cacheinfo *this_cpu_ci;
>>> +    struct cacheinfo *this_leaf;
>>> +    long span, max_span = 0;
>>> +    int cpu, leaf;
>>> +
>>> +    for_each_possible_cpu(cpu) {
>>> +        this_cpu_ci = get_cpu_cacheinfo(cpu);
>>> +        this_leaf = this_cpu_ci->info_list;
>>> +        for (leaf = 0; leaf < this_cpu_ci->num_leaves; leaf++) {
>>> +            if (this_leaf->level > 1)
>>> +                break;
>>> +            span = this_leaf->coherency_line_size *
>>> +                   this_leaf->number_of_sets;
>>> +            if (span > max_span)
>>> +                max_span = span;
>>> +            this_leaf++;
>>> +        }
>>> +    }
>>> +    return max_span;
>>> +}
>>> +
>>> +/*
>>> + * Align shared mappings to the maximum cache "span" to avoid aliasing
>>> + * in VIPT caches, for performance.
>>> + * The returned SHMLBA value is always a power-of-two multiple of
>>> PAGE_SIZE.
>>> + */
>>> +long arch_shmlba(void)
>>> +{
>>> +    if (shmlba == 0) {
>>> +        long max_span = get_max_cache_span();
>>> +
>>> +        shmlba = max_span ? PAGE_ALIGN(max_span) : 4 * PAGE_SIZE;
>>
>> I'd prefer to avoid sneaking in a default 4*PAGE_SIZE here, just
>> default to
>> PAGE_SIZE and rely on systems with this behavior specifying the
>> correct tuning
>> value in the device tree.
>
> Fair enough.
>
>
>> This avoids changing the behavior for existing
>> systems, which is a slight regression as the alignment uses more
>> memory.  It's
>> not a big deal, but on systems that don't require alignment for high
>> performance there's no reason to just throw away memory --
>> particularly as we
>> have some RISC-V systems with pretty limited memory
>
> Greater alignment takes up more virtual memory, not more physical memory.
>
>
>> (I'm thinking of the
>> Kendryte boards, though I don't know how SHMLBA interacts with NOMMU
>> so it
>> might not matter).
>
> There's no virtual memory in NOMMU, so indeed it doesn't matter.

Of course :).  I'd still like to leave the default alone, if only to prevent
people from relying on an arbitrary default decision.

>
> M
>
>
>>> +    }
>>> +    return shmlba;
>>> +}
>>>
>>>  static void ci_leaf_init(struct cacheinfo *this_leaf,
>>>               struct device_node *node,
>>> @@ -93,6 +142,9 @@ static int __populate_cache_leaves(unsigned int cpu)
>>>      }
>>>      of_node_put(np);
>>>
>>> +    /* Force recalculating SHMLBA if cache parameters are updated. */
>>> +    shmlba = 0;
>>> +
>>>      return 0;
>>>  }

