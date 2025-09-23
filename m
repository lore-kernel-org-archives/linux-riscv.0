Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AA5CAC5B0
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 12:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jT+QR9kULefOGjZQwNnlwvaqMiddxzWIBtPZFe9aZY=; b=zX2jTkojgjqTs+
	8DisfTwMgYg/d+YoXAw4oa0uE0Kd1z0fbIIdktXwkVQs2YQL6jwi+p9z5lIyuqma9j0y5JwotJSHo
	G8ZLPSZOMbz99TFOfGV0kSozG4R07sfy8hmr3wkr24puMg4MBpOLwLkq66bUy97Y54mjS4Oa0tJM1
	FtKMmvhEVbcI/WfQInEGf+vW8cRFMP0eVhTOCv+z72EsJ7LRPuIbL6hqo0/7zhLEDOwnmvcvFS8Tv
	alqBy/5Vhm7ssS0Rb588pCkXlJvX7mn4ORbNUXNMxoPG5PBJmpuLTPXsVNmFwuxujCZxyUL6KnaCL
	pfxmqNfApYNMjibs4DRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12Si-0000000DLSi-0WA3;
	Tue, 23 Sep 2025 12:49:40 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12Sf-0000000DLR6-2NKn
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 12:49:38 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-8eeeeb37cc5so5568939f.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Sep 2025 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758631777; x=1759236577; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBPJgYIx7v6+v01N0CRR0tlRD9SDBXZtLGM0u4Al3EM=;
        b=EgvkKqxrLjVSjhI13nz+kIYVKVs9TazORtkkeQrC45Hariiu48rpea3Luae8ipFrlR
         kRXtrkz9FssM+NS8q89fDoIlc4GGtJ2RftreTILkH4KCHlDX2B/Cs03O3Fou9tf58IvW
         QRZwovkqWtDe7x9K28wbPhxMeWOf7SgVSCpDN0PrE0D2ATap72chtzEAGtjfm+G/G5/J
         Xl0emnfDtWjGCf368Sdr0MNxzjKSHeFJii5g9f+94X79Sw8sLHtiW1RnbDOCFl5eFKoH
         bKOLLwpkAKWBHoVDqf9cWv8AunOarBwLEhrN6WHikJIi4V9rP9vfiDm+Fjbujv8jJCPS
         HBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758631777; x=1759236577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBPJgYIx7v6+v01N0CRR0tlRD9SDBXZtLGM0u4Al3EM=;
        b=wcVWEL4WK5jd2eLgdiPhc9iws9xaly6DcQss0lgSwe0ryFf5UDPl4iQsMqkPojwnSy
         Hio7p6ThWCkc6Pi6F2YdJGhOUkszt89kHJWu09/dXxbzBqrq4OMypDO9Jl6UNxz8G+AK
         u4n/WWYnKY6c1Hq/gDvY/4j2PGQO6xtrQANLxxnGew8pzHv8jfoYqBa8/n+68xHcuXIB
         Q2Zo0rZY9GPpXL3YZg57uc8c7jF70bZQ5JBe5dCGLnAsP0wPQgkwIZkbCB1n6xI3zAIf
         SN62WSTvHV3TVU210+ak1J+n3ELQFC6lA6q9TJoacGO/nz7UFdNhjpsB1ZbbndiNSMyw
         25ag==
X-Forwarded-Encrypted: i=1; AJvYcCVM/e0hvKeXYc29Kg2eE7/8tg+w2kauoZ5sbrxKvSKTRppuqTg4U1whpbIBn43WJEhfrJdG/igl5JKyGA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0Td7IQ4jo/5/P7nG+9F6xGA39I5hQdS7HGEnOoSGjS5utSnsK
	XpKuWUKGFiUvkQs2Xi/vF2ClisSsjwkaOiQtnTRsqC2HVOjMIq6BSqmrz1+PkhQoAdM=
