Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B628C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 17:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJH8np2vBx1qC+1prEP5ICXnIip6seHxMmQCj+WH8Mc=; b=BHnBbwNwduU56U
	3CZj91WTomGj5Df05F4GAQibeNu4rpnSnV0BgogM779Bl6NFmaXJHVCGST/xhOtAXAzlCOaooDYT1
	D2gZ5S0GtjrLt1w7Pi3pw3Yh5O/Es/yDpKBrPbgBM6NKft3+53K9WG3ZrlLH8jB3H+KwWjxasi/qu
	Olx5m5EQhDQYTFMVi06lmTfU+Gp8VMy14c7y8IJrNhXNl/MyEahTIq/uJdFenKumYBqsG5YiKM4ZK
	3/n0bucJ7PUhN+v6SCrSR5srInUk9GIRMqMNtnhzIFzcXllRguvlarMtw015L+QPx5GTQPE1YKYIl
	MmRa7/FmGLqTUf4AskaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCjtj-006Cpi-1U;
	Mon, 11 Dec 2023 17:16:51 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCjth-006CnV-0R
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 17:16:50 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-58dd3528497so2790522eaf.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 09:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702315008; x=1702919808; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9O17D9j4YT4XtoaSYd3/nhs4s1HCIt9uZx1EA+AxCks=;
        b=BXnfD+dRimcyf9Fk1uEiYGhv98wvhA5MWzoqsKccCQdk0V7LsWtg55B3bPBG6RqHhQ
         QksrXkxdtHO9IA5H4h4HXV5rhv8T6m0S/bx4/sEjJiazjvsfIlQw014gXtH5Ea8gjSXf
         7SVZCCeizw8SZe+1JerTbayhl4brI5H79h+lskTXpRL50AQVpPRGA0Zz8QFidmykLDRq
         P02wQ9Cpdn+0b/KUezABLPI8+b7ZIFEWxbbcTxRVict2JQBFbSWm0hwLQavC3eZ0tlla
         T+nbLIKIIwaoe0oIr5WbzemsCurSxEcRQeijCzKWdWAGmoHQaJUze2xqo7rAQzWNIElQ
         EuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702315008; x=1702919808;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9O17D9j4YT4XtoaSYd3/nhs4s1HCIt9uZx1EA+AxCks=;
        b=eDa6HcINb0rReKpahC8NBW/eeoRdBg7zHbX5/8SJlXlinILK+91gbJP7L11RLgj884
         XOy+ijVjnJZxz8zsTiowXiSXdw5RgeR2pn/J8FqCIZoTjlzwmOSRmYPMoTu0yQkdYGMZ
         kdb5F9QhVDcKjz4s4/PB5kfUT+vBTKshSc2yeJg9VQ+LqMsOk+O23ytJsBjziF3zK6iM
         vP/5lFnhK+FYB9D54Su7cXC/oVPtNQMWNNh6Ooci7TJQurE46wgEOi4UxT0Wwzn63uiK
         rMLgsYYIb3Y+0JVLP0njzy9vte9Izr7OBR8DLw4iwu3mEAwF5EUWdNcd2IQ0ms8BNTws
         +USw==
X-Gm-Message-State: AOJu0YwsXg6pGbajyeoVaQwcQBNBps/EfGdRfFB1VV+23eWMBHA9C/G/
	km0F61WHUR7xkanPK8rK2/pdTFz5m71QXohzR5jyHQ==
X-Google-Smtp-Source: AGHT+IHy4FKXKcoa5vr1zWRR7h8ldItNotN+bq27os2Gmy1WmTZV3fGNzyOi2gfObdJOXzxcGBLOzA==
X-Received: by 2002:a05:6214:1fd9:b0:67e:b878:8e48 with SMTP id jh25-20020a0562141fd900b0067eb8788e48mr4904522qvb.39.1702311375258;
        Mon, 11 Dec 2023 08:16:15 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:f8a3:26ec:ac85:392e? ([2600:1700:2000:b002:f8a3:26ec:ac85:392e])
        by smtp.gmail.com with ESMTPSA id d17-20020a0cf6d1000000b0067a18167533sm3380983qvo.83.2023.12.11.08.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 08:16:15 -0800 (PST)
Message-ID: <3f28c1f7-f29c-461f-a90e-58d8e0996cc0@sifive.com>
Date: Mon, 11 Dec 2023 10:16:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/12] riscv: Add support for kernel-mode FPU
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
 <20231208055501.2916202-10-samuel.holland@sifive.com>
 <ZXc0rAdi7Vo8nbS8@infradead.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZXc0rAdi7Vo8nbS8@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_091649_192185_442D8E93 
X-CRM114-Status: UNSURE (   9.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2023-12-11 10:11 AM, Christoph Hellwig wrote:
>> +#ifdef __riscv_f
>> +
>> +#define kernel_fpu_begin() \
>> +	static_assert(false, "floating-point code must use a separate translation unit")
>> +#define kernel_fpu_end() kernel_fpu_begin()
>> +
>> +#else
>> +
>> +void kernel_fpu_begin(void);
>> +void kernel_fpu_end(void);
>> +
>> +#endif
> 
> I'll assume this is related to trick that places code in a separate
> translation unit, but I fail to understand it.  Can you add a comment
> explaining it?

Yes, I can add a comment. Here, __riscv_f refers to RISC-V's F extension for
single-precision floating point, which is enabled by CC_FLAGS_FPU.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
