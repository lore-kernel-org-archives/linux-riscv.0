Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA57AFD0640
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 07:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=supB01+7c+Xy3jLa2IacI8cMYoLZRRaCxeHDJsgNRH0=; b=YJmTYi9H7v7n7u
	kMtEIjFgYgvLSaDWTKfNhGut8X0+fS7zyKj2GgnvKqFiwTdlPxLaWltNQwr+YRAE9BCDU3Kh6eS26
	b9GEcia6JAkwmodYuTI7LsVBcZz7ry53EsesxcRVZ3axCR3GC4UK4Inwz1VDKUhAxNJBdJK+mIpTn
	gxJEQ6u4M3Z+gRmOp29vQ/NY41OlH5mu6GQUslTyzII7SF64rCftjb3/yyeP2T9yXbaXuWF+3YjK5
	i0hfvcJ8jOemUKhntZUufMqic82PKc0F8D+Sj5Up6MsysB1ZivjcSSR28DQU0C8+dkNU26Q1sGjuJ
	9JnWGtatGCNDKeUOD+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DnC-0000000B334-2RbV;
	Wed, 11 Mar 2026 07:15:42 +0000
Received: from mail.bix.bg ([193.105.196.21])
	by bombadil.infradead.org with smtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Dn8-0000000B31L-2b0h
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 07:15:40 +0000
Received: (qmail 8542 invoked from network); 11 Mar 2026 07:08:54 -0000
Received: from d2.declera.com (HELO ?212.116.131.122?) (212.116.131.122)
  by indigo.declera.com with SMTP; 11 Mar 2026 07:08:54 -0000
Message-ID: <4ab8430161252ec778fabf7e9b68acf3645ed4c7.camel@declera.com>
Subject: Re: [PATCH v5 2/2] mfd: simple-mfd-i2c: add a reboot cell for the
 SpacemiT P1 chip
From: Yanko Kaneti <yaneti@declera.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Aurelien Jarno
	 <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, Sebastian
 Reichel	 <sre@kernel.org>, Yixun Lan <dlan@gentoo.org>, Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, "open list:RISC-V
 ARCHITECTURE:Keyword:riscv"	 <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support:Keyword:spacemit"	
 <spacemit@lists.linux.dev>, "open list:SYSTEM RESET/SHUTDOWN DRIVERS"	
 <linux-pm@vger.kernel.org>
Date: Wed, 11 Mar 2026 09:08:54 +0200
In-Reply-To: <DGZM6WUAVPPS.20Y0NIZYI4572@linux.spacemit.com>
References: <20251102230352.914421-1-aurelien@aurel32.net>
	 <20251102230352.914421-3-aurelien@aurel32.net>
	 <b51a62513daa9d2390031ec350e0b33bdb7e54aa.camel@declera.com>
	 <aaC78FTN31QYaVg0@aurel32.net>
	 <990bc03ed2baa05e619f0aa9cc6a23acadd66ea6.camel@declera.com>
	 <aaS6xeKFZz06fb1_@aurel32.net> <aaXuWwyA5NzBZzlW@aurel32.net>
	 <36f8df695463e5ff3eaaffbac357fc73026f7373.camel@declera.com>
	 <aadGw1fIlJyNNoum@aurel32.net>
	 <DGZM6WUAVPPS.20Y0NIZYI4572@linux.spacemit.com>
User-Agent: Evolution 3.59.3 (3.59.3-1.fc45) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_001538_986825_E23A3B43 
X-CRM114-Status: GOOD (  39.30  )
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

