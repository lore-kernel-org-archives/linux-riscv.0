Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA27FE77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 11:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DoBSY3cu3I3PbxQtFVfc706S6B004Pz9UzNuDwXb0/c=; b=sHWjb/vjAbtLoU
	rrViAPxuj/6Q0XgYP3668QubKurxRR2jINtcNJDbOgHMiAxpQYv86IwLU70RTcvETVh8saTHKMrZn
	3u15GDbKFj1y2qoYb5BzaNv7247rhzaO14UyxAENI0DUnDwWV61rTxDjvdIYKMowy+aPhBlGDI+Z4
	UxlHGTpyfr/oTNXhG9uJL0r7IHwjdk+NDr79Z1Y0z61zLmolO7xC2dwGLDYHGpDjpUzFv8EdhjXWg
	9jhvGfNUyFj8ESdsuAUF+F+z5OqqvZkII9Krwo1lo/ZCCszzkYWcZB/0GoZODy7ukw7QqMajg/cof
	/jnw+JyOEpb/PH1caKYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUl4z-000000010SO-1G5J;
	Mon, 06 Jan 2025 11:15:29 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUl4w-000000010RH-3Xbw
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 11:15:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC9DE1BF204;
	Mon,  6 Jan 2025 11:15:21 +0000 (UTC)
Message-ID: <8264591a-68ad-4d11-ab78-2ebd73c8cb02@ghiti.fr>
Date: Mon, 6 Jan 2025 12:15:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: stacktrace: fix backtracing through exceptions
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Anton Blanchard <antonb@tenstorrent.com>
References: <20241209155714.1239665-1-cleger@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241209155714.1239665-1-cleger@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_031527_065746_29EE4A26 
X-CRM114-Status: GOOD (  17.01  )
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

