Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DB9C36002
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 08:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J5lrGom4C3G6OFvavmiESKxovqz+2RCkhyavGhmgkY0=; b=OBWtMhEZIp4ZGD
	ICMGMVcOptoKaox5w8d35kmabEhJRD/QB+PbJttqUCXC1EWsRiVCfXoz00U1mplbCPdiv/mgrhDqX
	7/M8y1JFIyfXaztdLFhZrQfFd8NfMeOLdHgdoMLONuUMQ6Zyjh+QK117oJQSaSpVqs6lTm171RmXF
	XT66G0OdPk9XMi26dImE0t+CT7bEUcqMCXppX/7E8FUcDDrIsQngOgvSznhe7yX0kfiJxHmkuqELX
	7CVYHlToarUYPhfhl6vrvBTYp6K/D49FMEAHAzGlr89YFiJ5mpK19J+VDp88uoMXlRSbRWLgIE4wv
	pwXbgpX/mQIO+xmUoStw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twdJN-00000002beF-1q8W;
	Mon, 24 Mar 2025 08:37:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twdJK-00000002bdP-1yuM
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 08:37:31 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22435603572so69651995ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Mar 2025 01:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742805449; x=1743410249; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2s6YbLy4nW+jYW+2j4zgOCotGnhPTE4p9OSJFGAI4n8=;
        b=c5dIc7lON2VcFOS9DYaMq+qfQ/hiubHJWDlhDICUmhNnxj8ZoTZUWiC9zz8VVDKaen
         8f7bmQJ46KcTC2d+Uqrbyz/xF7FrdUEOd2zGIMcyVhRhjTvXbipaek3QqU8/eZq8iCA/
         9+eqUNC2URg5s75eXshQL8SM0OpcT11FpDBRSIDnEKt8PzYb6tm6ir7A1ITRQSsSkpIT
         MMLu4eyzcaVfn/bi9j7SokKDADvLkwFSVC6QB9p/NJjSrWXM5f4wHASsRQU6fGFNVUMB
         GsUdA2FZILNjPqqo3N/OXykHmeAT0L2OSLKz+XLlJYKQwiy+GyRahz0TAqfv3eGphNhy
         s0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742805449; x=1743410249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2s6YbLy4nW+jYW+2j4zgOCotGnhPTE4p9OSJFGAI4n8=;
        b=CXu8oyEDv9RTikiJjArLbm2NDotg5q91+pVfW+vfEZLAtbE7GXblVGMX64DiNmy8y2
         031G6NqhxAPEkclNunaEPKDA2GkUcEgPB8eDUou2w5kIjaOBx3GTrjXCStzRp8KIqbH5
         U2qqllcZ/GypgIIViTHPqqVDed7kdqD8fpOhkwXRWQuQ2UuvdN2aZMyxxDBEELW7ww10
         P6+HXYL5HcQy2coLtHyzlTbQ4THFGV0hBZVPz8EAwDHRDqy0rqqfmEYdn+Tju4tOavlI
         Dv1gT7mfs8kqPZsgYbrI1Uu0C/L+0e3et9P/wpHX5BtFDzwfalZPkbf6CwRf6VVRf95Z
         efKw==
X-Forwarded-Encrypted: i=1; AJvYcCUJQFJXWfJdrTWnVW9zPsnNey9aaK7OaxPp/xWKTtwWC8wQ/D8+iMUensqNlwfaugYbfmmjFWnzAopdTA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4UAlBaMSIImyFTWuurvM8JnyPNy8S3KkFvq861pjAUIIl033c
	QdR+Rsa0Oq2uRPILmJp2tgKM+26VbgjWQLs7H+EHWuACllkTuR7abYK/400zpzI=
X-Gm-Gg: ASbGncuu3Hbo4NCaPZ2g/UmA3wh6HqNQ5RpAcEAScd1zG67TduKebLAaEvsr/IqmaoR
	xgCCnxNiJY1wZ+XjlrxVgS5dYCfOa8jXk1V/0c5BJledhXjJUzMJbFGAlnWNdjd0Od+x9BpRSDt
	zkaHRkc74vJnMmPf/eddTzBOm8qLrAPiwDbdX6EFJ63sWr36Y5xR317Xc2ZVMudpdAx36w09/Uz
	cMuvhvM0doTDX1AIcbXbPFTubCszJt2YquBM3WXsQkDljBpBU9iVl6KHvqRZu0ADn3ka7QeIUXH
	8BCEyGoWIgTOkkMr5hEWPO7drnjowceM6aIE+nBR5anM+XV4Fd0+ISeGJ+Uk/WM2w+1BSv/X9NG
	PmqUbVdFqPbwSXA==
