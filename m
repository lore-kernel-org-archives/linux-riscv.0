Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A250CF34C8
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 21:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LT8f4CrpyfKfjrFEAgp/kRjBRAw0jgGvmsGRrwGRnQ4=; b=2YKvsGBE+/7qOs
	axJBiHQwGnOYeco6ee4m27PxPyo7mjkdmbt4757Kjv0LIqJn0Y4jzDYHEEeSdR0+SSzvu4P53DNgr
	icocJRXTy0kq3N2JhSVHLNs4oK/fk2bAe26Jo5yt6s53DE0kZ5XbeimiOHIcGQGtq89ke/Fgwm6BJ
	ElJjJbfV1LR7LaoYqxr/eI5qMXLspR9bklplXnti4IedoQkDHln2d71gnIg6kkx2TwVLbCY9sYbN3
	Y8FFYvt6zVYJpKDAi1tjYoyQ2VFgV3wpwa1sCz8gRnqWlve5AdVdP22R7ytlIcn3Oq8/1X+8yGX7+
	9CfW2Fy5JtEvE3xXVrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swTGD-0000000ANs1-2mPc;
	Thu, 03 Oct 2024 21:21:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swTGA-0000000ANrH-28Ls
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 21:21:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50E315C5E3A;
	Thu,  3 Oct 2024 21:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE41C4CEC5;
	Thu,  3 Oct 2024 21:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727990477;
	bh=MyO0mEN1r8H/oKU5bxpARWbwameUHysvIHiV6FcP700=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PPg34YVsXCAp7pJvZLK0zV3RJMEwEU7lOh0UIO7ZIcVp2soY8IlkVcYY0wYWWwe9F
	 LXHbVw2ZP5ZeOni+gTiOn8h3ecqgft9fwWHIRCt/4TX/YS/U1enNW6+64j7SBcclQf
	 kJs9NB6B1xNxM2JpmdJwDwz9o9+wcqkS0tgEHhHIvdV5tTc3qrIKwwM4c4cnR1PX8G
	 j7L+gwuiKsklCWGiLh2gxOSv/1/JXOmR+uDi5zqv0pdD5mLM9tWsa0HsI2vtTvMK+1
	 LE5pw4I0IScZfYrsun5cZiS8RBmYs8gUW5fo6u3ZO97qX9wloVcNfpxBs6GtbauAvX
	 /iAIHpjg1Ddtg==
Date: Thu, 3 Oct 2024 14:21:13 -0700
From: Kees Cook <kees@kernel.org>
To: Jason Montleon <jmontleo@redhat.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-hardening@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	linux-riscv@lists.infradead.org
Subject: Re: [REGRESSION][BISECTED] Cannot boot Lichee Pi 4A with
 FORTIFY_SOURCE enabled
Message-ID: <202410031417.A5AB8BA5@keescook>
References: <B2A62C7F-45BA-43E1-975F-5AF0197CD2C3@kernel.org>
 <CAJD_bP+43=XXD7p3fRfDxCbj=_YedgVLv38XO4iOAw94a+4PHg@mail.gmail.com>
 <202409221511.9AF49BD@keescook>
 <CAJD_bP+6qCgseo9of-cKW3+nH_UbGFwPo6WRbqqcneOZ+EEtOw@mail.gmail.com>
 <800CC050-E858-409C-A565-A6EF430E1B25@kernel.org>
 <CAJD_bPKNbKo5tj4OV4MpgtSN6_FXfmQtBFgVFzZeZapCPNT6PA@mail.gmail.com>
 <eb7354f6-98bd-45c6-a616-733637848a14@ghiti.fr>
 <CAJD_bPKHA5+Ta1vzokN-TXJU4bk4OA5QTXEEvAwmzLzmW8YtTQ@mail.gmail.com>
 <f9d17698-0c74-42b7-acc8-3ca3adf3ba4d@ghiti.fr>
 <CAJD_bP+ZYKFaeZ2hQXjAZda=RhLkfnXfGLW-ZYTrOV4GfNRzpA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJD_bP+ZYKFaeZ2hQXjAZda=RhLkfnXfGLW-ZYTrOV4GfNRzpA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_142118_616651_AB7F7AEB 
