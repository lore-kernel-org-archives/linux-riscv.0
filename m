Return-Path: <SRS0=Eoui=MW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAF8C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jul 2021 11:55:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5AF260EE6
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jul 2021 11:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D5AF260EE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXSDbr5XY0JhTawZBelgbxAlFpe/i93c98ezjQ4falY=; b=SzEQK/rySlLV1MOtQCqLnNcM81
	sN9R0YeIB+5noM2p6qGg7SF8s/hoyGtkG8bVIrpGVl4yPhXIDBt/1sR/LpZWOtXmYBDsoTPAf4n0p
	Xo3BAuUxNTSq4dB8cjLostgYS2BRuJBxHlbaU3uXdYrjwFqArDfJGo1FgkmtqCqXUXTMhhGyuV9tu
	rD8kOmkfv+f+gO6VgXH938c2rjLRM7JoTxdL3xilh37wiofPnCRkkpIKG9xkBayjZNqh3cueF5WsO
	zqiyz1BAVroN4ViqKHZxas+/JE31rzS5/kyyCyoRwzM1OqykP22Zl4iz/kqpxD4FvfFMhcU2VnTIg
	h/GlteBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9R6A-008RNl-8y; Fri, 30 Jul 2021 11:54:42 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9R67-008RMj-E0
 for linux-riscv@lists.infradead.org; Fri, 30 Jul 2021 11:54:41 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 335A93F09C
 for <linux-riscv@lists.infradead.org>; Fri, 30 Jul 2021 11:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1627646070;
 bh=vxZKaGTC72D4nMdFDfy9Y8vyGGl2md/hp4bXxyUh9eg=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=jJA9aPkB0TmHi+2XuN3Ub9aKOe+9X6ry97Hl6ltbtlE198VJSQ9baTPr2FA1wGTVK
 6LWJWSvxVxpW0xatxPw3utav66/N3ZRwK5pBtZRwbInR79p2EAxk0fuMkkIfGvKVM/
 WZAcTi1DGy5NnnkHNJK774u03qyUIBCi+Hmq6apq3dtDhcGnhiJPA0NBWrQZrxf5bp
 bjQc7bzrq3BnjkuZLupJqK1FQNbHx+tubfOYP2WRBxVG+CxWNuVooT2OXgtCiaw7Jc
 pLIrsPIMfDUdUkBMiqqVPOZirfFRNbJV0U68iweS2h1oROgngR8qpMGnifWX8EKCG5
 ccT5BNQYZyceA==
Received: by mail-wm1-f69.google.com with SMTP id
 25-20020a05600c0219b029024ebb12928cso3188573wmi.3
 for <linux-riscv@lists.infradead.org>; Fri, 30 Jul 2021 04:54:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vxZKaGTC72D4nMdFDfy9Y8vyGGl2md/hp4bXxyUh9eg=;
 b=r/HvlhfS7YGwrfE036Jcusiso4M2rSbh9vIE3ZXPE4cnB885sZnvtOhNk42k5BINf7
 Czp/U4e6iyZM/dMNWOHF9irtQQyEI6fJfkmFaTbDFvkr/NzrErFkg4JZkN7P3y6O/+47
 Grwy9CJ1E7dF05mq//HIONLZNDdDcD9biI//UGsyrsp7hgho4jBexZG9UhU5IGBkhFZv
 VaO5fMR2Ln7T/cYNNA2xi/kVRHuel5goeNx8z68/pcih/nDya2ABu9DO5Eb3e+ntg20h
 pxXZQ8MkCzUYr/rn05tAF9/qvfI68jQZNIMrPYeo9eEZcHwoRFkIw9kPHGj/mvhysgly
 Qeuw==
X-Gm-Message-State: AOAM5328TO0brAJdRCfc53b0ARtojVfBg160zKRtQaAlmpUUtbW1imJj
 RyHWXvq3SVWzajtMLui684A/8WQk67NMqjlunSyxRmSntIeEfITEtlUc9v5qgUoEDbz8AWK7Nso
 96hfArS8y7ziXjWu0jDWYGTu1yw5360ZNRjXkN+1a1xTcKg==
