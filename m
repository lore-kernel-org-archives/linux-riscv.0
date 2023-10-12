Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7850ACDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 11:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRgiLN1FyWtss4LOyoORXYZA6eLpTUzEPRHoitIYO8M=; b=Wss2C2Na19WmuY
	DJZGtLOZgYOxLpvPqzoblS0qY6grAEDI2LPpG+czdM5vX13WkjkoM9ZjFUf2LTMQ4GZTonxpdm3M/
	LHsB7H1XtDUzE+Xe2tnge1hHMNgOEsdrPx6W1aBG5VjfGL+I0QD3+GUpo7J5vmp5L2pZjhAbmOqp+
	qW8P2HNV/GAULUwHDIg0QaGchgQc8UnFHCZNHOK7TReLbCk8G8U4y99TckExW7qJDTv6L+ZqxFK0B
	qFFdDqhuXZ9AWWNrkYa76wDxAdy1Sk2P17o1dtuOaM7DAuLVsHEVMCnqLP5yjXTJO5LhYciEeGhEa
	gO4knEmz/JoG3wywbUAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu1l-000nH2-0w;
	Thu, 12 Oct 2023 11:38:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqu1h-000nG3-13;
	Thu, 12 Oct 2023 11:38:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B3D1EB82334;
	Thu, 12 Oct 2023 11:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F688C433C7;
	Thu, 12 Oct 2023 11:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697110727;
	bh=VIjNs8XAzFrSrD46vd4rLb+i7yS6FSpOQzPGdLFca3I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hyQLEv+1J8r5uGrpnxlhbH7cdZUYJ0sUhwdXhnH7m6avcqRv3zQP0sQ8LYdf6kWu7
	 /x/B7UHwjQPXgeKsT9kxZr2GB9McF6/+brZFPn1Tb8vtntOLd2ZLGCrWdhdV51SRpG
	 mKex4JFjTf6Jp+hTRKW1er/RxhxwXCGxmat7LLs5jzr3rMXlHwVLQaQtN5jr1ZRsfU
	 6Cvvwj9rHZjPx9fH1FkgB2pfdSwSrnCHFVouAwZzQprfpoBBkgp5i8kW3cxlnG/k7t
	 IOTbVEM1v972unfuwienAF3jcsYgP6l6gf41BNyPK1Wv3Qjy7L1n3vHC+XGwkkixMT
	 Dh/KwmVXd9J/g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Atish Patra
 <atishp@rivosinc.com>, Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v2 7/8] tty: Add SBI debug console support to HVC SBI
 driver
In-Reply-To: <20231012051509.738750-8-apatel@ventanamicro.com>
References: <20231012051509.738750-1-apatel@ventanamicro.com>
 <20231012051509.738750-8-apatel@ventanamicro.com>