X-Gm-Gg: ASbGnctfpYiJJj833Ul4fED7cDZUPfY9ioxG3DSIxRI6pHd9qjKSfm/Mz8TQEmfMhOE
	o6qNCKR3x1wr55w5KJ3J0YmZg8ylA0bjifzEJnCCzCyaUqfbnDfVpDrzGdCeqzSfYMb2mhxSBGo
	OjXqNokQUHQnXrZJG/4mwAKxeBPP7vna1OBFA3KAKglFXjwFUmgjk0FkEEqFaGKUOwLs2BO+FkX
	A9/9J0+s2//gf2dQyDFQFEGmK7OXUT1FwFZwb9tgEQaChYJ9zd5WsTOYIyymkla6ZJE4K0aZ+SC
	bP/BDTmjenLxEEQu56e8FaN/V6xbbYsap1kRM8mrq1MNAwSKkjfIDL+oEcgEkzCjrJWZINuJRnx
	7ZP5O6Wmz4+vdVgQKNPzlt4FQkN1JzpnKvGMPNsngl7Dao6U4UGHHdCNYV9ENMw==
X-Google-Smtp-Source: AGHT+IHYa5DWzxweqTSWrCllRHx+UhSsxFOlpmwhlInRnbMBAW55bHyqIh4dQEHaUgu4d93X0h+kNg==
X-Received: by 2002:a5d:93c1:0:b0:884:1e28:904e with SMTP id ca18e2360f4ac-8e1d1a12e35mr361506139f.12.1758631776567;
        Tue, 23 Sep 2025 05:49:36 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-556f74174cfsm3556602173.57.2025.09.23.05.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 05:49:35 -0700 (PDT)
Message-ID: <1aa28123-cfa4-415a-9d1b-4d9edd62489b@riscstar.com>
Date: Tue, 23 Sep 2025 07:49:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: define a SPI controller node
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250922161717.1590690-1-elder@riscstar.com>
 <20250922161717.1590690-4-elder@riscstar.com>
 <20250923001930-GYB1303776@gentoo.org>
 <ED4C67FD136DEB19+aNINJJVYbNnT87va@LT-Guozexi>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <ED4C67FD136DEB19+aNINJJVYbNnT87va@LT-Guozexi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_054937_618740_662A5E93 
X-CRM114-Status: GOOD (  26.81  )
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

