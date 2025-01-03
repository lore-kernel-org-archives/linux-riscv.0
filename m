Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968E6E7718F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 09:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2rlanV/N3g9ItmhkFp19TWbkkfPQN1gx0bbmmQqRbi8=; b=rIBch6jOwqn/qN
	xyVZh4HaTeznR/cpBrVp9avDE62VlpInSSD6NEnCovVV6tJdNvvhz9rot5xdJofKrHieV8J98L1pL
	xVuYIytKMB3Eb0xHuY6+jiPRzadtwYf6BmbdaASboxfGV+XLIbWJRCbAzologmTQrH2qLktlxNoag
	1xXIl9RNIQ3DhQiKE2cGqVl9KGABTFb4kBUjpBULdn3xnYm6fE2Xa3jQ/wNq4jB+G/g+J5nF2FNcC
	dXd70c5UBzDpYnWhVYHKXKQHVuf13WE8WdU/mFCPC8mPkvD8TlhzWgsfBvoL52RhtEd2sEym0668a
	1UJMfwF4hNUq7m34YSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdlW-0000000CZSm-3pqo;
	Fri, 03 Jan 2025 09:14:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdkU-0000000CZKW-0W91
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 Jan 2025 09:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FvjXC1OjFutvGYgxD2wHa2wTk86a/9lW5eStlVFSRNE=; b=VGWrp9w0hWhDfwLckeVy2khrI5
	emZlbOXWh0sxvXS2aWcItSxXCRw7UEckKEMNAf1thkp+iISAWKTn37gGB/vsAykBpMRGDDWF9KRlZ
	ctA7zVPwJL7lP5SJQ0kkflViJYTa3s/4MeUlQ06KMlLdk7Bjb6Fa1Zrmca7MNa4kXMFLqTiGokPye
	LS31wEW7EpIoEww1/dKo9XE4Nu4Ek4Bbipxf+N79MNkUR1XB62MfOJYEhgC0RwX8+SfELuKSHBkJC
	qhqV6OoXgwFRHCvES2pc9t/7fQaziq8OTi0teS5zRKkjrvkvB6jS4t3Ws5vNH8SkL9Q74ifTNyfLg
	6A2j6ocQ==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTdkO-00000008LEQ-3Sgw
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 09:13:40 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-216401de828so156645995ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jan 2025 01:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735895609; x=1736500409; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FvjXC1OjFutvGYgxD2wHa2wTk86a/9lW5eStlVFSRNE=;
        b=YaRCkHDqDpY8yb4dktxA6vn4U6QJCDSlOjJ+/dCx8JZC40KbzAyhAmmxALdBV+sYk2
         AnySEVz2WxzFNS+gbuhtMdzZFeqGJO/5T3iTar0lgU9O4VpGc/Egm4NzNeH3uqte3AmE
         uSrdo1ZOvYwlywWzqa5KVIa7ifKq1m/NUq5cF52GZb/BtsGMQQZ3N3HILs69Z3GkLtwe
         I9csdAWmU5Ml94Itv0EpKVoayON8/LN2uw2U8fIW/klIhHaN5jQNruX5kvLOqRTy8dzY
         EWTN/QLU4DDBNLBweAstFL84MSPs7moAkdZFlhzq3hgkryhrzO+3t5OI2dU2eUE6XvSi
         4KZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735895609; x=1736500409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FvjXC1OjFutvGYgxD2wHa2wTk86a/9lW5eStlVFSRNE=;
        b=g0jNq+H1E4aly6n0WkkoW+0VQKC04AG1wgz1h9zcBRN54OI+dCgteujqpdcpfB+Xsx
         ev3lvK36UKGbryaZhD5lLkgJSIldXK1RVcfF7TUKYhyXpvPv35+0pL+rhUTF+xZew/GJ
         TnObFTRW4ehN36yl0JQQoq8CHaQrULjU0jCJDuCpBRTl7dLNpdNWo/aa2qw1Q8N7hNuC
         6/Qn/1G6NULexxpTLfvq/aDxCKdU1fq6bmC0gP8G6bdLXPRPsTGB6qvfGCqQBCwOj918
         UTn1MGIojK96g/HBPdHk25ETUET9/HqH546CoY5FsOw0eRkZW63JKR+4MH8os4yBWtil
         C1mg==
X-Forwarded-Encrypted: i=1; AJvYcCXlEWFduadlGKRUWXzyEmU//ITVGNH5OZGlitbZagYyv4gyWGggF4xG09fbtxmOsTXR5PfMByaMmsQmFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0MJiparvDO6hcwZUVQs2rSxOyONwLp5mY79/z4EuHFiRndPY2
	rgV4AcOjz1QVVI6bUEHfZn1t87jc+Fx6xJcDel5K3N06HeSf+8I+bj6PfHO/nZ4=
