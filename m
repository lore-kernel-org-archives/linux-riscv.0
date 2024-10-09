Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387CCCED62A
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 08:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7fEmPc1aLraassu9igQTz9Vj1Cga665zQ1261e5QWOY=; b=l4RY2CYikR6srn
	HYh+z0Hmt9h8jBe2XJrJgEccGNb/nqa0LEbHMcyXn2OgtNwD6ki/NZc7EtEgypgu8gZUyir8kFKcv
	5+v8ojkF5Qa085Wu9g4jvPoKsdQjvi8dVtzfd5UA26s2L39YZ35cJrSKUuwP9olXmZzrUa9pwq0M8
	Quddk5MCyaz71f+Rhos6GdbCShPmIgOWlBoPaHvvx9w3jITRO35/PJL5Z9qd9wQY1u40iNJaECRkr
	Ge5hEQj20ACfxfdjIOthosT1PK4OgL90T7wPCky2l85HXlGz7pjpgCyiHJvA9pe7Dh2jvqWizXJBj
	mlDv1GoMBrIlqt8i3lFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syRu6-00000008PZn-2xtU;
	Wed, 09 Oct 2024 08:18:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syRm6-00000008Nhd-0FVQ
	for linux-riscv@bombadil.infradead.org;
	Wed, 09 Oct 2024 08:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ty3nReGQTh8ZNQVVmvPZVCoAhzePqtF3iQ3Qs53FumA=; b=TG2Bz0FvRfzVKqbGETPJ+GBXfW
	P/dqQ95edavqmAmwqT9ZiedDaYHYwhO56tMYAcwBCAYJm7V6jxc4hwnlV02YLBKlI5Vng9Oz67C/0
	A2aXMgXgoDc+gT2Ce846UyKYzuc935f1sh/l0IUXpV6p494NZmujeI+JmpADWV57NRNvQ9il290GC
	ytMQXEWGJ0JomRo2xEEhfhhRhETPezUvUTnqTy2EmNoTphRcQBevYFwXT9bwCOELbb+tqqhjP+KH4
	AphWXJhFBSYri/fGDMoh9Te4ZqXdd9kqIelThsRu2Cp5FpCKJW8oSsfxYL2Tu9yk5gVJvwa6/+dH2
	1E0ZQcDA==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syRm1-00000004qhE-29Ei
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 08:10:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E9941BF20C;
	Wed,  9 Oct 2024 08:10:15 +0000 (UTC)
Message-ID: <c4906bfc-5bc1-428e-a76f-3fb0bb8711ac@ghiti.fr>
Date: Wed, 9 Oct 2024 10:10:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
 <250e1e5d-5110-414f-abbd-fb002e715f32@ghiti.fr>
In-Reply-To: <250e1e5d-5110-414f-abbd-fb002e715f32@ghiti.fr>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_091021_696639_26B81B5D 
X-CRM114-Status: GOOD (  17.05  )
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