X-Received: by 2002:adf:f4ca:: with SMTP id h10mr2606265wrp.3.1627646069875;
 Fri, 30 Jul 2021 04:54:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyl77Bre0zUD5p1w5aA4gaGuGgf7S2hkd9tBGyLoRB4oYTPV0iJgVUh4lv1qf3zrP0t/7UNwg==
X-Received: by 2002:adf:f4ca:: with SMTP id h10mr2606243wrp.3.1627646069686;
 Fri, 30 Jul 2021 04:54:29 -0700 (PDT)
Received: from [192.168.123.55] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id a16sm1564502wrx.7.2021.07.30.04.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 04:54:29 -0700 (PDT)
Subject: Re: [PATCH] riscv: dts: fix memory size for the SiFive HiFive
 Unmatched
To: Vincent Pelletier <plr.vincent@gmail.com>,
 Andreas Schwab <schwab@linux-m68k.org>
Cc: Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv@lists.infradead.org
References: <20210704083441.256097-1-qiuwenbo@kylinos.com.cn>
 <87eece7838.fsf@linux-m68k.org> <20210704121302.3aa8eedf@gmail.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Message-ID: <de2d60b1-6b84-3d47-8fe7-3f939100b7a8@canonical.com>
Date: Fri, 30 Jul 2021 13:54:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704121302.3aa8eedf@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_045439_727451_2E84F68B 
X-CRM114-Status: GOOD (  28.75  )
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

On 04.07.21 14:13, Vincent Pelletier wrote:
> On Sun, 04 Jul 2021 11:15:55 +0200, Andreas Schwab <schwab@linux-m68k.org> wrote:
>> On Jul 04 2021, Qiu Wenbo wrote:
>>
>>> The production version of HiFive Unmatched have 16GB memory.
>>>
>>> Signed-off-by: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
>>> ---
>>>   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
>>> index b1c3c596578f..2e4ea84f27e7 100644
>>> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
>>> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
>>> @@ -24,7 +24,7 @@ cpus {
>>>   
>>>   	memory@80000000 {
>>>   		device_type = "memory";
>>> -		reg = <0x0 0x80000000 0x2 0x00000000>;
>>> +		reg = <0x0 0x80000000 0x4 0x00000000>;
>>>   	};
>>>   
>>>   	soc {
>>
>> https://github.com/sifive/meta-sifive/blob/2021.06/recipes-kernel/linux/files/0003-riscv-sifive-unmatched-update-for-16GB-rev3.patch
>> contains more changes.
> 
> Here is what I learned on this topic while poking at the regulator part
> of this devicetree:
> 
> While these extra changes match the board's schematics, they are
> rejected by the da9063-regulator driver:
> - some channels are merged on the board, but the devicetree does not
>    show that: they have different names, with different maximum current.
>    The updated values exceed the single-channel maximum, so the driver
>    rejects them.
> - 3 of the regulators are further configurable in overdrive mode on the
>    board, allowing higher maximum current, but the driver does not
>    handle this.
>    Similarly to previous point, the updated values exceed the
>    non-overdrive maximum, so the driver rejects them.
>    I've submitted a tentative fix, but its logic is backwards: it
>    detects the overdrive bits and increases the maximums, whereas it
>    should see the higher maximums and as a reaction enable the overdrive
>    bits
> - also, some voltages fall in-between possible values, which causes the
>    driver to reject as well (ex: vdd_bperi is at 1.05V, but the chip can
>    either do 1.04 or 1.06)
> - ...and likewise for some current values (ex: vdd_bpro is at 2.5A, but
>    the chip can only detect 2.4 or 2.6)
> 
> So from a pure system behaviour perspective, these extra changes should
> not matter either way (at least in my understanding). At least not with
> the driver in its current state.
> 
> OTOH:
> - the changes missing here are more correct than current master
> - not including them will probably make meta-sifive maintainer's life a
>    bit more difficult
> 

We should not mix changes that are unrelated in a single patch. Even if 
regulator changes are advised they should be submitted in a separate patch.

The HiFive Unmatched shows the full available memory with this patch alone.

Tested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
