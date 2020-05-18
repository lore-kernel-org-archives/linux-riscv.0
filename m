Return-Path: <SRS0=JdoE=7A=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACC7C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 May 2020 20:24:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 492DB20643
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 May 2020 20:24:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UWDLSBw/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H1xrtfIJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 492DB20643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5B0bvyb+czYXibRbo3frDkeWMomKS71UWI1iUCkQxS8=; b=UWDLSBw/PTCdMt
	uIfa6DzGGJK1AEuHChS4Py0S7VSQLJKdeTrwwjutIzWq4AG5YGD+KpXMhjyzpNYt1Cmn5DVoTmzag
	GA4SOdgH3VXIZpUB7mWE9/31yIZKVtb0SV5usp5A54rXVP1FcKdY+/BigKGDd/FU7efZnOTYnS+Y1
	q7oVWiThRMDGNnUbkmeJYChBVbmLTfKI+YMCT0n8IYvqdn7qfSZ9MoHL3i2PJLgm4zH4/4GCM75Lr
	xbDWfxUHBnzrqSLqvUqZLHN/6J27ujWRMSXK5+8MSKUS8QZJUNgC7+agTKnyXMhvI4BGyVdN0AmSS
	5p5SCNG5cPJ5MyTCSZUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jamIx-0000lf-H6; Mon, 18 May 2020 20:24:07 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jamIs-0000kk-Rt
 for linux-riscv@lists.infradead.org; Mon, 18 May 2020 20:24:06 +0000
Received: by mail-wr1-x442.google.com with SMTP id i15so13305855wrx.10
 for <linux-riscv@lists.infradead.org>; Mon, 18 May 2020 13:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5B0bvyb+czYXibRbo3frDkeWMomKS71UWI1iUCkQxS8=;
 b=H1xrtfIJsEgJbCyguOTKrsaF7WUbw/aM1YPdMJ53dhZz2PctJVBahR4Dlix3h9RpPO
 TRfbTX5dArJn57NI+zOx8ju3PdHlAU5buJNt7sKD29mDpp4bk1b7q10o2qCe2CcG2SfF
 VvwHzCZSj+D+0KW3p+0UDYynUca0TMEXbP5ZBUkIn4hsiF5ahUNoOZ+7aR46RHos2hh7
 MiaGdLwfeMY4/4Kj9dwrknNyGleySWethq75DXFaopaLm4Jzc1De+HYw2Oh7hG7KKg9e
 jirlcwI6Qev8P8jee/iNmR95QtJtKnr5CCz96Bl0FECiHXOs+EpKD4+l5SKFbH6nvTc5
 oYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5B0bvyb+czYXibRbo3frDkeWMomKS71UWI1iUCkQxS8=;
 b=oWLv3Ay+CXYfxmpdL9uk2irpQbsz53p8DnX5fThWOgr6EJZG+LNSKU3/ZRjIgjHip6
 aYaE+1kNYSZpZdTNwvu0SZ3u/IpTMQkIElb7TmEHIp80S2elXjslEvnk69/YY/uI3ORg
 gyTRGgl2UxnoWCZWynKHxTAX9cFkJS5bGCPZw2DytDDd4bsqgetZEmw07u/Js1b/vZuA
 c1dLmmJEadScvkq40KqFjB2rK+9PpLlwPd6+QJs5PIfPA6sFoiWYeU5byriQC62VBt9t
 bko3WN6FPNggrpOlaWwfeQUAagdMj1k+doJJ0QppuxP3iziuKrnvXARve22MfONZ5KRu
 KrPA==
X-Gm-Message-State: AOAM533My21tHZwegSFSluBIR0+4yEdh9K4E8RBK81iSezolBToaWYKV
 XzNQCnTuccffig0aZanJYTm/pQ==
X-Google-Smtp-Source: ABdhPJxnle0Ka9+nAQQbbufJUi1PeIgz/OINpBlvEqYX/F0IMX1TMNzubsaAi7WtxvNzOLQLCbVubg==
X-Received: by 2002:a5d:6605:: with SMTP id n5mr23240499wru.198.1589833441326; 
 Mon, 18 May 2020 13:24:01 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9e7:3ac5:a930:2cd8?
 ([2a01:e34:ed2f:f020:9e7:3ac5:a930:2cd8])
 by smtp.googlemail.com with ESMTPSA id w9sm19689253wrc.27.2020.05.18.13.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 13:24:00 -0700 (PDT)
Subject: Re: [PATCH 09/10] timer-riscv: Fix undefined riscv_time_val
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, tglx@linutronix.de
References: <mhng-0c491e9e-41fd-4f76-a048-55c03d9359f0@palmerdabbelt-glaptop1>
 <66121f9a-48f3-d3a5-7c96-d71397e12aed@linaro.org>
 <0bc3eb36-7b9d-7c86-130c-68b566e85c10@huawei.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <e1916079-c209-bfad-6b0c-ccfb2e136ca4@linaro.org>
Date: Mon, 18 May 2020 22:23:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0bc3eb36-7b9d-7c86-130c-68b566e85c10@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_132402_910366_798416E6 
X-CRM114-Status: GOOD (  13.03  )
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


Hi Kefeng,

On 18/05/2020 17:40, Kefeng Wang wrote:
> 
> On 2020/5/18 22:09, Daniel Lezcano wrote:
>> On 13/05/2020 23:14, Palmer Dabbelt wrote:
>>> On Sun, 10 May 2020 19:20:00 PDT (-0700), wangkefeng.wang@huawei.com
>>> wrote:
>>>> ERROR: modpost: "riscv_time_val" [crypto/tcrypt.ko] undefined!
>>>>
>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>>>> ---
>>>>   drivers/clocksource/timer-riscv.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/clocksource/timer-riscv.c
>>>> b/drivers/clocksource/timer-riscv.c
>>>> index c4f15c4068c0..071b8c144027 100644
>>>> --- a/drivers/clocksource/timer-riscv.c
>>>> +++ b/drivers/clocksource/timer-riscv.c
>>>> @@ -19,6 +19,7 @@
>>>>
>>>>   u64 __iomem *riscv_time_cmp;
>>>>   u64 __iomem *riscv_time_val;
>>>> +EXPORT_SYMBOL(riscv_time_val);
>>>>
>>>>   static inline void mmio_set_timer(u64 val)
>>>>   {
>>> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>>
>>> Adding the clocksource maintainers.  Let me know if you want this
>>> through my
>>> tree, I'm assuming you want it through your tree.
>> How can we end up by an export symbol here ?!
> 
> Hi Danile,

s/Danile/Daniel/

> Found this build error when CONFIG_RISCV_M_MODE=y and CONFIG_RISCV_SBI
> is not,
> 
> see patch "4f9bbcefa142 riscv: add support for MMIO access to the timer
> registers"

Thanks for the pointer.

The question still remains, how do we end up with this EXPORT_SYMBOL?

There is something wrong if the fix is an EXPORT_SYMBOL for a global
variable.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

