Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22249C7115D
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ScYlRVL+nABbmyUzcNP6GCgpJi92mCZMJNvmh1I3Rck=; b=hl4bMq43NRHvOt
	pfws8CDHUoSsUY+1ij0XlvZj5Hd/BvIXLQF+D9+Xk2qEaX1cwL9Qf1B6fxLYigLzpzLxb1I02LlZG
	ILeN87xhXuF3hDYlPhVltLZ9pomqnZt9Oinw4Z538Q6JgiitNAFH8A+KQiYB7L/MKiFCLhg510Tkh
	6Vwbej7c2EuyUFXiaKkfT6UZYoTJkrXvZfC0rkaPlk9JsqnlEuWp/wc6Jj/DbmWE4MV1PIF8Tecwp
	L1aI2hEMo+EyDehCtvQAaAmKmHmT1YfJHaqAYC8POFWfpGwlyYcZrrwKSZMLks+eEYvE9qTi2Tku+
	Ee0VSS0xF3URTrMN++CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbNn-0000000Feqe-2bRd;
	Fri, 20 Jun 2025 13:02:15 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZql-0000000FSVi-1lmn
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 11:24:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1307941C7B;
	Fri, 20 Jun 2025 11:23:57 +0000 (UTC)
Message-ID: <f90f6843-4ffd-48a3-9813-0d1c52f8e48e@ghiti.fr>
Date: Fri, 20 Jun 2025 13:23:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "riscv: misaligned: fix sleeping function called
 during misaligned access handling"
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Nylon Chen <nylon.chen@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250620110939.1642735-1-namcao@linutronix.de>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250620110939.1642735-1-namcao@linutronix.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekvdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeejieeuudejieekveeutdeguefhkeduledugeevhefffeejudeggedufffgleeugfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemkegsgeegmegrvdelsgemvghffhehmeeirgejfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemkegsgeegmegrvdelsgemvghffhehmeeirgejfhdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemkegsgeegmegrvdelsgemvghffhehmeeirgejfhgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepledprhgtphhtthhopehnrghmtggroheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehpr
 ghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheptghlvghgvghrsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehnhihlohhnrdgthhgvnhesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_042403_603160_77F195B2 
X-CRM114-Status: GOOD (  14.65  )
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

T24gNi8yMC8yNSAxMzowOSwgTmFtIENhbyB3cm90ZToKPiBUaGlzIHJldmVydHMgY29tbWl0IDYx
YTc0YWQyNTQ2MiAoInJpc2N2OiBtaXNhbGlnbmVkOiBmaXggc2xlZXBpbmcgZnVuY3Rpb24KPiBj
YWxsZWQgZHVyaW5nIG1pc2FsaWduZWQgYWNjZXNzIGhhbmRsaW5nIikuIFRoZSBjb21taXQgYWRk
cmVzc2VzIGEgc2xlZXBpbmcKPiBpbiBhdG9taWMgY29udGV4dCBwcm9ibGVtLCBidXQgaXQgaXMg
bm90IHRoZSBjb3JyZWN0IGZpeCBhcyBleHBsYWluZWQgYnkKPiBDbMOpbWVudDoKPgo+ICJVc2lu
ZyBub2ZhdWx0IHdvdWxkIGxlYWQgdG8gZmFpbHVyZSB0byByZWFkIGZyb20gdXNlciBtZW1vcnkg
dGhhdCBpcyBwYWdlZAo+IG91dCBmb3IgaW5zdGFuY2UuIFRoaXMgaXMgbm90IHJlYWxseSBhY2Nl
cHRhYmxlLCB3ZSBzaG91bGQgaGFuZGxlIHVzZXIKPiBtaXNhbGlnbmVkIGFjY2VzcyBldmVuIGF0
IGFuIGFkZHJlc3MgdGhhdCB3b3VsZCBnZW5lcmF0ZSBhIHBhZ2UgZmF1bHQuIgo+Cj4gVGhpcyBi
dWcgaGFzIGJlZW4gcHJvcGVybHkgZml4ZWQgYnkgY29tbWl0IDQ1MzgwNWYwYTI4ZiAoInJpc2N2
Ogo+IG1pc2FsaWduZWQ6IGVuYWJsZSBJUlFzIHdoaWxlIGhhbmRsaW5nIG1pc2FsaWduZWQgYWNj
ZXNzZXMiKS4KPgo+IFJldmVydCB0aGlzIGltcHJvcGVyIGZpeC4KPgo+IExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L2I3NzliZWVkLWU0NGUtNGE1ZS05NTUxLTQ2NDc2
ODJiMGQyMUByaXZvc2luYy5jb20vCj4gU2lnbmVkLW9mZi1ieTogTmFtIENhbyA8bmFtY2FvQGxp
bnV0cm9uaXguZGU+Cj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiAtLS0KPiAgIGFyY2gv
cmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFw
c19taXNhbGlnbmVkLmMKPiBpbmRleCBkZDhlNGFmNjU4M2Y0Li45MzA0MzkyNGZlNmM2IDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwo+IEBAIC00NTQsNyArNDU0LDcgQEAg
c3RhdGljIGludCBoYW5kbGVfc2NhbGFyX21pc2FsaWduZWRfbG9hZChzdHJ1Y3QgcHRfcmVncyAq
cmVncykKPiAgIAo+ICAgCXZhbC5kYXRhX3U2NCA9IDA7Cj4gICAJaWYgKHVzZXJfbW9kZShyZWdz
KSkgewo+IC0JCWlmIChjb3B5X2Zyb21fdXNlcl9ub2ZhdWx0KCZ2YWwsICh1OCBfX3VzZXIgKilh
ZGRyLCBsZW4pKQo+ICsJCWlmIChjb3B5X2Zyb21fdXNlcigmdmFsLCAodTggX191c2VyICopYWRk
ciwgbGVuKSkKPiAgIAkJCXJldHVybiAtMTsKPiAgIAl9IGVsc2Ugewo+ICAgCQltZW1jcHkoJnZh
bCwgKHU4ICopYWRkciwgbGVuKTsKPiBAQCAtNTU1LDcgKzU1NSw3IEBAIHN0YXRpYyBpbnQgaGFu
ZGxlX3NjYWxhcl9taXNhbGlnbmVkX3N0b3JlKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICAgCQly
ZXR1cm4gLUVPUE5PVFNVUFA7Cj4gICAKPiAgIAlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Cj4gLQkJ
aWYgKGNvcHlfdG9fdXNlcl9ub2ZhdWx0KCh1OCBfX3VzZXIgKilhZGRyLCAmdmFsLCBsZW4pKQo+
ICsJCWlmIChjb3B5X3RvX3VzZXIoKHU4IF9fdXNlciAqKWFkZHIsICZ2YWwsIGxlbikpCj4gICAJ
CQlyZXR1cm4gLTE7Cj4gICAJfSBlbHNlIHsKPiAgIAkJbWVtY3B5KCh1OCAqKWFkZHIsICZ2YWws
IGxlbik7CgoKT2YgY291cnNlIHRoaXMgaXMgYSB3cm9uZyBmaXg6CgpSZXZpZXdlZC1ieTogQWxl
eGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhhbmtzIGZvciBjYXRjaGlu
ZyB0aGlzLAoKQWxleAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
