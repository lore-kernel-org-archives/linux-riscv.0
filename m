Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50046CA0EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Aug 2025 19:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+pdNrg/GJSx0eMHe9RPROhpzXmIo5s9lnjI+TIpaJA=; b=zNM+OI7RxiIW1U
	0yVJiPw2PGoOxA/GK7RYW3BmSQn7V60MB+bAHGLkAyEkTykVy4nspeGbLa3x29EMf20oeeKW48272
	FWvBaVZCXBJBL8nioHOie6Y7VywVFneNlmzpYUZEVEwshGpwZbs0Z/+UkPwjlZBHdG1/lZe9dHGRK
	hDIfCJVzl+9OxQvYeVyQcm0mza1LaPSLu/qzLNxMQ0lN7Jcgi6OeuiOO2RuueoHF6Lh7MpxkNlqUc
	uElZTbJL34lMEQ29b7B1aAav/pGgekFsYFUZ08FiDhSpDjwQZrUXsW8MsIkvwGybvd3oeONMKyGsZ
	R1jcWy3di8tcgpuJ8h+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulubc-0000000BoQh-21OI;
	Tue, 12 Aug 2025 19:24:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrnO-0000000BOxL-0yYj
	for linux-riscv@lists.infradead.org;
	Tue, 12 Aug 2025 16:24:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AB4DD60052;
	Tue, 12 Aug 2025 16:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E94C4CEF0;
	Tue, 12 Aug 2025 16:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755015857;
	bh=30o4U4tFe32XjiNz5Xqo8vYYR40fKkKwC8cxKxV1ldA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YFQjCpvXvmuacmrZpk3++l3tgWJKfZp7c8w8aiWkYwkC668QD+n2jTqaJ+WTySpEB
	 0CbOP2Hae2Oblck1IaZGYo3urSxA5DUxKbTkyvaVbPIv2Z0u+vxQbnnxqePAk2sLc+
	 LAJpLiC6o/7K8d2m058b5PZ8ld+nNAcb1cnzL2UVbdnO0kICxaHuPCvK7DfbDmtBLW
	 MgAOMmgnVAV7Z9LxsJETuxHKtKinze/1gWW1FLhOVK8fTWIbjzGPdRCXtiKA0Yxl/j
	 cBVkzpL7l3m11RYSVECb4JkI8aYgAAtTX4gzoW08HwUDOHkUC/Eg0IuN6f2eAeYmph
	 O3JQr1YZlmnTA==
Date: Tue, 12 Aug 2025 09:24:15 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] clk: thead: Misc changes to TH1520 clock driver
Message-ID: <aJtqrz9y4/hR8fEu@x1>
References: <20250812054258.1968351-1-uwu@icenowy.me>
 <50a61990b5009217dcc0ed74142c4ffeba137f73.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50a61990b5009217dcc0ed74142c4ffeba137f73.camel@icenowy.me>
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

