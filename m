Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C6BEEC2B9
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 01:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRfTkLNqXW1aSAWXw3oC0i2cts+Zl0WlB/IezAIIzwE=; b=I9BMo3Qwb329+W
	qLL0on/pY4dLH2i9eFO0YuuoT3LRwcbs08YZsThVfx8kuUrgAB7zf6SdqKlzXdeqr7LsoG4XsaVTS
	aMMWi8wPJbmrq5GTrE6nDTDQOU6MEVcbhVUXyRyaZHZspYd7GEB4D36jRDUIto+dfrKi9+pKf4WRh
	OzPWzhnV5Jq6oluWS+a78PrH9COhdYgWBAYAHyeEKI3Afegpo0wMHFOSwFWRxlCsSNw5MA1dCscPG
	xrg+Y868E1y/3mA453/Xh/iPCDV43xvFzx/b86+Vvk3ond0lJwyBNaIbsLLQxs4HIPUO0iGwJN0Zq
	kjW2gSVoWAFMEmkLA5+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhQF-00000001Hlo-197b;
	Tue, 24 Feb 2026 01:41:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhQD-00000001Hlc-48ZL
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 01:41:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1752E6013F
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 01:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D0BC2BCB2
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 01:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771897267;
	bh=C0arap7e7ErnJBW4Gn1rKZG1I696BkggqBdWrjRMig8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PcFhxqGfs4x6ojAoWOJ2rb4klb5JydefbuelWwG/YTKlf877rWdg200FWqVWL0Ped
	 xaUkRJM/TQrgkSh2CE5IdQwx8uaCbXPpLNpr0t8AWdzOS2ohLwQY59VtaUYM8L1Nub
	 JRId/E+xxYgSdx+4a73xSEMcpaAFF11TI9uDEAlt+NNfbGwxxK60oVOwbEPBn72mvs
	 Mq05zOhFQJTII+DpobEDzC9eixZZu+WdyYNI0751THHEFjOM7PhLSGnNdmwuEawPI2
	 JrtrIyKpflD3bhPmbl3zHDTqKW0e3eHLDGBWSSmttDdCHmAQhkzud+B+888AGfFqbo
	 aOe51MazNHd7A==
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4358fb60802so3608716f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Feb 2026 17:41:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkSND1UKwkZ85kRBBwUPxyjsXWUrFJZNBVztLQTfdXtV9dTHYBa0PJ7zUXPdf/CVmLY6mgS4OxNN2l5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTvGF9G3Ytzo36ppBxCbGjXIHV0lJZ1eEWBD79pQFxQHyDCH56
	L7OcqZDIPc4V07/1dHmeYOfOkaTVUC6Aqc64v8k0UhkQr43tJst26WCbatC1MfeQxcAxyB59PDB
	kHw/bhgbXZLoEzmmFdYZoaiKw0SwV93I=
X-Received: by 2002:a5d:588d:0:b0:435:bdc2:461 with SMTP id
 ffacd0b85a97d-43962733de0mr29840042f8f.21.1771897266184; Mon, 23 Feb 2026
 17:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20260220090922.1506-1-jszhang@kernel.org> <20260220090922.1506-3-jszhang@kernel.org>
In-Reply-To: <20260220090922.1506-3-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 24 Feb 2026 09:40:54 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTG849M7mmWo+sri0xoGYkKYxMwSEDhVr-OedMfMWC0Kw@mail.gmail.com>
X-Gm-Features: AaiRm50lHvRaJWlxL081KRQ9Nsp_QxSbpbb_HVp27aHXjz14wyjJ-xtZBksh99A
Message-ID: <CAJF2gTTG849M7mmWo+sri0xoGYkKYxMwSEDhVr-OedMfMWC0Kw@mail.gmail.com>
Subject: Re: [PATCH 2/3] genirq: use runtime constant to optimize
 handle_arch_irq access
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
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

