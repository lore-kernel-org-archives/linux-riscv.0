Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DA1C3DA6D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 08:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=epcvKc/CkSi9ITzh8W8vtJxTZJp2RswjXrDRbbSPC0c=; b=VyR37bqd0dgH/K
	Ky/lHchYdyqom7+xoWewOT1b3punUAPemah9X/dL+DC3ap+7nmfXef3X585unZFJFMFjNJUBVpS+I
	vO3vAnTddq7eCg1CjR4hLKHNk31ph3akVbfSdgziypI1MflGJg0gj4qqk3KpqtM9hDM1Q8DvCWTvi
	mo45elvXLhE2tW26BI5eibSGGTYFyTgwhKB/5pqSHfkRcysOWQt1D9FKBtkrwVtsErSKYdD5VZ5j0
	hmY0cZufGA2d1Pe0YykMEkwGUnIETxXPHMUmYNoqRmeCqO+fScdkiqWCcnVXptbd6UI9nQKZKEJjH
	Hq/ORwyqj7TURTI+z37w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINWq-00000003HOX-0v5D;
	Fri, 23 May 2025 08:13:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINMu-00000003Fqg-0KYP
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 08:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=clz6wJ7sb6+JOhnOE0ZhUZDPqWZbJDul6DzGmRHvYpA=; b=RAr9iNvaLUlY5lbGnWbwgvvXDi
	HjAV1JORdTEtaEwHCpNkcUx4P8axs5lmuEdCplZnfxdSqX5jBjI5M3w0KVWUQ0a9g9Gj6P2DrBF/w
	GCaKEgMP83GtIaOF0txnHdfMCIukxTItAeB8gPH6+kkzo6HOqHbch88LE01VtLxcPAsDLOXB5/XqJ
	EiTUYKwXeQsk3K1OOnmLW/s+cJwh0HlJ5PGIZaJVu7FjOpnwXOnSOLMXkU6DGx/a79nw7R1KRgnrn
	N2had8t0t96Pn7ZaCLUb0HiTt8hjxtUpZ0k3NYKIEGTY3WN0/6phK700TJbiR1mMuNZja/PY57nDq
	l+OtC0Eg==;
Received: from xry111.site ([89.208.246.23])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uINMq-00000001DF7-3IUw
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 08:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1747987370;
	bh=clz6wJ7sb6+JOhnOE0ZhUZDPqWZbJDul6DzGmRHvYpA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=EPN1M9O2RLCkr4x8a/DfjCUeWRza9CNfeIO0S0FSvZoGRHrwva5hX54LksT4h9+vi
	 ymSjC1uoseQrnEXiLd8vkMVZbuvMGXR4vEF9+VBYnkaGnHyDEa7qsV53Pd8Atz2jAI
	 HXodIxRG8kAb+67KM3Za/Ik/Qj9XjCIH//0N1E4E=
