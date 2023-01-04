Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597C3C54E76
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 22:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z34UdVAbU06EnRVhywIBBihrbm5NsBbo+Y4wGR3OLBI=; b=Q3Rsf8dzunkuhM
	ZvjFmKrPmTNgoKbYV+LPmIAzUu+N7glDXXEUAf67JfTCBBvBYZ0IZZgp/x8VE9cYMkTSXwgwfKPAD
	pjMXw37wo08VFTWEWtDXpq7a4rn24I7o9y5+k54V+k1ZioTcKqWCl9oXmyHnHIPe6iRRaqPAfT6a7
	X4qbqSIB40VrbQ0ETRzj39oUTdnuijdf0Vr1nxlG2t1zJTpc3Jx6P0AARSApaDQoQgN/mx84e4sXu
	rHOZ2yD33l3pPAW8I6ezp1B3TSJ+FTGXKZB9hkrIFTtUQqGzkkpwEZd8+KtQwmFw/LRgXeEgGYM7T
	plLADW5k0wO8ZNB4ZwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDCPL-00CkCK-Uh; Wed, 04 Jan 2023 22:38:51 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDCGq-00Caxx-EB
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 22:30:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso1332572wmb.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 14:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kiiu/Seb82UTPCSu/8Bs7i2e8eXl5Aa8bi8QlsNKuis=;
        b=BIDg1fcFkWUBfF69/HvdlnWlqGKoISpfZDgqIHythOcg1wBn/HejNRvo49F3OQ09ww
         dktSem0F4w4G1o1uskYQuQxUV0CxnamHTsmnnYlPAbwEt4QFp7GdZboo30Sou5DLT6xx
         kYxXizmr7JR9ZHWjNQspCHLlChfJX+UbgPlXxQaIWYOXbO1fJwQ8q0NZYhOgexbQw+tF
         r03C8hARvYz4QW1Zb95TMsSn/9UqX0OzuOZznvnmL7TtQw/Pq3ez8w9SjVorTsb7S+6v
         /ZSbBJD4RHjbAqbxBPTxbMV+ofdWSfBuCc5mb2Fl3v4dwXJBYsaMXdFJaVcSR5uEFJ5p
         FrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kiiu/Seb82UTPCSu/8Bs7i2e8eXl5Aa8bi8QlsNKuis=;
        b=LBA6ViR0TKNLwlaDm7cRQHNqHY1gmuoo1gITGQzZXiDGy2vAqSvuNf/QwBll9rZDJs
         78o7zVh6M6mELgXYvi4U7VnI3vbfkq1pzg0Jxs/XsLR7ZRNeKHIVPZH77YPQclMy4hkv
         VT7oDs/qKvCemYNtEfKR+W5S6hC+o6Osa97wm1hfaYUxWO8tD9Xel52hNhygK8Ys5Kmj
         Moy/a86OaPZYBvCn7SClsMj0+kvRa4QqfWmZUl85LsPQpIYiLDkZFjPO8ur7JmikJJKy
         hDo3OYpcuF71exu7vxdrLNwz09k8JOgx0jKoY6m5Ntfg4UEnquLCB/cmKTlsfMxcpuK+
         ajxw==
X-Gm-Message-State: AFqh2kpuNh1+u6+FIsr9LBRuu/nxncqNkxvlUOapVfByrBZM/FzbDh0o
	ZKO4CVDclDgso7p+GnuD5EdMmg==
X-Google-Smtp-Source: AMrXdXulBTZ0uWBN5rhjfCWeQ571oYcrzq/+b5U8l9PLgxXI4VkY4BZIi+I9BlsE1N8K8rldlrArEQ==
X-Received: by 2002:a05:600c:5006:b0:3d2:3eda:dd1 with SMTP id n6-20020a05600c500600b003d23eda0dd1mr35240937wmr.17.1672871401974;
        Wed, 04 Jan 2023 14:30:01 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id m7-20020a05600c3b0700b003cfd4cf0761sm267118wms.1.2023.01.04.14.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 14:30:01 -0800 (PST)
Message-ID: <8fa6b106-5670-247c-08d2-2740b1b00979@linaro.org>
Date: Wed, 4 Jan 2023 23:30:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 0/3] Improve CLOCK_EVT_FEAT_C3STOP feature setting
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>, Samuel Holland <samuel@sholland.org>,
 Conor Dooley <conor.dooley@microchip.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230103141102.772228-1-apatel@ventanamicro.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230103141102.772228-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_143004_520365_B119E31A 
X-CRM114-Status: UNSURE (   9.34  )
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

T24gMDMvMDEvMjAyMyAxNToxMCwgQW51cCBQYXRlbCB3cm90ZToKPiBUaGlzIHNlcmllcyBpbXBy
b3ZlcyB0aGUgUklTQy1WIHRpbWVyIGRyaXZlciB0byBzZXQgQ0xPQ0tfRVZUX0ZFQVRfQzNTVE9Q
Cj4gZmVhdHVyZSBiYXNlZCBvbiBSSVNDLVYgcGxhdGZvcm0gY2FwYWJpbGl0aWVzLgo+IAo+IFRo
ZXNlIHBhdGNoZXMgY2FuIGFsc28gYmUgZm91bmQgaW4gcmlzY3ZfdGltZXJfZHRfaW1wX3Y2IGJy
YW5jaCBhdDoKPiBodHRwczovL2dpdGh1Yi5jb20vYXZwYXRlbC9saW51eC5naXQKPiAKPiBDaGFu
Z2VzIHNpbmNlIHY1Ogo+ICAgLSBSZWJhc2VkIG9uIExpbnV4LTYuMi1yYzIKCkFwcGxpZWQsIHRo
YW5rcwoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNv
dXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5m
YWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20v
IyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxv
Zy8+IEJsb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
