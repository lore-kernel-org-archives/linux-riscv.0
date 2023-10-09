Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C977AE95A96
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 10:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yk4/v91j9JHOnMjgmAxJb04/Lqff5OhTNGSo/4Q68xk=; b=LGaf44Oiq5CHOC
	v0j8jGvE6gT60T+kuqfYQm/2BscAm5Wn8hFNESMa/lD8if6XBi0+AvtyyKL6f1U7ZSGrBn7cP/Tjh
	QBrAzZD1PkDit+bYidwB5o+VIXRrroN8iE3JH3b6tDU4ZH4upOF7ZGY/ITyTsYVhr6cM+Gv1anLAA
	3uWEo8jlxMvf7M4OHa1HUzHMd4amgSl9h2E8jcHdaUy788vBEgIIbWZ/yrixsWKHls+Viht6/xXw0
	xlr7iV34646OSOv5YtRkodKsYk/bmaxfcYWe00VxPgul1xLEW6eqB2bLNnp/jMBIut8o7Q2iGiibd
	+pmy5T/7PTxkfswIZW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpn7i-00AA7Q-0C;
	Mon, 09 Oct 2023 10:04:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpn7f-00AA5I-1R
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 10:04:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D54BD1FB;
	Mon,  9 Oct 2023 03:04:57 -0700 (PDT)
