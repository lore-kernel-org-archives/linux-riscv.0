Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07A9C87FCE
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Jul 2025 17:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mHc6LpQ+Q0EFDaIZoWUmPh76Wqz6+Vc/LMwboR7518=; b=UrzWf3rAoeAblJ
	iOTh77Tq2JkEaz4gscr/XwxHucRWD20grz002fFQEqc0FCuHI92RI62VmzyXJhMYBqXyvRAPEyDYJ
	dF6gNN6/Wc24J4wuCiTkeQbZHXxhV0Yc+m0c9D0K4jB4IUNy6dJobiV59WMmTT4+IeVMb8R+u3qpC
	fnCGXFc1+nF3eYPAxAlzQ2LRHguGIMa891TV1zy+AaX+1noBhi5WQXqNU4zk2BMNgGamzEL8KhCr6
	aCk26xy3TbDarcB79sv8l8fAjq6hLbbXaRZr7MbmVf7ZfaBH5BrjAkozZfyQ3Dm/tAHDM4WKDWHUx
	1gugSeEojBksTZ39k1Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug5Ba-0000000D0Kh-1DY2;
	Sun, 27 Jul 2025 17:29:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug5BY-0000000D0K4-2q6g;
	Sun, 27 Jul 2025 17:29:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DA00600AE;
	Sun, 27 Jul 2025 17:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02571C4CEEB;
	Sun, 27 Jul 2025 17:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753637358;
	bh=HTN6gl7pu5z8HFDM4isKWxC87ZsrT/bAEDgw4cKncOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dtJPnzaRHbvYrc+gyxZK0TrUxbhegr7FGGnZSqYgDtIjln7QeN7TiBPWFBJvDLpid
	 +monMCu6pmVhQK3lwpcSArNn6KpOFUGz2HqwUUkHZYWZ8H8C3AIsZ2SMwtue9KNSp/
	 +L6yiTBElJH9s+NytqeP1Xw4CTGSEclh4mXZ7vjegqw++ZO9ySi0lgQ+Z2p/fAJkku
	 NqHhM/ijyeccxFKg91dYYtWzyZ3dcA11FUL7zoLj6lBsC8ad2tAEcVNmq7yQXKCLID
	 FELKPBBgpsvWo8UJJM38HJFi5kk0SfYrF9s4e9tNRTo8sRrL49Qr2R5iFt6vxTVTOI
	 Vra/TrkcVyt6A==
Date: Sun, 27 Jul 2025 10:29:16 -0700
From: Drew Fustini <fustini@kernel.org>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
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
Message-ID: <aIZh7F+jY8CxpuCz@x1>
References: <20250719033912.1313955-1-fustini@kernel.org>
 <DBHQK4W9CL9F.1WM8JFVDQZ44F@ventanamicro.com>
 <aH6uPi+UOP6GzNjv@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aH6uPi+UOP6GzNjv@x1>
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

