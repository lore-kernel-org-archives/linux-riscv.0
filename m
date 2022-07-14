Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DB2C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lhr6OIqTcbUE4XUGdCCAPc/MB0FZP5Jw8Qk6JgGCy5s=; b=Ej54kzaqeCE2K4
	1pFqYjsxATsI6L7isCfIwIaoWTdi1mnMFf2h2UKRmVrKEKqQOUHfC8tue2Pb4DdgKR+sauCHdFGBj
	/gjimIo9nyvGZaIb8aIXwhyU5Y+paTuxLHa45pCd38tIS30ISIpVXKBmp88qNJZu0JzouxNBIsmDH
	1ymhVin11a0DHU7R8QzJpYBF1nN1cO48PV7WBM+EZaQwJO7ruKneqRR2BuHTXbGDPnCiHr6WZ5Kxe
	0ue36vc+iJMPUi/XhiSxl+H8U+plyvEeleB5Ysn5hbgkdP82jqf3gqbOl/rVE6lm3NgU8LrYyGDzm
	r7CFoHjgQ7h/NSqQa1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBvQZ-00D1RC-8W; Thu, 14 Jul 2022 09:46:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBvQV-00D1NR-Db
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 09:46:33 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oBvQL-0002sU-8M; Thu, 14 Jul 2022 11:46:21 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Arnd Bergmann <arnd@arndb.de>, Xianting Tian <xianting.tian@linux.alibaba.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>, Nick Kossifidis <mick@ics.forth.gr>, Mike Rapoport <rppt@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, huanyi.xj@alibaba-inc.com
Subject: Re: [PATCH V2 2/2] riscv: Add modules to virtual kernel memory layout dump
Date: Thu, 14 Jul 2022 11:46:20 +0200
Message-ID: <3975689.5fSG56mABF@diego>
In-Reply-To: <f706ddff-8444-bba1-a98a-23a1333cc70a@linux.alibaba.com>
References: <20220714025901.359695-1-xianting.tian@linux.alibaba.com> <CAK8P3a3-jKEs+uGL=_kjmfzao6DYgmrkO+YWtNhv5O+hFw_qog@mail.gmail.com> <f706ddff-8444-bba1-a98a-23a1333cc70a@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_024631_482312_7E9F6880 
X-CRM114-Status: GOOD (  17.29  )
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

QW0gRG9ubmVyc3RhZywgMTQuIEp1bGkgMjAyMiwgMTE6MTc6MjYgQ0VTVCBzY2hyaWViIFhpYW50
aW5nIFRpYW46Cj4gCj4g5ZyoIDIwMjIvNy8xNCDkuIvljYg0OjI0LCBBcm5kIEJlcmdtYW5uIOWG
memBkzoKPiA+IE9uIFRodSwgSnVsIDE0LCAyMDIyIGF0IDQ6NTkgQU0gWGlhbnRpbmcgVGlhbgo+
ID4gPHhpYW50aW5nLnRpYW5AbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+ID4+IEFzIE1PRFVM
RVMgaXMgb25seSBkZWZpbmVkIGZvciBDT05GSUdfNjRCSVQsIHNvIHdlIGR1bXAgaXQgd2hlbgo+
ID4+IENPTkZJR182NEJJVC4KPiA+IERvZXNuJ3QgdGhpcyBjYXVzZSBhIGNvbXBpbGUtdGltZSBl
cnJvciBvbiAzMi1iaXQ/Cj4gSSB0ZXN0ZWQsIHJ2MzIgY29tcGlsZSBpcyBPSy4KCj4gPj4gICAg
ICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZylWTUVNTUFQX0VORCk7Cj4gPj4gICAgICAgICAg
cHJpbnRfbWwoInZtYWxsb2MiLCAodW5zaWduZWQgbG9uZylWTUFMTE9DX1NUQVJULAo+ID4+ICAg
ICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpVk1BTExPQ19FTkQpOwo+ID4+ICsgICAgICAg
aWYgKElTX0VOQUJMRUQoQ09ORklHXzY0QklUKSkKPiA+PiArICAgICAgICAgICAgICAgcHJpbnRf
bWwoIm1vZHVsZXMiLCAodW5zaWduZWQgbG9uZylNT0RVTEVTX1ZBRERSLAo+ID4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKU1PRFVMRVNfRU5EKTsKPiA+IFRoZSBJU19F
TkFCTEVEKCkgY2hlY2sgcHJldmVudHMgdGhlIGxpbmUgZnJvbSBnZXR0aW5nIGV4ZWN1dGVkLCBi
dXQKPiA+IHVubGlrZSBhbiAjaWZkZWYgaXQgc3RpbGwgcmVsaWVzIG9uIGl0IHRvIGJlIHBhcnNh
YmxlLgo+IFRoYW5rcywgSSB3aWxsIHVzZSAjaWZkZWYgaW5zdGVhZCBvZiBJU19FTkFCTEVECgpQ
YXRjaDEgYWxzbyBoYXMgdGhhdCBpc3N1ZSB3aXRoIHRoZQoKICAgICAgaWYgKElTX0VOQUJMRUQo
Q09ORklHXzY0QklUKSkgewogICAgICAgICAgICAgIHZtY29yZWluZm9fYXBwZW5kX3N0cigiTlVN
QkVSKE1PRFVMRVNfVkFERFIpPTB4JWx4XG4iLCBNT0RVTEVTX1ZBRERSKTsKICAgICAgICAgICAg
ICB2bWNvcmVpbmZvX2FwcGVuZF9zdHIoIk5VTUJFUihNT0RVTEVTX0VORCk9MHglbHhcbiIsIE1P
RFVMRVNfRU5EKTsKICAgICAgLi4uLgoKCm1vZHVsZV9hbGxvYyBmYWxscyBiYWNrIHRvIGEgd2Vh
ayB2YXJpYW50IFswXSB3aGljaCBpcyB0aGUgc2FtZSBhcyB0aGUgcmlzY3YgdmFyaWFudApvbmx5
IHRoZW4gdXNpbmcgVk1BTExPQ19TVEFSVCAtIFZNQUxMT0NfRU5EIGFzIHJhbmdlLCBhcyB0aGUg
cmlzY3YtdmFyaWFudApjb25kaXRpb25hbCB0byBDT05GSUdfNjRCSVQuCgpJJ20gd29uZGVyaW5n
IGlmIGl0IHdvdWxkbid0IGJlIGVhc2llciBpbiB0aGUgbG9uZyBydW4gdG8ganVzdCBkZWZpbmUK
TU9EVUxFU19WQUREUiwgTU9EVUxFU19FTkQgZm9yIDMyYml0IHRvIHVzZSB0aGVzZSB2YWx1ZXMg
YW5kIGdldCByaWQgb2YKdGhlIENPTkZJR182NEJJVCBpZmRlZiB3ZSBhbHJlYWR5IGhhdmUgZm9y
IE1PRFVMRVMgKGFuZCBuZXcgb25lcyB3ZSBhcmUKaW50cm9kdWNpbmcgbm93KS4KCgpIZWlrbwoK
ClswXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2tlcm5l
bC9tb2R1bGUuYyNMMjgzNQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
