Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E70CF6499
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 00:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+zuDOQPaCwDQKH6WSNj7i5SDGvuZ2gglyHH7Lvgawg=; b=cng0s/WCW8Rw22
	XTQBvrACa1n1eXX9yGSIpEEzd8Kry7+VOMA1gflI5SWbT5facCRHMzBcN1Wv6ytmzJnMoone2GqQo
	hsFmod6ztJ07j/M5BRM+9d5vxxYWZ1yAuHGlIeKnyw+Pb+I1jNpFpRwAcqTvhk1Av6qFULzHvSMdz
	M6UuB8Fe2+DK1ROp7vfng9gcULgQ86gHkh+s941Cjmafe1ClKV+nT+KI3H2CIOd144w314PFeIk3g
	mIitd/jfRaE8XW4pIUBWEvclJGZjJL2dQdKa6n7qLwT1hanWh6ddiVz88OHYYWXGDrGGyDznSr3lO
	49NQdrSa6jk9IIR3AIog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLsMl-00000005sor-2qPf;
	Thu, 20 Nov 2025 00:17:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLsMk-00000005sol-2VIL
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 00:17:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EECC760010;
	Thu, 20 Nov 2025 00:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04C6C4CEF5;
	Thu, 20 Nov 2025 00:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763597857;
	bh=1cc3DbrfxnW4bVEHX06DIBepzUwipjfMU4MlGRZWJG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=osBQ/xhIbE0YvXOjxBfvLIcWf55uqJknH/xyCufQoAD5HqGHsoYR7xTkfpzM3WS93
	 AnbE4xsplw+aIjfxBnScQIqBoD5tMYR20opCYNNwgDP9arPFLB5ny3OxoinXDGZWtj
	 HrRRpuOliNNGJUrXvqZPyul92tpdl3PW1TjH8QpsuaeMRMNwHHh0SP3cS7jGWwK+Xl
	 rbpXPmpDJzsc7/L+aoVc7dow4FhYhgaGq6z4FWKW5nXvuGSgP1ufjLbSLrI+AhxaLi
	 wVxA6GspZDmXWq2SF+p7zB+DORkv8U8TA2THROjvL3goBeNfP1izbudphVHjek0A86
	 +OGbWOAJueRHw==
Date: Thu, 20 Nov 2025 07:59:47 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Michael =?utf-8?B?QsO8c2No?= <mb@bues.ch>
Subject: Re: [PATCH] gpio: dwapb: Fold dwapb_context into dwapb_gpio_port
Message-ID: <aR5Z8-haM4NwhdPg@xhacker>
References: <20251119150049.13537-1-jszhang@kernel.org>
 <aR4EEJO_PeXMKF_h@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aR4EEJO_PeXMKF_h@smile.fi.intel.com>
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

