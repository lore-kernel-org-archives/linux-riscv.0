Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60635CCFA04
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zaTzdhKgcmXkzswW506fRG/nUzjrHjhv1wLFqhnPfYs=; b=xDQRjYcvpZwMw1
	Blnogs9xTLFleI62EnhnonElrk0tjbnAAQx06xmq15susoZKjaItvB5ONqKdhWqT3JNFtOT+rjSxq
	LdXzmMoxy/Nga6o85MDlZhR5fFDYfZjo+uhVoM4KrhW88JLoNYuHGfho4jnh9RqE4yxMMQnI0fJny
	IuXcTfCvz/peQcvuUFNyzzbt5H3LG2x3Zu1kwfp6F8uFuSci4LhAFjm5StRoEsFZDjXEPpC7bg8wx
	6Y0QXO2UFvtPtYBFfKMjvI69T1K82y7KM2vCKc0m6FadmArAWvRoCZT9tU1tVcBrIO+wfvCM6DUrd
	hhqck89W5ToD+d7YXXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYxe-0000000DIgP-257P;
	Wed, 05 Nov 2025 08:33:46 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYxc-0000000DIfj-1dle
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 08:33:45 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b991ddb06a9so2494871a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Nov 2025 00:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1762331623; x=1762936423; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HpTquQODFrk3k7PTmJWFoZkkIUY08cVx4+GYG+eKacw=;
        b=UsfYwn1I3sTSmUhsXDGyRGf4MS+4QcEUC5F8zIQONyPPwi/1uLzv2avYbOBW14oqfa
         mzyFAAEno1J3UYEl5Ry6fiZNyEnPYEm3fOsJUuwaSauenLxzVqHidX9sXT//Hk0y2MWp
         w83M7+r/2VGjVzUdlfRyLiRfKie2n4RKAy3Nv/TmihWJJkA+I4l/2P9A2W6tC2xlXinY
         +xP3VvMd0dvVln774vQyV7gE4xxnCppxsh+FzJwToqA59IWXXyopSMfjXz68FJr3cAC5
         EzLFju7KqP9PRXV7O3lPPmQN4YX8vSvBH90OOaIq1cpVme7kYx7gpnPu/uaQr1EcX858
         A3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762331623; x=1762936423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HpTquQODFrk3k7PTmJWFoZkkIUY08cVx4+GYG+eKacw=;
        b=HcgZBLw8XW2UBpgbn7hP1qFNVNeVUh2fHV7oBLAiCJvUbb2yiazFfZV3jC/m2JRTnw
         nq7LJkgkKR5CZ3AutBZjsMGOLe8ZesqcveWzwPeiyPk0Usd/zp1JLPSo99kl854MpfBu
         Ir/OwhoeUBfWbtQNJFxLGPIP/lWlLy9zgcTW3nBMcH1P7L2Icr6KxTxYJ0Z8zcBHdcEf
         pf3bC4hkCZ3efdbfVVg3uHR/D+Cn5u9fr5pOA4LtyiJ6+l/oC3McOupigJCWRqfQFWeY
         nLSrNOss4VmvvCubovAKJ7nEtNS4z6nXzeqcG2nP/a7RZXh+eFUyEyWIiSjfW//TqKCm
         s9xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYIeh66wTyxiTEugW56dFuwHbsjRPGvdrZskPHeZRtGj8QIsNUYwiijtEp3vM5vY4HFZKUPpfLJ1O72A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaTgywvdFXvmU5s7TdnV3HUiX/ccVAqrYQQ6fNG5G8YdwKtQIn
	zqVf4Gd1Seiy9DGm9gEHrR9qX3udiR0cFwFyWbaKl/ramhLPjsc6qPWjwzmWHRZH+Nw=
X-Gm-Gg: ASbGncsKrDgg2xgyZTney4S4LwMJEDIqE1T23uWjUFvY8w1PdnW8m3PlzS/Vgk6atPd
	5NMnqpGi2ch0EjvJMbn7IDw7Xp4urrChrlWz2qvQMYsdm7Hkj112edM+Ch+WTJlWyzx1y1Gx/Jx
	kGnU+CdTGWqUcARGsRCo2L164P+md0M3+RCA+3VzKfBL6VHjq1n3MypppSogG2F42ep7LVMh4SM
	ITWNem6sEvT7zxHxA1a80QNDetgTXP6j75kEboW87RB0BNxk378K8aK4YzswPUrTfuc8VEQyve7
	tCueuRXRRpJ1M6dDWKc0DLjLP4cDsJkofWOOwL36Lu2ON/ZMV3EOhDPYAMy4Otj0+C/YE7BeQUp
	vqT6veK8YQrDUVGvcKWrGTaa6DvzHNR/NEJ3y1XJvjIc1R1+4G46GGm4soC2AKWYEoUt3mSQ+Pd
	cx7ON0w5trJvqq7l0XKnPE5MADNtw3YG8u3ADIuLYy/r8WUg==
