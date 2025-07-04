Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E787C83F03
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 12:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1OAK0II8j5KOMFlqMDrakE4lUXBjKq0rqmRZiwB/2o=; b=N8u27slIIyM7Ev
	aWDPwwhErorPoxb5nnScLnTGxh7Q/BfsHY/e+PT/mlKVTfTCp8Zx2oNT6rAMeM31crFgFS+T69zxN
	MKMPlxoPMKqYtCnGOS7cJST6Mko048IuBv7PH6zW0dnRCcknk5zAIThbZ7lnLyxfYaga/7PvLcyTA
	lqk+CaS94JG5Qj6+xvhN8nzpBPkXrxCQkaVgL6pX0z2Je24LRIM44GtTjL5HNEfD4bnAjptv2OIpg
	92iJL9HEVQWk8tGpy2yUgFHO5FWwFdB5ty5Y66qnlzMCCq1jjqlKzx6/xRbgq+VKSP4Q9o5K+huto
	63X8vI2gOzKSunvHf8Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXfX1-0000000ENyJ-1StJ;
	Fri, 04 Jul 2025 12:28:43 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXfWz-0000000ENxB-1ePg
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 12:28:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 263D14398D;
	Fri,  4 Jul 2025 12:28:31 +0000 (UTC)
Message-ID: <8160f56d-967d-4fa0-b996-0e0a2aa8be20@ghiti.fr>
Date: Fri, 4 Jul 2025 14:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: ftrace: Fix the logic issue in DYNAMIC_FTRACE
 selection
To: Miao Chen <chenmiao.ku@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250703084502.394406-1-chenmiao.ku@gmail.com>
 <f7e12c6d-892e-4ca3-9ef0-fbb524d04a48@ghiti.fr>
 <20250703114018.6fab0b8a@batman.local.home>
 <5ac2c90c-5907-40ce-a31e-05cb6d88fa52@ghiti.fr>
 <CAKxVwgeDcqo83ZV+xBcHwNuMk6yeU+yp7RYo22OARAVOBgrsJQ@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAKxVwgeDcqo83ZV+xBcHwNuMk6yeU+yp7RYo22OARAVOBgrsJQ@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfeduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepieffvdeiveeuhfegvddvuefhveejhfffudffhfdufeeuudegtdfguddthfetledvnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeegkegufeemvdejkegumedvrgdtmegrrgeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemgeekugefmedvjeekugemvdgrtdemrggrieejpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeegkegufeemvdejkegumedvrgdtmegrrgeijegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepjedprhgtphhtthhopegthhgvnhhmihgrohdrkhhusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopehprghulhdrfigrl
 hhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_052841_564012_7F4675FC 
X-CRM114-Status: GOOD (  24.25  )
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

