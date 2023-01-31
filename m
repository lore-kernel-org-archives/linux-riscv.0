Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F52C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 08:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMKP1iM/jKVtmSmHU8BZexvgGR26GWjAet6mPisEtdU=; b=HO9CrNEpq7R37d
	MIxAaMWh/6N52tPTrby4yWGuD9nlVFBKM5KfMc7/5j5sSER6+MXuQoegjg+dovLHN3af6vhg/kS7f
	SuLO5znDKJodGxfVsci/HVY7f4e3HO37urymCKGZ2+COa9/Zf57GdPq1F5JBMtC2sIeuhFhvKDe+C
	ufW1NeerpPd0Tx+lQYL0oYt/2RDwWjwOQ93AdZnBDPOEtc/Bpe/QTTDuSmKuRuUoo3kvzjLnSMs2u
	0JcGFTPQl5SPhamIiLi8hL3fttApPywJBouDzuyVJ/itFsn/SvXB1vXrWRqmzX209IpsP3NYgjmKn
	PsvmjRFlUyb8KFTO+91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMlzR-006icR-0A; Tue, 31 Jan 2023 08:27:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMlzL-006iZs-Vo
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 08:27:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 95F28B81A0C
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 08:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B4AC4339C
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 08:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675153650;
	bh=vvJkcuBJzcKEihNm4yHDz+l6wkDXkHpjcEVKZQPCzOs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ow7KDHkKwue1QI9aSqgMXi5lroBAraU5rwQ+iC0Y+olHHPmrdtY/eYR0ENJwuNSm0
	 M01i8TFwqEHDAopwGAFAtyBqomIOeZcZ0SmOn4x0gX8WQ/n0WWvycPLDjVDbIIkIEJ
	 ln+frwMMpZIrrulz26Deucm7qnWG2zhJ6S7O/0UliB9TDuxPGZohador2EzJz9K5WW
	 hnSlvdnJnXIaiGJSU69vGe+77fZPnMD+s4lowZ6ZG7xpsl38hZC4LcHW2yqEpmDRlw
	 Y/y5tbj08YiwMq7ShjE4EDAdUgFc96nG5RgQTVWuu/fvjdeGyBhgn4XKcIZK4taM7D
	 9Uy1CAd6A8JeA==
Received: by mail-ej1-f47.google.com with SMTP id me3so39300398ejb.7
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 00:27:30 -0800 (PST)
X-Gm-Message-State: AO0yUKX9OxLno3ruVYUNGWcpJm7BrfjarEGpCuW6XEggK8oZ+Def4u6X
	mgoow1mC1xz7sWZLsmeXPp+8599w8tStlCfHh8A=
X-Google-Smtp-Source: AK7set9bPQmmHFzvDiD0s5yTXhq5uOXgtMci/DwgvnU2EE+1E2I9X8yu9IysQy+f5yGzMebFer8L7rnTlZpV/9OHBMU=
X-Received: by 2002:a17:907:2155:b0:884:c19c:7c6 with SMTP id
 rk21-20020a170907215500b00884c19c07c6mr2286668ejb.120.1675153648392; Tue, 31
 Jan 2023 00:27:28 -0800 (PST)
MIME-Version: 1.0
References: <20230126161559.1467374-1-guoren@kernel.org> <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us> <CAJF2gTQZWO8Ubi60nHn-J-8czqBnsp1Kdyoim3uLNkjbYd-H8Q@mail.gmail.com>
 <CAJF2gTSHQ7J1a-0tTzaLAHeUTqbco5OXJgGDZpgB-SLb+teL2A@mail.gmail.com> <87cz6vtcce.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87cz6vtcce.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 31 Jan 2023 16:27:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQSLZ6nwh8BY3VGgZf61CyfLotX7VV_fy5otMDzSTiNgw@mail.gmail.com>
Message-ID: <CAJF2gTQSLZ6nwh8BY3VGgZf61CyfLotX7VV_fy5otMDzSTiNgw@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: "liaochang (A)" <liaochang1@huawei.com>, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	mhiramat@kernel.org, conor.dooley@microchip.com, penberg@kernel.org, 
	mark.rutland@arm.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_002736_340281_EEE231A0 