X-Google-Smtp-Source: AGHT+IHDFgcvO6z3yf7vgJuVKi/Izk8w235XWF6jlBUbkg3bEglTQPQvHCk60pfVQnoZVc+QCi6Lug==
X-Received: by 2002:a05:6300:800a:b0:34f:c83b:b3ec with SMTP id adf61e73a8af0-34fc83bbb89mr1922411637.15.1762331623396;
        Wed, 05 Nov 2025 00:33:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ae256df261sm1899131b3a.73.2025.11.05.00.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 00:33:42 -0800 (PST)
Message-ID: <15298563-967c-4609-9410-4bc0b6a75be6@rivosinc.com>
Date: Wed, 5 Nov 2025 09:33:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/10] acpi: Introduce SSE in HEST notification
 types
To: Himanshu Chauhan <hchauhan@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
 acpica-devel@lists.linux.dev
References: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
 <20251029112649.3811657-4-hchauhan@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20251029112649.3811657-4-hchauhan@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_003344_432652_C607CBE8 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: apatel@ventanamicro.com, tony.luck@intel.com, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAxMC8yOS8yNSAxMjoyNiwgSGltYW5zaHUgQ2hhdWhhbiB3cm90ZToKPiBJbnRyb2R1Y2Ug
YSBuZXcgSEVTVCBub3RpZmljYXRpb24gdHlwZSBmb3IgUklTQy1WIFNTRSBldmVudHMuCj4gVGhl
IEdIRVMgZW50cnkncyBub3RpZmljYXRpb24gc3RydWN0dXJlIGNvbnRhaW5zIHRoZSBub3RpZmlj
YXRpb24KPiB0byBiZSB1c2VkIGZvciBhIGdpdmVuIGVycm9yIHNvdXJjZS4gRm9yIGVycm9yIHNv
dXJjZXMgZGVsaXZlcmluZwo+IGV2ZW50cyBvdmVyIFNTRSwgaXQgc2hvdWxkIGNvbnRhaW4gdGhl
IG5ldyBTU0Ugbm90aWZpY2F0aW9uIHR5cGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSGltYW5zaHUg
Q2hhdWhhbiA8aGNoYXVoYW5AdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAgaW5jbHVkZS9hY3Bp
L2FjdGJsMS5oIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2FjcGkvYWN0YmwxLmggYi9pbmNs
dWRlL2FjcGkvYWN0YmwxLmgKPiBpbmRleCA3ZjM1ZWIwZTg0NTguLjIwYjQ5MDIyNzM5OCAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL2FjcGkvYWN0YmwxLmgKPiArKysgYi9pbmNsdWRlL2FjcGkvYWN0
YmwxLmgKPiBAQCAtMTUzNSw3ICsxNTM1LDggQEAgZW51bSBhY3BpX2hlc3Rfbm90aWZ5X3R5cGVz
IHsKPiAgCUFDUElfSEVTVF9OT1RJRllfU0VJID0gOSwJLyogQUNQSSA2LjEgKi8KPiAgCUFDUElf
SEVTVF9OT1RJRllfR1NJViA9IDEwLAkvKiBBQ1BJIDYuMSAqLwo+ICAJQUNQSV9IRVNUX05PVElG
WV9TT0ZUV0FSRV9ERUxFR0FURUQgPSAxMSwJLyogQUNQSSA2LjIgKi8KPiAtCUFDUElfSEVTVF9O
T1RJRllfUkVTRVJWRUQgPSAxMgkvKiAxMiBhbmQgZ3JlYXRlciBhcmUgcmVzZXJ2ZWQgKi8KPiAr
CUFDUElfSEVTVF9OT1RJRllfU1NFID0gMTIsIC8qIFJJU0NWIFNTRSAqLwo+ICsJQUNQSV9IRVNU
X05PVElGWV9SRVNFUlZFRCA9IDEzCS8qIDEzIGFuZCBncmVhdGVyIGFyZSByZXNlcnZlZCAqLwo+
ICB9OwoKSGkgSGltYW5zaHUsCgpMb29rcyBnb29kIHRvIG1lLAoKUmV2aWV3ZWQtYnk6IENsw6lt
ZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkNsw6ltZW50Cgo+ICAK
PiAgLyogVmFsdWVzIGZvciBjb25maWdfd3JpdGVfZW5hYmxlIGJpdGZpZWxkIGFib3ZlICovCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
