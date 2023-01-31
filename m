Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33738C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 06:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vbBJrhmYsAOG19c2P5aBZ2SC+d2C8WfzXT3jiDfC09U=; b=bJSnNjnnkjJjy/
	mkCtbqsKhptbZvK/E8G5cZj/WbGRtYfL/YDpboZ0ZDqB7wQYrSuSo+3vNF2w187Lw9H2YwNBWvQ3I
	gdJvhQUbbHGe9SRHdD4C9Juc9Wt+D60SH6+W3Wh/eDFEmJzyUcjidmw4mbC0HxSIUJYXdmLbw4q5n
	bUrs4S+prJERpQOraTgugNFrUZlCj9SHHZsvqgOqT5M04omU2sebwl/Tkho6YuOrIlCdW0or1UsQH
	/Qv90b1CiYscVH4hcQHo7XFG9d+vFwU5zO0mdoQEMDfWcjnwB0g2diOb358MEEqVBj/noW27JeAai
	Ln1FXf4BTLlg1RrPWC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMkJz-006U3D-SB; Tue, 31 Jan 2023 06:40:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMkJw-006U2N-OY
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 06:40:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5BCF1B819FE;
	Tue, 31 Jan 2023 06:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7208C433D2;
	Tue, 31 Jan 2023 06:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675147243;
	bh=HGGqP/Pod6SsODLD3CZR2XKgRMAKC38fnBK/HFU5oRE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=et1PKkGleQIe9Ebmz0wVxWaM3B6pL2quMxKzOs8ddeE8+fDpa2JLiEN8tdlsEwSt+
	 r2B5gMlZw9Yaeey/RewYXbzL/4TWBByH/6K3kO2popDXT3jk4eIExkxnhOZWdgjVM1
	 3S78lKkvZc1fLNBjrl2x9ICdxUCI5U4vBtMZy5k9IpbaM2ACIsJqHCiahbFmXOYQwr
	 OoF5AcMbqBYOfQsP0QkWnXL4SXUQWpGR53GGkhcGaKknFIWe6QQWe0k4uAwmZafGMe
	 yia0qaODJ5Mg7WLM1Xw+ogniiVH44P5OCeRnUOiqninWIRulyduExZ3bYkK4AcTc6O
	 Whk21Szhc2EjQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: "liaochang (A)" <liaochang1@huawei.com>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, mhiramat@kernel.org, conor.dooley@microchip.com,
 penberg@kernel.org, mark.rutland@arm.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
In-Reply-To: <CAJF2gTQZWO8Ubi60nHn-J-8czqBnsp1Kdyoim3uLNkjbYd-H8Q@mail.gmail.com>
References: <20230126161559.1467374-1-guoren@kernel.org>
 <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTQZWO8Ubi60nHn-J-8czqBnsp1Kdyoim3uLNkjbYd-H8Q@mail.gmail.com>
