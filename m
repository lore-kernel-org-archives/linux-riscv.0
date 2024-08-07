Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AE9C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 15:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJLaEU9zxp9I6s+kpuEBhmIysWfDB1vbtRZRLTxj6C4=; b=A/fuPIZwCzurYr
	7Skn+dY8Nf1UB7pF95oZfsEmSpqd2OtmjgHknsWqu4jFqyux7P2oLw/2a4yPhwlb8k5o6zBbkdSQz
	sWw2ziwCdqrVeDEEsBAbNNN8rQHtVOBmMGPeS28Jeto1NQMml+18tshH+fj0aKN+XTlN9UUw/acBq
	0D+LDtQWiWozaGZj0C2VBsPMpd2V2dwAQ6+H9J4Wa0xF2GzYzUS8/H9NrO3aQH5CGT6cTWAPdvs3v
	6dO8kibO5kJBUgwk9H5EugPgyrV8rrBvUG1pAbnZHv4koeP6GPrp7mLm8AuT0m15x4bVaHVA2eE9J
	BQ2bOpYZxZ+SeZItn6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbiW9-00000005V7h-2yzR;
	Wed, 07 Aug 2024 15:24:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbiW3-00000005V2v-2zwn
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 15:23:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723044234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aAgxFInvvWwKV0z4+0KCeJqRg0kMvcuUocrtSkGNRkQ=;
	b=Rlhb40inEG7c570BG4Fa18tUgMoU5ygC9njcVaUKYEQVK2cCHDQj5I6IjAQFJgoM+7liPP
	WekqC9X1j1aUEDuogL+oUvGPyHlAUK49XcAEagSH7H/L+buVneBaDmMWjTDRi9iWHVA9JC
	R5lxovBMaQ7OZSf6GDddhXXiitSWlng=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-MsCN5atDOFeUg0e720tS4A-1; Wed, 07 Aug 2024 11:23:53 -0400
X-MC-Unique: MsCN5atDOFeUg0e720tS4A-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4280b119a74so13361615e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2024 08:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723044232; x=1723649032;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aAgxFInvvWwKV0z4+0KCeJqRg0kMvcuUocrtSkGNRkQ=;
        b=BooAN7I5dqI7IU/Wwt8+5GeoRUsCR5cEmvDxf9gNZN1YaPO/jc3qbrOXxI+WLXnkUO
         FtHT2e8NzU6gLMqJaaOJ/3hJ9CZ+L9SBCwYkHKoIC17Yw9UJ3e8/jaHNZ97fQpeV+ImA
         BATBwI/kQJ8vwAf73TqyibLvVeviAWDDGPGPhFSgsPJUeqFObnQ88Zm3NS8sUNELVwMQ
         mjE/UgICefJCIajDNLIN56pjZOlKu/p1WSyYGYApCX6dIxYHInDLWXvRelC55aprWmVR
         sqJpWho8UcsiXjzrDbkL9IBq/SeIVE8CykMHVwcvr8qdeGuDrZKhvnaaC8iiSbX9vjKc
         UgRg==
X-Forwarded-Encrypted: i=1; AJvYcCU+VuWe0TgYO8AxfmTnk4hBfFmL2oftgnfYGw4vFPjtyUPGdG8vv+ORAhtL7KfvPvIZX9yi7zZWVsj9bhP5X2Oz/6xoqeB246CEcLwQjBOw
X-Gm-Message-State: AOJu0YxgD5T/pKSvU0HpejyTySVO2aBPgdkSXRmIwVgxSs1+NaxQ+VtZ
	y8rtZB/I8NZbUKxrIRON2C+N1mtA1PpjklY9EZIKV2O1Z8D89fE0SpYlT4B4tVlkDVxYwRSjP/C
	YbDfDcgHKMzqTCssWQW8zC+8lBn7Hp7LtZSMmmUFawQdL82mnKR7WdcFVHfihy9PMmw==
X-Received: by 2002:a05:600c:4fc9:b0:426:6f27:379a with SMTP id 5b1f17b1804b1-428e6b08fc5mr123411225e9.13.1723044231722;
        Wed, 07 Aug 2024 08:23:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa1u7xsFpjJO/UW4dKCxZ81wLwqoTylnMlnIcAzev3Z83n1ZIinArOgcYN+yAGW9Rj8jfltw==
X-Received: by 2002:a05:600c:4fc9:b0:426:6f27:379a with SMTP id 5b1f17b1804b1-428e6b08fc5mr123410535e9.13.1723044231149;
        Wed, 07 Aug 2024 08:23:51 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:1a00:df86:93fe:6505:d096? (p200300cbc7081a00df8693fe6505d096.dip0.t-ipconnect.de. [2003:cb:c708:1a00:df86:93fe:6505:d096])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42905971ad7sm35137405e9.17.2024.08.07.08.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 08:23:50 -0700 (PDT)