X-Gm-Gg: ASbGncu6Dv17/yDB2g3MbUdu20vnWP5YKvuCEjbdW6YG21i4CSEV0bxLUasYuHDO+HE
	uoPTYluPNtQpveFAylYAd/iOvK+NwnbRlDH01XrqnqcwwoLqK3qQBX4YTlEuvasfpf16L/v6QPT
	nbyGbKYlAm4kEhyleXEFmhJ4O75+zus6zZHMBd41l+MszzFMNU4hkVnbkr0VdbZDMQTlqhVIpUu
	QMTIUcb4G329z1M2IZn3eVMeZyP/jbl8xT21nBvvkXLHEFbaYCqXFlrq526xP/lqcUQ8Up+16j3
	BquD9Q==
X-Google-Smtp-Source: AGHT+IEXJPN8gGhA2HYYDOMJlHA0eNtjpiDq/sKLXwKwTWFhE1ZE5FTpP/Am20/VMhak6uDuJsOrhQ==
X-Received: by 2002:a17:903:11d2:b0:215:a60d:bcc9 with SMTP id d9443c01a7336-219e6e89536mr708942765ad.2.1735895609241;
        Fri, 03 Jan 2025 01:13:29 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cde19sm241412365ad.167.2025.01.03.01.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:13:27 -0800 (PST)
Message-ID: <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
Date: Fri, 3 Jan 2025 17:13:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
 <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
 <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_091337_343385_990EACF2 
X-CRM114-Status: GOOD (  23.97  )
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