Date: Thu, 12 Oct 2023 13:38:44 +0200
Message-ID: <87fs2ghxyz.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_043849_669412_0065093A 
X-CRM114-Status: GOOD (  17.37  )
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

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gRnJvbTogQXRp
c2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4KPiBSSVNDLVYgU0JJIHNwZWNpZmljYXRp
b24gc3VwcG9ydHMgYWR2YW5jZWQgZGVidWcgY29uc29sZQo+IHN1cHBvcnQgdmlhIFNCSSBEQkNO
IGV4dGVuc2lvbi4KPgo+IEV4dGVuZCB0aGUgSFZDIFNCSSBkcml2ZXIgdG8gc3VwcG9ydCBpdC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+
ICBkcml2ZXJzL3R0eS9odmMvS2NvbmZpZyAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy90dHkv
aHZjL2h2Y19yaXNjdl9zYmkuYyB8IDc2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LQo+ICAyIGZpbGVzIGNoYW5nZWQsIDcwIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvaHZjL0tjb25maWcgYi9kcml2ZXJzL3R0eS9odmMv
S2NvbmZpZwo+IGluZGV4IDRmOTI2NGQwMDVjMC4uNmUwNWM1YzdiY2ExIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvdHR5L2h2Yy9LY29uZmlnCj4gKysrIGIvZHJpdmVycy90dHkvaHZjL0tjb25maWcK
PiBAQCAtMTA4LDcgKzEwOCw3IEBAIGNvbmZpZyBIVkNfRENDX1NFUklBTElaRV9TTVAKPiAgCj4g
IGNvbmZpZyBIVkNfUklTQ1ZfU0JJCj4gIAlib29sICJSSVNDLVYgU0JJIGNvbnNvbGUgc3VwcG9y
dCIKPiAtCWRlcGVuZHMgb24gUklTQ1ZfU0JJX1YwMQo+ICsJZGVwZW5kcyBvbiBSSVNDVl9TQkkK
PiAgCXNlbGVjdCBIVkNfRFJJVkVSCj4gIAloZWxwCj4gIAkgIFRoaXMgZW5hYmxlcyBzdXBwb3J0
IGZvciBjb25zb2xlIG91dHB1dCB2aWEgUklTQy1WIFNCSSBjYWxscywgd2hpY2gKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy90dHkvaHZjL2h2Y19yaXNjdl9zYmkuYyBiL2RyaXZlcnMvdHR5L2h2Yy9o
dmNfcmlzY3Zfc2JpLmMKPiBpbmRleCAzMWY1M2ZhNzdlNGEuLmRhMzE4ZDdmNTVjNSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3R0eS9odmMvaHZjX3Jpc2N2X3NiaS5jCj4gKysrIGIvZHJpdmVycy90
dHkvaHZjL2h2Y19yaXNjdl9zYmkuYwo+IEBAIC0zOSwyMSArMzksODMgQEAgc3RhdGljIGludCBo
dmNfc2JpX3R0eV9nZXQodWludDMyX3QgdnRlcm1ubywgY2hhciAqYnVmLCBpbnQgY291bnQpCj4g
IAlyZXR1cm4gaTsKPiAgfQo+ICAKPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBodl9vcHMgaHZjX3Ni
aV9vcHMgPSB7Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaHZfb3BzIGh2Y19zYmlfdjAxX29wcyA9
IHsKPiAgCS5nZXRfY2hhcnMgPSBodmNfc2JpX3R0eV9nZXQsCj4gIAkucHV0X2NoYXJzID0gaHZj
X3NiaV90dHlfcHV0LAo+ICB9Owo+ICAKPiAtc3RhdGljIGludCBfX2luaXQgaHZjX3NiaV9pbml0
KHZvaWQpCj4gK3N0YXRpYyBpbnQgaHZjX3NiaV9kYmNuX3R0eV9wdXQodWludDMyX3QgdnRlcm1u
bywgY29uc3QgY2hhciAqYnVmLCBpbnQgY291bnQpCj4gIHsKPiAtCXJldHVybiBQVFJfRVJSX09S
X1pFUk8oaHZjX2FsbG9jKDAsIDAsICZodmNfc2JpX29wcywgMTYpKTsKPiArCXBoeXNfYWRkcl90
IHBhOwo+ICsJc3RydWN0IHNiaXJldCByZXQ7Cj4gKwo+ICsJaWYgKGlzX3ZtYWxsb2NfYWRkcihi
dWYpKQo+ICsJCXBhID0gcGFnZV90b19waHlzKHZtYWxsb2NfdG9fcGFnZShidWYpKSArIG9mZnNl
dF9pbl9wYWdlKGJ1Zik7CgpXaGF0IGlzIGFzc3VtZWQgZnJvbSBidWYgaGVyZT8gSWYgYnVmIGlz
IGNyb3NzaW5nIGEgcGFnZSwgeW91IG5lZWQgdG8KYWRqdXN0IHRoZSBjb3VudCwgbm8/Cgo+ICsJ
ZWxzZQo+ICsJCXBhID0gX19wYShidWYpOwo+ICsKPiArCWlmIChJU19FTkFCTEVEKENPTkZJR18z
MkJJVCkpCj4gKwkJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfREJDTiwgU0JJX0VYVF9EQkNOX0NP
TlNPTEVfV1JJVEUsCj4gKwkJCQljb3VudCwgbG93ZXJfMzJfYml0cyhwYSksIHVwcGVyXzMyX2Jp
dHMocGEpLAo+ICsJCQkJMCwgMCwgMCk7Cj4gKwllbHNlCj4gKwkJcmV0ID0gc2JpX2VjYWxsKFNC
SV9FWFRfREJDTiwgU0JJX0VYVF9EQkNOX0NPTlNPTEVfV1JJVEUsCj4gKwkJCQljb3VudCwgcGEs
IDAsIDAsIDAsIDApOwo+ICsJaWYgKHJldC5lcnJvcikKPiArCQlyZXR1cm4gMDsKPiArCj4gKwly
ZXR1cm4gY291bnQ7Cj4gIH0KPiAtZGV2aWNlX2luaXRjYWxsKGh2Y19zYmlfaW5pdCk7Cj4gIAo+
IC1zdGF0aWMgaW50IF9faW5pdCBodmNfc2JpX2NvbnNvbGVfaW5pdCh2b2lkKQo+ICtzdGF0aWMg
aW50IGh2Y19zYmlfZGJjbl90dHlfZ2V0KHVpbnQzMl90IHZ0ZXJtbm8sIGNoYXIgKmJ1ZiwgaW50
IGNvdW50KQo+ICB7Cj4gLQlodmNfaW5zdGFudGlhdGUoMCwgMCwgJmh2Y19zYmlfb3BzKTsKPiAr
CXBoeXNfYWRkcl90IHBhOwo+ICsJc3RydWN0IHNiaXJldCByZXQ7Cj4gKwo+ICsJaWYgKGlzX3Zt
YWxsb2NfYWRkcihidWYpKQo+ICsJCXBhID0gcGFnZV90b19waHlzKHZtYWxsb2NfdG9fcGFnZShi
dWYpKSArIG9mZnNldF9pbl9wYWdlKGJ1Zik7CgpBbmQgZGVmaW5pdGVseSBhZGp1c3QgY291bnQg
aGVyZSwgaWYgd2UncmUgY3Jvc3NpbmcgYSBwYWdlIQoKCkJqw7ZybgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