Received: from [10.57.69.35] (unknown [10.57.69.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2CFD3F7A6;
	Mon,  9 Oct 2023 03:04:14 -0700 (PDT)
Message-ID: <1cd44af1-10ac-465a-8d20-e0aa268e036f@arm.com>
Date: Mon, 9 Oct 2023 11:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dma-direct: add depdenencies to
 CONFIG_DMA_GLOBAL_POOL
To: Geert Uytterhoeven <geert@linux-m68k.org>, Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
 Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
 Jim Quinlan <james.quinlan@broadcom.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 arm-soc <soc@kernel.org>
References: <20231009074121.219686-1-hch@lst.de>
 <20231009074121.219686-2-hch@lst.de>
 <CAMuHMdWiYDQ5J7R7hPaVAYgXqJvpjdksoF6X-zHrJ_80Ly4XfQ@mail.gmail.com>
 <20231009091625.GB22463@lst.de>
 <CAMuHMdUZNewD-QC8J7MWSBP197Vc169meOjjK6=b7M11kVjUzg@mail.gmail.com>
 <20231009094330.GA24836@lst.de>
 <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
Content-Language: en-GB
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CAMuHMdV2FXdUHtjYW8JyXGBgHhR8De0vp3Ee77e6G8Vbs3gG8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_030423_549847_415F3951 
X-CRM114-Status: GOOD (  14.31  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyMy0xMC0wOSAxMDo1MSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIENocmlz
dG9waCwKPiAKPiBDQyBzb2MKPiAKPiBPbiBNb24sIE9jdCA5LCAyMDIzIGF0IDExOjQz4oCvQU0g
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgo+PiBPbiBNb24sIE9jdCAwOSwg
MjAyMyBhdCAxMTozNDo1NUFNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4+PiBU
aGUgZml4IHlvdSBhcmUgcmVmZXJyaW5nIHRvbyBpcyBwcm9iYWJseSBjb21taXQgYzFlYzRiNDUw
YWI3MjllMwo+Pj4gKCJzb2M6IHJlbmVzYXM6IE1ha2UgQVJDSF9SOUEwN0cwNDMgKHJpc2N2IHZl
cnNpb24pIGRlcGVuZAo+Pj4gb24gTk9OUE9SVEFCTEUiKSBpbiBuZXh0LTIwMjMxMDA2IGFuZCBs
YXRlci4gIEl0IGlzIG5vdCB5ZXQgdXBzdHJlYW0uCj4+Pgo+Pj4gU3RpbGwsIGl0IG1lcmVseSBt
YWtlcyBBUkNIX1I5QTA3RzA0MyAod2hpY2ggc2VsZWN0cyBETUFfR0xPQkFMX1BPT0wpCj4+PiBk
ZXBlbmQgb24gQVJDSF9SOUEwN0cwNDMuCj4+PiBSSVNDVl9ETUFfTk9OQ09IRVJFTlQgc3RpbGwg
c2VsZWN0cyBETUFfRElSRUNUX1JFTUFQLCBzbyBib3RoIGNhbiBlbmQKPj4+IHVwIGJlaW5nIGVu
YWJsZWQuCj4+Cj4+IE9rLCBzbyB3ZSBuZWVkIHRvIGFjdHVhbGx5IGZpeCB0aGlzIHByb3Blcmx5
LiAgTGFkLCBjYW4geW91IHJlc3Bpbgo+PiB0aGUgZml4IHRvIG5vdCBzZWxlY3QgRE1BX0RJUkVD
VF9SRU1BUCwgZm9yIEFSQ0hfUjlBMDdHMDQzPwo+IAo+IEFSQ0hfUjlBMDdHMDQzIGRvZXMgbm90
IHNlbGVjdCBETUFfRElSRUNUX1JFTUFQIGRpcmVjdGx5LAo+IFJJU0NWX0RNQV9OT05DT0hFUkVO
VCBkb2VzLiAgQW5kIHRoZXJlIGFyZSBvdGhlciB1c2VycyBvZgo+IFJJU0NWX0RNQV9OT05DT0hF
UkVOVCAoUklTQ1ZfSVNBX1pJQ0JPTSBhbmQgRVJSQVRBX1RIRUFEX0NNTykuCj4gU2hvdWxkIHRo
ZSBzZWxlY3Rpb24gb2YgRE1BX0RJUkVDVF9SRU1BUCBtb3ZlZCB0byB0aGVpciB1c2Vycz8KCk5v
LCB0aGUgc2VsZWN0aW9uIG9mIERNQV9HTE9CQUxfUE9PTCBzaG91bGQgYmUgcmVtb3ZlZCBmcm9t
IApSSVNWX0RNQV9OT05DT0hFUkVOVCBhbmQgc2VsZWN0ZWQgZGlyZWN0bHkgYnkgQVJDSF9SOUEw
N0cwNDMgKGFsb25nIHdpdGggCmFueSBvZiB0aGUgb3RoZXIgaW1wbGllZCBzeW1ib2xzIGl0IG5l
ZWRzKS4gT3IgaWYgYXMgc3VnZ2VzdGVkIHRoaXMgCnBoeXNpY2FsLWF0dHJpYnV0ZS1yZW1hcCB3
YWNraW5lc3MgaXMgZHVlIHRvIHNob3cgdXAgb24gbW9yZSBwbGF0Zm9ybXMgCmFzIHdlbGwsIG1h
eWJlIGhhdmUgYSBjb21tb24gY29uZmlnIGZvciB0aGF0IHdoaWNoIHNlbGVjdHMgCkRNQV9HTE9C
QUxfUE9PTCBwbHVzIHRoZSByZWxldmFudCBjYWNoZSBtYWludGVuYW5jZSBleHRlbnNpb25zIGFz
IGFuIAplcXVpdmFsZW50IHRvIFJJU0NWX0RNQV9OT05DT0hFUkVOVCwgYW5kIGNhbiBpdHNlbGYg
ZXhwbGljaXRseSBkZXBlbmQgb24gCk5PTlBPUlRBQkxFIGZvciBjbGFyaXR5LgoKVGhhbmtzLApS
b2Jpbi4KCj4gTm90ZSB0aGF0IHRoZSBmaXggaXMgYWxyZWFkeSBpbiBzb2MvZm9yLW5leHQsIHNv
IHdlIG5lZWQgY29vcmRpbmF0aW9uCj4gd2l0aCB0aGUgc29jIHBlb3BsZS4KPiAKPiBHcntvZXRq
ZSxlZXRpbmd9cywKPiAKPiAgICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
