Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF587C71136
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 08:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ns6x9gYW22pWqsTZF8SYzygA5yek4DDvyO7KB16OKvI=; b=G4PfN3FGKH+nXG
	AfzrFodKBivn2+imxHjkyrBbHk5iptPMvkMXbqngLoXZY5xTsOCqN3m1b4hsN8QgN9wLaxezJN2xY
	hY5pbNjiJkZWbbn0eqox0XhR1BSsi7ZWg9FP9YND/bcQJBNfR7SjjM283uRb8y9RrPodiAPYIANf6
	zCgvzwR6dRvR72AMRDusav+/dXQ2u9P4IIlqWMkz42v6e57jTpt75LrCeD1N4UDYTsp75vU6JXJi7
	LHB9umT7NZ+9eeOm8NKcHLrf07FXmIsA2zdvecn4MuF/XHr1OECGv5lk3aa3gyGrDhqItxLyjVIgE
	+56DC2SI/EIN5UfEkacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdiR-0000000CjYd-0dfB;
	Thu, 12 Jun 2025 08:55:19 +0000
Received: from relay16.mail.gandi.net ([2001:4b98:dc4:8::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPd40-0000000CZaC-1k9M
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 08:13:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C9DC24386A;
	Thu, 12 Jun 2025 08:13:16 +0000 (UTC)
Message-ID: <0d80cd92-4d4f-4862-a2b3-a881a7368b08@ghiti.fr>
Date: Thu, 12 Jun 2025 10:13:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] riscv: vdso: Deduplicate CFLAGS_REMOVE_* variables
To: Nathan Chancellor <nathan@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
 <20250611-vdso-absolute-reloc-v3-1-47897d73784b@linutronix.de>
 <20250611184018.GA2192624@ax162>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250611184018.GA2192624@ax162>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddugeehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepuefffedvleetleetjefhjeehudejteetvedtvddvtdfhieetffelvdffgefgieeinecuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemfhduvggsmehfugelrgemrgguudgumeeifhehsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemfhduvggsmehfugelrgemrgguudgumeeifhehsgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemfhduvggsmehfugelrgemrgguudgumeeifhehsggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrfigvihhsshhstghhuhhhsehlihhnuhhtrhhonhhigidruggvp
 dhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehnihgtkhdruggvshgruhhlnhhivghrshdolhhkmhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhorhgsohesghhoohhglhgvrdgtohhmpdhrtghpthhtohepjhhushhtihhnshhtihhtthesghhoohhglhgvrdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_011332_597537_05E26E2F 
X-CRM114-Status: GOOD (  10.78  )
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

SGkgVGhvbWFzLAoKT24gNi8xMS8yNSAyMDo0MCwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cj4g
T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgMTE6MjI6MTJBTSArMDIwMCwgVGhvbWFzIFdlacOfc2No
dWggd3JvdGU6Cj4+IEFsbCB2RFNPIG9iamVjdHMgbmVlZCB0aGUgc2FtZSB0cmVhdG1lbnQuCj4+
IFRvIG1ha2UgY2hhbmdlcyB0byBib3RoIHRoZSBsaXN0IG9mIG9iamVjdHMgYW5kIHRoZSBsaXN0
IG9mIHJlbW92ZWQgZmxhZ3MKPj4gZWFzaWVyLCBpbnRyb2R1Y2UgYSBoZWxwZXIgdmFyaWFibGUu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1
aEBsaW51dHJvbml4LmRlPgo+IFJldmlld2VkLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFu
QGtlcm5lbC5vcmc+CgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJp
dm9zaW5jLmNvbT4KClRoYW5rcywKCkFsZXgKCgo+Cj4+IC0tLQo+PiAgIGFyY2gvcmlzY3Yva2Vy
bmVsL3Zkc28vTWFrZWZpbGUgfCA3ICsrKystLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdmRzby9NYWtlZmlsZSBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKPj4g
aW5kZXggOWViYjVlNTkwZjkzYTMyMjhjNDUxZGNhNThlNmQ1Y2ZiYmMwM2ZmNy4uYzE5YzNjNzZm
N2M5ZjZiMmY3NTIzYTU5MjY5ZGUzYjY4MzY1NjMyMyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvdmRzby9NYWtlZmlsZQo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01h
a2VmaWxlCj4+IEBAIC00OSw5ICs0OSwxMCBAQCBDUFBGTEFHU192ZHNvLmxkcyArPSAtREhBU19W
R0VUVElNRU9GREFZCj4+ICAgZW5kaWYKPj4gICAKPj4gICAjIERpc2FibGUgLXBnIHRvIHByZXZl
bnQgaW5zZXJ0IGNhbGwgc2l0ZQo+PiAtQ0ZMQUdTX1JFTU9WRV92Z2V0dGltZW9mZGF5Lm8gPSAk
KENDX0ZMQUdTX0ZUUkFDRSkgJChDQ19GTEFHU19TQ1MpCj4+IC1DRkxBR1NfUkVNT1ZFX2dldHJh
bmRvbS5vID0gJChDQ19GTEFHU19GVFJBQ0UpICQoQ0NfRkxBR1NfU0NTKQo+PiAtQ0ZMQUdTX1JF
TU9WRV9od3Byb2JlLm8gPSAkKENDX0ZMQUdTX0ZUUkFDRSkgJChDQ19GTEFHU19TQ1MpCj4+ICtD
RkxBR1NfUkVNT1ZFX1ZEU08gPSAkKENDX0ZMQUdTX0ZUUkFDRSkgJChDQ19GTEFHU19TQ1MpCj4+
ICtDRkxBR1NfUkVNT1ZFX3ZnZXR0aW1lb2ZkYXkubyA9ICQoQ0ZMQUdTX1JFTU9WRV9WRFNPKQo+
PiArQ0ZMQUdTX1JFTU9WRV9nZXRyYW5kb20ubyA9ICQoQ0ZMQUdTX1JFTU9WRV9WRFNPKQo+PiAr
Q0ZMQUdTX1JFTU9WRV9od3Byb2JlLm8gPSAkKENGTEFHU19SRU1PVkVfVkRTTykKPj4gICAKPj4g
ICAjIEZvcmNlIGRlcGVuZGVuY3kKPj4gICAkKG9iaikvdmRzby5vOiAkKG9iaikvdmRzby5zbwo+
Pgo+PiAtLSAKPj4gMi40OS4wCj4+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
