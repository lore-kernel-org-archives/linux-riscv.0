Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B75AC54F47
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 15:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8DIbu+jygY+jqtYbeHedHUIVnLRfU6j59Jg0Zmq5l7s=; b=m17cSEdVaNRV73
	PcKMUIqsKrzWeYqiWnuPD+haerqRuuMiEHhoBFjE6Nj9i+19hSWdSU/yhK6pOnj2HsihMneyX3pEY
	PRZxMoS689O3w9b4mGFM6WccV+90XWoN4jQVrbU68qaCQxqVRD4lKSUWQcCYWiLfzYXT0t3m3jQSr
	kS5RTehGI64MmFjCnNDZseOWsNmx7OS9yQ2sX9BAqlqFZkWSj1K0cgutx/3OooIULuXygF3h6bEGP
	xnWv1OPAOEfhr7WOy2ojjdRRWMb6/M9Zkst4vAbZfDVN6RiAlp0uDSoDeQZhoSICpKLypThj6IiFz
	19LK+FH/jhmdlX+M4cZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIU1p-00000004CFP-441m;
	Fri, 23 May 2025 15:09:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITfz-000000048SB-14iw
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 14:47:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10AD6629CD
	for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 14:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3C4C4CEE9
	for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 14:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748011629;
	bh=Ocz5J1wgv3YESCv8WYdkxEBqXdkzz0W+TH/W1ADUndA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p5+oYAi9e/oWGhHk+fosP6dsXBN2Bqqz/RtfmYCGLGUyU6KkEte5RTr21U6RQmAAH
	 rGrA87GT9vlTZTPh+HPWUKWp0DCIFkf5yOVFRxc8YoQB3U1KGLLJC3vIhl9txl4pPU
	 q14+b9aNWIit7WlXdbXywjdEKGmdHLvbBcKiT1VpP8Irr5BoQluteaHzZD/8G4JWF3
	 E9cF6wXsWA8si/H2j2wYjn1noxpSN5m7VW9cVDrmtXTs6nmnghvFkdUjEClE1jFJyh
	 m1S9Vk72/mZ+8mGxJlkFpibWlfIdVMRZA7pKiFLqHUxeEldmLlQc7t4r1xxcZ/nTsl
	 9kWzNVH1CibJw==
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-40331f302f1so15636b6e.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 07:47:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmDWnMAip/rcPKl1z5O1pbefw1I5hsZe84ZYWRnNrA10JgQLDz4bT/g0ju17gvkWs5uJX3+0jYJXiDfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdXfL3sm7iwP6yBdQNUfogJMS+l3M45smmLV/hfyRb291Hs+h3
	e5ZFv7ddqnlxcsV3e+73rHclmyVOuP3V7T36idYdeo09Tg/ab8N6Xk2I4K8XiFrHf2Ho9JXJAq8
	Y1kHxA1ewp6T3E43O2D2OaEchwj8wQwQ=
X-Google-Smtp-Source: AGHT+IGXxPZzBQ0rd2WqVkE2kMetZWcN0Srwq81135CC4scj5mkn+qPK+TyalxnWlDXRxW6GT+U59ljzQHKP8FVgAfY=
X-Received: by 2002:a05:6808:149:b0:401:e67c:b3be with SMTP id
 5614622812f47-404d865e18emr16061098b6e.4.1748011629042; Fri, 23 May 2025
 07:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250522141410.31315-1-alexghiti@rivosinc.com>
 <91458376-dfc7-46fc-8523-aa176907d703@gmx.de> <83e02a52-86ad-45e5-ba87-6c17dc6f59b5@ghiti.fr>
 <CAJZ5v0iPVx0KXB5qQ46iQ7CKG6KJC1CnXogQ=e8or24vZuytrw@mail.gmail.com>
