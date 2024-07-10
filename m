Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD7DC3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 08:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bzT75IpxOLfSB2GXdz/wUf3lq24iHKeD89RKikxKVQ=; b=zuiWA0QdUVDlL2
	kepj3ZGYK5c1EOKrcrhCsCV5PMD9TC33TFqTUODKjlryOTjrOCeCaOi+EKlffCulhDeYr50fe4LxS
	A92HEzIisGMT/dhaW/wZF7dT/5KfZabBMUy8AnqrDHg9t54vYTadV55VlmKT9MkHvwKIuZqdDCN5H
	xtsiMHy0DspGcVJ4bnW5wC61PICgjcqzshLhTI1MS+im7RzpZmcH3+BsgLbYEIZq2avbN62IjFbDK
	ESFT9nlTZUlto8HHmlBjaW4KDKWkHnP1cKdYy/1XJzcLbguwYFCeB96g9yh3zPxgZ+CkpoR+hiUTn
	ulG/c2PYlRiF5NWJlhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRSSN-00000009qnN-2OOK;
	Wed, 10 Jul 2024 08:13:43 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRSSK-00000009qmp-4BDA
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 08:13:42 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4212b102935so7400675e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 01:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720599219; x=1721204019; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ljKsUTZvZVP6wXh4lGuG/G1a2SNPwlawfzj7RkjMJM0=;
        b=NG5K/XWEDewldKuYUIzmI7o+DxwcjK1pJWiAlq2hZ2K5BRYcihm96pfnXykpC6Rcq1
         3yB0Wfc5B0zLwfW5dzdW5fwlCCmAuOJ9Af9I52pVHjdQtLi78SHNeYNaCm262XcPa0sT
         N3fum543lWsVj+ZuhFXaWWqoyakWEJuL63OxYN0u1PsYzPhXYiwnKuObbKaLYy5Wi5av
         SdTrsedqETOBD6lm7ABSqG+F17kg+8ket0AZ5/1nHl/cm1PlR1sN2mq8J1ld7C2pPWZa
         vjIm6a8hmFOJSH9oEmGblHHzkyWKb9jbAEzECvdwreqfzrl1GTarKTfjg8NP18SQh9II
         0llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720599219; x=1721204019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ljKsUTZvZVP6wXh4lGuG/G1a2SNPwlawfzj7RkjMJM0=;
        b=tHEE7Tqlti72goUvYVht6usLOiE7mDC0Oz2ytR6LbWhyjuAVxJUCExSEpiNMb0nv1j
         kK1F/F19lQ/pAvMM2cXgYghaRtpr1fnGfPxsA7iZOY6YlC/Quj3KX1BaEuGqxICrpAGV
         HTm1iyhIP0ojtyOQgl6CAxJWcQi4JU6ltlvfJF+NiDs+2Wz7rnJrTvPCjjdKcP6m9rAa
         EdlN3aZ/x2NOY2O9WTcRZiVT1ubhYbzc6ydQe7JFLD5PgCUgStJZzNZOXE8j+5hOZ717
         8Tf0Q7rdfo04VmCV4KT7d73rcclUgkFlos5ieAiR6RqsluinbYkE+VVvY8feDfw0+6a5
         bZyQ==
X-Gm-Message-State: AOJu0YwoSiIS2wysX/+QzyYBlOYt+T5D1jdKLgRkrWtl0YINUUX/7oue
	wOn7IY9TJlZ2LF1AXUdfHn8Q92LRFn74uC59coK7KRvxc4aI+LLmjWlL0hobuxc=
X-Google-Smtp-Source: AGHT+IHMHSxoqd+xgXgy0bOLqdNFMIpV82LR87YS4YDu/bmyWzgaPs82YtW9EUoqmZ7uEZvtEBsJIw==
X-Received: by 2002:a05:600c:1d1a:b0:426:6a0d:1ae5 with SMTP id 5b1f17b1804b1-4266ff87d7cmr33227115e9.0.1720599219289;
        Wed, 10 Jul 2024 01:13:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:9fb4:e15f:31d3:4404? ([2a01:e0a:e17:9700:9fb4:e15f:31d3:4404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-426740d88bcsm39416755e9.1.2024.07.10.01.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 01:13:38 -0700 (PDT)
Message-ID: <11053a90-08c5-426c-ae15-ed61e7286980@rivosinc.com>
Date: Wed, 10 Jul 2024 10:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] riscv: select ARCH_USE_SYM_ANNOTATIONS
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240709160536.3690-1-jszhang@kernel.org>
 <20240709160536.3690-3-jszhang@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240709160536.3690-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_011341_078127_934CBC4D 
X-CRM114-Status: GOOD (  13.12  )
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

CgpPbiAwOS8wNy8yMDI0IDE4OjA1LCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+IE5vdywgcmlzY3Yg
aGFzIGJlZW4gY29udmVydGVkIHRvIHRoZSBuZXcgc3R5bGUgU1lNXyBhc3NlbWJsZXIKPiBhbm5v
dGF0aW9ucy4gU28gc2VsZWN0IEFSQ0hfVVNFX1NZTV9BTk5PVEFUSU9OUyB0byBlbnN1cmUgdGhl
Cj4gZGVwcmVjYXRlZCBtYWNyb3Mgc3VjaCBhcyBFTlRSWSgpLCBFTkQoKSwgV0VBSygpIGFuZCBz
byBvbiBhcmUgbm90Cj4gYXZhaWxhYmxlIGFuZCB3ZSBkb24ndCByZWdyZXNzLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiAtLS0KPiAgYXJj
aC9yaXNjdi9LY29uZmlnIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcK
PiBpbmRleCAwNTI1ZWUyZDYzYzcuLmM1MWIzMmE4ZGRmZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBAQCAtNjIsNiArNjIsNyBA
QCBjb25maWcgUklTQ1YKPiAgCXNlbGVjdCBBUkNIX1VTRV9DTVBYQ0hHX0xPQ0tSRUYgaWYgNjRC
SVQKPiAgCXNlbGVjdCBBUkNIX1VTRV9NRU1URVNUCj4gIAlzZWxlY3QgQVJDSF9VU0VfUVVFVUVE
X1JXTE9DS1MKPiArCXNlbGVjdCBBUkNIX1VTRV9TWU1fQU5OT1RBVElPTlMKPiAgCXNlbGVjdCBB
UkNIX1VTRVNfQ0ZJX1RSQVBTIGlmIENGSV9DTEFORwo+ICAJc2VsZWN0IEFSQ0hfV0FOVF9CQVRD
SEVEX1VOTUFQX1RMQl9GTFVTSCBpZiBNTVUKPiAgCXNlbGVjdCBBUkNIX1dBTlRfREVGQVVMVF9U
T1BET1dOX01NQVBfTEFZT1VUIGlmIE1NVQoKSGkgSmlzaGVuZywKCkl0IG5vdyBjb21waWxlcyB3
aXRoIHRoZSBwcmV2aW91cyBwYXRjaCAodXNpbmcgdGhlIGRlZmNvbmZpZykuCgpSZXZpZXdlZC1C
eTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKVGhhbmtzICEKCkNsw6lt
ZW50CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
