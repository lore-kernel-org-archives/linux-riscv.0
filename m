Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF46C46467
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jan 2023 14:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19Qqd7OpagXpYpsQAMNQIcYK9pu+N6TEyNRb9wJSTGw=; b=ZhBvnHsMRFwMSa
	v/uWZNP4HOFXV0G0rB0+N6AKE2iEBUoPww5z1Jw/yrAN3packoCZHo4I08+0ehKGenK7S0HI11ZKK
	+PnZgD/B2eQkRHTa9R+g1t7HitGBrGCZkgEbrZ2alKG3kFYR5Qro3WJRNtUgYKBvaBqLwOaxEC2hi
	otUOwqf2bl2jios9/Jdvz1S97RIUezlidIi2wqZplHhp/vPODpFKVGEcsL3Dh4ZQ1OdL8Y3Nv0GjK
	1Lwtux91KuBKwtQwEYnO1OTU2RM2fcktXdPvpeMfKDVL2O48uyLuC45fctjWJU4unm3yYLz6tHuab
	MfzbCVdEmhGH7zxxSe+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH41J-007SNf-Iq; Sun, 15 Jan 2023 14:30:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH41F-007SMa-K4; Sun, 15 Jan 2023 14:29:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7057F60C8E;
	Sun, 15 Jan 2023 14:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1688EC433D2;
	Sun, 15 Jan 2023 14:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673792995;
	bh=6AtmHzTmKwhgZfSkJiaOs9M/vE83edxq/5rI8jWJTDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9UJrY4MuohrZre8aaAvWuiPtSMtKDoZMZQugcSnhN33c0oVIS2CkMhkPMag0lFfA
	 mrne9FkOTKLJvEl5VbFlH0KqL3CV6ZlDK3hKasVUIxs7qE1J7od5a1PNTNFMe8qUdU
	 bPD1ul6caPZogks//5UiMuMHNXoeKncnrZzJC938evyfwJpycJ9koF+7d33TX6A3q1
	 s/xtQjUMRzSORolZuBW8zDCEQ3AaHLN9OjC6RsxEg026KbrB8GUXWvzSzEUmkZVSvH
	 CcQZtStB/G92s5SjEQ63G7vGIkHQrgZTagnz57uP+3Hm6+xr1TpfJ4TOVndH2/UO1V
	 VtMKEKArJjMag==
Date: Sun, 15 Jan 2023 22:19:36 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v3 05/13] riscv: cpufeature: extend
 riscv_cpufeature_patch_func to all ISA extensions
Message-ID: <Y8QLeEECPqnjCS+2@xhacker>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-6-jszhang@kernel.org>
 <2398293.3Lj2Plt8kZ@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2398293.3Lj2Plt8kZ@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_062957_772612_298CE436 
X-CRM114-Status: GOOD (  22.98  )
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

