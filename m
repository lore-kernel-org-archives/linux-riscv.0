Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E81E9539B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 13:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUlYMFZIyaXgET0l8tUQPnPw5l9+62aoJsv7yorKQA4=; b=mcG2qfxSAmiC/q
	l51msOMqYW+6mlkY4HKxHTWZJNkMddW3JbdiEci+jIPg7m8RPp15kx7/ErTn6Lce1aFs8juySvkkw
	UGQ20HxlNypo24Kke+j9yVqTq/M1T0BpIDqxmv043g4FoSlU2Re5o611yHW+BwDR7TwWFhXXPRmo1
	NRcUeThkubOqir+yccx6+2cFJxl9O3Ax9UtkRbtJiCwEwG3Tz3pK1NAHanyXZwhNI/WbQ+rLzSQn1
	XtTgrHZ/K1GxaJ6ORZL9/HWvKlqEGrYnpdPtKF1auG2a8CqIcz9CQDe0QG7tUiWNkXGXet839QV6T
	Qc8WUQwUsfkIfUJC03ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnchy-00000008U24-15vE;
	Wed, 04 Feb 2026 13:14:14 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnchu-00000008U1R-2Jhj
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 13:14:12 +0000
Received: by mail-pg1-x542.google.com with SMTP id 41be03b00d2f7-c6c45a843f7so237614a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 05:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770210849; x=1770815649; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:subject:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAG3m8IBpqTTnP8iKv9QMXvVwIBkXqd4q0Hh3xxvt0E=;
        b=FgUoCUwNlx0K0tS2awLXHR5n6FkzcXDExsK1bnKvtMKaR0Kl950zz9zoGFXnr/nz2P
         zhy4/5/dfztfy3RWCYHGdsZe5bir3RpW+lUuu+XhgFgVTzfOoU6r3+WlazTwTkrxnJNb
         7Jcs4OoTaR1mqIdHM8EolHzlhVS4UI6MFmJBozWPeaYLt3lHA4K58xknavWqA+Jfupx8
         /iQ6DF5yryAuTY9sDTApNciObvn/+IXRlTWlEO/35SgTU5T/PyN7e/cZinBwYvPljBOs
         A26TGGTEAzF9OgXG3Tor0OZ+zQ58LXUXok0vrlKTpbP/4S+Y6A+W4FYGXS8rqLHH3Qxy
         3d8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770210849; x=1770815649;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:subject:mime-version:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NAG3m8IBpqTTnP8iKv9QMXvVwIBkXqd4q0Hh3xxvt0E=;
        b=wli9/QMR1GZ9f1xkZWJa/UFtQbJeY011zPuNgx7XQBBx13SzRIS4XmAnf0FAlguZh5
         EHbX5QVSHwwTMh4KHnpiX1qtbHg63JxyKusGD6g04tZIvA45FL4bHm1oRWnLSk8KvkIU
         Byn07rD1mLXFuZ4Y6aaTFD0N+jX3ZBeFJkFt+hexXfCwFXsvV717SlpDBj4GrfcILMtG
         sB5O+rI7BvSE8KiHn323SQTSUjqsp26C/IQycH5Dyjhg1QTycS+bdLhoUrzgs6XKOpfG
         HO44AabLAPsg1Ro7jqfNsbq8Lv9lyXoBE0aHBYoPnMQsZQzvgMXWIbV2+/wj9EK/m6sr
         ASaw==
X-Forwarded-Encrypted: i=1; AJvYcCU//8DWwx3vMCU/rEp9J4i8jpc7bGonk9FFi081lpJ293+r2YY0jRnByzFdOaq6ag4Vzic/Fp3GUl3O+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQxWxWGRkkQjZFusyI9yqWsQdrHMTfxIYAFGicTGvRY3+Mrls1
	z1cSqiF4yfGkNdu+35fXVBaRQFU7YhWpDJK463gNgkxuHwcj9oseX4d3
X-Gm-Gg: AZuq6aJ1aQzgKUX+InPhSIQJou6aFMZB93vmDjORp3xEsBDJ5iDDs16XQ1TnoGbgTh4
	GPiBf1kYG13pJ9npgbba43iZ2TW58clWFIQLNzbEYjulBclXG8Df2IXLlg95eCjnQjstAtepumR
	qXJmIu09fh9yrAxfiZfobaIxMphtHkF5f4gGHt/mnSQ55eqioOpO3Sy9dEJ7YIjAnv5WH7//jj+
	4FIg1iEroZAhVXf7BnQnRb6KeG6epLyU1XwSyIg2YpfkWXOE/6RsF4eyUprdc6aiHHm0mbKAyrh
	OfSSAoLAWdSd3Nklb7eGMooXgr6BO39f3jZ2B80a79rL1if521NXGDJensoiZL4RTt4c3PAWbPb
	i2s0SeIYQQcX83OTsJmKOx3mxprOSMYvej0d9NM1KqhpmT3YC3aEoMkO5X/hZTBaUc/9O9Vrpmn
	8iWI9E5SIYmzLrou6Yxk3LBgKfm+gDjtE=
