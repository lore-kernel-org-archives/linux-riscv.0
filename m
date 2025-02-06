Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB502C02199
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 13:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaN55FyJ9s6umHwlaJ5RgW2rYkicRIy2wpv6hk3xrB4=; b=Xx7LpM+a9veHlX
	np26QUF+bLZp7JGckZs5hW4qKRlVQcLgzsNQdGvOS3TLbptLF5Qwo2L4j2AXBgv7HfGjQOdOLxor8
	mJ/QhQHqWqY9fDkLTZS9cUAlgV/V6ledmBb5xYay9uo8y9LqqCgT4X+mtA3cuscsRvDtwmiZL1fWE
	FDdvP+nYHpQ00TFMzgzvdD3Q1Mo8Fs0B1n7piV1qT78tlOSut5AjLxQd5WpUM26Zp0U4zENUqnkTz
	Yhtd5AuJ1A2wEaYLjOoi7SBbGm7yUbrKpVYmGVjCtIy6jBRkSsFdj5Y3uKk2D/j8o06MgKIKD4iPt
	JwoY35uayQ0HLv2zecWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2PC-00000006VJe-1dBK;
	Thu, 06 Feb 2025 13:58:58 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2H3-00000006UA5-1H2q
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 13:50:34 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so418072f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 06 Feb 2025 05:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738849832; x=1739454632; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZqG9Iy11y+7j3Q1qmHPl/yKVh88xdsRebgLzRhIb/28=;
        b=w57C/XeUa6CwQYuciwns3AsZi8+Ew/4HsZXM1h7aOWwItJLslLN7uMDuqltmrvJv4n
         5dIxTxCc/tCIxTWtacn40fjZnhx01jsjFJU6DFXw92yc3aLu40zR67xLC+4rBcl55Rpc
         bS6FotKZi0K0GkrblSvUSxvyk8HvMJsfko6oh4LhN2FYJbt8VmK/S4Tw28yu2AIRgvb5
         yAf2Q+YkneGosI9AB/YJLcu9I0Tld2vONsbdMocQuSvMUQP9pELuxsqMfjGQJtdxhfBZ
         DnKIP5nHaHU3Hkl330dOSRPkJBnlGydQ8pQ8y2eKbucZ8t/Kb8EnZHSYQDhG3DcKKnbR
         64PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738849832; x=1739454632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqG9Iy11y+7j3Q1qmHPl/yKVh88xdsRebgLzRhIb/28=;
        b=HNtl+nRuMM4+kR3nYJBM3jTTQvluhhvyYgxlB6k3eYlb4tX7xYYcDwvCd7+LOEC1uh
         OpWSJWee1T5ymrmubqQ8un6S8fPFClMBIA0xXCVlZ7GmkEKEmhKOm86HuRHgTadK0VJI
         FC0trkzL7Rbhzv8ZnWG1+C9+jeSaSMhWvjuMT73FWDa6YURWRSyn3JxQYYVjRY9Pq7bM
         aL1y5NEo4AiAX2ejDNradnS9qoezpG20VWsLLYvMpdpZOeus1GVjznH7puPtglzMypo4
         B7Op3ICwhxH2SMp1K/P0/CoiXPoKfFREWxJ3ljJFrI1Ia7MDLR2RyU66GdgAyKUAgu5M
         5Yrg==
X-Forwarded-Encrypted: i=1; AJvYcCUoxC51o420H4xMT/b/8Cvt2Y5S8LJDViXl4YbCKjHo3mawJEMMxOg65/PO9OCXZKjfOCsMIYc+s+pZgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFPg1YSTyqSl7LcmflMdW1HcYGHRGXJnf1/WH+iwdNEZr/G7Yw
	Gv8Ntt7v34LmAi6xGjIYgTea1xRgpEwGlUIZ0DD7UH0yf+f2Q2Agb0BITEed0IQ=