Message-ID: <936f8adf-a8a5-45eb-b5a3-297773918f7c@redhat.com>
Date: Wed, 7 Aug 2024 17:23:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mm: keep nid around during hot-remove
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: agordeev@linux.ibm.com, akpm@linux-foundation.org,
 alexghiti@rivosinc.com, aou@eecs.berkeley.edu, ardb@kernel.org,
 arnd@arndb.de, bhe@redhat.com, bjorn@rivosinc.com,
 borntraeger@linux.ibm.com, bp@alien8.de, catalin.marinas@arm.com,
 chenhuacai@kernel.org, chenjiahao16@huawei.com, christophe.leroy@csgroup.eu,
 dave.hansen@linux.intel.com, dawei.li@shingroup.cn,
 gerald.schaefer@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com,
 hpa@zytor.com, kent.overstreet@linux.dev, kernel@xen0n.name,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 loongarch@lists.linux.dev, luto@kernel.org, maobibo@loongson.cn,
 mark.rutland@arm.com, mcgrof@kernel.org, mingo@redhat.com,
 mpe@ellerman.id.au, muchun.song@linux.dev, namcao@linutronix.de,
 naveen@kernel.org, npiggin@gmail.com, osalvador@suse.de, palmer@dabbelt.com,
 paul.walmsley@sifive.com, peterz@infradead.org, philmd@linaro.org,
 rdunlap@infradead.org, rientjes@google.com, rppt@kernel.org,
 ryan.roberts@arm.com, souravpanda@google.com, svens@linux.ibm.com,
 tglx@linutronix.de, tzimmermann@suse.de, will@kernel.org, x86@kernel.org
References: <20240806221454.1971755-1-pasha.tatashin@soleen.com>
 <20240806221454.1971755-2-pasha.tatashin@soleen.com>
 <345ba221-e094-47e8-9481-562faf4acd85@redhat.com>
 <e780e9af-e23d-44ff-ae0f-a8f4ee098a1c@redhat.com>
 <CA+CK2bBuDu-3XeeAsy4zggOrxTrp84bcZp9p6mQipzc3NqpcSg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CA+CK2bBuDu-3XeeAsy4zggOrxTrp84bcZp9p6mQipzc3NqpcSg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_082355_949006_C7C4E08D 
X-CRM114-Status: GOOD (  20.94  )
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