CgpPbiAyMDI1LzEvMyAxNjowMiwgS2V2aW4gQnJvZHNreSB3cm90ZToKPiBPbiAwMy8wMS8yMDI1
IDA0OjQ4LCBRaSBaaGVuZyB3cm90ZToKPj4gSGkgS2V2aW4sCj4+Cj4+IE9uIDIwMjUvMS8zIDAw
OjUzLCBLZXZpbiBCcm9kc2t5IHdyb3RlOgo+Pj4gT24gMzAvMTIvMjAyNCAxMDowNywgUWkgWmhl
bmcgd3JvdGU6Cj4+Pj4gIMKgIHN0YXRpYyBpbmxpbmUgdm9pZCByaXNjdl90bGJfcmVtb3ZlX3B0
ZGVzYyhzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLAo+Pj4+IHZvaWQgKnB0KQo+Pj4+ICDCoCB7Cj4+
Pj4gLcKgwqDCoCBpZiAocmlzY3ZfdXNlX3NiaV9mb3JfcmZlbmNlKCkpCj4+Pj4gK8KgwqDCoCBp
ZiAocmlzY3ZfdXNlX3NiaV9mb3JfcmZlbmNlKCkpIHsKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
IHRsYl9yZW1vdmVfcHRkZXNjKHRsYiwgcHQpOwo+Pj4+IC3CoMKgwqAgZWxzZQo+Pj4+ICvCoMKg
wqAgfSBlbHNlIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcGFnZXRhYmxlX2R0b3IocHQpOwo+Pj4+
ICDCoMKgwqDCoMKgwqDCoMKgwqAgdGxiX3JlbW92ZV9wYWdlX3B0ZGVzYyh0bGIsIHB0KTsKPj4+
Cj4+PiBJIGZpbmQgdGhlIGltYmFsYW5jZSBwcmV0dHkgY29uZnVzaW5nOiBwYWdldGFibGVfZHRv
cigpIGlzIGNhbGxlZAo+Pj4gZXhwbGljaXRseSBiZWZvcmUgdXNpbmcgdGxiX3JlbW92ZV9wYWdl
KCkgYnV0IG5vdCB0bGJfcmVtb3ZlX3B0ZGVzYygpLgo+Pj4gRG9lc24ndCB0aGF0IGFzc3VtZSB0
aGF0IENPTkZJR19NTVVfR0FUSEVSX0hBVkVfVEFCTEVfRlJFRSBpcyBzZWxlY3RlZD8KPj4+IENv
dWxkIHdlIG5vdCBjYWxsIHBhZ2V0YWJsZV9kdG9yKCkgZnJvbSBfX3RsYl9iYXRjaF9mcmVlX2Vu
Y29kZWRfcGFnZXMoKQo+Pj4gdG8gZW5zdXJlIHRoYXQgdGhlIGR0b3IgaXMgYWx3YXlzIGNhbGxl
ZCBqdXN0IGJlZm9yZSBmcmVlaW5nLCBhbmQgcmVtb3ZlCj4+Cj4+IEluIF9fdGxiX2JhdGNoX2Zy
ZWVfZW5jb2RlZF9wYWdlcygpLCB3ZSBjYW4gaW5kZWVkIGRldGVjdCBQYWdlVGFibGUoKQo+PiBh
bmQgY2FsbCBwYWdldGFibGVfZHRvcigpIHRvIGR0b3IgdGhlIHBhZ2UgdGFibGUgcGFnZXMuCj4+
IEJ1dCBfX3RsYl9iYXRjaF9mcmVlX2VuY29kZWRfcGFnZXMoKSBpcyBhbHNvIHVzZWQgdG8gZnJl
ZSBub3JtYWwgcGFnZXMKPj4gKG5vdCBwYWdlIHRhYmxlIHBhZ2VzKSwgc28gSSBkb24ndCB3YW50
IHRvIGFkZCBvdmVyaGVhZCB0aGVyZS4KPiAKPiBJbnRlcmVzdGluZywgY2FuIGEgdGxiIGJhdGNo
IHJlZmVyIHRvIHBhZ2VzIHRoYW4gYXJlIG5vdCBQVFBzIHRoZW4/CgpZZXMsIHlvdSBjYW4gc2Vl
IHRoZSBjYWxsZXIgb2YgX190bGJfcmVtb3ZlX2ZvbGlvX3BhZ2VzKCkgb3IgCnRsYl9yZW1vdmVf
cGFnZV9zaXplKCkuCgo+IAo+Pgo+PiBCdXQgbm93IEkgdGhpbmsgbWF5YmUgd2UgY2FuIGRvIHRo
aXMgaW4gdGxiX3JlbW92ZV9wYWdlX3B0ZGVzYygpLCBsaWtlCj4+IHRoaXM6Cj4+Cj4+IGRpZmYg
LS1naXQgYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vcGdhbGxvYy5oCj4+IGIvYXJjaC9jc2t5L2lu
Y2x1ZGUvYXNtL3BnYWxsb2MuaAo+PiBpbmRleCBmMWNlNWI3YjI4ZjIyLi5lNDVjN2U5MWRjYmY5
IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2Nza3kvaW5jbHVkZS9hc20vcGdhbGxvYy5oCj4+ICsrKyBi
L2FyY2gvY3NreS9pbmNsdWRlL2FzbS9wZ2FsbG9jLmgKPj4gQEAgLTYzLDcgKzYzLDYgQEAgc3Rh
dGljIGlubGluZSBwZ2RfdCAqcGdkX2FsbG9jKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+Pgo+PiAg
wqAjZGVmaW5lIF9fcHRlX2ZyZWVfdGxiKHRsYiwgcHRlLCBhZGRyZXNzKcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFwKPj4gIMKgZG8ge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXAo+PiAtwqDCoMKgwqDCoMKgIHBhZ2V0YWJsZV9kdG9yKHBhZ2VfcHRkZXNj
KHB0ZSkpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+PiAgwqDCoMKgwqDCoMKgwqAg
dGxiX3JlbW92ZV9wYWdlX3B0ZGVzYyh0bGIsIHBhZ2VfcHRkZXNjKHB0ZSkpO8KgIFwKPj4gIMKg
fSB3aGlsZSAoMCkKPj4KPj4gWy4uLl0KPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvYXNtLWdl
bmVyaWMvdGxiLmggYi9pbmNsdWRlL2FzbS1nZW5lcmljL3RsYi5oCj4+IGluZGV4IGE5NmQ0YjQ0
MGYzZGEuLmE1OTIwNTg2M2Y0MzEgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMv
dGxiLmgKPj4gKysrIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy90bGIuaAo+PiBAQCAtNTA2LDYgKzUw
Niw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB0bGJfcmVtb3ZlX3B0ZGVzYyhzdHJ1Y3QKPj4gbW11
X2dhdGhlciAqdGxiLCB2b2lkICpwdCkKPj4gIMKgLyogTGlrZSB0bGJfcmVtb3ZlX3B0ZGVzYywg
YnV0IGZvciBwYWdlLWxpa2UgcGFnZSBkaXJlY3Rvcmllcy4gKi8KPj4gIMKgc3RhdGljIGlubGlu
ZSB2b2lkIHRsYl9yZW1vdmVfcGFnZV9wdGRlc2Moc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwKPj4g
c3RydWN0IHB0ZGVzYyAqcHQpCj4+ICDCoHsKPj4gK8KgwqDCoMKgwqDCoCBwYWdldGFibGVfZHRv
cihwdCk7Cj4+ICDCoMKgwqDCoMKgwqDCoCB0bGJfcmVtb3ZlX3BhZ2UodGxiLCBwdGRlc2NfcGFn
ZShwdCkpOwo+PiAgwqB9Cj4gCj4gSSB0aGluayB0aGlzIGlzIGFuIGludGVyZXN0aW5nIGlkZWEs
IGl0IGRvZXMgbWFrZSBhcmNoIGNvZGUgZWFzaWVyIHRvCj4gZm9sbG93LiBPVE9IIGl0IHdvdWxk
IGhhdmUgYmVlbiBtb3JlIG5hdHVyYWwgdG8gbWUgdG8gY2FsbAo+IHBhZ2V0YWJsZV9kdG9yKCkg
ZnJvbSB0bGJfcmVtb3ZlX3BhZ2UoKS4gSSBjYW4gaG93ZXZlciBzZWUgdGhhdCB0aGlzCj4gZG9l
c24ndCB3b3JrLCBiZWNhdXNlIHRsYl9yZW1vdmVfdGFibGUoKSBpcyBkZWZpbmVkIGFzIHRsYl9y
ZW1vdmVfcGFnZSgpCj4gaWYgQ09ORklHX01NVV9HQVRIRVJfSEFWRV9UQUJMRV9GUkVFIGlzbid0
IHNlbGVjdGVkLiBXaGljaCBicmluZ3MgbWUKPiBiYWNrIHRvIG15IGVhcmxpZXIgcXVlc3Rpb246
IGluIHRoYXQgY2FzZSwgYXJlbid0IHdlIG1pc3NpbmcgYSBjYWxsIHRvCj4gcGFnZXRhYmxlX2R0
b3IoKSB3aGVuIHVzaW5nIHRsYl9yZW1vdmVfdGFibGUoKSAob3IgdGxiX3JlbW92ZV9wdGRlc2Mo
KSk/CgpUaGFuayB5b3UgZm9yIHBvaW50aW5nIHRoaXMgb3V0IQoKTm93LCB0aGVyZSBhcmUgdGhl
IGZvbGxvd2luZyBhcmNoaXRlY3R1cmVzIHNlbGVjdGVkIApDT05GSUdfTU1VX0dBVEhFUl9SQ1Vf
VEFCTEVfRlJFRToKCjEuIGFybTogc2VsZWN0IE1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUgaWYg
U01QICYmIEFSTV9MUEFFCjIuIGFybTY0OiBzZWxlY3QgTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJF
RQozLiBwb3dlcnBjOiBzZWxlY3QgTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRQo0LiByaXNjdjog
c2VsZWN0IE1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUgaWYgU01QICYmIE1NVQo1LiBzMzkwOiBz
ZWxlY3QgTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRQo2LiBzcGFyYzogc2VsZWN0IE1NVV9HQVRI
RVJfUkNVX1RBQkxFX0ZSRUUgaWYgU01QCjcuIHg4Njogc2VsZWN0IE1NVV9HQVRIRVJfUkNVX1RB
QkxFX0ZSRUUJaWYgUEFSQVZJUlQKCklmIENPTkZJR19NTVVfR0FUSEVSX1RBQkxFX0ZSRUUgaXMg
c2VsZWN0ZWQsIGFuIGFyY2hpdGVjdHVyZSBpcyBleHBlY3RlZAp0byBwcm92aWRlIF9fdGxiX3Jl
bW92ZV90YWJsZSgpLiBUaGlzIHBhdGNoIHNlcmllcyBtb2RpZmllcyB0aGUKX190bGJfcmVtb3Zl
X3RhYmxlKCkgaW4gYXJtLCBhcm02NCwgcmlzY3YsIHMzOTAgYW5kIHg4Ni4gQW1vbmcgdGhlbSwK
YXJtNjQgYW5kIHMzOTAgdW5jb25kaXRpb25hbGx5IHNlbGVjdCBNTVVfR0FUSEVSX1JDVV9UQUJM
RV9GUkVFLCBzbyB3ZQpvbmx5IG5lZWQgdG8gZG91YmxlLWNoZWNrIGFybSwgcmlzY3YgYW5kIHg4
Ni4KCkZvciB4ODYsIGl0IHdhcyBjYWxsZWQgdGxiX3JlbW92ZV9wYWdlKCkgaW4gdGhlIG5vbi1Q
QVJBVklSVCBjYXNlLCBhbmQgSQphZGRlZCBwYWdldGFibGVfZHRvcigpIGZvciBpdCBleHBsaWNp
dGx5IChzZWUgcGF0Y2ggIzExKSwgc28gdGhpcyBzaG91bGQKYmUgbm8gcHJvYmxlbS4KCkZvciBy
aXNjdiwgaXQgd2lsbCBvbmx5IGNhbGwgdGxiX3JlbW92ZV9wdGRlc2MoKSBpbiB0aGUgY2FzZSBv
ZgpTTVAgJiYgTU1VLCBzbyB0aGlzIHNob3VsZCBiZSBubyBwcm9ibGVtLgoKRm9yIGFybSwgdGhl
IGNhbGwgdG8gcGFnZXRhYmxlX2R0b3IoKSBpcyBpbmRlZWQgbWlzc2VkIGluIHRoZQpub24tTU1V
X0dBVEhFUl9SQ1VfVEFCTEVfRlJFRSBjYXNlLiBUaGlzIG5lZWRzIHRvIGJlIGZpeGVkLiBCdXQg
d2UKY2FuJ3QgZml4IHRoaXMgYnkgYWRkaW5nIHBhZ2V0YWJsZV9kdG9yKCkgdG8gdGxiX3JlbW92
ZV90YWJsZSgpLApiZWNhdXNlIHNvbWUgYXJjaGl0ZWN0dXJlcyBjYWxsIHRsYl9yZW1vdmVfdGFi
bGUoKSBidXQgZG9uJ3Qgc3VwcG9ydApwYWdlIHRhYmxlIHN0YXRpc3RpY3MsIGxpa2Ugc3BhcmMu
CgpTbyBhIG1vcmUgZGlyZWN0IGZpeCBtaWdodCBiZToKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2Fz
bS1nZW5lcmljL3RsYi5oIGIvaW5jbHVkZS9hc20tZ2VuZXJpYy90bGIuaAppbmRleCBhNTkyMDU4
NjNmNDMxLi4wYTEzMTQ0NGExOGNhIDEwMDY0NAotLS0gYS9pbmNsdWRlL2FzbS1nZW5lcmljL3Rs
Yi5oCisrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvdGxiLmgKQEAgLTUwMCw2ICs1MDAsOSBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgdGxiX3JlbW92ZV9wYWdlKHN0cnVjdCBtbXVfZ2F0aGVyIAoqdGxi
LCBzdHJ1Y3QgcGFnZSAqcGFnZSkKCiAgc3RhdGljIGlubGluZSB2b2lkIHRsYl9yZW1vdmVfcHRk
ZXNjKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHZvaWQgKnB0KQogIHsKKyNpZm5kZWYgQ09ORklH
X01NVV9HQVRIRVJfVEFCTEVfRlJFRQorICAgICAgIHBhZ2V0YWJsZV9kdG9yKHB0KTsKKyNlbmRp
ZgogICAgICAgICB0bGJfcmVtb3ZlX3RhYmxlKHRsYiwgcHQpOwogIH0KCk9yIGZpeCBpdCBkaXJl
Y3RseSBpbiBhcm0/IExpa2UgdGhlIGZvbGxvd2luZzoKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9p
bmNsdWRlL2FzbS90bGIuaCBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3RsYi5oCmluZGV4IGVhNGZi
ZTdiMTdmNmYuLmNmNWQwY2EwMjE0NDAgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2luY2x1ZGUvYXNt
L3RsYi5oCisrKyBiL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3RsYi5oCkBAIC00Myw2ICs0Myw5IEBA
IF9fcHRlX2ZyZWVfdGxiKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHBndGFibGVfdCBwdGUsIAp1
bnNpZ25lZCBsb25nIGFkZHIpCiAgICAgICAgIF9fdGxiX2FkanVzdF9yYW5nZSh0bGIsIGFkZHIg
LSBQQUdFX1NJWkUsIDIgKiBQQUdFX1NJWkUpOwogICNlbmRpZgoKKyNpZm5kZWYgQ09ORklHX01N
VV9HQVRIRVJfVEFCTEVfRlJFRQorICAgICAgIHBhZ2V0YWJsZV9kdG9yKHB0ZGVzYyk7CisjZW5k
aWYKICAgICAgICAgdGxiX3JlbW92ZV9wdGRlc2ModGxiLCBwdGRlc2MpOwogIH0KClRoYW5rcywK
UWkKCj4gCj4gLSBLZXZpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
