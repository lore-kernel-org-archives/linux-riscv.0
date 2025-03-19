Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB3EC35FFA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 13:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0LTqPKJjWi4j4bz0qU6e0bplynDsVkDQX+BgmTID8tM=; b=R9NQSuqH/ZOw6d
	9w0KYZ9CT8Vz3ptVq4hbOQ4Iannlzmhs6ippxL6J2cLiy2aWK7SPKaNxVc42uAN7yQQHTI4EbDVo0
	2PTL5gKJbJQ0iL+bdXfkUGnnC5VspTv1tzJuqMoZB86EC3xyzDMKnmxd8brSJcjmAtfIXJVgiZt2F
	TTcNvqLRn7WBMJo5nCRSii6hSrutDXBGonvHwfwgN7Lj6Mv5OPr/BvX19Dm/zjCHjdKQcu0/7sDZF
	NKde3s+p/4QHz1GbUGKvr2EeYPVJS4eNl3IGRmCuzPSDHPjK7q4genCE5oqS1/afiGiNFjMvPLey/
	AzoFAnQYY2I7WZJBinfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tutET-000000093SY-2Ung;
	Wed, 19 Mar 2025 13:13:17 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tutCm-000000093F1-09GH;
	Wed, 19 Mar 2025 13:11:33 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-223594b3c6dso146764685ad.2;
        Wed, 19 Mar 2025 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742389891; x=1742994691; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/CKiUxIsp+RiAjt+4CW+mXa9kqAZnMY4uY5XJZebADk=;
        b=bL8AZfjklLVj059Dttc5wuB6ud2vygeTSU4nUGphgE0McSIZY80+FQFnrn2jCSZNTN
         kQphc+ucqwleds1jaZQnEb8I+KrdG/w7z/Iw7QGMnfMJIg3lU6rmc/954zX4pCwSQSXz
         NvNvcEHOygH1nabhvV/CFuglMEnqHmGABk8AqET1yRh9yVkNYueHXFobOuuTCCYJLC2H
         G6gcmu+xsSGTJ/Wnws6zVl2iGNo3pvkLzblApyvPGNfiL/rFkdeQHlFd5uxTv29Mx7vT
         6f4ky93awgIebeePZPR+Rffe5uAXX+g7euCfPZMWsf2MrXBY5zeUnLM33KQ0uyPqpiA1
         tFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742389891; x=1742994691;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CKiUxIsp+RiAjt+4CW+mXa9kqAZnMY4uY5XJZebADk=;
        b=aCN6UauzzvKMBROi2y7v5vKluZHAXXJjffRIQl989OsKFRMaGc0SEWW7zEsD604F95
         ByT4Pg2PbsuRNcTCjYqQrsdNCUOu/BbpToqgEtYf8XXkYhqUUgAZSc7d5ls8hKh06vN4
         7VAsFJgoIGL65UpgiF66ykJGKxRp/1aB5mhpzIxwccjQLIXjod0VA+138du/Cp5MSWXw
         Hk9hzyS4683USJagzLj6HqmbjygORw57fcJ5DNkYDkQvvzK9c0mW3mqbhrfKEZ2/ig/K
         y3MDKCm+IJwQOoHOwqWzHeMj0349MGAYM+Ad0pYJHXcFNTQokwtbmFTQS44A48haFDfZ
         KFlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDDvGkXVAChERLjGMweBsilf3Jps23SvQW1vwini7z7QXFOBxUDd61l+D9y92WGYtgwkCNv6tgMIOYkmc=@lists.infradead.org, AJvYcCVEKhLjLzOhu6Jqw/rdt0tYS75tNvRAEJqImhLSq12RyWtg2gsgZkFuiSv1Qo06eTCw2IvPI0+beKLMg2T3il2L@lists.infradead.org
X-Gm-Message-State: AOJu0YxP7uenUmiaWLke2GEBj+Y0HU/7x56idsHCkpX+PpON5d73FiKK
	/KHXM2zUqvb/I652XaOZeoxu80T0dm8uwsGfCSgHpoTxo2rND3VT
X-Gm-Gg: ASbGncu4W0LyYpGVz/dPwdVavVDhpoPCle2GESs4o7aoMsOIMs6pAySKBzUz7k8X0GD
	2F/bnCsAluHu6UTWdIajT7zDb/YDxy6BRmTvSLWeEAxkfmv7zHmwc5As3OWULXKf0RakI15mLJq
	oWuvQxBqWc7YHh2hPO0IrMJQnc1kfbFjhOvtGGbuquqVoqtpgabNceBb+snsaXm1C1aSd4L8HhB
	mI3HFAqrTy2X9I3Zehvy5MigzHx5OTCbrQtDa/unakMMIOA89+9GmOoZzhIj/pakT2us+EN7xuz
	2Y3BAmyEPt1RQPATWFY2fv0O11B3ym/cXssu5IW05koFNu+niwRLTSuuWqg7VtOH2M3qpwV+iCe
	4e7Gb9GPWdrEr52Bncw==