T24gTW9uLCBKdWwgMjEsIDIwMjUgYXQgMDI6MTY6NDZQTSAtMDcwMCwgRHJldyBGdXN0aW5pIHdy
b3RlOgo+IE9uIE1vbiwgSnVsIDIxLCAyMDI1IGF0IDAyOjM1OjM4UE0gKzAyMDAsIFJhZGltIEty
xI1tw6HFmSB3cm90ZToKPiA+IDIwMjUtMDctMThUMjA6Mzk6MTMtMDc6MDAsIERyZXcgRnVzdGlu
aSA8ZnVzdGluaUBrZXJuZWwub3JnPjoKPiA+ID4gRnJvbTogRHJldyBGdXN0aW5pIDxkZnVzdGlu
aUB0ZW5zdG9ycmVudC5jb20+Cj4gPiA+Cj4gPiA+IENsb2JiZXJpbmcgdGhlIHZlY3RvciByZWdp
c3RlcnMgY2FuIHNpZ25pZmljYW50bHkgaW5jcmVhc2Ugc3lzdGVtIGNhbGwKPiA+ID4gbGF0ZW5j
eSBmb3Igc29tZSBpbXBsZW1lbnRhdGlvbnMuIFRvIG1pdGlnYXRlIHRoaXMgcGVyZm9ybWFuY2Ug
aW1wYWN0LCBhCj4gPiA+IHBvbGljeSBtZWNoYW5pc20gaXMgcHJvdmlkZWQgdG8gYWRtaW5pc3Ry
YXRvcnMsIGRpc3RybyBtYWludGFpbmVycywgYW5kCj4gPiA+IGRldmVsb3BlcnMgdG8gY29udHJv
bCB2ZWN0b3Igc3RhdGUgZGlzY2FyZCBpbiB0aGUgZm9ybSBvZiBhIHN5c2N0bCBrbm9iOgo+ID4g
Pgo+ID4gPiAvcHJvYy9zeXMvYWJpL3Jpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQKPiA+ID4KPiA+ID4g
VmFsaWQgdmFsdWVzIGFyZToKPiA+ID4KPiA+ID4gMDogRG8gbm90IGRpc2NhcmQgdmVjdG9yIHN0
YXRlIGR1cmluZyBzeXNjYWxsCj4gPiA+IDE6IERpc2NhcmQgdmVjdG9yIHN0YXRlIGR1cmluZyBz
eXNjYWxsCj4gPiA+Cj4gPiA+IFRoZSBpbml0aWFsIHN0YXRlIGlzIGNvbnRyb2xsZWQgYnkgQ09O
RklHX1JJU0NWX0lTQV9WX1ZTVEFURV9ESVNDQVJELgo+ID4gCj4gPiBJIHRoaW5rIGl0IGlzIGEg
Yml0IG1vcmUgY29tcGxpY2F0ZWQgdG8gZG8gdGhpcyBuaWNlbHkuLi4KPiA+IFByb2dyYW1zIGRv
bid0IGhhdmUgdG8gc2F2ZS9yZXN0b3JlIHZlY3RvciByZWdpc3RlcnMgYXJvdW5kIHN5c2NhbGxz
Cj4gPiB3aGVuIGNvbXBpbGVkIGZvciByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkPTAsIHNvIHJ1bm5p
bmcgdW5kZXIKPiA+IHJpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQ9MSB3b3VsZCBicmVhayB0aGVtLgo+
IAo+IFRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4gWW91IHJhaXNlIGEgZ29vZCBwb2ludCB0aGF0
IHRoaXMgc3lzY3RsIGNhbgo+IGxlYWQgdG8gdGhlIGNhc2Ugd2hlcmUgYSBwcm9ncmFtIG1pZ2h0
IGJlIGNvbXBpbGVkIHRvIG5vdCBzYXZlL3Jlc3RvcmUKPiB2ZWN0b3IgcmVnaXN0ZXJzIGFyb3Vu
ZCBzeXNjYWxscy4gVGhhdCBzYW1lIHByb2dyYW0gd291bGQgbm90IHdvcmsKPiBjb3JyZWN0bHkg
aWYgdGhlIHN5c2FkbWluIGNoYW5nZXMgcmlzY3Zfdl92c3RhdGVfZGlzY2FyZCB0byAxLgo+IAo+
ID4gU2hvdWxkbid0IHdlIGhhdmUgYSB3YXkgdG8gcHJldmVudCByaXNjdl92X3ZzdGF0ZV9kaXNj
YXJkPTAgZXhlY3V0YWJsZQo+ID4gZnJvbSBydW5uaW5nIHdpdGggcmlzY3Zfdl92c3RhdGVfZGlz
Y2FyZD0xPwo+IAo+IFllcywgdGhpcyBkb2VzIG1ha2UgbWUgY29uY2VybmVkIHRoYXQgYSBwcm9n
cmFtIGNvdWxkIGNyYXNoIGFzIGEgcmVzdWx0Cj4gb2YgdGhpcyBzeXNjdGwgd2hpY2ggd291bGQg
YmUgY29uZnVzaW5nIGZvciB0aGUgdXNlciBhcyB0aGV5IG1heSBub3QKPiBldmVuIGJlIGF3YXJl
IG9mIHRoaXMgc3lzY3RsLiBJJ2xsIGhhdmUgdG8gdGhpbmsgbW9yZSBhYm91dCBob3cgc3VjaCBh
Cj4gcHJvdGVjdGlvbiBjb3VsZCB3b3JrLgoKQWZ0ZXIgZnVydGhlciBjb25zaWRlcmF0aW9uLCBJ
IHRoaW5rIHRoYXQgaXQgd291bGQgYmUgYXBwcm9wcmlhdGUgZm9yCnByb2dyYW1zIHRoYXQgZG9u
J3Qgc2F2ZS9yZXN0b3JlIHZlY3RvciByZWdpc3RlcnMgYXJvdW5kIHN5c2NhbGxzIHRvCmJyZWFr
IHdoZW4gcmlzY3Zfdl92c3RhdGVfZGlzY2FyZD0xLiBJIGJlbGlldmUgdGhlIHByaW1hcnkgbW90
aXZhdGlvbgpvZiB0aGUgb3JpZ2luYWwgY2hhbmdlIDIgeWVhcnMgYWdvIHdhcyB0byBjYXRjaCBw
cm9ncmFtcyB0aGF0IHJlbHkgb24KdGhlIHZlY3RvciBzdGF0ZSBiZWluZyByZXRhaW5lZCBhY3Jv
c3Mgc3lzY2FsbHMuIFRodXMsIEkgdGhpbmsgdGhhdCB0aGlzCmJlaGF2aW9yIHdvdWxkIGJlIGNv
bnNpc3RlbnQgd2l0aCB0aGF0LgoKQmpvcm4gdG9sZCBtZSBoZSBpcyBhd2F5IGF0IHRoZSBtb21l
bnQgYnV0IGhvcGVmdWxseSBoZSBjYW4gcHJvdmlkZSBoaXMKcGVyc3BlY3RpdmUgd2hlbiBoZSBp
cyBiYWNrLgoKVGhhbmtzLApEcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
