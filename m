Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8638AC38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 07:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kX5ux7+0kqCRCKNtCqaxp7kaVOVVNl1znGM/Izt8Cug=; b=BWHqefsdjL/jWz
	pIJ5ZFFUTdn/WcT1M7zhS26rTiXELmKIgzExg3YIYSFOuDnLq8Z3gYDPYxg3bE3xrHIkYAHc6jUlF
	ZpG5MTK0oca2UUmipXnY4H9RZZZh3xfWsZ9F5bFj/VscYLsojahSLHqceTp507pb/5dh96vtqMcZV
	0wyydsXZzx45NOpBHch7LDdMAvGAb3999PLxessB2cw0H24NKaTG6Wxa+ATNizltvSSZrXb56Qs2u
	Ru5+dq4EdOFdqKA+I2zg2bUNDkSqX+nK+OVqmIZKmrmvrFq2MSSX6M6ZJkkIyWjWa9WRs5vN6LYj0
	EwY181gwgWjbgK6Hv+gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMkgA-006Wmf-JT; Tue, 31 Jan 2023 07:03:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMkg4-006WlS-U5
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 07:03:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3EABD61435;
	Tue, 31 Jan 2023 07:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB79EC4339B;
	Tue, 31 Jan 2023 07:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675148612;
	bh=yHafjtlGx559zob+5L07Mz3NVgnDF2i9p8fHCsPaqVs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CGPOf5Nt8Kl4jeb61PMy6b2ywdOjk2bWmBLtUg+MoE2pyxD9n6XgGcZDZY60+e29b
	 z+jxm5cVRyXVk09uZWmGVZPDdxQpdkigKGq8P49Bvk4Vg/3zft3ghuNkjVIoZA1KTi
	 csdvNbeYuewXHcUUPkM1/HRgzOzUBosSP40Rh4zumWJOE6WQn7Eied3CeuNrL3Tmj3
	 WpaKy+NCePBs36FaZ0mSrTk7JzI01Syvnd9fTIiZOwxwlK0PmANbPtTE0FCzxCNaUP
	 W9KNYNg7gsA2qy3iqNcVoK3K3hv/07IM9I0EcUUrHJ8gggX2pqJ0m1iucEf/APEGay
	 0MV5TnoWVw9KA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: "liaochang (A)" <liaochang1@huawei.com>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, mhiramat@kernel.org, conor.dooley@microchip.com,
 penberg@kernel.org, mark.rutland@arm.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
In-Reply-To: <CAJF2gTSHQ7J1a-0tTzaLAHeUTqbco5OXJgGDZpgB-SLb+teL2A@mail.gmail.com>
References: <20230126161559.1467374-1-guoren@kernel.org>
 <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTQZWO8Ubi60nHn-J-8czqBnsp1Kdyoim3uLNkjbYd-H8Q@mail.gmail.com>
 <CAJF2gTSHQ7J1a-0tTzaLAHeUTqbco5OXJgGDZpgB-SLb+teL2A@mail.gmail.com>
