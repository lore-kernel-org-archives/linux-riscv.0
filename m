Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3991C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 13:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zq6GBui1sXRL2E17DgFXES3vxzZ4XB+D7M97W2EvYgQ=; b=L0X9uU8QmLdUSr
	L6+3VAsCHjTkPm2A8qzNmqMLwomSIEpPs4xYD7Mjcz4XOf9C9mrcSEsduVwfZVfzvXQt7MtiCCdpq
	ltbKqOnH+bur7cZBaJqY4TK9rEr/+G6IInD8SbRbEXI9HSFPU5pCfH4t8oz+MpRnWwufItZQvb2lZ
	ixnwjIgzte54gTIkiFPp2J2MKYG1DdGS2fRYsiX/Ox+PZ8a6rl65QDIl8sODhp+Xfl6xEdmrMskhP
	afUbAvK4XXYHZ6UssdGIux0Y1Pl1SKoZ0Q7yIiqr0dcsFtrBus87DR975MGXwejVBQjZsL9rs3mSO
	uqN5bKArBr/H01CMi5Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFwKo-00HT3h-0v;
	Wed, 20 Dec 2023 13:10:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFwKk-00HT1l-1G
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 13:10:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1AFB6163C;
	Wed, 20 Dec 2023 13:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19026C433C7;
	Wed, 20 Dec 2023 13:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703077797;
	bh=kNBcPwaMlCBZq05QdM/ZhosCOAELdn7NQH61Zm2JFdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=geH8Po+2xTzfgztalOer3avEmmYlxn/45tUCRRhRPkul1OdegcfPNbzZr3tlUU9gL
	 Gr9cAMJrqZuYg4ZXywlT8vSMjii9EQa5EbRzNrvsitbUMRrwbGZ+Vs5h7oma4+HXCX
	 Y6lx9NhOjzB4pblu7fVu8HdFsBrqgIGPmNWbmGUcFzrh5wBtM9iKG3YDgpGMKzvzlh
	 8vB2ywPk0x3h2DIr7Fq1JC41iWIBZuH9vX9FxlyK05Uq+uzcK1I4v29L51UH7MToRn
	 KnLrmtlosx1RWynwXEXaab9s09kXI2/VKwn3Z8VcssHKf3wD1CPcmCmEDqkbqzUfsQ
	 heTJfZCiYSM3Q==
Date: Wed, 20 Dec 2023 20:57:20 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [External] [PATCH 2/4] riscv: tlb: convert __p*d_free_tlb() to
 inline functions
Message-ID: <ZYLksMHfzH1usBAb@xhacker>
References: <20231219175046.2496-1-jszhang@kernel.org>
 <20231219175046.2496-3-jszhang@kernel.org>
 <CAEEQ3wn6j0N-NSQjEqE8Ee9dGzGMJJ4CW2Yhw_njAaOgR8G_eQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wn6j0N-NSQjEqE8Ee9dGzGMJJ4CW2Yhw_njAaOgR8G_eQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_050958_510348_1986D308 
X-CRM114-Status: GOOD (  18.90  )
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

