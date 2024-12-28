Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D5FE7718F
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Dec 2024 06:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+gjq1BFnidPmR3drHcN4KGo3M/4bCfnhlfkmzs3HtU=; b=1cEHDUW/3p6dVl
	IlDVIPAgD1Li5dLcK9OkVLDfpQkFjJJewMiMzKMna4Ys2IVIgaUCOSJocDMNu4tc6s+2GanpkZ3nx
	KkCe/0S1Yu/Aud4+1RWCwSz+yI7RPHmnomppC+am+7ZO4D063Tt99pcBdIDzaheGaeFTj/B4HGhIV
	lKTg4gIalt9DrrWumwCQ61KjfEmEdLGpXGVrHq6o4fCZnk2qSK6VpuuTdrj7BwhUyRI+Pcxld3vQE
	UOiglWujtsQJsr4EVVbum25cTVWRgmtW66HxovkQSiGlE2PrRlqr2li0ku7VkDAejCJmg7uDblGAi
	d1ACsu8X4TNHN2iT3WyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRQSO-00000001Ufs-0PKZ;
	Sat, 28 Dec 2024 06:37:52 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRQRA-00000001UVG-0cRO
	for linux-riscv@lists.infradead.org;
	Sat, 28 Dec 2024 06:36:38 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2166651f752so109569945ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Dec 2024 22:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735367791; x=1735972591; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xz9+aZKFL34BZ+QKJapn5mhTQ8zZC8UnFG8XP+zHLMo=;
        b=hkwicBqicDZLILKL8fAFrt0HtnX7eDgJe/87hs4QaBfvjX88BuYu8cNfYb8egmFVJy
         JDxjpqMbz+adCItTBQ2eUUp5vxliJHsUnD4+2690clzyKUUHpyKVKFxkl9HkJ46/s7XH
         AUotsDf08kIu9EgE1mpM+UqAv13iVuB+pY0BxylHh7u5utCCk29kEPartkXgMyQDe1Bu
         ORduJ4bqLDMtjR8bnxjUOYzIN7MwcgnjygrCcvJ31xLX+w6+sv+GtRis0hyMSmdyfQ4e
         80weXbavWhf9q8RQZz4uZMOc4D5iRUQe/QO/kVTS+wnz3714KopjhFBXxwxNTFr6orql
         NNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367791; x=1735972591;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xz9+aZKFL34BZ+QKJapn5mhTQ8zZC8UnFG8XP+zHLMo=;
        b=udNzDQxGEsYhN9mjPHN7B2toSVUGeRwTWfMQWcWg118NeXUqT5lx/po1hyC8yRghcp
         zYSlJ6QV9CwWuQSWnoFSoEiIkf/egr9FvoBycQPG8dR1wkCSH7zbXfG7zCPX5TtXHuKm
         1k0PgTKZi51yP5h+uCgMS2YHjGp3bUxzUZc6F304lu1OT9Jh0ceBiRe6ibDx57HEsFbY
         7KAdtGDHBt+ntrqBQLlmONGRZxEV8EMpseHWnJplJ3wXBD9Gm4CSDYZwebwHTXRZ/c+D
         jhtb+zN7JrzhM3tSxP8i10lTLzgkaPjMVo2hyAyFOkcg1o9f5/2IuvvD0EvaTcHdbw1y
         oy8g==
X-Forwarded-Encrypted: i=1; AJvYcCWeptrwmIZP0NpGiTBckYnyTzJWCYvOxMdQ5E2IPSEBlf/CrVOaY6BKSvikr3kONumhxHFiMLdrkfzRng==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjzTrSFAwNC//e+YEZ0nsTkHGJFY4h1qLHPSFGBDhN25goGI4u
	IjOdDAz72lSfvtoIU8M9TU/sbaSRPm+a4MmWzsHixuOQZkbBM5jhxSxAlULBZjY=
X-Gm-Gg: ASbGncvgb1LpEWeLbBuwh01Wc5O+fo4b5S2zf7t5VeaFkg5MJeJnSl/+Yb9FnYnjogh
	mp64iXYBm5QxUl0cAoYw7cNuhVYoKtPUFUINnOYI1BQ/WUyOHmGqFTJ7nIpTp+xhgPlV+OB+cBn
	WDQOIiGIo4H7/lVCS+tpOf2qlp6t8aA2c3Xx7PV6K7qkpROwqE77dEZ55yPi48m6CIBu4YW+P9M
	tqeDOlHkx2GbWMLUwIgY1qhI18srcYHxRjNtV3ty+NaB8DJ6tyuDitl2cPs62OTa+aW6huCL1PH
	LWsoK3PfLVxDSI1UXxjr92I/KUI3eLekEC64OenGZS2brHLVW3P8eVE=
