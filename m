Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4562FC3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 07:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7p6g/9VJjNlWsfagYstQ+wViSmiG6nliUaATM1K6tA=; b=TH30NRlxcuwD8/
	qrUnTIOGDvN6H5aLbusetrLkV/l8FolrADSJF60EpZ4kKko8fW5AjVYoHyF8tHGRtCJc+GpKsyJeK
	kF8VsSS84SuntlYFqOMJQEn+kT4cDIJHhj13JiCWcFr8ppriXRgX8IjzpvkMRLkwtVUwFsmn0xrrF
	o0VJ7HfxXJQSBLyrU32rmoP/uqFb5vYCbuAOzErOZEhbEYVSnvGg4xeKhExVIur1dsJ5M4eN9PqQH
	mfFSvtvQ/OwVOvVxLNhGWb8t2sIs6O6u5LPmOOWtBQU0qn/BT+nX//4tfYiS1S4NoWgpkJvKhAAUH
	U5DQORwJ97FxDQKUGmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDhJU-006Orl-7b; Fri, 06 Jan 2023 07:38:52 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDhJQ-006Opv-8T
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 07:38:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1672990719; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dumhgiwWnO5896HhtI0bgKFJN7PINS0ZjvMEkcSjaacedaxbIvMWNVE75KRkdB0MJNEWgk5luzmKaqSrY3wiNDRiwnQCPrWSJskUQ23Fl9JxE0qdHA+F2flHklixZfajXE5RJHJWqX43SSv9/rpgBRUhIUVIlJ8yUzg+jyfUXqs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1672990719; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=TioKn5CO8tJoob2wJhuL1JbsftJhJzptZqlgXBEAeJE=; 
	b=G9XKNIOLCc220iEQgGqtOaVhAC1/mgMQKK8ER9AjTEhg4NJTBl04zbVrvudR/B2w5iceAm1+FbjeLeJnaI/jLAfYTiAzKE7ADxiCCP9TORWe4VPQZVpIXIGZ0nL3iheth65Y4nIA30PyJzZZpV5ZycQU4HqkkWiHd+6R6QCuAgc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1672990719;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=TioKn5CO8tJoob2wJhuL1JbsftJhJzptZqlgXBEAeJE=;
	b=fZdYvtD1+TeKBEcaVMLM+wngttu+IXYG5lDFY6FDeBwujMjZDTe9JkEyakehPnV0
	N6joYFh6VX7K/8piO4aisF4u9WJpB1oohZgnMr4ZhNcugxEnh+iQqxZ59z2VwsLKH0H
	f/s1KxG/RRVfyGKojAqkzXac9J2gfZVk5RvqAjsw=
Received: from edelgard.fodlan.icenowy.me (120.85.96.143 [120.85.96.143]) by mx.zohomail.com
	with SMTPS id 1672990717981580.103026584164; Thu, 5 Jan 2023 23:38:37 -0800 (PST)
Message-ID: <fa4342510fdf93f809671239fe1a1df68b378357.camel@icenowy.me>
Subject: Re: [RFC PATCH 2/3] riscv: use VA+PA variant of CMO macros for DMA
 synchorization
From: Icenowy Zheng <uwu@icenowy.me>
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Guo Ren
	 <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland
	 <samuel@sholland.org>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 06 Jan 2023 15:38:33 +0800
In-Reply-To: <2135147.irdbgypaU6@diego>
References: <20230104074146.578485-1-uwu@icenowy.me>
	 <CAJF2gTTO3jx8FqMVRmfgkjO02sCVx2SVbe-Sn1uKXojyn8RDaA@mail.gmail.com>
	 <bcce507a31662004262fa3bbe911f1b1ff7f27af.camel@icenowy.me>
	 <2135147.irdbgypaU6@diego>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_233848_354885_F92EA24D 
X-CRM114-Status: GOOD (  28.27  )
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

