Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B36C02194
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 13:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+NBjIxuf2RGSBGHWH1qAifXJPE0na9p/FesztVytYQ=; b=eNr7BrEKDzLIix
	V4/ivspTiuH6u8pTbUpkqAQGyLEqhQbKJYLAnrSx9uMHvw5oYUDaZxprdp2Hp/Rl57uAKedFamDNA
	1faoIls56JHoFClCtUZW2KPJEljZmt/4ARaypgHKRdii9ixYihFljgMalURueUpslX0tOkiqfgVT6
	epbBb4nX1+XFEoP9Gckvheo/HxvSP7ywf79TPLzyYzVfIMFJKgU/31XxExCCQZjNXn0Y4izz9yZAN
	anUnnuA6UhNSPhTxKoImQYkKH95GS1XWaWYUoT0Qf2///NLm/cKe8luzErsP61LKDhnk9YOqrnOBM
	7+F42TIGYKpxwgN4IdCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2PB-00000006VJZ-3Lis;
	Thu, 06 Feb 2025 13:58:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2Fn-00000006Tz5-2UEN
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 13:49:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436249df846so6124175e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Feb 2025 05:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738849754; x=1739454554; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+yUQpAX+o3b8spnwV7aqw1/aYSKStgrXep4Af2rWXQ=;
        b=2C/8zrlLxivhfOlsP9pd+XFrPWGt2qIgjFok3e/2We7n5mKwvVLiv4bvqVu8JR+sVO
         WAuJQ/mWr5ySaQb7cOZ+k5+KTLVxoLufnS/AxH+3gCZ50YG1M5+YmCcVbb0SxzV/xb9+
         gFhgxXhuavk1vic1lr0IvEvXEZ06UePIivhmMZvjS5xNY+fNkXxSi5reaR2TGtQx5r6N
         jIXKpYxoRfnZprrkRdhWISKJAkvbf7xlj1t8zggffqSIGx02YRiCREbWLpPLoAnnfwSU
         tYmVl8PLr3dgcy5f6oRlGW4PHEj28YI0mW4AUXFdG7wgmsd7JyiXnhuKIBKMK2SsHu5f
         y6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738849754; x=1739454554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3+yUQpAX+o3b8spnwV7aqw1/aYSKStgrXep4Af2rWXQ=;
        b=oVuwQJUMFzNa1s3kFv7onTtzLvhADc3xQaD6z6f6QSoXR+BTpY16QzlFx5xjJwiO0L
         VufEaTuJuAo/EUfX0ULNsOLBiu5HMk/xczkDIo/blmAaiCOXtPsx4C1Q79PWFRj5eJ9y
         6EPdfFkYeL3G6UQpWlJZK65Fn4X/l7JSMwyIuhlDNpbPyseAthH/ZEZ3DJa/T+AHrP6N
         AUwAighS/BHZgA60NtQFw5jE/fnt3dEuzb4YgI+ny5+ffHsNUnEkMObFqXY3CzHAVFRU
         d/iSDYux9YiHDyIv2S2zLj98BXyovFlDtPpUOgb0YthbVGMB5RaBL0eFh4VYXUQd8g0W
         QhUA==
X-Forwarded-Encrypted: i=1; AJvYcCVziStNbTMXkeK3528scKmsebeaOlN1ScGWxnuehgOc+2/hBYwgE8jSEh46MZEdfS1SOKXL9ybjX4UTHA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/CMCAkLpZvHgJ5Mw5zv6uk2KRVFb3gGXtUd6knOtC7f0ZqtJT
	IR/5gKwGD5Iv+g0FrEdfPXCF32rf4Zvk4WShEGsscDWQekYYUIzaSWiKVXmZSE0=
X-Gm-Gg: ASbGncuU5byF2L8lJdBFmWg5P77K28YZ+x1kJzExIppMHSvQFZJuPGNrNkyZVPe9WWg
	ibrOW0UJHWi63XDP+gVgxnAqVDjsWe8+TcL3rlPp3png+NJv7X396/ZXlL172VtzeQxvZNl+dI+
	9kzMhsyi11Ij2BkecX5ORUKlbKmtlYlg21Ib8HaMW7mW3zgBzEVEJL+OKtTLGjG18UmfRs9k0Um
	iu/Qo315mlbnfUmvZyvQCDzBaK/jsGCzOaqteFyqkB6v5ynrs19nsSthtTiktCeST6xe82OmA3l
	5hIP1YkTc40CJEjhbBYSHdamLaKP7iSIfyVRJrfakPNq34XMMAhg8wO3f4v5