T24gVGh1LCBKYW4gMTIsIDIwMjMgYXQgMTI6Mjk6NTdBTSArMDEwMCwgSGVpa28gU3TDvGJuZXIg
d3JvdGU6Cj4gSGkgSmlzaGVuZy4KCkhpIEhlaWtvLAoKPiAKPiBBbSBNaXR0d29jaCwgMTEuIEph
bnVhciAyMDIzLCAxODoxMDoxOSBDRVQgc2NocmllYiBKaXNoZW5nIFpoYW5nOgo+ID4gcmlzY3Zf
Y3B1ZmVhdHVyZV9wYXRjaF9mdW5jKCkgY3VycmVudGx5IG9ubHkgc2NhbnMgYSBsaW1pdGVkIHNl
dCBvZgo+ID4gY3B1ZmVhdHVyZXMsIGV4cGxpY2l0bHkgZGVmaW5lZCB3aXRoIG1hY3Jvcy4gRXh0
ZW5kIGl0IHRvIHByb2JlIGZvciBhbGwKPiA+IElTQSBleHRlbnNpb25zLgo+ID4gCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gPiBSZXZpZXdl
ZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFJldmlld2Vk
LWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+ID4gLS0tCj4gPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oIHwgIDkgKystLQo+ID4gIGFyY2gvcmlzY3Yv
a2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICB8IDYzICsrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDYxIGRlbGV0aW9ucygt
KQo+IAo+IGhtbW0gLi4uIEkgZG8gc2VlIGEgc29tZXdoYXQgYmlnIGNhdmVhdCBmb3IgdGhpcy4K
PiBhbmQgd291bGQgbGlrZSB0byB0YWtlIGJhY2sgbXkgUmV2aWV3ZWQtYnkgZm9yIG5vdwo+IAo+
IAo+IFdpdGggdGhpcyBjaGFuZ2Ugd2Ugd291bGQgbGltaXQgdGhlIHBhdGNoYWJsZSBjcHVmZWF0
dXJlcyB0byBhY3R1YWwKPiByaXNjdiBleHRlbnNpb25zLiBCdXQgY3B1ZmVhdHVyZXMgY2FuIGFs
c28gYmUgc29mdCBmZWF0dXJlcyBsaWtlCj4gaG93IHBlcmZvcm1hbnQgdGhlIGNvcmUgaGFuZGxl
cyB1bmFsaWduZWQgYWNjZXNzZXMuCgpCZXNpZGVzIERyZXcncyBjb21tZW50cyBhbmQgbXkgcmVw
bHkgYSBmZXcgbWludXRlcyBhZ28sIGhlcmUgYXJlCndoYXQgSSB0aG91Z2h0OiBJIGFncmVlIHdp
dGggeW91IGFib3V0ICJjcHVmZWF0dXJlcyBjYW4gYWxzbyBiZSBzb2Z0CmZlYXR1cmVzIiB3aGlj
aCBJIGNhbGxlZCBjcHUgcmVsYXRlZCBmZWF0dXJlcywgYnV0IGN1cnJlbnRseSB3ZQpkb24ndCBo
YXZlIHRoYXQgY2FzZSBpbiB1cmdlbnQsIHRoZSBTVjQ4IGFuZCBTVjU3IGFyZSBleHRlbnNpb25z
IG5vdwphcyBKZXNzaWNhIHBvaW50ZWQgb3V0WzFdLCBzbyBJIHBsYW5lZCB0byBzZW5kIGEgdjcg
dG8gYXBwbHkgdGhlCmFsdGVybmF0aXZlIG1lY2hhbmlzbSBmb3IgU1Y0OC9TVjU3LCBhbmQgSSB0
aGluayB3ZSBzdGlsbCBoYXZlIHRpbWUgdG8KcmV2aXNpdCB0aGUgImV4cGFuZGluZyBjcHVmZWF0
dXJlcyB0byBjb3ZlciBzb2Z0IGZlYXR1cmVzIi4gQnV0IHRoYXQKbmVlZCB0byBiZSBhZGRyZXNz
ZWQgaW4gYW5vdGhlciBpbXByb3ZlbWVudCBzZXJpZXMuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcmlzY3YvMzkxQUZDQjktRDMxNC00MjQzLTlFMzUtNkQ5NUI4MUM5NDAwQGpy
dGMyNy5jb20vCgo+IAo+IFNlZSBQYWxtZXIncyBzZXJpZXMgWzBdLgo+IAo+IAo+IEFsc28gdGhp
cyBlc3NlbnRpYWxseSBjb2RpZmllcyB0aGF0IGVhY2ggQUxURVJOQVRJVkUgY2FuIG9ubHkgZXZl
cgo+IGJlIGF0dGFjaGVkIHRvIGV4YWN0bHkgb25lIGV4dGVuc2lvbi4KPiAKPiBCdXQgY29udHJh
cnkgdG8gdmVuZG9yLWVycmF0YSwgaXQgaXMgdmVyeSBsaWtlbHkgdGhhdCB3ZSB3aWxsIG5lZWQK
PiBjb21iaW5hdGlvbnMgb2YgZGlmZmVyZW50IGV4dGVuc2lvbnMgZm9yIHNvbWUgYWx0ZXJuYXRp
dmVzIGluIHRoZSBmdXR1cmUuCj4gCj4gSW4gbXkgb3B0aW1pemF0aW9uIHF1ZXN0LCBJIGZvdW5k
IHRoYXQgaXQncyBhY3R1YWxseSBwcmV0dHkgbmVhdCB0bwo+IGNvbnZlcnQgdGhlIGVycmF0YS1p
ZCBmb3IgY3B1ZmVhdHVyZXMgdG8gYSBiaXRmaWVsZCBbMV0sIGJlY2F1c2UgdGhlbiBpdCdzCj4g
cG9zc2libGUgdG8ganVzdCBjb21iaW5lIGV4dGVuc2lvbnMgaW50byBzYWlkIGJpdGZpZWxkIFsy
XToKPiAKPiAJQUxURVJOQVRJVkVfMigibm9wIiwKPiAJCSAgICAgICJqIHN0cmNtcF96YmJfdW5h
bGlnbmVkIiwgMCwgQ1BVRkVBVFVSRV9aQkIgfCBDUFVGRUFUVVJFX0ZBU1RfVU5BTElHTkVELCAw
LCBDT05GSUdfUklTQ1ZfSVNBX1pCQiwKPiAJCSAgICAgICJqIHZhcmlhbnRfemJiIiwgMCwgQ1BV
RkVBVFVSRV9aQkIsIENQVUZFQVRVUkVfRkFTVF9VTkFMSUdORUQsIENPTkZJR19SSVNDVl9JU0Ff
WkJCKQo+IAo+IFt0aGUgYWRkaXRpb25hbCBmaWVsZCB0aGVyZSBtb2RlbHMgYSAibm90IiBjb21w
b25lbnRdCj4gCj4gU28gSSByZWFsbHkgZmVlbCB0aGlzIHdvdWxkIGxpbWl0IHVzIHF1aXRlIGEg
Yml0Lgo+IAo+IAo+IEhlaWtvCj4gCj4gCj4gCj4gWzBdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BhbG1lci9saW51eC5naXQvY29tbWl0Lz9oPXJpc2N2
LWh3cHJvYmUtdjEmaWQ9NTEwYzQ5MWNiOWQ4N2RjYmRjOTFjNjM1NThkYzcwNDk2ODcyMzI0MAo+
IFsxXSBodHRwczovL2dpdGh1Yi5jb20vbW1pbmQvbGludXgtcmlzY3YvY29tbWl0L2Y1N2E4OTYx
MjJlZTdlNjY2NjkyMDc5MzIwZmMzNTgyOTQzNGNmOTYKPiBbMl0gaHR0cHM6Ly9naXRodWIuY29t
L21taW5kL2xpbnV4LXJpc2N2L2NvbW1pdC84Y2VmNjE1ZGFiMGMwMGFkNjhhZjI2NTFlZTViOTNk
MDZiZTE3ZjI3I2RpZmYtMTk0Y2I4YTg2ZjlmYjliMDM2ODMyOTVmMjFjOGY0NmI0NTZhOWY5NDcz
N2YwMTcyNmRkYmNiYjllM2FhY2UyY1IxMgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