T24gRnJpLCBGZWIgMjAsIDIwMjYgYXQgNToyOOKAr1BNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIG9uIEdFTkVSSUNfSVJRX01VTFRJX0hB
TkRMRVIgcGxhdGZvcm1zLCB0aGUgaGFuZGxlX2FyY2hfaXJxCj4gaXMgYSBwb2ludGVyIHdoaWNo
IGlzIHNldCBkdXJpbmcgYm9vdGluZywgYW5kIGV2ZXJ5IGlycSBwcm9jZXNzaW5nIG5lZWRzCj4g
dG8gYWNjZXNzIGl0LCBzbyBpdCBzaXRzIGluIGhvdCBjb2RlIHBhdGguIFdlIGNhbiB1c2UgdGhl
Cj4gcnVudGltZSBjb25zdGFudCBtZWNoYW5pc20gd2hpY2ggd2FzIGludHJvZHVjZWQgYnkgTGlu
dXMgdG8gc3BlZWQgdXAKPiBpdHMgYWNjZXNzaW5nLgo+Cj4gVGVzdGVkIG9uIFNpcGVlZCBMaWNo
ZWUgUGkgNEEgKHJpc2N2NjQpIGJvYXJkLCB0aGUgcGVyZiBzY2hlZCBiZW5jaG1hcmsgaXMKPiBp
bXByb3ZlZCBieSB+NS44JQpUaHggZm9yIHRoZSB3b3JrLiBJdCdzIGEgdmlzaWJsZSBpbXByb3Zl
bWVudC4KCkNvbXBhcmVkIHRvIHRoZSBvcmlnaW5hbCBoYW5kbGVyIHBvaW50ZXIgYXBwcm9hY2gs
IHRoaXMgc29sdXRpb24KaW50cm9kdWNlcyBubyBvYnNlcnZhYmxlIGRyYXdiYWNrcy4gU2luY2Ug
dGhlIHN0YXRpY19jYWxsIGFsdGVybmF0aXZlCnJlcXVpcmVzIGZ1cnRoZXIgYW5hbHlzaXMgYW5k
IGNvbnNlbnN1cywgYWRvcHRpbmcgdGhpcyBpbXBsZW1lbnRhdGlvbgpzZXJ2ZXMgYXMgYSBwcmFn
bWF0aWMgaW50ZXJpbSBzdGVwLgoKU28sIEkgZ2l2ZToKUmV2aWV3ZWQtYnk6IEd1byBSZW4gKEFs
aWJhYmEgRGFtbyBBY2FkZW15KSA8Z3VvcmVuQGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1i
eTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+IC0tLQo+ICBpbmNsdWRlL2xp
bnV4L2lycS5oIHwgNCArKystCj4gIGtlcm5lbC9pcnEvaGFuZGxlLmMgfCA4ICsrKysrLS0tCj4g
IDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaXJxLmggYi9pbmNsdWRlL2xpbnV4L2lycS5oCj4gaW5k
ZXggOTUxYWNiZGI5Zjg0Li4yYmE0YThhZmI3MWUgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51
eC9pcnEuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvaXJxLmgKPiBAQCAtMTI3NCw2ICsxMjc0LDcg
QEAgdm9pZCBpcGlfbXV4X3Byb2Nlc3Modm9pZCk7Cj4gIGludCBpcGlfbXV4X2NyZWF0ZSh1bnNp
Z25lZCBpbnQgbnJfaXBpLCB2b2lkICgqbXV4X3NlbmQpKHVuc2lnbmVkIGludCBjcHUpKTsKPgo+
ICAjaWZkZWYgQ09ORklHX0dFTkVSSUNfSVJRX01VTFRJX0hBTkRMRVIKPiArI2luY2x1ZGUgPGFz
bS9ydW50aW1lLWNvbnN0Lmg+Cj4gIC8qCj4gICAqIFJlZ2lzdGVycyBhIGdlbmVyaWMgSVJRIGhh
bmRsaW5nIGZ1bmN0aW9uIGFzIHRoZSB0b3AtbGV2ZWwgSVJRIGhhbmRsZXIgaW4KPiAgICogdGhl
IHN5c3RlbSwgd2hpY2ggaXMgZ2VuZXJhbGx5IHRoZSBmaXJzdCBDIGNvZGUgY2FsbGVkIGZyb20g
YW4gYXNzZW1ibHkKPiBAQCAtMTI4OCw3ICsxMjg5LDggQEAgaW50IF9faW5pdCBzZXRfaGFuZGxl
X2lycSh2b2lkICgqaGFuZGxlX2lycSkoc3RydWN0IHB0X3JlZ3MgKikpOwo+ICAgKiBBbGxvd3Mg
aW50ZXJydXB0IGhhbmRsZXJzIHRvIGZpbmQgdGhlIGlycWNoaXAgdGhhdCdzIGJlZW4gcmVnaXN0
ZXJlZCBhcyB0aGUKPiAgICogdG9wLWxldmVsIElSUSBoYW5kbGVyLgo+ICAgKi8KPiAtZXh0ZXJu
IHZvaWQgKCpoYW5kbGVfYXJjaF9pcnEpKHN0cnVjdCBwdF9yZWdzICopIF9fcm9fYWZ0ZXJfaW5p
dDsKPiArZXh0ZXJuIHZvaWQgKCpfaGFuZGxlX2FyY2hfaXJxKShzdHJ1Y3QgcHRfcmVncyAqKSBf
X3JvX2FmdGVyX2luaXQ7Cj4gKyNkZWZpbmUgaGFuZGxlX2FyY2hfaXJxIHJ1bnRpbWVfY29uc3Rf
cHRyKF9oYW5kbGVfYXJjaF9pcnEpCj4gIGFzbWxpbmthZ2Ugdm9pZCBnZW5lcmljX2hhbmRsZV9h
cmNoX2lycShzdHJ1Y3QgcHRfcmVncyAqcmVncyk7Cj4gICNlbHNlCj4gICNpZm5kZWYgc2V0X2hh
bmRsZV9pcnEKPiBkaWZmIC0tZ2l0IGEva2VybmVsL2lycS9oYW5kbGUuYyBiL2tlcm5lbC9pcnEv
aGFuZGxlLmMKPiBpbmRleCBiN2Q1MjgyMTgzN2IuLmFhYzllN2IxMzAxZSAxMDA2NDQKPiAtLS0g
YS9rZXJuZWwvaXJxL2hhbmRsZS5jCj4gKysrIGIva2VybmVsL2lycS9oYW5kbGUuYwo+IEBAIC0x
NSwxMyArMTUsMTQgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbF9zdGF0Lmg+Cj4KPiAgI2lu
Y2x1ZGUgPGFzbS9pcnFfcmVncy5oPgo+ICsjaW5jbHVkZSA8YXNtL3J1bnRpbWUtY29uc3QuaD4K
Pgo+ICAjaW5jbHVkZSA8dHJhY2UvZXZlbnRzL2lycS5oPgo+Cj4gICNpbmNsdWRlICJpbnRlcm5h
bHMuaCIKPgo+ICAjaWZkZWYgQ09ORklHX0dFTkVSSUNfSVJRX01VTFRJX0hBTkRMRVIKPiAtdm9p
ZCAoKmhhbmRsZV9hcmNoX2lycSkoc3RydWN0IHB0X3JlZ3MgKikgX19yb19hZnRlcl9pbml0Owo+
ICt2b2lkICgqX2hhbmRsZV9hcmNoX2lycSkoc3RydWN0IHB0X3JlZ3MgKikgX19yb19hZnRlcl9p
bml0Owo+ICAjZW5kaWYKPgo+ICAvKioKPiBAQCAtMjcwLDEwICsyNzEsMTEgQEAgaXJxcmV0dXJu
X3QgaGFuZGxlX2lycV9ldmVudChzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpCj4gICNpZmRlZiBDT05G
SUdfR0VORVJJQ19JUlFfTVVMVElfSEFORExFUgo+ICBpbnQgX19pbml0IHNldF9oYW5kbGVfaXJx
KHZvaWQgKCpoYW5kbGVfaXJxKShzdHJ1Y3QgcHRfcmVncyAqKSkKPiAgewo+IC0gICAgICAgaWYg
KGhhbmRsZV9hcmNoX2lycSkKPiArICAgICAgIGlmIChfaGFuZGxlX2FyY2hfaXJxKQo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVCVVNZOwo+Cj4gLSAgICAgICBoYW5kbGVfYXJjaF9pcnEgPSBo
YW5kbGVfaXJxOwo+ICsgICAgICAgX2hhbmRsZV9hcmNoX2lycSA9IGhhbmRsZV9pcnE7Cj4gKyAg
ICAgICBydW50aW1lX2NvbnN0X2luaXQocHRyLCBfaGFuZGxlX2FyY2hfaXJxKTsKPiAgICAgICAg
IHJldHVybiAwOwo+ICB9Cj4KPiAtLQo+IDIuNTEuMAo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3Vv
IFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
