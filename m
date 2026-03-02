Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88A4EA4E13
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 14:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=waHlcYjgrjjCDe4CbGwrebtsqAkPDDnJoeQbLNQoLgo=; b=L69fFXTxZeLHNJjzLEXd4tZfdf
	+wBaHfoLz9J2j49Y8C2VWVPb/U2SrZY6Ch3aD/R2H234HbSECujwcNVxanAk0GMVktnEYP7PRH+Y+
	mqsM4w2n7azCkegkXd5FKP5aE7CivIpWW6LCrREcwkPVosO4wzJGDBlUgjnstF1Yj4w/HlUYGOlAL
	kM71N0wxgiZZBD2m8kWrH4InYO9dyO0Y+iYDlNRxhTZfpYzhADj3o6QOcPIMAjVOxrMrOgPnIxPDB
	kwxqXdmaPFmoRwjPMZz12y+roiVwa8IswyJLzuiEWvDgTzASMxML36GzwHJXTdDskkz8zBi7zN9iT
	2fgmP+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4jw-0000000DHMN-2TGN;
	Mon, 02 Mar 2026 14:59:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4jt-0000000DHLD-1gsM;
	Mon, 02 Mar 2026 14:59:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A5AC4430B;
	Mon,  2 Mar 2026 14:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211BAC19423;
	Mon,  2 Mar 2026 14:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772463556;
	bh=yLKCSXO+hQApHc+NF2pMZzlTvrx+yrgTZOCdhXU+l+s=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=f2NBa7irVPOLjk3WW4SCmf8FWi+7tBJ3LbL5TJX9XKvS1spGkziwe9pGBJY+oqLo7
	 kA0iGOYvp0cjlRZXL+tt2MqQSyn2cirVYdwLABTi85/4lhjcDbtxxtfNHjPvF07WxM
	 VGhJDv969X+0XD8Ltsk+AXrf1C36RCmK274CzxkNnrnNzf+bfkiSYGN9DW2Q5LeFol
	 85vi9xmsuMiRcJ/1EsNPNL1+QYTCSEkkbB/fpWUiTL6w5gSJgyz7KbZ7zgfoOhM5xy
	 GUA1X9y6ljSEOT1J2bnp5Y5mMfrMW692fy/GCNHYl8XYEYdmgabRaVoJG4M+mEOaEn
	 5PRbc9SZdCdXw==
Message-ID: <e8a688b3-97e1-4523-9a82-8d9dd16e3d90@kernel.org>
Date: Mon, 2 Mar 2026 15:59:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] uaccess: Fix scoped_user_read_access() for
 'pointer to const'
To: david.laight.linux@gmail.com, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andre Almeida <andrealmeid@igalia.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Christian Brauner <brauner@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Heiko Carstens <hca@linux.ibm.com>, Jan Kara <jack@suse.cz>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Nicolas Palix <nicolas.palix@imag.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Russell King <linux@armlinux.org.uk>, Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 Kees Cook <kees@kernel.org>, akpm@linux-foundation.org
References: <20260302132755.1475451-1-david.laight.linux@gmail.com>
 <20260302132755.1475451-2-david.laight.linux@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260302132755.1475451-2-david.laight.linux@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_065917_477720_AFA90715 
