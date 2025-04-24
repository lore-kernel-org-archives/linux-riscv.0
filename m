Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7CAC369D5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pZu8Wwo3mvxElj0uLdvsGxN5IFdrpMBDUKLLXA778c=; b=WTotK+hggPgEhb
	X4YhP6xQzZRpyqcZMV4zgPdVB0y3QneP8XHWzbGQfjuqfkEr8QF9QZmIOQ2UVV1YZeshyzsn2CMxV
	KVxb8IIqFv7pZPNNohwu88Yghv1sYuwESGzBzyqbR7Z5wZOZle6BGaDYAwRvr3Ke8EJ20JYTahskA
	p5WVqHLH00awWgX4F8E0Nm3H33MpvImX2cxV2aMC92dS73yMLcC+hkQzC+YanY3dOAGJnW+t4+vkv
	NB+Iitdrgk5PlEtpJaC9k/iLejbSlWSlgUhTpkCi7ksJkB7ZU3Ff7KNPd0kvEAWeEqGKKSXQlE4jR
	Gm+w4fWJ6zcKHy63NPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z3u-0000000Eb8r-2gc8;
	Thu, 24 Apr 2025 16:04:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7wFL-0000000E8NE-0xZE
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 13:04:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so9762875e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 06:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745499845; x=1746104645; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZlenUvh61lykgI0moQ4b5m5MpD7H2yqiNR9KiWkzX9o=;
        b=uSWA5oUXL+Rx8fUZvzxx63yaYKhNQ92s3bnnW7w1W0BPnZ9rwleoN1NgaS50o63o9H
         +LIlueRtCPIvMpUDO/6ByIVjwbIfCb87q22QyCc8+ih2eHk3UBf0TPJ/sXB8V05YdSP2
         3youTikaKrkpcJRbiL6PyJ0Y1GyaVPWyjCBD720h1NgZhqnt58hPpxD+NxmJozWdTS45
         RqWZRfrRVGYmomLrXCLq2KF8f6CZ++0kdMu/28gOS8bEss9wua6HvpQdfbuav+c4wK/s
         erLXgm1GQS2yUlfqfa1sWP04b/mzLuoxwgXr5wRgSwp6OryRhHiNgoE+zojIivndw16c
         K9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499845; x=1746104645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlenUvh61lykgI0moQ4b5m5MpD7H2yqiNR9KiWkzX9o=;
        b=YUxCMDqyU1CVVYcjuwxyL8Ib8u7aXJR66bOBgXjxHxnEuDpW1ZNWt/7IUS9xmXBY/2
         fcQkM67jDqwX99o/NpQ7mmAjgUD8vSiv8vq9p3P04G7+AOAMSN0d4vKH6ZYNxRSeFIdi
         R/CydVsGXDUG118L8WoPN9HJNMKj+cs68RFPD0wzFi01X/Xk/UxUlHrNR+8khi8tXPi8
         MRi+deMLsId97o+FXr0pG4Yhq5rKkml++wfyDXAzmk8FeHTon2M71z6sOV2vAYSK1hzU
         GfKt2jtEStuwyKLtX+09JFRXrrOIr1XS040boBdln0pKvklhggG9ZEdkCGz/fKjv2InM
         q0Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWHwv5DS7UZdpMUlaAjPRpn/6uJkmPmpWQbunkMYa6/4bSueUSatsm+tzOLDJoONBt+oAn9TFHzB+xovg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkirhxaDXEm1FglSmVJLW6Lj/Dt7qPXTgFlsIsl+2mare1iHWS
	CF4prjqM8dWOK1EIpFfj4zmTcvJFUXjAAOPMA7XBru0kGyNQ1j5/cC/4NzfLCsQ=
X-Gm-Gg: ASbGncuPteTjr/4z2UWhCAsQ6inO7iq5+C3FXDN5KjYxQYtJpIuDn+5xUypkpJJdmFc
	rLEesGO/okI5fq7FKDICz5QsJhAUHYtKjIv88R4+E8kkStSKFR2IduM8kRQgXz9Ul3IxXRjExsq
	8+I3E87AFI0y/xuh1vWLn6GTRAlygcHrqDIq0j0I3r93suC/MLMdhYmaqFEhr1441RDZKihZO3U
	//MqRMdw/Z1bEZOxpnMmSj8a3rMqhmy2Nrcwo6ZNrs/2CBjPmp92njgDByuzKJwMAvjHBZY79nM
	I5wIJYy7CBrptAyINzgy2Tf0TxsnQNuNjnwY17wKIxAV5POmF6JtvBdxGl/fOp17cGxQPXOvkWD
	OgupYlOqzkA==