T24gV2VkLCBEZWMgMjAsIDIwMjMgYXQgMTA6NTk6MjJBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBKaXNoZW5nLAoKSGksCgo+IAo+IE9uIFdlZCwgRGVjIDIwLCAyMDIzIGF0IDI6MDTi
gK9BTSBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IFRo
aXMgaXMgdG8gcHJlcGFyZSBmb3IgZW5hYmxpbmcgTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRS4K
PiA+IE5vIGZ1bmN0aW9uYWxpdHkgY2hhbmdlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKaXNo
ZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BnYWxsb2MuaCB8IDU0ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BnYWxsb2MuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGdhbGxvYy5oCj4gPiBpbmRleCBhMTJmYjgzZmExZjUuLjNj
NWUzYmQxNWY0NiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGdhbGxv
Yy5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BnYWxsb2MuaAo+ID4gQEAgLTk1
LDEzICs5NSwxNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcHVkX2ZyZWUoc3RydWN0IG1tX3N0cnVj
dCAqbW0sIHB1ZF90ICpwdWQpCj4gPiAgICAgICAgICAgICAgICAgX19wdWRfZnJlZShtbSwgcHVk
KTsKPiA+ICB9Cj4gPgo+ID4gLSNkZWZpbmUgX19wdWRfZnJlZV90bGIodGxiLCBwdWQsIGFkZHIp
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gLWRvIHsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ID4gLSAgICAgICBpZiAocGd0YWJsZV9sNF9lbmFibGVkKSB7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gLSAgICAgICAgICAgICAgIHBhZ2V0YWJsZV9wdWRfZHRv
cih2aXJ0X3RvX3B0ZGVzYyhwdWQpKTsgICAgICAgICAgICAgICAgXAo+ID4gLSAgICAgICAgICAg
ICAgIHRsYl9yZW1vdmVfcGFnZV9wdGRlc2MoKHRsYiksIHZpcnRfdG9fcHRkZXNjKHB1ZCkpOyAg
ICAgXAo+ID4gLSAgICAgICB9ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gLX0gd2hpbGUgKDApCj4gPiArc3RhdGljIGlu
bGluZSB2b2lkIF9fcHVkX2ZyZWVfdGxiKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHB1ZF90ICpw
dWQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBh
ZGRyKQo+ID4gK3sKPiA+ICsgICAgICAgaWYgKHBndGFibGVfbDRfZW5hYmxlZCkgewo+ID4gKyAg
ICAgICAgICAgICAgIHN0cnVjdCBwdGRlc2MgKnB0ZGVzYyA9IHZpcnRfdG9fcHRkZXNjKHB1ZCk7
Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgcGFnZXRhYmxlX3B1ZF9kdG9yKHB0ZGVzYyk7Cj4g
PiArICAgICAgICAgICAgICAgdGxiX3JlbW92ZV9wYWdlX3B0ZGVzYyh0bGIsIHB0ZGVzYyk7Cj4g
PiArICAgICAgIH0KPiA+ICt9Cj4gPgo+ID4gICNkZWZpbmUgcDRkX2FsbG9jX29uZSBwNGRfYWxs
b2Nfb25lCj4gPiAgc3RhdGljIGlubGluZSBwNGRfdCAqcDRkX2FsbG9jX29uZShzdHJ1Y3QgbW1f
c3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyKQo+ID4gQEAgLTEzMCwxMSArMTMzLDEyIEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBwNGRfZnJlZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgcDRkX3Qg
KnA0ZCkKPiA+ICAgICAgICAgICAgICAgICBfX3A0ZF9mcmVlKG1tLCBwNGQpOwo+ID4gIH0KPiA+
Cj4gPiAtI2RlZmluZSBfX3A0ZF9mcmVlX3RsYih0bGIsIHA0ZCwgYWRkcikgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gPiAtZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAtICAgICAgIGlm
IChwZ3RhYmxlX2w1X2VuYWJsZWQpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gPiAtICAgICAgICAgICAgICAgdGxiX3JlbW92ZV9wYWdlX3B0ZGVzYygodGxiKSwg
dmlydF90b19wdGRlc2MocDRkKSk7ICAgICBcCj4gPiAtfSB3aGlsZSAoMCkKPiA+ICtzdGF0aWMg
aW5saW5lIHZvaWQgX19wNGRfZnJlZV90bGIoc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwgcDRkX3Qg
KnA0ZCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IGFkZHIpCj4gPiArewo+ID4gKyAgICAgICBpZiAocGd0YWJsZV9sNV9lbmFibGVkKQo+ID4gKyAg
ICAgICAgICAgICAgIHRsYl9yZW1vdmVfcGFnZV9wdGRlc2ModGxiLCB2aXJ0X3RvX3B0ZGVzYyhw
NGQpKTsKPiA+ICt9Cj4gPiAgI2VuZGlmIC8qIF9fUEFHRVRBQkxFX1BNRF9GT0xERUQgKi8KPiA+
Cj4gPiAgc3RhdGljIGlubGluZSB2b2lkIHN5bmNfa2VybmVsX21hcHBpbmdzKHBnZF90ICpwZ2Qp
Cj4gPiBAQCAtMTU5LDE5ICsxNjMsMjUgQEAgc3RhdGljIGlubGluZSBwZ2RfdCAqcGdkX2FsbG9j
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+ID4KPiA+ICAjaWZuZGVmIF9fUEFHRVRBQkxFX1BNRF9G
T0xERUQKPiA+Cj4gPiAtI2RlZmluZSBfX3BtZF9mcmVlX3RsYih0bGIsIHBtZCwgYWRkcikgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ID4gLWRvIHsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+IC0gICAgICAgcGFnZXRhYmxl
X3BtZF9kdG9yKHZpcnRfdG9fcHRkZXNjKHBtZCkpOyAgICAgICAgICAgICAgICBcCj4gPiAtICAg
ICAgIHRsYl9yZW1vdmVfcGFnZV9wdGRlc2MoKHRsYiksIHZpcnRfdG9fcHRkZXNjKHBtZCkpOyAg
ICAgXAo+ID4gLX0gd2hpbGUgKDApCj4gPiArc3RhdGljIGlubGluZSB2b2lkIF9fcG1kX2ZyZWVf
dGxiKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHBtZF90ICpwbWQsCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyKQo+ID4gK3sKPiA+ICsgICAg
ICAgc3RydWN0IHB0ZGVzYyAqcHRkZXNjID0gdmlydF90b19wdGRlc2MocG1kKTsKPiA+ICsKPiA+
ICsgICAgICAgcGFnZXRhYmxlX3BtZF9kdG9yKHB0ZGVzYyk7Cj4gPiArICAgICAgIHRsYl9yZW1v
dmVfcGFnZV9wdGRlc2ModGxiLCBwdGRlc2MpOwo+ID4gK30KPiA+Cj4gPiAgI2VuZGlmIC8qIF9f
UEFHRVRBQkxFX1BNRF9GT0xERUQgKi8KPiA+Cj4gPiAtI2RlZmluZSBfX3B0ZV9mcmVlX3RsYih0
bGIsIHB0ZSwgYnVmKSAgICAgICAgICAgICAgICAgIFwKPiA+IC1kbyB7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gLSAgICAgICBwYWdldGFi
bGVfcHRlX2R0b3IocGFnZV9wdGRlc2MocHRlKSk7ICAgICAgICAgICBcCj4gPiAtICAgICAgIHRs
Yl9yZW1vdmVfcGFnZV9wdGRlc2MoKHRsYiksIHBhZ2VfcHRkZXNjKHB0ZSkpO1wKPiA+IC19IHdo
aWxlICgwKQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3B0ZV9mcmVlX3RsYihzdHJ1Y3QgbW11
X2dhdGhlciAqdGxiLCBwZ3RhYmxlX3QgcHRlLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcikKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCBw
dGRlc2MgKnB0ZGVzYyA9IHBhZ2VfcHRkZXNjKHB0ZSk7Cj4gPiArCj4gPiArICAgICAgIHBhZ2V0
YWJsZV9wdGVfZHRvcihwdGRlc2MpOwo+ID4gKyAgICAgICB0bGJfcmVtb3ZlX3BhZ2VfcHRkZXNj
KHRsYiwgcHRkZXNjKTsKPiA+ICt9Cj4gPiAgI2VuZGlmIC8qIENPTkZJR19NTVUgKi8KPiA+Cj4g
PiAgI2VuZGlmIC8qIF9BU01fUklTQ1ZfUEdBTExPQ19IICovCj4gPiAtLQo+ID4gMi40MC4wCj4g
Pgo+IAo+IFdoeSBpcyBpdCBuZWNlc3NhcnkgdG8gY29udmVydCB0byBpbmxpbmUgZnVuY3Rpb25z
PwoKSG1tLCBpdCdzIG5vdCBuZWNlc3NhcnkgYnV0IGEgcGx1cywgdGhlIGlubGluZSB2ZXJzaW9u
J3MgcmVhZGFiaWxpdHkgYW5kCm1haW50YWluYWJpbGl0eSBpcyBiZXR0ZXIgdGhhbiBtYWNyb3MK
ClJlZ2FyZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
