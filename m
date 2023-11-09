Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6854C4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 08:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmsNdvQyhcb+R4tm9PElyN6OsNGD1XOeL4E4YEmPeVw=; b=gA4grt7kYseugN
	cNZw8FILh3X1rD6993TL8JI6bliUq++7LHTgjTFJ84Vtt0UjqfQvNnK0FSKC0xZShEz/fog02r72J
	LAYHR+v4X47gvS2awNO/zfzmzOvcULJ9nd8VorxxR/Cd6UejF0Z4Lv+boE3r3P9N7IEZMGt0BnSQC
	T2kP7QsYqdRUI2OX/hHoAPovI+kkjEdpNvTT0uNnx0sDCb8fJsvEyyWxk/zbTCJeYfKYBVRBbu1mE
	LuY+6jZWgCmIgmEwFbID+0wZoXdc9FJM6u7oXlWv1DggqoXcqz9aT41xUl5T1zKPAhJ9tBwBzBHS4
	Mx3naP1GwfrL5Vt4mC+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10JP-005bUq-2V;
	Thu, 09 Nov 2023 08:22:51 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10JN-005bTT-22
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 08:22:51 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32da4180ca2so96923f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 00:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699518168; x=1700122968; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6L9e4FIZCW/cWI4CMkVwxfgtOwMhyuLQGfalUNr9zJ8=;
        b=lEVzoq7SGbENlRz59UXIIpJc9LqlpXbW1L4mrFStktI7lPRNzusP3VJPWwXBvPasJ2
         ITwhalziB2ntNWnZ8A75b9JaQQKwx7BL8oYRXdeeGoxUlzF4H/PCeUjVMNKCEKGj/K2+
         u87QPHkZVnUPS+NjMlG/wRsBlFhxhbcCzGfqj3GTlKUZgjXSvcSbBZ+BmLskUb6RB/iG
         UaE41KvYjYg4f1n/w1bHt5wx5ClH3rN2c7pvdyoAuETLTfFt6z91VLubp60g7jNdqLTz
         kTSAJzu+9fUQz7aO+1a5ygMQR7VcnmHeR/AzxvQdGw3gyROAYCEYJepbz3c6531GH18J
         j1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699518168; x=1700122968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6L9e4FIZCW/cWI4CMkVwxfgtOwMhyuLQGfalUNr9zJ8=;
        b=h2EuPeDHJ8SZt39YkT8IoJ2Uxah+z8Mf7ucedopenpnsmO823Cx3D3t3O8i/vE2xp5
         bdsWbdYnSZjw/QjxsGTEX0HT7YFBHucQ2zGFL2O0STphGdq4E6uh/Z9BzFn/Xsc1YNoF
         03E7dSTDhFYUpan0yoT1zpDd2xFLlNQoi9cjtpHpQ7nsBL9wpUcF9OhnD13AtsC9K7lC
         hubO2n6KelnqUwkpyonCpOhaJ3+Nb8UNSSfzWKo2yBpin8S7anPMLOvhP3k+qPoa6Bmx
         v4vz2OWZo3RTRRPSGLtjhbeQdZwikNQeYuqZWn+tKK05lFzFHYKbJdsx6XQmcSV35FSg
         Pq+g==
X-Gm-Message-State: AOJu0YyUTc4iNhwrBOerh+RaaxZxBJ5jvXA45c7jMGxYKd5ivz4xWo56
	s913qMLs5204QEKpY+UTSf6X8fJ0vp6GIRRVjjVHjw==
X-Google-Smtp-Source: AGHT+IHK4jz0hvKjL1UU+txgQCeQzgbTv4KRpSfNHNu6mKMYO3jCYjwyh6vF0R5mbSffwlvJKf1efA==
X-Received: by 2002:a5d:6dae:0:b0:32f:8372:dfe8 with SMTP id u14-20020a5d6dae000000b0032f8372dfe8mr3193845wrs.1.1699518168015;
        Thu, 09 Nov 2023 00:22:48 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:87b4:87b9:6476:5df7? ([2a01:e0a:999:a3a0:87b4:87b9:6476:5df7])
        by smtp.gmail.com with ESMTPSA id a6-20020a056000100600b0031984b370f2sm6817227wrx.47.2023.11.09.00.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 00:22:47 -0800 (PST)
Message-ID: <ef980c24-6901-4bb3-8a1b-5902675e7851@rivosinc.com>
Date: Thu, 9 Nov 2023 09:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: sud_test: return correct emulated syscall
 value on RISC-V
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: shuah@kernel.org, krisman@collabora.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <mhng-bd15a99e-2c1e-4f0e-95ff-b6f14fe26681@palmer-ri-x1c9>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <mhng-bd15a99e-2c1e-4f0e-95ff-b6f14fe26681@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_002249_677974_6DEC5637 
X-CRM114-Status: GOOD (  27.00  )
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

