Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985DECD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 15:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UF85st8In0DnVTs63tI5PU8NalzkCnWs+DFXB69Q46s=; b=KLpQdPV0QmdqOW
	Od8v3Ii2L7rgQJzjSSApAB7kkLVai3w0IamiEnoM54xUbTj+T7xsWDLJddS1272XYSta+Z8lu25oa
	Y96yNocxEz7o35NtiTRih8q2Wh9CyalmrixRJdPhHP9mgVAppyFGjdXshA6Z6KG8ysutLDW75GN0a
	Nph3EIeigDLZUYXPogL53SurQ3DuREIHjdflIULylRtcCb/lpPsBYyndM309yiOuTWOlIhHK+2zDD
	K/Vey5FJtK3ZZ6LKlgfGt2l4N8v25SsWBOK+y4izgRC6MuoMwDHJObIVv5U+n1t40oCchKrXwle9G
	KMabBC5ukGhIiiHlbhCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZue-00000007mzL-2VRZ;
	Wed, 10 Apr 2024 15:31:00 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZub-00000007mya-2QwU
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 15:30:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-346407b8c9aso678518f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 08:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712763056; x=1713367856; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWBh7JXEUeIzo5KgJAd3zKBhqX2eLt0rOguALy1M0Kk=;
        b=I9SWh3dRGMvlYpJ6xYHjr8bXQFKt2GeqK5r9ut60AFEfocdC15L6SqgXEuCyZi4Rek
         ADwgah3I0jxqpcbQfvDWgIPhGRRwnWWFRfEn9A7olSDP6PMW/Edj5pMUwRScg+a6V+Y1
         kt238eY3tqBwfgvskxji9fzEbwIirkc91Q1YMXBJ8QtQuvj9Y02/uL+U5AMmmbx8xIiQ
         A/LX4QGMEnNrum/lGvNRLOxR7Jog+kAvIwOfB7mk7ctzzFAwnVrFD8J7SAmThQCvAIG2
         +JubwTRLdey6dAKr0cY5GmjDO4qaCinINt9K0dxII+nlo3MN6SnL86y/coWvyja5H8eW
         pzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712763056; x=1713367856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWBh7JXEUeIzo5KgJAd3zKBhqX2eLt0rOguALy1M0Kk=;
        b=WoFpHucT27FqD0pEK5hVR3MXPuOJZSkck9wEX156QK+mtP6NioMqPOibvO0uT7OLd7
         6q1Te9t0mSkxzZOB5Y9qC15nybm7S5h7U8BnONsZKim8oJFvbvHIVwXYEjGCxdtvcL9f
         +c+1EjKAemnsIPcdh3tnkI1gy2YpinCLsTUprY6uNBDWoRQVs8IbRfLHn7jvsD6cWq68
         ZIMUeewiTAEc9ehQIqJ8mJrgYbt11RjhM5VZTw+XZBMd4AZ3QeSd3kCph42yU2tjmhuN
         Q4McRR/uVXO1AJ+Ptij9n6nCc4K/8x44AO8NeoaMoYmKGW9n86A0DtWBxMkaODkiZa7m
         QG6g==
X-Gm-Message-State: AOJu0YxGOEvFbkvZM/4Zr09FvTsHL322ANaxLH5aA1do4lV38cuxU/O+
	x6BGBPZjBnhPvw6/FCnzsN5lhEKq93DbpSBKm4QbgKzKYkFtlG9R6ABMdkKSy+I=
X-Google-Smtp-Source: AGHT+IGM+tKVXZHv9j2QFP6knh6WFNV2lFvfGgCYRQglQNtraXDOdyw8VxBYrHku61VtDa7HjL9l/w==
X-Received: by 2002:a5d:64e3:0:b0:343:ba58:1297 with SMTP id g3-20020a5d64e3000000b00343ba581297mr2445689wri.3.1712763055716;
        Wed, 10 Apr 2024 08:30:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff? ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c1d9300b00416bf7b68f6sm2604986wms.31.2024.04.10.08.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:30:55 -0700 (PDT)
