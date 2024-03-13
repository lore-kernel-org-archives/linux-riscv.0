Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389A2C54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 11:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a8QNfLEQm0L9tzDtrf9m3t02sDOiAmGxeL67TwM+eIo=; b=YjZ85UtktKP0uv
	C/TCucb0k3yMQieD5RzKmtkc2AorM62K923QrPTnDjjXQqiYl31J60ZFOCO8TWb1KqwP5m2Zspzb7
	BvngEZ6VlZ+e069lWLh4IDxlQLyI1k1DE53N36aNnuy4BJyVR37dqp6Qp8S1kG+fnHaSYzIdCYCz3
	LRdP1vamObsZpaAz+uSk6X4QmLWyeW8Z8zKVsZc1+zP6yjR4XoyxngVV0jV+Jpy8f7GFha8eUTZvK
	lFXaMWIqGmWTdAZ+5refUUOTHzD53YA12xjIg6Wo+lx3ClgVsYMy3eqoCAQV4sAsRdJGCvxaR20Lm
	EprwsGT8LoM05hIWpMvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkMWE-00000009rox-2DhZ;
	Wed, 13 Mar 2024 11:11:34 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkMWB-00000009rm3-0qMH
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 11:11:32 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-513c53ed3d8so999026e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2024 04:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710328287; x=1710933087; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7woccNPj4UXd7qVtmOU390S3k1KzIAZsbOQ4xioXn0Y=;
        b=V+tE5Ot7OPzfrd4QExGSG+HtKGZki6tf4dAQ1jGS2vN04tezEvuQBpyC0OOYMV2cKK
         NLCkRWZUbksq3die31rr92VACHSyZMJWRwLKjzwLXb3DHQ6jNeGzIjK/7+wewxV+wt7d
         B7U6MipzuAc1s6718TBd85ipbxHo9Apq23YkohtCe5Xi2Yux/cZfbtc23yTiuIosw3o/
         L6tnGeItzMfVpF/FGEEF0Y36hE77s5YS1fYmaZkFlwoOVK/v3VDZ+PBSZS7ne5Cu7pIb
         ukltWrNcAktUi+2SZRoGwliAU0gdkE8aTDm2ZTr4624hQYfda0v3N/O4bABqm8AkQNnX
         aTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710328287; x=1710933087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7woccNPj4UXd7qVtmOU390S3k1KzIAZsbOQ4xioXn0Y=;
        b=TsnEV/LFhzRkFxLDo0vSmI6S/kCfX4qe2efIt1dQ3IU6s/W3esqIyw5rr7Cl87WbO+
         7zdmSpfMow+IiefFxZFy4PjNlP8HIfScJO8hXa5XRXrlrAKTlqnNN3oy6g79Z8fy893z
         AxuFmcAsYJiKS7gf/q9uUt7Jf+oUtKTJpFDoyS0DXuEqZ22PAVEVB7YkasSD461cDdLO
         57PqKQl+Y1lonIQUn2pC0Jo6r7v0jRypluFTF9NCoLtw+/Tp4ML+WKaxYHuJQ6jteosM
         29vf6WRnqar4ndmQFjZI/qjinpQs5ZRxR+3EUBz3kvL/Mppea0x0ven/9EKYy0KGLzTp
         iMJQ==
X-Forwarded-Encrypted: i=1; AJvYcCULgtDOzW/CpMUsuWO+AudBJjUB3XeDj+Vz8koMA8CTNGCR4RUBC+4b76bPpTPZ+FrGJrLhjM4f79ooVCJfELuSyDHV09/V+3zQvFzjQSK5
X-Gm-Message-State: AOJu0YyWNOHFq6X737rXtqqC3iz055A9NL1x/ILJcXjhCONLmAmXb8zj
	fZanwrXM2ouVDvd2WI/DX4VBf7EH9zR3SHGExI+c7Loc6pjs50mGxX2/A+PDhNQ=
X-Google-Smtp-Source: AGHT+IFe6RvtTLmew5N27k0KtbNVRvqn1qKhx35adNhbsYVId+ZVveNfCa7J/CyIRBKHtjtLjo0sKw==
X-Received: by 2002:ac2:59c6:0:b0:513:c790:792a with SMTP id x6-20020ac259c6000000b00513c790792amr1252418lfn.38.1710328287456;
        Wed, 13 Mar 2024 04:11:27 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id q11-20020adff94b000000b0033e95bf4796sm7905988wrr.27.2024.03.13.04.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 04:11:27 -0700 (PDT)
Message-ID: <4ac22b8b-9230-4489-8b38-a2ba79c16d16@linaro.org>
Date: Wed, 13 Mar 2024 12:11:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clocksource: timer-riscv: Clear timer interrupt on
 timer initialization
Content-Language: en-US
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: atishp@rivosinc.com, Samuel Holland <samuel.holland@sifive.com>,
 Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ley Foon Tan <lftan.linux@gmail.com>,
 stable@vger.kernel.org
References: <20240306172330.255844-1-leyfoon.tan@starfivetech.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240306172330.255844-1-leyfoon.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_041131_271242_396791C4 
X-CRM114-Status: UNSURE (   6.81  )
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

T24gMDYvMDMvMjAyNCAxODoyMywgTGV5IEZvb24gVGFuIHdyb3RlOgo+IEluIHRoZSBSSVNDLVYg
c3BlY2lmaWNhdGlvbiwgdGhlIHN0aW1lY21wIHJlZ2lzdGVyIGRvZXNuJ3QgaGF2ZSBhIGRlZmF1
bHQKPiB2YWx1ZS4gVG8gcHJldmVudCB0aGUgdGltZXIgaW50ZXJydXB0IGZyb20gYmVpbmcgdHJp
Z2dlcmVkIGR1cmluZyB0aW1lcgo+IGluaXRpYWxpemF0aW9uLCBjbGVhciB0aGUgdGltZXIgaW50
ZXJydXB0IGJ5IHdyaXRpbmcgc3RpbWVjbXAgd2l0aCBhCj4gbWF4aW11bSB2YWx1ZS4KPiAKPiBG
aXhlczogOWY3YThmZjYzOTFmICgiUklTQy1WOiBQcmVmZXIgc3N0YyBleHRlbnNpb24gaWYgYXZh
aWxhYmxlIikKPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTog
TGV5IEZvb24gVGFuIDxsZXlmb29uLnRhbkBzdGFyZml2ZXRlY2guY29tPgo+IAo+IC0tLQoKQXBw
bGllZCwgdGhhbmtzCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRw
Oi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0
dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xp
bmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