X-Google-Smtp-Source: AGHT+IGg4Oxn/it/Gfzbb+ERjhH8cdtxBySZuTwU5SUr81Aju5a+rmMa6q+7lfy94Mm7DhC9V1Q64g==
X-Received: by 2002:a05:600c:4452:b0:434:f82b:c5e6 with SMTP id 5b1f17b1804b1-4390d42cd07mr47760125e9.1.1738849753707;
        Thu, 06 Feb 2025 05:49:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd368bdsm1831411f8f.33.2025.02.06.05.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 05:49:13 -0800 (PST)
Message-ID: <fec3b7be-4259-4eef-87f9-b2cee5718cae@rivosinc.com>
Date: Thu, 6 Feb 2025 14:49:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 14/26] riscv/traps: Introduce software check exception
To: Deepak Gupta <debug@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Christian Brauner <brauner@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com,
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
 atishp@rivosinc.com, evan@rivosinc.com, alexghiti@rivosinc.com,
 samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
 <20250204-v5_user_cfi_series-v9-14-b37a49c5205c@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-14-b37a49c5205c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_054915_631748_C5054C33 
X-CRM114-Status: GOOD (  26.66  )
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

CgpPbiAwNS8wMi8yMDI1IDAyOjIyLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4gemljZmlzcyAvIHpp
Y2ZpbHAgaW50cm9kdWNlcyBhIG5ldyBleGNlcHRpb24gdG8gcHJpdiBpc2EgYHNvZnR3YXJlIGNo
ZWNrCj4gZXhjZXB0aW9uYCB3aXRoIGNhdXNlIGNvZGUgPSAxOC4gVGhpcyBwYXRjaCBpbXBsZW1l
bnRzIHNvZnR3YXJlIGNoZWNrCj4gZXhjZXB0aW9uLgoKSGV5IERlZXBhaywKCldoaWxlIG5vdCBk
aXJlY3RseSByZWxhdGVkIHRvIHRoaXMgcGF0Y2gsIGlzIHRoZSBleGNlcHRpb24gMTggZGVsZWdh
dGlvbgpkb2N1bWVudGVkIGluIHRoZSBTQkkgZG9jID8gSSBtZWFuLCBzaG91bGQgd2Ugc3BlY2lm
eSB0aGF0IGl0IGlzIGFsd2F5cwpkZWxlZ2F0ZWQgd2hlbiBpbXBsZW1lbnRpbmcgRldGVCBMQU5E
SU5HX1BBRC9TSEFET1dfU1RBQ0sgPwoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4gQWRkaXRpb25h
bGx5IGl0IGltcGxlbWVudHMgYSBjZmkgdmlvbGF0aW9uIGhhbmRsZXIgd2hpY2ggY2hlY2tzIGZv
ciBjb2RlCj4gaW4geHR2YWwuIElmIHh0dmFsPTIsIGl0IG1lYW5zIHRoYXQgc3cgY2hlY2sgZXhj
ZXB0aW9uIGhhcHBlbmVkIGJlY2F1c2Ugb2YKPiBhbiBpbmRpcmVjdCBicmFuY2ggbm90IGxhbmRp
bmcgb24gNCBieXRlIGFsaWduZWQgUEMgb3Igbm90IGxhbmRpbmcgb24KPiBgbHBhZGAgaW5zdHJ1
Y3Rpb24gb3IgbGFiZWwgdmFsdWUgZW1iZWRkZWQgaW4gYGxwYWRgIG5vdCBtYXRjaGluZyBsYWJl
bAo+IHZhbHVlIHNldHVwIGluIGB4N2AuIElmIHh0dmFsPTMsIGl0IG1lYW5zIHRoYXQgc3cgY2hl
Y2sgZXhjZXB0aW9uIGhhcHBlbmVkCj4gYmVjYXVzZSBvZiBtaXNtYXRjaCBiZXR3ZWVuIGxpbmsg
cmVnaXN0ZXIgKHgxIG9yIHg1KSBhbmQgdG9wIG9mIHNoYWRvdwo+IHN0YWNrIChvbiBleGVjdXRp
b24gb2YgYHNzcG9wY2hrYCkuCj4gCj4gSW4gY2FzZSBvZiBjZmkgdmlvbGF0aW9uLCBTSUdTRUdW
IGlzIHJhaXNlZCB3aXRoIGNvZGU9U0VHVl9DUEVSUi4KPiBTRUdWX0NQRVJSIHdhcyBpbnRyb2R1
Y2VkIGJ5IHg4NiBzaGFkb3cgc3RhY2sgcGF0Y2hlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEZWVw
YWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9hc20tcHJvdG90eXBlcy5oIHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Vu
dHJ5LWNvbW1vbi5oICAgfCAgMiArKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TICAgICAg
ICAgICAgICAgfCAgMyArKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyAgICAgICAgICAg
ICAgIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hh
bmdlZCwgNDkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90
b3R5cGVzLmgKPiBpbmRleCBjZDYyN2VjMjg5ZjEuLjVhMjdjZWZkNzgwNSAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmgKPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2FzbS1wcm90b3R5cGVzLmgKPiBAQCAtNTEsNiArNTEsNyBAQCBERUNM
QVJFX0RPX0VSUk9SX0lORk8oZG9fdHJhcF9lY2FsbF91KTsKPiAgREVDTEFSRV9ET19FUlJPUl9J
TkZPKGRvX3RyYXBfZWNhbGxfcyk7Cj4gIERFQ0xBUkVfRE9fRVJST1JfSU5GTyhkb190cmFwX2Vj
YWxsX20pOwo+ICBERUNMQVJFX0RPX0VSUk9SX0lORk8oZG9fdHJhcF9icmVhayk7Cj4gK0RFQ0xB
UkVfRE9fRVJST1JfSU5GTyhkb190cmFwX3NvZnR3YXJlX2NoZWNrKTsKPiAgCj4gIGFzbWxpbmth
Z2Ugdm9pZCBoYW5kbGVfYmFkX3N0YWNrKHN0cnVjdCBwdF9yZWdzICpyZWdzKTsKPiAgYXNtbGlu
a2FnZSB2b2lkIGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOwo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9lbnRyeS1jb21tb24uaAo+IGluZGV4IGIyOGNjYzZjZGVlYS4uMzRlZDE0OWFm
NWQxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZW50cnktY29tbW9uLmgK
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5oCj4gQEAgLTQwLDQg
KzQwLDYgQEAgc3RhdGljIGlubGluZSBpbnQgaGFuZGxlX21pc2FsaWduZWRfc3RvcmUoc3RydWN0
IHB0X3JlZ3MgKnJlZ3MpCj4gIH0KPiAgI2VuZGlmCj4gIAo+ICtib29sIGhhbmRsZV91c2VyX2Nm
aV92aW9sYXRpb24oc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOwo+ICsKPiAgI2VuZGlmIC8qIF9BU01f
UklTQ1ZfRU5UUllfQ09NTU9OX0ggKi8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
ZW50cnkuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiBpbmRleCAwMDQ5NGI1NGZmNGEu
LjljMDBjYWMzZjZmMiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+IEBAIC00NzIsNiArNDcyLDkgQEAgU1lN
X0RBVEFfU1RBUlRfTE9DQUwoZXhjcF92ZWN0X3RhYmxlKQo+ICAJUklTQ1ZfUFRSIGRvX3BhZ2Vf
ZmF1bHQgICAvKiBsb2FkIHBhZ2UgZmF1bHQgKi8KPiAgCVJJU0NWX1BUUiBkb190cmFwX3Vua25v
d24KPiAgCVJJU0NWX1BUUiBkb19wYWdlX2ZhdWx0ICAgLyogc3RvcmUgcGFnZSBmYXVsdCAqLwo+
ICsJUklTQ1ZfUFRSIGRvX3RyYXBfdW5rbm93biAvKiBjYXVzZT0xNiAqLwo+ICsJUklTQ1ZfUFRS
IGRvX3RyYXBfdW5rbm93biAvKiBjYXVzZT0xNyAqLwo+ICsJUklTQ1ZfUFRSIGRvX3RyYXBfc29m
dHdhcmVfY2hlY2sgLyogY2F1c2U9MTggaXMgc3cgY2hlY2sgZXhjZXB0aW9uICovCj4gIFNZTV9E
QVRBX0VORF9MQUJFTChleGNwX3ZlY3RfdGFibGUsIFNZTV9MX0xPQ0FMLCBleGNwX3ZlY3RfdGFi
bGVfZW5kKQo+ICAKPiAgI2lmbmRlZiBDT05GSUdfTU1VCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gaW5kZXggOGZm
OGU4YjM2NTI0Li4zZjc3MDlmNDU5NWEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBAQCAtMzU0LDYgKzM1
NCw0OSBAQCB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgCj4g
IH0KPiAgCj4gKyNkZWZpbmUgQ0ZJX1RWQUxfRkNGSV9DT0RFCTIKPiArI2RlZmluZSBDRklfVFZB
TF9CQ0ZJX0NPREUJMwo+ICsvKiBoYW5kbGUgY2ZpIHZpb2xhdGlvbnMgKi8KPiArYm9vbCBoYW5k
bGVfdXNlcl9jZmlfdmlvbGF0aW9uKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICt7Cj4gKwlib29s
IHJldCA9IGZhbHNlOwo+ICsJdW5zaWduZWQgbG9uZyB0dmFsID0gY3NyX3JlYWQoQ1NSX1RWQUwp
Owo+ICsKPiArCWlmICgodHZhbCA9PSBDRklfVFZBTF9GQ0ZJX0NPREUgJiYgY3B1X3N1cHBvcnRz
X2luZGlyZWN0X2JyX2xwX2luc3RyKCkpIHx8Cj4gKwkgICAgKHR2YWwgPT0gQ0ZJX1RWQUxfQkNG
SV9DT0RFICYmIGNwdV9zdXBwb3J0c19zaGFkb3dfc3RhY2soKSkpIHsKPiArCQlkb190cmFwX2Vy
cm9yKHJlZ3MsIFNJR1NFR1YsIFNFR1ZfQ1BFUlIsIHJlZ3MtPmVwYywKPiArCQkJICAgICAgIk9v
cHMgLSBjb250cm9sIGZsb3cgdmlvbGF0aW9uIik7Cj4gKwkJcmV0ID0gdHJ1ZTsKPiArCX0KPiAr
Cj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICsvKgo+ICsgKiBzb2Z0d2FyZSBjaGVjayBleGNl
cHRpb24gaXMgZGVmaW5lZCB3aXRoIHJpc2MtdiBjZmkgc3BlYy4gU29mdHdhcmUgY2hlY2sKPiAr
ICogZXhjZXB0aW9uIGlzIHJhaXNlZCB3aGVuOi0KPiArICogYSkgQW4gaW5kaXJlY3QgYnJhbmNo
IGRvZXNuJ3QgbGFuZCBvbiA0IGJ5dGUgYWxpZ25lZCBQQyBvciBgbHBhZGAKPiArICogICAgaW5z
dHJ1Y3Rpb24gb3IgYGxhYmVsYCB2YWx1ZSBwcm9ncmFtbWVkIGluIGBscGFkYCBpbnN0ciBkb2Vz
bid0Cj4gKyAqICAgIG1hdGNoIHdpdGggdmFsdWUgc2V0dXAgaW4gYHg3YC4gcmVwb3J0ZWQgY29k
ZSBpbiBgeHR2YWxgIGlzIDIuCj4gKyAqIGIpIGBzc3BvcGNoa2AgaW5zdHJ1Y3Rpb24gZmluZHMg
YSBtaXNtYXRjaCBiZXR3ZWVuIHRvcCBvZiBzaGFkb3cgc3RhY2sgKHNzcCkKPiArICogICAgYW5k
IHgxL3g1LiByZXBvcnRlZCBjb2RlIGluIGB4dHZhbGAgaXMgMy4KPiArICovCj4gK2FzbWxpbmth
Z2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9zb2Z0d2FyZV9jaGVjayhz
dHJ1Y3QgcHRfcmVncyAqcmVncykKPiArewo+ICsJaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+ICsJ
CWlycWVudHJ5X2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MpOwo+ICsKPiArCQkvKiBub3QgYSBj
ZmkgdmlvbGF0aW9uLCB0aGVuIG1lcmdlIGludG8gZmxvdyBvZiB1bmtub3duIHRyYXAgaGFuZGxl
ciAqLwo+ICsJCWlmICghaGFuZGxlX3VzZXJfY2ZpX3Zpb2xhdGlvbihyZWdzKSkKPiArCQkJZG9f
dHJhcF91bmtub3duKHJlZ3MpOwo+ICsKPiArCQlpcnFlbnRyeV9leGl0X3RvX3VzZXJfbW9kZShy
ZWdzKTsKPiArCX0gZWxzZSB7Cj4gKwkJLyogc3cgY2hlY2sgZXhjZXB0aW9uIGNvbWluZyBmcm9t
IGtlcm5lbCBpcyBhIGJ1ZyBpbiBrZXJuZWwgKi8KPiArCQlkaWUocmVncywgIktlcm5lbCBCVUci
KTsKPiArCX0KPiArfQo+ICsKPiAgI2lmZGVmIENPTkZJR19NTVUKPiAgYXNtbGlua2FnZSBfX3Zp
c2libGUgbm9pbnN0ciB2b2lkIGRvX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4g
IHsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