5ZyoIDIwMjMtMDEtMDTmmJ/mnJ/kuInnmoQgMTM6MTYgKzAxMDDvvIxIZWlrbyBTdMO8Ym5lcuWG
memBk++8mgo+IEhpLAo+IAo+IEFtIE1pdHR3b2NoLCA0LiBKYW51YXIgMjAyMywgMTA6Mjc6NTMg
Q0VUIHNjaHJpZWIgSWNlbm93eSBaaGVuZzoKPiA+IOWcqCAyMDIzLTAxLTA05pif5pyf5LiJ55qE
IDE3OjI0ICswODAw77yMR3VvIFJlbuWGmemBk++8mgo+ID4gPiBPbiBXZWQsIEphbiA0LCAyMDIz
IGF0IDQ6NTkgUE0gSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4gPiA+IHdyb3RlOgo+
ID4gPiA+IAo+ID4gPiA+IOWcqCAyMDIzLTAxLTA05pif5pyf5LiJ55qEIDE2OjUwICswODAw77yM
R3VvIFJlbuWGmemBk++8mgo+ID4gPiA+ID4gT24gV2VkLCBKYW4gNCwgMjAyMyBhdCAzOjQzIFBN
IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+ID4gPiA+ID4gd3JvdGU6Cj4gPiA+ID4g
PiA+IAo+ID4gPiA+ID4gPiBETUEgc3luY2hvcml6YXRpb24gaXMgZG9uZSBvbiBQQSBhbmQgdGhl
IFZBIGlzIGNhbGN1bGF0ZWQKPiA+ID4gPiA+ID4gZnJvbQo+ID4gPiA+ID4gPiB0aGUKPiA+ID4g
PiA+ID4gUEEuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBVc2UgdGhlIGFsdGVybmF0aXZlIG1h
Y3JvIHZhcmlhbnQgdGhhdCB0YWtlcyBib3RoIFZBIGFuZCBQQQo+ID4gPiA+ID4gPiBhcwo+ID4g
PiA+ID4gPiBwYXJhbWV0ZXJzLCB0aHVzIGluIGNhc2UgdGhlIElTQSBleHRlbnNpb24gdXNlZCBz
dXBwb3J0IFBBCj4gPiA+ID4gPiA+IGRpcmVjdGx5LCB0aGUKPiA+ID4gPiA+ID4gb3ZlcmhlYWQg
Zm9yIHJlLWNvbnZlcnRpbmcgVkEgdG8gUEEgY2FuIGJlIG9taXR0ZWQuCj4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiBTdWdnZXN0ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4g
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+
ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+IMKgYXJjaC9yaXNjdi9tbS9kbWEtbm9uY29oZXJlbnQu
YyB8IDggKysrKy0tLS0KPiA+ID4gPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvbW0vZG1hLW5vbmNvaGVyZW50LmMKPiA+ID4gPiA+ID4gYi9hcmNoL3Jpc2N2
L21tL2RtYS0KPiA+ID4gPiA+ID4gbm9uY29oZXJlbnQuYwo+ID4gPiA+ID4gPiBpbmRleCBkOTE5
ZWZhYjZlYmEuLmE3NTFmNGFlY2U2MiAxMDA2NDQKPiA+ID4gPiA+ID4gLS0tIGEvYXJjaC9yaXNj
di9tbS9kbWEtbm9uY29oZXJlbnQuYwo+ID4gPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2Rt
YS1ub25jb2hlcmVudC5jCj4gPiA+ID4gPiA+IEBAIC0xOSwxMyArMTksMTMgQEAgdm9pZAo+ID4g
PiA+ID4gPiBhcmNoX3N5bmNfZG1hX2Zvcl9kZXZpY2UocGh5c19hZGRyX3QKPiA+ID4gPiA+ID4g
cGFkZHIsIHNpemVfdCBzaXplLAo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKg
wqAgc3dpdGNoIChkaXIpIHsKPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqAgY2FzZSBETUFfVE9f
REVWSUNFOgo+ID4gPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBTFRfQ01P
X09QKGNsZWFuLCB2YWRkciwgc2l6ZSwKPiA+ID4gPiA+ID4gcmlzY3ZfY2JvbV9ibG9ja19zaXpl
KTsKPiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQUxUX0NNT19PUF9W
UEEoY2xlYW4sIHZhZGRyLCBwYWRkciwgc2l6ZSwKPiA+ID4gPiA+ID4gcmlzY3ZfY2JvbV9ibG9j
a19zaXplKTsKPiA+ID4gPiA+IEFMVF9DTU9fT1AgLT4gQUxUX0NNT19PUF9WUEEsIGlzIHRoZSBy
ZW5hbWluZyBuZWNlc3Nhcnk/Cj4gPiA+ID4gCj4gPiA+ID4gSSBkaWRuJ3QgcmVuYW1lIHRoZSBv
cmlnaW5hbCBBTFRfQ01PX09QLCBBTFRfQ01PX09QX1ZQQSBpcwo+ID4gPiA+IHNvbWV0aGluZwo+
ID4gPiA+IG5ldy4KPiA+ID4gVGhlICMjX1ZQQSBpcyByZWFsbHkgc3RyYW5nZS4KPiA+ID4gCj4g
PiA+IEhvdyBhYm91dDoKPiA+ID4gQUxUX0NNT19PUMKgwqDCoMKgwqDCoMKgwqDCoCAtPiBBTFRf
Q01PX09QX1ZBCj4gPiA+IEFMVF9DTU9fT1BfVlBBIC0+IEFMVF9DTU9fT1AKPiA+IAo+ID4gSXQn
cyB0aHVzIGEgbXVjaCBiaWdnZXIgY2hhbmdlLgo+ID4gCj4gPiBJZiB5b3UgYXJlIG5vdCBmb25k
IG9mIF9WUEEsIEkgY2FuIHJlbmFtZSBpdCB0byBfVkFfUEEuCj4gCj4gYmVmb3JlIHlvdSBzcGVu
ZCB0b28gbXVjaCB0aW1lIG9uIHRoaXMsIHRoZXJlIGlzIGN1cnJlbnRseSBhIHBhcmFsbGVsCj4g
ZGlzY3Vzc2lvbiBydW5uaW5nIGFib3V0IGluY2x1ZGluZyBhbGwgdGhlIG90aGVyIGRpZmZlcmVu
dCB2ZW5kb3ItCj4gc3BlY2lmaWMgY2FjaGUgbWFuYWdlbWVudC4KPiAKPiBTZWUgWzBdIGFuZCB0
aGUgdGhyZWFkIGJlZm9yZSB0aGF0IGZvciByZWZlcmVuY2UuCgpUaGUgY29kZSBzaG93biBoZXJl
IHNlZW1zIHRvIGJlIG9ubHkgYSBkcmFmdCwgYW5kIG5vdCBldmVuIHRlc3RhYmxlLgoKPiAKPiBU
aGUgY29uc2Vuc3VzIHNlZW1zIHRvIGJlIHRoYXQgY2FjaGUtaGFuZGxpbmcgaXRzZWxmIGlzIG5v
dCBmYXN0Cj4gYW55d2F5LAo+IGFuZCB0aGVyZWZvcmUgdG8gcmVkdWNlIGNvbXBsZXhpdHkgZm9y
IHRoZSBjYWNoZSBoYW5kbGluZyBhbmQgbW92ZQo+IG5vbi16aWNib20gY2FjaGUtaGFuZGxpbmcg
aW50byBhIGluZGlyZWN0IGZ1bmN0aW9uIGNhbGwgdGhhdCB0aGUgY2FuCj4gYmUKPiBvdmVycmlk
ZGVuIGF0IHJ1bnRpbWUuCgpXZWxsIHllcyBJIHRlc3RlZCB0aGlzIHBhdGNoc2V0IG9uIG15IExp
dGVYIHdpdGggT3BlbkM5MDYsIGFuZCBpdCBkb2VzCm5vdCBoZWxwIGF0IGFsbCBvbiBMaXRlRVRI
IHRocm91Z2h0cHV0LiBTbyBtYXliZSB0aGlzIGlzIG9ubHkgc29tZQp0aGVvcnRpY2FsIGdhaW4u
Cgo+IAo+IAo+IEhlaWtvCj4gCj4gWzBdCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzQz
YWVlMDAwLTViODktNGQ5NC05OGQyLWIzN2IxYTE4YTgzZUBhcHAuZmFzdG1haWwuY29tLwo+IAo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
