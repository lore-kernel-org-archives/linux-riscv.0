Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8294BC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mPy1Jt9OSoxBJzmCgaQla9S4G78oCxlrjz9rOPDtwQw=; b=Gqv2vsNtSt5UYw
	Hb2eWxWTS/fy6APLFhL8tmEVBgAcd5DpLpZPCG4JOayBL7CWHloMyKm6kB/o6mFC9rUlh9BDzhIo1
	s83SZuxyuaa/DBPhPzgPoURf6SdyrIp3K6ocyN7oEanDm+s8n9zA/UwCWvsXsH26XOOzYRvFOSP+p
	ZT/C0Q88nuGm4MeJ5IlqxyQuHHsr2HH7D3PAhDaPA5kuEdSJbh1vS6GtIeXrBARvHN5KsLVwLG65A
	ckl2SeeM8hiIIMPuA9A0IICYvUofxOdq3+MGCZoszrzLdj7bqeuIljBCr4dmy45pqwxbLAVdfgb4u
	czYqQFrv91uaM+W/eOjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWdD-0049OO-Js; Mon, 30 Jan 2023 16:03:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWdA-0049NB-7N
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 16:03:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D1F31B81183;
	Mon, 30 Jan 2023 15:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403F8C433EF;
	Mon, 30 Jan 2023 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675092497;
	bh=AcZ+6LQcfJ+3FmwU9zsCTeQShF/vTWZBT8hNMdtfOgM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=t771CfotsgOeet6SsmHZxofnxjF5IgLLG7iA5r5z06iAMCbpJjnIyIG+MOEehuAqJ
	 fk/Oi5NXadt6VvUNOjbA24vloE8vYk8pZ4mSmGiJfygmDZKkoiGsXW3e90hNeREC4d
	 1TGJYEYi9hori0Slb9aFavWLBEGX2KUtuSG9DhyH5DTqq2AHeBvcBPdKZK9laSIiXW
	 MNaBmm6Ijjuy/RZvasrEfpj1h1WWWN8vkiYUIWqOxpxGESDsNi2DOMnhDEPv8Uhnmi
	 k7kPebQbV1CnYeTTgP+jV3dPzgBJqPGSRfbm017Bvcw0OdKeTESp8JK8/MlqYYDM7E
	 6stLWoytBxhPQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Guo Ren <guoren@kernel.org>, "liaochang (A)" <liaochang1@huawei.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, mhiramat@kernel.org,
 conor.dooley@microchip.com, penberg@kernel.org, mark.rutland@arm.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Guo Ren
 <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
In-Reply-To: <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
References: <20230126161559.1467374-1-guoren@kernel.org>
 <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