X-Google-Smtp-Source: AGHT+IEioVgtuSEfAYuAE8IAAYiDjsUn61PAgb/S9UQkSNM/19B6DRuSeEADVUHZxIm2XFZUlNalCg==
X-Received: by 2002:a05:6a21:6e48:b0:1f5:839e:ece8 with SMTP id adf61e73a8af0-1fbeb1854bcmr4348609637.2.1742389891204;
        Wed, 19 Mar 2025 06:11:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371157369bsm11469895b3a.75.2025.03.19.06.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 06:11:30 -0700 (PDT)
Message-ID: <9030a298-fcb6-48ea-a941-ad6916bf9fa7@roeck-us.net>
Date: Wed, 19 Mar 2025 06:11:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Will Deacon <will@kernel.org>, Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard
 <mripard@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
 <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
 <20250318155946.GC13829@willie-the-truck>
 <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_061132_072764_AFD74842 
X-CRM114-Status: GOOD (  18.33  )
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

T24gMy8xOS8yNSAwMTowNSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBMZSAxOC8w
My8yMDI1IMOgIDE2OjU5LCBXaWxsIERlYWNvbiBhIMOpY3JpdMKgOgo+PiBPbiBUaHUsIE1hciAx
MywgMjAyNSBhdCAwNTo0MDo1OVBNICswMTAwLCBBbGVzc2FuZHJvIENhcm1pbmF0aSB3cm90ZToK
Pj4+IE9uIFRodSwgTWFyIDEzLCAyMDI1IGF0IDE6MjXigK9QTSBXaWxsIERlYWNvbiA8d2lsbEBr
ZXJuZWwub3JnPiB3cm90ZToKPj4+Pgo+Pj4+IE9uIFRodSwgTWFyIDEzLCAyMDI1IGF0IDExOjQz
OjIyQU0gKzAwMDAsIEFsZXNzYW5kcm8gQ2FybWluYXRpIHdyb3RlOgo+Pj4+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9idWcuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20v
YnVnLmgKPj4+Pj4gaW5kZXggMjhiZTA0OGRiM2Y2Li4wNDRjNWUyNGExN2QgMTAwNjQ0Cj4+Pj4+
IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vYnVnLmgKPj4+Pj4gKysrIGIvYXJjaC9hcm02
NC9pbmNsdWRlL2FzbS9idWcuaAo+Pj4+PiBAQCAtMTEsOCArMTEsMTQgQEAKPj4+Pj4KPj4+Pj4g
wqAgI2luY2x1ZGUgPGFzbS9hc20tYnVnLmg+Cj4+Pj4+Cj4+Pj4+ICsjaWZkZWYgSEFWRV9CVUdf
RlVOQ1RJT04KPj4+Pj4gKyMgZGVmaW5lIF9fQlVHX0ZVTkPCoCBfX2Z1bmNfXwo+Pj4+PiArI2Vs
c2UKPj4+Pj4gKyMgZGVmaW5lIF9fQlVHX0ZVTkPCoCBOVUxMCj4+Pj4+ICsjZW5kaWYKPj4+Pj4g
Kwo+Pj4+PiDCoCAjZGVmaW5lIF9fQlVHX0ZMQUdTKGZsYWdzKcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4+PiAtwqDCoMKgwqAgYXNtIHZv
bGF0aWxlIChfX3N0cmluZ2lmeShBU01fQlVHX0ZMQUdTKGZsYWdzKSkpOwo+Pj4+PiArwqDCoMKg
wqAgYXNtIHZvbGF0aWxlIChfX3N0cmluZ2lmeShBU01fQlVHX0ZMQUdTKGZsYWdzLCAlYzApKSA6
IDogImkiIChfX0JVR19GVU5DKSk7Cj4+Pj4KPj4+PiBXaHkgaXMgJ2knIHRoZSByaWdodCBhc20g
Y29uc3RyYWludCB0byB1c2UgaGVyZT8gSXQgc2VlbXMgYSBiaXQgb2RkIHRvCj4+Pj4gdXNlIHRo
YXQgZm9yIGEgcG9pbnRlci4KPj4+Cj4+PiBJIHJlY2VpdmVkIHRoaXMgY29kZSBhcyBsZWdhY3kg
ZnJvbSBhIHByZXZpb3VzIHZlcnNpb24uCj4+PiBJbiBteSByZXZpZXcsIEkgY29uc2lkZXJlZCB0
aGUgY2FzZSB3aGVuIEhBVkVfQlVHX0ZVTkNUSU9OIGlzIGRlZmluZWQ6Cj4+PiBIZXJlLCBfX0JV
R19GVU5DIGlzIGRlZmluZWQgYXMgX19mdW5jX18sIHdoaWNoIGlzIHRoZSBuYW1lIG9mIHRoZQo+
Pj4gY3VycmVudCBmdW5jdGlvbiBhcyBhIHN0cmluZyBsaXRlcmFsLgo+Pj4gVXNpbmcgdGhlIGNv
bnN0cmFpbnQgImkiIHNlZW1zIGFwcHJvcHJpYXRlIHRvIG1lIGluIHRoaXMgY2FzZS4KPj4+Cj4+
PiBIb3dldmVyLCB3aGVuIEhBVkVfQlVHX0ZVTkNUSU9OIGlzIG5vdCBkZWZpbmVkOgo+Pj4gX19C
VUdfRlVOQyBpcyBkZWZpbmVkIGFzIE5VTEwuIEluaXRpYWxseSwgSSBjb25zaWRlcmVkIGl0IGxp
dGVyYWwgMCwKPj4+IGJ1dCBhZnRlciBpbnZlc3RpZ2F0aW5nIHlvdXIgY29uY2VybiwgSSBmb3Vu
ZDoKPj4+Cj4+PiBgYGAKPj4+ICQgZWNobyAtRSAiI2luY2x1ZGUgPHN0ZGlvLmg+XG4jaW5jbHVk
ZSA8c3RkZGVmLmg+XG5pbnQgbWFpbigpCj4+PiB7XG5yZXR1cm4gMDtcbn0iIHwgYWFyY2g2NC1s
aW51eC1nbnUtZ2NjIC1FIC1kTSAtIHwgZ3JlcCBOVUxMCj4+PiAjZGVmaW5lIE5VTEwgKCh2b2lk
ICopMCkKPj4+IGBgYAo+Pj4KPj4+IEkgcmVhbGl6ZWQgdGhhdCBOVUxMIGlzIGFjdHVhbGx5IGEg
cG9pbnRlciB0aGF0IGlzIG5vdCBhIGxpbmsgdGltZQo+Pj4gc3ltYm9sLCBhbmQgdXNpbmcgdGhl
ICJpIiBjb25zdHJhaW50IHdpdGggTlVMTCBtYXkgcmVzdWx0IGluIHVuZGVmaW5lZAo+Pj4gYmVo
YXZpb3IuCj4+Pgo+Pj4gV291bGQgdGhlIGZvbGxvd2luZyBhbHRlcm5hdGl2ZSBkZWZpbml0aW9u
IGZvciBfX0JVR19GVU5DIGJlIG1vcmUgY29udmluY2luZz8KPj4+Cj4+PiBgYGAKPj4+ICNpZmRl
ZiBIQVZFX0JVR19GVU5DVElPTgo+Pj4gwqDCoMKgwqAgI2RlZmluZSBfX0JVR19GVU5DIF9fZnVu
Y19fCj4+PiAjZWxzZQo+Pj4gwqDCoMKgwqAgI2RlZmluZSBfX0JVR19GVU5DICh1aW50cHRyX3Qp
MAo+Pj4gI2VuZGlmCj4+PiBgYGAKPj4+IExldCBtZSBrbm93IHlvdXIgdGhvdWdodHMuCj4+Cj4+
IFRoYW5rcyBmb3IgdGhlIGFuYWx5c2lzOyBJIGhhZG4ndCBub3RpY2VkIHRoaXMgc3BlY2lmaWMg
aXNzdWUsIGl0IGp1c3QKPj4gc21lbGxlZCBhIGJpdCBmaXNoeS4gQW55d2F5LCB0aGUgZGlmZiBh
Ym92ZSBsb29rcyBiZXR0ZXIsIHRoYW5rcy4KPiAKPiBUaGF0IHByb3BhYmx5IGRlc2VydmVzIGEg
Y29tbWVudC4KPiAKPiBEb2Vzbid0IHNwYXJzZSBhbmQvb3IgY2hlY2twYXRjaCBjb21wbGFpbiBh
Ym91dCAwIGJlaW5nIHVzZWQgaW4gbGlldSBvZiBOVUxMID8KPiAKCl9fQlVHX0ZVTkMgaXMgb25s
eSB1c2VkIGFzIHBhcmFtZXRlciB0byBhc20gY29kZSwgbm90IGFzIHBvaW50ZXIuCgogRnJvbSB0
aGUgZGlmZjoKCi0gICAgICAgICAgICAgICAgICAgIDogOiAiaSIgKF9fRklMRV9fKSwgImkiIChf
X0xJTkVfXyksICAgICAgICAgICAgICAgIFwKKyAgICAgICAgICAgICAgICAgICAgOiA6ICJpIiAo
X19GSUxFX18pLCAiaSIgKF9fQlVHX0ZVTkMpLCAiaSIgKF9fTElORV9fKSxcCgpUaGUgdXNlIGlz
IHF1aXRlIHNpbWlsYXIgdG8gX19GSUxFX18gYW5kIF9fTElORV9fLiBJdCBtaWdodCBldmVuIGJl
IHBvc3NpYmxlCmFuZCBhcHByb3ByaWF0ZSB0byBqdXN0IGRlZmluZSBfX0JVR19GVU5DIGFzIDAg
aWYgSEFWRV9CVUdfRlVOQ1RJT04gaXMgbm90IGRlZmluZWQuCgpHdWVudGVyCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
