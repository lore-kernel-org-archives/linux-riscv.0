Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8100C369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 06:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oxio0XQIvyN0kdI4FALXswOk+T/XCARMnomooxQcpCE=; b=mzawpR/MkH3APIRDR2xC3thfIz
	8ybjwW62CZfFyFHkGxa/S3U1EfH5U+hn8yEXMvas+i0knON1M4r51oa9rNi4DlsrNEcuyumA4aB+H
	4AfTTzFnFiWL/6KNQ+sIY4vwIKW9o0Ucx7rSSj9xa2CalnugvtIBMLakYW7oDh+c3cp0baQjpw/X8
	JDJ79jf2dOYOQvEY0IGmwsrfl9iG40xn/D7qGTKVU91wx/rNmM3SCQ6hsMYAPpWUo1ueeZ7eArCt7
	Ksy+0BDrnXg42ZBzM+/NnBIvQzONW4PJznKIb4/0RuW4PPVL8ubFy136lJnYLeHa7OjrFCv1CrkBf
	OiLqtHag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kGg-00000003fbZ-2TVA;
	Mon, 21 Apr 2025 06:04:34 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6kGd-00000003fZN-1wyp
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 06:04:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C660B4435C;
	Mon, 21 Apr 2025 06:04:21 +0000 (UTC)
Message-ID: <75e07bb8-e9e2-428f-85d7-5c5b9dc7b1c5@ghiti.fr>
Date: Mon, 21 Apr 2025 08:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] scripts: Do not strip .rela.dyn section
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Ard Biesheuvel <ardb@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org
References: <20250408072851.90275-1-alexghiti@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250408072851.90275-1-alexghiti@rivosinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedttdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhephfehgfdvteejiefgvdevkefgudehkeekhefgkedvtdeugedtvefffeejheektdfgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemudhfheejmegvudgtugemudekugdtmegttddvkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemudhfheejmegvudgtugemudekugdtmegttddvkedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemudhfheejmegvudgtugemudekugdtmegttddvkegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprghlvgigghhhihhtihesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgto
 hhmpdhrtghpthhtohepsghjohhrnhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepmhgrshgrhhhirhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtohhlrghssehfjhgrshhlvgdrvghupdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_230431_641739_5B5947A2 
X-CRM114-Status: GOOD (  17.02  )
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

SGkgTWFzYWhpcm8sCgpPbiAwOC8wNC8yMDI1IDA5OjI4LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6
Cj4gVGhlIC5yZWxhLmR5biBzZWN0aW9uIGNvbnRhaW5zIHJ1bnRpbWUgcmVsb2NhdGlvbnMgYW5k
IGlzIG9ubHkgZW1pdHRlZAo+IGZvciBhIHJlbG9jYXRhYmxlIGtlcm5lbC4KPgo+IHJpc2N2IHVz
ZXMgdGhpcyBzZWN0aW9uIHRvIHJlbG9jYXRlIHRoZSBrZXJuZWwgYXQgcnVudGltZSBidXQgdGhh
dCBzZWN0aW9uCj4gaXMgc3RyaXBwZWQgZnJvbSB2bWxpbnV4LiBUaGF0IHByZXZlbnRzIGtleGVj
IHRvIHN1Y2Nlc3NmdWxseSBsb2FkIHZtbGludXgKPiBzaW5jZSBpdCBkb2VzIG5vdCBjb250YWlu
IHRoZSByZWxvY2F0aW9ucyBpbmZvIG5lZWRlZC4KPgo+IEZpeGVzOiA1NTlkMWU0NWExNmQgKCJy
aXNjdjogVXNlIC0tZW1pdC1yZWxvY3MgaW4gb3JkZXIgdG8gbW92ZSAucmVsYS5keW4gaW4gaW5p
dCIpCj4gVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gUmV2
aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiBBY2tlZC1ieTog
QXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHYz
Ogo+IC0gUmViYXNlIG9uIHRvcCBvZiA2LjE1LXJjMQo+IC0gQ2hhbmdlIHRoZSBmaXhlcyB0YWcK
Pgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBDaGFuZ2Vsb2cgbW9kaWZpY2F0aW9uIChBcmQpCj4gLSBS
ZW1vdmUgQVJDSF9XQU5UU19SRUxBX0RZTiAoQXJkKQo+Cj4gICBzY3JpcHRzL01ha2VmaWxlLnZt
bGludXggfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPgo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL01ha2VmaWxlLnZtbGludXggYi9zY3JpcHRz
L01ha2VmaWxlLnZtbGludXgKPiBpbmRleCBiMGE2Y2Q1YjgxOGMuLjg1ZDYwZDk4NjQwMSAxMDA2
NDQKPiAtLS0gYS9zY3JpcHRzL01ha2VmaWxlLnZtbGludXgKPiArKysgYi9zY3JpcHRzL01ha2Vm
aWxlLnZtbGludXgKPiBAQCAtMTMsNyArMTMsNyBAQCBpZmRlZiBDT05GSUdfQVJDSF9WTUxJTlVY
X05FRURTX1JFTE9DUwo+ICAgdm1saW51eC1maW5hbCA6PSB2bWxpbnV4LnVuc3RyaXBwZWQKPiAg
IAo+ICAgcXVpZXRfY21kX3N0cmlwX3JlbG9jcyA9IFJTVFJJUCAgJEAKPiAtICAgICAgY21kX3N0
cmlwX3JlbG9jcyA9ICQoT0JKQ09QWSkgLS1yZW1vdmUtc2VjdGlvbj0nLnJlbConICQ8ICRACj4g
KyAgICAgIGNtZF9zdHJpcF9yZWxvY3MgPSAkKE9CSkNPUFkpIC0tcmVtb3ZlLXNlY3Rpb249Jy5y
ZWwqJyAtLXJlbW92ZS1zZWN0aW9uPSEnLnJlbCouZHluJyAkPCAkQAo+ICAgCj4gICB2bWxpbnV4
OiAkKHZtbGludXgtZmluYWwpIEZPUkNFCj4gICAJJChjYWxsIGlmX2NoYW5nZWQsc3RyaXBfcmVs
b2NzKQoKCkRvIHlvdSB0aGluayB5b3UgY2FuIG1lcmdlIHRoYXQgaW4gdGhlIG5leHQgcmM/IElm
IG5vdCwgSSBjYW4gbWVyZ2UgaXQgCmlmIHlvdSBhZGQgeW91ciBBQiA6KQoKVGhhbmtzLAoKQWxl
eAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