T24gV2VkLCAyMDI2LTAzLTExIGF0IDEwOjU4ICswODAwLCBUcm95IE1pdGNoZWxsIHdyb3RlOgo+
IE9uIFdlZCBNYXIgNCwgMjAyNiBhdCA0OjM4IEFNIENTVCwgQXVyZWxpZW4gSmFybm8gd3JvdGU6
Cj4gIEhpLCBBdXJlbGllbiBhbmQgWWFua28sCj4gPiBIaSwKPiA+IAo+ID4gT24gMjAyNi0wMy0w
MiAyMjozNCwgWWFua28gS2FuZXRpIHdyb3RlOgo+ID4gPiBIZWxsbywKPiA+ID4gCj4gPiA+IE9u
IE1vbiwgMjAyNi0wMy0wMiBhdCAyMTowOCArMDEwMCwgQXVyZWxpZW4gSmFybm8gd3JvdGU6Cj4g
PiA+ID4gT24gMjAyNi0wMy0wMSAyMzoxNiwgQXVyZWxpZW4gSmFybm8gd3JvdGU6Cj4gPiA+ID4g
PiBPbiAyMDI2LTAyLTI3IDEzOjI5LCBZYW5rbyBLYW5ldGkgd3JvdGU6Cj4gPiA+ID4gPiA+IE9u
IFRodSwgMjAyNi0wMi0yNiBhdCAyMjozMiArMDEwMCwgQXVyZWxpZW4gSmFybm8gd3JvdGU6Cj4g
PiA+ID4gPiA+ID4gSGksCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gT24gMjAyNi0wMi0y
NiAxNjozMiwgWWFua28gS2FuZXRpIHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gSGVsbG8sCj4gPiA+
ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IE9uIE1vbiwgMjAyNS0xMS0wMyBhdCAwMDowMiAr
MDEwMCwgQXVyZWxpZW4gSmFybm8gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+IEFkZCBhICJzcGFj
ZW1pdC1wMS1yZWJvb3QiIGNlbGwgZm9yIHRoZSBTcGFjZW1pVCBQMSBjaGlwLgo+ID4gPiA+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQXVyZWxpZW4gSmFybm8g
PGF1cmVsaWVuQGF1cmVsMzIubmV0Pgo+ID4gPiA+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4g
PiA+ID4gdjU6IG5vIGNoYW5nZXMKPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+
ICBkcml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5jIHwgMSArCj4gPiA+ID4gPiA+ID4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5jIGIvZHJp
dmVycy9tZmQvc2ltcGxlLW1mZC1pMmMuYwo+ID4gPiA+ID4gPiA+ID4gPiBpbmRleCAwYTYwN2Ex
ZTNjYTFkLi41NDJkMzc4Y2RjZDFmIDEwMDY0NAo+ID4gPiA+ID4gPiA+ID4gPiAtLS0gYS9kcml2
ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5jCj4gPiA+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMv
bWZkL3NpbXBsZS1tZmQtaTJjLmMKPiA+ID4gPiA+ID4gPiA+ID4gQEAgLTk5LDYgKzk5LDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnIHNwYWNlbWl0X3AxX3JlZ21hcF9jb25m
aWcgPSB7Cj4gPiA+ID4gPiA+ID4gPiA+ICB9Owo+ID4gPiA+ID4gPiA+ID4gPiAgCj4gPiA+ID4g
PiA+ID4gPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG1mZF9jZWxsIHNwYWNlbWl0X3AxX2NlbGxz
W10gPSB7Cj4gPiA+ID4gPiA+ID4gPiA+ICsJeyAubmFtZSA9ICJzcGFjZW1pdC1wMS1yZWJvb3Qi
LCB9LAo+ID4gPiA+ID4gPiA+ID4gPiAgCXsgLm5hbWUgPSAic3BhY2VtaXQtcDEtcmVndWxhdG9y
IiwgfSwKPiA+ID4gPiA+ID4gPiA+ID4gIAl7IC5uYW1lID0gInNwYWNlbWl0LXAxLXJ0YyIsIH0s
Cj4gPiA+ID4gPiA+ID4gPiA+ICB9Owo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBQ
ZXJoYXBzIGl0cyBzYWZlIHRvIG1lcmdlIHRoaXMgb25lIG5vdyB0aGF0IGV2ZXJ5dGhpbmcgUDEg
YW5kIEkyQyBpcwo+ID4gPiA+ID4gPiA+ID4gYWxyZWFkeSBpbiBsaW51cyB0aXAgPwo+ID4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFVuZm9ydHVuYXRlbHksIHRoaXMgcGF0Y2hzZXQgaXMgc3Rp
bGwgbWlzc2luZzoKPiA+ID4gPiA+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NjAyMDctYjQtazMtaTJjLXBpby12Ny0wLTYyNjk0MmQ5NGQ5MUBsaW51eC5zcGFjZW1pdC5jb20v
Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gVGhpcyBtZWFucyB0aGUgcmVib290cyB3b3Jr
IG1vc3Qgb2YgdGhlIHRpbWUsIGJ1dCBhcmUgbm90IDEwMCUgcmVsaWFibGUsIAo+ID4gPiA+ID4g
PiA+IGFuZCB0aGF0J3MgdGhlIHJlYXNvbiB3aHkgdGhpcyBwYXRjaCBnb3QgYmxvY2tlZCBmcm9t
IG1lcmdpbmcuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBJIHNlZS4gVGhhbmtzLiBTb3VuZHMg
dG8gbWUgbGlrZSBzb21ldGltZXMgd29ya2luZyBjb21wYXJlZCB0byBuZXZlcgo+ID4gPiA+ID4g
PiB3b3JraW5nIGlzIGJldHRlciAsIGJ1dCBhbnl3YXkuLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJ
IGFncmVlIHdpdGggdGhhdCwgYnV0IHRoZSBkZWNpc2lvbiB3YXMgdG8gaG9sZCBvbiB0aGlzIHBh
dGNoIHVudGlsIHRoZSAKPiA+ID4gPiA+IEkyQyBQSU8gcGFydCBnb3QgbWVyZ2VkLgo+ID4gPiA+
ID4gCj4gPiA+ID4gPiA+IEZXSVcgIHdpdGggdGhpcyBwYXRjaCBhbmQgdGhlIHBpbyBwYXRjaGVz
ZXQgSSBnZXQgdGhpcyByY3Ugc3BsYXQgb24KPiA+ID4gPiA+ID4gcmVib290ICh3aGljaCBpcyBz
dGlsbCB3b3JraW5nKS4gU2ltaWxhciBzcGxhdCBpcyB0aGVyZSB3aXRob3V0IHRoZSBwaW8KPiA+
ID4gPiA+ID4gcGF0Y2hlc2V0Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJIGhhdmVuJ3QgYmVlbiBh
YmxlIHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUgaGVyZSBhZnRlciAxMCsgcmVib290cyBvbiBhIAo+
ID4gPiA+ID4gQlBJLUYzIGJvYXJkLCBidXQgSSB0cmllZCB0aGUgcGF0Y2ggb24gdG9wIG9mIDYu
MTkuIEknbGwgdHJ5IHRvIGJ1aWxkIGEgCj4gPiA+ID4gPiA3LjAuMC1yYzIga2VybmVsIGFuZCBy
ZXBvcnQgYmFjay4KPiA+ID4gPiAKPiA+ID4gPiBJIGhhdmUgdHJpZWQgdGhhdCwgYW5kIEkgYW0g
c3RpbGwgdW5hYmxlIHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUgd2l0aCBhIAo+ID4gPiA+IDcuMC4w
LXJjMiBrZXJuZWwgYW5kIGEgQlBJLUYzIGJvYXJkLgo+ID4gPiAKPiA+ID4gSSBjYW4gc3RpbGwg
c2VlIGl0IG9uIGV2ZXJ5IHJlYm9vdCAod2l0aCB0aGUgcGF0Y2hlcyB0aGF0IGFsbG93IHJlYm9v
dAo+ID4gPiB0byB3b3JrKS4gRG8geW91IGhhdmUgQ09ORklHX1BSRUVNUFRfUkNVIGluIHlvdXIg
Y29uZmlnID8gaXRzIGRlZmF1bHQgb24KPiA+ID4gd2hlbiBhbnl0aGluZyBQUkVFTVBUIGlzIHNl
bGVjdGVkLiBJbiBGZWRvcmEgaXRzIENPTkZJR19QUkVFTVBUX0RZTkFNSUMKPiA+ID4gdGhhdCBm
bGlwcyBpdC4KPiA+IAo+ID4gVGhhbmtzIGZvciB0aGUgaGludCwgdGhhdCBvcHRpb24gd2FzIG5v
dCBhY3RpdmF0ZWQgaGVyZSwgaXQncyBub3QgdGhlIAo+ID4gcmlzY3Y2NCBkZWZjb25maWcuIFdp
dGggaXQgSSBhbSBhbHNvIGFibGUgdG8gcmVwcm9kdWNlIHRoZSBpc3N1ZS4gSSdsbCAKPiA+IHRy
eSB0byBkZWJ1ZyB0aGF0IGFuZCByZXBvcnQgYmFjay4KPiBJIGhhdmUgc2VudCBhIHBhdGNoIHRv
IGFkZHJlc3MgdGhpcyBpc3N1ZSBoZXJlWzFdLgo+IAo+IENvdWxkIHlvdSBwbGVhc2UgdGVzdCBp
dCBvbiB5b3VyIGhhcmR3YXJlIHdoZW4geW91IGhhdmUgYSBjaGFuY2U/Cj4gCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgLSBUcm95Cj4gCj4gTGluazoKPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvMjAyNjAzMTEtdjctMC1yYzEtcnYtZGlzLWludC1iZWZvcmUtcmVzdGFydC12MS0xLWJj
NDZiNDM1MWNhY0BsaW51eC5kZXYvIFsxXQoKVGhhbmtzIFRyb3kuwqBTZWVtIHRvIGZpeCB0aGUg
aXNzdWUgaGVyZS4KTm8gc3BsYXQgYW5kIHJlYm9vdCBzdGlsbCB3b3JrcyBPSyBvbiB0aGUgUjJT
CgotIFlhbmtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
