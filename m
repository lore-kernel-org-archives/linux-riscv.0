Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D84BC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 08:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TGHoxL84PF9NB3wGb9/5D+BMwhLs0XZZKZtybZqy0Uo=; b=3rzp89uB1xE76W
	TWhAdU0A3lWxI2tJ2bc/9OGO3Q68z9wGb2JchLXiRoC6cBXnKulvmg3f0DBAzXWJ+1g0SpgnzAXcJ
	l1K8LCUX582Kmz8wZxbA43PAyG4l8qOsoXTkmW/VLYKuIpxpOj3Y0hxUjOGR0ukg1Fk6sVX/Yi6Tc
	spGUUfxm8YOJ/rpcvzG2zRAq5T2BgWlkZVga9fudCOSkB58ElS5m8zDEEjKeOhymkyzOOoQ767Vhg
	LNAcM+lsXT26Qpgr5+4wGvvwRTwLlnQBQhL/Luspp4bBi4TSlYkp1Lau1upHZdmxgjVwAbixkFYIE
	/QDtexa/0lcNwP1V6fBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZo7p-00000008AzH-2Sb2;
	Fri, 02 Aug 2024 08:59:01 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZo7m-00000008AyK-2TQl
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 08:59:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 281D91C000E;
	Fri,  2 Aug 2024 08:58:51 +0000 (UTC)
Message-ID: <0abc375c-61a1-4b8c-bac5-a5dc170c5fb6@ghiti.fr>
Date: Fri, 2 Aug 2024 10:58:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] riscv: Add qspinlock support
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrea Parri <parri.andrea@gmail.com>, Nathan Chancellor
 <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
 Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-14-alexghiti@rivosinc.com>
 <20240731-ce25dcdc5ce9ccc6c82912c0@orel>
 <CAHVXubhQefQ6i3Vow_p-uSACQyPcMJNC2UwB99xt_=jDtRUDFw@mail.gmail.com>
 <20240801-e773d3752fe8b5484405d404@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240801-e773d3752fe8b5484405d404@orel>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_015858_782957_1DCC396B 
X-CRM114-Status: GOOD (  17.05  )
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

Ck9uIDAxLzA4LzIwMjQgMTI6MTUsIEFuZHJldyBKb25lcyB3cm90ZToKPiBPbiBUaHUsIEF1ZyAw
MSwgMjAyNCBhdCAxMDo0MzowM0FNIEdNVCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IC4uLgo+
Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmljL3FzcGlubG9jay5oIGIvaW5jbHVk
ZS9hc20tZ2VuZXJpYy9xc3BpbmxvY2suaAo+Pj4+IGluZGV4IDA2NTVhYTViNTdiMi4uYmY0N2Nj
YTJjMzc1IDEwMDY0NAo+Pj4+IC0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvcXNwaW5sb2NrLmgK
Pj4+PiArKysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL3FzcGlubG9jay5oCj4+Pj4gQEAgLTEzNiw2
ICsxMzYsNyBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgdmlydF9zcGluX2xvY2soc3Ry
dWN0IHFzcGlubG9jayAqbG9jaykKPj4+PiAgIH0KPj4+PiAgICNlbmRpZgo+Pj4+Cj4+Pj4gKyNp
Zm5kZWYgX19ub19hcmNoX3NwaW5sb2NrX3JlZGVmaW5lCj4+PiBJJ20gbm90IHN1cmUgd2hhdCdz
IGJldHRlci93b3JzZSwgYnV0IGluc3RlYWQgb2YgaW52ZW50aW5nIHRoaXMKPj4+IF9fbm9fYXJj
aF9zcGlubG9ja19yZWRlZmluZSB0aGluZyB3ZSBjb3VsZCBqdXN0IG5hbWUgYWxsIHRoZSBmdW5j
dGlvbnMKPj4+IHNvbWV0aGluZyBsaWtlIF9fYXJjaF9zcGluKiBhbmQgdGhlbiBhZGQgZGVmaW5l
cyBmb3IgYm90aCB0byBhc20vc3BpbmxvY2suaCwKPj4+IGkuZS4KPj4+Cj4+PiAjZGVmaW5lIHF1
ZXVlZF9zcGluX2xvY2sobCkgX19hcmNoX3NwaW5fbG9jayhsKQo+Pj4gLi4uCj4+Pgo+Pj4gI2Rl
ZmluZSB0aWNrZXRfc3Bpbl9sb2NrKGwpIF9fYXJjaF9zcGluX2xvY2sobCkKPj4+IC4uLgo+PiBf
X2FyY2hfc3Bpbl9sb2NrKCkgd291bGQgdXNlIHF1ZXVlZF9zcGluX2xvY2soKSBzbyB0aGF0IHdv
dWxkIG1ha2UgYW4KPj4gImluZmluaXRlIHJlY3Vyc2l2ZSBkZWZpbml0aW9uIiByaWdodD8gQW5k
IHRoYXQgd291bGQgb3ZlcnJpZGUgdGhlCj4+ICJyZWFsIiBxdWV1ZWRfc3Bpbl9sb2NrKCkgaW1w
bGVtZW50YXRpb24gdG9vLgo+Pgo+PiBCdXQgbWF5YmUgSSBtaXNzZWQgc29tZXRoaW5nIQo+Pgo+
IEl0IGRlcGVuZHMgb24gd2hlcmUgdGhlIGRlZmluaXRpb24gaXMgZG9uZS4gSXQgc2hvdWxkIHdv
cmsgaWYgdGhlCj4gcHJlcHJvY2Vzc29yIGV4cGFuZHMgdGhlIGltcGxlbWVudGF0aW9uIG9mIF9f
YXJjaF9zcGluXyogYmVmb3JlCj4gZXZhbHVhdGluZyB0aGUgI2RlZmluZSBvZiBxdWV1ZWRfc3Bp
bl8qLiBJT1csIHdlIGp1c3QgbmVlZCB0byBwdXQKPiB0aGUgZGVmaW5lcyBhZnRlciB0aGUgc3Rh
dGljIGlubGluZSBjb25zdHJ1Y3Rpb25zLgoKClNvIEkgaGF2ZSBqdXN0IGdpdmVuIGl0IGEgdHJ5
LCBib3RoIHFzcGlubG9jay5oIGFuZCB0aWNrZXRfc3BpbmxvY2suaCAKZGVmaW5lIGFyY2hfc3Bp
bl9YWFhYKCkuIFRoYXQgdHJpZ2dlcnMgYSBidW5jaCBvZiB3YXJuaW5ncy4KCkknbGwgZHJvcCB0
aGlzIHN1Z2dlc3Rpb24gYXMgSSBmaW5kIGl0IGhhcmRlciB0byB1bmRlcnN0YW5kIGFuZCBiZWNh
dXNlIApvZiB0aGUgd2FybmluZ3MgdGhhdCB3b3VsZCBuZWVkIHRoZSBpbnRyb2R1Y3Rpb24gb2Yg
YSBuZXcgcHJlcHJvY2Vzc29yIAp2YXJpYWJsZSAob3Igc29tZXRoaW5nIGVsc2U/KS7CoCBBbmQg
dGhlIHNvbHV0aW9uIHdpdGggCl9fbm9fYXJjaF9zcGlubG9ja19yZWRlZmluZSBpcyByZWFsbHkg
c3RyYWlnaHRmb3J3YXJkIGFuZCBsaWdodHdlaWdodC4KClRoYW5rcywKCkFsZXgKCgo+Cj4gVGhh
bmtzLAo+IGRyZXcKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
