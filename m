Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312D4C5AE59
	for <linux-riscv@archiver.kernel.org>; Sat, 31 May 2025 12:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b+/85TDrc7X/n3hl4tgxxlh9qsQZZc0XiNKh9KAOjyI=; b=z4r/njEXCVNS1p
	M026NFykrUVpusnQC+GLLqtJQxHLQkzOQ7Ny7VK8VieRQLyRWUjDHx1uixcSmvAPik4QNpYx1h1EV
	LDL/fXW/EjPEHUHRB849y3QHoNZDl3ZVScftmaMlzDZnPXYoEbjP6l8oAhkFC7AN+G21WMfLHRTBr
	8VfuoXmpA954I3K5z0WWFg4vwnMna5bbf1xZcHuHaXbUmZW6qQD++KXyGSfDn/IRFegcDy1zIiRYn
	4+3l81UkQgVEloAR63CUrMnwzH3n7CqCmmk/OvCsdBWMigI64jZsLmiHATHRYqMEFTt9AgZmeCPWP
	efARfNjkQ5AXIyACpA7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLLKz-00000003jYF-3jLl;
	Sat, 31 May 2025 12:29:21 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLLKw-00000003jXB-1LNn
	for linux-riscv@lists.infradead.org;
	Sat, 31 May 2025 12:29:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0A7C743192;
	Sat, 31 May 2025 12:29:10 +0000 (UTC)
Message-ID: <58244005-b071-4e21-ade1-8cdf4b35664f@ghiti.fr>
Date: Sat, 31 May 2025 14:29:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: process: use unsigned int instead of unsigned
 long for put_user()
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20250530205658.624195-1-cleger@rivosinc.com>
 <20250530205658.624195-2-cleger@rivosinc.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250530205658.624195-2-cleger@rivosinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudeltdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdeguefhhfevueejteevveeikeelkedvffdufeelveeggfeikeekgfeghfdttdevnecukfhppedujeeirddugeejrddugeehrdeggeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeeirddugeejrddugeehrdeggedphhgvlhhopegludelvddrudeikedruddrudehfegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepiedprhgtphhtthhopegtlhgvghgvrhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsv
 ghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughu
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_052918_492302_8307B020 
X-CRM114-Status: GOOD (  11.85  )
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

SGkgQ2zDqW1lbnQsCgpPbiA1LzMwLzI1IDIyOjU2LCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4g
VGhlIHNwZWNpZmljYXRpb24gb2YgcHJjdGwoKSBmb3IgR0VUX1VOQUxJR05fQ1RMIHN0YXRlcyB0
aGF0IHRoZSB2YWx1ZSBpcwo+IHJldHVybmVkIGluIGFuIHVuc2lnbmVkIGludCAqIGFkZHJlc3Mg
cGFzc2VkIGFzIGFuIHVuc2lnbmVkIGxvbmcuIENoYW5nZQo+IHRoZSB0eXBlIHRvIG1hdGNoIHRo
YXQgYW5kIGF2b2lkIGFuIHVuYWxpZ25lZCBhY2Nlc3MgYXMgd2VsbC4KPgo+IFNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgIGFyY2gv
cmlzY3Yva2VybmVsL3Byb2Nlc3MuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3Byb2Nlc3MuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwo+IGluZGV4IDE1ZDhmNzU5
MDJmOC4uOWVlNmQ4MTZiOThiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nl
c3MuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwo+IEBAIC01Nyw3ICs1Nyw3
IEBAIGludCBnZXRfdW5hbGlnbl9jdGwoc3RydWN0IHRhc2tfc3RydWN0ICp0c2ssIHVuc2lnbmVk
IGxvbmcgYWRyKQo+ICAgCWlmICghdW5hbGlnbmVkX2N0bF9hdmFpbGFibGUoKSkKPiAgIAkJcmV0
dXJuIC1FSU5WQUw7Cj4gICAKPiAtCXJldHVybiBwdXRfdXNlcih0c2stPnRocmVhZC5hbGlnbl9j
dGwsICh1bnNpZ25lZCBsb25nIF9fdXNlciAqKWFkcik7Cj4gKwlyZXR1cm4gcHV0X3VzZXIodHNr
LT50aHJlYWQuYWxpZ25fY3RsLCAodW5zaWduZWQgaW50IF9fdXNlciAqKWFkcik7Cj4gICB9Cj4g
ICAKPiAgIHZvaWQgX19zaG93X3JlZ3Moc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCgoKUmV2aWV3ZWQt
Ynk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkFs
ZXgKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