X-Received: by 2002:a05:6a21:4910:b0:371:53a7:a4aa with SMTP id adf61e73a8af0-393720dd396mr2935854637.29.1770210849324;
        Wed, 04 Feb 2026 05:14:09 -0800 (PST)
Received: from smtpclient.apple ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93394e1ccsm34868165ad.59.2026.02.04.05.14.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Feb 2026 05:14:08 -0800 (PST)
From: qingwei hu <huqingwei.kernel@gmail.com>
X-Google-Original-From: qingwei hu <qingwei.hu@bytedance.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] drivers/perf: riscv: Keep the fixed counter counting
In-Reply-To: <aab19ab9-0946-4477-8ca2-bc93621a54a0@linux.dev>
Date: Wed, 4 Feb 2026 21:13:53 +0800
Cc: cp0613@linux.alibaba.com,
 anup@brainfault.org,
 alex@ghiti.fr,
 pjw@kernel.org,
 guoren@kernel.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <0E982A8E-9CD2-4712-AC59-56D7CA043A2A@bytedance.com>
References: <20260131112440.2915-1-cp0613@linux.alibaba.com>
 <aab19ab9-0946-4477-8ca2-bc93621a54a0@linux.dev>
To: Atish Patra <atish.patra@linux.dev>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_051410_596581_C4C293E6 
X-CRM114-Status: GOOD (  22.26  )
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


> On Feb 4, 2026, at 17:17, Atish Patra <atish.patra@linux.dev> wrote:
> 
> 
> On 1/31/26 3:24 AM, cp0613@linux.alibaba.com wrote:
>> From: Chen Pei <cp0613@linux.alibaba.com>
>> 
>> The RISC-V SBI PMU driver disables all PMU counters during initialization
>> via pmu_sbi_stop_all. For fixed counters CYCLE, TIME and INSTRET, this is
>> unnecessary for the following two reasons:
>> 
>> 1. Some kernel driver code may directly read CYCLE and INSTRET to perform
>>    simple performance analysis.
> 
> Is this for some debugging purpose to read the instret/cycle count at boot time or real use case for driver performance analysis ?
> 
> If it is the latter, that will be problematic for various reasons such as context switching will lead to inaccurate numbers.

Hello Atish.

Besides boot time scenarios and performance analysis, there is another case
where user mode needs to access the cycle counter via rdcycle.

> 
>> 2. In legacy mode, user space directly reads CYCLE and INSTRET. (echo 2 >
>>    /proc/sys/kernel/perf_user_access)
>> 
>> Therefore, We keep counting CYCLE, TIME and INSTRET.
>> 
>> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
>> ---
>>  drivers/perf/riscv_pmu_sbi.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>> index 7dd282da67ce..93aaab324443 100644
>> --- a/drivers/perf/riscv_pmu_sbi.c
>> +++ b/drivers/perf/riscv_pmu_sbi.c
>> @@ -899,6 +899,9 @@ static int pmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
>>    static inline void pmu_sbi_stop_all(struct riscv_pmu *pmu)
>>  {
>> + /* We keep counting CYCLE, TIME and INSTRET. */
>> + pmu->cmask &= ~0x7;
>> +
> 
> This is incorrect. The cmask should be set based on the perf_user_access value. We should not continue counting the CYCLE/INSTRET when legacy mode is not set. if (sysctl_perf_user_access == SYSCTL_LEGACY) csr_write(CSR_SCOUNTEREN, 0x7); else csr_write(CSR_SCOUNTEREN, 0x2);

Legacy mode refers to the perf framework. When perf_user_access is not in
legacy mode, the application may need to use rdcycle.

As discussed in [1], the rdcycle is necessary, and applications such as
DPDK should use rdcycle in user mode.

So how to use the rdcycle when perf_user_access is not in legacy mode?

[1] https://lists.riscv.org/g/tech-privileged/topic/should_rdcycle_be_deprecated/115162737

Best Regards,
Qingwei Hu

> 
>>   /*
>>    * No need to check the error because we are disabling all the counters
>>    * which may include counters that are not enabled yet.
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