X-CRM114-Status: GOOD (  30.53  )
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

T24gVHVlLCBKYW4gMzEsIDIwMjMgYXQgMzowMyBQTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4K
PiA+PiA+ID4+ID4gIHN0YXRpYyB2b2lkIF9fa3Byb2JlcyBhcmNoX3ByZXBhcmVfc2ltdWxhdGUo
c3RydWN0IGtwcm9iZSAqcCkKPiA+PiA+ID4+ID4gQEAgLTExNCwxNiArMTIwLDIzIEBAIHZvaWQg
KmFsbG9jX2luc25fcGFnZSh2b2lkKQo+ID4+ID4gPj4gPiAgLyogaW5zdGFsbCBicmVha3BvaW50
IGluIHRleHQgKi8KPiA+PiA+ID4+ID4gIHZvaWQgX19rcHJvYmVzIGFyY2hfYXJtX2twcm9iZShz
dHJ1Y3Qga3Byb2JlICpwKQo+ID4+ID4gPj4gPiAgewo+ID4+ID4gPj4gPiAtICAgICBpZiAoKHAt
Pm9wY29kZSAmIF9fSU5TTl9MRU5HVEhfTUFTSykgPT0gX19JTlNOX0xFTkdUSF8zMikKPiA+PiA+
ID4+ID4gLSAgICAgICAgICAgICBwYXRjaF90ZXh0KHAtPmFkZHIsIF9fQlVHX0lOU05fMzIpOwo+
ID4+ID4gPj4gPiAtICAgICBlbHNlCj4gPj4gPiA+PiA+IC0gICAgICAgICAgICAgcGF0Y2hfdGV4
dChwLT5hZGRyLCBfX0JVR19JTlNOXzE2KTsKPiA+PiA+ID4+ID4gKyNpZmRlZiBDT05GSUdfUklT
Q1ZfSVNBX0MKPiA+PiA+ID4+ID4gKyAgICAgdTMyIG9wY29kZSA9IF9fQlVHX0lOU05fMTY7Cj4g
Pj4gPiA+PiA+ICsjZWxzZQo+ID4+ID4gPj4gPiArICAgICB1MzIgb3Bjb2RlID0gX19CVUdfSU5T
Tl8zMjsKPiA+PiA+ID4+ID4gKyNlbmRpZgo+ID4+ID4gPj4gPiArICAgICBwYXRjaF90ZXh0X25v
c3luYyhwLT5hZGRyLCAmb3Bjb2RlLCBHRVRfSU5TTl9MRU5HVEgob3Bjb2RlKSk7Cj4gPj4gPiA+
Pgo+ID4+ID4gPj4gU291bmRzIGdvb2QsIGJ1dCBpdCB3aWxsIGxlYXZlIHNvbWUgUlZJIGluc3Ry
dWN0aW9uIHRydW5jYXRlZCBpbiBrZXJuZWwgdGV4dCwKPiA+PiA+ID4+IGkgZG91YnQga2VybmVs
IGJlaGF2aW9yIGRlcGVuZHMgb24gdGhlIHJlc3Qgb2YgdGhlIHRydW5jYXRlZCBpbnN0cnVjdGlv
biwgd2VsbCwKPiA+PiA+ID4+IGl0IG5lZWRzIG1vcmUgc3RyaWN0IHRlc3RpbmcgdG8gcHJvdmUg
bXkgY29uY2VybiA6KQo+ID4+ID4gPiBJIGRvIHRoaXMgb24gcHVycG9zZSwgYW5kIGl0IGRvZXNu
J3QgY2F1c2UgYW55IHByb2JsZW1zLiBEb24ndCB3b3JyeTsKPiA+PiA+ID4gSUZVIGh3IG11c3Qg
ZW5mb3JjZSB0aGUgZmV0Y2ggc2VxdWVuY2UsIGFuZCB0aGVyZSBpcyBubyB3YXkgdG8gZXhlY3V0
ZQo+ID4+ID4gPiBicm9rZW4gaW5zdHJ1Y3Rpb25zIGV2ZW4gaW4gdGhlIHNwZWN1bGF0aXZlIGV4
ZWN1dGlvbiBwYXRoLgo+ID4+ID4KPiA+PiA+IFRoaXMgaXMgc3RyZXRjaGluZyByZWFsaXR5IGEg
Yml0IG11Y2guIEFSTXY4LCBlLmcuLCBoYXMgYSBjaGFwdGVyIGluIHRoZQo+ID4+ID4gQXJtIEFS
TSBbMl0gQXBwZW5kaXggQiAiQ29uY3VycmVudCBtb2RpZmljYXRpb24gYW5kIGV4ZWN1dGlvbiBv
Zgo+ID4+ID4gaW5zdHJ1Y3Rpb25zIiAoQ01PRFgpLiAqU29tZSogaW5zdHJ1Y3Rpb25zIGNhbiBi
ZSByZXBsYWNlZCBjb25jdXJyZW50bHksCj4gPj4gPiBhbmQgb3RoZXJzIGNhbm5vdCB3aXRob3V0
IGNhdXRpb24uIEFzc3VtaW5nIHRoYXQgdGhhdCBhbGwgUklTQy1WCj4gPj4gPiBpbXBsZW1lbnRh
dGlvbnMgY2FuLCBpcyBhIHN0cmV0Y2guIFJJU0MtViBoYXNuJ3QgZXZlbiBzcGVjaWZpZWQgdGhl
Cj4gPj4gPiBiZWhhdmlvciBvZiBDTU9EWCAod2hpY2ggaXMgcHJvYmxlbWF0aWMpLgo+ID4+IEhl
cmUgd2Ugb25seSB1c2Ugb25lIHN3L3NoIGluc3RydWN0aW9uIHRvIHN0b3JlIGEgMzJiaXQvMTZi
aXQgYWxpZ25lZCBlbGVtZW50Ogo+ID4+Cj4gPj4gSU5TTl8wIDwtIGVicmVhayAoMTZiaXQvMzJi
aXQgYWxpZ25lZCkKPiA+PiBJTlNOXzEKPiA+PiBJTlNOXzIKPiA+Pgo+ID4+IFRoZSBlYnJlYWsg
d291bGQgY2F1c2UgYW4gZXhjZXB0aW9uIHdoaWNoIGltcGxpZXMgYSBodWdlIGZlbmNlIGhlcmUu
Cj4gPj4gTm8gbWFjaGluZSBjb3VsZCBnaXZlIGEgc3BlY3VsYXRpdmUgZXhlY3V0aW9uIGZvciB0
aGUgZWJyZWFrIHBhdGguCj4gPgo+ID4gRm9yIEFSTXY3LCBlYnJlYWsgaXMgYWxzbyBzYWZlOgo+
ID4KPiA+IC0tLQo+ID4gQ29uY3VycmVudCBtb2RpZmljYXRpb24gYW5kIGV4ZWN1dGlvbiBvZiBp
bnN0cnVjdGlvbnMKPiA+Cj4gPiBUaGUgQVJNdjcgYXJjaGl0ZWN0dXJlIGxpbWl0cyB0aGUgc2V0
IG9mIGluc3RydWN0aW9ucyB0aGF0IGNhbiBiZQo+ID4gZXhlY3V0ZWQgYnkgb25lIHRocmVhZCBv
ZiBleGVjdXRpb24gYXMgdGhleSBhcmUgYmVpbmcgbW9kaWZpZWQgYnkKPiA+IGFub3RoZXIgdGhy
ZWFkIG9mIGV4ZWN1dGlvbiB3aXRob3V0IHJlcXVpcmluZyBleHBsaWNpdAo+ID4gc3luY2hyb25p
emF0aW9uLgo+ID4gLi4uCj4gPiBUaGUgaW5zdHJ1Y3Rpb25zIHRvIHdoaWNoIHRoaXMgZ3VhcmFu
dGVlIGFwcGxpZXMgYXJlOgo+ID4gSW4gdGhlIFRodW1iIGluc3RydWN0aW9uIHNldAo+ID4gVGhl
IDE2LWJpdCBlbmNvZGluZ3Mgb2YgdGhlIEIsIE5PUCwgQktQVCwgYW5kIFNWQyBpbnN0cnVjdGlv
bnMuCj4gPiAuLi4KPiA+IEluIHRoZSBBUk0gaW5zdHJ1Y3Rpb24gc2V0Cj4gPiBUaGUgQiwgQkws
IE5PUCwgQktQVCwgU1ZDLCBIVkMsIGFuZCBTTUMgaW5zdHJ1Y3Rpb25zLgo+ID4gLS0tCj4KPiBS
aWdodCwgYW5kICJCNy43IENvbmN1cnJlbnQgbW9kaWZpY2F0aW9uIGFuZCBleGVjdXRpb24gb2Yg
aW5zdHJ1Y3Rpb25zIgo+IEFybXY4LU0gQVJNIChodHRwczovL2RldmVsb3Blci5hcm0uY29tL2Rv
Y3VtZW50YXRpb24vZGRpMDU1My9sYXRlc3QpLAo+IGFsc28gZGVmaW5lcyB0aGF0IGNlcnRhaW4g
aW5zdHJ1Y3Rpb25zIGNhbiBiZSBjb25jdXJyZW50bHkgbW9kaWZpZWQuCj4KPiBUaGlzIGlzIGJl
c2lkZSB0aGUgcG9pbnQuIFdlIGRvbid0IGhhdmUgYSBzcGVjIGZvciBSSVNDLVYsIHlldC4gV2Un
cmUKPiBub3QgZXZlbiBzdXJlIHdlIGNhbiAoaW4gZ2VuZXJhbCkgcmVwbGFjZSB0aGUgbG93ZXIg
MTZiIG9mIGFuIDMyYgo+IGluc3RydWN0aW9uIGNvbmN1cnJlbnRseS4gIkl0J3MgaW4gdGhlIEFy
bXY4LU0gc3BlYyIgaXMgbm90IGVub3VnaC4KPgo+IEknZCBsb3ZlIHRvIGhhdmUgYSBzcGVjIGRl
ZmluaW5nIHRoYXQsIGFuZCBEZXJlayBldCBhbCBoYXMgc3RhcnRlZAo+IFsxXS4gU2xpZGUgIzk5
IGhhcyBDTU9EWCBkZXRhaWxzLgpGb3IgdGhlIGMuZWJyZWFrLCBDTU9EWCBpcyB1bm5lY2Vzc2Fy
eS4gQ01PRFggd291bGQgZ2l2ZSBhIHdpZGVyIGRlZmluaXRpb24uCgo+Cj4gWW91ciBwYXRjaCBt
aWdodCBiZSBncmVhdCBmb3Igc29tZSBIVyAod2hpY2g/KSwgYnV0IG5vdCBlbm91Z2ggZm9yCj4g
Z2VuZXJhbCBSSVNDLVYgTGludXggKHlldCkuIFVudGlsIHRoZW4sIHRoZSBleGlzdGluZyBzdG9w
X21hY2hpbmUoKSB3YXkKPiBpcyB1bmZvcnR1bmF0ZWx5IHRoZSB3YXkgdG8gZ28uCkl0J3MgZ2Vu
ZXJpYyBmb3IgYy5lYnJlYWssIG5vdCBzb21lIEhXLiBJdCdzIG5hdHVyYWwgdG8gc3VwcG9ydC4g
Tm8KbWFjaGluZSB3b3VsZCBicmVhayBpdC4KClBsZWFzZSBsZXQgbWUgY2xhcmlmeSBvdXIgYXJn
dWVkIHByZW1pc2Ugb2YgImVicmVhayIgaW5qZWN0aW9uIGF0b21pY2l0eToKIC0gYy5lYnJlYWsg
b24gdGhlIGhlYWQgb2YgMzJiIGluc24KIC0gZWJyZWFrIG9uIGFuIGFsaWduZWQgMzJiIGluc24K
Cj4KPgo+IEJqw7Zybgo+Cj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1qLWV4
dGVuc2lvbi9ibG9iL21hc3Rlci9pZC1jb25zaXN0ZW5jeS1wcm9wb3NhbC5wZGYKCgoKLS0gCkJl
c3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
