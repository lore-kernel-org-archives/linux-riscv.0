Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A76C83F17
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Jul 2025 18:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATHIDZkehsZPt21uHlhUTKSJSfiktXC6BWKYKvxIcxo=; b=B+Fy/BMfti01/v
	eta5W+QL2QqMw2a0M21ISAe7veUBpYnogHP5met9qyUrRr9B4BHGAFLQQjF0VFY0Rm8hKgz9GOntn
	GTADI2ft/t2EqPG4Qj6qRyLrS0MGRvH7CT9j6et6KafR3B56C9P4E3Vvk67trSjhIurOL6bFiZqhV
	0BcD98YQkkyqIJytrKb4QoLIbHfT0DRYG/cGVHvlILtM/GjAQkiM9dZr9mGaHzBW2zt17WZx1tfqw
	2RK477jQh0JXD5OqkDObtnSXA15vZhQwEwgEVVu9JPDtQLPEA21o1piB2Bmh7Bq8anMezgVuwFK8Z
	4CAnaWVMzfkr4h9d3MMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufjlb-0000000Bjs5-1Pmj;
	Sat, 26 Jul 2025 18:37:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufjlY-0000000Bjre-0vcM;
	Sat, 26 Jul 2025 18:37:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91AA2444F8;
	Sat, 26 Jul 2025 18:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C9FAC4CEED;
	Sat, 26 Jul 2025 18:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753555023;
	bh=wJaOsXIJfuq0ic1DGjE1tBK2mIUUuFDFBblMg6pSJPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B0gnxEDjlA/8MHvDPk4VLhu2+Ol9SzXH/UxlomcH7yoN9bI0tna6Wm9JxSwiwiDF8
	 Ssi19+Z+ANff19qOwCrrY+Zv/aiuI1kLASexs+XI3mjFBVPvmXYpDz0ZKtp2qfTD/5
	 4YSYIQujXv3aJvISuKe8LxNR+TF1JUMxqNRjy/nXlbhropw188cFGEjpn/vHx92NSQ
	 Is0WMdsWMF9hwmsH2BjA78MDj6ri60En9eywgjZaKohuzXuLhEyYQ4tbK6QZL+mUur
	 z0CEBgPf7zjlWtmQl86EvSSsopRu63VjpI/hHuXeTjni22P45/8vl0jJZffLkKP4n0
	 +Em7ZhTs4SrFw==
Date: Sat, 26 Jul 2025 11:37:01 -0700
From: Drew Fustini <fustini@kernel.org>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH] riscv: Add sysctl to control discard of vstate during
 syscall
Message-ID: <aIUgTTOcuNAJqZvg@x1>
References: <20250719033912.1313955-1-fustini@kernel.org>
 <cc82c938-def3-4df6-9fc9-fc321af7d54a@iscas.ac.cn>
 <DBL2588APTCA.2XUKQCJ0DW89C@ventanamicro.com>
 <feb3549f-da91-4eaa-a624-b9f35db6ba3c@iscas.ac.cn>
 <DBLCYPBLQBSQ.170ND7Z93GPK4@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DBLCYPBLQBSQ.170ND7Z93GPK4@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_113704_301397_51DA9128 
X-CRM114-Status: GOOD (  30.45  )
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