T24gOS8yMi8yNSA5OjU5IFBNLCBUcm95IE1pdGNoZWxsIHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDIz
LCAyMDI1IGF0IDA4OjE5OjMwQU0gKzA4MDAsIFlpeHVuIExhbiB3cm90ZToKPj4gSGkgQWxleCwK
Pj4KPj4gT24gMTE6MTcgTW9uIDIyIFNlcCAgICAgLCBBbGV4IEVsZGVyIHdyb3RlOgo+Pj4gRGVm
aW5lIGEgbm9kZSBmb3IgdGhlIGZvdXJ0aCBTb0MgU1BJIGNvbnRyb2xsZXIgKG51bWJlciAzKSBv
bgo+Pj4gdGhlIFNwYWNlbWlUIEsxIFNvQy4KPj4+Cj4+PiBFbmFibGUgaXQgb24gdGhlIEJhbmFu
YSBQaSBCUEktRjMgYm9hcmQsIHdoaWNoIGV4cG9zZXMgdGhpcyBmZWF0dXJlCj4+PiB2aWEgaXRz
IEdQSU8gYmxvY2s6Cj4+PiAgICBHUElPIFBJTiAxOTogIE1PU0kKPj4+ICAgIEdQSU8gUElOIDIx
OiAgTUlTTwo+Pj4gICAgR1BJTyBQSU4gMjM6ICBTQ0xLCj4+PiAgICBHUElPIFBJTiAyNDogIFNT
IChpbnZlcnRlZCkKCk5vdGUgdGhhdCB0aGUgcGluIG51bWJlcnMgSSdtIG1lbnRpb25pbmcgYWJv
dmUgYXJlIHRoZSBudW1iZXJzCigxLTI2KSBvbiB0aGUgMjYtcGluIEdQSU8gaGVhZGVyIG9uIHRo
ZSBCUEktRjMgYm9hcmQuCgo+Pj4KPj4+IERlZmluZSBwaW5jb250cm9sIGNvbmZpZ3VyYXRpb25z
IGZvciB0aGUgcGlucyBhcyB1c2VkIG9uIHRoYXQgYm9hcmQuCj4+Pgo+Pj4gKFRoaXMgd2FzIHRl
c3RlZCB1c2luZyBhIEdpZ2FEZXZpY2UgR0QyNVE2NEUgU1BJIE5PUiBjaGlwLikKPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBBbGV4IEVsZGVyIDxlbGRlckByaXNjc3Rhci5jb20+Cj4+PiAtLS0KPj4+
IHYzOiAtIE1vdmVkIHRoZSBTUEkgY29udHJvbGxlciBpbnRvIHRoZSBkbWEtYnVzIG1lbW9yeSBy
ZWdpb24KPj4+Cj4+PiAgIC4uLi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMg
ICAgICB8ICA3ICsrKysrKysKPj4+ICAgYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1w
aW5jdHJsLmR0c2kgIHwgMjAgKysrKysrKysrKysrKysrKysrKwo+Pj4gICBhcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NwYWNlbWl0L2sxLmR0c2kgICAgICAgICAgfCAxNiArKysrKysrKysrKysrKysKPj4+
ICAgMyBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzIGIvYXJjaC9y
aXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMKPj4+IGluZGV4IDJhYWFm
Zjc3ODMxZTEuLmQ5ZDg2NWZiZTMyMGUgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9ib290
L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMKPj4+IEBAIC0xNCw2ICsxNCw3IEBAIGFs
aWFzZXMgewo+Pj4gICAJCWV0aGVybmV0MCA9ICZldGgwOwo+Pj4gICAJCWV0aGVybmV0MSA9ICZl
dGgxOwo+Pj4gICAJCXNlcmlhbDAgPSAmdWFydDA7Cj4+PiArCQlzcGkzID0gJnNwaTM7Cj4+PiAg
IAl9Owo+Pj4gICAKPj4+ICAgCWNob3NlbiB7Cj4+PiBAQCAtOTIsNiArOTMsMTIgQEAgJnBkbWEg
ewo+Pj4gICAJc3RhdHVzID0gIm9rYXkiOwo+Pj4gICB9Owo+Pj4gICAKPj4+ICsmc3BpMyB7Cj4+
PiArCXBpbmN0cmwtMCA9IDwmc3NwM18wX2NmZz47Cj4+PiArCXBpbmN0cmwtbmFtZXMgPSAiZGVm
YXVsdCI7Cj4+PiArCXN0YXR1cyA9ICJva2F5IjsKPj4+ICt9Owo+Pj4gKwo+Pj4gICAmdWFydDAg
ewo+Pj4gICAJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKPj4+ICAgCXBpbmN0cmwtMCA9IDwm
dWFydDBfMl9jZmc+Owo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2Vt
aXQvazEtcGluY3RybC5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1waW5j
dHJsLmR0c2kKPj4+IGluZGV4IGFmZjE5Yzg2ZDVmZjMuLjIwNWMyMDFhMzAwNWMgMTAwNjQ0Cj4+
PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLXBpbmN0cmwuZHRzaQo+Pj4g
KysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1waW5jdHJsLmR0c2kKPj4+IEBA
IC03Niw0ICs3NiwyNCBAQCBwd20xNC0xLXBpbnMgewo+Pj4gICAJCQlkcml2ZS1zdHJlbmd0aCA9
IDwzMj47Cj4+PiAgIAkJfTsKPj4+ICAgCX07Cj4+PiArCj4+PiArCXNzcDNfMF9jZmc6IHNzcDMt
MC1jZmcgewo+PiAuLgo+Pj4gKwkJc3NwMy0wLW5vLXB1bGwtcGlucyB7Cj4+IEknZCBwcmVmZXIg
bm90IHRvIGVuZm9yY2UgInB1bGwiIGluZm8gaW5zaWRlIHRoZSBuYW1lLCB5b3UgY2FuJ3QgZW1i
ZWQKPj4gYWxsIHByb3BlcnR5IGluZm8sIGJlc2lkZXMsIHdoYXQncyBpZiB5b3Ugd2FudCB0byBj
aGFuZ2Uvb3ZlcnJpZGUgbGF0ZXI/Cj4+Cj4+IGhvdyBhYm91dCBqdXN0IG5hbWUgaXQgYXMgc3Nw
My0wLWRlZmF1bC1waW5zIG9yIHNpbXBseSBzc3AzLTAtcGlucz8KPiB1YXJ0OiB1YXJ0MF8yX2Nm
ZyBhbmQgZnVuY3Rpb24gaXMgMi4KPiBwd206IHB3bTE0XzFfY2ZnIGFuZCBmdW5jdGlvbiBpcyA0
Cj4gc3BpOiBzc3AzXzBfY2ZnIGFuZCBmdW5jdGlvbiBpcyAyCj4gCj4gSeKAmW0gYSBiaXQgY29u
ZnVzZWQgYWJvdXQgdGhlIG1lYW5pbmcgb2YgdGhlIHNlY29uZCBudW1iZXIgaGVyZS4KPiBJcyBp
dCBpbnRlbmRlZCB0byBiZSBhbiBpbmRleCwgb3IgdGhlIGZ1bmN0aW9uIG51bWJlcj8KCkl0IGlz
IGFuIGluZGV4LCBhbmQgaXQgc2VlbXMgYXJiaXRyYXJ5IGJ1dCBpdCBpcyBiYXNlZCBvbiB0aGUK
b3JkZXIgaW4gd2hpY2ggdGhleSBvY2N1ciBpbiBhIHNwcmVhZHNoZWV0IHRoYXQgZGVmaW5lcyBh
IHNldApvZiBwb3NzaWJsZSBwaW4gY29uZmlndXJhdGlvbnMuCgpGb3IgZXhhbXBsZSwgU1BJMyBs
aXN0cyAyIHBvc3NpYmxlIHBpbiBjb21iaW5hdGlvbnM6ClNDTEsJR1BJT1s3NV0gZnVuY3Rpb24g
MglHUElPWzU5XSBmdW5jdGlvbiAyCkZSTQlHUElPWzc2XSBmdW5jdGlvbiAyCUdQSU9bNjBdIGZ1
bmN0aW9uIDIKVFhECUdQSU9bNzddIGZ1bmN0aW9uIDIJR1BJT1s2MV0gZnVuY3Rpb24gMgpSWEQJ
R1BJT1s3OF0gZnVuY3Rpb24gMglHUElPWzYyXSBmdW5jdGlvbiAyCgo+IElmIGl04oCZcyBhbiBp
bmRleCwgc2hvdWxkIGl0IHN0YXJ0IGZyb20gMCBvciAxPwoKSXQgc3RhcnRzIHdpdGggMC4KCj4g
VGhlIHN0YXJ0aW5nIHBvaW50IHNlZW1zIGluY29uc2lzdGVudCBhY3Jvc3MgcHdtL3NwaS91YXJ0
Lgo+IElmIGl04oCZcyBzdXBwb3NlZCB0byBiZSB0aGUgZnVuY3Rpb24gbnVtYmVyLAo+IHRoZW4g
dGhlIHNwaSBhbmQgcHdtIHBhcnRzIGxvb2sgaW5jb3JyZWN0LgoKVGhlIGZpcnN0IG9uZSAoaW5k
ZXggMCkgc2hvd3MgdXAgZWFybGllciAobG93ZXIgbGluZSBudW1iZXIpIGluCnRoZSBzcHJlYWRz
aGVldCwgZXZlbiB0aG91Z2ggdGhlIEdQSU8gbnVtYmVycyB1c2VkIGFyZSBoaWdoZXIKdGhhbiB0
aG9zZSBpbiB0aGUgc2Vjb25kIG9uZS4gIFRoZXkncmUgZ3JvdXBlZCwgYW5kIHRoZSBmaXJzdApv
bmUgaXMgaW4gR1BJTyBncm91cCAyIGFuZCB0aGUgc2Vjb25kIGlzIGluIEdQSU8gZ3JvdXAgNS4K
CgkJCQkJLUFsZXgKCj4gQ291bGQgeW91IGNsYXJpZnkgdGhpcz8gWWl4dW4uCj4gCj4gICAgICAg
ICAgICAgICAgICAtIFRyb3kKPj4KPj4+ICsJCQlwaW5tdXggPSA8SzFfUEFEQ09ORig3NSwgMik+
LAkvKiBTQ0xLICovCj4+PiArCQkJCSA8SzFfUEFEQ09ORig3NywgMik+LAkvKiBNT1NJICAqLwo+
Pj4gKwkJCQkgPEsxX1BBRENPTkYoNzgsIDIpPjsJLyogTUlTTyAqLwo+Pj4gKwo+Pj4gKwkJCWJp
YXMtZGlzYWJsZTsKPj4+ICsJCQlkcml2ZS1zdHJlbmd0aCA9IDwxOT47Cj4+PiArCQkJcG93ZXIt
c291cmNlID0gPDMzMDA+Owo+Pj4gKwkJfTsKPj4+ICsKPj4+ICsJCXNzcDMtMC1mcm0tcGlucyB7
Cj4+PiArCQkJcGlubXV4ID0gPEsxX1BBRENPTkYoNzYsIDIpPjsJLyogRlJNIChmcmFtZSkgKi8K
Pj4+ICsKPj4+ICsJCQliaWFzLXB1bGwtdXAgPSA8MD47Cj4+PiArCQkJZHJpdmUtc3RyZW5ndGgg
PSA8MTk+Owo+Pj4gKwkJCXBvd2VyLXNvdXJjZSA9IDwzMzAwPjsKPj4+ICsJCX07Cj4+PiArCX07
Cj4+PiAgIH07Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9r
MS5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS5kdHNpCj4+PiBpbmRleCA2
Y2RjZDgwYTdjODNiLi5lYjhhMTRkZDcyZWE0IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9i
b290L2R0cy9zcGFjZW1pdC9rMS5kdHNpCj4+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nw
YWNlbWl0L2sxLmR0c2kKPj4+IEBAIC03OTcsNiArNzk3LDIyIEBAIHVhcnQ5OiBzZXJpYWxAZDQw
MTc4MDAgewo+Pj4gICAJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPj4+ICAgCQkJfTsKPj4+ICAg
Cj4+PiArCQkJc3BpMzogc3BpQGQ0MDFjMDAwIHsKPj4+ICsJCQkJY29tcGF0aWJsZSA9ICJzcGFj
ZW1pdCxrMS1zcGkiOwo+Pj4gKwkJCQlyZWcgPSA8MHgwIDB4ZDQwMWMwMDAgMHgwIDB4MzA+Owo+
Pj4gKwkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKPj4+ICsJCQkJI3NpemUtY2VsbHMgPSA8MD47
Cj4+PiArCQkJCWNsb2NrcyA9IDwmc3lzY29uX2FwYmMgQ0xLX1NTUDM+LAo+Pj4gKwkJCQkJIDwm
c3lzY29uX2FwYmMgQ0xLX1NTUDNfQlVTPjsKPj4+ICsJCQkJY2xvY2stbmFtZXMgPSAiY29yZSIs
ICJidXMiOwo+Pj4gKwkJCQlyZXNldHMgPSA8JnN5c2Nvbl9hcGJjIFJFU0VUX1NTUDM+Owo+Pj4g
KwkJCQlpbnRlcnJ1cHRzID0gPDU1PjsKPj4gLi4KPj4+ICsJCQkJZG1hcyA9IDwmcGRtYSAyMD4s
Cj4+PiArCQkJCSAgICAgICA8JnBkbWEgMTk+Owo+PiBjYW4gd2UgYWxzbyBzcXVhc2ggdGhlIGRt
YXMgaW50byBvbmUgbGluZT8gYnV0LCBkbyBzcGxpdCBpZiB0aGVyZSBhcmUgdG9vIG1hbnkuLgo+
Pgo+PiB5ZXMsIGl0J3Mgc2ltcGx5IGEgc3R5bGUgY2hhbmdlIHRoYXQgSSdkIGxpa2UgdG8ga2Vl
cCB0aGVtIGNvbnNpc3RlbnQgYXQgRFQgbGV2ZWwsCj4+IGJlc2lkZXMgeW91IG1pZ2h0IGFsc28g
d2FudCB0byBhZGp1c3QgZHQtYmluZGluZyBleGFtcGxlcyB0byBhbGlnbiB3aXRoIHRoZW0gaGVy
ZS4uCj4+Cj4+IHRoYW5rcwo+Pgo+Pj4gKwkJCQlkbWEtbmFtZXMgPSAicngiLCAidHgiOwo+Pj4g
KwkJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+Pj4gKwkJCX07Cj4+PiArCj4+PiAgIAkJCS8qIHNl
Y191YXJ0MTogMHhmMDYxMjAwMCwgbm90IGF2YWlsYWJsZSBmcm9tIExpbnV4ICovCj4+PiAgIAkJ
fTsKPj4+ICAgCj4+PiAtLSAKPj4+IDIuNDguMQo+Pj4KPj4+Cj4+Cj4+IC0tIAo+PiBZaXh1biBM
YW4gKGRsYW4pCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
