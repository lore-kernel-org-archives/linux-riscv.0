Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B026C624D6
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 13:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6V5kXPTqTCQdYCzDxedUmr+ItuuXTBsRhOYd58zh5c=; b=fMp7iocBMi5BlG
	8qvjLXN6xWlLoRlnv/7ZlG3lhTjoMWzOesjQRf2//nVphrC1M5HLFa1n9P5Ki+j8TN2oJ0wLhZZ1b
	YghoiMyOdnTo85aDU0nOF4swqdOQVQZEsZ1mHBGAl1FfF4egAUqEC00GVV2dULUTzxycZmKUYAbCB
	FJQdhMKhmIWo91EPqbpjlIIUDJh4W/DeokyZsyv2S8sCKpJWCMEKChXzPLBIdOj4hoP0Eh9C3Syu9
	zLiwn13AouiXEx/zPdJwVmX//kYu3jeDbbBk5dQG4IPJmsLmacVIop6mIjJwo4NhGQ5EkDaV+NgHW
	8N5iXh9AkHOETp0uMnwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lEw-0000000Epyf-02Oi;
	Wed, 02 Sep 2026 13:42:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lEu-0000000EpyT-0pB3
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 13:42:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8462843B21;
	Wed,  2 Sep 2026 13:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7843C1F00A3F;
	Wed,  2 Sep 2026 13:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788356575;
	bh=qhAEz77Y2kZ1jZ+VILUhus+BJGUXN2LMY1ixFi2XZHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IbnRy+qBeV/o5vIsvzltys0xmFQ+2EOsgmvL/OsE6rAhpziJhvHXVb+YAAttbvzwj
	 7j5k5CvFbSNpW6oj6nO9yeIXIUTa8LLtPgqiWImU+W9307XnaADrwZgoGmvYPqcK16
	 HqgwxzO/N+GwvjTGmjfTtJAr3fw/ExygS0DSWxlL0PEELwaNLTOor73xtveXYYbWRY
	 gNIGaeb6gaZ4k2pljjeTrik6Jy0IGFQkegPbRp0J8epAB+Icu+s4WfwbN31rF5Bnyf
	 BdUTuoSxzyHs+/ZdFPoTpyysUZYuiSudwxLRpUtVXY/vmx+IZMAj/485sCT6pNYizH
	 fJq2J2O6mzp9w==
Date: Wed, 2 Sep 2026 15:42:41 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: spacemit@lists.linux.dev, Alex Elder <elder@riscstar.com>, 
	Bruno Banelli <bbanelli@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczynski <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [BUG] PCI: spacemit-k1: port C probe hard-hangs a CPU with one
 endpoint on Milk-V Jupiter
Message-ID: <c24pt2ls62rxxg77xjbng7dmiflgdjlqd3mkoxehc2rvjgh7ai@dcxvmau3ykmt>
References: <20260825052249.66921-1-bbanelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260825052249.66921-1-bbanelli@gmail.com>
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

