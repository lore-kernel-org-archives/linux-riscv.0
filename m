Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A395C48BC3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 14:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vAHOodO1ml50VWVWnNkpz0XoffuR7tUXnPRlJrMax7o=; b=P7GpuG176eNcNZ
	C1pR8/b8s0aRb/aIdmn5Vko2Sndz20TLzCexSKlnLFePZtTpwpsICq+X7ty9d2BrnIgLkbXYRow9u
	OCShZlP2eCFu52b9dUgOkw1gyTZxCNHQMJRe6NPoO1VizACVdbadRrEybnFNCISqtfcqgOBiuD1QG
	wZZMYwCzQ/uR8J/LgAP03+goyzZLtu/delL1QjWFr618BRlf+moc5AlLZ34DlagFUlzrJU/LCc9DI
	3QvgtX/dgCcz8RzntqbxSwZDzPY23IDBiHcarTfThXql03c2eUjOaDWVMXh08OUgpjeMIwF3fhUGZ
	y7inCg8iPbZeKDMl0xCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc4QY-0000000AnDC-2P6B;
	Mon, 19 Feb 2024 14:15:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc3Iq-0000000AWTX-1fmK
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 13:03:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B1FFFCE125F;
	Mon, 19 Feb 2024 13:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE46C433F1;
	Mon, 19 Feb 2024 13:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708347802;
	bh=Cw01mhaoUD3dZvwZMcIsBldKkiKVpb79QSBQh1zE1Qk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SRQOXAiMD27AreHIedFyqsVZHI3jim/KHyFi+9a3X2f+CD9v105Byq/89ajQZfyFo
	 SRMgbcDaqCACtD8mH+j/VCB7AGcAtQSqSKbNTPGSWAQpJwUAQZi1qGhgeES7HOQ2cT
	 J9FGDpHUzFFCRLqBs2fKBEbtwn+4m3cJdq+KssC0EWIjqlsroX0q2zCYADw/BlL73m
	 dUGny+A599zcAhUE0OOzA96ylNBkLzzV/ZJgHIB/y25p5gHAv035vtcTUazvLNQoa/
	 +nTA3tPeGxDfa2lQ7fFhS+ZtsrCHjHlVTPL+jb/8wbLaRSbo5n2tUFrq+aUNNW8fBG
	 /UqyIH0HGkhYg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Samuel
 Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 4/7] riscv: Simplify text patching loops
In-Reply-To: <20240212025529.1971876-5-samuel.holland@sifive.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
 <20240212025529.1971876-5-samuel.holland@sifive.com>