T24gV2VkLCBOb3YgMTksIDIwMjUgYXQgMDc6NTM6MjBQTSArMDIwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IE9uIFdlZCwgTm92IDE5LCAyMDI1IGF0IDExOjAwOjQ5UE0gKzA4MDAsIEppc2hl
bmcgWmhhbmcgd3JvdGU6Cj4gPiBGb2xkIGR3YXBiX2NvbnRleHQgaW50byBzdHJ1Y3QgZHdhcGJf
Z3Bpb19wb3J0IHRvIGZ1cnRoZXIgc2ltcGxpZnkKPiA+IHRoZSBjb2RlLiBTdXJlIHRoaXMgYnJp
bmdzIGEgdGlueSAzNiBieXRlcyBkYXRhIG92ZXJoZWFkIGZvcgo+ID4gIVBNX1NMRUVQLiBBZnRl
ciBncmVwcGluZyB0aGUgYXJtL2FybTY0L3Jpc2N2IGR0cyBkaXIsIHRoZSBtYXggZHdhcGIKPiA+
IGdwaW8gcG9ydCBudW1iZXIgaXMgNih0aGUgYmVybGluMnEgc29jIGZhbWlseSksIHNvIHRoaXMg
bWVhbnMgd2Ugd2lsbAo+IAo+IEdQSU8KPiAKPiAqYW5kIEkgYmVsaWV2ZSB0aGlzIGlzIGxpbWl0
YXRpb24gYnkgU3lub3BzeXMgaW4gSFcsIGJ1dCBJJ20gbm90IGdvaW5nIHRvIGNoZWNrCj4gdGhl
IGRhdGFzaGVldCByaWdodCBub3cuCgpzbnBzIGRvZXNuJ3QgbGltaXQgdGhpcy4gVGhlIG1heCBk
d2FwYiBncGlvIGNvbnRyb2xsZXIgbnVtYmVyIGlzIDYgYXMKaXMgZ3JlcHBlZCB0aGUgYXJtL2Fy
bTY0L3Jpc2N2IGV0Yy4gZHRzIGRpci4KPiAKPiA+IHdhc3RlIDIxNiBieXRlcyBtZW1vcnkgaW4g
dG90YWwgd2hpY2ggaXMgdHJpdmlhbCBjb21wYXJlZCB0byB0aGUKPiA+IHN5c3RlbSBtZW1vcnku
Cj4gPiAKPiA+IEZyb20gYW5vdGhlciBzaWRlLCBhcyBNaWNoYWVsIG1lbnRpb25lZDoKPiA+ICJU
aGUgZHJpdmVyIGN1cnJlbnRseSBhbGxvY2F0ZXMgdGhlIHN0cnVjdCB3aXRoIGt6YWxsb2MgYW5k
IHN0b3JlcyBhCj4gPiBwb2ludGVyIHRvIGl0IGluIGNhc2Ugb2YgUE09eS4KPiA+IFNvIHRoaXMg
cHJvYmFibHkgaGFzIGFuIG92ZXJoZWFkIGluIHRoZSBzYW1lIG9yZGVyIG9mIG1hZ25pdHVkZQo+
ID4gKHBvaW50ZXIgKyBtYWxsb2Mgb3ZlcmhlYWQvYWxpZ25tZW50L2ZyYWdtZW50YXRpb24pIGlu
IGNhc2Ugb2YgUE09eQo+ID4gbm93LiIKPiA+IAo+ID4gU28gbGV0J3MgRm9sZCBkd2FwYl9jb250
ZXh0IGludG8gc3RydWN0IGR3YXBiX2dwaW9fcG9ydC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTog
SmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+IAo+ID4gQ0M6IE1pY2hhZWwgQsO8
c2NoIDxtYkBidWVzLmNoPgo+IAo+IFBsZWFzZSwgdXNlIC0tY2Mgb3IgbW92ZSBDYyBsaXN0IGJl
bG93Li4uCj4gCj4gPiAtLS0KPiAKPiAuLi50aGlzIGN1dHRlciBsaW5lLiBJdCB3aWxsIGhhdmUg
dGhlIHNhbWUgZWZmZWN0IG9uIHRoZSBlbWFpbHMsIGJ1dCBpdCB3aWxsCj4gcmVkdWNlIHRoZSBu
b2lzZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4gCj4gPiBOT1RFOiB0aGlzIHBhdGNoIGlzIGFw
cGxpZWQgYWdhaW5zdCB0aGUgZm9sbG93aW5nIHNlcmllczoKPiA+IFtQQVRDSCB2MyAwMC8xNV0g
Z3BpbzogVXNlIG1vZGVybiBQTSBtYWNyb3MKPiAKPiBJdCdzIGJldHRlciB0byBqdXN0IHB1dCBh
IGxpbmsgdG8gbG9yZS5rZXJuZWwub3JnIG9yIGF0IGxlYXN0IG1lc3NhZ2UtaWQuCj4gCj4gLi4u
Cj4gCj4gSSBoYXZlIGEgbWl4ZWQgZmVlbGluZ3MgYWJvdXQgdGhpcywgYnV0IGlmIG1haW50YWlu
ZXJzIGdvIHdpdGggaXQsCj4gbGV0IGl0IGJlIHRoZW4uCj4gCj4gLS0gCj4gV2l0aCBCZXN0IFJl
Z2FyZHMsCj4gQW5keSBTaGV2Y2hlbmtvCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
