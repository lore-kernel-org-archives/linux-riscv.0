Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76F6C04FF8
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 06:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDkwjh2TYIQOiBbvJ+TaGWmOfPW3YYGYCzxdL4w6lAE=; b=Y8LHiwQfyaR43P
	6wvUoWOiYQWsf8XbLDLTkg+Hk+A33wB8zgnF7nRNHua9T8dTUklUyP1kLa5Oei0Ah2rOuNUetvs91
	5v9cV2NH86du41ioCesisNAKN5hBdLACLN4e8l84h+gMtJQB882m4Ex6/EU9CM+dEq3bljRlofnnb
	mXTOEje7EQ8LezCMNr0CZM56suFFG6t64OZgzjkiSDPOvvZ1y3Tz0FE0TlmO5yWdnb8GJu94NWZC+
	tZk6SLRqX0btuUzvgyykck0gRkdVIEUsBKZQWBkcdWs5uXYiyRy32VgpUNDgpgI2KghmilCHJMLDi
	pAO6dtIxGiff653QL+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwcYa-0000000B82b-0rLS;
	Tue, 16 Apr 2024 06:44:41 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwcYL-0000000B7xQ-40DY
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 06:44:35 +0000
Date: Tue, 16 Apr 2024 08:44:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1713249860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXvhT03wv4aD4mG7No4QBS1v7N0JoskGOicMYBhMYkU=;
	b=I4EpvtrBMDw8wtNcnN+FtV7XaKNKQxwSOUjI+gsa86yDttz6jik4c/ITUTbXRVSMCW5FgE
	j1ybcCdXv3uk9RbqRiJmEvwk5X19kmTOqqW7XWK5vpS+z5gXt+zzrtLg+99Om0014tdyES
	JOGcCCdqpzz9eib45hed8UOKMuFptKmg26d1n753cdw/gQeNFq8/Ci+ZBGGIEA7tYOKPTP
	7+dPSEYQv42OGaQobWn8yXdYHZ/+NegmuisSyNJ4LpjxPnq/lfLTs6vY3NMEzyPVu1SGa3
	g8U9b4BDtMDqJ8s+HwmPK7jcY5THj01jQ37v9JTWYtAJWMZcER3OE84d6Bzi1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1713249860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXvhT03wv4aD4mG7No4QBS1v7N0JoskGOicMYBhMYkU=;
	b=bJzRYCLQmILvJC51K4zxw1Cp6h4ntNM+6v4foRDudJvLy+lpJM+x1SDNyCTogQ89bV3viq
	bSPWcQsruKAKuDCA==
From: Nam Cao <namcao@linutronix.de>
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Andreas Dilger
 <adilger@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel
 <linux-fsdevel@vger.kernel.org>, Jan Kara <jack@suse.cz>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>, Ext4
 Developers List <linux-ext4@vger.kernel.org>, Conor Dooley
 <conor@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Anders
 Roxell <anders.roxell@linaro.org>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <20240416084417.569356d3@namcao>
In-Reply-To: <87le5e393x.fsf@all.your.base.are.belong.to.us>
References: <878r1ibpdn.fsf@all.your.base.are.belong.to.us>
	<20240413164318.7260c5ef@namcao>
	<22E65CA5-A2C0-44A3-AB01-7514916A18FC@dilger.ca>
	<20240414021555.GQ2118490@ZenIV>
	<887E261B-3C76-4CD9-867B-5D087051D004@dilger.ca>
	<87v84kujec.fsf@all.your.base.are.belong.to.us>
	<20240415-festland-unattraktiv-2b5953a6dbc9@brauner>
	<87le5e393x.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_234426_166257_2E602D29 
X-CRM114-Status: GOOD (  17.64  )
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

