Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD358C83F26
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 17:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsPK8syzSKtnUta8cQ1sxAKB9yrTa57ppcdFAYTm6Qk=; b=HqmTC17RLpWGdA
	kQA/SXBx379bWiSWlQGTeGTaWxy7BxT7xX5IaP95jjTSOVAZGiBiKEYj3/S9MwzBcIPWjYpcoyZ4s
	h9FdzxOtCF3/KI1b7eBuS5C9c4+RkuzsJFKdUje0Mi2Y/ozxT2NMCFRKqHuX7fWg8EDpKmOUu+8ET
	JhUh0Dq+n0HrI8vUv23TDToF/Rf+34HHpY1pRxkjKVL6mFeeJ/cyRDaGPZ5MroX1y+5xcsZUQeV48
	U0YgJjAe4oDfA+CZ/nHdWE4fxHS/esJrbZD38sP77ffWvBVunxQ8ttqnCw/YM6+f5sf14lliSsJuH
	UrbqxJU3CbbSarqEvkug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugREJ-0000000F3Kg-3I2S;
	Mon, 28 Jul 2025 17:01:39 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQCa-0000000EtpU-1PVW
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 15:55:49 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e3c80c8127so9731245ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 08:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753718147; x=1754322947; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoQc7MqIQDw+6Efs0Tj4gYVMkroavuwmc+QEfRy0pSo=;
        b=DazZGwQMB5jXtoxSP8N2K5ibfKw94z1iCh7Eyfz7gfcMUvN9U2YndCe/MdKTiXvR2O
         Yq0KVkGNwhJ8eOVVECUrpvNy1ymepO+z3QFfdDfllp3lsWA3jxMuf1X3x04b2jyIxip1
         M3D+N8fXYIWsLXm9LxH9CnAriSRKHyAEZZ9FJtfbkNfuL+71BUD1GqT0suPv/x6qTf4K
         EQ8fpIpgEywwRaTKKO41rq3oZA251qhIzl4/E4rogIKFANAJaOOH0mFkqg8W9uylbOtm
         AJuJn/RsAcnWl600U4ytaYvTyhRmDfNlPpH8HLMDiSA+hXc1hPHOGQVG479dNNz3fUw0
         YBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753718147; x=1754322947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QoQc7MqIQDw+6Efs0Tj4gYVMkroavuwmc+QEfRy0pSo=;
        b=pugQCzkro47tkjWZG+ZL0GpEuaLkooBqh5/xUkNT82Bw34dWNi70yE39MP2LeOIcqY
         5C5YC2F+upAW4xn+GWry4/vO3+9tk6WWsIbTq7fgthRix5FhcwYNILT7prWDQwFmcUUP
         hRS2J9lIfkWPAB1zRzPTiMIUhPXrFgMi00n0/JyNdDrX0Vt0qrLOVdiljs/I8oBUkDq6
         V8DP3muRFN3R5F23hFOGoH+NaBCAJ0yFnJw+8HpzpsNeCfx6PLRsF3nj4hwOdI4vQBVf
         kCJoFM+bKkebdJeQ+DvReeIFn3AlAgOA5YwZYy1a9JrQcIp5TkWZtB3rZiyYMn7fYDr5
         qC5w==
X-Forwarded-Encrypted: i=1; AJvYcCUBhxfN9nCoXJwpR5eGdQrYewAm9yHvnEECMCpF8d+/7IYpYK9V3/rBv2F2UlrHPe9ZVojqMsnOABY1vA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk/niffiwp+i6Kdhll4+8yfbwc4iY6ZopVJMLswBcNdYxvfaFF
	XMzPdAl0QmCefNw+1VRV3EKArI3SWJLcuRj4uS9krMkBByBwVeLw5O46+phkgLwDFNqzWAuu3J5
	8jN7QL2CThQ+e+Qu4rRZLzLkaXsCDOQZkIucLrd6ecg==