X-Google-Smtp-Source: AGHT+IFY/zQrAFYpl1F/wfq7qZKx4PChEo3rOT9RvUxXUgDej0UjL+OvlI8WpktqulU98FccnhbKpQ==
X-Received: by 2002:a05:600c:5110:b0:43c:ef55:f1e8 with SMTP id 5b1f17b1804b1-4409bd20ab9mr23814095e9.13.1745499844890;
        Thu, 24 Apr 2025 06:04:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2acf8dsm20366545e9.23.2025.04.24.06.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 06:04:04 -0700 (PDT)
Message-ID: <8c7c1632-ced2-491a-92a3-8b98de655b4a@rivosinc.com>
Date: Thu, 24 Apr 2025 15:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] riscv: sbi: add SBI FWFT extension calls
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-5-cleger@rivosinc.com>
 <20250424-c0700f89bcd29438d6d8d65c@orel>
 <f6c5c92d-73aa-41a7-99bb-f95e388ea294@rivosinc.com>
 <20250424-27a672c1da15353051b52c59@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250424-27a672c1da15353051b52c59@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_060407_258733_659822E4 
X-CRM114-Status: GOOD (  13.72  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyNC8wNC8yMDI1IDE0OjU5LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MjQsIDIwMjUgYXQgMDI6MzU6MDJQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAyNC8wNC8yMDI1IDEzOjA2LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4+PiBPbiBUaHUs
IEFwciAxNywgMjAyNSBhdCAwMjoxOTo1MVBNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4+Pj4gQWRkIEZXRlQgZXh0ZW5zaW9uIGNhbGxzLiBUaGlzIHdpbGwgYmUgcmF0aWZpZWQgaW4g
U0JJIFYzLjAgaGVuY2UsIGl0IGlzCj4+Pj4gcHJvdmlkZWQgYXMgYSBzZXBhcmF0ZSBjb21taXQg
dGhhdCBjYW4gYmUgbGVmdCBvdXQgaWYgbmVlZGVkLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgo+Pj4+IC0tLQo+Pj4+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9zYmkuYyB8IDIwICsrKysrKysrKysrKysrKysrKystCj4+Pj4gIDEgZmls
ZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmku
Ywo+Pj4+IGluZGV4IDM3OTk4MWMyYmIyMS4uN2IwNjIxODliMTg0IDEwMDY0NAo+Pj4+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2Jp
LmMKPj4+PiBAQCAtMjk5LDYgKzI5OSw4IEBAIHN0YXRpYyBpbnQgX19zYmlfcmZlbmNlX3YwMihp
bnQgZmlkLCBjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1X21hc2ssCj4+Pj4gIAlyZXR1cm4gMDsK
Pj4+PiAgfQo+Pj4+ICAKPj4+PiArc3RhdGljIGJvb2wgc2JpX2Z3ZnRfc3VwcG9ydGVkOwo+Pj4K
Pj4+IEF0IHNvbWUgcG9pbnQgd2UgbWF5IHdhbnQgYW4gU0JJIGV4dGVuc2lvbiBiaXRtYXAsIGJ1
dCB0aGlzIGlzIG9ubHkgdGhlCj4+PiBzZWNvbmQgU0JJIGV4dGVuc2lvbiBzdXBwb3J0ZWQgYm9v
bGVhbiB0aGF0IEknbSBhd2FyZSBvZiwgc28gSSBndWVzcyB3ZSdyZQo+Pj4gc3RpbGwgT0sgZm9y
IG5vdy4KPj4KPj4gVGhhdCBzZWVtcyByZWFzb25hYmxlIHRvIGhhdmUgYSBiaXRtYXAgcmF0aGVy
IHRoYW4gZHVwbGljYXRpbmcKPj4gKmV4dCpfc3VwcG9ydGVkLiBJZiB0aGF0J3Mgc29tZXRoaW5n
IHRoYXQgYm90aGVycyB5b3UsIEkgY2FuIHRha2UgY2FyZQo+PiBvZiBpdCBhbmQgdXNlIGEgYml0
bWFwLiBTU0Ugd2lsbCBhbHNvIGhhdmUgYSBzc2Vfc3VwcG9ydGVkIGJvb2xlYW4gYnV0Cj4+IGlu
IGl0J3Mgb3duIGRyaXZlciBmaWxlIHRob3VnaC4KPiAKPiBVcCB0byB5b3UuIFdlIGNhbiBhbHdh
eXMgZG8gaXQgbGF0ZXIuCgpJIHdpbGwgbGV0IHRoYXQgZm9yIHRoZSBuZXh0IGV4dGVuc2lvbiBi
ZWluZyBhZGRlZCB0aGVuIDspCgpDbMOpbWVudAoKPiAKPiBUaGFua3MsCj4gZHJldwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