Message-ID: <ce7b7413-31ac-4c93-8970-e7cf0d6902cc@rivosinc.com>
Date: Wed, 10 Apr 2024 17:30:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] riscv: nommu: remove PAGE_OFFSET hardcoding
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240410142347.964-1-jszhang@kernel.org>
 <20240410142347.964-2-jszhang@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240410142347.964-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_083057_645395_944D1581 
X-CRM114-Status: GOOD (  16.69  )
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

CgpPbiAxMC8wNC8yMDI0IDE2OjIzLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+IEN1cnJlbnRseSwg
UEFHRV9PRkZTRVQgaXMgaGFyZGNvZGVkIGFzIDB4ODAwMF8wMDAwLCBpdCB3b3JrcyBmaW5lIHNp
bmNlCj4gdGhlcmUncyBvbmx5IG9uZSBub21tdSBwbGF0Zm9ybSBpbiB0aGUgbWFpbmxpbmUuIEhv
d2V2ZXIsIHRoZXJlIGFyZQo+IG1hbnkgY2FzZXMgd2hlcmUgdGhlIChTKURSQU0gYmFzZSBhZGRy
ZXNzIGlzbid0IDB4ODAwMF8wMDAwLCBzbyByZW1vdmUKPiB0aGUgaGFyZGNvZGluZyB2YWx1ZSwg
YW5kIGludHJvZHVjZSBEUkFNX0JBU0Ugd2hpY2ggd2lsbCBiZSBzZXQgYnkKCkhpIEppc2hlbmcs
CgpUeXBvOiBzL2hhcmNvZGluZy9oYXJkY29kZWQKCj4gdXNlcnMgZHVyaW5nIGNvbmZpZ3VyaW5n
LiBEUkFNX0JBU0UgaXMgMHg4MDAwXzAwMDAgYnkgZGVmYXVsdC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yv
S2NvbmZpZyB8IDggKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNo
L3Jpc2N2L0tjb25maWcKPiBpbmRleCA3ODk1Yzc3NTQ1ZjEuLmI0YWYxZGY4NjM1MiAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBA
QCAtMjQ3LDEwICsyNDcsMTYgQEAgY29uZmlnIE1NVQo+ICAJICBTZWxlY3QgaWYgeW91IHdhbnQg
TU1VLWJhc2VkIHZpcnR1YWxpc2VkIGFkZHJlc3Npbmcgc3BhY2UKPiAgCSAgc3VwcG9ydCBieSBw
YWdlZCBtZW1vcnkgbWFuYWdlbWVudC4gSWYgdW5zdXJlLCBzYXkgJ1knLgo+ICAKPiAraWYgIU1N
VQo+ICtjb25maWcgRFJBTV9CQVNFCj4gKwloZXggJyhTKURSQU0gQmFzZSBBZGRyZXNzJwo+ICsJ
ZGVmYXVsdCAweDgwMDAwMDAwCj4gK2VuZGlmCgpJJ20gbm90IHN1cmUgYnV0IGl0IGZlZWxzIG9k
ZCB0byBoYXZlIHRoaXMgYXQgdG9wIGxldmVsIGNvbmZpZyBtZW51LgpNYXliZSBpdCB3b3VsZCBt
YWtlIG1vcmUgc2Vuc2UgZm9yIHRoaXMgdG8gYmUgbG9jYXRlZCB1bmRlciB0aGUKIlBsYXRmb3Jt
IFR5cGUiIHNlY3Rpb24gPwoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gKwo+ICBjb25maWcgUEFHRV9P
RkZTRVQKPiAgCWhleAo+ICAJZGVmYXVsdCAweEMwMDAwMDAwIGlmIDMyQklUICYmIE1NVQo+IC0J
ZGVmYXVsdCAweDgwMDAwMDAwIGlmICFNTVUKPiArCWRlZmF1bHQgRFJBTV9CQVNFIGlmICFNTVUK
PiAgCWRlZmF1bHQgMHhmZjYwMDAwMDAwMDAwMDAwIGlmIDY0QklUCj4gIAo+ICBjb25maWcgS0FT
QU5fU0hBRE9XX09GRlNFVAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