CgpPbiAwOS8xMS8yMDIzIDA0OjI2LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBPbiBXZWQsIDEz
IFNlcCAyMDIzIDA3OjA3OjExIFBEVCAoLTA3MDApLCBjbGVnZXJAcml2b3NpbmMuY29tIHdyb3Rl
Ogo+PiBDdXJyZW50bHksIHRoZSBzdWRfdGVzdCBleHBlY3RzIHRoZSBlbXVsYXRlZCBzeXNjYWxs
IHRvIHJldHVybiB0aGUKPj4gZW11bGF0ZWQgc3lzY2FsbCBudW1iZXIuIFRoaXMgYXNzdW1wdGlv
biBvbmx5IHdvcmtzIG9uIGFyY2hpdGVjdHVyZXMKPj4gd2VyZSB0aGUgc3lzY2FsbCBjYWxsaW5n
IGNvbnZlbnRpb24gdXNlIHRoZSBzYW1lIHJlZ2lzdGVyIGZvciBzeXNjYWxsCj4+IG51bWJlci9z
eXNjYWxsIHJldHVybiB2YWx1ZS4gVGhpcyBpcyBub3QgdGhlIGNhc2UgZm9yIFJJU0MtViBhbmQg
dGh1cwo+PiB0aGUgcmV0dXJuIHZhbHVlIG11c3QgYmUgYWxzbyBlbXVsYXRlZCB1c2luZyB0aGUg
cHJvdmlkZWQgdWNvbnRleHQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8
Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4gLS0tCj4+IMKgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
c3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0LmMgfCA4ICsrKysrKysrCj4+IMKgMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvc3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0LmMKPj4gYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9zeXNjYWxsX3VzZXJfZGlzcGF0Y2gvc3VkX3Rlc3QuYwo+PiBpbmRl
eCBiNWQ1OTJkNDA5OWUuLjFiNTU1M2MxOTcwMCAxMDA2NDQKPj4gLS0tIGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvc3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0LmMKPj4gKysrIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvc3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0LmMKPj4g
QEAgLTE1OCw2ICsxNTgsMTQgQEAgc3RhdGljIHZvaWQgaGFuZGxlX3NpZ3N5cyhpbnQgc2lnLCBz
aWdpbmZvX3QKPj4gKmluZm8sIHZvaWQgKnVjb250ZXh0KQo+Pgo+PiDCoMKgwqDCoCAvKiBJbiBw
cmVwYXJhdGlvbiBmb3Igc2lncmV0dXJuLiAqLwo+PiDCoMKgwqDCoCBTWVNDQUxMX0RJU1BBVENI
X09GRihnbG9iX3NlbCk7Cj4+ICsKPj4gK8KgwqDCoCAvKgo+PiArwqDCoMKgwqAgKiBNb2RpZnkg
aW50ZXJydXB0ZWQgY29udGV4dCByZXR1cm5lZCB2YWx1ZSBhY2NvcmRpbmcgdG8gc3lzY2FsbAo+
PiArwqDCoMKgwqAgKiBjYWxsaW5nIGNvbnZlbnRpb24KPj4gK8KgwqDCoMKgICovCj4+ICsjaWYg
ZGVmaW5lZChfX3Jpc2N2KQo+PiArwqDCoMKgICgodWNvbnRleHRfdCopdWNvbnRleHQpLT51Y19t
Y29udGV4dC5fX2dyZWdzW1JFR19BMF0gPQo+PiBNQUdJQ19TWVNDQUxMXzE7Cj4+ICsjZW5kaWYK
Pj4gwqB9Cj4+Cj4+IMKgVEVTVChkaXNwYXRjaF9hbmRfcmV0dXJuKQo+IAo+IEknbSBub3Qgc3Vy
ZSBpZiBJJ20ganVzdCB0aXJlZCwgYnV0IGl0IHRvb2sgbWUgYSB3aGlsZSB0byBmaWd1cmUgb3V0
IHdoeQo+IHRoaXMgd2FzIG5lY2Vzc2FyeS7CoCBJIHRoaW5rIHRoaXMgaXMgYSBiZXR0ZXIgZXhw
bGFuYXRpb246CgpJIHRoaW5rIGl0J3MgYmVjYXVzZSB0aGlzIG1lY2hhbmlzbSBkb2VzIG5vdCBi
ZWhhdmUgbGlrZSBvdGhlciBzeXNjYWxscwphdCBhbGwgYW5kIHRoZSBjbGFzc2ljIGNhbGxpbmcg
Y29udmVudGlvbiBkb2VzIG5vdCByZWFsbHkgYXBwbHkuLi4KCj4gCj4gwqDCoCBkaWZmIC0tZ2l0
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvc3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0
LmMKPiBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3N5c2NhbGxfdXNlcl9kaXNwYXRjaC9zdWRf
dGVzdC5jCj4gwqDCoCBpbmRleCBiNWQ1OTJkNDA5OWUuLmE5MTNmZDkwY2ZhMyAxMDA2NDQKPiDC
oMKgIC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3N5c2NhbGxfdXNlcl9kaXNwYXRjaC9z
dWRfdGVzdC5jCj4gwqDCoCArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zeXNjYWxsX3Vz
ZXJfZGlzcGF0Y2gvc3VkX3Rlc3QuYwo+IMKgwqAgQEAgLTE1OCw2ICsxNTgsMTYgQEAgc3RhdGlj
IHZvaWQgaGFuZGxlX3NpZ3N5cyhpbnQgc2lnLCBzaWdpbmZvX3QKPiAqaW5mbywgdm9pZCAqdWNv
bnRleHQpCj4gwqDCoCDCoMKgwqDCoMKgwqDCoCAvKiBJbiBwcmVwYXJhdGlvbiBmb3Igc2lncmV0
dXJuLiAqLwo+IMKgwqDCoMKgwqDCoMKgIFNZU0NBTExfRElTUEFUQ0hfT0ZGKGdsb2Jfc2VsKTsK
PiDCoMKgICvCoMKgwqAgLyoKPiDCoMKgICvCoMKgwqDCoCAqIFRoZSB0ZXN0cyBmb3IgYXJndW1l
bnQgaGFuZGxpbmcgYXNzdW1lIHRoYXQgYHN5c2NhbGwoeCkgPT0KPiB4YC7CoCBUaGlzCj4gwqDC
oCArwqDCoMKgwqAgKiBpcyBhIE5PUCBvbiB4ODYgYmVjYXVzZSB0aGUgc3lzY2FsbCBudW1iZXIg
aXMgcGFzc2VkIGluICVyYXgsCj4gd2hpY2gKPiDCoMKgICvCoMKgwqDCoCAqIGhhcHBlbnMgdG8g
YWxzbyBiZSB0aGUgZnVuY3Rpb24gQUJJIHJldHVybiByZWdpc3Rlci7CoCBPdGhlcgo+IMKgwqAg
K8KgwqDCoMKgICogYXJjaGl0ZWN0dXJlcyBtYXkgbmVlZCB0byBzd2l6emxlIHRoZSBhcmd1bWVu
dHMgYXJvdW5kLgo+IMKgwqAgK8KgwqDCoMKgICovCgpJbmRlZWQsIHRoYXQgaXMgbW9yZSBjbGVh
ci4gU2hvdWxkIEkgc2VuZCBhIHYyID8KCj4gwqDCoCArI2lmIGRlZmluZWQoX19yaXNjdikKPiDC
oMKgICvCoMKgwqAgKHVjb250ZXh0X3QqKXVjb250ZXh0KS0+dWNfbWNvbnRleHQuX19ncmVnc1tS
RUdfQTBdID0KPiDCoMKgICvCoMKgwqDCoMKgwqDCoCAodWNvbnRleHRfdCopdWNvbnRleHQpLT51
Y19tY29udGV4dC5fX2dyZWdzW1JFR19BN107Cj4gwqDCoCArI2VuZGlmCj4gwqDCoMKgIH0KPiDC
oMKgIMKgwqDCoCBURVNUKGRpc3BhdGNoX2FuZF9yZXR1cm4pCj4gCj4gYnV0IGFsc28KPiAKPiBS
ZXZpZXdlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gQWNrZWQt
Ynk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+IAo+IGFzIEkgYWdyZWUg
dGhpcyBpcyBjb3JyZWN0Lgo+IAo+IGFsc286IHdvdWxkbid0IGFybTY0IGFsc28gbmVlZCB0byBt
b3ZlIHg4IGludG8geDAgaGVyZSwgZm9yIGVzc2VudGlhbGx5Cj4gdGhlIHNhbWUgcmVhc29uIGFz
IHdlIGRvPwoKWWVzLCBhcyB3ZWxsIGFzIGZvciBhIGJ1bmNoIG9mIG90aGVyIGFyY2hpdGVjdHVy
ZXMuIEkgc3VzcGVjdCB0aGlzIGhhcwpvbmx5IGJlZW4gdGVzdGVkIG9uIHg4Ni4gQUZBSUssIHRo
aXMgZmVhdHVyZSBpcyBtYWlubHkgZm9yIHdpbmUgdXNhZ2UKd2hpY2ggdGhlbiBtYWtlcyBzZW5z
ZSBmb3IgeDg2IGFuZCBnYW1lcy4KClRoYW5rcywKCkNsw6ltZW50CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