X-Google-Smtp-Source: AGHT+IGyDIlFsMFtDafxJbgUfgP/qTb6rCAL5yHNPveThhrNUx+dqUwr1+vxGkhJvulgvlhTLqQIxQ==
X-Received: by 2002:a05:6a21:7a90:b0:1f5:902e:1e97 with SMTP id adf61e73a8af0-1fe4331934bmr20590058637.41.1742805449356;
        Mon, 24 Mar 2025 01:37:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fa980asm7587742b3a.11.2025.03.24.01.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 01:37:28 -0700 (PDT)
Message-ID: <ea14978a-f29f-45a2-acff-5585c81f4ca6@rivosinc.com>
Date: Mon, 24 Mar 2025 09:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/18] riscv: sbi: add SBI FWFT extension calls
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
 <20250317170625.1142870-5-cleger@rivosinc.com>
 <20250322-62ad16eaf41abd98170fa6bb@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250322-62ad16eaf41abd98170fa6bb@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_013730_518387_97110698 
X-CRM114-Status: GOOD (  18.64  )
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

CgpPbiAyMi8wMy8yMDI1IDEzOjE0LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MTcsIDIwMjUgYXQgMDY6MDY6MTBQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBB
ZGQgRldGVCBleHRlbnNpb24gY2FsbHMuIFRoaXMgd2lsbCBiZSByYXRpZmllZCBpbiBTQkkgVjMu
MCBoZW5jZSwgaXQgaXMKPj4gcHJvdmlkZWQgYXMgYSBzZXBhcmF0ZSBjb21taXQgdGhhdCBjYW4g
YmUgbGVmdCBvdXQgaWYgbmVlZGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6ln
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvc2Jp
LmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+PiBpbmRleCBk
NDFhNTY0MmJlMjQuLjU0ZDljZWI3YjcyMyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvc2JpLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPj4gQEAgLTI5OSw2ICsy
OTksOCBAQCBzdGF0aWMgaW50IF9fc2JpX3JmZW5jZV92MDIoaW50IGZpZCwgY29uc3Qgc3RydWN0
IGNwdW1hc2sgKmNwdV9tYXNrLAo+PiAgCXJldHVybiAwOwo+PiAgfQo+PiAgCj4+ICtzdGF0aWMg
Ym9vbCBzYmlfZndmdF9zdXBwb3J0ZWQ7Cj4+ICsKPj4gIC8qKgo+PiAgICogc2JpX2Z3ZnRfZ2V0
KCkgLSBHZXQgYSBmZWF0dXJlIGZvciB0aGUgbG9jYWwgaGFydAo+PiAgICogQGZlYXR1cmU6IFRo
ZSBmZWF0dXJlIElEIHRvIGJlIHNldAo+PiBAQCAtMzA4LDcgKzMxMCwxNSBAQCBzdGF0aWMgaW50
IF9fc2JpX3JmZW5jZV92MDIoaW50IGZpZCwgY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdV9tYXNr
LAo+PiAgICovCj4+ICBpbnQgc2JpX2Z3ZnRfZ2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25n
ICp2YWx1ZSkKPj4gIHsKPj4gLQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4+ICsJc3RydWN0IHNiaXJl
dCByZXQ7Cj4+ICsKPj4gKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRlZCkKPj4gKwkJcmV0dXJuIC1F
T1BOT1RTVVBQOwo+PiArCj4+ICsJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfRldGVCwgU0JJX0VY
VF9GV0ZUX0dFVCwKPj4gKwkJCWZlYXR1cmUsIDAsIDAsIDAsIDAsIDApOwo+IAo+IFdlJ3JlIG1p
c3NpbmcgdGhlCj4gCj4gIGlmICghcmV0KQo+ICAgICAqdmFsdWUgPSByZXQudmFsdWU7Cj4gCj4g
cGFydC4KCkRhbW4sIGFuZCBldmVuIHdvcnNlIGl0IGlzbid0IHVzZWQgYXQgYWxsLiBJJ2xsIHBy
b2JhYmx5IHJlbW92ZSBpdAplbnRpcmVseSBhbmQga2VlcCB0aGUgc3RyaWN0IG1pbmltdW0gZm9y
IHRoaXMgc2VyaWVzLgoKVGhhbmtzLAoKQ2zDqW1lbnQKCj4gCj4+ICsKPj4gKwlyZXR1cm4gc2Jp
X2Vycl9tYXBfbGludXhfZXJybm8ocmV0LmVycm9yKTsKPj4gIH0KPj4gIAo+PiAgLyoqCj4+IEBA
IC0zMjEsNyArMzMxLDE1IEBAIGludCBzYmlfZndmdF9nZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVk
IGxvbmcgKnZhbHVlKQo+PiAgICovCj4+ICBpbnQgc2JpX2Z3ZnRfc2V0KHUzMiBmZWF0dXJlLCB1
bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25nIGZsYWdzKQo+PiAgewo+PiAtCXJldHVy
biAtRU9QTk9UU1VQUDsKPj4gKwlzdHJ1Y3Qgc2JpcmV0IHJldDsKPj4gKwo+PiArCWlmICghc2Jp
X2Z3ZnRfc3VwcG9ydGVkKQo+PiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4+ICsKPj4gKwlyZXQg
PSBzYmlfZWNhbGwoU0JJX0VYVF9GV0ZULCBTQklfRVhUX0ZXRlRfU0VULAo+PiArCQkJZmVhdHVy
ZSwgdmFsdWUsIGZsYWdzLCAwLCAwLCAwKTsKPj4gKwo+PiArCXJldHVybiBzYmlfZXJyX21hcF9s
aW51eF9lcnJubyhyZXQuZXJyb3IpOwo+PiAgfQo+PiAgCj4+ICBzdHJ1Y3QgZndmdF9zZXRfcmVx
IHsKPj4gQEAgLTM2MCw2ICszNzgsOSBAQCBpbnQgc2JpX2Z3ZnRfbG9jYWxfc2V0X2NwdW1hc2so
Y29uc3QgY3B1bWFza190ICptYXNrLCB1MzIgZmVhdHVyZSwKPj4gIAkJLmVycm9yID0gQVRPTUlD
X0lOSVQoMCksCj4+ICAJfTsKPj4gIAo+PiArCWlmICghc2JpX2Z3ZnRfc3VwcG9ydGVkKQo+PiAr
CQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4+ICsKPj4gIAlpZiAoZmVhdHVyZSAmIFNCSV9GV0ZUX0dM
T0JBTF9GRUFUVVJFX0JJVCkKPj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4+ICAKPj4gQEAgLTY5MSw2
ICs3MTIsMTEgQEAgdm9pZCBfX2luaXQgc2JpX2luaXQodm9pZCkKPj4gIAkJCXByX2luZm8oIlNC
SSBEQkNOIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7Cj4+ICAJCQlzYmlfZGVidWdfY29uc29sZV9h
dmFpbGFibGUgPSB0cnVlOwo+PiAgCQl9Cj4+ICsJCWlmICgoc2JpX3NwZWNfdmVyc2lvbiA+PSBz
YmlfbWtfdmVyc2lvbigzLCAwKSkgJiYKPj4gKwkJICAgIChzYmlfcHJvYmVfZXh0ZW5zaW9uKFNC
SV9FWFRfRldGVCkgPiAwKSkgewo+PiArCQkJcHJfaW5mbygiU0JJIEZXRlQgZXh0ZW5zaW9uIGRl
dGVjdGVkXG4iKTsKPj4gKwkJCXNiaV9md2Z0X3N1cHBvcnRlZCA9IHRydWU7Cj4+ICsJCX0KPj4g
IAl9IGVsc2Ugewo+PiAgCQlfX3NiaV9zZXRfdGltZXIgPSBfX3NiaV9zZXRfdGltZXJfdjAxOwo+
PiAgCQlfX3NiaV9zZW5kX2lwaQk9IF9fc2JpX3NlbmRfaXBpX3YwMTsKPj4gLS0gCj4+IDIuNDcu
Mgo+Pgo+IAo+IFRoYW5rcywKPiBkcmV3CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
