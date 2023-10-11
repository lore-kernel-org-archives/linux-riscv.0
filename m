Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79603CD6E51
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 09:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yYts/+XJdTRf+AHlCqVxJlyvIu2yHakn23dGbwCiztc=; b=YfL4sH45bWihEk
	PxMCOjcjTcT+qUGLezyJhow5xa3lFcz1AiQ4UDbtU0Jj1klxVJ2bqhSMFhLOSpArXQf0XDpZUedKr
	rC1PTTjLgjcO0b9EM3sS8YFPajWq9zCZx6XyaqN0P59adR9ZR259QNoAHkCe88f1rTCNAVgxbNLi0
	F1NH4xZAsxuHbjO/y6HsPsf0JyP7Ruy++7E/Xu09gs2f4Dn72aSynN+t0zk1VTGI4Un0SJbC/r97h
	H2iJNAFia2BCiet7iDheeV34Q0TWnk1PFE9vuDrhTAiih6v3DV6Uz/QpIvckA2XEHNN32eWWaaykn
	KfeONjzDpmRHQC8DsIxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqVIz-00FJTO-1A;
	Wed, 11 Oct 2023 09:15:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqVIw-00FJSk-1J
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 09:14:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-405361bba99so60835465e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 02:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697015696; x=1697620496; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dcsbzf8E/7eeyM/pc2wr1VcgxpBh3MPzSnBM0me6VQ=;
        b=QpzOZlwnxVYM4xjlEFX9IsmRQ7GVsMofEB2LYE4ha5o1UdE5UgLmnsELZbZaK+AfgY
         ysjhXNi/vwBddieOmlCDHQMxjxS1ePpIm8hESDZdbc/Y59F2qQ4ktx0jQtn8HrDwfeci
         Vm3GzKpq3W1lbz5LbVurnTGKlAj8PVWHDli594b7cvm7L+ZGAry6ln18Dyd9lmyz7BjY
         HSE1klBnTxTzBQnTdi8vNoEDhBDhbhKFGy0bp6VfCSO6gARG6ZERrSmOjFIlt0Waxgi7
         f0AZUXpC3JNHlPPpWv7qlkj3bxzs5vVga9pMhfVtMQpjOAUPZ17/BDXBmS8LKnPvvI8z
         49Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697015696; x=1697620496;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8dcsbzf8E/7eeyM/pc2wr1VcgxpBh3MPzSnBM0me6VQ=;
        b=J9DJxv67xaLfzM5M68yRXWnwd0FmHUlGh6t4O7Qz4rzBu+NFbW5hEGFCe2vW2U9mrO
         aM5KnbxaMkYdXOn/qkAItkb3tmJAAQe0eT/TxIB/1aqlznFKO5vhKfe4O3Hx3fv1d9j9
         VOw51iGngxRI1oQp+GjxZn5cTPHEERMoALKFUTE7OenfsC2ruCRmAENVfN8SjH3PtgAj
         vhunEjcD+1fric5i796Vc6E9PxJXSWAg772iZYIDMJ8cm9knNbbFB7peJVDoLfGiXMjS
         OVmukChlnAl3SCKXBZP/LrZy9iAtDb5f4UvRaU2cRnoRsa8MvVbW4P8UJ0Pfo8oUf/0o
         ERlQ==
X-Gm-Message-State: AOJu0YwJMpC70Xpo1m5c9KNrXpV2yrZXu1XJLDrLoHQphFiwG9aqQlUu
	dVsg1lRCTyv2wpwHuMU9KBKQGA==
X-Google-Smtp-Source: AGHT+IFiH+YSs/NYge2HLcC7hKWSTqv0Z71LvtzWkhS94lL06dO+Ooh7J+MIlnk7hzzqpwtUN5jE7Q==
X-Received: by 2002:a7b:cbd4:0:b0:401:b76d:3b8b with SMTP id n20-20020a7bcbd4000000b00401b76d3b8bmr18890887wmi.16.1697015696048;
        Wed, 11 Oct 2023 02:14:56 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:de95:eca9:6b1e:b330? ([2a05:6e02:1041:c10:de95:eca9:6b1e:b330])
        by smtp.googlemail.com with ESMTPSA id bg24-20020a05600c3c9800b004063c9f68f2sm13391034wmb.26.2023.10.11.02.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 02:14:55 -0700 (PDT)
Message-ID: <367c01e7-1096-47f2-a0da-920b0ea4b915@linaro.org>
Date: Wed, 11 Oct 2023 11:14:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 -next 4/4] clocksource/timer-riscv: ACPI: Add
 timer_cannot_wakeup_cpu
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Andrew Jones
 <ajones@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>,
 Anup Patel <apatel@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Atish Kumar Patra <atishp@rivosinc.com>
References: <20230927170015.295232-1-sunilvl@ventanamicro.com>
 <20230927170015.295232-5-sunilvl@ventanamicro.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230927170015.295232-5-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_021458_452064_BDA5C9FC 
X-CRM114-Status: UNSURE (   6.16  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjcvMDkvMjAyMyAxOTowMCwgU3VuaWwgViBMIHdyb3RlOgo+IFRoZSB0aW1lciBjYXBhYmls
aXR5IHRvIHdha2V1cCB0aGUgY3B1IGlycmVzcGVjdGl2ZSBvZiBpdHMgaWRsZSBzdGF0ZSBpcwo+
IHByb3ZpZGVkIGJ5IHRoZSBmbGFnIGluIFJIQ1QuIFVwZGF0ZSB0aGUgdGltZXIgY29kZSB0byBz
ZXQgdGhpcyBmbGFnLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50
YW5hbWljcm8uY29tPgo+IC0tLQoKQXBwbGllZCwgdGhhbmtzCgotLSAKPGh0dHA6Ly93d3cubGlu
YXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29D
cwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+
IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8
aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