T24gRnJpLCBKdWwgMjUsIDIwMjUgYXQgMDg6NDc6MDRQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IDIwMjUtMDctMjVUMjM6MDE6MDMrMDg6MDAsIFZpdmlhbiBXYW5nIDx3YW5ncnVp
a2FuZ0Bpc2Nhcy5hYy5jbj46Cj4gPiBPbiA3LzI1LzI1IDE4OjE4LCBSYWRpbSBLcsSNbcOhxZkg
d3JvdGU6Cj4gPj4gMjAyNS0wNy0yNFQwNTo1NTo1NCswODowMCwgVml2aWFuIFdhbmcgPHdhbmdy
dWlrYW5nQGlzY2FzLmFjLmNuPjoKPiA+Pj4gT24gNy8xOS8yNSAxMTozOSwgRHJldyBGdXN0aW5p
IHdyb3RlOgo+ID4+Pj4gRnJvbTogRHJldyBGdXN0aW5pIDxkZnVzdGluaUB0ZW5zdG9ycmVudC5j
b20+Cj4gPj4+PiBDbG9iYmVyaW5nIHRoZSB2ZWN0b3IgcmVnaXN0ZXJzIGNhbiBzaWduaWZpY2Fu
dGx5IGluY3JlYXNlIHN5c3RlbSBjYWxsCj4gPj4+PiBsYXRlbmN5IGZvciBzb21lIGltcGxlbWVu
dGF0aW9ucy4gVG8gbWl0aWdhdGUgdGhpcyBwZXJmb3JtYW5jZSBpbXBhY3QsIGEKPiA+Pj4+IHBv
bGljeSBtZWNoYW5pc20gaXMgcHJvdmlkZWQgdG8gYWRtaW5pc3RyYXRvcnMsIGRpc3RybyBtYWlu
dGFpbmVycywgYW5kCj4gPj4+PiBkZXZlbG9wZXJzIHRvIGNvbnRyb2wgdmVjdG9yIHN0YXRlIGRp
c2NhcmQgaW4gdGhlIGZvcm0gb2YgYSBzeXNjdGwga25vYjoKPiA+Pj4gU28gSSBoYWQgYW4gaWRl
YTogSXMgaXQgcG9zc2libGUgdG8gYXZvaWQgcmVwZWF0ZWRseSBkaXNjYXJkaW5nIHRoZQo+ID4+
PiBzdGF0ZSBvbiBldmVyeSBzeXNjYWxsIGJ5IHNldHRpbmcgVlMgdG8gSW5pdGlhbCBhZnRlciBk
aXNjYXJkaW5nLCBhbmQKPiA+Pj4gYXZvaWRpbmcgZGlzY2FyZGluZyB3aGVuIFZTIGlzIEluaXRp
YWw/IFNvOgo+ID4+Pgo+ID4+PiBpZiAoVlMgPT0gQ2xlYW4gfHwgVlMgPT0gRGlydHkpIHsKPiA+
Pj4gwqAgwqAgY2xvYmJlcjsKPiA+Pj4gwqAgwqAgVlMgPSBJbml0aWFsOwo+ID4+PiB9Cj4gPj4+
Cj4gPj4+IFRoaXMgd291bGQgYXZvaWQgdGhpcyBwcm9ibGVtIHdpdGggc3lzY2FsbC1oZWF2eSB1
c2VyIHByb2dyYW1zIHdoaWxlCj4gPj4+IGFkZGluZyBtaW5pbXVtIG92ZXJoZWFkIGZvciBldmVy
eXRoaW5nIGVsc2UuCj4gPj4gSSB0aGluayB5b3VyIHByb3Bvc2FsIGltcHJvdmVzIHRoZSBleGlz
dGluZyBjb2RlLCBidXQgaWYgYSB1c2Vyc3BhY2UgaXMKPiA+PiB1c2luZyB2ZWN0b3JzLCBpdCdz
IGxpa2VseSBhbHNvIHJlc3RvcmluZyB0aGVtIGFmdGVyIGEgc3lzY2FsbCwgc28gdGhlCj4gPj4g
c3RhdGUgd291bGQgaW1tZWRpYXRlbHkgZ2V0IGRpcnR5LCBhbmQgdGhlIG5leHQgc3lzY2FsbCB3
b3VsZCBhZ2Fpbgo+ID4+IG5lZWRsZXNzbHkgY2xvYmJlciB2ZWN0b3IgcmVnaXN0ZXJzLgo+ID4K
PiA+IFdpdGhvdXQgYW55IGRhdGEgdG8gYmFjayBpdCB1cCwgSSB3b3VsZCBzYXkgdGhhdCBteSB1
bmRlcnN0YW5kaW5nIGlzCj4gPiB0aGF0IHRoaXMgc2hvdWxkIGJlIGEgcmFyZSBjYXNlLCBvbmx5
IGhhcHBlbmluZyBpZiBlLmcuIHNvbWVvbmUgaXMKPiA+IGFkZGluZyBwcmludGYgZGVidWdnaW5n
IHRvIHRoZWlyIHZlY3RvciBjb2RlLiBPdGhlcndpc2UsIHZlY3RvciBsb29wcwo+ID4gc2hvdWxk
IG5vdCBoYXZlIHN5c2NhbGxzIGluIHRoZW0uCj4gPgo+ID4gQSBtb3JlIHJlYXNvbmFibGUgd29y
cnkgd291bGQgYmUgcHJvZ3JhbXMgdXNpbmcgUlZWIGV2ZXJ5d2hlcmUgaW4gYWxsCj4gPiBzb3J0
cyBvZiBjb21tb24gb3BlcmF0aW9ucy4gSW4gdGhhdCBjYXNlLCBhbHRlcm5hdGluZyBzeXNjYWxs
cyBhbmQKPiA+IHZlY3RvcnMgd291bGQgbWFrZSB0aGUgZGlzY2FyZGluZyB3YXN0ZWZ1bC4KPiAK
PiBHb29kIHBvaW50LiAgWWVhaCwgYXV0by12ZWN0b3JpemF0aW9uIG1pZ2h0IGJlIGhpbmRlcmVk
LgoKWWVzLCBJIHRoaW5rIHRoYXQgdXNlcnNwYWNlIHZlY3RvciB1c2FnZSB3aWxsIGJlY29tZSBt
b3JlIGNvbW1vbiBvdmVyCnRpbWUgZXZlbiBmb3IgIm9yZGluYXJ5IiBwcm9ncmFtcyBhcyBjb21w
aWxlcnMgYW5kIGxpYnJhcmllcyBpbXByb3ZlLgpGb3IgZXhhbXBsZSwgaXQgbWF5IGJlIHRoZSBj
YXNlIHRoYXQgdGhlIG1ham9yaXR5IG9mIHVzZXJzcGFjZSBiaW5hcmllcwp3aWxsIHVzZSB2ZWN0
b3Igb25jZSB0aGUgaWZ1bmMgbWVtY3B5IHBhdGNoZXMgZ28gaW4uCgo+IEluIHRoZSB3b3JzdCBj
YXNlLCB1c2VycyBjb3VsZCBqdXN0IG5vdGljZSB0aGF0IGl0J3Mgc2xvd2luZyBwcm9ncmFtcwo+
IGRvd24sIGFuZCBkaXNhYmxlIGl0IHdpdGhvdXQgbG9va2luZyBmb3IgdGhlIGNhdXNlLgoKSSB0
aGluayB0aGF0IGEgZGVmYXVsdCBwb2xpY3kgb2Ygbm90IGNsb2JiZXJpbmcgaW4gc3lzY2FsbHMg
d291bGQgYmUgdGhlCmJlc3QgdHJhZGUgb2ZmLiBJIGdhdmUgQ09ORklHX1JJU0NWX0lTQV9WX1ZT
VEFURV9ESVNDQVJEIGEgZGVmYXVsdCBvZiBuCmluIHRoaXMgcGF0Y2gsIGFuZCBJIGltYWdpbmVk
IHRoYXQgcGVvcGxlIGxpa2UgUGFsbWVyLCB3aG8gd2FudGVkIGl0IGZvcgp0ZXN0IHN1aXRlcywg
Y291bGQgY2hhbmdlIHRoZSBkZWZhdWx0IG9yIHVzZSB0aGUgc3lzY3RsLgoKPiAKPiA+PiBQcmVz
ZXJ2aW5nIHRoZSB2ZWN0b3Igc3RhdGUgc3RpbGwgc2VlbXMgYmV0dGVyIGZvciB1c2Vyc3BhY2Vz
IHRoYXQgdXNlCj4gPj4gYm90aCB2ZWN0b3JzIGFuZCBzeXNjYWxscy4KPiA+Cj4gPiBJZiB3ZSBj
YW4gZXhwZWN0IGUuZy4gdXNlcnNwYWNlIHByb2dyYW1zIHRvIHByaW1hcmlseSByZXBlYXRlZGx5
IHVzZSBSVlYKPiA+IHdpdGggbm8gc3lzY2FsbHMgYmV0d2VlbiBsb29wcywgKm9yKiBwcmltYXJp
bHkgcmVwZWF0ZWRseSB1c2Ugc3lzY2FsbHMKPiA+IHdpdGggcmFyZSBvY2N1cnJlbmNlcyBvZiBS
VlYgYmV0d2VlbiBzeXNjYWxscy4gVGhpcyB3YXksIHRoZSBwcmltYXJpbHkKPiA+IHN5c2NhbGwg
cHJvZ3JhbXMgY2FuIGJlbmVmaXQgZnJvbSBzbGlnaHRseSBzd2l0Y2hpbmcsIHNpbmNlIHRoZXJl
J3Mgbm8KPiA+IG5lZWQgdG8gc2F2ZSBhbmQgcmVzdG9yZSBzdGF0ZSBmb3IgdGhvc2UgbW9zdCBv
ZiB0aGUgdGltZS4gSW4gZWZmZWN0LAo+ID4gc3lzY2FsbHMgc2VydmVzIGFzIGEgaGludCB0aGF0
IFJWViBpcyBvdmVyLgo+IAo+IFRoaXMgd291bGQgbmVlZCBkZWVwZXIgYW5hbHlzaXMsIGFuZCB3
ZSB3aWxsIHByb2JhYmx5IG5ldmVyIGJlIGNvcnJlY3QKPiB3aXRoIGEgc3lzdGVtLXdpZGUgcG9s
aWN5IHJlZ2FyZGxlc3MgLS0gYSByb29tIGZvciBwcmN0bD8KPiAKPiBJIHRoaW5rIHRoZXJlIG1p
Z2h0IGJlIGEgbG90IG9mIHByb2dyYW1zIHRoYXQgaGF2ZSBhIHJlcGVhdGluZyBwYXR0ZXJuCj4g
b2YgY29tcHV0ZSAtPiBzeXNjYWxsIChlLmcuIHRvIHdyaXRlIHJlc3VsdHMpLCBhbmQgY2xvYmJl
cmluZyBpcyBsb3NpbmcKPiBwZXJmb3JtYW5jZSBpZiBhIHByb2dyYW0gZG9lcyBtb3JlIHRoYW4g
YSBzaW5nbGUgbG9vcCBwZXIgc3dpdGNoLgoKSXQncyBpbnRlcmVzdGluZyB0aGF0IHlvdSBtZW50
aW9uIHByY3RsIGFzIGl0IGRvZXMgc2VlbSBsaWtlIHRoYXQgY291bGQKcGxheSBhIHJvbGUgaGVy
ZS4gSWYgcGVvcGxlIHRoaW5rIHRoYXQgb25lIHN5c2NhbGwgY2xvYmJlcmluZyBiZWhhdmlvcgpm
b3IgdGhlIHdob2xlIHN5c3RlbSBpcyB0b28gbGltaXRlZCwgdGhlbiBtYXliZSBwcmN0bCBjb3Vs
ZCBiZSBhIGJldHRlcgpzb2x1dGlvbi4gSSBiZWxpZXZlIGl0IHNob3VsZCBkZWZhdWx0IHRvIG5v
dCBjbG9iYmVyaW5nLiBJdCBjb3VsZCBiZQplbmFibGVkIGZvciB0ZXN0IHN1aXRlcyBpbiBDSSB0
aGF0IHdhbnQgdGhlIHN0cmljdCBjbG9iYmVyaW5nLCBvciBmb3IKcHJvZ3JhbXMgdGhhdCBhcmUg
a25vd24gdG8gd29yayBiZXR0ZXIgd2l0aCBjbG9iYmVyaW5nIGVuYWJsZWQuCgpUaGFua3MsCkRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