T24gMjAyNC0wNC0xNSBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IFRoYW5rcyBmb3IgZ2V0dGluZyBi
YWNrISBTcGVudCBzb21lIG1vcmUgdGltZSBvbmUgaXQgdG9kYXkuCj4gCj4gSXQgc2VlbXMgdGhh
dCB0aGUgYnVkZHkgYWxsb2NhdG9yICpjYW4qIHJldHVybiBhIHBhZ2Ugd2l0aCBhIFZBIHRoYXQg
Y2FuCj4gd3JhcCAoMHhmZmZmZjAwMCAtLSBwb2ludGVkIG91dCBieSBOYW0gYW5kIG15c2VsZiku
Cj4gCj4gRnVydGhlciwgaXQgc2VlbXMgbGlrZSByaXNjdjMyIGluZGVlZCBpbnNlcnRzIGEgcGFn
ZSBsaWtlIHRoYXQgdG8gdGhlCj4gYnVkZHkgYWxsb2NhdG9yLCB3aGVuIHRoZSBtZW1ibG9jayBp
cyBmcmVlJ2Q6Cj4gCj4gICB8IFs8YzAyNDk2MWM+XSBfX2ZyZWVfb25lX3BhZ2UrMHgyYTQvMHgz
ZWEKPiAgIHwgWzxjMDI0YTQ0OD5dIF9fZnJlZV9wYWdlc19vaysweDE1OC8weDNjYwo+ICAgfCBb
PGMwMjRiMWE0Pl0gX19mcmVlX3BhZ2VzX2NvcmUrMHhlOC8weDEyYwo+ICAgfCBbPGMwYzE0MzVh
Pl0gbWVtYmxvY2tfZnJlZV9wYWdlcysweDFhLzB4MjIKPiAgIHwgWzxjMGMxNzY3Nj5dIG1lbWJs
b2NrX2ZyZWVfYWxsKzB4MWVlLzB4Mjc4Cj4gICB8IFs8YzBjMDUwYjA+XSBtZW1faW5pdCsweDEw
LzB4YTQKPiAgIHwgWzxjMGMxNDQ3Yz5dIG1tX2NvcmVfaW5pdCsweDExYS8weDJkYQo+ICAgfCBb
PGMwYzAwYmI2Pl0gc3RhcnRfa2VybmVsKzB4M2M0LzB4NmRlCj4gCj4gSGVyZSwgYSBwYWdlIHdp
dGggVkEgMHhmZmZmZjAwMCBpcyBhIGFkZGVkIHRvIHRoZSBmcmVlbGlzdC4gV2Ugd2VyZSBqdXN0
Cj4gbHVja3kgKHVubHVja3k/KSB0aGF0IHBhZ2Ugd2FzIHVzZWQgZm9yIHRoZSBwYWdlIGNhY2hl
LgoKSSBqdXN0IGVkdWNhdGVkIG15c2VsZiBhYm91dCBtZW1vcnkgbWFwcGluZyBsYXN0IG5pZ2h0
LCBzbyB0aGUgYmVsb3cKbWF5IGJlIGNvbXBsZXRlIG5vbnNlbnNlLiBUYWtlIGl0IHdpdGggYSBn
cmFpbiBvZiBzYWx0LgoKSW4gcmlzY3YncyBzZXR1cF9ib290bWVtKCksIHdlIGhhdmUgdGhpcyBs
aW5lOgoJbWF4X2xvd19wZm4gPSBtYXhfcGZuID0gUEZOX0RPV04ocGh5c19yYW1fZW5kKTsKCkkg
dGhpbmsgdGhpcyBpcyB0aGUgcm9vdCBjYXVzZTogbWF4X2xvd19wZm4gaW5kaWNhdGVzIHRoZSBs
YXN0IHBhZ2UKdG8gYmUgbWFwcGVkLiBQcm9ibGVtIGlzOiBub3RoaW5nIHByZXZlbnRzIFBGTl9E
T1dOKHBoeXNfcmFtX2VuZCkgZnJvbQpnZXR0aW5nIG1hcHBlZCB0byB0aGUgbGFzdCBwYWdlICgw
eGZmZmZmMDAwKS4gSWYgbWF4X2xvd19wZm4gaXMgbWFwcGVkCnRvIHRoZSBsYXN0IHBhZ2UsIHdl
IGdldCB0aGUgcmVwb3J0ZWQgcHJvYmxlbS4KClRoZXJlIHNlZW1zIHRvIGJlIHNvbWUgY29kZSB0
byBtYWtlIHN1cmUgdGhlIGxhc3QgcGFnZSBpcyBub3QgdXNlZAoodGhlIGNhbGwgdG8gbWVtYmxv
Y2tfc2V0X2N1cnJlbnRfbGltaXQoKSByaWdodCBhYm92ZSB0aGlzIGxpbmUpLiBJdCBpcwp1bmNs
ZWFyIHRvIG1lIHdoeSB0aGlzIHN0aWxsIGxldHMgdGhlIHByb2JsZW0gc2xpcCB0aHJvdWdoLgoK
VGhlIGZpeCBpcyBzaW1wbGU6IG5ldmVyIGxldCBtYXhfbG93X3BmbiBnZXRzIG1hcHBlZCB0byB0
aGUgbGFzdCBwYWdlLgpUaGUgYmVsb3cgcGF0Y2ggZml4ZXMgdGhlIHByb2JsZW0gZm9yIG1lLiBC
dXQgSSBhbSBub3QgZW50aXJlbHkgc3VyZSBpZgp0aGlzIGlzIHRoZSBjb3JyZWN0IGZpeCwgZnVy
dGhlciBpbnZlc3RpZ2F0aW9uIG5lZWRlZC4KCkJlc3QgcmVnYXJkcywKTmFtCgpkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwppbmRleCBmYTM0
Y2Y1NTAzN2IuLjE3Y2FiMGE1MjcyNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0LmMK
KysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKQEAgLTI1MSw3ICsyNTEsOCBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgc2V0dXBfYm9vdG1lbSh2b2lkKQogCX0KIAogCW1pbl9sb3dfcGZuID0gUEZOX1VQ
KHBoeXNfcmFtX2Jhc2UpOwotCW1heF9sb3dfcGZuID0gbWF4X3BmbiA9IFBGTl9ET1dOKHBoeXNf
cmFtX2VuZCk7CisJbWF4X2xvd19wZm4gPSBQRk5fRE9XTihtZW1ibG9ja19nZXRfY3VycmVudF9s
aW1pdCgpKTsKKwltYXhfcGZuID0gUEZOX0RPV04ocGh5c19yYW1fZW5kKTsKIAloaWdoX21lbW9y
eSA9ICh2b2lkICopKF9fdmEoUEZOX1BIWVMobWF4X2xvd19wZm4pKSk7CiAKIAlkbWEzMl9waHlz
X2xpbWl0ID0gbWluKDRVTCAqIFNaXzFHLCAodW5zaWduZWQgbG9uZylQRk5fUEhZUyhtYXhfbG93
X3BmbikpOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