X-Gm-Gg: ASbGnctqmrfFwkSxoQlA7s8I7AveAS1HIicT7/rmfXEUFQ/n9OxeTtJZ/vBtwSG9idk
	VY6HUJmf5XLwnTGjsRRWFjXfif44l5Jc/PAVCvv/TZmpglDMGcm8/TqqtCkrmxTt1WH1MNz2bVj
	pxli9xGf5sYmLmmttB1hUYauMkk7KOVB2F++OA5nizUAHn4sj31Rattw84dS7tov9wVkYtnIZr7
	VgY3TArNZHgTo5RQRcywvDzNquzKMvpaCjCeYx6Yu4Zkm9J8QzjYGeRPWHzMnRq5Wci+vwfQ/su
	9uFZTBts9xPjyX5bpu/4te+23+tUpfaSmrR2pcEYPEuzAo8vjm8Sp8YViJtV
X-Google-Smtp-Source: AGHT+IEYIYIWW6J/hIRqm2Y0oUfYR4o1i/HreKUFQmuOWd+xJTMh9Ma+9XSSasA3LYOW3FeM7FN37Q==
X-Received: by 2002:adf:e5cb:0:b0:385:faec:d94d with SMTP id ffacd0b85a97d-38db4910812mr5188370f8f.51.1738849831734;
        Thu, 06 Feb 2025 05:50:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc17e278bsm1117573f8f.48.2025.02.06.05.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 05:50:31 -0800 (PST)
Message-ID: <782ef14c-e7c4-435e-adc6-9559ce3cc06d@rivosinc.com>
Date: Thu, 6 Feb 2025 14:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/26] riscv: zicfiss / zicfilp enumeration
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
 <20250204-v5_user_cfi_series-v9-3-b37a49c5205c@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-3-b37a49c5205c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_055033_343985_B611F99A 
X-CRM114-Status: GOOD (  22.23  )
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