T24gMDcuMDguMjQgMTY6NDAsIFBhc2hhIFRhdGFzaGluIHdyb3RlOgo+IE9uIFdlZCwgQXVnIDcs
IDIwMjQgYXQgNzo1MOKAr0FNIERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPiB3
cm90ZToKPj4KPj4gT24gMDcuMDguMjQgMTM6MzIsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+
Pj4gT24gMDcuMDguMjQgMDA6MTQsIFBhc2hhIFRhdGFzaGluIHdyb3RlOgo+Pj4+IG5pZCBpcyBu
ZWVkZWQgZHVyaW5nIG1lbW9yeSBob3QtcmVtb3ZlIGluIG9yZGVyIHRvIGFjY291bnQgdGhlCj4+
Pj4gaW5mb3JtYXRpb24gYWJvdXQgdGhlIG1lbW1hcCBvdmVyaGVhZCB0aGF0IGlzIGJlaW5nIHJl
bW92ZWQuCj4+Pj4KPj4+PiBJbiBhZGRpdGlvbiwgd2UgY2Fubm90IHVzZSBwYWdlX3BnZGF0KHBm
bl90b19wYWdlKHBmbikpIGR1cmluZwo+Pj4+IGhvdHJlbW92ZSBhZnRlciByZW1vdmVfcGZuX3Jh
bmdlX2Zyb21fem9uZSgpLgo+Pj4+Cj4+Pj4gV2UgYWxzbyBjYW5ub3QgZGV0ZXJtaW5lIG5pZCBm
cm9tIHdhbGtpbmcgdGhyb3VnaCBtZW1ibG9ja3MgYWZ0ZXIKPj4+PiByZW1vdmVfbWVtb3J5X2Js
b2NrX2RldmljZXMoKSBpcyBjYWxsZWQuCj4+Pj4KPj4+PiBUaGVyZWZvcmUsIHBhc3MgbmlkIGRv
d24gZnJvbSB0aGUgYmVnaW5uaW5nIG9mIGhvdHJlbW92ZSB0byB3aGVyZQo+Pj4+IGl0IGlzIHVz
ZWQgZm9yIHRoZSBhY2NvdW50aW5nIHB1cnBvc2VzLgo+Pj4KPj4+IEkgd2FzIGhhcHB5IHRvIGZp
bmFsbHkgcmVtb3ZlIHRoYXQgbmlkIHBhcmFtZXRlciBmb3IgZ29vZCBpbjoKPj4+Cj4+PiBjb21t
aXQgNjVhMmFhNWY0ODJlZDBjMWI1YWZiOWU2YjBiOWUwYjE2YmI4YjYxNgo+Pj4gQXV0aG9yOiBE
YXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4KPj4+IERhdGU6ICAgVHVlIFNlcCA3
IDE5OjU1OjA0IDIwMjEgLTA3MDAKPj4+Cj4+PiAgICAgICAgbW0vbWVtb3J5X2hvdHBsdWc6IHJl
bW92ZSBuaWQgcGFyYW1ldGVyIGZyb20gYXJjaF9yZW1vdmVfbWVtb3J5KCkKPj4+Cj4+PiBUbyBh
c2sgdGhlIHJlYWwgcXVlc3Rpb246IERvIHdlIHJlYWxseSBuZWVkIHRoaXMgY291bnRlciBwZXIt
bmlkIGF0IGFsbD8KPj4+Cj4+PiBTZWVtcyB0byBvdmVyLWNvbXBsaWNhdGUgdGhpbmdzLgo+Pgo+
PiBDYXNlIGluIHBvaW50OiBJIHRoaW5rIHRoZSBoYW5kbGluZyBpcyB3cm9uZz8KPj4KPj4gSnVz
dCBiZWNhdXNlIHNvbWUgbWVtb3J5IGJlbG9uZ3MgdG8gYSBuaWQgZG9lc24ndCBtZWFuIHRoYXQg
dGhlIHZtZW1tYXAKPj4gd2FzIGFsbG9jYXRlZCBmcm9tIHRoYXQgbmlkPwo+IAo+IEkgYmVsaWV2
ZSB3aGVuIHdlIGhvdC1hZGQgd2UgdXNlIG5pZCBmb3IgdGhlIG1lbW9yeSB0aGF0IGlzIGJlaW5n
Cj4gYWRkZWQgdG8gYWNjb3VudCB2bWVtbWFwLCBhbmQgd2hlbiB3ZSBkbyBob3QtcmVtb3ZlIHdl
IGFsc28gdXNlIG5pZCBvZgo+IHRoZSBtZW1vcnkgdGhhdCBpcyBiZWluZyByZW1vdmVkLiBCdXQs
IHlvdSBhcmUgY29ycmVjdCwgdGhpcyBkb2VzIG5vdAo+IGd1YXJhbnRlZSB0aGF0IHRoZSBhY3R1
YWwgdm1lbW1hcCBtZW1vcnkgaXMgYmVpbmcgYWxsb2NhdGVkIG9yIHJlbW92ZWQKPiBmcm9tIHRo
ZSBnaXZlbiBuaWQuCgpSaWdodC4gRm9yIGJvb3QgbWVtb3J5IHRoYXQgd2UgbWlnaHQgd2FudCB0
byB1bnBsdWcgbGF0ZXIgaXQgbWlnaHQgYmUgCmRpZmZlcmVudC4gSSByZWNhbGwgdGhhdCB3aXRo
ICJtb3ZhYmxlX25vZGUiLCB3ZSBtaWdodCBlbmQgdXAgYWxsb2NhdGluZyAKdGhlIHZtZW1tYXAg
ZnJvbSByZW1vdGUgbm9kZXMsIHN1Y2ggdGhhdCBhbGwgbWVtb3J5IG9mIGEgbm9kZSBzdGF5cyAK
bW92YWJsZS4gVGhhdCdzIHdoeSBfX2Vhcmx5b25seV9ib290bWVtX2FsbG9jKCkgZW5kcyB1cCBj
YWxsaW5nIAptZW1ibG9ja19hbGxvY190cnlfbmlkX3JhdygpLCB0byBmYWxsYmFjayB0byBvdGhl
ciBub2RlcyBpZiByZXF1aXJlZC4KCj4gCj4+IFdvdWxkbid0IHdlIHdhbnQgdG8gbG9vayBhdCB0
aGUgYWN0dWFsIG5pZCB0aGUgdm1lbW1hcCBwYWdlIGJlbG9uZ3MgdG8KPj4gdGhhdCB3ZSBhcmUg
cmVtb3Zpbmc/Cj4gCj4gSSBhbSBub3cgbG9va2luZyBpbnRvIGNvbnZlcnRpbmcgdGhpcyBjb3Vu
dGVyIHRvIGJlIHN5c3RlbSB3aWRlLCBpLmUuCj4gdm1fZXZlbnQsIGl0IGlzIGFsbCBkb25lIHVu
ZGVyIGhvdHBsdWcgbG9jaywgc28gdGhlcmUgaXMgbm8KPiBjb250ZW50aW9uLgoKVGhhdCB3b3Vs
ZCBiZSBlYXNpZXN0LCBhc3N1bWluZyBwZXItbm9kZSBpbmZvcm1hdGlvbiBpcyBub3Qgc3RyaWN0
bHkgCnJlcXVpcmVkIGZvciBub3cuCgotLSAKQ2hlZXJzLAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
