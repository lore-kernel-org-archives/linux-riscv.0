Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0CAC369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 07:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFiLdi7eLXscvlZs+IarSOB9g+Igz+F1wzvYqRAxKtg=; b=IISSuopvXWZVO+
	p/JJ8dDbwnZC/HIJ6Xq8d0pwY8cvqaAeSWlMCF+DqPD+LtHNiKElQvdxVjT7ikxtV2PqB9PgdtcWy
	GT/BKwjb0iU7n2kOZA58K63fYNBP0pTiKRoC2ydMNt2NknBXqXg7ZvTm97wAV7xbGtiilSr/NuvjH
	AhS4Qa5yG+OjSeZP+jy/TVZrRM4siubLgiLdM5kaDoJ2MnS93FE5Lo0x/hW+RR91Cwo0a1f5x3yLk
	o9JB6Z9iFPcu1kfdIqvZghWtnMJVN8NQMDFV686syCYKb33v0ROe7t8bjMflJmPEMzDFoFvAS2bJZ
	d/VcKVhFtyjLl8e+AVNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lW6-00000003mVE-3nIj;
	Mon, 21 Apr 2025 07:24:34 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lUP-00000003m6i-0Xmt
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 07:22:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91A761FCE9;
	Mon, 21 Apr 2025 07:22:45 +0000 (UTC)
Message-ID: <95cefab6-4d9c-4ad2-bc75-d117e0aefc62@ghiti.fr>
Date: Mon, 21 Apr 2025 09:22:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] Documentation/sysctl: add riscv to unaligned-trap
 supported archs
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
 Andrew Jones <ajones@ventanamicro.com>,
 Samuel Holland <samuel.holland@sifive.com>
References: <20250414123543.1615478-1-cleger@rivosinc.com>
 <20250414123543.1615478-5-cleger@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250414123543.1615478-5-cleger@rivosinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedtgeeuhffhveeujeetveevieekleekvdffudefleevgefgieekkefggefhtddtveenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmedufhehjeemvgdutggumedukegutdemtgdtvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmedufhehjeemvgdutggumedukegutdemtgdtvdekpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmedufhehjeemvgdutggumedukegutdemtgdtvdekngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrr
 dhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhhsvghlfhhtvghsthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_002249_313936_A031BD29 
X-CRM114-Status: GOOD (  11.39  )
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

T24gMTQvMDQvMjAyNSAxNDozNCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+IHJpc2N2IHN1cHBv
cnRzIHRoZSAidW5hbGlnbmVkLXRyYXAiIHN5c2N0bCB2YXJpYWJsZSwgYWRkIGl0IHRvIHRoZSBs
aXN0Cj4gb2Ygc3VwcG9ydGVkIGFyY2hpdGVjdHVyZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOp
bWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4gLS0tCj4gICBEb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0IHwgNCArKy0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5lbC5yc3QgYi9Eb2N1bWVudGF0aW9uL2Fk
bWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0Cj4gaW5kZXggZGQ0OWE4OWE2MmQzLi5hMzhlOTFj
NGQ5MmMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwva2Vy
bmVsLnJzdAo+ICsrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL2tlcm5lbC5y
c3QKPiBAQCAtMTU5NSw4ICsxNTk1LDggQEAgdW5hbGlnbmVkLXRyYXAKPiAgIAo+ICAgT24gYXJj
aGl0ZWN0dXJlcyB3aGVyZSB1bmFsaWduZWQgYWNjZXNzZXMgY2F1c2UgdHJhcHMsIGFuZCB3aGVy
ZSB0aGlzCj4gICBmZWF0dXJlIGlzIHN1cHBvcnRlZCAoYGBDT05GSUdfU1lTQ1RMX0FSQ0hfVU5B
TElHTl9BTExPV2BgOyBjdXJyZW50bHksCj4gLWBgYXJjYGAsIGBgcGFyaXNjYGAgYW5kIGBgbG9v
bmdhcmNoYGApLCBjb250cm9scyB3aGV0aGVyIHVuYWxpZ25lZCB0cmFwcwo+IC1hcmUgY2F1Z2h0
IGFuZCBlbXVsYXRlZCAoaW5zdGVhZCBvZiBmYWlsaW5nKS4KPiArYGBhcmNgYCwgYGBwYXJpc2Ng
YCwgYGBsb29uZ2FyY2hgYCBhbmQgYGByaXNjdmBgKSwgY29udHJvbHMgd2hldGhlciB1bmFsaWdu
ZWQKPiArdHJhcHMgYXJlIGNhdWdodCBhbmQgZW11bGF0ZWQgKGluc3RlYWQgb2YgZmFpbGluZyku
Cj4gICAKPiAgID0gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KPiAgIDAgRG8gbm90IGVtdWxhdGUgdW5hbGlnbmVkIGFjY2Vzc2VzLgoKClJl
dmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+CgpUaGFu
a3MsCgpBbGV4CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
