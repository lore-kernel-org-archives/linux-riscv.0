Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F21C3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 09:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHd4rOTQKSFKZgRj2QCMetAbQOylKtsfoKdtye9EkQQ=; b=AkkTDDK1Sz1zot
	pLtQVezyMfwz6vC/ufd81UWpEBrt6+DwaDNfrGpNssbKIOJ1C22Eb/bymka5+iSyKHPPGbf+n3Y5L
	EWeBwHZmDUUy/IXzeZAr1oMioZNQVyBWC49tSHcrq6F3e+aE3fetvyEtUkzir05VNzScsknoWpim0
	Xi0ilZwQUR5oXqcbwvezCy+jEeA6vi2Cdugrx+30zIiRR94TVrO7uUzLvTNmydS38Rcv6PiYZJNVL
	xUWuCov1UUcE3rf5XCups2kAXveQbtDekC/qUG48SSh6SnsDV0/2fNJ8Kc9ntZ4vgUT3ZWla1r+eo
	P1yo5Oian3Lwq5AC8apQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgLCA-00000004a1j-0xZG;
	Tue, 20 Aug 2024 09:30:30 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgLAv-00000004Zh6-0JIK
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 09:29:14 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-371aa511609so1872140f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 02:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724146151; x=1724750951; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ivBmOEvLY8+21XD8B+T6OkZ7t7klTY/OPjkKL2J8uTc=;
        b=i0IguhJAHSoCWMalgHOlUw2KsZeMBqeItS0lpeRW4/BIMuAnW9iEhyY9h3pl2d8HaK
         +urbY8+/YqWU2FjueA8x8ovgAijq2ZTn1z4aFTrZMDs48x/QOXBjxynJD+jO1XU32r+f
         Gbw9gRD4TbrWQfGUvyCZQQ0UUg0rw5gX6Ff5pNWI3UV6s7/PcJGU74tK59CwSYapsPSJ
         CgEVBg4a8Pdp8cWKdrx2/z6QaVS4hIphxFmHJT4QwmEskpcmXr5dSyev0evXUYcsL2rf
         9/2T3Ry61aRW1yVkqD/wwPRU1WavJBqm+d3Zk9HG8mU+gOljRrPkV/ILY7q0yuTe0uGn
         EZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724146151; x=1724750951;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivBmOEvLY8+21XD8B+T6OkZ7t7klTY/OPjkKL2J8uTc=;
        b=YOi/98VuEissYiRQXT6IP91SY7dyCsgIApWWJaU5CWV32p5pAIS/K1IuRU1oW7DxAt
         nm2NxdKbHDFddX9wKXutJOt+e/i9CnIJQvL+YACisBEZIH9e48R/Bb+vKOXRP9mgRNUY
         zevzKAYV1+KTe5GBw77LjVbH/E9NBL3Krz0o43uhGErFLM5qwCMid1BI2hJ4I/mnkM6B
         G3ralWijCzgtKlnasipY/kLmV70PhCpSqFTSmGiuMvYZhDIdp4co8K/XvyXPt9gT3ZZ2
         n2tjIw+8jZUaoDcidw/v8QVm7fmi+JJ/XTIUQRgu3k1q7fmWLu7byl2q4RSboLq9uXeo
         PQCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMWi3fCzpCaXPkRYbJxha+S5+sV0zF/JZGN0qEt9kvLUdpE8xKlziFvwYVrLB/IuxJnLl+ITKl+R/LSw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1ryxcwcRCp7sjB8DHGZg2VLeaBD4/FlNBAoe9WEek2Gjji8oI
	GDbFSfTjdOmIyljezJ4qzWSlObp2Sd3L0AuaOlNvnrZmJYIZDT9l6lZXJIWBqo8=
X-Google-Smtp-Source: AGHT+IGzHYVgNuPPuklz7BIbEFwfE3SMKsmmxyisrPKTcLAJxvBCk59VCsf/VZQKx+dMghAMJqq6uw==
X-Received: by 2002:adf:a35d:0:b0:368:319c:9a77 with SMTP id ffacd0b85a97d-371946535f5mr7217989f8f.29.1724146150608;
        Tue, 20 Aug 2024 02:29:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718983a2eesm12661135f8f.19.2024.08.20.02.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 02:29:10 -0700 (PDT)
Message-ID: <176bcb51-f343-47a8-a5d9-14e76a7a6139@linaro.org>
Date: Tue, 20 Aug 2024 11:29:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] cpuidle: riscv-sbi: Use scoped device node handling
 to simplify error paths
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel
 <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240816150931.142208-1-krzysztof.kozlowski@linaro.org>
 <20240816150931.142208-2-krzysztof.kozlowski@linaro.org>
 <20240819171313.00004677@Huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240819171313.00004677@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_022913_128274_41F289BD 
X-CRM114-Status: GOOD (  10.08  )
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

On 19/08/2024 18:13, Jonathan Cameron wrote:
>>  
>>  	/* Parse SBI specific details from state DT nodes */
>>  	for (i = 1; i < state_count; i++) {
>> @@ -264,10 +262,8 @@ static int sbi_cpuidle_dt_init_states(struct device *dev,
>>  
>>  		pr_debug("sbi-state %#x index %d\n", states[i], i);
>>  	}
>> -	if (i != state_count) {
>> -		ret = -ENODEV;
>> -		goto fail;
>> -	}
>> +	if (i != state_count)
>> +		return -ENODEV;
>>  
>>  	/* Initialize optional data, used for the hierarchical topology. */
>>  	ret = sbi_dt_cpu_init_topology(drv, data, state_count, cpu);
> The handling of error ret from here doesn't free the node.
> 
> Bug or something subtle I'm missing?
> 
> If it's a bug, then fixes tag.

Yeah, indeed it is a fix.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