X-Gm-Gg: ASbGncuGFOak60wpQl6E/bmGtRVZd67LZ13m1w1ULnimVNWv90xInpSqfAIAfmGiyAT
	rWLbf89KvK8uJQvJFn7YaCCFcSXJ7pC5kNOrHnsg//oAl746gjj8mLJSH8DBTAXIpeZutQLdZLE
	tH7jc8WFcE/Zoc0hDqnxgNKPOoCjFC4CaOlPsb+B7VUVoudK/tqCTwWBHpBkPowwnAMiJJERfPk
	UCg3KwNYj6r9Nn7Sw==
X-Google-Smtp-Source: AGHT+IGtyQUUSJu9cmUvDWm8BQBfdBuhLyQi/GAW+Z9BCrTE0REl/Sb8eIeFDFT/23beG7olLPsjNZMfh1lpKeQ/TI0=
X-Received: by 2002:a92:c242:0:b0:3e3:b74e:dd1a with SMTP id
 e9e14a558f8ab-3e3c5259f1fmr213615925ab.3.1753718147308; Mon, 28 Jul 2025
 08:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com>
 <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com>
In-Reply-To: <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Jul 2025 21:25:34 +0530
X-Gm-Features: Ac12FXyEGCGVkoPimb9v9aLpanQxwX644xefgJ4XRf_NEt1F87U2LZyXgZpr8DU
Message-ID: <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.17
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>, Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_085548_613416_28EF2459 
X-CRM114-Status: GOOD (  13.82  )
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

