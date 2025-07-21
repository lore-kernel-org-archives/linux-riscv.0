Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E97EC83F25
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 21:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZfrhNT2w5ikpdJIjqeifumOqPzARpf1se+vdL+Y7Ebw=; b=sJPeFJsve2Zjf0
	Z+QHoiukWHZ7vKc2rsq5nPvtZawQXuf2OnfRO8a9NLNHBaeweJahutfrx21ES57r1Cc13kDbjL3FW
	3FxbZ3/uZQsO3rHY2EiCg/ByY5lkriBQTfnGZC0k+BNfvPmk8nXH2hEXL0BjbM6Ha/PjxDFelevFh
	bcfZRAy0S5mIF9Oux/OyWIi/kj0wlA7l0ggLUo/cywd+JO0Ss7qvz2VshK4l6/TlqZWFirh50b2Q0
	AW0vLwZzBbVlQ8sC640WQ9FVTAGo39k6CtAw2f/iDSVfCTJRaJ9kA2ZKZmOV62tQCqS7ffI5XEXJN
	E9Wii/eCvC7VR2Njy5nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxsR-00000000i4y-3TuJ;
	Mon, 21 Jul 2025 21:16:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udxsO-00000000i3e-45Vs;
	Mon, 21 Jul 2025 21:16:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF750A55D73;
	Mon, 21 Jul 2025 21:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA8CC4CEED;
	Mon, 21 Jul 2025 21:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753132607;
	bh=Arrd2Tnr6hB2VAwXYdZrPeTOnej/n8BAOWb1ZZMsJ68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NUv/rGm+/M5vJqzvp9P+qrlsQqpx1UCVsPkqrduq4ZD2MKd+nPnwB7/BMnxye15Ko
	 hosP/QO3bLXB1b3wFSRvDNAO5zGYbhufFY6lI77OLrvyA+Et5SF94dVQoOP40VpJJP
	 wg5AI6RHzsh8McaSVQBkWKCRyun/ojkNU+xLeUskmeAKt+gFkq9q2wm275eYEW/Muw
	 M08LoPxDvWOfVi1Wm2I/uWk0JUFrtjP+SKQJrIxLGLuunlh8RiEi0LIulJwqEyhb4a
	 yBKEq/UKjYt5LG00zrzpeW+i+bfq3AAl12XQ9XIzJMbRRFI4DkDC2PfKJyAvQEjwcT
	 Jl7Kwk2WjJp2A==
Date: Mon, 21 Jul 2025 14:16:46 -0700
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
Message-ID: <aH6uPi+UOP6GzNjv@x1>
References: <20250719033912.1313955-1-fustini@kernel.org>
 <DBHQK4W9CL9F.1WM8JFVDQZ44F@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DBHQK4W9CL9F.1WM8JFVDQZ44F@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_141649_140506_74E91753 
X-CRM114-Status: GOOD (  31.15  )
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