Date: Mon, 30 Jan 2023 16:28:15 +0100
Message-ID: <87r0vc9h4g.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_080340_583414_CA5C20B1 
X-CRM114-Status: GOOD (  17.75  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyaXRlczoKCj4+IEluIHRoZSBzZXJpZSBvZiBS
SVNDViBPUFRQUk9CRVMgWzFdLCBpdCBwYXRjaGVzIGEgbG9uZy1qdW1wIGluc3RydWN0aW9ucyBw
YWlyCj4+IEFVSVBDL0pBTFIgaW4ga2VybmVsIHRleHQsIHNvIGluIG9yZGVyIHRvIGVuc3VyZSBv
dGhlciBDUFVzIGRvZXMgbm90IGV4ZWN1dGUKPj4gaW4gdGhlIGluc3RydWN0aW9ucyB0aGF0IHdp
bGwgYmUgbW9kaWZpZWQsIGl0IGlzIHN0aWxsIG5lZWQgdG8gc3RvcCBvdGhlciBDUFVzCj4+IHZp
YSBwYXRjaF90ZXh0IEFQSSwgb3IgeW91IGhhdmUgYW55IGJldHRlciBzb2x1dGlvbiB0byBhY2hp
ZXZlIHRoZSBwdXJwb3NlPwo+ICAtIFRoZSBzdG9wX21hY2hpbmUgaXMgYW4gZXhwZW5zaXZlIHdh
eSBhbGwgYXJjaGl0ZWN0dXJlcyBzaG91bGQKPiBhdm9pZCwgYW5kIHlvdSBjb3VsZCBrZWVwIHRo
YXQgaW4geW91ciBPUFRQUk9CRVMgaW1wbGVtZW50YXRpb24gZmlsZXMKPiB3aXRoIHN0YXRpYyBm
dW5jdGlvbnMuCj4gIC0gVGhlIHN0b3BfbWFjaGluZSBjb3VsZG4ndCB3b3JrIHdpdGggUFJFRU1Q
VElPTiwgc28geW91cgo+IGltcGxlbWVudGF0aW9uIG5lZWRzIHRvIHdvcmsgd2l0aCAhUFJFRU1Q
VElPTi4KCi4uLmFuZCBzdG9wX21hY2hpbmUoKSB3aXRoICFQUkVFTVBUSU9OIGlzIGJyb2tlbiBh
cyB3ZWxsLCB3aGVuIHlvdSdyZQpyZXBsYWNpbmcgbXVsdGlwbGUgaW5zdHJ1Y3Rpb25zIChzZWUg
TWFyaydzIHBvc3QgYXQgWzFdKS4gVGhlCnN0b3BfbWFjaGluZSgpIGRhbmNlIG1pZ2h0IHdvcmsg
d2hlbiB5b3UncmUgcmVwbGFjaW5nICpvbmUqIGluc3RydWN0aW9uLApub3QgbXVsdGlwbGUgYXMg
aW4gdGhlIFJJU0MtViBjYXNlLiBJJ2xsIGV4cGFuZCBvbiB0aGlzIGluIGEgY29tbWVudCBpbgp0
aGUgT1BUUFJPQkVTIHY2IHNlcmllcy4KCj4+ID4gIHN0YXRpYyB2b2lkIF9fa3Byb2JlcyBhcmNo
X3ByZXBhcmVfc2ltdWxhdGUoc3RydWN0IGtwcm9iZSAqcCkKPj4gPiBAQCAtMTE0LDE2ICsxMjAs
MjMgQEAgdm9pZCAqYWxsb2NfaW5zbl9wYWdlKHZvaWQpCj4+ID4gIC8qIGluc3RhbGwgYnJlYWtw
b2ludCBpbiB0ZXh0ICovCj4+ID4gIHZvaWQgX19rcHJvYmVzIGFyY2hfYXJtX2twcm9iZShzdHJ1
Y3Qga3Byb2JlICpwKQo+PiA+ICB7Cj4+ID4gLSAgICAgaWYgKChwLT5vcGNvZGUgJiBfX0lOU05f
TEVOR1RIX01BU0spID09IF9fSU5TTl9MRU5HVEhfMzIpCj4+ID4gLSAgICAgICAgICAgICBwYXRj
aF90ZXh0KHAtPmFkZHIsIF9fQlVHX0lOU05fMzIpOwo+PiA+IC0gICAgIGVsc2UKPj4gPiAtICAg
ICAgICAgICAgIHBhdGNoX3RleHQocC0+YWRkciwgX19CVUdfSU5TTl8xNik7Cj4+ID4gKyNpZmRl
ZiBDT05GSUdfUklTQ1ZfSVNBX0MKPj4gPiArICAgICB1MzIgb3Bjb2RlID0gX19CVUdfSU5TTl8x
NjsKPj4gPiArI2Vsc2UKPj4gPiArICAgICB1MzIgb3Bjb2RlID0gX19CVUdfSU5TTl8zMjsKPj4g
PiArI2VuZGlmCj4+ID4gKyAgICAgcGF0Y2hfdGV4dF9ub3N5bmMocC0+YWRkciwgJm9wY29kZSwg
R0VUX0lOU05fTEVOR1RIKG9wY29kZSkpOwo+Pgo+PiBTb3VuZHMgZ29vZCwgYnV0IGl0IHdpbGwg
bGVhdmUgc29tZSBSVkkgaW5zdHJ1Y3Rpb24gdHJ1bmNhdGVkIGluIGtlcm5lbCB0ZXh0LAo+PiBp
IGRvdWJ0IGtlcm5lbCBiZWhhdmlvciBkZXBlbmRzIG9uIHRoZSByZXN0IG9mIHRoZSB0cnVuY2F0
ZWQgaW5zdHJ1Y3Rpb24sIHdlbGwsCj4+IGl0IG5lZWRzIG1vcmUgc3RyaWN0IHRlc3RpbmcgdG8g
cHJvdmUgbXkgY29uY2VybiA6KQo+IEkgZG8gdGhpcyBvbiBwdXJwb3NlLCBhbmQgaXQgZG9lc24n
dCBjYXVzZSBhbnkgcHJvYmxlbXMuIERvbid0IHdvcnJ5Owo+IElGVSBodyBtdXN0IGVuZm9yY2Ug
dGhlIGZldGNoIHNlcXVlbmNlLCBhbmQgdGhlcmUgaXMgbm8gd2F5IHRvIGV4ZWN1dGUKPiBicm9r
ZW4gaW5zdHJ1Y3Rpb25zIGV2ZW4gaW4gdGhlIHNwZWN1bGF0aXZlIGV4ZWN1dGlvbiBwYXRoLgoK
VGhpcyBpcyBzdHJldGNoaW5nIHJlYWxpdHkgYSBiaXQgbXVjaC4gQVJNdjgsIGUuZy4sIGhhcyBh
IGNoYXB0ZXIgaW4gdGhlCkFybSBBUk0gWzJdIEFwcGVuZGl4IEIgIkNvbmN1cnJlbnQgbW9kaWZp
Y2F0aW9uIGFuZCBleGVjdXRpb24gb2YKaW5zdHJ1Y3Rpb25zIiAoQ01PRFgpLiAqU29tZSogaW5z
dHJ1Y3Rpb25zIGNhbiBiZSByZXBsYWNlZCBjb25jdXJyZW50bHksCmFuZCBvdGhlcnMgY2Fubm90
IHdpdGhvdXQgY2F1dGlvbi4gQXNzdW1pbmcgdGhhdCB0aGF0IGFsbCBSSVNDLVYKaW1wbGVtZW50
YXRpb25zIGNhbiwgaXMgYSBzdHJldGNoLiBSSVNDLVYgaGFzbid0IGV2ZW4gc3BlY2lmaWVkIHRo
ZQpiZWhhdmlvciBvZiBDTU9EWCAod2hpY2ggaXMgcHJvYmxlbWF0aWMpLgoKSWYgYW55dGhpbmcg
aXQgd291bGQgYmUgbW9yZSBsaWtlbHkgdGhhdCB0aGUgZXhpc3RpbmcKInN0b3BfbWFjaGluZSgp
LXRvLXJlcGxhY2Utd2l0aC1lYnJlYWsiIHdvcmtzIChhZ2FpbiwgcmVwbGFjaW5nIG9uZQppbnN0
cnVjdGlvbiBkb2VzIG5vdCBoYXZlIHRoZSAhUFJFRU1QVElPTiBpc3N1ZXMpLiBUaGVuIGFnYWlu
LCBubyBzcGVjLApzbyBtb3N0bHkgZ3Vlc3NpbmcgZnJvbSBteSBzaWRlLiA6LSgKCk9oLCBidXQg
dGhlIGV4aXN0aW5nICJlYnJlYWsgcmVwbGFjZSIgbWlnaHQgYmUgYnJva2VuIGxpa2UgWzNdLgoK
CkJqw7ZybgoKClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9ZNyUyRjZB
dFg1WDArNXFGNllARlZGRjc3UzBRMDVOLwpbMl0gaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9k
b2N1bWVudGF0aW9uL2RkaTA0ODcvbGF0ZXN0ClszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi8yMDIzMDEyNjE3MDYwNy4xNDg5MTQxLTItZ3VvcmVuQGtlcm5lbC5vcmcvCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