T24gTW9uLCBKdWwgMjgsIDIwMjUgYXQgOToyMuKAr1BNIFBhb2xvIEJvbnppbmkgPHBib256aW5p
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgMjUsIDIwMjUgYXQgMjowNuKAr1BN
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+ID4gICAgICAgUklTQy1W
OiBwZXJmL2t2bTogQWRkIHJlcG9ydGluZyBvZiBpbnRlcnJ1cHQgZXZlbnRzCj4KPiBTb21ldGhp
bmcgaGVyZSBhdGUgUXVhbiBaaG91J3MgU2lnbmVkLW9mZi1ieSBsaW5lLCB3aGljaCBpcyBwcmVz
ZW50IGF0Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci85NjkzMTMyZGY0ZDBmODU3YjhiZTNh
NzU3NTBjMzZiNDAyMTNmY2MwLjE3MjYyMTE2MzIuZ2l0Lnpob3VxdWFuQGlzY2FzLmFjLmNuCj4g
YnV0IG5vdCBpbiB5b3VyIGJyYW5jaC4KClRoZXJlIHdlcmUgY291cGxlIG9mICItLS0iIGxpbmVz
IGluIHBhdGNoIGRlc2NyaXB0aW9uIHdoaWNoCmNyZWF0ZWQgcHJvYmxlbXMgZm9yIG1lIHNvIEkg
dHJpZWQgZml4aW5nIG1hbnVhbGx5IGFuZAphY2NpZGVudGFsbHkgYXRlIFNpZ25lZC1vZmYtYnku
CgpTb3JyeSBhYm91dCB0aGF0LgoKUmVnYXJkcywKQW51cAoKPgo+IFBhb2xvCj4KPiA+ICAgICAg
IFJJU0MtVjogS1ZNOiBVc2UgZmluZF92bWFfaW50ZXJzZWN0aW9uKCkgdG8gc2VhcmNoIGZvciBp
bnRlcnNlY3RpbmcgVk1Bcwo+ID4gICAgICAgUklTQy1WOiBLVk06IEF2b2lkIHJlLWFjcXVpcmlu
ZyBtZW1zbG90IGluIGt2bV9yaXNjdl9nc3RhZ2VfbWFwKCkKPiA+Cj4gPiBTYW11ZWwgSG9sbGFu
ZCAoMik6Cj4gPiAgICAgICBSSVNDLVY6IEtWTTogRml4IGluY2x1c2lvbiBvZiBTbW5wbSBpbiB0
aGUgZ3Vlc3QgSVNBIGJpdG1hcAo+ID4gICAgICAgUklTQy1WOiBLVk06IEFkZCBzdXBwb3J0IGZv
ciBTQklfRldGVF9QT0lOVEVSX01BU0tJTkdfUE1MRU4KPiA+Cj4gPiBYdSBMdSAoMSk6Cj4gPiAg
ICAgICBSSVNDLVY6IEtWTTogRGVsZWdhdGUgaWxsZWdhbCBpbnN0cnVjdGlvbiBmYXVsdCB0byBW
UyBtb2RlCj4gPgo+ID4gIERvY3VtZW50YXRpb24vdmlydC9rdm0vYXBpLnJzdCAgICAgICAgICAg
ICAgICAgICAgIHwgICAyICstCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fYWlhLmgg
ICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2
bV9nc3RhZ2UuaCAgICAgICAgICAgICAgICB8ICA3MiArKysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV9ob3N0LmggICAgICAgICAgICAgICAgICB8IDEwOSArLS0tLQo+ID4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20va3ZtX21tdS5oICAgICAgICAgICAgICAgICAgIHwgIDIxICsKPiA+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV90bGIuaCAgICAgICAgICAgICAgICAgICB8ICA4
NCArKysrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCAgICAgICAg
ICAgICAgfCAgMTMgKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpX2Z3
ZnQuaCAgICAgICAgIHwgIDMzICsrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdm1p
ZC5oICAgICAgICAgICAgICAgICAgfCAgMjcgKysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20va3ZtLmggICAgICAgICAgICAgICAgICB8ICAgMiArCj4gPiAgYXJjaC9yaXNjdi9rdm0v
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwo+ID4gIGFyY2gvcmlz
Y3Yva3ZtL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKPiA+ICBh
cmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiAr
LQo+ID4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDEyICstCj4gPiAgYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAzMzggKysrKysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2t2bS9tYWluLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQo+ID4gIGFyY2gvcmlzY3Yva3Zt
L21tdS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNTA5ICsrKysrLS0tLS0tLS0t
LS0tLS0tLQo+ID4gIGFyY2gvcmlzY3Yva3ZtL3RsYi5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMTEwICsrLS0tCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgNDggKy0KPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQu
YyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyMCArLQo+ID4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHVfb25lcmVnLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDg0ICsrLS0KPiA+ICBhcmNoL3Jp
c2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1MyArKysKPiA+
ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgICAgICAgICAgICAgICAgICAgICB8IDMz
OCArKysrKysrKysrKysrKwo+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYyAg
ICAgICAgICAgICAgICAgIHwgIDE3ICstCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3Rh
LmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKy0KPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1
X3NiaV92MDEuYyAgICAgICAgICAgICAgICAgICAgICB8ICAyNSArLQo+ID4gIGFyY2gvcmlzY3Yv
a3ZtL3ZtLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICstCj4gPiAgYXJj
aC9yaXNjdi9rdm0vdm1pZC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMjUgKwo+
ID4gIHRvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL2t2bS1zdGF0LmMgICAgICAgICAgICAgIHwg
ICA2ICstCj4gPiAgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvcmlzY3ZfZXhjZXB0aW9uX3R5
cGVzLmggfCAgMzUgLS0KPiA+ICB0b29scy9wZXJmL2FyY2gvcmlzY3YvdXRpbC9yaXNjdl90cmFw
X3R5cGVzLmggICAgICB8ICA1NyArKysKPiA+ICAzMSBmaWxlcyBjaGFuZ2VkLCAxMzgyIGluc2Vy
dGlvbnMoKyksIDY4MiBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmgKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fbW11LmgKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdGxiLmgKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmlfZndmdC5oCj4gPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZtaWQuaAo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBhcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBh
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQgdG9v
bHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvcmlzY3ZfZXhjZXB0aW9uX3R5cGVzLmgKPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvcmlzY3ZfdHJhcF90eXBl
cy5oCj4gPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