SGkgQ2zDqW1lbnQsCgpPbiAwOS8xMi8yMDI0IDE2OjU3LCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4gUHJpb3IgdG8gY29tbWl0IDVkNWZjMzNjZTU4ZSAoInJpc2N2OiBJbXByb3ZlIGV4Y2VwdGlv
biBhbmQgc3lzdGVtIGNhbGwKPiBsYXRlbmN5IiksIGJhY2t0cmFjZSB0aHJvdWdoIGV4Y2VwdGlv
biB3b3JrZWQgc2luY2UgcmEgd2FzIGZpbGxlZCB3aXRoCj4gcmV0X2Zyb21fZXhjZXB0aW9uIHN5
bWJvbCBhZGRyZXNzIGFuZCB0aGUgc3RhY2t0cmFjZSBjb2RlIGNoZWNrZWQgJ3BjJyB0bwo+IGJl
IGVxdWFsIHRvIHRoYXQgc3ltYm9sLiBOb3cgdGhhdCBoYW5kbGVfZXhjZXB0aW9uIHVzZXMgcmVn
dWxhciAnY2FsbCcKPiBpbnN0cnVjdGlvbnMsIHRoaXMgaXNuJ3Qgd29ya2luZyBhbnltb3JlIGFu
ZCBiYWNrdHJhY2Ugc3RvcHMgYXQKPiBoYW5kbGVfZXhjZXB0aW9uKCkuIFNpbmNlIHRoZXJlIGFy
ZSBtdWx0aXBsZSBjYWxsIHNpdGUgdG8gQyBjb2RlIGluIHRoZQo+IGV4Y2VwdGlvbiBoYW5kbGlu
ZyBwYXRoLCByYXRoZXIgdGhhbiBjaGVja2luZyBtdWx0aXBsZSBwb3RlbnRpYWwgcmV0dXJuCj4g
YWRkcmVzc2VzLCBhZGQgYSBuZXcgc3ltYm9sIGF0IHRoZSBlbmQgb2YgZXhjZXB0aW9uIGhhbmRs
aW5nIGFuZCBjaGVjayBwYwo+IHRvIGJlIGluIHRoYXQgcmFuZ2UuCj4KPiBGaXhlczogNWQ1ZmMz
M2NlNThlICgicmlzY3Y6IEltcHJvdmUgZXhjZXB0aW9uIGFuZCBzeXN0ZW0gY2FsbCBsYXRlbmN5
IikKPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
Cj4KPiAtLS0KPiAgIGFyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMgICAgICB8IDEgKwo+ICAgYXJj
aC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jIHwgNCArKystCj4gICAyIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL2VudHJ5LlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCj4gaW5kZXggMjE2
NTgxODM1ZWIwLi4zM2E1YTlmMmEwZDQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
ZW50cnkuUwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPiBAQCAtMjc4LDYgKzI3
OCw3IEBAIFNZTV9DT0RFX1NUQVJUX05PQUxJR04ocmV0X2Zyb21fZXhjZXB0aW9uKQo+ICAgI2Vs
c2UKPiAgIAlzcmV0Cj4gICAjZW5kaWYKPiArU1lNX0lOTkVSX0xBQkVMKHJldF9mcm9tX2V4Y2Vw
dGlvbl9lbmQsIFNZTV9MX0dMT0JBTCkKPiAgIFNZTV9DT0RFX0VORChyZXRfZnJvbV9leGNlcHRp
b24pCj4gICBBU01fTk9LUFJPQkUocmV0X2Zyb21fZXhjZXB0aW9uKQo+ICAgCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N0
YWNrdHJhY2UuYwo+IGluZGV4IDE1M2EyZGI0YzVmYS4uZDQzNTVjNzcwYzM2IDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3N0YWNrdHJhY2UuYwo+IEBAIC0xNyw2ICsxNyw3IEBACj4gICAjaWZkZWYgQ09ORklHX0ZS
QU1FX1BPSU5URVIKPiAgIAo+ICAgZXh0ZXJuIGFzbWxpbmthZ2Ugdm9pZCBoYW5kbGVfZXhjZXB0
aW9uKHZvaWQpOwo+ICtleHRlcm4gdW5zaWduZWQgbG9uZyByZXRfZnJvbV9leGNlcHRpb25fZW5k
Owo+ICAgCj4gICBzdGF0aWMgaW5saW5lIGludCBmcF9pc192YWxpZCh1bnNpZ25lZCBsb25nIGZw
LCB1bnNpZ25lZCBsb25nIHNwKQo+ICAgewo+IEBAIC03MSw3ICs3Miw4IEBAIHZvaWQgbm90cmFj
ZSB3YWxrX3N0YWNrZnJhbWUoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCBzdHJ1Y3QgcHRfcmVn
cyAqcmVncywKPiAgIAkJCWZwID0gZnJhbWUtPmZwOwo+ICAgCQkJcGMgPSBmdHJhY2VfZ3JhcGhf
cmV0X2FkZHIoY3VycmVudCwgJmdyYXBoX2lkeCwgZnJhbWUtPnJhLAo+ICAgCQkJCQkJICAgJmZy
YW1lLT5yYSk7Cj4gLQkJCWlmIChwYyA9PSAodW5zaWduZWQgbG9uZyloYW5kbGVfZXhjZXB0aW9u
KSB7Cj4gKwkJCWlmIChwYyA+PSAodW5zaWduZWQgbG9uZyloYW5kbGVfZXhjZXB0aW9uICYmCj4g
KwkJCSAgICBwYyA8ICh1bnNpZ25lZCBsb25nKSZyZXRfZnJvbV9leGNlcHRpb25fZW5kKSB7Cj4g
ICAJCQkJaWYgKHVubGlrZWx5KCFfX2tlcm5lbF90ZXh0X2FkZHJlc3MocGMpIHx8ICFmbihhcmcs
IHBjKSkpCj4gICAJCQkJCWJyZWFrOwo+ICAgCgoKWW91IGNhbiBhZGQ6CgpUZXN0ZWQtYnk6IEFs
ZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFsZXhh
bmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkFsZXgKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
