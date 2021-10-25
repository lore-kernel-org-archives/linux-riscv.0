Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F6EC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 04:48:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F412160FBF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 04:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F412160FBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ShcCU1VanYNo+sMZeDz0Co+g135mYt5kSpA2/X+JrdY=; b=PfsDHjEyR8g7YZTq24ZSoE5/Xf
	vKYy9fbUTeQaZYwxDZQ6zSdp/OT9T8pyK6zNDx4QKQf8+0wyR+UDPIpUmbkgtXqsFRbgl3gWElHyE
	HMehkMIV0neRYb+McTInJ2hokXfZpPlUvingl7Rvrcr9V7xtAzwJ9vuqWN+HvcRTj/vRbHsYZMWOb
	c/WrMLmyu1FoW67b8gwKOQKLWQYGV6zc2Cf1kheT/pCoDZFyOKpec1zqCWszw2tB8XO+oeI+qoGu+
	aRCLtEItOzLSYL28NIOWxhPfpvczN1N3mp6egyt+aqnaH/g31MJIdCH0dlT2Uc4cAH1hngJiCaf7f
	7egV48qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meru0-00FGtD-6n; Mon, 25 Oct 2021 04:48:04 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mertw-00FGs8-Do
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 04:48:03 +0000
Received: by mail-qt1-x82e.google.com with SMTP id y11so9219571qtn.13
 for <linux-riscv@lists.infradead.org>; Sun, 24 Oct 2021 21:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=9vIGns6HWNaeMTx5QFOvtKRFjcyLZxTuKzW3UfeG5fM=;
 b=D6QNTF/zk0bip2RuvympyqYQd9K2Kc6FbpUN+oKPwKL03BReSL8ljtXOxTnZCz4Vml
 9aJOK+qaYEGp6rlycY4n6wmZ0rb6jBTj1n5z4xPNLcX5xB3B78Z1eVzJUmO1VXedN65v
 kQLgB9U2dwiLEnClgV4fwGdU+pIt7tNl36uUb9LUF9CxY9LvKSFnLcITtZsPXQqK1qNB
 2KEm+pGGh8/4NAXrsvhn/5ufvptpU/aO5Lg/8hjyvpvFSu+mYNUGSupFQMZT5Q/s6INJ
 KnFXJBIzMhjDy/15Vzz3PRKbQxLl9471HDsB25zfmCqx4Volq3Yx4ltrM81nSlt0+YaN
 UFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=9vIGns6HWNaeMTx5QFOvtKRFjcyLZxTuKzW3UfeG5fM=;
 b=XceLWvILIu/Fyuk6W50wVHlYAujPO7ngXaofUA/qPEX8F//7t9feEZ5/wjRvfr+HNe
 tqkO8TbOkGwpkRynJaXOqnmxy5lSP4UhHEbSFLocLdFdUierqFnnZa1/0WSc299US1/W
 CGf8Jm8j5Xg853nlmAxrRnMEVFe4d8JtMui8rw3Y82p+G3HVDMSP7OkUIMCxUD+WBoYN
 L9mrsjVQECe8b+AJXM1JWBU9MgND/IR4J7nvc3Uk8NHoIem+ZxAi0KzF62r0/3gdwozj
 4PIB7bYG0qGqkDBOw9ZOHPr/DOg8FoAuTAEDzdT0VBQ3Khafbyhah/rgAMim+QYXKTI0
 su7Q==
X-Gm-Message-State: AOAM532YARuyZayn8KxmZ7i1E9JuEPzBlHp3on65NEURggqEWdIj5VWz
 zMBECRD3idBmRuS0jXepVqhE68zNrly4s57E0hU3bw==
X-Google-Smtp-Source: ABdhPJzbp2dyXamMc+L3kqxWrRPbRdHfMsTKvv5Xrp/i7Hu2hcx1orNKQKCCbp35BpF5BTN83GUrPFbz2ljZgwVKIUI=
X-Received: by 2002:a05:622a:1010:: with SMTP id
 d16mr15797662qte.70.1635137278261; 
 Sun, 24 Oct 2021 21:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631121222.git.greentime.hu@sifive.com>
 <0e65c165e3d54a38cbba01603f325dca727274de.1631121222.git.greentime.hu@sifive.com>
 <c81267bc-4c91-3978-8c1f-78925c46c78b@bluespec.com>
 <CAHCEehJ1uuSFqFWreS1kh+fR5GFfnEycdLMe+4FHXpFsHrRUvA@mail.gmail.com>
 <YVRp5uWFGQrwBpgf@bruce.bluespec.com>
 <CAHCEeh+dA9243=PwNtYvyU1Myu_E8YO2g4UNACxRogQ=6UavLQ@mail.gmail.com>
 <YVxZspMO7rAvtMBS@bruce.bluespec.com>
 <3c9797f6-2fd3-5530-ba34-6e4c4deec984@sifive.com>
 <YXFGAqTzHMeQA+R+@bruce.bluespec.com>
 <CABvJ_xjMyZ3HDLinMvY88HtKywb=cwhQNOOCZYTEeL407Gyz2A@mail.gmail.com>
 <YXKVLtT2U2g3JDrm@bruce.bluespec.com>
