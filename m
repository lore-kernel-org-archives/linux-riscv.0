Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416E1C77B73
	for <linux-riscv@archiver.kernel.org>; Sat, 27 May 2023 10:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4X4pVcKZD/Mdj+eneOp62poi/gwe3EKT4x3Mkh6PDw=; b=wcVtOQwxvfj0Af
	prrTDkMFMggKu6tc56+8KqtLu/EBv3HuTjOiQEQAq0UYqaA7ZtgvV+T0AIER2XFZnWXvwExZN4y9W
	jw+sPMINLhRBfYQy5NGG8zlt7B8bqDNbM5C8U5is2si5eBCuSQ3QvHSsPKa4woErQ59NPdeO0eHvu
	u0gEKTCy1P+jBtnPx3CXmU4hZnrsQpVTwyPrKhROsRhm0mx3g9+ltD3rNputbaSVXrrjhtncsP7vz
	Oltd0MhxfG5QCZJcLXkbKrusZI/2PA0vafLUmmIh8d2ugQjucOnHeVP7oC9Fuk3AnzhPF+OYZHWok
	gCgd5/lGpBM8JPGhppIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2rNG-005TvN-0v;
	Sat, 27 May 2023 10:42:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2rNC-005Tti-2S;
	Sat, 27 May 2023 10:42:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9F50861072;
	Sat, 27 May 2023 10:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE11AC433EF;
	Sat, 27 May 2023 10:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685184129;
	bh=Z4TeIapFpeS1e5WxOMUpOrDg87Rxe8ydQavxJsO0vug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qtjpACU3i7FVjLT023Ddg5iX1Sm9mYGyR9BAcAldcZGtkGi1IgPSjR20Gkom5YVFi
	 9GqwWTqSe6aCGE+Jk6r1lk9ASI1BqwfpG0h2HSrQ1BaMlG84/DZwyIoKGVbNuFJs46
	 KM/CX4KgN01bs8ctMAmNzdH3P/7vJMOVtl/spQpp1NeNWLVBfmoG8tubTTHEz78nbM
	 Mi5TzSK4O/LtfJpDtvhI5QLWzSn68VROvh7bVsKVmfCA0L8DXw2EUj7uC78b19+5Rx
	 6iPjAV5tMRrgS7SBBOhhGo75UiSObo7waKqxJ5uuMYjPYcI7MRtTbdg+ba8TB9jNgs
	 b+IpYHQpsYW9A==
Date: Sat, 27 May 2023 13:41:44 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vishal Moola <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PATCH v2 05/34] mm: add utility functions for ptdesc
Message-ID: <20230527104144.GH4967@kernel.org>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-6-vishal.moola@gmail.com>
 <20230525090956.GX4967@kernel.org>
 <CAOzc2pxSH6GhBnAoSOjvYJk2VdMDFZi3H_1qGC5Cdyp3j4AzPQ@mail.gmail.com>
 <20230525202537.GA4967@kernel.org>
 <CAOzc2pxD21mxisy-M5b_SDUv0MYwNHqaVDJnJpARuDG_HjCbOg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOzc2pxD21mxisy-M5b_SDUv0MYwNHqaVDJnJpARuDG_HjCbOg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230527_034210_907718_3302A13C 
X-CRM114-Status: GOOD (  23.36  )
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