X-Google-Smtp-Source: AGHT+IHJr5/cBm7VE4sKmfeyqyU+nR3KXMBrwpgTBQUiz/94ds3IGaVh/bhouU9p0WQ7mj1Jxu9Qtg==
X-Received: by 2002:a17:902:f682:b0:215:f1c2:fcc4 with SMTP id d9443c01a7336-219e6f1480cmr399252455ad.41.1735367791634;
        Fri, 27 Dec 2024 22:36:31 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d7c4:e49d:ee0a:5f86:d7bd? ([2409:8a28:f44:d7c4:e49d:ee0a:5f86:d7bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97182dsm144536075ad.82.2024.12.27.22.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 22:36:31 -0800 (PST)
Message-ID: <2434dfdf-d4a0-4f81-9b65-51be86487fd2@bytedance.com>
Date: Sat, 28 Dec 2024 14:36:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/17] riscv: mm: Skip pgtable level check in
 {pud,p4d}_alloc_one
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, Arnd Bergmann <arnd@arndb.de>,
 Will Deacon <will@kernel.org>, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
References: <mhng-3d6d3e65-b264-4033-b985-fa7763cacf9e@palmer-ri-x1c9a>
From: Qi Zheng <zhengqi.arch@bytedance.com>
Content-Language: en-US
In-Reply-To: <mhng-3d6d3e65-b264-4033-b985-fa7763cacf9e@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_223636_484799_1BA8A150 
X-CRM114-Status: GOOD (  14.44  )
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

SGkgUGFsbWVyLAoKT24gMjAyNC8xMi8yOCAwMDo0MCwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4g
T24gTW9uLCAyMyBEZWMgMjAyNCAwMTo0MDo0OCBQU1QgKC0wODAwKSwgemhlbmdxaS5hcmNoQGJ5
dGVkYW5jZS5jb20gd3JvdGU6Cj4+IEZyb206IEtldmluIEJyb2Rza3kgPGtldmluLmJyb2Rza3lA
YXJtLmNvbT4KPj4KPj4ge3BtZCxwdWQscDRkfV9hbGxvY19vbmUoKSBpcyBuZXZlciBjYWxsZWQg
aWYgdGhlIGNvcnJlc3BvbmRpbmcgcGFnZQo+PiB0YWJsZSBsZXZlbCBpcyBmb2xkZWQsIGFzIHtw
bWQscHVkLHA0ZH1fYWxsb2MoKSBhbHJlYWR5IGRvZXMgdGhlCj4+IHJlcXVpcmVkIGNoZWNrLiBX
ZSBjYW4gdGhlcmVmb3JlIHJlbW92ZSB0aGUgcnVudGltZSBwYWdlIHRhYmxlIGxldmVsCj4+IGNo
ZWNrcyBpbiB7cHVkLHA0ZH1fYWxsb2Nfb25lLiBUaGUgUFVEIGhlbHBlciBiZWNvbWVzIGVxdWl2
YWxlbnQgdG8KPj4gdGhlIGdlbmVyaWMgdmVyc2lvbiwgc28gd2UgcmVtb3ZlIGl0IGFsdG9nZXRo
ZXIuCj4+Cj4+IFRoaXMgaXMgY29uc2lzdGVudCB3aXRoIHRoZSB3YXkgYXJtNjQgYW5kIHg4NiBo
YW5kbGUgdGhpcyBzaXR1YXRpb24KPj4gKHJ1bnRpbWUgY2hlY2sgaW4gcDRkX2ZyZWUoKSBvbmx5
KS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogS2V2aW4gQnJvZHNreSA8a2V2aW4uYnJvZHNreUBhcm0u
Y29tPgo+PiBBY2tlZC1ieTogRGF2ZSBIYW5zZW4gPGRhdmUuaGFuc2VuQGxpbnV4LmludGVsLmNv
bT4KPj4gU2lnbmVkLW9mZi1ieTogUWkgWmhlbmcgPHpoZW5ncWkuYXJjaEBieXRlZGFuY2UuY29t
Pgo+PiAtLS0KPj4gwqBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BnYWxsb2MuaCB8IDIyICsrKyst
LS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAx
OCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGdhbGxvYy5oIAo+PiBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGdhbGxvYy5oCj4+IGluZGV4
IGY1MjI2NDMwNGY3NzIuLjhhZDBiYmU4MzhhMjQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGdhbGxvYy5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGdh
bGxvYy5oCj4+IEBAIC0xMiw3ICsxMiw2IEBACj4+IMKgI2luY2x1ZGUgPGFzbS90bGIuaD4KPj4K
Pj4gwqAjaWZkZWYgQ09ORklHX01NVQo+PiAtI2RlZmluZSBfX0hBVkVfQVJDSF9QVURfQUxMT0Nf
T05FCj4+IMKgI2RlZmluZSBfX0hBVkVfQVJDSF9QVURfRlJFRQo+PiDCoCNpbmNsdWRlIDxhc20t
Z2VuZXJpYy9wZ2FsbG9jLmg+Cj4+Cj4+IEBAIC04OCwxNSArODcsNiBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgcGdkX3BvcHVsYXRlX3NhZmUoc3RydWN0IAo+PiBtbV9zdHJ1Y3QgKm1tLCBwZ2RfdCAq
cGdkLAo+PiDCoMKgwqDCoCB9Cj4+IMKgfQo+Pgo+PiAtI2RlZmluZSBwdWRfYWxsb2Nfb25lIHB1
ZF9hbGxvY19vbmUKPj4gLXN0YXRpYyBpbmxpbmUgcHVkX3QgKnB1ZF9hbGxvY19vbmUoc3RydWN0
IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIAo+PiBsb25nIGFkZHIpCj4+IC17Cj4+IC3CoMKgwqAg
aWYgKHBndGFibGVfbDRfZW5hYmxlZCkKPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiBfX3B1ZF9h
bGxvY19vbmUobW0sIGFkZHIpOwo+PiAtCj4+IC3CoMKgwqAgcmV0dXJuIE5VTEw7Cj4+IC19Cj4+
IC0KPj4gwqAjZGVmaW5lIHB1ZF9mcmVlIHB1ZF9mcmVlCj4+IMKgc3RhdGljIGlubGluZSB2b2lk
IHB1ZF9mcmVlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBwdWRfdCAqcHVkKQo+PiDCoHsKPj4gQEAg
LTExOCwxNSArMTA4LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3B1ZF9mcmVlX3RsYihzdHJ1
Y3QgCj4+IG1tdV9nYXRoZXIgKnRsYiwgcHVkX3QgKnB1ZCwKPj4gwqAjZGVmaW5lIHA0ZF9hbGxv
Y19vbmUgcDRkX2FsbG9jX29uZQo+PiDCoHN0YXRpYyBpbmxpbmUgcDRkX3QgKnA0ZF9hbGxvY19v
bmUoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIAo+PiBsb25nIGFkZHIpCj4+IMKgewo+
PiAtwqDCoMKgIGlmIChwZ3RhYmxlX2w1X2VuYWJsZWQpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIGdm
cF90IGdmcCA9IEdGUF9QR1RBQkxFX1VTRVI7Cj4+IC0KPj4gLcKgwqDCoMKgwqDCoMKgIGlmICht
bSA9PSAmaW5pdF9tbSkKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ2ZwID0gR0ZQX1BHVEFC
TEVfS0VSTkVMOwo+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIChwNGRfdCAqKWdldF96ZXJvZWRf
cGFnZShnZnApOwo+PiAtwqDCoMKgIH0KPj4gK8KgwqDCoCBnZnBfdCBnZnAgPSBHRlBfUEdUQUJM
RV9VU0VSOwo+Pgo+PiAtwqDCoMKgIHJldHVybiBOVUxMOwo+PiArwqDCoMKgIGlmIChtbSA9PSAm
aW5pdF9tbSkKPj4gK8KgwqDCoMKgwqDCoMKgIGdmcCA9IEdGUF9QR1RBQkxFX0tFUk5FTDsKPj4g
K8KgwqDCoCByZXR1cm4gKHA0ZF90ICopZ2V0X3plcm9lZF9wYWdlKGdmcCk7Cj4+IMKgfQo+Pgo+
PiDCoHN0YXRpYyBpbmxpbmUgdm9pZCBfX3A0ZF9mcmVlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBw
NGRfdCAqcDRkKQo+IAo+IEFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5j
LmNvbT4KClRoYW5rIHlvdSBmb3IgcmV2aWV3aW5nIHRoZSBwYXRjaCEKCj4gCj4gQXJlIHlvdSB0
cnlpbmcgdG8ga2VlcCB0aGVzZSB0b2dldGhlciwgb3IgZG8geW91IHdhbnQgbWUgdG8gdHJ5IGFu
ZCBwaWNrIAo+IHVwIHRoZSBSSVNDLVYgYml0cyBvbiB0aGVpciBvd24/CgpJIHByZWZlciB0byBr
ZWVwIHRoZW0gdG9nZXRoZXIgYmVjYXVzZSBsYXRlciBwYXRjaGVzIGRlcGVuZCBvbiB0aGlzIG9u
ZS4KQW5kIHRoaXMgcGF0Y2ggc2VyaWVzIGhhcyBiZWVuIG1lcmdlZCBpbnRvIG1tLXVuc3RhYmxl
IGJyYW5jaC4KClRoYW5rcyEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