T24gTW9uLCBKdWwgMjEsIDIwMjUgYXQgMDI6MzU6MzhQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IDIwMjUtMDctMThUMjA6Mzk6MTMtMDc6MDAsIERyZXcgRnVzdGluaSA8ZnVzdGlu
aUBrZXJuZWwub3JnPjoKPiA+IEZyb206IERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlAdGVuc3RvcnJl
bnQuY29tPgo+ID4KPiA+IENsb2JiZXJpbmcgdGhlIHZlY3RvciByZWdpc3RlcnMgY2FuIHNpZ25p
ZmljYW50bHkgaW5jcmVhc2Ugc3lzdGVtIGNhbGwKPiA+IGxhdGVuY3kgZm9yIHNvbWUgaW1wbGVt
ZW50YXRpb25zLiBUbyBtaXRpZ2F0ZSB0aGlzIHBlcmZvcm1hbmNlIGltcGFjdCwgYQo+ID4gcG9s
aWN5IG1lY2hhbmlzbSBpcyBwcm92aWRlZCB0byBhZG1pbmlzdHJhdG9ycywgZGlzdHJvIG1haW50
YWluZXJzLCBhbmQKPiA+IGRldmVsb3BlcnMgdG8gY29udHJvbCB2ZWN0b3Igc3RhdGUgZGlzY2Fy
ZCBpbiB0aGUgZm9ybSBvZiBhIHN5c2N0bCBrbm9iOgo+ID4KPiA+IC9wcm9jL3N5cy9hYmkvcmlz
Y3Zfdl92c3RhdGVfZGlzY2FyZAo+ID4KPiA+IFZhbGlkIHZhbHVlcyBhcmU6Cj4gPgo+ID4gMDog
RG8gbm90IGRpc2NhcmQgdmVjdG9yIHN0YXRlIGR1cmluZyBzeXNjYWxsCj4gPiAxOiBEaXNjYXJk
IHZlY3RvciBzdGF0ZSBkdXJpbmcgc3lzY2FsbAo+ID4KPiA+IFRoZSBpbml0aWFsIHN0YXRlIGlz
IGNvbnRyb2xsZWQgYnkgQ09ORklHX1JJU0NWX0lTQV9WX1ZTVEFURV9ESVNDQVJELgo+IAo+IEkg
dGhpbmsgaXQgaXMgYSBiaXQgbW9yZSBjb21wbGljYXRlZCB0byBkbyB0aGlzIG5pY2VseS4uLgo+
IFByb2dyYW1zIGRvbid0IGhhdmUgdG8gc2F2ZS9yZXN0b3JlIHZlY3RvciByZWdpc3RlcnMgYXJv
dW5kIHN5c2NhbGxzCj4gd2hlbiBjb21waWxlZCBmb3IgcmlzY3Zfdl92c3RhdGVfZGlzY2FyZD0w
LCBzbyBydW5uaW5nIHVuZGVyCj4gcmlzY3Zfdl92c3RhdGVfZGlzY2FyZD0xIHdvdWxkIGJyZWFr
IHRoZW0uCgpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMuIFlvdSByYWlzZSBhIGdvb2QgcG9pbnQg
dGhhdCB0aGlzIHN5c2N0bCBjYW4KbGVhZCB0byB0aGUgY2FzZSB3aGVyZSBhIHByb2dyYW0gbWln
aHQgYmUgY29tcGlsZWQgdG8gbm90IHNhdmUvcmVzdG9yZQp2ZWN0b3IgcmVnaXN0ZXJzIGFyb3Vu
ZCBzeXNjYWxscy4gVGhhdCBzYW1lIHByb2dyYW0gd291bGQgbm90IHdvcmsKY29ycmVjdGx5IGlm
IHRoZSBzeXNhZG1pbiBjaGFuZ2VzIHJpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQgdG8gMS4KCj4gU2hv
dWxkbid0IHdlIGhhdmUgYSB3YXkgdG8gcHJldmVudCByaXNjdl92X3ZzdGF0ZV9kaXNjYXJkPTAg
ZXhlY3V0YWJsZQo+IGZyb20gcnVubmluZyB3aXRoIHJpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQ9MT8K
ClllcywgdGhpcyBkb2VzIG1ha2UgbWUgY29uY2VybmVkIHRoYXQgYSBwcm9ncmFtIGNvdWxkIGNy
YXNoIGFzIGEgcmVzdWx0Cm9mIHRoaXMgc3lzY3RsIHdoaWNoIHdvdWxkIGJlIGNvbmZ1c2luZyBm
b3IgdGhlIHVzZXIgYXMgdGhleSBtYXkgbm90CmV2ZW4gYmUgYXdhcmUgb2YgdGhpcyBzeXNjdGwu
IEknbGwgaGF2ZSB0byB0aGluayBtb3JlIGFib3V0IGhvdyBzdWNoIGEKcHJvdGVjdGlvbiBjb3Vs
ZCB3b3JrLgoKPiAKPiA+IEZpeGVzOiA5NjU3ZTliN2QyNTMgKCJyaXNjdjogRGlzY2FyZCB2ZWN0
b3Igc3RhdGUgb24gc3lzY2FsbHMiKQo+IAo+IFByb2dyYW1zIGNvbXBpbGVkIGZvciByaXNjdl92
X3ZzdGF0ZV9kaXNjYXJkPTEgYXJlIGNvbXBhdGlibGUgd2l0aCAwLCBzbwo+IEkgdGhpbmsgaXQg
d291bGQgYmUgc2ltcGxlc3QgdG8gcmV2ZXJ0IHRoYXQgcGF0Y2gsIGFuZCBwcmV0ZW5kZWQgaXQK
PiBuZXZlciBoYXBwZW5lZC4uLiAoVGhlIGlzc3VlcyB3aWxsIGV2ZW50dWFsbHkgZ28gYXdheS4p
CgpJIGFncmVlIHRoYXQgcmV2ZXJ0aW5nIHRoZSBleGlzdGluZyBkaXNjYXJkIGJlaGF2aW9yIHdv
dWxkIGJlIHRoZQpzaW1wbGVzdCBzb2x1dGlvbiB0byB0aGUgcGVmb3JtYW5jZSBpc3N1ZSBvYnNl
cnZlZCBvbiBzb21lCmltcGxlbWVudGF0aW9ucy4gSG93ZXZlciwgSSBiZWxpZXZlIHRoZXJlIGlz
IGFsc28gdGhlIGRlc2lyZSB0byBoYXZlIGEKd2F5IHRvIGVuZm9yY2Ugc3RyaWN0IGNsb2JiZXJp
bmcgYWNyb3NzIHN5c2NhbGxzIHRvIGNhdGNoIGFueSBpbmNvcnJlY3QKYmVoYXZpb3Igd2hpbGUg
dGVzdGluZy4gSSB3YXMgaG9waW5nIGEgc3lzY2FsbCBjb3VsZCBhbGxvdyBib3RoIHVzZQpjYXNl
cyB0byBiZSBoYW5kbGVkLCBidXQgeW91IHJhaXNlIGdvb2QgcG9pbnRzIGFib3V0IGNvbXBhdGli
aWxpdHkuCgo+IFNob3VsZG4ndCB0aGUgUklTQy1WIExpbnV4IHN5c2NhbGwgQUJJIGJlIGRlZmlu
ZWQgc29tZXdoZXJlPwo+IEhvdyBjb21lIHdlIGNvdWxkIGhhdmUgYnJva2VuIGl0IHdpdGggOTY1
N2U5YjdkMjUzPwoKSSBtYXkgaGF2ZSBiZWVuIHdyb25nIHRvIHVzZSBhIEZpeGVzIHRhZyBmb3Ig
OTY1N2U5YjdkMjUzLiBJIHdhcyB0cnlpbmcKdG8gaGlnaGxpZ2h0IHRoZSBvcmlnaW5hbCBkaXNj
dXNzaW9uIHRoYXQgSSB3YXMgdHJ5aW5nIHRvIGFkZHJlc3Mgd2l0aAp0aGlzIHN5c2N0bCBwYXRj
aC4KCj4gCj4gVGhhbmtzLgo+IAo+IC0tLQo+IEkgZG9uJ3QgdGhpbmsgaXQgbWFrZXMgbXVjaCBz
ZW5zZSB0byBjbG9iYmVyIHZlY3RvciByZWdpc3RlcnMgb24gYQo+IHN5c2NhbGwgLS0gYSBrZXJu
ZWwgbWlnaHQgbm90IGV2ZW4gdG91Y2ggdmVjdG9yIHJlZ2lzdGVycywgc28gdGhleSBhcmUKPiBl
ZmZvcmxlc3NseSBwcmVzZXJ2ZWQgaW4gdGhhdCBjYXNlLgo+IElmIGtlcm5lbCBuZWVkcyB0byB1
c2UgdmVjdG9yIHJlZ2lzdGVycyBpbiB0aGUgc3lzY2FsbCwgdGhlbiB0aGUga2VybmVsCj4gbmVl
ZHMgdG8gcHJldmVudCBhbnkgcmVnaXN0ZXIgbGVha3MgdG8gdXNlcnNwYWNlIGFueXdheSBieSBy
ZXN0b3JpbmcKPiBzb21lIHN0YXRlIGludG8gdGhlbSAtLSBhbmQgd2h5IG5vdCByZXN0b3JlIHRo
ZSBvcmlnaW5hbCBvbmU/Cj4gCj4gSSB0aGluayB0aGF0IG1haW4gcG9pbnQgb2YgY2xvYmJlcmlu
ZyB3b3VsZCBiZSB0byBvcHRpbWl6ZQo+IGNvbnRleHQtc3dpdGNoZXMgYWZ0ZXIgdGhlIHVzZXJz
cGFjZSBpcyBub3QgdXNpbmcgdmVjdG9yIHJlZ2lzdGVycwo+IGFueW1vcmUsIGJ1dCBpdCdzIHRl
cnJpYmx5IGluZWZmaWNpZW50IGlmIHRoZSByYXRpbyBvZiBzeXNjYWxscyB0bwo+IGNvbnRleHQg
c3dpdGNoZXMgaXMgaGlnaC4KPiBMaW51eCBjYW4gYWxzbyB0cnkgdG8gZGV0ZWN0IHRoZSBzaXR1
YXRpb24sIGFuZCB0dXJuIHRvIGxhenkgdmVjdG9yCj4gY29udGV4dC1zd2l0Y2gsIHdpdGggc3N0
YXR1cy5WUz1vZmYsIGluc3RlYWQgb2YgZWFnZXJseSByZXN0b3JpbmcKPiBjbG9iYmVyZWQgc3Rh
dGUuCj4gKEEgZ29vZCBpbmRpY2F0b3IgbWlnaHQgYmUgdGhhdCB0aGUgdXNlcnNwYWNlIGhhc24n
dCBkaXJ0aWVkIHRoZSB2ZWN0b3JzCj4gIHNpbmNlIHRoZSBsYXN0IGNvbnRleHQtc3dpdGNoIC0t
IGtlcm5lbCBkaWRuJ3QgbmVlZCB0byBzYXZlIHRoZSBzdGF0ZSwKPiAgc28gaXQgd2lsbCByZXN0
b3JlIGxhemlseS4pCgpJIHRoaW5rIHRoaXMgaXMgYW4gaW50ZXJlc3RpbmcgZGlzY3Vzc2lvbiB0
byBoYXZlLiBJIHdhcyBob3BpbmcgdGhpcwpwYXRjaCB3b3VsZCBnZXQgcGVvcGxlIGRpc2N1c3Np
bmcgaWYgbWFuZGF0b3J5IHZlY3RvciBzdGF0ZSBjbG9iZXJyaW5nCmlzIHJlYWxseSBzb21ldGhp
bmcgdGhhdCBzaG91bGQgYmUgZG8gaW4gc3lzY2FsbHMuCgpUaGFua3MsCkRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
