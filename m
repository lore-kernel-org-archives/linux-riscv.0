Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79842C04FFE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Z++72eioWtgCPKsf0SpC12OC6UisZQHS2aZ2eoxb8SY=; b=PJHYEd5rabs7nAXneuGMN5GGIj
	s3eD1mJJT69DEawRjTMr3TvHLuqEl7FlFoN3AsWJA6K1YfCYx4SpX1MqE1d9XArVrBkXcngxX+KTf
	TZaN18SVwD/ZSX+aI9KwZPw8zEKL4smPJA5p36LCuj8ScGX4xX4ainPCE8wR6YjiFlYMjARTRhl27
	Lc/lxI6zJbVBis7C4C/TvnPBeE+Ju5BeT3U6P36cJdP6bMA2idIL93W0ozP+7dba3G/dwkQUZU5sR
	c3OxLSS23ujvxiNvR1pmtxzoRHTTZ6uhb2AN/TmewVrKsQ+qYB183IkM17TU3sQ5WgIGCRcvIU8r5
	VWBoFKew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Y6P-00000004DJe-2vNb;
	Mon, 29 Apr 2024 20:59:57 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Y6M-00000004DJ7-3DrR
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 20:59:56 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6f0aeee172dso3460770b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 13:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1714424392; x=1715029192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPb10z2R6QzqCU/Ny7A6YIEMfMl5Kr9JPZ53mPCpdgY=;
        b=XWemdap4XzhveOgBBL5H1VpXfe4s8bJVJJY5kIpfjhvKq11HofWCNlHR/Wh3Q8OTKf
         oV9cbHfmfD4phzugC1c7WSjmh9hVUyaFlZAgD2XunN33CPSwS4vSF9nvvtFoPkPZsPhn
         HNj3GdbNmB6nF07bqENXGKgCuobBVmeEGmVe0NRmWzh21oLQivIs0jsXs6CZRiLYvTBw
         MY/tH+zfsais626ivMo5WB93GlFAnpuH/hsccSdMQvnbrfjJaolCHaWnHgqFbAR72BIe
         U/YQHajnDrgTuSYa6khIKevHR1AIzheAyew2e/tEp+tDYo5D8oV+U+wTg3zOzy3aCKYI
         AnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714424392; x=1715029192;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPb10z2R6QzqCU/Ny7A6YIEMfMl5Kr9JPZ53mPCpdgY=;
        b=Fu3ZiIjCauIM3+OAqauugCnL2sjtMZDXW0RNOyNjWa2WQIPW+ghjWlAtogGLSajU5F
         12/Rrwgd9SNOjGl4DVR6wAu65w/H9R8iARNz/MxWtbvBmBsweZO7McgR/YNhbvtPbQJ/
         HmxijxDCVP5Oaa70K4c0YQF/t74iUjH5o/J0hR0y0GYwPKiEvL7x4ay1k+KsxNKW/Zch
         PgbF0gpn30+m9zguorm9qnVVd9DfJ3zBKlJMmfPa3hTZ7J5MAAzjD9h4evHAyF2Tge0O
         YkPH+yi05VTpWF+4917sYIuq7u8bxerJ04ojEYQk5P1NCBD3OCsdUhiig0YRIDkL+j1g
         sh+g==
X-Forwarded-Encrypted: i=1; AJvYcCXgBLZMZ3x+8/Yvxjx/24yhFlgCaS+RmNWjLc2YdvCI7qEWu6WAx2ZEBl+McY1JykeuZrGclo+iA0XYEyitPLnbfnI36PKnj1/SHFPPfn/L
X-Gm-Message-State: AOJu0YwNMbnogtMi31ElHUdwywB/1MZnmd7VFAhHHFvIq8XxkDTCZfsi
	8XArmZFnSXPyg1jo1fI5jfOX1RZUYbnUT3nxJ29RqerL/Vh8ssMYytIHA72LF3X0LYYmorG0+DH
	6
X-Google-Smtp-Source: AGHT+IHIKkaYV9ZXxRvvVi+o+bLxYVmWl7xyTt+htZ7i1zC3bt5vINHy15SJmXRoDfBppCvN4VrC3Q==
X-Received: by 2002:a05:6a00:2e91:b0:6ec:ebe0:e4ba with SMTP id fd17-20020a056a002e9100b006ecebe0e4bamr1023158pfb.9.1714424391806;
        Mon, 29 Apr 2024 13:59:51 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id fj40-20020a056a003a2800b006f3021367desm13045927pfb.197.2024.04.29.13.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 13:59:51 -0700 (PDT)
Date: Mon, 29 Apr 2024 13:59:51 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Apr 2024 13:59:47 PDT (-0700)
Subject: Re: [PATCH] cpuidle: riscv-sbi: Add cluster_pm_enter()/exit()
In-Reply-To: <CAPDyKFph3WsZMmALnzBQKE4S_80Ji5h386Wi0vHda37QUsjMtg@mail.gmail.com>
CC: nick.hu@sifive.com, anup@brainfault.org, rafael@kernel.org,
  daniel.lezcano@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-pm@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, zong.li@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ulf.hansson@linaro.org
Message-ID: <mhng-eea6b80c-4359-46d0-85d9-358bc89e9169@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_135954_972173_4E67F712 
X-CRM114-Status: GOOD (  22.15  )
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

On Mon, 29 Apr 2024 07:32:12 PDT (-0700), ulf.hansson@linaro.org wrote:
> On Mon, 26 Feb 2024 at 07:51, Nick Hu <nick.hu@sifive.com> wrote:
>>
>> When the cpus in the same cluster are all in the idle state, the kernel
>> might put the cluster into a deeper low power state. Call the
>> cluster_pm_enter() before entering the low power state and call the
>> cluster_pm_exit() after the cluster woken up.
>>
>> Signed-off-by: Nick Hu <nick.hu@sifive.com>
>
> I was not cced this patch, but noticed that this patch got queued up
> recently. Sorry for not noticing earlier.
>
> If not too late, can you please drop/revert it? We should really move
> away from the CPU cluster notifiers. See more information below.

Sorry about that, I'll toss it.  I'm testing some other stuff right now 
so it might miss today's linux-next.

>> ---
>>  drivers/cpuidle/cpuidle-riscv-sbi.c | 24 ++++++++++++++++++++++--
>>  1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
>> index e8094fc92491..298dc76a00cf 100644
>> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
>> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
>> @@ -394,6 +394,7 @@ static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
>>  {
>>         struct genpd_power_state *state = &pd->states[pd->state_idx];
>>         u32 *pd_state;
>> +       int ret;
>>
>>         if (!state->data)
>>                 return 0;
>> @@ -401,6 +402,10 @@ static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
>>         if (!sbi_cpuidle_pd_allow_domain_state)
>>                 return -EBUSY;
>>
>> +       ret = cpu_cluster_pm_enter();
>> +       if (ret)
>> +               return ret;
>
> Rather than using the CPU cluster notifiers, consumers of the genpd
> can register themselves to receive genpd on/off notifiers.
>
> In other words, none of this should be needed, right?
>
> [...]
>
> Kind regards
> Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