T24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMDE6NTM6MjRQTSAtMDcwMCwgVmlzaGFsIE1vb2xhIHdy
b3RlOgo+IE9uIFRodSwgTWF5IDI1LCAyMDIzIGF0IDE6MjbigK9QTSBNaWtlIFJhcG9wb3J0IDxy
cHB0QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgTWF5IDI1LCAyMDIzIGF0IDEx
OjA0OjI4QU0gLTA3MDAsIFZpc2hhbCBNb29sYSB3cm90ZToKPiA+ID4gT24gVGh1LCBNYXkgMjUs
IDIwMjMgYXQgMjoxMOKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArc3RhdGljIGlubGluZSBzdHJ1Y3QgcHRkZXNjICpwdGRl
c2NfYWxsb2MoZ2ZwX3QgZ2ZwLCB1bnNpZ25lZCBpbnQgb3JkZXIpCj4gPiA+ID4gPiArewo+ID4g
PiA+ID4gKyAgICAgc3RydWN0IHBhZ2UgKnBhZ2UgPSBhbGxvY19wYWdlcyhnZnAgfCBfX0dGUF9D
T01QLCBvcmRlcik7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICByZXR1cm4gcGFnZV9wdGRl
c2MocGFnZSk7Cj4gPiA+ID4gPiArfQo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gK3N0YXRpYyBpbmxp
bmUgdm9pZCBwdGRlc2NfZnJlZShzdHJ1Y3QgcHRkZXNjICpwdCkKPiA+ID4gPiA+ICt7Cj4gPiA+
ID4gPiArICAgICBzdHJ1Y3QgcGFnZSAqcGFnZSA9IHB0ZGVzY19wYWdlKHB0KTsKPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ICsgICAgIF9fZnJlZV9wYWdlcyhwYWdlLCBjb21wb3VuZF9vcmRlcihwYWdl
KSk7Cj4gPiA+ID4gPiArfQo+ID4gPiA+Cj4gPiA+ID4gVGhlIHB0ZGVzY197YWxsb2MsZnJlZX0g
QVBJIGRvZXMgbm90IHNvdW5kIHJpZ2h0IHRvIG1lLiBUaGUgbmFtZQo+ID4gPiA+IHB0ZGVzY19h
bGxvYygpIGltcGxpZXMgdGhlIGFsbG9jYXRpb24gb2YgdGhlIHB0ZGVzYyBpdHNlbGYsIHJhdGhl
ciB0aGFuCj4gPiA+ID4gYWxsb2NhdGlvbiBvZiBwYWdlIHRhYmxlIHBhZ2UuIFRoZSBzYW1lIGdv
ZXMgZm9yIGZyZWUuCj4gPiA+Cj4gPiA+IEknbSBub3Qgc3VyZSBJIHNlZSB0aGUgZGlmZmVyZW5j
ZS4gQ291bGQgeW91IGVsYWJvcmF0ZT8KPiA+Cj4gPiBJIHJlYWQgcHRkZXNjX2FsbG9jKCkgYXMg
ImFsbG9jYXRlIGEgcHRkZXNjIiByYXRoZXIgdGhhbiBhcyAiYWxsb2NhdGUgYQo+ID4gcGFnZSBm
b3IgcGFnZSB0YWJsZSBhbmQgcmV0dXJuIHB0ZGVzYyBwb2ludGluZyB0byB0aGF0IHBhZ2UiLiBT
ZWVtcyB2ZXJ5Cj4gPiBjb25mdXNpbmcgdG8gbWUgYWxyZWFkeSBhbmQgaXQgd2lsbCBiZSBldmVu
IG1vcmUgY29uZnVzaW9uIHdoZW4gd2UnbGwgc3RhcnQKPiA+IGFsbG9jYXRpbmcgYWN0dWFsIHB0
ZGVzY3MuCj4gCj4gSG1tLCBJIHNlZSB3aGF0IHlvdSdyZSBzYXlpbmcuIEknbSBlbnZpc2lvbmlu
ZyB0aGlzIGZ1bmN0aW9uIGV2b2x2aW5nIGludG8KPiBvbmUgdGhhdCBhbGxvY2F0ZXMgYSBwdGRl
c2MgbGF0ZXIuIEkgZG9uJ3Qgc2VlIHdoeSB3ZSB3b3VsZCBuZWVkIHRvIGhhdmUgYm90aCBhCj4g
cGFnZSB0YWJsZSBwYWdlIEFORCBwdGRlc2MgYXQgYW55IHBvaW50LCBidXQgdGhhdCBtYXkgYmUg
YSBsYWNrIG9mIGtub3dsZWRnZQo+IGZyb20gbXkgcGFydC4KClNvcnJ5IGlmIEkgd2Fzbid0IGNs
ZWFyLCBieSAicGFnZSB0YWJsZSBwYWdlIiBJIG1lYW50IHRoZSBwYWdlIChvciBtZW1vcnkKZm9y
IHRoYXQgbWF0dGVyKSBmb3IgYWN0dWFsIHBhZ2UgdGFibGUgcmF0aGVyIHRoYW4gc3RydWN0IHBh
Z2UgZGVzY3JpYmluZwp0aGF0IG1lbW9yeS4KClNvIHdoYXQgd2UgYWxsb2NhdGUgaGVyZSBpcyB0
aGUgYWN0dWFsIG1lbW9yeSBmb3IgdGhlIHBhZ2UgdGFibGVzIGFuZCBub3QKdGhlIG1lbW9yeSBm
b3IgdGhlIG1ldGFkYXRhLiBUaGF0J3Mgd2h5IEkgdGhpbmsgdGhlIG5hbWUgcHRkZXNjX2FsbG9j
IGlzCmNvbmZ1c2luZy4KIAo+IEkgd2FzIHRoaW5raW5nIGxhdGVyLCBpZiBuZWNlc3NhcnksIHdl
IGNvdWxkIG1ha2UgYW5vdGhlciBmdW5jdGlvbgo+IChvbmx5IHRvIGJlIHVzZWQgaW50ZXJuYWxs
eSkgdG8gYWxsb2NhdGUgcGFnZSB0YWJsZSBwYWdlcy4KCi0tIApTaW5jZXJlbHkgeW91cnMsCk1p
a2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