T24gVHVlLCBBdWcgMjUsIDIwMjYgYXQgMDc6MjI6NDlBTSArMDIwMCwgQnJ1bm8gQmFuZWxsaSB3
cm90ZToKPiBIaSwKPiAKPiBPbiBhIE1pbGstViBKdXBpdGVyLCBwcm9iaW5nIHRoZSBQQ0llIGNv
bnRyb2xsZXIgYXQgY2E4MDAwMDAgKHBvcnQgQywgdGhlCj4gY2FyZCBzbG90KSBwZXJtYW5lbnRs
eSB3ZWRnZXMgdGhlIENQVSB0aGF0IHJ1bnMgdGhlIHByb2JlIHdoZW4gb25lCj4gcGFydGljdWxh
ciBhZGQtaW4gY2FyZCBpcyBpbnN0YWxsZWQuICBUaGUgQ1BVIHN0b3BzIHJlc3BvbmRpbmcgdG8g
Tk1JLCBhbmQKPiBiZWNhdXNlIHRoZSBwcm9iZSBpcyBhc3luY2hyb25vdXMsIGtlcm5lbF9pbml0
KCkgdGhlbiBibG9ja3MgZm9yZXZlciBpbgo+IGFzeW5jX3N5bmNocm9uaXplX2Z1bGwoKSBhbmQg
dGhlIG1hY2hpbmUgbmV2ZXIgZmluaXNoZXMgYm9vdGluZy4KPiAKPiBUaGUgc2FtZSBjYXJkLCBp
biB0aGUgc2FtZSBzbG90LCBvbiB0aGUgc2FtZSBib2FyZCwgZG9lcyAqbm90KiBoYW5nIHRoZQo+
IHZlbmRvciA2LjYga2VybmVsIC0tIGl0IHJlcG9ydHMgIlBoeSBsaW5rIG5ldmVyIGNhbWUgdXAi
IGFuZCBib290cyBub3JtYWxseS4KPiBTaXggb3RoZXIgY2FyZHMgZG8gbm90IGhhbmcgbWFpbmxp
bmUgZWl0aGVyLiAgU28gd2hhdGV2ZXIgdGhlIGVsZWN0cmljYWwKPiBjYXVzZSwgdGhpcyBsb29r
cyBsaWtlIGEgcm9idXN0bmVzcyBwcm9ibGVtIGluIHBjaWUtc3BhY2VtaXQtazE6IGFuIGVuZHBv
aW50Cj4gc2hvdWxkIG5vdCBiZSBhYmxlIHRvIGhhbmcgYSBob3N0LXNpZGUgREJJIHJlZ2lzdGVy
IGFjY2Vzcy4KPiAKPiAKPiBIQVJEV0FSRQo+IC0tLS0tLS0tCj4gICBNaWxrLVYgSnVwaXRlciB2
MS4xLCBTcGFjZW1pVCBNMSAoc29jaW5mbzogQ1BVW00xLTg1NzFdIFJFVltDXSBEUk9bMTMwXSks
Cj4gICAxNiBHaUIgTFBERFI0WC4KPiAgIEZpcm13YXJlOiBzdG9jayB2ZW5kb3IgVS1Cb290IDIw
MjIuMTAgKGsxLWJsLXYyLjIuOSksIHVubW9kaWZpZWQuCj4gICBQb3J0IEIgKGNhNDAwMDAwLCBN
LjIpIGhhcyBhIFNhbXN1bmcgUE05QjEgTlZNZSBhbmQgd29ya3MgdGhyb3VnaG91dC4KPiAgIFBv
cnQgQyAoY2E4MDAwMDApIGlzIHRoZSBjYXJkIHNsb3QgLS0gYW4geDgtbGVuZ3RoIGNvbm5lY3Rv
ciwgc2lsa3NjcmVlbmVkCj4gICBQQ0lFX1gyLCB3aXJlZCB4Mi4KPiAKPiAKPiBSRVBST0RVQ0VE
IE9OCj4gLS0tLS0tLS0tLS0tLQo+ICAgdjcuMSBhbmQgdjcuMiwgcmlzY3YgZGVmY29uZmlnIChw
bHVzIFBIWV9TUEFDRU1JVF9LMV9VU0IyLCBVU0JfRFdDMywKPiAgIFNQQUNFTUlUX0sxX1RTRU5T
T1IsIElHQiwgSUdDLCBOVk1lL2V4dDQgYnVpbHQgaW4pLgo+ICAgZ2NjIDEzLjMuMCAoY3Jvc3Mp
IGFuZCBnY2MgMTYuMi4wIChuYXRpdmUsIERlYmlhbiBzaWQpLgo+ICAgSWRlbnRpY2FsIGZhaWx1
cmUgaW4gYWxsIGNvbWJpbmF0aW9ucy4gIE5vdCBhIHJlZ3Jlc3Npb24gLS0gcG9ydCBDIGhhcwo+
ICAgbmV2ZXIgd29ya2VkIHdpdGggdGhpcyBjYXJkIG9uIG1haW5saW5lLgo+IAo+IENvbW1hbmQg
bGluZToKPiAgIGNvbnNvbGU9dHR5UzAsMTE1MjAwIGVhcmx5Y29uIHJvb3Q9L2Rldi9udm1lMG4x
cDIgcm9vdHdhaXQgcncKPiAgIHN3aW90bGI9NjU1MzYgY2xrX2lnbm9yZV91bnVzZWQgcGRfaWdu
b3JlX3VudXNlZAo+IAo+IAo+IFNZTVBUT00KPiAtLS0tLS0tCj4gUG9ydCBDIHByaW50cyBpdHMg
YWRkcmVzcyByYW5nZXMgYW5kIHRoZW4gbmV2ZXIgc3BlYWtzIGFnYWluLiAgKExvZyBiZWxvdyBp
cwo+IGZyb20gYSBydW4gd2l0aCBwb3J0IEIgZGlzYWJsZWQgaW4gRFQsIHNvIG5vdGhpbmcgaXMg
aW50ZXJsZWF2ZWQuKQo+IAo+ICAgWyAxLjI5MDA3NF0gc3BhY2VtaXQtazEtcGNpZSBjYTgwMDAw
MC5wY2llOiBob3N0IGJyaWRnZSAvc29jL3BjaWUtYnVzL3BjaWVAY2E4MDAwMDAgcmFuZ2VzOgo+
ICAgWyAxLjI5NzI4M10gc3BhY2VtaXQtazEtcGNpZSBjYTgwMDAwMC5wY2llOiAgICAgICBJTyAw
eDAwYjcwMDIwMDAuLjB4MDBiNzEwMWZmZiAtPiAweDAwMDAwMDAwMDAKPiAgIFsgMS4zMTI3ODNd
IHNwYWNlbWl0LWsxLXBjaWUgY2E4MDAwMDAucGNpZTogICAgICBNRU0gMHgwMGEwMDAwMDAwLi4w
eDAwYWZmZmZmZmYgLT4gMHgwMGEwMDAwMDAwCj4gICBbIDEuMzI2NzUzXSBzcGFjZW1pdC1rMS1w
Y2llIGNhODAwMDAwLnBjaWU6ICAgICAgTUVNIDB4MDBiMDAwMDAwMC4uMHgwMGI2ZmZmZmZmIC0+
IDB4MDBiMDAwMDAwMAo+ICAgWzIyLjM0ODQ5MF0gcmN1OiBJTkZPOiByY3Vfc2NoZWQgZGV0ZWN0
ZWQgc3RhbGxzIG9uIENQVXMvdGFza3M6Cj4gICBbMjIuMzUxNzY0XSByY3U6ICAgICA0LS4uLjA6
ICgxMiBHUHMgYmVoaW5kKSBpZGxlPTA1MWMvMS8weDQwMDAwMDAwMDAwMDAwMDAgc29mdGlycT00
My80MyBmcXM9MTkwOAo+ICAgWzIyLjM2NzA0MF0gU2VuZGluZyBOTUkgZnJvbSBDUFUgMiB0byBD
UFVzIDQ6Cj4gICBbMzIuMzY3MDQ5XSBBZnRlciAxMCBzZWNvbmRzLCB0aGVzZSBDUFVTIHN0aWxs
IGhhdmVuJ3QgcmVzcG9uZGVkIHRvIHRoZSBOTUk6IDQKPiAKPiBUaGUgQ1BVIGlnbm9yaW5nIGFu
IE5NSSBmb3IgdGVuIHNlY29uZHMgaXMgd2h5IEkgcmVhZCB0aGlzIGFzIGFuIE1NSU8gYWNjZXNz
Cj4gdGhhdCBuZXZlciByZWNlaXZlcyBhIGNvbXBsZXRpb24gcmF0aGVyIHRoYW4gYSBzcGluIG9y
IGEgZGVhZGxvY2suCj4gCj4gCj4gTE9DQUxJU0FUSU9OCj4gLS0tLS0tLS0tLS0tCj4gSSBhZGRl
ZCBhIGRldl9pbmZvKCkgYmVmb3JlIGVhY2ggc3RlcCBvZiBrMV9wY2llX2luaXQoKSAocGF0Y2gg
YXQgdGhlIGVuZCBvZgo+IHRoaXMgbWFpbCkuICBUaGUgbGFzdCBtYXJrZXIgcG9ydCBDIHByaW50
cyBpcyB0aGUgb25lIGltbWVkaWF0ZWx5IGJlZm9yZSB0aGUKPiBmaXJzdCBEQkkgYWNjZXNzOgo+
IAo+ICAgWzEuMzQ3MDUwXSBzcGFjZW1pdC1rMS1wY2llIGNhODAwMDAwLnBjaWU6IEsxREJHIDEg
dG9nZ2xlX3NvZnRfcmVzZXQKPiAgIFsxLjM2MjYzNV0gc3BhY2VtaXQtazEtcGNpZSBjYTgwMDAw
MC5wY2llOiBLMURCRyAyIGVuYWJsZV9yZXNvdXJjZXMKPiAgIFsxLjM3MDkxOF0gc3BhY2VtaXQt
azEtcGNpZSBjYTgwMDAwMC5wY2llOiBLMURCRyAzIGZpcnN0IERCSSB3cml0ZSAodmVuZG9yL2Rl
dmljZSBJRCkKPiAgIDxub3RoaW5nIGZ1cnRoZXI+CgpTb3VuZHMgd2VpcmQgdGhhdCBhbiBlbmRw
b2ludCBpcyBjYXVzaW5nIERCSSB3cml0ZSBoYW5nLgoKQ2FuIEFsZXggb3Igc29tZW9uZSBmcm9t
IFNwYWNlbWl0IGxvb2sgaW50byB0aGlzIGlzc3VlPwoKLSBNYW5pCgotLSAK4K6u4K6j4K6/4K61
4K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCuv+CuteCuruCvjQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