X-CRM114-Status: GOOD (  19.20  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAwMi8wMy8yMDI2IMOgIDE0OjI3LCBkYXZpZC5sYWlnaHQubGludXhAZ21haWwuY29tIGEg
w6ljcml0wqA6Cj4gRnJvbTogRGF2aWQgTGFpZ2h0IDxkYXZpZC5sYWlnaHQubGludXhAZ21haWwu
Y29tPgo+IAo+IElmIGEgJ2NvbnN0IHN0cnVjdCBmb28gX191c2VyICpwdHInIGlzIHVzZWQgZm9y
IHRoZSBhZGRyZXNzIHBhc3NlZAo+IHRvIHNjb3BlZF91c2VyX3JlYWRfYWNjZXNzKCkgdGhlbiB5
b3UgZ2V0IGEgd2FybmluZy9lcnJvcgo+IHVhY2Nlc3MuaDo2OTE6MTogZXJyb3I6IGluaXRpYWxp
emF0aW9uIGRpc2NhcmRzICdjb25zdCcgcXVhbGlmaWVyCj4gICAgICBmcm9tIHBvaW50ZXIgdGFy
Z2V0IHR5cGUgWy1XZXJyb3I9ZGlzY2FyZGVkLXF1YWxpZmllcnNdCj4gZm9yIHRoZQo+ICAgICAg
dm9pZCBfX3VzZXIgKl90bXBwdHIgPSBfX3Njb3BlZF91c2VyX2FjY2Vzc19iZWdpbihtb2RlLCB1
cHRyLCBzaXplLCBlbGJsKQo+IGFzc2lnbm1lbnQuCj4gCj4gRml4IGJ5IHVzaW5nICdhdXRvJyBm
b3IgYm90aCBfdG1wcHRyIGFuZCB0aGUgcmVkZWNsYXJhdGlvbiBvZiB1cHRyLgo+IFJlcGxhY2Ug
dGhlIENMQVNTKCkgd2l0aCBleHBsaWNpdCBfX2NsZWFudXAoKSBmdW5jdGlvbnMgb24gdXB0ci4K
PiAKPiBGaXhlczogZTQ5NzMxMGI0ZmZiICIodWFjY2VzczogUHJvdmlkZSBzY29wZWQgdXNlciBh
Y2Nlc3MgcmVnaW9ucykiCj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgTGFpZ2h0IDxkYXZpZC5sYWln
aHQubGludXhAZ21haWwuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgKENTIEdS
T1VQKSA8Y2hsZXJveUBrZXJuZWwub3JnPgpUZXN0ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgKENT
IEdST1VQKSA8Y2hsZXJveUBrZXJuZWwub3JnPgoKQ2FuIHdlIGdldCB0aGlzIGZpeCBtZXJnZWQg
aW4gNy4wLXJjMyBzbyB0aGF0IHdlIGNhbiBzdGFydCBidWlsZGluZyA3LjEgCm9uIHRvcCBvZiBp
dCA/CgpUaGFua3MKQ2hyaXN0b3BoZQoKPiAtLS0KPiAgIGluY2x1ZGUvbGludXgvdWFjY2Vzcy5o
IHwgNTQgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC91YWNjZXNzLmggYi9pbmNsdWRlL2xpbnV4L3VhY2Nlc3MuaAo+
IGluZGV4IDFmMzgwNDI0NWMwNi4uODA5ZTRmN2RmZGJkIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
bGludXgvdWFjY2Vzcy5oCj4gKysrIGIvaW5jbHVkZS9saW51eC91YWNjZXNzLmgKPiBAQCAtNjQ3
LDM2ICs2NDcsMjIgQEAgc3RhdGljIGlubGluZSB2b2lkIHVzZXJfYWNjZXNzX3Jlc3RvcmUodW5z
aWduZWQgbG9uZyBmbGFncykgeyB9Cj4gICAvKiBEZWZpbmUgUlcgdmFyaWFudCBzbyB0aGUgYmVs
b3cgX21vZGUgbWFjcm8gZXhwYW5zaW9uIHdvcmtzICovCj4gICAjZGVmaW5lIG1hc2tlZF91c2Vy
X3J3X2FjY2Vzc19iZWdpbih1KQltYXNrZWRfdXNlcl9hY2Nlc3NfYmVnaW4odSkKPiAgICNkZWZp
bmUgdXNlcl9yd19hY2Nlc3NfYmVnaW4odSwgcykJdXNlcl9hY2Nlc3NfYmVnaW4odSwgcykKPiAt
I2RlZmluZSB1c2VyX3J3X2FjY2Vzc19lbmQoKQkJdXNlcl9hY2Nlc3NfZW5kKCkKPiAgIAo+ICAg
LyogU2NvcGVkIHVzZXIgYWNjZXNzICovCj4gLSNkZWZpbmUgVVNFUl9BQ0NFU1NfR1VBUkQoX21v
ZGUpCQkJCVwKPiAtc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIF9fdXNlciAqCQkJCVwKPiAt
Y2xhc3NfdXNlcl8jI19tb2RlIyNfYmVnaW4odm9pZCBfX3VzZXIgKnB0cikJCQlcCj4gLXsJCQkJ
CQkJCVwKPiAtCXJldHVybiBwdHI7CQkJCQkJXAo+IC19CQkJCQkJCQlcCj4gLQkJCQkJCQkJXAo+
IC1zdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQJCQkJCVwKPiAtY2xhc3NfdXNlcl8jI19tb2Rl
IyNfZW5kKHZvaWQgX191c2VyICpwdHIpCQkJXAo+IC17CQkJCQkJCQlcCj4gLQl1c2VyXyMjX21v
ZGUjI19hY2Nlc3NfZW5kKCk7CQkJCVwKPiAtfQkJCQkJCQkJXAo+IC0JCQkJCQkJCVwKPiAtREVG
SU5FX0NMQVNTKHVzZXJfICMjX21vZGUjIyBfYWNjZXNzLCB2b2lkIF9fdXNlciAqLAkJXAo+IC0J
ICAgICBjbGFzc191c2VyXyMjX21vZGUjI19lbmQoX1QpLAkJCVwKPiAtCSAgICAgY2xhc3NfdXNl
cl8jI19tb2RlIyNfYmVnaW4ocHRyKSwgdm9pZCBfX3VzZXIgKnB0cikJXAo+IC0JCQkJCQkJCVwK
PiAtc3RhdGljIF9fYWx3YXlzX2lubGluZSBjbGFzc191c2VyXyMjX21vZGUjI19hY2Nlc3NfdAkJ
XAo+IC1jbGFzc191c2VyXyMjX21vZGUjI19hY2Nlc3NfcHRyKHZvaWQgX191c2VyICpzY29wZSkJ
CVwKPiAtewkJCQkJCQkJXAo+IC0JcmV0dXJuIHNjb3BlOwkJCQkJCVwKPiAtfQo+ICAgCj4gLVVT
RVJfQUNDRVNTX0dVQVJEKHJlYWQpCj4gLVVTRVJfQUNDRVNTX0dVQVJEKHdyaXRlKQo+IC1VU0VS
X0FDQ0VTU19HVUFSRChydykKPiAtI3VuZGVmIFVTRVJfQUNDRVNTX0dVQVJECj4gKy8qIENsZWFu
dXAgd3JhcHBlciBmdW5jdGlvbnMgKi8KPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIF9f
c2NvcGVkX3VzZXJfcmVhZF9hY2Nlc3NfZW5kKGNvbnN0IHZvaWQgKnApCj4gK3sKPiArCXVzZXJf
cmVhZF9hY2Nlc3NfZW5kKCk7Cj4gK307Cj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBf
X3Njb3BlZF91c2VyX3dyaXRlX2FjY2Vzc19lbmQoY29uc3Qgdm9pZCAqcCkKPiArewo+ICsJdXNl
cl93cml0ZV9hY2Nlc3NfZW5kKCk7Cj4gK307Cj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9p
ZCBfX3Njb3BlZF91c2VyX3J3X2FjY2Vzc19lbmQoY29uc3Qgdm9pZCAqcCkKPiArewo+ICsJdXNl
cl9hY2Nlc3NfZW5kKCk7Cj4gK307Cj4gICAKPiAgIC8qKgo+ICAgICogX19zY29wZWRfdXNlcl9h
Y2Nlc3NfYmVnaW4gLSBTdGFydCBhIHNjb3BlZCB1c2VyIGFjY2Vzcwo+IEBAIC03NTAsMTMgKzcz
NiwxMyBAQCBVU0VSX0FDQ0VTU19HVUFSRChydykKPiAgICAqCj4gICAgKiBEb24ndCB1c2UgZGly
ZWN0bHkuIFVzZSBzY29wZWRfbWFza2VkX3VzZXJfJE1PREVfYWNjZXNzKCkgaW5zdGVhZC4KPiAg
ICAqLwo+IC0jZGVmaW5lIF9fc2NvcGVkX3VzZXJfYWNjZXNzKG1vZGUsIHVwdHIsIHNpemUsIGVs
YmwpCQkJCQlcCj4gLWZvciAoYm9vbCBkb25lID0gZmFsc2U7ICFkb25lOyBkb25lID0gdHJ1ZSkJ
CQkJCQlcCj4gLQlmb3IgKHZvaWQgX191c2VyICpfdG1wcHRyID0gX19zY29wZWRfdXNlcl9hY2Nl
c3NfYmVnaW4obW9kZSwgdXB0ciwgc2l6ZSwgZWxibCk7IFwKPiAtCSAgICAgIWRvbmU7IGRvbmUg
PSB0cnVlKQkJCQkJCQlcCj4gLQkJZm9yIChDTEFTUyh1c2VyXyMjbW9kZSMjX2FjY2Vzcywgc2Nv
cGUpKF90bXBwdHIpOyAhZG9uZTsgZG9uZSA9IHRydWUpCVwKPiAtCQkJLyogRm9yY2UgbW9kaWZp
ZWQgcG9pbnRlciB1c2FnZSB3aXRoaW4gdGhlIHNjb3BlICovCQlcCj4gLQkJCWZvciAoY29uc3Qg
dHlwZW9mKHVwdHIpIHVwdHIgPSBfdG1wcHRyOyAhZG9uZTsgZG9uZSA9IHRydWUpCj4gKyNkZWZp
bmUgX19zY29wZWRfdXNlcl9hY2Nlc3MobW9kZSwgdXB0ciwgc2l6ZSwgZWxibCkJCQkJXAo+ICtm
b3IgKGJvb2wgZG9uZSA9IGZhbHNlOyAhZG9uZTsgZG9uZSA9IHRydWUpCQkJCQlcCj4gKwlmb3Ig
KGF1dG8gX3RtcHB0ciA9IF9fc2NvcGVkX3VzZXJfYWNjZXNzX2JlZ2luKG1vZGUsIHVwdHIsIHNp
emUsIGVsYmwpOwlcCj4gKwkgICAgICFkb25lOyBkb25lID0gdHJ1ZSkJCQkJCQlcCj4gKwkJLyog
Rm9yY2UgbW9kaWZpZWQgcG9pbnRlciB1c2FnZSB3aXRoaW4gdGhlIHNjb3BlICovCQlcCj4gKwkJ
Zm9yIChjb25zdCBhdXRvIHVwdHIgIF9fY2xlYW51cChfX3Njb3BlZF91c2VyXyMjbW9kZSMjX2Fj
Y2Vzc19lbmQpID0gXAo+ICsJCSAgICAgX3RtcHB0cjsgIWRvbmU7IGRvbmUgPSB0cnVlKQo+ICAg
Cj4gICAvKioKPiAgICAqIHNjb3BlZF91c2VyX3JlYWRfYWNjZXNzX3NpemUgLSBTdGFydCBhIHNj
b3BlZCB1c2VyIHJlYWQgYWNjZXNzIHdpdGggZ2l2ZW4gc2l6ZQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