In-Reply-To: <CAJZ5v0iPVx0KXB5qQ46iQ7CKG6KJC1CnXogQ=e8or24vZuytrw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 23 May 2025 16:46:58 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iwH3p_A=f0g7+EsPbP7KBJS_LbT9+_gXNLBbXqW8vMFg@mail.gmail.com>
X-Gm-Features: AX0GCFu5YgI8J1uqi55rgc7H6g3G0QyH8pHo4Ylik2ehjhEW7e8_ODhJw6NXFgk
Message-ID: <CAJZ5v0iwH3p_A=f0g7+EsPbP7KBJS_LbT9+_gXNLBbXqW8vMFg@mail.gmail.com>
Subject: Re: [PATCH] drivers: acpi: Fix platform profile driver on !acpi platforms
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Armin Wolf <W_Armin@gmx.de>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Arnd Bergmann <arnd@arndb.de>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6NTDigK9QTSBSYWZhZWwgSi4gV3lzb2NraSA8cmFm
YWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMTI6MTHi
gK9QTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+ID4KPiA+IE9uIDUv
MjIvMjUgMjI6MDQsIEFybWluIFdvbGYgd3JvdGU6Cj4gPiA+IEFtIDIyLjA1LjI1IHVtIDE2OjEz
IHNjaHJpZWIgQWxleGFuZHJlIEdoaXRpOgo+ID4gPgo+ID4gPj4gVGhlIHBsYXRmb3JtIHByb2Zp
bGUgZHJpdmVyIGlzIGxvYWRlZCBldmVuIG9uIHBsYXRmb3JtcyB0aGF0IGRvIG5vdCBoYXZlCj4g
PiA+PiBhY3BpIGVuYWJsZWQuIFRoZSBpbml0aWFsaXphdGlvbiBvZiB0aGUgc3lzZnMgZW50cmll
cyB3YXMgcmVjZW50bHkgbW92ZWQKPiA+ID4+IGZyb20gcGxhdGZvcm1fcHJvZmlsZV9yZWdpc3Rl
cigpIHRvIHRoZSBtb2R1bGUgaW5pdCBjYWxsLCBhbmQgdGhvc2UKPiA+ID4+IGVudHJpZXMgbmVl
ZCBhY3BpX2tvYmogdG8gYmUgaW5pdGlhbGl6ZWQgd2hpY2ggaXMgbm90IHRoZSBjYXNlIHdoZW4g
YWNwaQo+ID4gPj4gaXMgZGlzYWJsZWQuCj4gPiA+Pgo+ID4gPj4gVGhpcyByZXN1bHRzIGluIHRo
ZSBmb2xsb3dpbmcgd2FybmluZzoKPiA+ID4+Cj4gPiA+PiAgIFdBUk5JTkc6IENQVTogNSBQSUQ6
IDEgYXQgZnMvc3lzZnMvZ3JvdXAuYzoxMzEKPiA+ID4+IGludGVybmFsX2NyZWF0ZV9ncm91cCsw
eGEyMi8weGRkOAo+ID4gPj4gICBNb2R1bGVzIGxpbmtlZCBpbjoKPiA+ID4+ICAgQ1BVOiA1IFVJ
RDogMCBQSUQ6IDEgQ29tbTogc3dhcHBlci8wIFRhaW50ZWQ6IEcgVwo+ID4gPj4gNi4xNS4wLXJj
Ny1kaXJ0eSAjNiBQUkVFTVBUCj4gPiA+PiAgIFRhaW50ZWQ6IFtXXT1XQVJOCj4gPiA+PiAgIEhh
cmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKPiA+ID4+ICAgZXBjIDogaW50ZXJu
YWxfY3JlYXRlX2dyb3VwKzB4YTIyLzB4ZGQ4Cj4gPiA+PiAgICByYSA6IGludGVybmFsX2NyZWF0
ZV9ncm91cCsweGEyMi8weGRkOAo+ID4gPj4KPiA+ID4+ICAgQ2FsbCBUcmFjZToKPiA+ID4+Cj4g
PiA+PiAgIGludGVybmFsX2NyZWF0ZV9ncm91cCsweGEyMi8weGRkOAo+ID4gPj4gICBzeXNmc19j
cmVhdGVfZ3JvdXArMHgyMi8weDJlCj4gPiA+PiAgIHBsYXRmb3JtX3Byb2ZpbGVfaW5pdCsweDc0
LzB4YjIKPiA+ID4+ICAgZG9fb25lX2luaXRjYWxsKzB4MTk4LzB4YTllCj4gPiA+PiAgIGtlcm5l
bF9pbml0X2ZyZWVhYmxlKzB4NmQ4LzB4NzgwCj4gPiA+PiAgIGtlcm5lbF9pbml0KzB4MjgvMHgy
NGMKPiA+ID4+ICAgcmV0X2Zyb21fZm9yaysweGUvMHgxOAo+ID4gPj4KPiA+ID4+IEZpeCB0aGlz
IGJ5IGNoZWNraW5nIGlmIGFjcGkgaXMgZW5hYmxlZCBiZWZvcmUgdHJ5aW5nIHRvIGNyZWF0ZSBz
eXNmcwo+ID4gPj4gZW50cmllcy4KPiA+ID4KPiA+ID4gSSBhbHJlYWR5IHN1Ym1pdHRlZCBhIHBh
dGNoIGZvciB0aGlzIHByb2JsZW0gKHNlZQo+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1hY3BpL2E2ZDkyY2RkLTRkYzMtNDA4MC05ZWQ5LTViMWYwMmYyNDdlMEBnbXguZGUvVC8p
Cj4gPiA+IHRoYXQgb25seSBkaXNhYmxlcyB0aGUgbGVnYWN5IHN5c2ZzIGludGVyZmFjZSB3aGls
ZSBrZWVwaW5nIHRoZQo+ID4gPiBjbGFzcy1iYXNlZCBpbnRlcmZhY2UgZnVuY3Rpb25hbAo+ID4g
PiBhcyBpdCBkb2VzIG5vdCBkZXBlbmQgb24gQUNQSSBhdCBhbGwuCj4gPgo+ID4KPiA+IEdyZWF0
LCBJIHVuZGVyc3RhbmQgaWYgeW91ciBwYXRjaHNldCBpcyBub3QgbWVyZ2VkIGZvciByYzEgYnV0
IGl0IHdvdWxkCj4gPiBiZSBuaWNlIHRvIGhhdmUgaXQgbWVyZ2VkIGluIDYuMTYgdGhvdWdoIHRv
IGZpeCByaXNjdiBzeXprYWxsZXIKPiA+IGluc3RhbmNlLiBQZXJoYXBzIHlvdSBjb3VsZCBhZGQg
dGhlIEZpeGVzIHRhZyB0aGF0IEFybmQgbWVudGlvbmVkIHRvbz8KPgo+IEkgYWN0dWFsbHkgcHJl
ZmVyIHlvdXIgcGF0Y2ggdG8gdGhlIEFybWluJ3Mgb25lIGJlY2F1c2UgdGhlcmUgYXJlCj4gcXVl
c3Rpb25zIHJlZ2FyZGluZyB0aGUgbGF0dGVyIChzZWUgdGhlIG1vc3QgcmVjZW50IG1lc3NhZ2Ug
ZnJvbSBBcm5kCj4gaW4gdGhpcyB0aHJlYWQpLgoKQW5kIHNvIGl0IGhhcyBiZWVuIGFwcGxpZWQg
YXMgNi4xNiBtYXRlcmlhbCBub3csIHRoYW5rcyEKCj4gPiA+PiBGaXhlczogNzdiZTVjYWNiMmMy
ICgiQUNQSTogcGxhdGZvcm1fcHJvZmlsZTogQ3JlYXRlIGNsYXNzIGZvciBBQ1BJCj4gPiA+PiBw
bGF0Zm9ybSBwcm9maWxlIikKPiA+ID4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8
YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+ID4+IC0tLQo+ID4gPj4gICBkcml2ZXJzL2FjcGkv
cGxhdGZvcm1fcHJvZmlsZS5jIHwgMyArKysKPiA+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQo+ID4gPj4KPiA+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvcGxhdGZv
cm1fcHJvZmlsZS5jCj4gPiA+PiBiL2RyaXZlcnMvYWNwaS9wbGF0Zm9ybV9wcm9maWxlLmMKPiA+
ID4+IGluZGV4IGZmYmZkMzJmNGNmMS4uYjQzZjQ0NTlhNGY2IDEwMDY0NAo+ID4gPj4gLS0tIGEv
ZHJpdmVycy9hY3BpL3BsYXRmb3JtX3Byb2ZpbGUuYwo+ID4gPj4gKysrIGIvZHJpdmVycy9hY3Bp
L3BsYXRmb3JtX3Byb2ZpbGUuYwo+ID4gPj4gQEAgLTY4OCw2ICs2ODgsOSBAQCBzdGF0aWMgaW50
IF9faW5pdCBwbGF0Zm9ybV9wcm9maWxlX2luaXQodm9pZCkKPiA+ID4+ICAgewo+ID4gPj4gICAg
ICAgaW50IGVycjsKPiA+ID4+ICAgKyAgICBpZiAoYWNwaV9kaXNhYmxlZCkKPiA+ID4+ICsgICAg
ICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiA+ID4+ICsKPiA+ID4+ICAgICAgIGVyciA9IGNsYXNz
X3JlZ2lzdGVyKCZwbGF0Zm9ybV9wcm9maWxlX2NsYXNzKTsKPiA+ID4+ICAgICAgIGlmIChlcnIp
Cj4gPiA+PiAgICAgICAgICAgcmV0dXJuIGVycjsKPiA+ID4KPiA+ID4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0Cj4gPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