SGkgQ2hlbiBNaWFvLAoKT24gNy80LzI1IDA0OjA2LCBNaWFvIENoZW4gd3JvdGU6Cj4gSGVsbG8g
QWxleCwKPgo+IFNob3VsZCBJIHdhaXQgZm9yIFN0ZXZlbiB0byBmaW5pc2ggaGlzIHdvcmsgYmVm
b3JlIHN0YXJ0aW5nIG1pbmU/IEhlIAo+IHNlZW1zIHRvIGJlIHJlZmFjdG9yaW5nIGEgbG90IG9m
IENPTkZJRyBsb2dpYywgd2hpY2ggbWlnaHQgY2F1c2UgCj4gY29uZmxpY3RzLgoKCkkgd291bGQg
c2F5IG5vLCBkb24ndCB3YWl0IGZvciBTdGV2ZW4gc2luY2UgaGlzIHdvcmsgd29uJ3QgbGFuZCBp
biA2LjE2LCAKd2UgbmVlZCBhIGZpeCB0byBwcmV2ZW50IGJ1aWxkIGZhaWx1cmVzIGZvciB0aGlz
IHJlbGVhc2UuCgpUaGFua3MsCgpBbGV4CgoKPgo+IFRoYW5rcywKPgo+IENoZW4gTWlhbwo+Cj4g
QWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiDkuo4yMDI15bm0N+aciDTml6XlkajkupQg
MDA6MDblhpnpgZPvvJoKPgo+ICAgICBIaSBTdGV2ZSwKPgo+ICAgICBPbiA3LzMvMjUgMTc6NDAs
IFN0ZXZlbiBSb3N0ZWR0IHdyb3RlOgo+ICAgICA+IE9uIFRodSwgMyBKdWwgMjAyNSAxNTowMDow
MiArMDIwMAo+ICAgICA+IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4gd3JvdGU6Cj4g
ICAgID4KPiAgICAgPgo+ICAgICA+PiBXZSBjb3VsZCBzdXBwb3J0IHN0YXRpYyBmdHJhY2UsIGJ1
dCBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCwgc28KPiAgICAgSSBhZ3JlZQo+ICAgICA+PiB3aXRo
IHRoaXMgcGF0Y2guIEluIGZhY3QgSSBoYWQganVzdCBwcmVwYXJlZCBhIHBhdGNoIGZvciB0aGlz
IGhlcmUKPiAgICAgPj4KPiAgICAgaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXJpc2N2L2xpbnV4
L3B1bGwvNTU2L2NvbW1pdHMvMDQ4MTA5MmE1YmVjMzgxODY1ODk4MWMxMWY2MjllMDZlNjYzODJi
Mwo+ICAgICA+PiB3aGljaCBpcyBhIGJpdCBtb3JlIGNvbXBsZXRlIHNpbmNlIEkgaGF2ZSByZW1v
dmVkIHNvbWUgZGVhZCBjb2RlLgo+ICAgICA+Pgo+ICAgICA+PiBMZXQncyBzZWUgd2hhdCBvdGhl
ciBwZW9wbGUgdGhpbmsgYWJvdXQgc3VwcG9ydGluZyBzdGF0aWMKPiAgICAgZnRyYWNlLCBJIGhh
dmUKPiAgICAgPj4gYWRkZWQgU3RldmVuIGluIGNjIGlmIGhlIGhhcyBhbiBvcGluaW9uLgo+ICAg
ICA+IFllcywgcGxlYXNlIG9ubHkgc3VwcG9ydCB0aGUgZHluYW1pYyBmdHJhY2UuIFRoZSBzdGF0
aWMgaXMgdGhlcmUKPiAgICAgb25seQo+ICAgICA+IHRvIGhlbHAgYXJjaHMgdG8gZ2V0IGZ0cmFj
ZSB1cCBhbmQgcnVubmluZy4gT25jZSBkeW5hbWljIGlzCj4gICAgIHN1cHBvcnRlZCwKPiAgICAg
PiBzdGF0aWMgc2hvdWxkIG5vdCBiZSB1c2VkLgo+ICAgICA+Cj4gICAgID4gSG1tLCBtYXliZSBJ
IHNob3VsZCBqdXN0IHJlbW92ZSB0aGUgcHJvbXB0IGZvciBEWU5BTUlDX0ZUUkFDRS4KPiAgICAg
Pgo+ICAgICA+IFRoYXQgaXMsIG9uY2UgaXQgaXMgc3VwcG9ydGVkIGJ5IGFuIGFyY2hpdGVjdHVy
ZSwgaXQgc2hvdWxkIGJlCj4gICAgIHRoZSBvbmx5Cj4gICAgID4gdGhpbmcgdXNlZC4KPiAgICAg
Pgo+ICAgICA+IC0tIFN0ZXZlCj4KPgo+ICAgICBUaGFua3MgZm9yIHlvdXIgaW5wdXQuCj4KPiAg
ICAgQENoZW5NaWFvOiBjYW4geW91IGNvbWUgdXAgd2l0aCBhIHYyIHRoYXQsIGluIGFkZGl0aW9u
LCBkZWxldGVzCj4gICAgIHRoZSBkZWFkCj4gICAgIGNvZGUgYW5kIHdpdGggYSBjb21taXQgbG9n
IHRoYXQgZXhwbGFpbnMgd2hhdCBTdGV2ZW4gc2FpZD8gSWYgbm90Cj4gICAgIHBvc3NpYmxlIGZv
ciB5b3UsIGxldCBtZSBrbm93IGFuZCBJJ2xsIGRvIGl0Lgo+Cj4gICAgIFRoYW5rcywKPgo+ICAg
ICBBbGV4Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
