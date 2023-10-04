Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD03E7C4CA
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 14:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fmpf1GFcu5pUN6VGruEg2ncnEWUhCxnsfXe9ZzrrZWo=; b=FnJ3JoVtG1w2OW
	APzMv9uulNg6nF1zhkC9GTyYfBN2dGMa9911R5VfC4LmK5aCa3V9oI/eepb6OAdHHOGMwFNlx22Wv
	nMH2ilIRTclXUKTSqyATZqOQp1xUbqiGOf7RjCLhWMQlaFZRk364rYXEkbrsFrGuF8Dbp6Hgc5REy
	oYieyF05q2TsKnL8LAcXS8Fz1BNUmdRHMGhB30yrIke6z5pyP2lNhU6SmZ+cP9kvjvlK5ebAZM3ls
	xrOWJDsmOLcaWyTQgQ0hoOZEN6nrkXCQxiP5zUPTydZApsAgKze9yV3/eOxFKAZ4TXHYssncEeTIr
	OyqrzKFtMDVvM3zz9Wgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3LS-000Hce-1x;
	Wed, 04 Oct 2023 14:59:26 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3LO-000Hc9-1h
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 14:59:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1696431543; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gMNoEli4g2cQmjpcvCqiTd0zYxrBPMD7THOpvqCJHuBCjFTHlL9bRpK1PpNn9VxWIMRRvOWFj/81OVWtua0txKV9ePNxYJz/s9wa8Qqwc1qR17pt+ONK2llQh9jXO0O5o9UxpU03SAa1SuhE8GBIMYh9hcJmZxEeC1MxpTxWMWQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1696431543; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LdPMaLjHlfUS0gHSy+2qt31lLyAWmRO7wmsNvzL4OAA=; 
	b=RndgPiKwFgWEQvELvUjLB4YgihwR+6RtVkQGlc1vQeTytOl0qwkq5Grh5h9Q9vBuNH3GrYJZrJs9ZSIAeB86tKLvEloWPMRDz0OLeCPIvzRfZ1ZFefbdsUggu3U4WAAyjQNBpKAKOZ4d/EhXai85OdmlZj5xQXKqxiKnUt5F3uM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1696431543;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=LdPMaLjHlfUS0gHSy+2qt31lLyAWmRO7wmsNvzL4OAA=;
	b=eR+gxRYUfLByktnwDoAwm9lPs4BfVqK07dHUdshqDxQX2gRuSzUu3NFgPnhbxYRc
	rMLb8eGiorRLyOJ6xgw3daXcyMGY2mq886CEGxS+toWYQzUc2hAtqYhDWbylPy5cyru
	lULRYYaZaMkWc4UCNNbRIi8ttEPo1CXM5swK74Bcscl9OZ3+MlpilTGcqSMFxaV0HNR
	VmMkv2V9QlRvVB2a9wjbrBQ02AP5OmGfA642uz3IbHTtbREbkub7MO2+IpvBJ9yECtI
	PK3T9xtDX4OVUyarYMIkSfRjEgR286oGWKYn3eTMHyjiFuQ29v0YbqYHFSlrN6FjeGg
	xCr+bBBG+w==
Received: from edelgard.fodlan.icenowy.me (120.85.98.65 [120.85.98.65]) by mx.zohomail.com
	with SMTPS id 1696431540266745.8094566529361; Wed, 4 Oct 2023 07:59:00 -0700 (PDT)
Message-ID: <12ea9707f8c45dc398eb20f303aba9ecc7624455.camel@icenowy.me>
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
From: Icenowy Zheng <uwu@icenowy.me>
To: Robin Murphy <robin.murphy@arm.com>, "Lad, Prabhakar"
	 <prabhakar.csengg@gmail.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: Drew Fustini <dfustini@baylibre.com>, Christoph Hellwig <hch@lst.de>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Robert Nelson
 <robertcnelson@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, Fu
 Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor
 Dooley <conor@kernel.org>, Jason Kridner <jkridner@beagleboard.org>, Xi
 Ruoyao <xry111@xry111.site>, Han Gao <gaohan@iscas.ac.cn>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Linux-MM <linux-mm@kvack.org>
