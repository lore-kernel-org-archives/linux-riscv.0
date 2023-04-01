Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE0BC76196
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 18:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Np5NSM7ShpKh3DgNUt0HONy99xdaiiVVTMCqhA/VBjI=; b=UyKRwhqSjicpZQ
	9kpjNmzgE+qWsxF76m/Irhml0LmsFhDPGRngwTDz2NWx6iH/yo0ii1YDh/zN1gYPvA2y44LH505Og
	4udTT8hV0hVhtdGWGSTjgmlltGt3zzTJQ9AhLCzqLlOAGJkOT1OhN8vp/g8lIJahxoM67PuQz0t0E
	fv3Ua0UNb42JsX0/2C6liT1/DE7ygJDmrgv5peCWrBl+T42KHzSJrXklMfNQxRho6mFnI6ii6jipm
	/mJDzAjtVn11gGv34ni8DWolioGj80+iKN2M4oGezuf7+/41daVjLNMhIpUb6XWx5SJ1LN/cJUlDE
	V1yq7hiNMsmzgnPULYfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pigAV-00B8Cx-0N;
	Sat, 01 Apr 2023 18:41:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pigAQ-00B8Bu-1J
	for linux-riscv@lists.infradead.org;
	Sat, 01 Apr 2023 18:41:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D08EB60F83;
	Sat,  1 Apr 2023 18:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2A5C4339C;
	Sat,  1 Apr 2023 18:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680374490;
	bh=v2c3ywcdGxQkDvUzQ4IgCMNAfQ9lBrROXwHYIhOlSY4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZZBSlEctfAVjjLLWnyu770LAOuxyzXaTEC0m12oFpj575UJXXKkh2TsohlpOzpbie
	 Udtl29JQGx6/Qn9ve3XJbJsKwkOBMo8nKYYyKRd6COPOhFPc4UDfizsXRNSCfvQJA2
	 gjSF9+p2zkrkfYm2aqVBrTpuLYpG4KOQW/S/DRbNsyRYrSicPG2swf65Up9rtyWtMD
	 Bgirs0waG3SKvOYtgj5Cobxew8TrOgLTw9+/V8SWLno1OipDyvz8k3jBPR5R+i7VIh
	 M+VvVFMxpwjwBdo5cwk148nRt7rNUOWASSYAJ/FCGohZN/YvzjY03dqHDR9M30Icf/
	 iEjwy5U/M9miA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Guo Ren
 <guoren@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, palmer@rivosinc.com,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Yipeng Zou
 <zouyipeng@huawei.com>
Subject: Re: [PATCH -next V17 4/7] riscv: entry: Convert to generic entry
In-Reply-To: <2173635.1BCLMh4Saa@diego>
References: <20230222033021.983168-1-guoren@kernel.org>
 <87edp3loai.fsf@all.your.base.are.belong.to.us>
 <878rfblkee.fsf@all.your.base.are.belong.to.us> <2173635.1BCLMh4Saa@diego>
Date: Sat, 01 Apr 2023 20:41:27 +0200
Message-ID: <874jpzla20.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_114134_517130_792FDAFA 
X-CRM114-Status: GOOD (  22.82  )
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

SGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JpdGVzOgoKPiBBbSBTYW1zdGFnLCAx
LiBBcHJpbCAyMDIzLCAxNjo1ODowMSBDRVNUIHNjaHJpZWIgQmrDtnJuIFTDtnBlbDoKPj4gQmrD
tnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgo+PiAKPj4gPiAoTmFycm93aW5n
IHRoZSBDYyBsaXN0LikKPj4gPgo+PiA+IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
IHdyaXRlczoKPj4gPgo+PiA+Pj4+ID4gPiA+IFRoaXMgaGFzIHVuZm9ydHVuYXRlbHkgYnJva2Vu
IGJvb3RpbmcgbXkgdXN1YWwgTkZTIHJvb3RmcyBvbiBib3RoIG15IEQxCj4+ID4+Pj4gPiA+ID4g
YW5kIEljaWNsZS4gSXQncyBvbmUgb2YgdGhlIEZlZG9yYSBpbWFnZXMgZnJvbSBEYXZpZCwgSSB0
aGluayB0aGlzIG9uZToKPj4gPj4+PiA+ID4gPiBodHRwOi8vZmVkb3JhLnJpc2N2LnJvY2tzL2tv
amlmaWxlcy93b3JrL3Rhc2tzLzM5MzMvMTMxMzkzMy8KPj4gPj4+PiA+ID4gPgo+PiA+Pj4+ID4g
PiA+IEl0IGdldHMgcHJldHR5IGZhciBpbnRvIHRoaW5ncywgaXQncyBvbmNlIHN5c3RlbWQgaXMg
b3BlcmF0aW9uYWwgdGhhdAo+PiA+Pj4+ID4gPiA+IHRoaW5ncyBnbyBwZWFyIHNoYXBlZDoKPj4g
Pj4+PiA+ID4KPj4gPj4+PiA+ID4gU2hvdWxkYSBzYWlkLCBjYW4gc2hhcmUgdGhlIGZ1bGwgbG9n
cyBpZiByZXF1aXJlZCBvZiBjb3Vyc2UsIGJ1dCB0aGV5J3JlCj4+ID4+Pj4gPiA+IHF1aXRlIHZl
cmJvc2UgY29zIHN5c3RlbWQgZXRjLgo+PiA+Pj4+ID4KPj4gPj4+PiA+IEkgd2FzIGp1c3QgaW52
ZXN0aWdhdGluZyB0aGUgc2FtZSB0aGluZyBqdXN0IG5vdy4gU28gdGhhdCBzYXZlcyBtZSBzb21l
Cj4+ID4+Pj4gPiB0cmFja2luZyBkb3duIHRoZSBjdWxwcml0IDotKSAuCj4+ID4+Pj4gPgo+PiA+
Pj4+ID4gTXkgbWFpbiBxZW11IGlzIGxpdmluZyBhcyBhICJib2FyZCIgaW4gbXkgYm9hcmRmYXJt
IChhbHNvIGRvaW5nIG5mc3Jvb3QpCj4+ID4+Pj4gPiBhcyB3ZWxsIGFzIG15IGQxIG5lemhhIHdp
dGggbmZzcm9vdCB3YXMgYWZmZWN0ZWQuCj4+ID4+Pj4gQ2FuIHlvdSByZXByb2R1Y2UgaXQgd2l0
aCBxZW11PyBDb3VsZCBnaXZlIG1lIHNvbWUgdGlwcyBhbmQgbGV0IG1lCj4+ID4+Pj4gcmVwcm9k
dWNlIGl0IG9uIHFlbXU/Cj4+ID4+Cj4+ID4+IEZXSVcsIEknbSBnZXR0aW5nIHRoZSBzeXN0ZW1k
IGlzc3VlIHcvbyBORlMsIG9uIGEgcmVndWxhciA5cCB2aXJ0ZnMuCj4+ID4+Cj4+ID4+IHwgJCBz
dWRvIG1tZGVic3RyYXAgLS1hcmNoaXRlY3R1cmU9cmlzY3Y2NCBsdW5hciBydi1yb290ZnMgaHR0
cDovL3BvcnRzLnVidW50dS5jb20KPj4gPj4KPj4gPj4gYW5kIHRoZSByb290ZnMgcWVtdSBjb25m
aWc6Cj4+ID4+ICB8ICAtZnNkZXYgbG9jYWwsaWQ9cm9vdCxwYXRoPS9wYXRoL3RvL3J2LXJvb3Rm
cy8sc2VjdXJpdHlfbW9kZWw9bm9uZSBcCj4+ID4+ICB8ICAtZGV2aWNlIHZpcnRpby05cC1wY2ks
ZnNkZXY9cm9vdCxtb3VudF90YWc9L2Rldi9yb290IFwKPj4gPj4gIHwgIC1hcHBlbmQgInJvb3Q9
L2Rldi9yb290IHJ3IHJvb3Rmc3R5cGU9OXAgcm9vdGZsYWdzPXZlcnNpb249OXAyMDAwLkwsdHJh
bnM9dmlydGlvLGNhY2hlPW1tYXAsYWNjZXNzPWFueSBzZWN1cml0eT1ub25lIGVhcmx5Y29uIGNv
bnNvbGU9dHR5MCBjb25zb2xlPXR0eVMwIgo+PiA+Cj4+ID4gSSB0b29rIGEgY291cGxlIG9mIGRp
ZmZlcmVudCB2ZXJzaW9ucyBvZiB0aGUgc2VyaWVzIGZvciBhIHNwaW4sIGFuZCBmb3IKPj4gPiBt
ZSBpdCBzdG9wcyB3b3JraW5nIGJldHdlZW4gdGhlc2UgdmVyc2lvbnMuCj4+ID4KPj4gPiAkIGdp
dCBmZXRjaCBodHRwczovL2dpdGh1Yi5jb20vZ3VvcmVuODMvbGludXguZ2l0IGdlbmVyaWNfZW50
cnlfdjEyOmdlLXYxMgo+PiA+ICQgZ2l0IGZldGNoIGh0dHBzOi8vZ2l0aHViLmNvbS9ndW9yZW44
My9saW51eC5naXQgZ2VuZXJpY19lbnRyeV92MTM6ZzItdjEzCj4+ID4KPj4gPiB2MTIgaXMgaGFw
cHkgd2l0aCBzeXN0ZW1kLCB2MTMgaXMgbm90Lgo+PiAKPj4gSG1tLCB0aGlzIHBhdGNoIHNlZW1z
IHRvIHJlc29sdmUgdGhlIGlzc3VlIGZvciBtZToKPj4gCj4+IC0tODwtLQo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMK
Pj4gaW5kZXggICAgICAgMWY0ZTM3YmU3ZWIzLi44YzI1OGI3OGM5MjUgMTAwNjQ0Cj4+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYwo+PiBAQCAtMjcwLDExICsyNzAsMTEgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFw
X3NlY3Rpb24gdm9pZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+ICAg
ICAgICAgaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+PiAgICAgICAgICAgICAgICAgdWxvbmcgc3lz
Y2FsbCA9IHJlZ3MtPmE3Owo+PiAgCj4+IC0gICAgICAgICAgICAgICBzeXNjYWxsID0gc3lzY2Fs
bF9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzLCBzeXNjYWxsKTsKPj4gLQo+PiAgICAgICAgICAg
ICAgICAgcmVncy0+ZXBjICs9IDQ7Cj4+ICAgICAgICAgICAgICAgICByZWdzLT5vcmlnX2EwID0g
cmVncy0+YTA7Cj4+ICAKPj4gKyAgICAgICAgICAgICAgIHN5c2NhbGwgPSBzeXNjYWxsX2VudGVy
X2Zyb21fdXNlcl9tb2RlKHJlZ3MsIHN5c2NhbGwpOwo+PiArCj4+ICAgICAgICAgICAgICAgICBp
ZiAoc3lzY2FsbCA8IE5SX3N5c2NhbGxzKQo+PiAgICAgICAgICAgICAgICAgICAgICAgICBzeXNj
YWxsX2hhbmRsZXIocmVncywgc3lzY2FsbCk7Cj4+ICAgICAgICAgICAgICAgICBlbHNlCj4+IC0t
PjgtLQo+Cj4gV29vaG9vLCB0aGFua3MgZm9yIHRyYWNraW5nIHRoYXQgZG93bi4gVGhpcyBjaGFu
Z2UgbWFrZXMgYm90aCBteQo+IFFlbXUgYW5kIEQxLU5lemhhIGJvb3QgYWdhaW4uCj4KPj4gU2Vl
bXMgbGlrZSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkgY2xvYmJlciByZWdzLT5hMC4K
Pgo+IFdpdGggYTAgYWxzbyBiZWluZyB0aGUgcmV0dXJuIHZhbHVlIGluIHRoZSBjYWxsaW5nIGNv
bnZlbnRpb25zIChhbmQgYmVpbmcKPiB0aGUgc3lzY2FsbCB2YWx1ZSBoZXJlKSwgSSBndWVzcyB0
aGF0IGNvdWxkIGJlIHNvbWVob3cgZXhwZWN0ZWQgYW5kIHRodXMKPiBhcyB5b3VyIHBhdGNoIGRv
ZXMsIHRoZSBhMCB2YWx1ZSBzaG91bGQgYmUgc2F2ZWQgZmlyc3QgSSBndWVzcz8KPgo+IEFuIGl0
IGxvb2tzIGxpa2UgTG9vbmFyY2ggYWxzbyBkb2VzIHNhdmUgYTAgYmVmb3JlIGNhbGxpbmcKPiBz
eXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkgWzBdCj4KPiBSZXZpZXdlZC1ieTogSGVpa28g
U3R1ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHZydWxsLmV1Pgo+IFRlc3RlZC1ieTogSGVpa28gU3R1
ZWJuZXIgPGhlaWtvLnN0dWVibmVyQHZydWxsLmV1PgoKQ29vbCwgYW5kIHRoYW5rcyBmb3IgdGVz
dGluZy92ZXJpZnlpbmchIEknbGwgY29vayBhIHByb3BlciBwYXRjaCBvbgpNb25kYXkuCgoKQmrD
tnJuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