In-Reply-To: <YXKVLtT2U2g3JDrm@bruce.bluespec.com>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Mon, 25 Oct 2021 12:47:49 +0800
Message-ID: <CAHCEehKpA=d1phuAM1tdeyrp-CYQRmFxGTpvuJqWNMjRCMpWfw@mail.gmail.com>
Subject: Re: [RFC PATCH v8 09/21] riscv: Add task switch support for vector
To: Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_214800_497863_B3E77D06 
X-CRM114-Status: GOOD (  46.06  )
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

RGFyaXVzIFJhZCA8ZGFyaXVzQGJsdWVzcGVjLmNvbT4g5pa8IDIwMjHlubQxMOaciDIy5pelIOmA
seS6lCDkuIvljYg2OjQw5a+r6YGT77yaCj4KPiBPbiBGcmksIE9jdCAyMiwgMjAyMSBhdCAxMTo1
MjowMUFNICswODAwLCBWaW5jZW50IENoZW4gd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAyMSwgMjAy
MSBhdCA2OjUwIFBNIERhcml1cyBSYWQgPGRhcml1c0BibHVlc3BlYy5jb20+IHdyb3RlOgo+ID4g
Pgo+ID4gPiBPbiBXZWQsIE9jdCAyMCwgMjAyMSBhdCAwNjowMTozMVBNIC0wNzAwLCBQYXVsIFdh
bG1zbGV5IHdyb3RlOgo+ID4gPiA+IEhlbGxvIERhcml1cywKPiA+ID4gPgo+ID4gPiA+IE9uIFR1
ZSwgNSBPY3QgMjAyMSwgRGFyaXVzIFJhZCB3cm90ZToKPiA+ID4gPgo+ID4gPiA+ID4gT24gTW9u
LCBPY3QgMDQsIDIwMjEgYXQgMDg6MzY6MzBQTSArMDgwMCwgR3JlZW50aW1lIEh1IHdyb3RlOgo+
ID4gPiA+ID4gPiBEYXJpdXMgUmFkIDxkYXJpdXNAYmx1ZXNwZWMuY29tPiDmlrwgMjAyMeW5tDnm
nIgyOeaXpSDpgLHkuIkg5LiL5Y2IOToyOOWvq+mBk++8mgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gT24gVHVlLCBTZXAgMjgsIDIwMjEgYXQgMTA6NTY6NTJQTSArMDgwMCwgR3JlZW50aW1l
IEh1IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gRGFyaXVzIFJhZCA8ZGFyaXVzQGJsdWVzcGVjLmNv
bT4g5pa8IDIwMjHlubQ55pyIMTPml6Ug6YCx5LiAIOS4i+WNiDg6MjHlr6vpgZPvvJoKPiA+ID4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gT24gOS84LzIxIDE6NDUgUE0sIEdyZWVudGlt
ZSBIdSB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gPiBUaGlzIHBhdGNoIGFkZHMgdGFzayBzd2l0
Y2ggc3VwcG9ydCBmb3IgdmVjdG9yLiBJdCBzdXBwb3J0cyBwYXJ0aWFsIGxhenkKPiA+ID4gPiA+
ID4gPiA+ID4gPiBzYXZlIGFuZCByZXN0b3JlIG1lY2hhbmlzbS4gSXQgYWxzbyBzdXBwb3J0cyBh
bGwgbGVuZ3RocyBvZiB2bGVuLgo+ID4gPiA+Cj4gPiA+ID4gWyAuLi4gXQo+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gPiA+IFNvIHRoaXMgd2lsbCB1bmNvbmRpdGlvbmFsbHkgZW5hYmxlIHZlY3RvciBp
bnN0cnVjdGlvbnMsIGFuZCBhbGxvY2F0ZQo+ID4gPiA+ID4gPiA+ID4gPiBtZW1vcnkgZm9yIHZl
Y3RvciBzdGF0ZSwgZm9yIGFsbCBwcm9jZXNzZXMsIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciB2ZWN0
b3IKPiA+ID4gPiA+ID4gPiA+ID4gaW5zdHJ1Y3Rpb25zIGFyZSB1c2VkPwo+ID4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiA+IFllcywgaXQgd2lsbCBlbmFibGUgdmVjdG9yIGlmIGhhc192ZWN0
b3IoKSBpcyB0cnVlLiBUaGUgcmVhc29uIHRoYXQgd2UKPiA+ID4gPiA+ID4gPiA+IGNob29zZSB0
byBlbmFibGUgYW5kIGFsbG9jYXRlIG1lbW9yeSBmb3IgdXNlciBzcGFjZSBwcm9ncmFtIGlzIGJl
Y2F1c2UKPiA+ID4gPiA+ID4gPiA+IHdlIGFsc28gaW1wbGVtZW50IHNvbWUgY29tbW9uIGZ1bmN0
aW9ucyBpbiB0aGUgZ2xpYmMgc3VjaCBhcyBtZW1jcHkKPiA+ID4gPiA+ID4gPiA+IHZlY3RvciB2
ZXJzaW9uIGFuZCBpdCBpcyBjYWxsZWQgdmVyeSBvZnRlbiBieSBldmVyeSBwcm9jZXNzLiBTbyB0
aGF0Cj4gPiA+ID4gPiA+ID4gPiB3ZSBhc3N1bWUgaWYgdGhlIHVzZXIgcHJvZ3JhbSBpcyBydW5u
aW5nIGluIGEgQ1BVIHdpdGggdmVjdG9yIElTQQo+ID4gPiA+ID4gPiA+ID4gd291bGQgbGlrZSB0
byB1c2UgdmVjdG9yIGJ5IGRlZmF1bHQuIElmIHdlIGRpc2FibGUgaXQgYnkgZGVmYXVsdCBhbmQK
PiA+ID4gPiA+ID4gPiA+IG1ha2UgaXQgdHJpZ2dlciB0aGUgaWxsZWdhbCBpbnN0cnVjdGlvbiwg
dGhhdCBtaWdodCBiZSBhIGJ1cmRlbiBzaW5jZQo+ID4gPiA+ID4gPiA+ID4gYWxtb3N0IGV2ZXJ5
IHByb2Nlc3Mgd2lsbCB1c2UgdmVjdG9yIGdsaWJjIG1lbWNweSBvciBzb21ldGhpbmcgbGlrZQo+
ID4gPiA+ID4gPiA+ID4gdGhhdC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IERvIHlvdSBo
YXZlIGFueSBldmlkZW5jZSB0byBzdXBwb3J0IHRoZSBhc3NlcnRpb24gdGhhdCBhbG1vc3QgZXZl
cnkgcHJvY2Vzcwo+ID4gPiA+ID4gPiA+IHdvdWxkIHVzZSB2ZWN0b3Igb3BlcmF0aW9ucz8gIE9u
ZSBjb3VsZCBlYXNpbHkgYXJndWUgdGhhdCB0aGUgY29udmVyc2UgaXMKPiA+ID4gPiA+ID4gPiB0
cnVlOiBubyBleGlzdGluZyBzb2Z0d2FyZSB1c2VzIHRoZSB2ZWN0b3IgZXh0ZW5zaW9uIG5vdywg
c28gbW9zdCBsaWtlbHkgYQo+ID4gPiA+ID4gPiA+IHByb2Nlc3Mgd2lsbCBub3QgYmUgdXNpbmcg
aXQuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEdsaWJjIHVzdHJlYW1pbmcgaXMganVzdCBzdGFy
dGluZyBzbyB5b3UgZGlkbid0IHNlZSBzb2Z0d2FyZSB1c2luZyB0aGUKPiA+ID4gPiA+ID4gdmVj
dG9yIGV4dGVuc2lvbiBub3cgYW5kIHRoaXMgcGF0Y2hzZXQgaXMgdGVzdGluZyBiYXNlZCBvbiB0
aG9zZQo+ID4gPiA+ID4gPiBvcHRpbWl6ZWQgZ2xpYmMgdG9vLiBWaW5jZW50IENoZW4gaXMgd29y
a2luZyBvbiB0aGUgZ2xpYmMgdmVjdG9yCj4gPiA+ID4gPiA+IHN1cHBvcnQgdXBzdHJlYW1pbmcg
YW5kIHdlIHdpbGwgYWxzbyB1cHN0cmVhbSB0aGUgdmVjdG9yIHZlcnNpb24gZ2xpYmMKPiA+ID4g
PiA+ID4gbWVtY3B5LCBtZW1jbXAsIG1lbWNociwgbWVtbW92ZSwgbWVtc2V0LCBzdHJjbXAsIHN0
cmxlbi4gVGhlbiB3ZSB3aWxsCj4gPiA+ID4gPiA+IHNlZSBwbGF0Zm9ybSB3aXRoIHZlY3RvciBz
dXBwb3J0IGNhbiB1c2UgdmVjdG9yIHZlcnNpb24gbWVtKiBhbmQgc3RyKgo+ID4gPiA+ID4gPiBm
dW5jdGlvbnMgYXV0b21hdGljYWxseSBiYXNlZCBvbiBpZnVuYyBhbmQgcGxhdGZvcm0gd2l0aG91
dCB2ZWN0b3IKPiA+ID4gPiA+ID4gd2lsbCB1c2UgdGhlIG9yaWdpbmFsIG9uZSBhdXRvbWF0aWNh
bGx5LiBUaGVzZSBjb3VsZCBiZSBkb25lIHRvIHNlbGVjdAo+ID4gPiA+ID4gPiB0aGUgY29ycmVj
dCBvcHRpbWl6ZWQgZ2xpYmMgZnVuY3Rpb25zIGJ5IGlmdW5jIG1lY2hhbmlzbS4KPiA+ID4gPgo+
ID4gPiA+IEluIHlvdXIgcmVwbHksIEkgbm90aWNlZCB0aGF0IHlvdSBkaWRuJ3QgYWRkcmVzcyBH
cmVlbnRpbWUncyByZXNwb25zZQo+ID4gPiA+IGhlcmUuICBCdXQgdGhpcyBsb29rcyBsaWtlIHRo
ZSBrZXkgaXNzdWUuICBJZiBjb21tb24gbGlicmFyeSBmdW5jdGlvbnMgYXJlCj4gPiA+ID4gdmVj
dG9yLWFjY2VsZXJhdGVkLCB3b3VsZG4ndCBpdCBtYWtlIHNlbnNlIHRoYXQgYWxtb3N0IGV2ZXJ5
IHByb2Nlc3Mgd291bGQKPiA+ID4gPiB3aW5kIHVwIHVzaW5nIHZlY3RvciBpbnN0cnVjdGlvbnM/
ICBBbmQgdGh1cyB0aGVyZSB3b3VsZG4ndCBiZSBtdWNoIHBvaW50Cj4gPiA+ID4gdG8gc2tpcHBp
bmcgdGhlIHZlY3RvciBjb250ZXh0IG1lbW9yeSBhbGxvY2F0aW9uPwo+ID4gPiA+Cj4gPiA+Cj4g
PiA+IFRoaXMgaXNzdWUgd2FzIGFkZHJlc3NlZCBpbiB0aGUgdGhyZWFkIHJlZ2FyZGluZyBJbnRl
bCBBTVggSSBsaW5rZWQgdG8gaW4gYQo+ID4gPiBwcmV2aW91cyBtZXNzYWdlLiAgSSBkb24ndCBh
Z3JlZSB0aGF0IHRoaXMgaXMgdGhlIGtleSBpc3N1ZTsgaXQgaXMgb25lIG9mIGEKPiA+ID4gbnVt
YmVyIG9mIGlzc3Vlcy4gIFdoYXQgaWYgSSBkb24ndCB3YW50IHRvIHRha2UgdGhlIHBvdGVudGlh
bAo+ID4gPiBwb3dlci9mcmVxdWVuY3kgaGl0IGZvciB0aGUgdmVjdG9yIHVuaXQgZm9yIGEgd29y
a2xvYWQgdGhhdCwgYXQgYmVzdCwgdXNlcwo+ID4gPiBpdCBmb3IgdGhlIG9jY2FzaW9uYWwgbWVt
Y3B5PyAgV2hhdCBpZiB0aGUgYWxsb2NhdGlvbiBmYWlscywgaG93IHdpbGwgdGhhdAo+ID4KPiA+
IEhpIERhcml1cywKPiA+IFRoZSBtZW1jcHkgZnVuY3Rpb24gc2VlbXMgbm90IHRvIGJlIG9jY2Fz
aW9uYWxseSB1c2VkIGluIHRoZSBwcm9ncmFtcwo+ID4gYmVjYXVzZSBtYW55IGZ1bmN0aW9ucyBp
biBHbGliYyB1c2UgbWVtY3B5KCkgdG8gY29tcGxldGUgdGhlIG1lbW9yeQo+ID4gY29weS4gSSB1
c2UgdGhlIGZvbGxvd2luZyBzaW1wbGUgY2FzZSBhcyBhbiBleGFtcGxlLgo+ID4gdGVzdC5jCj4g
PiB2b2lkIG1haW4odm9pZCkgewo+ID4gICAgIHJldHVybjsKPiA+IH0KPiA+IFRoZW4sIHdlIGNv
bXBpbGUgaXQgYnkgImdjYyB0ZXN0LmMgLW8gYS5vdXQiIGFuZCBleGVjdXRlIGl0LiBJbiB0aGUK
PiA+IGV4ZWN1dGlvbiwgdGhlIG1lbWNweSgpIGhhcyBiZWVuIGNhbGxlZCB1bmV4cGVjdGVkbHku
IEl0IGlzIGJlY2F1c2UKPiA+IG1hbnkgbGliYyBpbml0aWFsaXplZCBmdW5jdGlvbnMgd2lsbCBi
ZSBleGVjdXRlZCBiZWZvcmUgZW50ZXJpbmcgdGhlCj4gPiB1c2VyLWRlZmluZWQgbWFpbiBmdW5j
dGlvbi4gT25lIG9mIHRoZSBleGFtcGxlIGlzIF9fbGliY19zZXR1cF90bHMoKSwKPiA+IHdoaWNo
IGlzIGNhbGxlZCBieSBfX2xpYmNfc3RhcnRfbWFpbigpLiBUaGUgX19saWJjX3NldHVwX3Rscygp
IHdpbGwKPiA+IHVzZSBtZW1jcHkoKSBkdXJpbmcgdGhlIHByb2Nlc3Mgb2YgY3JlYXRpbmcgdGhl
IER5bmFtaWMgVGhyZWFkIFZlY3Rvcgo+ID4gKERUVikuCj4gPgo+ID4gVGhlcmVmb3JlLCBJIHRo
aW5rIHRoZSBtZW1jcHkoKSBpcyB3aWRlbHkgdXNlZCBpbiBtb3N0IHByb2dyYW1zLgo+ID4KPgo+
IFlvdSdyZSBtaXNzaW5nIG15IHBvaW50LiAgTm90IGV2ZXJ5IChhbnk/KSBwcm9ncmFtIHNwZW5k
cyBhIG1ham9yaXR5IG9mIHRoZQo+IHRpbWUgZG9pbmcgbWVtY3B5KCksIGFuZCBldmVuIGlmIGEg
cHJvZ3JhbSBkaWQsIGFsbCBvZiBteSBwb2ludHMgYXJlIHN0aWxsCj4gdmFsaWQuCj4KPiBQbGVh
c2UgcmVhZCB0aGUgZGlzY3Vzc2lvbiBpbiB0aGUgdGhyZWFkIEkgcmVmZXJlbmNlZCBhbmQgdGhl
IHF1ZXN0aW9ucyBpbgo+IG15IHByaW9yIG1lc3NhZ2UuCj4KCkhpIERhcml1cywKCkFzIEkgbWVu
dGlvbmVkIGJlZm9yZSwgd2Ugd2FudCB0byB0cmVhdCB2ZWN0b3IgSVNBIGxpa2UgYSBnZW5lcmFs
IElTQQppbnN0ZWFkIG9mIGEgc3BlY2lmaWMgSVAuIFVzZXIgcHJvZ3JhbSBzaG91bGQgYmUgYWJs
ZSB0byB1c2UgaXQKdHJhbnNwYXJlbnRseSBqdXN0IGxpa2UgRlBVLgpJdCBzZWVtcyB0aGF0IHRo
ZSB1c2UgY2FzZSB5b3Ugd2FudCBpcyBhc2tpbmcgdXNlciB0byB1c2UgdmVjdG9yIGxpa2UKYSBz
cGVjaWZpYyBJUCwgdXNlciBwcm9ncmFtIHNob3VsZCBhc2sga2VybmVsIGJlZm9yZSB0aGV5IHVz
ZSBpdCBhbmQKdGhhdCBpcyBub3Qgd2hhdCB3ZSB3YW50IHRvIGRvIGluIHRoaXMgcGF0Y2hzZXQu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