Date: Wed, 04 Oct 2023 22:58:52 +0800
In-Reply-To: <a568a9dd-bab2-1e23-c4d5-9f6475bdcc3b@arm.com>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
	 <CAOCHtYhnx1EpBM+o3xhdsicx5uqLidojK3f0HQ+VfyVv1ZXnVQ@mail.gmail.com>
	 <CAOCHtYi5Ab5ppCmaQV3QuKQcpmJX+sHdAmtuEXhfq8xf5fFCYQ@mail.gmail.com>
	 <ZRuamJuShOnvP1pr@x1> <ZR1M3FcdXrDmIGu2@xhacker>
	 <CA+V-a8ugwqkQxnX-wwWCHVtBBtG=aVv=MZTc53LbpxtFA=N1_A@mail.gmail.com>
	 <bc2b0b30-ab37-f336-c90e-eab570d393a2@arm.com>
	 <c2ea3f34bb919293b850fab6ed42b61e3517ba35.camel@icenowy.me>
	 <a568a9dd-bab2-1e23-c4d5-9f6475bdcc3b@arm.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_075922_584331_F31C4D80 
X-CRM114-Status: GOOD (  29.58  )
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

5ZyoIDIwMjMtMTAtMDTmmJ/mnJ/kuInnmoQgMTU6MTggKzAxMDDvvIxSb2JpbiBNdXJwaHnlhpnp
gZPvvJoKPiBPbiAwNC8xMC8yMDIzIDM6MDIgcG0sIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4gWy4u
Ll0KPiA+ID4gPiA+IEkgYmVsaWV2ZSBjb21taXQgNDg0ODYxZTA5ZjNlICgic29jOiByZW5lc2Fz
OiBLY29uZmlnOiBTZWxlY3QKPiA+ID4gPiA+IHRoZQo+ID4gPiA+ID4gcmVxdWlyZWQgY29uZmln
cyBmb3IgUlovRml2ZSBTb0MiKSBjYW4gY2F1c2UgcmVncmVzc2lvbiBvbgo+ID4gPiA+ID4gYWxs
Cj4gPiA+ID4gPiBub24tZG1hLWNvaGVyZW50IHJpc2N2IHBsYXRmb3JtcyB3aXRoIGdlbmVyaWMg
ZGVmY29uZmlnLiBUaGlzCj4gPiA+ID4gPiBpcwo+ID4gPiA+ID4gYSBjb21tb24gaXNzdWUuIFRo
ZSBsb2dpYyBoZXJlIGlzOiBnZW5lcmljIHJpc2N2IGRlZmNvbmZpZwo+ID4gPiA+ID4gc2VsZWN0
cwo+ID4gPiA+ID4gQVJDSF9SOUEwN0cwNDMgd2hpY2ggc2VsZWN0cyBETUFfR0xPQkFMX1BPT0ws
IHdoaWNoIGFzc3VtZXMKPiA+ID4gPiA+IGFsbAo+ID4gPiA+ID4gbm9uLWRtYS1jb2hlcmVudCBy
aXNjdiBwbGF0Zm9ybXMgaGF2ZSBhIGRtYSBnbG9iYWwgcG9vbCwgdGhpcwo+ID4gPiA+ID4gYXNz
dW1wdGlvbgo+ID4gPiA+ID4gc2VlbXMgbm90IGNvcnJlY3QuIEFuZCBJIGJlbGlldmUgRE1BX0dM
T0JBTF9QT09MIHNob3VsZCBub3QKPiA+ID4gPiA+IGJlCj4gPiA+ID4gPiBzZWxlY3RlZCBieSBB
UkNIX1NPQ0ZBTUlMSVksIGluc3RlYWQsIG9ubHkgQVJDSCB1bmRlciBzb21lCj4gPiA+ID4gPiBz
cGVjaWZpYwo+ID4gPiA+ID4gY29uZGl0aW9ucyBjYW4gc2VsZWN0IGl0IGdsb2JhbHksIGZvciBl
eGFtcGxlIE5PTU1VIEFSTSBhbmQKPiA+ID4gPiA+IHNvCj4gPiA+ID4gPiBvbi4KPiA+ID4gPiA+
IAo+ID4gPiA+ID4gU2luY2UgdGhpcyBpcyBhIHJlZ3Jlc3Npb24sIHdoYXQncyBwcm9wZXIgZml4
PyBhbnkgc3VnZ2VzdGlvbgo+ID4gPiA+ID4gaXMKPiA+ID4gPiA+IGFwcHJlY2lhdGVkLgo+ID4g
PiAKPiA+ID4gSSB0aGluayB0aGUgYW5zd2VyIGlzIHRvIG5vdCBzZWxlY3QgRE1BX0dMT0JBTF9Q
T09MLCBzaW5jZSB0aGF0Cj4gPiA+IGlzCj4gPiA+IG9ubHkKPiA+IAo+ID4gV2VsbCBJIHRoaW5r
IGZvciBSSVNDLVYsIGl0J3Mgbm90IE5PTU1VIG9ubHkgYnV0IGFwcGxpY2FibGUgZm9yCj4gPiBl
dmVyeQo+ID4gY29yZSB0aGF0IGRvZXMgbm90IHN1cHBvcnQgU3ZwYm10IG9yIHZlbmRvci1zcGVj
aWZpYyBhbHRlcm5hdGl2ZXMsCj4gPiBiZWNhdXNlIHRoZSBvcmlnaW5hbCBSSVNDLVYgcHJpdiBz
cGVjIGRvZXMgbm90IGRlZmluZSBtZW1vcnkKPiA+IGF0dHJpYnV0ZXMKPiA+IGluIHBhZ2UgdGFi
bGUgZW50cmllcy4KPiA+IAo+ID4gRm9yIHRoZSBSZW5lc2FzL0FuZGVzIGNhc2UgSSB0aGluayBh
IHBvb2wgaXMgc2V0IGJ5IE9wZW5TQkkgd2l0aAo+ID4gdmVuZG9yLXNwZWNpZmljIE0tbW9kZSBm
YWNpbGl0eSBhbmQgdGhlbiBwYXNzZWQgaW4gRFQsIGFuZCB0aGUgUy0KPiA+IG1vZGUKPiA+ICh3
aGljaCBNTVUgaXMgZW5hYmxlZCBpbikganVzdCBzZWVzIGZpeGVkIG1lbW9yeSBhdHRyaWJ1dGVz
LCBpbgo+ID4gdGhpcwo+ID4gY2FzZSBJIHRoaW5rIERNQV9HTE9CQUxfUE9PTCBpcyBuZWVkZWQu
Cj4gCj4gT2ggd293LCBpcyB0aGF0IHJlYWxseSBhIHRoaW5nPyBJbiB0aGF0IGNhc2UsIGVpdGhl
ciB5b3UganVzdCBjYW4ndCAKPiBzdXBwb3J0IHRoaXMgcGxhdGZvcm0gaW4gYSBtdWx0aS1wbGF0
Zm9ybSBrZXJuZWwsIG9yIHNvbWVvbmUgbmVlZHMgdG8KPiBkbyAKCldlbGwsIGNvbnNpZGVyaW5n
IFJaL0ZpdmUgZW5hYmxlcyBzb21lIHNwZWMtbm9uLWNvbmZvcm1hbnQgbG9jYWwgbWVtb3J5Cih3
aGljaCBieXBhc3NlcyBNTVUpIHRoYXQgbWFrZXMgZXZlbiBydW5uaW5nIGdlbmVyaWMgdXNlciBz
cGFjZQpiaW5hcmllcyBub3Qgc28gdmlhYmxlIChQSUUgb25lcyBtYXkgc3RpbGwgcnVuLCBidXQg
dGhvc2UgYnVpbHQgdG8gYmUKb24gdGhlIGRlZmF1bHQgZml4ZWQgbG9jYXRpb24gb2YgYmludXRp
bHMgd2lsbCBjb25mbGljdCB3aXRoIHRoZSBNTVUtCmJ5cGFzc2luZyBsb2NhbCBtZW1vcnkpLCBu
b3Qgc3VwcG9ydGluZyBpdCBpbiBhIG11bHRpLXBsYXRmb3JtIGtlcm5lbApkb2Vzbid0IGxvb2sg
bGlrZSBhIGJpZyBkZWFsLgoKPiBzb21lIGZpZGRseSB3b3JrIGluIGRtYS1kaXJlY3QgdG8gYSkg
aW50cm9kdWNlIHRoZSBub3Rpb24gb2YgYW4KPiBvcHRpb25hbCAKPiBnbG9iYWwgcG9vbCwgYW5k
IGIpIG1ha2UgaXQgc29tZWhvdyBjb3BlIHdpdGggRE1BX0RJUkVDVF9SRU1BUCBiZWluZyAKPiBl
bmFibGVkIGJ1dCBub24tZnVuY3Rpb25hbC4KPiAKPiBUaGFua3MsCj4gUm9iaW4uCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