Received: from [192.168.124.38] (unknown [113.200.174.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 8DB0A65997;
	Fri, 23 May 2025 04:02:48 -0400 (EDT)
Message-ID: <7f840a23ab8865d7f205caec56817c660e237d64.camel@xry111.site>
Subject: Re: [PATCH v2] RISC-V: vDSO: Wire up getrandom() vDSO implementation
From: Xi Ruoyao <xry111@xry111.site>
To: Alexandre Ghiti <alex@ghiti.fr>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
	 <thomas.weissschuh@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley
	 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren
	 <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 23 May 2025 16:02:45 +0800
In-Reply-To: <a2477829-f3a5-4763-89f3-8c2c1f4716b8@ghiti.fr>
References: <20250411024600.16045-1-xry111@xry111.site>
	 <20250411095103-2aad099a-e4a1-4efb-8374-dd27bf05b668@linutronix.de>
	 <a2477829-f3a5-4763-89f3-8c2c1f4716b8@ghiti.fr>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_090301_219689_10469BD2 
X-CRM114-Status: GOOD (  18.42  )
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

T24gRnJpLCAyMDI1LTA1LTIzIGF0IDEwOjAxICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6
Cj4gSGkgWGksCj4gCj4gT24gNC8xMS8yNSAxMDowNCwgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6
Cj4gPiBPbiBGcmksIEFwciAxMSwgMjAyNSBhdCAxMDo0NjowMEFNICswODAwLCBYaSBSdW95YW8g
d3JvdGU6Cj4gPiA+IEhvb2sgdXAgdGhlIGdlbmVyaWMgdkRTTyBpbXBsZW1lbnRhdGlvbiB0byB0
aGUgZ2VuZXJpYyB2RFNPCj4gPiA+IGdldHJhbmRvbQo+ID4gPiBpbXBsZW1lbnRhdGlvbiBieSBw
cm92aWRpbmcgdGhlIHJlcXVpcmVkCj4gPiA+IF9fYXJjaF9jaGFjaGEyMF9ibG9ja3Nfbm9zdGFj
awo+ID4gPiBhbmQgZ2V0cmFuZG9tX3N5c2NhbGwgaW1wbGVtZW50YXRpb25zLiBBbHNvIHdpcmUg
dXAgdGhlIHNlbGZ0ZXN0cy4KPiA+ID4gCj4gPiA+IFRoZSBiZW5jaG1hcmsgcmVzdWx0Ogo+ID4g
PiAKPiA+ID4gCXZkc286IDI1MDAwMDAwIHRpbWVzIGluIDIuNDY2MzQxMzMzIHNlY29uZHMKPiA+
ID4gCWxpYmM6IDI1MDAwMDAwIHRpbWVzIGluIDQxLjQ0NzcyMDAwNSBzZWNvbmRzCj4gPiA+IAlz
eXNjYWxsOiAyNTAwMDAwMCB0aW1lcyBpbiA0MS4wNDM5MjY2NzIgc2Vjb25kcwo+ID4gPiAKPiA+
ID4gCXZkc286IDI1MDAwMDAwIHggMjU2IHRpbWVzIGluIDE2Mi4yODYyMTkzNTMgc2Vjb25kcwo+
ID4gPiAJbGliYzogMjUwMDAwMDAgeCAyNTYgdGltZXMgaW4gMjk1My44NTUwMTg2ODUgc2Vjb25k
cwo+ID4gPiAJc3lzY2FsbDogMjUwMDAwMDAgeCAyNTYgdGltZXMgaW4gMjc5Ni4yNjg1NDYwMDAg
c2Vjb25kcwo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogWGkgUnVveWFvIDx4cnkxMTFAeHJ5
MTExLnNpdGU+Cj4gPiA+IC0tLQo+ID4gPiAKPiA+ID4gW3YxXS0+djI6Cj4gPiA+IC0gRml4IHRo
ZSBjb21taXQgbWVzc2FnZS4KPiA+ID4gLSBPbmx5IGJ1aWxkIHRoZSB2RFNPIGdldHJhbmRvbSBj
b2RlIGlmIENPTkZJR19WRFNPX0dFVFJBTkRPTSwgdG8KPiA+ID4gwqDCoCB1bmJyZWFrIFJWMzIg
YnVpbGQuCj4gPiA+IC0gTGlrZXdpc2UsIG9ubHkgZW5hYmxlIHRoZSBzZWxmdGVzdCBpZiBfX3Jp
c2N2X3hsZW4gPT0gNjQuCj4gPiA+IAo+ID4gPiBbdjFdOgo+ID4gPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNTAyMjQxMjI1NDEuNjUwNDUtMS14cnkxMTFAeHJ5MTExLnNpdGUvCj4g
PiA+IAo+ID4gPiDCoCBhcmNoL3Jpc2N2L0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4gPiA+IMKgIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20uaMKgwqDCoMKgwqDCoCB8wqAgMzAgKysrCj4g
PiA+IMKgIGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCAxMiArCj4gPiA+IMKgIGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vZ2V0cmFu
ZG9tLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMCArCj4gPiA+IMKgIGFyY2gvcmlzY3Yv
a2VybmVsL3Zkc28vdmRzby5sZHMuU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsK
PiA+ID4gwqAgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby92Z2V0cmFuZG9tLWNoYWNoYS5TwqDCoMKg
IHwgMjQ0Cj4gPiA+ICsrKysrKysrKysrKysrKysrKwo+ID4gPiDCoCAuLi4vc2VsZnRlc3RzL3ZE
U08vdmdldHJhbmRvbS1jaGFjaGEuU8KgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKwo+ID4gPiDCoCA3
IGZpbGVzIGNoYW5nZWQsIDMwMCBpbnNlcnRpb25zKCspCj4gPiA+IMKgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vZ2V0cmFuZG9tLmgKPiA+ID4gwqAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vZ2V0cmFuZG9tLmMKPiA+ID4g
wqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vdmdldHJhbmRvbS1j
aGFjaGEuUwo+ID4gPHNuaXA+Cj4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3Zkc28vdmRzby5sZHMuUwo+ID4gPiBiL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vdmRzby5s
ZHMuUwo+ID4gPiBpbmRleCA4ZTg2OTY1YThhYWUuLmFiYzY5Y2RhMDQ0NSAxMDA2NDQKPiA+ID4g
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby92ZHNvLmxkcy5TCj4gPiA+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL3Zkc28vdmRzby5sZHMuUwo+ID4gPiBAQCAtODAsNiArODAsNyBAQCBWRVJT
SU9OCj4gPiA+IMKgICNpZm5kZWYgQ09NUEFUX1ZEU08KPiA+ID4gwqDCoAkJX192ZHNvX3Jpc2N2
X2h3cHJvYmU7Cj4gPiA+IMKgICNlbmRpZgo+ID4gPiArCQlfX3Zkc29fZ2V0cmFuZG9tOwo+ID4g
Rm9yIGNvbnNpc3RlbmN5IHRoaXMgY291bGQgYmUgZ2F0ZWQgYmVoaW5kIENPTkZJR19WRFNPX0dF
VFJBTkRPTS4KPiAKPiAKPiBOYXRoYW4gc2VudCBhIGZpeCBmb3IgdGhpcyBoZXJlOgo+IAo+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDQyMy1yaXNjdi1maXgtY29tcGF0X3Zkc28t
bGxkLXYyLTEtYjdiYmJjMjQ0NTAxQGtlcm5lbC5vcmcvCgpJJ3ZlIGdpdmVuIGl0IGFuIFItYi4g
IERvIHlvdSBwcmVmZXIgbWUgdG8gc3F1YXNoIHRoZSBwYXRjaGVzIGFuZCBrZWVwCnRoZSBTb0Ig
b2YgYm90aCBJIGFuZCBOYXRoYW4/CgotLSAKWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTExLnNpdGU+
ClNjaG9vbCBvZiBBZXJvc3BhY2UgU2NpZW5jZSBhbmQgVGVjaG5vbG9neSwgWGlkaWFuIFVuaXZl
cnNpdHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
