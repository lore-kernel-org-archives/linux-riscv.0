Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F1BCDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 12:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yodPKjzVgk9IjjpxiBVrhaDFKe4Emxy0HwKkXoqYLpk=; b=vGbt7NJzhVASn5
	mJNWbw7RBuhYEQEBKHiUyp/gXXL0SjfE/2jq0kmDSzV0uPNCrWHty0+PxKkwuZdr/0COU0/1tYJyf
	S1udYmgt2RQp4A9m2rX0yFUz+FbBQo/qbuy2s0wzo2Zv83qyNAREthMZq8If+0IfqpNSCaVqbibqw
	cRAwYXN9RH0gUZkgPEOfiTBAVxGEMGtWvatyxqefiy5hVakN1twvG21IpXR0TkBsHXd3UNzCuQUMl
	9s/8UGsMBKbfF7C/dgdsGKGFZYugldcCBv6YV7EUKdvPyo1eNHVHhEoZKBvIm/tcN1e9m6KijHpZh
	2mEGPMmi6DRXUvQLyNJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjSm-00CK6H-1d;
	Tue, 17 Oct 2023 12:46:20 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjSi-00CK5N-2f
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 12:46:18 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4AE0367373; Tue, 17 Oct 2023 14:46:09 +0200 (CEST)
Date: Tue, 17 Oct 2023 14:46:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Jim Quinlan <james.quinlan@broadcom.com>, arm-soc <soc@kernel.org>
Subject: Re: [PATCH 04/12] soc: renesas: select RISCV_DMA_NONCOHERENT from
 ARCH_R9A07G043
Message-ID: <20231017124608.GA4386@lst.de>
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de> <20231016-pantyhose-tall-7565b6b20fb9@wendy> <20231016131745.GB26484@lst.de> <CAMuHMdXVZz=YWMAgzUzme-U3qxYeLdi66xw2CGubpesGy+ZjRw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXVZz=YWMAgzUzme-U3qxYeLdi66xw2CGubpesGy+ZjRw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_054617_015265_429B9357 
X-CRM114-Status: GOOD (  17.35  )
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

T24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgMTI6NDQ6NDFQTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIENocmlzdG9waCwKPiAKPiBPbiBNb24sIE9jdCAxNiwgMjAyMyBhdCAz
OjE34oCvUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgo+ID4gT24gTW9u
LCBPY3QgMTYsIDIwMjMgYXQgMDE6NTI6NTdQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+
ID4gPiA+ICsgICBzZWxlY3QgUklTQ1ZfRE1BX05PTkNPSEVSRU5UCj4gPiA+ID4gICAgIHNlbGVj
dCBFUlJBVEFfQU5ERVMgaWYgUklTQ1ZfU0JJCj4gPiA+ID4gICAgIHNlbGVjdCBFUlJBVEFfQU5E
RVNfQ01PIGlmIEVSUkFUQV9BTkRFUwo+ID4gPgo+ID4gPiBTaW5jZSB0aGlzIEtjb25maWcgbWVu
dSBoYXMgY2hhbmdlZCBhIGJpdCBpbiBsaW51eC1uZXh0LCB0aGUgc2VsZWN0cwo+ID4gPiBhcmUg
dW5jb25kaXRpb25hbCBoZXJlLCBhbmQgRVJSQVRBX0FOREVTX0NNTyB3aWxsIGluIHR1cm4gc2Vs
ZWN0Cj4gPiA+IFJJU0NWX0RNQV9OT05DT0hFUkVOVC4KPiA+Cj4gPiBPaCwgbG9va3MgbGlrZSBh
bm90aGVyIHBhdGNoIGxhbmRlZCB0aGVyZSBpbiBsaW51eC1uZXh0LiAgSSBoYWQKPiA+IHdhaXRl
ZCBmb3IgdGhlIHByZXZpb3VzIG9uZSBnbyBnbyB1cHN0cmVhbSBpbiAtcmM2LiAgTm90IHN1cmUK
PiA+IGhvdyB0byBiZXN0IGhhbmRsZSB0aGlzIGNvbmZsaWN0Lgo+IAo+IEkgdGhpbmsgdGhlIGVh
c2llc3QgaXMgdG8gYXNrIHNvYyB0byBhcHBseSB0aGlzIHNlcmllcz8KCkkgZG9uJ3QgdGhpbmsg
cHVsbGluZyBhbGwgdGhlIERNQSBiaXRzIGludG8gYSByYW5kb20gb3RoZXIgdHJlZQp3b3VsZCBi
ZSBhIGdvb2QgaWRlYS4gICBJIGNhbiBoYW5kIG9mZiB0aGUgZmlyc3QgZmV3IGJpdHMsIGJ1dCBJ
J2QKbmVlZCBhIHN0YWJsZSBicmFuY2ggdG8gcHVsbCBpbiBhZnRlciB0aGF0LiAgV2hpY2ggb2Yg
dGhlIGhhbGYgYSBkb3plbgpzb2MgdHJlZXMgd2UgaGF2ZSBpbiBsaW51eC1uZXh0IGlzIHRoaXMg
YW55d2F5PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