CgpPbiAwNS8wMi8yMDI1IDAyOjIxLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4gVGhpcyBwYXRjaCBh
ZGRzIHN1cHBvcnQgZm9yIGRldGVjdGluZyB6aWNmaXNzIGFuZCB6aWNmaWxwLiB6aWNmaXNzIGFu
ZAo+IHppY2ZpbHAgc3RhbmRzIGZvciB1bnByaXZsZWdlZCBpbnRlZ2VyIHNwZWMgZXh0ZW5zaW9u
IGZvciBzaGFkb3cgc3RhY2sKPiBhbmQgYnJhbmNoIHRyYWNraW5nIG9uIGluZGlyZWN0IGJyYW5j
aGVzLCByZXNwZWN0aXZlbHkuCj4gCj4gVGhpcyBwYXRjaCBsb29rcyBmb3IgemljZmlzcyBhbmQg
emljZmlscCBpbiBkZXZpY2UgdHJlZSBhbmQgYWNjb3JkaW5sZ3kKPiBsaWdodHMgdXAgYml0IGlu
IGNwdSBmZWF0dXJlIGJpdG1hcC4gRnVydGhlcm1vcmUgdGhpcyBwYXRjaCBhZGRzIGRldGVjdGlv
bgo+IHV0aWxpdHkgZnVuY3Rpb25zIHRvIHJldHVybiB3aGV0aGVyIHNoYWRvdyBzdGFjayBvciBs
YW5kaW5nIHBhZHMgYXJlCj4gc3VwcG9ydGVkIGJ5IGNwdS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBE
ZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9jcHVmZWF0dXJlLmggfCAxMyArKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaCAgICAgIHwgIDIgKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
cm9jZXNzb3IuaCAgfCAgMSArCj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAg
IHwgIDIgKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPiBpbmRleCA1NjkxNDBkNmU2MzkuLjY5MDA3YjgxMDBj
YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCj4gQEAgLTEyLDYgKzEyLDcg
QEAKPiAgI2luY2x1ZGUgPGxpbnV4L2tjb25maWcuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BlcmNw
dS1kZWZzLmg+Cj4gICNpbmNsdWRlIDxsaW51eC90aHJlYWRzLmg+Cj4gKyNpbmNsdWRlIDxsaW51
eC9zbXAuaD4KPiAgI2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+ICAjaW5jbHVkZSA8YXNtL2NwdWZl
YXR1cmUtbWFjcm9zLmg+Cj4gIAo+IEBAIC0xMzcsNCArMTM4LDE2IEBAIHN0YXRpYyBfX2Fsd2F5
c19pbmxpbmUgYm9vbCByaXNjdl9jcHVfaGFzX2V4dGVuc2lvbl91bmxpa2VseShpbnQgY3B1LCBj
b25zdCB1bnNpCj4gIAlyZXR1cm4gX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShoYXJ0
X2lzYVtjcHVdLmlzYSwgZXh0KTsKPiAgfQo+ICAKPiArc3RhdGljIGlubGluZSBib29sIGNwdV9z
dXBwb3J0c19zaGFkb3dfc3RhY2sodm9pZCkKPiArewo+ICsJcmV0dXJuIChJU19FTkFCTEVEKENP
TkZJR19SSVNDVl9VU0VSX0NGSSkgJiYKPiArCQlyaXNjdl9jcHVfaGFzX2V4dGVuc2lvbl91bmxp
a2VseShzbXBfcHJvY2Vzc29yX2lkKCksIFJJU0NWX0lTQV9FWFRfWklDRklTUykpOwo+ICt9Cj4g
Kwo+ICtzdGF0aWMgaW5saW5lIGJvb2wgY3B1X3N1cHBvcnRzX2luZGlyZWN0X2JyX2xwX2luc3Ry
KHZvaWQpCj4gK3sKPiArCXJldHVybiAoSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfVVNFUl9DRkkp
ICYmCj4gKwkJcmlzY3ZfY3B1X2hhc19leHRlbnNpb25fdW5saWtlbHkoc21wX3Byb2Nlc3Nvcl9p
ZCgpLCBSSVNDVl9JU0FfRVhUX1pJQ0ZJTFApKTsKPiArfQo+ICsKPiAgI2VuZGlmCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vaHdjYXAuaAo+IGluZGV4IDg2OWRhMDgyMjUyYS4uMmRjNDIzMmJkYjNlIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdjYXAuaAo+IEBAIC0xMDAsNiArMTAwLDggQEAKPiAgI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1pJQ0NSU0UJCTkxCj4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9TVkFERQkJOTIK
PiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NWQURVCQk5Mwo+ICsjZGVmaW5lIFJJU0NWX0lTQV9F
WFRfWklDRklMUAkJOTQKPiArI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJQ0ZJU1MJCTk1Cj4gIAo+
ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHCTEyNwo+ICAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcHJvY2Vzc29yLmgKPiBpbmRleCA1ZjU2ZWI5ZDExNGEuLmUzYWJhMzMzNmU2MyAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+IEBAIC0xMyw2ICsxMyw3IEBACj4gICNp
bmNsdWRlIDx2ZHNvL3Byb2Nlc3Nvci5oPgo+ICAKPiAgI2luY2x1ZGUgPGFzbS9wdHJhY2UuaD4K
PiArI2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+ICAKPiAgI2RlZmluZSBhcmNoX2dldF9tbWFwX2Vu
ZChhZGRyLCBsZW4sIGZsYWdzKQkJCVwKPiAgKHsJCQkJCQkJCVwKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVy
ZS5jCj4gaW5kZXggYzZiYTc1MDUzNmMzLi5lNzJkZTEyZTViOTkgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1
ZmVhdHVyZS5jCj4gQEAgLTMzMyw2ICszMzMsOCBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4
dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKPiAgCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVF9W
QUxJREFURSh6aWNib3osIFJJU0NWX0lTQV9FWFRfWklDQk9aLCByaXNjdl94bGludXhlbnZjZmdf
ZXh0cywKPiAgCQkJCQkgIHJpc2N2X2V4dF96aWNib3pfdmFsaWRhdGUpLAo+ICAJX19SSVNDVl9J
U0FfRVhUX0RBVEEoemljY3JzZSwgUklTQ1ZfSVNBX0VYVF9aSUNDUlNFKSwKPiArCV9fUklTQ1Zf
SVNBX0VYVF9TVVBFUlNFVCh6aWNmaWxwLCBSSVNDVl9JU0FfRVhUX1pJQ0ZJTFAsIHJpc2N2X3hs
aW51eGVudmNmZ19leHRzKSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVCh6aWNmaXNzLCBS
SVNDVl9JU0FfRVhUX1pJQ0ZJU1MsIHJpc2N2X3hsaW51eGVudmNmZ19leHRzKSwKCkhleSBEZWVw
YWssCgpJIHRoaW5rIHRoZXNlIGRlZmluaXRpb25zIGNhbiBiZW5lZml0IGZyb20gdXNpbmcgYSB2
YWxpZGF0aW9uIGNhbGxiYWNrOgoKc3RhdGljIGludCByaXNjdl9jZmlfdmFsaWRhdGUoY29uc3Qg
c3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSAqZGF0YSwKCQkJCSAgY29uc3QgdW5zaWduZWQgbG9u
ZyAqaXNhX2JpdG1hcCkKewoJaWYgKCFJU19FTkFCTEVEKENPTkZJR19SSVNDVl9VU0VSX0NGSSkK
CQlyZXR1cm4gLUVJTlZBTDsKCQkKCXJldHVybiAwOwp9CgpfX1JJU0NWX0lTQV9FWFRfU1VQRVJT
RVRfVkFMSURBVEUoemljZmlscCwgUklTQ1ZfSVNBX0VYVF9aSUNGSUxQLApyaXNjdl94bGludXhl
bnZjZmdfZXh0cywgcmlzY3ZfY2ZpX3ZhbGlkYXRlKSwKX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VU
X1ZBTElEQVRFKHppY2Zpc3MsIFJJU0NWX0lTQV9FWFRfWklDRklTUywKcmlzY3ZfeGxpbnV4ZW52
Y2ZnX2V4dHMsIHJpc2N2X2NmaV92YWxpZGF0ZSksCgpUaGF0IHdheSwgWklDRklTUy9aSUNGSUxQ
IHdvbnQgYmUgZW5hYmxlIGlmIHRoZSBrZXJuZWwgZG9lcyBub3QgaGF2ZQpidWlsdGluIHN1cHBv
cnQgZm9yIHRoZW0uIEFkZGl0aW9uYWxseSwgdGhpcyBzb2x2ZSBhIGJ1ZyB5b3UgaGF2ZSB3aXRo
CnlvdXIgaHdwcm9iZSBwYXRjaCAoMTkvMjYpIHRoYXQgZXhwb3NlcyBaSUNGSUxQL1pJQ0ZJU1Mg
dW5jb25kaXRpb25hbGx5CihpZSwgZXZlbiBpZiB0aGUga2VybmVsIGRvZXMgbm90IGhhdmUgQ09O
RklHX1JJU0NWX1VTRVJfQ0ZJKS4KCkJUVywgcGF0Y2ggMjMvMjYgaW50cm9kdWNlIENPTkZJR19S
SVNDVl9VU0VSX0NGSSBidXQgaXQgaXMgdXNlZCBpbiB0aGF0CnBhdGNoLgoKVGhhbmtzLAoKQ2zD
qW1lbnQKCj4gIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWNudHIsIFJJU0NWX0lTQV9FWFRfWklD
TlRSKSwKPiAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHppY29uZCwgUklTQ1ZfSVNBX0VYVF9aSUNP
TkQpLAo+ICAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemljc3IsIFJJU0NWX0lTQV9FWFRfWklDU1Ip
LAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
