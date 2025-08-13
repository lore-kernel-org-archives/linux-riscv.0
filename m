Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B15ECA0EE0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 13:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4o+UtEIO0utsuYIH1hpHtoX1sX6Igv32ow1xUeX0Kc=; b=MOHzEhBX3XAjcZ
	scOhV01QcpTRcdQnx3SvJqCf/gr12KvNoC0NDy5sI8wSVD7rEgD91kmn6Fris7GxZH6rP4j0uOq58
	lCYA7xljDZ9WPG4JI9aCPUgEkpUPljRVFn6GjxUdlSC2KevDfjk1yvwQdWXQQUCc7CpB3oDSWqmcL
	d16h/iaPy+y5/7B0gJfAWL+Q+MI61XghlfcV+rfofodYkYEd23IU/o+0g1lXNgY5P4ynqmt6F66Cv
	zp59ix+kgsMEcDxevjjQiiF4EFP57cj4BiyyFM9w8vzEIjNer7KjloRvCaLo9DPQWXNIb04bnlrcO
	cZoVjCSX8wQaIfKWRGCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBOi-0000000DkSW-2KoE;
	Wed, 13 Aug 2025 13:20:08 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAM6-0000000Dc87-3FUJ
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 12:13:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5E95443C9;
	Wed, 13 Aug 2025 12:13:16 +0000 (UTC)
Message-ID: <95d0aa18-0c09-4b00-824d-3078548ddfcd@ghiti.fr>
Date: Wed, 13 Aug 2025 14:13:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] riscv, bpf: fix reads of thread_info.cpu
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>,
 Puranjay Mohan <puranjay@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250812090256.757273-2-rkrcmar@ventanamicro.com>
 <1fdaa939-d26c-454a-a722-7d0a590557b7@ghiti.fr>
 <DC0H1RZKZ3QR.82P8JXIL5NBJ@ventanamicro.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <DC0H1RZKZ3QR.82P8JXIL5NBJ@ventanamicro.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeekudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeeuffefvdelteelteejhfejhedujeetteevtddvvddthfeiteffledvffeggfeiieenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepudelfedrfeefrdehjedrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduleefrdeffedrheejrdduleelpdhhvghloheplgduledvrdduieekrddvvddruddtudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepvdefpdhrtghpthhtoheprhhkrhgtmhgrrhesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrtghpthhtohepsghpfhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepm
 hgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_051322_958571_881988EF 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

SGkgUmFkaW0sCgpPbiA4LzEyLzI1IDE1OjA5LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4gMjAy
NS0wOC0xMlQxMzozNzoxNiswMjowMCwgQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPjoK
Pj4gQFJhZGltOiBUaGlzIGlzIHRoZSB0aGlyZCBzaW1pbGFyIGJ1ZywgZGlkIHlvdSBjaGVjayBh
bGwgYXNzZW1ibHkgY29kZQo+PiAoYW5kIGJwZikgdG8gbWFrZSBzdXJlIHdlIGRvbid0IGhhdmUg
YW55bW9yZSBsZWZ0IG9yIHNob3VsZCBJPwo+IEkgbG9va2VkIGF0IGxvYWQvc3RvcmUgaW5zdHJ1
Y3Rpb25zLCBpbmNsdWRpbmcgYnBmLCBhbmQgZm9jdXNzZWQgb24KPiBwYXR0ZXJucyB3aGVyZSB3
ZSBhY2Nlc3Mgbm9uLXhsZW4gc2l6ZWQgZGF0YSB0aHJvdWdoIGFuIG9mZnNldC4KPgo+IChOb3Ro
aW5nIGVsc2UgcG9wcGVkIHVwLCBidXQgSSBtb3N0bHkgdXNlZCBncmVwIGFuZCBjc2NvcGUgYXMg
SSBkb24ndAo+ICAga25vdyBvZiBhbnkgc2VtYW50aWMgdG9vbCwgc28gbXkgY29uZmlkZW5jZSBs
ZXZlbHMgYXJlIGxvdy4pCgoKT2sgdGhhbmtzLCBJIGRvbid0IGhhdmUgYW55IGJldHRlciBpZGVh
IHRoYW4gZXllIHNjcnViYmluZyBzbyBJJ2xsIHRha2UgCmFub3RoZXIgbG9vayB0byBpbXByb3Zl
IG91ciBjb25maWRlbmNlLiBPbmUgZ29vZCB0aGluZyBpcyB0aGF0IG5vdyBJIApkb24ndCBsZXQg
dGhlbSBwYXNzIGluIHJldmlld3MgOikKClRoYW5rcyBmb3Igbm90aWNpbmcgdGhpcyBjbGFzcyBv
ZiBidWdzIQoKQWxleAoKCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