Date: Tue, 31 Jan 2023 07:40:40 +0100
Message-ID: <87ilgntdef.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_224045_100474_202A70AA 
X-CRM114-Status: GOOD (  21.86  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gT24gTW9uLCBKYW4gMzAsIDIw
MjMgYXQgMTE6MjggUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+
Cj4+IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4+Cj4+ID4+IEluIHRoZSBz
ZXJpZSBvZiBSSVNDViBPUFRQUk9CRVMgWzFdLCBpdCBwYXRjaGVzIGEgbG9uZy1qdW1wIGluc3Ry
dWN0aW9ucyBwYWlyCj4+ID4+IEFVSVBDL0pBTFIgaW4ga2VybmVsIHRleHQsIHNvIGluIG9yZGVy
IHRvIGVuc3VyZSBvdGhlciBDUFVzIGRvZXMgbm90IGV4ZWN1dGUKPj4gPj4gaW4gdGhlIGluc3Ry
dWN0aW9ucyB0aGF0IHdpbGwgYmUgbW9kaWZpZWQsIGl0IGlzIHN0aWxsIG5lZWQgdG8gc3RvcCBv
dGhlciBDUFVzCj4+ID4+IHZpYSBwYXRjaF90ZXh0IEFQSSwgb3IgeW91IGhhdmUgYW55IGJldHRl
ciBzb2x1dGlvbiB0byBhY2hpZXZlIHRoZSBwdXJwb3NlPwo+PiA+ICAtIFRoZSBzdG9wX21hY2hp
bmUgaXMgYW4gZXhwZW5zaXZlIHdheSBhbGwgYXJjaGl0ZWN0dXJlcyBzaG91bGQKPj4gPiBhdm9p
ZCwgYW5kIHlvdSBjb3VsZCBrZWVwIHRoYXQgaW4geW91ciBPUFRQUk9CRVMgaW1wbGVtZW50YXRp
b24gZmlsZXMKPj4gPiB3aXRoIHN0YXRpYyBmdW5jdGlvbnMuCj4+ID4gIC0gVGhlIHN0b3BfbWFj
aGluZSBjb3VsZG4ndCB3b3JrIHdpdGggUFJFRU1QVElPTiwgc28geW91cgo+PiA+IGltcGxlbWVu
dGF0aW9uIG5lZWRzIHRvIHdvcmsgd2l0aCAhUFJFRU1QVElPTi4KPj4KPj4gLi4uYW5kIHN0b3Bf
bWFjaGluZSgpIHdpdGggIVBSRUVNUFRJT04gaXMgYnJva2VuIGFzIHdlbGwsIHdoZW4geW91J3Jl
Cj4+IHJlcGxhY2luZyBtdWx0aXBsZSBpbnN0cnVjdGlvbnMgKHNlZSBNYXJrJ3MgcG9zdCBhdCBb
MV0pLiBUaGUKPj4gc3RvcF9tYWNoaW5lKCkgZGFuY2UgbWlnaHQgd29yayB3aGVuIHlvdSdyZSBy
ZXBsYWNpbmcgKm9uZSogaW5zdHJ1Y3Rpb24sCj4+IG5vdCBtdWx0aXBsZSBhcyBpbiB0aGUgUklT
Qy1WIGNhc2UuIEknbGwgZXhwYW5kIG9uIHRoaXMgaW4gYSBjb21tZW50IGluCj4+IHRoZSBPUFRQ
Uk9CRVMgdjYgc2VyaWVzLgo+Pgo+PiA+PiA+ICBzdGF0aWMgdm9pZCBfX2twcm9iZXMgYXJjaF9w
cmVwYXJlX3NpbXVsYXRlKHN0cnVjdCBrcHJvYmUgKnApCj4+ID4+ID4gQEAgLTExNCwxNiArMTIw
LDIzIEBAIHZvaWQgKmFsbG9jX2luc25fcGFnZSh2b2lkKQo+PiA+PiA+ICAvKiBpbnN0YWxsIGJy
ZWFrcG9pbnQgaW4gdGV4dCAqLwo+PiA+PiA+ICB2b2lkIF9fa3Byb2JlcyBhcmNoX2FybV9rcHJv
YmUoc3RydWN0IGtwcm9iZSAqcCkKPj4gPj4gPiAgewo+PiA+PiA+IC0gICAgIGlmICgocC0+b3Bj
b2RlICYgX19JTlNOX0xFTkdUSF9NQVNLKSA9PSBfX0lOU05fTEVOR1RIXzMyKQo+PiA+PiA+IC0g
ICAgICAgICAgICAgcGF0Y2hfdGV4dChwLT5hZGRyLCBfX0JVR19JTlNOXzMyKTsKPj4gPj4gPiAt
ICAgICBlbHNlCj4+ID4+ID4gLSAgICAgICAgICAgICBwYXRjaF90ZXh0KHAtPmFkZHIsIF9fQlVH
X0lOU05fMTYpOwo+PiA+PiA+ICsjaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9DCj4+ID4+ID4gKyAg
ICAgdTMyIG9wY29kZSA9IF9fQlVHX0lOU05fMTY7Cj4+ID4+ID4gKyNlbHNlCj4+ID4+ID4gKyAg
ICAgdTMyIG9wY29kZSA9IF9fQlVHX0lOU05fMzI7Cj4+ID4+ID4gKyNlbmRpZgo+PiA+PiA+ICsg
ICAgIHBhdGNoX3RleHRfbm9zeW5jKHAtPmFkZHIsICZvcGNvZGUsIEdFVF9JTlNOX0xFTkdUSChv
cGNvZGUpKTsKPj4gPj4KPj4gPj4gU291bmRzIGdvb2QsIGJ1dCBpdCB3aWxsIGxlYXZlIHNvbWUg
UlZJIGluc3RydWN0aW9uIHRydW5jYXRlZCBpbiBrZXJuZWwgdGV4dCwKPj4gPj4gaSBkb3VidCBr
ZXJuZWwgYmVoYXZpb3IgZGVwZW5kcyBvbiB0aGUgcmVzdCBvZiB0aGUgdHJ1bmNhdGVkIGluc3Ry
dWN0aW9uLCB3ZWxsLAo+PiA+PiBpdCBuZWVkcyBtb3JlIHN0cmljdCB0ZXN0aW5nIHRvIHByb3Zl
IG15IGNvbmNlcm4gOikKPj4gPiBJIGRvIHRoaXMgb24gcHVycG9zZSwgYW5kIGl0IGRvZXNuJ3Qg
Y2F1c2UgYW55IHByb2JsZW1zLiBEb24ndCB3b3JyeTsKPj4gPiBJRlUgaHcgbXVzdCBlbmZvcmNl
IHRoZSBmZXRjaCBzZXF1ZW5jZSwgYW5kIHRoZXJlIGlzIG5vIHdheSB0byBleGVjdXRlCj4+ID4g
YnJva2VuIGluc3RydWN0aW9ucyBldmVuIGluIHRoZSBzcGVjdWxhdGl2ZSBleGVjdXRpb24gcGF0
aC4KPj4KPj4gVGhpcyBpcyBzdHJldGNoaW5nIHJlYWxpdHkgYSBiaXQgbXVjaC4gQVJNdjgsIGUu
Zy4sIGhhcyBhIGNoYXB0ZXIgaW4gdGhlCj4+IEFybSBBUk0gWzJdIEFwcGVuZGl4IEIgIkNvbmN1
cnJlbnQgbW9kaWZpY2F0aW9uIGFuZCBleGVjdXRpb24gb2YKPj4gaW5zdHJ1Y3Rpb25zIiAoQ01P
RFgpLiAqU29tZSogaW5zdHJ1Y3Rpb25zIGNhbiBiZSByZXBsYWNlZCBjb25jdXJyZW50bHksCj4+
IGFuZCBvdGhlcnMgY2Fubm90IHdpdGhvdXQgY2F1dGlvbi4gQXNzdW1pbmcgdGhhdCB0aGF0IGFs
bCBSSVNDLVYKPj4gaW1wbGVtZW50YXRpb25zIGNhbiwgaXMgYSBzdHJldGNoLiBSSVNDLVYgaGFz
bid0IGV2ZW4gc3BlY2lmaWVkIHRoZQo+PiBiZWhhdmlvciBvZiBDTU9EWCAod2hpY2ggaXMgcHJv
YmxlbWF0aWMpLgo+IEhlcmUgd2Ugb25seSB1c2Ugb25lIHN3L3NoIGluc3RydWN0aW9uIHRvIHN0
b3JlIGEgMzJiaXQvMTZiaXQgYWxpZ25lZCBlbGVtZW50Ogo+Cj4gSU5TTl8wIDwtIGVicmVhayAo
MTZiaXQvMzJiaXQgYWxpZ25lZCkKPiBJTlNOXzEKPiBJTlNOXzIKPgo+IFRoZSBlYnJlYWsgd291
bGQgY2F1c2UgYW4gZXhjZXB0aW9uIHdoaWNoIGltcGxpZXMgYSBodWdlIGZlbmNlIGhlcmUuCj4g
Tm8gbWFjaGluZSBjb3VsZCBnaXZlIGEgc3BlY3VsYXRpdmUgZXhlY3V0aW9uIGZvciB0aGUgZWJy
ZWFrIHBhdGguCgpJdCdzIHRoZSBjb25jdXJyZW50IG1vZGlmaWNhdGlvbiB0aGF0IEkgd2FzIHJl
ZmVycmluZyB0byAocmVtb3ZpbmcKc3RvcF9tYWNoaW5lKCkpLiBZb3UncmUgc2F5aW5nICJpdCds
bCBhbHdheXMgd29yayIsIEknbSBzYXlpbmcgIkknbSBub3QKc28gc3VyZSIuIDotKSBFLmcuLCB3
cml0aW5nIGMuZWJyZWFrIG9uIGFuIDMyYiBpbnNuLiBDYW4geW91IHNheSB0aGF0CndpbGwgd29y
ayBvbiBhbGwgUklTQy1WIGltcGxlbWVudGF0aW9ucz8gRG8geW91IGhhdmUgZXhhbXBsZXMgb2YK
aGFyZHdhcmUgd2hlcmUgaXQgd2lsbCB3b3JrPwoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