Date: Mon, 19 Feb 2024 14:03:18 +0100
Message-ID: <874je4fvxl.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_050324_739566_9B1D2050 
X-CRM114-Status: GOOD (  13.27  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

U2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyaXRlczoKCj4gVGhp
cyByZWR1Y2VzIHRoZSBudW1iZXIgb2YgdmFyaWFibGVzIGFuZCBtYWtlcyB0aGUgY29kZSBlYXNp
ZXIgdG8gcGFyc2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhv
bGxhbmRAc2lmaXZlLmNvbT4KPiAtLS0KPgo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jIHwg
MjEgKysrKysrKysrKystLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspLCAxMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9w
YXRjaC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+IGluZGV4IGJjY2Q5ZWQwNGEwNS4u
N2YwMzBiNDZlYWU1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCj4gQEAgLTE1NSw3ICsxNTUsNiBAQCBOT0tQ
Uk9CRV9TWU1CT0woX19wYXRjaF9pbnNuX3dyaXRlKTsKPiAgCj4gIHN0YXRpYyBpbnQgcGF0Y2hf
aW5zbl9zZXQodm9pZCAqYWRkciwgdTggYywgc2l6ZV90IGxlbikKPiAgewo+IC0Jc2l6ZV90IHBh
dGNoZWQgPSAwOwo+ICAJc2l6ZV90IHNpemU7Cj4gIAlpbnQgcmV0ID0gMDsKPiAgCj4gQEAgLTE2
MywxMSArMTYyLDEyIEBAIHN0YXRpYyBpbnQgcGF0Y2hfaW5zbl9zZXQodm9pZCAqYWRkciwgdTgg
Yywgc2l6ZV90IGxlbikKPiAgCSAqIF9fcGF0Y2hfaW5zbl9zZXQoKSBjYW4gb25seSB3b3JrIG9u
IDIgcGFnZXMgYXQgYSB0aW1lIHNvIGNhbGwgaXQgaW4gYQo+ICAJICogbG9vcCB3aXRoIGxlbiA8
PSAyICogUEFHRV9TSVpFLgo+ICAJICovCj4gLQl3aGlsZSAocGF0Y2hlZCA8IGxlbiAmJiAhcmV0
KSB7Cj4gLQkJc2l6ZSA9IG1pbl90KHNpemVfdCwgUEFHRV9TSVpFICogMiAtIG9mZnNldF9pbl9w
YWdlKGFkZHIgKyBwYXRjaGVkKSwgbGVuIC0gcGF0Y2hlZCk7Cj4gLQkJcmV0ID0gX19wYXRjaF9p
bnNuX3NldChhZGRyICsgcGF0Y2hlZCwgYywgc2l6ZSk7Cj4gKwl3aGlsZSAobGVuICYmICFyZXQp
IHsKPiArCQlzaXplID0gbWluX3Qoc2l6ZV90LCBQQUdFX1NJWkUgKiAyIC0gb2Zmc2V0X2luX3Bh
Z2UoYWRkciksIGxlbik7Cj4gKwkJcmV0ID0gX19wYXRjaF9pbnNuX3NldChhZGRyLCBjLCBzaXpl
KTsKCldoaWxlIHlvdSdyZSBhdCBpdCwgZG86CiAgcmV0ID0gX19wYXRjaF9pbnNuX3NldChhZGRy
LCBjLCBzaXplKTsKICBpZiAocmV0KQogICAgICAgICAgcmV0dXJuIHJldDsKICAuLi4KcmV0dXJu
IDA7Cn0KCmFuZCBzaW1wbGlmeSB0aGUgd2hpbGUtbG9vcCBwcmVkaWNhdGU/Cgo+ICAKPiAtCQlw
YXRjaGVkICs9IHNpemU7Cj4gKwkJYWRkciArPSBzaXplOwo+ICsJCWxlbiAtPSBzaXplOwo+ICAJ
fQo+ICAKPiAgCXJldHVybiByZXQ7Cj4gQEAgLTE5MCw3ICsxOTAsNiBAQCBOT0tQUk9CRV9TWU1C
T0wocGF0Y2hfdGV4dF9zZXRfbm9zeW5jKTsKPiAgCj4gIGludCBwYXRjaF9pbnNuX3dyaXRlKHZv
aWQgKmFkZHIsIGNvbnN0IHZvaWQgKmluc24sIHNpemVfdCBsZW4pCj4gIHsKPiAtCXNpemVfdCBw
YXRjaGVkID0gMDsKPiAgCXNpemVfdCBzaXplOwo+ICAJaW50IHJldCA9IDA7Cj4gIAo+IEBAIC0x
OTgsMTEgKzE5NywxMyBAQCBpbnQgcGF0Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2
b2lkICppbnNuLCBzaXplX3QgbGVuKQo+ICAJICogQ29weSB0aGUgaW5zdHJ1Y3Rpb25zIHRvIHRo
ZSBkZXN0aW5hdGlvbiBhZGRyZXNzLCB0d28gcGFnZXMgYXQgYSB0aW1lCj4gIAkgKiBiZWNhdXNl
IF9fcGF0Y2hfaW5zbl93cml0ZSgpIGNhbiBvbmx5IGhhbmRsZSBsZW4gPD0gMiAqIFBBR0VfU0la
RS4KPiAgCSAqLwo+IC0Jd2hpbGUgKHBhdGNoZWQgPCBsZW4gJiYgIXJldCkgewo+IC0JCXNpemUg
PSBtaW5fdChzaXplX3QsIFBBR0VfU0laRSAqIDIgLSBvZmZzZXRfaW5fcGFnZShhZGRyICsgcGF0
Y2hlZCksIGxlbiAtIHBhdGNoZWQpOwo+IC0JCXJldCA9IF9fcGF0Y2hfaW5zbl93cml0ZShhZGRy
ICsgcGF0Y2hlZCwgaW5zbiArIHBhdGNoZWQsIHNpemUpOwo+ICsJd2hpbGUgKGxlbiAmJiAhcmV0
KSB7Cj4gKwkJc2l6ZSA9IG1pbl90KHNpemVfdCwgUEFHRV9TSVpFICogMiAtIG9mZnNldF9pbl9w
YWdlKGFkZHIpLCBsZW4pOwo+ICsJCXJldCA9IF9fcGF0Y2hfaW5zbl93cml0ZShhZGRyLCBpbnNu
LCBzaXplKTsKClNhbWUgY29tbWVudCBhcyBhYm92ZS4KCgpCasO2cm4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