X-CRM114-Status: GOOD (  15.06  )
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

T24gVGh1LCBPY3QgMDMsIDIwMjQgYXQgMDE6MTI6NTlQTSAtMDQwMCwgSmFzb24gTW9udGxlb24g
d3JvdGU6Cj4gT24gVGh1LCBPY3QgMywgMjAyNCBhdCAxMDo0MeKAr0FNIEFsZXhhbmRyZSBHaGl0
aSA8YWxleEBnaGl0aS5mcj4gd3JvdGU6Cj4gPiBTbyBJIHdhcyBhYmxlIHRvIHJlcHJvZHVjZSB0
aGUgaXNzdWUgb24gcWVtdSBieSBhZGRpbmcgYSBmZXcgdHdlYWtzLCBhbmQKPiA+IGluZGVlZCB3
ZSB0cmFwIGluIF9fd2Fybl9wcmludGsoKSBvbiBhIHZpcnR1YWwgYWRkcmVzcyBidXQgTU1VIGlz
IG5vdAo+ID4gZW5hYmxlZCB5ZXQuCj4gPgo+ID4gVGhlIGZvbGxvd2luZyBkaWZmIHRob3VnaCBh
bGxvd3MgbWUgdG8gcGFzcyB0aGlzIGZhaWx1cmUgYnV0IEkgY2FuJ3QgZ2V0Cj4gPiBtdWNoIGZ1
cnRoZXIgaW4gdGhlIGJvb3Qgc2luY2UgdGhlIHR3ZWFrcyBJIGFkZGVkIHdvbid0IGFsbG93IGl0
LCBjYW4KPiA+IHlvdSBnaXZlIHRoZSBmb2xsb3dpbmcgYSB0cnk/Cj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvZXJyYXRhL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9lcnJhdGEvTWFrZWZp
bGUKPiA+IGluZGV4IDhhMjczOTQ4NTEyMzMuLjQ5MTNmM2IzZjE5OGMgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2VycmF0YS9NYWtlZmlsZQo+ID4gKysrIGIvYXJjaC9yaXNjdi9lcnJhdGEv
TWFrZWZpbGUKPiA+IEBAIC0yLDYgKzIsMTAgQEAgaWZkZWYgQ09ORklHX1JFTE9DQVRBQkxFCj4g
PiAgIEtCVUlMRF9DRkxBR1MgKz0gLWZuby1waWUKPiA+ICAgZW5kaWYKPiA+Cj4gPiAraWZkZWYg
Q09ORklHX1JJU0NWX0FMVEVSTkFUSVZFX0VBUkxZCj4gPiArS0JVSUxEX0NGTEFHUyArPSAtRF9f
Tk9fRk9SVElGWQo+ID4gK2VuZGlmCj4gPiArCj4gPiAgIG9iai0kKENPTkZJR19FUlJBVEFfQU5E
RVMpICs9IGFuZGVzLwo+ID4gICBvYmotJChDT05GSUdfRVJSQVRBX1NJRklWRSkgKz0gc2lmaXZl
Lwo+ID4gICBvYmotJChDT05GSUdfRVJSQVRBX1RIRUFEKSArPSB0aGVhZC8KPiAKPiBZZXMsIHRo
aXMgd29ya2VkLgoKVGhhbmtzIGZvciB0ZXN0aW5nIQoKWWVhaCwgdGhpcyBtYXRjaGVzIHNpbWls
YXIgZm9ydGlmeSBkaXNhYmxpbmcgaW4gb3RoZXIgZWFybHkgYm9vdCBhcmVhcy4KVXN1YWxseSBp
dCdzIHBhcnQgb2YgYSBjb21tb24gaGVhZGVyLCBidXQgc2V0dGluZyBpdCB2aWEgdGhlIE1ha2Vm
aWxlCmFsc28gd29ya3MuIEknbGwgbGVhdmUgaXQgdXAgdG8gdGhlIHJpc2N2IG1haW50YWluZXJz
ISA6KQoKLUtlZXMKCi0tIApLZWVzIENvb2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
