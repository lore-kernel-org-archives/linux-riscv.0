Return-Path: <SRS0=JdoE=7A=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F82DC433E0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 May 2020 14:09:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4095620874
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 May 2020 14:09:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X73qJaAW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JNmEf5rw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4095620874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KP1W2Itm/+ybI6CcKF2T7q86qg0QdOvp+lK7UryjN2U=; b=X73qJaAWCNyGYp
	WwberigpjgiBfa6ZIX/feDNkFIvvqXzWOrjoBQUFhuoKqgrFT4G32GdWlcLstWMmK57O6XoDVgLUr
	jO6tOyTCD3AdsVUJjF6R/TysFSYljDdofR+QuqAYNE5EdRBzbYxtPqK8CjpudRA6g9pCero9IGfYq
	5cAb5YctyYY3z6gu5ePfjSx2W41loDfEdkGLlLmLKhl8ywK++tDin8Dcp5QxBejpChPw6HKR7UhZP
	LYFu7BEkPKBVWje4nUrSywB7afB3a/zynFc79O9XXGjglCl9WdcUQ8zWmCjlbQgk9LK5nOaPlMN2Y
	VNUmXCmPGkTrS2u3JyTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jagSQ-0008Vp-Fy; Mon, 18 May 2020 14:09:30 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jagSN-0008VJ-Me
 for linux-riscv@lists.infradead.org; Mon, 18 May 2020 14:09:29 +0000
Received: by mail-wm1-x344.google.com with SMTP id z72so10629889wmc.2
 for <linux-riscv@lists.infradead.org>; Mon, 18 May 2020 07:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KP1W2Itm/+ybI6CcKF2T7q86qg0QdOvp+lK7UryjN2U=;
 b=JNmEf5rwJZJTr3vmTU+JXBnKh939INhFXQISR4gZuwZuwNupLRBzf58/B385vN8CHT
 yAfEk+7buu6f8M6Z72fr0I46EKkUNOnbKCtWZ+F7Arox8Bqaq+sbNbEjR2iBIaQN9yr5
 gEieuiOZK80sU81Aw6EV7G5+HB+Yd8A5GGNYnTZ/NZYFAUoVGSKqOsT9++GZV5IDShCi
 KWr5whkVMdxzwp/VgAlUvpzBSqlKMHsfbLf/Vdx0iJulRNme1RDydeGFKU2yWukycvuC
 H9KvUAG4zcbPJP3X1O5kf/zXTEcZoJRJeS+9yoKUytzw0Yc++ZRyVy6FuCkHCNFTUSE7
 RDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KP1W2Itm/+ybI6CcKF2T7q86qg0QdOvp+lK7UryjN2U=;
 b=Dc24kf/skoWPuQNdPqhCBl9Tl0Fvh645rdU+0zFtQuA8Pr0YNSqRz69r82QLqgSvrW
 BjA6hIqzyNj9dszAz+FQUyOH0NXP74wII1YOdcvlbad2uTRddNG6PgRYrxoaC7f8d3Fl
 nz8vKyzdVQdUbfqOv5LQzJXLwXA4Ei/u0I3imO0+chgT3cATH4b4eqeb7fGqh5C8HLPX
 OFlELPyDRaCArBdTOt5dALEFZwZsHMB2gAccfC4D96b0ohfQ0WaweEoug4iMZ37M1SHj
 GVLTHkjx0yLXjdk8oMPd5rAipxsIVzn+6SF2m74i8bocrlLf4l3VlegmhNteUCx/w0SM
 E2yQ==
X-Gm-Message-State: AOAM530WMcfvscMni4FgdT9SlFMi/FfyFjL4ZDj8PutatHufN0rcqTzf
 z1JkCLJTWYrq/4S/bG6IUr/Fdw==
X-Google-Smtp-Source: ABdhPJznBYMlOTMQy1fWtCi9cSlyOljLSD8C50+NxP2y+5UPsZXyZPC/g2hVtKCHqIb31GNdQ8+Tsw==
X-Received: by 2002:a05:600c:2dd7:: with SMTP id
 e23mr19309184wmh.96.1589810965999; 
 Mon, 18 May 2020 07:09:25 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9e7:3ac5:a930:2cd8?
 ([2a01:e34:ed2f:f020:9e7:3ac5:a930:2cd8])
 by smtp.googlemail.com with ESMTPSA id s11sm16348361wrp.79.2020.05.18.07.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 07:09:25 -0700 (PDT)
Subject: Re: [PATCH 09/10] timer-riscv: Fix undefined riscv_time_val
To: Palmer Dabbelt <palmer@dabbelt.com>, wangkefeng.wang@huawei.com,
 tglx@linutronix.de
References: <mhng-0c491e9e-41fd-4f76-a048-55c03d9359f0@palmerdabbelt-glaptop1>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <66121f9a-48f3-d3a5-7c96-d71397e12aed@linaro.org>
Date: Mon, 18 May 2020 16:09:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <mhng-0c491e9e-41fd-4f76-a048-55c03d9359f0@palmerdabbelt-glaptop1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_070927_772544_DF830C15 
X-CRM114-Status: GOOD (  11.70  )
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
Cc: hulkci@huawei.com, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 13/05/2020 23:14, Palmer Dabbelt wrote:
> On Sun, 10 May 2020 19:20:00 PDT (-0700), wangkefeng.wang@huawei.com wrote:
>> ERROR: modpost: "riscv_time_val" [crypto/tcrypt.ko] undefined!
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>  drivers/clocksource/timer-riscv.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clocksource/timer-riscv.c
>> b/drivers/clocksource/timer-riscv.c
>> index c4f15c4068c0..071b8c144027 100644
>> --- a/drivers/clocksource/timer-riscv.c
>> +++ b/drivers/clocksource/timer-riscv.c
>> @@ -19,6 +19,7 @@
>>
>>  u64 __iomem *riscv_time_cmp;
>>  u64 __iomem *riscv_time_val;
>> +EXPORT_SYMBOL(riscv_time_val);
>>
>>  static inline void mmio_set_timer(u64 val)
>>  {
> 
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> Adding the clocksource maintainers.  Let me know if you want this
> through my
> tree, I'm assuming you want it through your tree.

How can we end up by an export symbol here ?!


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