T24gMDkvMTAvMjAyNCAwOTo0NiwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEhpIENvbm9yLAo+
Cj4gT24gMDEvMTAvMjAyNCAxMzoyOCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+PiBGcm9tOiBDb25v
ciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Pgo+PiBEdXJpbmcgdGhlIGRp
c2N1c3Npb24gYmVmb3JlIHN1cHBvcnRpbmcgcnVzdCBvbiByaXNjdiwgaXQgd2FzIGRlY2lkZWQK
Pj4gbm90IHRvIHN1cHBvcnQgZ2NjIHlldCwgZHVlIHRvIGRpZmZlcmVuY2VzIGluIGV4dGVuc2lv
biBoYW5kbGluZwo+PiBjb21wYXJlZCB0byBsbHZtIChvbmx5IHRoZSB2ZXJzaW9uIG9mIGxpYmNs
YW5nIG1hdGNoaW5nIHRoZSBjIGNvbXBpbGVyCj4+IGlzIHN1cHBvcnRlZCkuIFJlY2VudGx5IEph
c29uIE1vbnRsZW9uIHJlcG9ydGVkIFsxXSB0aGF0IGJ1aWxkaW5nIHdpdGgKPj4gZ2NjIGNhdXNl
ZCBidWlsZCBpc3N1ZXMsIGR1ZSB0byB1bnN1cHBvcnRlZCBhcmd1bWVudHMgYmVpbmcgcGFzc2Vk
IHRvCj4+IGxpYmNsYW5nLiBBZnRlciBzb21lIGRpc2N1c3Npb24gYmV0d2VlbiBteXNlbGYgYW5k
IE1pZ3VlbAo+Cj4KPiBJIGhhdmUganVzdCBhZGRlZCAiWzJdIiBoZXJlIGFzIGl0IHNlZW1lZCB0
byBiZSBtaXNzaW5nLgo+Cj4gVGhhbmtzLAo+Cj4gQWxleAo+Cj4KPj4gLCBpdCBpcyBiZXR0ZXIK
Pj4gdG8gZGlzYWJsZSBnY2MgKyBydXN0IGJ1aWxkcyB0byBtYXRjaCB0aGUgb3JpZ2luYWwgaW50
ZW50LCBhbmQKPj4gc3Vic2VxdWVudGx5IHN1cHBvcnQgaXQgd2hlbiBhbiBhcHByb3ByaWF0ZSBz
ZXQgb2YgZXh0ZW5zaW9ucyBjYW4gYmUKPj4gZGVkdWNlZCBmcm9tIHRoZSB2ZXJzaW9uIG9mIGxp
YmNsYW5nLgo+Pgo+PiBDbG9zZXM6IAo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NDA5MTcwMDA4NDguNzIwNzY1LTItam1vbnRsZW9AcmVkaGF0LmNvbS8gCj4+IFsxXQo+PiBMaW5r
OiAKPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwOTI2LWJhdHRlcmluZy1yZXZv
bHQtNmM2YTc4Mjc0MTNlQHNwdWQvIAo+PiBbMl0KPj4gRml4ZXM6IDcwYTU3YjI0NzI1MWEgKCJS
SVNDLVY6IGVuYWJsZSBidWlsZGluZyA2NC1iaXQga2VybmVscyB3aXRoIAo+PiBydXN0IHN1cHBv
cnQiKQoKCkkgYWxzbyBmaXhlZCB0aGUgRml4ZXMgdGFnIF4sIGl0IGNvbnRhaW5zIDEzIGNoYXJh
Y3RlcnMgaW5zdGVhZCBvZiAxMiAKYW5kIGFkZGVkIGEgY2M6IHN0YWJsZSB0YWcuCgoKPj4gUmVw
b3J0ZWQtYnk6IEphc29uIE1vbnRsZW9uIDxqbW9udGxlb0ByZWRoYXQuY29tPgoKCkFuZCBJIG1v
dmVkIHRoaXMgdGFnIGFib3ZlIHRoZSBDbG9zZXMgdGFnLgoKVGhhbmtzLAoKQWxleAoKCj4+IFNp
Z25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4+
IC0tLQo+Pgo+PiBQYWxtZXIsIHRoaXMgaXMgeW91cnMgdG8gdGFrZS4KPj4KPj4gQ0M6IGptb250
bGVvQHJlZGhhdC5jb20KPj4gQ0M6IG9qZWRhQGtlcm5lbC5vcmcKPj4gQ0M6IGFsZXguZ2F5bm9y
QGdtYWlsLmNvbQo+PiBDQzogYm9xdW4uZmVuZ0BnbWFpbC5jb20KPj4gQ0M6IGdhcnlAZ2FyeWd1
by5uZXQKPj4gQ0M6IGJqb3JuM19naEBwcm90b25tYWlsLmNvbQo+PiBDQzogYmVubm8ubG9zc2lu
QHByb3Rvbi5tZQo+PiBDQzogYS5oaW5kYm9yZ0BrZXJuZWwub3JnCj4+IENDOiBhbGljZXJ5aGxA
Z29vZ2xlLmNvbQo+PiBDQzogcGF1bC53YWxtc2xleUBzaWZpdmUuY29tCj4+IENDOiBwYWxtZXJA
ZGFiYmVsdC5jb20KPj4gQ0M6IG5hdGhhbkBrZXJuZWwub3JnCj4+IENDOiBuZGVzYXVsbmllcnNA
Z29vZ2xlLmNvbQo+PiBDQzogbW9yYm9AZ29vZ2xlLmNvbQo+PiBDQzoganVzdGluc3RpdHRAZ29v
Z2xlLmNvbQo+PiBDQzogcnVzdC1mb3ItbGludXhAdmdlci5rZXJuZWwub3JnCj4+IENDOiBsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IENDOiBsbHZtQGxpc3RzLmxpbnV4LmRldgo+
PiAtLS0KPj4gwqAgRG9jdW1lbnRhdGlvbi9ydXN0L2FyY2gtc3VwcG9ydC5yc3QgfCAyICstCj4+
IMKgIGFyY2gvcmlzY3YvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCAyICstCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ydXN0L2FyY2gtc3VwcG9ydC5y
c3QgCj4+IGIvRG9jdW1lbnRhdGlvbi9ydXN0L2FyY2gtc3VwcG9ydC5yc3QKPj4gaW5kZXggNzUw
ZmYzNzE1NzBhMC4uNTRiZTdkZGYzZTU3YSAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9y
dXN0L2FyY2gtc3VwcG9ydC5yc3QKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9ydXN0L2FyY2gtc3Vw
cG9ydC5yc3QKPj4gQEAgLTE3LDcgKzE3LDcgQEAgQXJjaGl0ZWN0dXJlwqDCoCBMZXZlbCBvZiBz
dXBwb3J0wqAgQ29uc3RyYWludHMKPj4gwqAgPT09PT09PT09PT09PcKgID09PT09PT09PT09PT09
PT0gCj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPj4g
wqAgYGBhcm02NGBgwqDCoMKgwqDCoCBNYWludGFpbmVkwqDCoMKgwqDCoMKgwqAgTGl0dGxlIEVu
ZGlhbiBvbmx5Lgo+PiDCoCBgYGxvb25nYXJjaGBgwqAgTWFpbnRhaW5lZMKgwqDCoMKgwqDCoMKg
IFwtCj4+IC1gYHJpc2N2YGDCoMKgwqDCoMKgIE1haW50YWluZWTCoMKgwqDCoMKgwqDCoCBgYHJp
c2N2NjRgYCBvbmx5Lgo+PiArYGByaXNjdmBgwqDCoMKgwqDCoCBNYWludGFpbmVkwqDCoMKgwqDC
oMKgwqAgYGByaXNjdjY0YGAgYW5kIExMVk0vQ2xhbmcgb25seS4KPj4gwqAgYGB1bWBgwqDCoMKg
wqDCoMKgwqDCoCBNYWludGFpbmVkwqDCoMKgwqDCoMKgwqAgXC0KPj4gwqAgYGB4ODZgYMKgwqDC
oMKgwqDCoMKgIE1haW50YWluZWTCoMKgwqDCoMKgwqDCoCBgYHg4Nl82NGBgIG9ubHkuCj4+IMKg
ID09PT09PT09PT09PT3CoCA9PT09PT09PT09PT09PT09IAo+PiA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tj
b25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gaW5kZXggMjJkYzVlYTQxOTZjZS4uNzY4NDM1
ODQ5NjBjMiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4+ICsrKyBiL2FyY2gv
cmlzY3YvS2NvbmZpZwo+PiBAQCAtMTc3LDcgKzE3Nyw3IEBAIGNvbmZpZyBSSVNDVgo+PiDCoMKg
wqDCoMKgIHNlbGVjdCBIQVZFX1JFR1NfQU5EX1NUQUNLX0FDQ0VTU19BUEkKPj4gwqDCoMKgwqDC
oCBzZWxlY3QgSEFWRV9SRVRIT09LIGlmICFYSVBfS0VSTkVMCj4+IMKgwqDCoMKgwqAgc2VsZWN0
IEhBVkVfUlNFUQo+PiAtwqDCoMKgIHNlbGVjdCBIQVZFX1JVU1QgaWYgUlVTVENfU1VQUE9SVFNf
UklTQ1YKPj4gK8KgwqDCoCBzZWxlY3QgSEFWRV9SVVNUIGlmIFJVU1RDX1NVUFBPUlRTX1JJU0NW
ICYmIENDX0lTX0NMQU5HCj4+IMKgwqDCoMKgwqAgc2VsZWN0IEhBVkVfU0FNUExFX0ZUUkFDRV9E
SVJFQ1QKPj4gwqDCoMKgwqDCoCBzZWxlY3QgSEFWRV9TQU1QTEVfRlRSQUNFX0RJUkVDVF9NVUxU
SQo+PiDCoMKgwqDCoMKgIHNlbGVjdCBIQVZFX1NUQUNLUFJPVEVDVE9SCj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