Date: Tue, 31 Jan 2023 08:03:29 +0100
Message-ID: <87cz6vtcce.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_230337_340762_700F7074 
X-CRM114-Status: GOOD (  21.89  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyaXRlczoKCj4+ID4gPj4gPiAgc3RhdGljIHZv
aWQgX19rcHJvYmVzIGFyY2hfcHJlcGFyZV9zaW11bGF0ZShzdHJ1Y3Qga3Byb2JlICpwKQo+PiA+
ID4+ID4gQEAgLTExNCwxNiArMTIwLDIzIEBAIHZvaWQgKmFsbG9jX2luc25fcGFnZSh2b2lkKQo+
PiA+ID4+ID4gIC8qIGluc3RhbGwgYnJlYWtwb2ludCBpbiB0ZXh0ICovCj4+ID4gPj4gPiAgdm9p
ZCBfX2twcm9iZXMgYXJjaF9hcm1fa3Byb2JlKHN0cnVjdCBrcHJvYmUgKnApCj4+ID4gPj4gPiAg
ewo+PiA+ID4+ID4gLSAgICAgaWYgKChwLT5vcGNvZGUgJiBfX0lOU05fTEVOR1RIX01BU0spID09
IF9fSU5TTl9MRU5HVEhfMzIpCj4+ID4gPj4gPiAtICAgICAgICAgICAgIHBhdGNoX3RleHQocC0+
YWRkciwgX19CVUdfSU5TTl8zMik7Cj4+ID4gPj4gPiAtICAgICBlbHNlCj4+ID4gPj4gPiAtICAg
ICAgICAgICAgIHBhdGNoX3RleHQocC0+YWRkciwgX19CVUdfSU5TTl8xNik7Cj4+ID4gPj4gPiAr
I2lmZGVmIENPTkZJR19SSVNDVl9JU0FfQwo+PiA+ID4+ID4gKyAgICAgdTMyIG9wY29kZSA9IF9f
QlVHX0lOU05fMTY7Cj4+ID4gPj4gPiArI2Vsc2UKPj4gPiA+PiA+ICsgICAgIHUzMiBvcGNvZGUg
PSBfX0JVR19JTlNOXzMyOwo+PiA+ID4+ID4gKyNlbmRpZgo+PiA+ID4+ID4gKyAgICAgcGF0Y2hf
dGV4dF9ub3N5bmMocC0+YWRkciwgJm9wY29kZSwgR0VUX0lOU05fTEVOR1RIKG9wY29kZSkpOwo+
PiA+ID4+Cj4+ID4gPj4gU291bmRzIGdvb2QsIGJ1dCBpdCB3aWxsIGxlYXZlIHNvbWUgUlZJIGlu
c3RydWN0aW9uIHRydW5jYXRlZCBpbiBrZXJuZWwgdGV4dCwKPj4gPiA+PiBpIGRvdWJ0IGtlcm5l
bCBiZWhhdmlvciBkZXBlbmRzIG9uIHRoZSByZXN0IG9mIHRoZSB0cnVuY2F0ZWQgaW5zdHJ1Y3Rp
b24sIHdlbGwsCj4+ID4gPj4gaXQgbmVlZHMgbW9yZSBzdHJpY3QgdGVzdGluZyB0byBwcm92ZSBt
eSBjb25jZXJuIDopCj4+ID4gPiBJIGRvIHRoaXMgb24gcHVycG9zZSwgYW5kIGl0IGRvZXNuJ3Qg
Y2F1c2UgYW55IHByb2JsZW1zLiBEb24ndCB3b3JyeTsKPj4gPiA+IElGVSBodyBtdXN0IGVuZm9y
Y2UgdGhlIGZldGNoIHNlcXVlbmNlLCBhbmQgdGhlcmUgaXMgbm8gd2F5IHRvIGV4ZWN1dGUKPj4g
PiA+IGJyb2tlbiBpbnN0cnVjdGlvbnMgZXZlbiBpbiB0aGUgc3BlY3VsYXRpdmUgZXhlY3V0aW9u
IHBhdGguCj4+ID4KPj4gPiBUaGlzIGlzIHN0cmV0Y2hpbmcgcmVhbGl0eSBhIGJpdCBtdWNoLiBB
Uk12OCwgZS5nLiwgaGFzIGEgY2hhcHRlciBpbiB0aGUKPj4gPiBBcm0gQVJNIFsyXSBBcHBlbmRp
eCBCICJDb25jdXJyZW50IG1vZGlmaWNhdGlvbiBhbmQgZXhlY3V0aW9uIG9mCj4+ID4gaW5zdHJ1
Y3Rpb25zIiAoQ01PRFgpLiAqU29tZSogaW5zdHJ1Y3Rpb25zIGNhbiBiZSByZXBsYWNlZCBjb25j
dXJyZW50bHksCj4+ID4gYW5kIG90aGVycyBjYW5ub3Qgd2l0aG91dCBjYXV0aW9uLiBBc3N1bWlu
ZyB0aGF0IHRoYXQgYWxsIFJJU0MtVgo+PiA+IGltcGxlbWVudGF0aW9ucyBjYW4sIGlzIGEgc3Ry
ZXRjaC4gUklTQy1WIGhhc24ndCBldmVuIHNwZWNpZmllZCB0aGUKPj4gPiBiZWhhdmlvciBvZiBD
TU9EWCAod2hpY2ggaXMgcHJvYmxlbWF0aWMpLgo+PiBIZXJlIHdlIG9ubHkgdXNlIG9uZSBzdy9z
aCBpbnN0cnVjdGlvbiB0byBzdG9yZSBhIDMyYml0LzE2Yml0IGFsaWduZWQgZWxlbWVudDoKPj4K
Pj4gSU5TTl8wIDwtIGVicmVhayAoMTZiaXQvMzJiaXQgYWxpZ25lZCkKPj4gSU5TTl8xCj4+IElO
U05fMgo+Pgo+PiBUaGUgZWJyZWFrIHdvdWxkIGNhdXNlIGFuIGV4Y2VwdGlvbiB3aGljaCBpbXBs
aWVzIGEgaHVnZSBmZW5jZSBoZXJlLgo+PiBObyBtYWNoaW5lIGNvdWxkIGdpdmUgYSBzcGVjdWxh
dGl2ZSBleGVjdXRpb24gZm9yIHRoZSBlYnJlYWsgcGF0aC4KPgo+IEZvciBBUk12NywgZWJyZWFr
IGlzIGFsc28gc2FmZToKPgo+IC0tLQo+IENvbmN1cnJlbnQgbW9kaWZpY2F0aW9uIGFuZCBleGVj
dXRpb24gb2YgaW5zdHJ1Y3Rpb25zCj4KPiBUaGUgQVJNdjcgYXJjaGl0ZWN0dXJlIGxpbWl0cyB0
aGUgc2V0IG9mIGluc3RydWN0aW9ucyB0aGF0IGNhbiBiZQo+IGV4ZWN1dGVkIGJ5IG9uZSB0aHJl
YWQgb2YgZXhlY3V0aW9uIGFzIHRoZXkgYXJlIGJlaW5nIG1vZGlmaWVkIGJ5Cj4gYW5vdGhlciB0
aHJlYWQgb2YgZXhlY3V0aW9uIHdpdGhvdXQgcmVxdWlyaW5nIGV4cGxpY2l0Cj4gc3luY2hyb25p
emF0aW9uLgo+IC4uLgo+IFRoZSBpbnN0cnVjdGlvbnMgdG8gd2hpY2ggdGhpcyBndWFyYW50ZWUg
YXBwbGllcyBhcmU6Cj4gSW4gdGhlIFRodW1iIGluc3RydWN0aW9uIHNldAo+IFRoZSAxNi1iaXQg
ZW5jb2RpbmdzIG9mIHRoZSBCLCBOT1AsIEJLUFQsIGFuZCBTVkMgaW5zdHJ1Y3Rpb25zLgo+IC4u
Lgo+IEluIHRoZSBBUk0gaW5zdHJ1Y3Rpb24gc2V0Cj4gVGhlIEIsIEJMLCBOT1AsIEJLUFQsIFNW
QywgSFZDLCBhbmQgU01DIGluc3RydWN0aW9ucy4KPiAtLS0KClJpZ2h0LCBhbmQgIkI3LjcgQ29u
Y3VycmVudCBtb2RpZmljYXRpb24gYW5kIGV4ZWN1dGlvbiBvZiBpbnN0cnVjdGlvbnMiCkFybXY4
LU0gQVJNIChodHRwczovL2RldmVsb3Blci5hcm0uY29tL2RvY3VtZW50YXRpb24vZGRpMDU1My9s
YXRlc3QpLAphbHNvIGRlZmluZXMgdGhhdCBjZXJ0YWluIGluc3RydWN0aW9ucyBjYW4gYmUgY29u
Y3VycmVudGx5IG1vZGlmaWVkLgoKVGhpcyBpcyBiZXNpZGUgdGhlIHBvaW50LiBXZSBkb24ndCBo
YXZlIGEgc3BlYyBmb3IgUklTQy1WLCB5ZXQuIFdlJ3JlCm5vdCBldmVuIHN1cmUgd2UgY2FuIChp
biBnZW5lcmFsKSByZXBsYWNlIHRoZSBsb3dlciAxNmIgb2YgYW4gMzJiCmluc3RydWN0aW9uIGNv
bmN1cnJlbnRseS4gIkl0J3MgaW4gdGhlIEFybXY4LU0gc3BlYyIgaXMgbm90IGVub3VnaC4KCkkn
ZCBsb3ZlIHRvIGhhdmUgYSBzcGVjIGRlZmluaW5nIHRoYXQsIGFuZCBEZXJlayBldCBhbCBoYXMg
c3RhcnRlZApbMV0uIFNsaWRlICM5OSBoYXMgQ01PRFggZGV0YWlscy4KCllvdXIgcGF0Y2ggbWln
aHQgYmUgZ3JlYXQgZm9yIHNvbWUgSFcgKHdoaWNoPyksIGJ1dCBub3QgZW5vdWdoIGZvcgpnZW5l
cmFsIFJJU0MtViBMaW51eCAoeWV0KS4gVW50aWwgdGhlbiwgdGhlIGV4aXN0aW5nIHN0b3BfbWFj
aGluZSgpIHdheQppcyB1bmZvcnR1bmF0ZWx5IHRoZSB3YXkgdG8gZ28uCgoKQmrDtnJuCgpbMV0g
aHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWotZXh0ZW5zaW9uL2Jsb2IvbWFzdGVyL2lk
LWNvbnNpc3RlbmN5LXByb3Bvc2FsLnBkZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