T24gVHVlLCBBdWcgMTIsIDIwMjUgYXQgMDk6NDI6MjNQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyNS0wOC0xMuaYn+acn+S6jOeahCAxMzo0MiArMDgwMO+8jEljZW5vd3kg
WmhlbmflhpnpgZPvvJoKPiA+IFRoaXMgcGF0Y2hzZXQgaXMgbXkgY2hhbmdlcyB0byB0aGUgVEgx
NTIwIGNsb2NrIGRyaXZlciwgbWFpbmx5IGZvcgo+ID4gc3VwcG9ydGluZyB0aGUgZGlzcGxheSBj
b250cm9sbGVyICh0aGUgZmlyc3QgMykuCj4gPiAKPiA+IFRoZSBmaXJzdCB0d28gYXJlIGZ1bmN0
aW9uYWxpdHkgYWRkaXRpb25zLCB3aXRoIHRoZSBmaXJzdCBvbmUgYWRkaW5nCj4gPiBzdXBwb3J0
IGZvciBlbmFibGluZy9kaXNhYmxpbmcgUExMcyAoZm9yIERQVSBQTEwpIGFuZCB0aGUgc2Vjb25k
IG9uZQo+ID4gYWRkaW5nIHN1cHBvcnQgZm9yIGNoYW5naW5nIERQVSBkaXZpZGVycy4KPiA+IAo+
ID4gVGhlIDNyZCBvbmUgaXMgdG8gYWRkcmVzcyBoYW5nIGlzc3VlcyBtZXQgd2hlbiB0ZXN0aW5n
IHRoZSBEUFUgZHJpdmVyCj4gPiB3L28gY2xrX2lnbm9yZV91bnVzZWQgY29tbWFuZCBsaW5lIG9w
dGlvbi4KPiA+IAo+ID4gVGhlIDR0aCBvbmUgaGFzIG5vIHJlbGF0aW9uc2hpcCB0byBkaXNwbGF5
LCBhbmQgb25seSBleGlzdHMgZm9yIG15Cj4gPiBuZWVkCj4gPiB0byBjaGFuZ2UgYW4gYXJiaXRy
YXJ5IEdQSU8gKHdlbGwsIEdQSU8zXzMsIHRoZSBvbmUgY29udHJvbGxpbmcgdGhlCj4gPiBmYW4K
PiA+IG9uIExpY2hlZSBQaSA0QSkgd2l0aCBncGlvc2V0Lgo+ID4gCj4gPiBUaGlzIHBhdGNoc2V0
IGhhcyBhIGRlcGVuZGVuY3kgKGEgMHRoIG9uZSkgWzFdLgo+ID4gCj4gPiBbMV0KPiA+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwODA5LWZpeF9jbG9ja3NfdGhlYWRf
YXVnXzktdjEtMS0yOTljMzNkN2E1OTNAc2Ftc3VuZy5jb20vCj4gPiAKPiAKPiBPb3BzLCBsb29r
cyBsaWtlIHRoaXMgcGF0Y2hzZXQgZGVzZXJ2ZXMgYSBuZXcgcmV2aXNpb24gbm93Li4uCgpUaGFu
a3MsIHRoYXQgZG9lcyBtYWtlIGl0IGVhc2llciB0byBhcHBseSB3aXRoICdiNCBzaGF6YW0nLgoK
PiBQQVRDSCAyLzQgaGFzIGEgcm91bmRfcmF0ZSgpIGltcGxlbWVudGF0aW9uLCB3aGljaCBpcyBj
b25zaWRlcmVkIG91dC0KPiBvZi1kYXRlIGFuZCBkZXRlcm1pbmVfcmF0ZSgpIHdpbGwgcmVwbGFj
ZSBpdC4KCkkgc2F3IHlvdXIgcmVwbHkgb3ZlciBpbiB0aGUgYmlnIHBhdGNoc2V0IGZyb20gQnJp
YW4gTWFzbmV5LiBUaGF0J3MgZ29vZAp0aGF0IHdlIHdpbGwgYmUgYWJsZSB0byBza2lwIGFkZGlu
ZyByb3VuZF9yYXRlKCkgdG8gdGhlIGRyaXZlci4KCj4gUEFUQ0ggMy80IHdhcyBicm9rZW4gZHVy
aW5nIHJlYmFzaW5nLgo+IAo+IFBBVENIIDQvNCBpcyBmb3VuZCB0byBiZSBub3Qgd29ya2luZyAo
YW5kIGV2ZW4gbWFrZXMgcGFkY3RybDAgYW4gb3JwaGFuCj4gY2xvY2spLiBZYW8gWmkgdG9sZCBt
ZSB0aGF0IEkgbmVlZCB0byBmaXJzdCBkbyBzb21lIGNoYW5nZXMgdG8gY2N1X2dhdGUKPiBjb2Rl
LgoKSXMgdGhlcmUgYSB3YXkgdG8gdGVzdCB0aGUgZnVuY3Rpb25hbGl0eSB3aXRob3V0IGFkZGl0
aW9uYWwgcGF0Y2hlcyBmcm9tCnlvdXIgYnJhbmNoPwoKSSBsb29rIGZvcndhcmQgdG8gdjIuIFRo
YW5rcyBmb3Igd29ya2luZyBvbiB0aGUgZGlzcGxheS4gCgotRHJldwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
