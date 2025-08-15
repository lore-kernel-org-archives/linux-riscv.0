Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4C5CA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 23:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+qF4YzYIUMP1AbaqIg5crVcGPGkHry9cVfI7j6dtCPM=; b=XBhVHXMgAjfh47
	wvLuMO5bEn0bfkOHq5AdCn0oPribYdh7BB9jAQy1tXnLdQAdM8gUJ6bSwGl4pOAy6wO6a/Q8uy8Bg
	st2k7d/hGK4VtIydKhA391FaSjHVqYShrC6+0WRxTWY5kIyfOCFieauSyxktjD2lR0Q4j3578Tm+T
	ef2V6Mp9VDbQkQjl2STJ243XSxUXIFDGbhFU69uSIKLj9RHtiH8FKPD77eTN0V8tSsTwB/plZNRNv
	a8Pmha6JcJSw79pwpU759z0k4XrrnfX+mmDYKMJdQr8EpNb/nK1I5iPqpq2xV+FShiCD2claMdYWY
	3vLHff4gSB4nBoNbt84Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un3qP-00000003hhO-2bet;
	Fri, 15 Aug 2025 23:28:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un3qM-00000003hgb-2xlY
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 23:28:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D60BF5C6E9A;
	Fri, 15 Aug 2025 23:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB6EC4CEEB;
	Fri, 15 Aug 2025 23:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755300497;
	bh=yelvL4dmdgGDCuYleeyGfJDg/UCsmwpvJL6w2P4pq9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qqZ/cddDsjxUfDISYYsis1AnupksV+QZJvj/YQxMXXKrirybYWyGnqw4PTI0aVdd+
	 pxFnuuiJgd9gmjWa8pYiKfv32etx+dk8lCdNquGmfr1fOoVUhT5fTJ7mrwGhdQv4Ll
	 tfD9RtqC5vHwZnWXxNNm3C90yD6ORuJhYYbS+RjXwvm7+2O1/OVM/silVmrhYWae9X
	 vySHsADtZwuNMD2Y4Cfis2d3DMNyrDy8iHeXTb36Tokv20bn9lLvF697GOZtguRFZX
	 fYGX9qi5NT9pH2dXdHmo+BthrW9mAkS/jAKzuBtZymXoOb73866JopEaRl/xRnv3hQ
	 zY8JPn3asjiTA==
Date: Fri, 15 Aug 2025 16:28:16 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>, Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] clk: thead: th1520-ap: allow gate cascade and fix
 padctrl0
Message-ID: <aJ/CkFlRNFCYNoOS@x1>
References: <20250813171136.2213309-1-uwu@icenowy.me>
 <eedd44480a76840e1fec73d4433c772c5bdc7011.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eedd44480a76840e1fec73d4433c772c5bdc7011.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_162818_786229_2A2C8216 
X-CRM114-Status: GOOD (  12.76  )
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

T24gVGh1LCBBdWcgMTQsIDIwMjUgYXQgMDE6MTY6MTZBTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyNS0wOC0xNOaYn+acn+Wbm+eahCAwMToxMSArMDgwMO+8jEljZW5vd3kg
WmhlbmflhpnpgZPvvJoKPiA+IEN1cnJlbnQgY2N1X2dhdGUgaW1wbGVtZW50YXRpb24gZG9lcyBu
b3QgZWFzaWx5IGFsbG93IGdhdGVzIHRvIGJlCj4gPiBjbG9jawo+ID4gcGFyZW50cyBiZWNhdXNl
IG9mIHRoZSB3YXN0ZSBvZiBzdHJ1Y3QgY2xrX2h3IGluIHN0cnVjdCBjY3VfZ2F0ZTsKPiA+IGhv
d2V2ZXIgaXQncyBmb3VuZCB0aGF0IHRoZSBwYWRjdHJsMCBhcGIgY2xvY2sgZ2F0ZSBzZWVtcyB0
byBiZQo+ID4gZG93bnN0cmVhbSBvZiBwZXJpc3lzLWFwYjQtaGNsaywgZ2F0aW5nIHRoZSBsYXR0
ZXIgdy9vIGdhdGluZyB0aGUKPiA+IGZvcm1lcgo+ID4gbWFrZXMgdGhlIHBhZGN0cmwwIHJlZ2lz
dGVycyBpbmFjY2Vzc2libGUgdG9vLgo+ID4gCj4gPiBGaXggdGhpcyBieSByZWZhY3RvciBjY3Vf
Z2F0ZSBjb2RlLCBtaW1pY2luZyB3aGF0IFlhbyBaaSBkaWQgb24KPiA+IGNjdV9tdXg7IGFuZCB0
aGVuIGFzc2lnbiBwZXJpc3lzLWFwYjQtaGNsayBhcyBwYXJlbnQgb2YgcGFkY3RybDAgYnVzCj4g
PiBnYXRlLgo+IAo+IEZvcmdvdCB0byBtZW50aW9uIGEgZWFzeSB0ZXN0IG9mIHRoaXMgcGF0Y2hz
ZXQ6Cj4gCj4gSnVzdCBpbnN0YWxsIGBncGlvc2V0YCBmcm9tIGBsaWJncGlvZGAgb24gYSBMaWNo
ZWUgUGkgNEEsIHBsdWcgYSBmYW4gdG8KPiBpdHMgZmFuIHBvcnQsIGFuZCBydW4gYGdwaW9zZXQg
MyAzPTFgLiBUaGUgZXhwZWN0ZWQgYmVoYXZpb3IgaXMgdGhlIGZhbgo+IHN0YXJ0cyB0byBzcGlu
IChiZWNhdXNlIEdQSU8zXzMgaXMgdGhlIHBpbiBjb250cm9sbGluZyB0aGUgZmFuKSwKPiBob3dl
dmVyIHdpdGhvdXQgdGhpcyBwYXRjaHNldCBMaW51eCB3aWxsIGZhaWwgdG8gc3dpdGNoIHRoYXQg
cGluLgoKVGhhbmtzLiBUaGF0IHdvcmtlZCBncmVhdCBhbmQgdGhlIGZhbiBpcyBzcGlubmluZyA6
KQoKRHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
