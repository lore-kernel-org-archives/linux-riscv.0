Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846A4C61CE7
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbb2ae5YtjyEEaftWawihT8bkXNtDfWXjOCcoqhpDH0=; b=Et+opaoxYmXoj0
	sjVgNjNYaKi/E9M0E14Jw9whMwDaRt/rkhxlQrppLXVGHGYAitsdrY3gO+QwLtRTmcsFnrVCg77FX
	OG5dRsfFijE6M+m9Ige6j7IIjSnRuedxuN9hsB9d6qcLzZY8qOl6bUAatkME6x66iKDv5GOzpdjWg
	aaUxFoFh6Bydr4B0sUE2YzYqckt+PpyU3L0XkNBRG73mJt9a6sq7OXDFS20s8mGe9fiBm41iMBlWJ
	15OC8UtkHNB+q5iyqYBdt6de/2ARRpJEjp9TDBFwM0haMfzqVAmFlOIj6JRq5+MU07oG0tDquyEKe
	s57nX7kHSwlIIvn82qEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNuTY-00000001lD6-43OO;
	Sat, 07 Jun 2025 14:24:48 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNuLh-00000001kiN-1zQy
	for linux-riscv@lists.infradead.org;
	Sat, 07 Jun 2025 14:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1749305799;
	bh=JWEOaaLt4BDnVdW8Y37Y6nzHvOr5CYTYqnL4sURAwu8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=PeG+dtO+FStFd8BBtOFfJzSwzCx2XDnw5DNnQaeg2A/I3tfjzfW41TSAxLB0IG6Mv
	 fJy/nRJ53oIWpjPaIa2aeT1yKyXhiJmP9sA5fMx2239cDgeFtaEOVl2Mf5s3pllC/S
	 b/7+oAQ33E9CG+EaEap0pOSaxfSBeGE2I/kZlHqw=
Received: from [192.168.124.38] (unknown [113.200.174.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 7913065F62;
	Sat,  7 Jun 2025 10:16:37 -0400 (EDT)
Message-ID: <6163d55a1e7910f89dda114a2ee52c9df5235dad.camel@xry111.site>
Subject: Re: [PATCH v2] RISC-V: vDSO: Correct inline assembly constraints in
 the getrandom syscall wrapper
From: Xi Ruoyao <xry111@xry111.site>
To: Vineet Gupta <vineetg@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
	 <thomas.weissschuh@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Paul Walmsley
	 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren
	 <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Sat, 07 Jun 2025 22:16:34 +0800
In-Reply-To: <94f9af73-0b2d-484c-ba1d-d4435908336b@rivosinc.com>
References: <20250605091112-7cd6b3bd-a466-486a-aebc-7bf0b2a8ac31@linutronix.de>
	 <20250606092443.73650-2-xry111@xry111.site>
	 <94f9af73-0b2d-484c-ba1d-d4435908336b@rivosinc.com>
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_071641_538941_FC7FB230 
X-CRM114-Status: GOOD (  21.05  )
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

T24gRnJpLCAyMDI1LTA2LTA2IGF0IDE1OjAxIC0wNzAwLCBWaW5lZXQgR3VwdGEgd3JvdGU6Cj4g
T24gNi82LzI1IDAyOjI0LCBYaSBSdW95YW8gd3JvdGU6Cj4gPiBBcyByZWNlbnRseSBwb2ludGVk
IG91dCBieSBUaG9tYXMsIGlmIGEgcmVnaXN0ZXIgaXMgZm9yY2VkIGZvciB0d28KPiA+IGRpZmZl
cmVudCByZWdpc3RlciB2YXJpYWJsZXMsIGFtb25nIHRoZW0gb25lIGlzIHVzZWQgYXMgIisiIChi
b3RoIGlucHV0Cj4gPiBhbmQgb3V0cHV0KSBhbmQgYW5vdGhlciBpcyBvbmx5IHVzZWQgYXMgaW5w
dXQsIENsYW5nIHdvdWxkIHRyZWF0IHRoZQo+ID4gY29uZmxpY3RpbmcgaW5wdXQgcGFyYW1ldGVy
cyBhcyB1bmRlZmluZWQgYmVoYXZpb3VyIGFuZCBvcHRpbWl6ZSBhd2F5Cj4gPiB0aGUgYXJndW1l
bnQgYXNzaWdubWVudC4KPiA+IAo+ID4gUGVyIGFuIGV4YW1wbGUgaW4gdGhlIEdDQyBkb2N1bWVu
dGF0aW9uLCBmb3IgdGhpcyBwdXJwb3NlIHdlIGNhbiB1c2UgIj0iCj4gPiAob25seSBvdXRwdXQp
IGZvciB0aGUgb3V0cHV0LCBhbmQgIjAiIGZvciB0aGUgaW5wdXQgZm9yIHRoYXQgd2UgbXVzdAo+
ID4gcmV1c2UgdGhlIHNhbWUgcmVnaXN0ZXIgYXMgdGhlIG91dHB1dC7CoCBBbmQgR0NDIGRldmVs
b3BlcnMgaGF2ZQo+ID4gY29uZmlybWVkIHVzaW5nIGEgc2ltcGxlICJyIiAodGhhdCB3ZSB1c2Ug
Zm9yIG1vc3QgdkRTTyBpbXBsZW1lbnRhdGlvbnMpCj4gPiBpbnN0ZWFkIG9mICIwIiBpcyBhbHNv
IGZpbmUuCj4gPiAKPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDYw
My1sb29uZ2FyY2gtdmRzby1zeXNjYWxsLXYxLTEtNmQxMmQ2ZGZiZGQwQGxpbnV0cm9uaXguZGUv
Cj4gPiBMaW5rOiBodHRwczovL2djYy5nbnUub3JnL29ubGluZWRvY3MvZ2NjLTE1LjEuMC9nY2Mv
TG9jYWwtUmVnaXN0ZXItVmFyaWFibGVzLmh0bWwKPiA+IExpbms6IGh0dHBzOi8vZ2NjLmdudS5v
cmcvcGlwZXJtYWlsL2djYy1oZWxwLzIwMjUtSnVuZS8xNDQyNjYuaHRtbAo+ID4gQ2M6IFRob21h
cyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPgo+ID4gQ2M6IE5h
dGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IFhp
IFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPgo+ID4gLS0tCj4gPiAKPiA+IHYxIC0+IHYyOiBL
ZWVwIHVzaW5nICJyIiBmb3IgYnVmZmVyIHRvIGZvbGxvdyB0aGUgZXhpc3RpbmcgY29udmVudGlv
bgo+ID4gKHRoYXQgdGhlIEdDQyBkZXZlbG9wZXJzIGhhdmUgY29uZmlybWVkIGZpbmUpLgo+ID4g
Cj4gPiDCoGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20uaCB8IDIgKy0KPiA+
IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vZ2V0cmFuZG9tLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vZ2V0cmFuZG9tLmgKPiA+IGluZGV4IDhkYzkyNDQx
NzAyYS4uYzZkNjY4OTVjMWY1IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS92ZHNvL2dldHJhbmRvbS5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28v
Z2V0cmFuZG9tLmgKPiA+IEBAIC0xOCw3ICsxOCw3IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUg
c3NpemVfdCBnZXRyYW5kb21fc3lzY2FsbCh2b2lkICpfYnVmZmVyLCBzaXplX3QgX2xlbiwgdW5z
Cj4gPiDCoAlyZWdpc3RlciB1bnNpZ25lZCBpbnQgZmxhZ3MgYXNtKCJhMiIpID0gX2ZsYWdzOwo+
ID4gwqAKPiA+IMKgCWFzbSB2b2xhdGlsZSAoImVjYWxsXG4iCj4gPiAtCQnCoMKgwqDCoMKgIDog
IityIiAocmV0KQo+ID4gKwkJwqDCoMKgwqDCoCA6ICI9ciIgKHJldCkKPiA+IMKgCQnCoMKgwqDC
oMKgIDogInIiIChuciksICJyIiAoYnVmZmVyKSwgInIiIChsZW4pLCAiciIgKGZsYWdzKQo+ID4g
wqAJCcKgwqDCoMKgwqAgOiAibWVtb3J5Iik7Cj4gCj4gTXkgMiBjZW50cyBhcyBJJ3ZlIGRhYmJs
ZWQgaW50byB0aGlzIGZvciBBUkMgZ2xpYmMgc3lzY2FsbCBtYWNyb3MgWzFdIHdoZXJlIHIwCj4g
aXMgYm90aCB0aGUgZmlyc3Qgc3lzY2FsbC9mdW5jdGlvbiBhcmcgYW5kIGFsc28gdGhlIGZ1bmN0
aW9uL3N5c2NhbGwgcmV0dXJuLgo+IAo+IFRoZSB2MiBhcHByb2FjaCBzdGlsbCBrZWVwcyAyIGRp
ZmZlcmVudCB2YXJpYWJsZXMgaW4gc2FtZSBsb2NhbCByZWcgd2hpY2ggaGFzCj4gcG90ZW50aWFs
IGZvciBhbnkgZnV0dXJlIGNvbXBpbGVyIHNoZW5hbmlnYW5zLgo+IFNlZ2hlcidzIGV4YW1wbGUg
YXZvaWRlZCBzcGVjaWZ5aW5nIHRoZSBzYW1lIHJlZy4KPiBXaGF0IGFib3V0IHNvbWV0aGluZyBs
aWtlIHRoZSBmb2xsb3dpbmc6IHNlZW1zIHRvIGdlbmVyYXRlIHRoZSByaWdodCBjb2RlICh3aXRo
Cj4gZ2NjIDE1KQo+IAo+IMKgwqDCoMKgwqDCoCByZWdpc3RlciBsb25nIHJldCBhc20oImEwIik7
CgpUaGVuIGl0IHdvdWxkIGJlIGJldHRlciB0byByZW5hbWUgdGhpcyB2YXJpYWJsZSB0byBqdXN0
ICJhMCIuICBBbmQgSQpndWVzcyBUaG9tYXMgZG9lc24ndCB3YW50IGEgbmV3IGNvbnZlbnRpb24g
ZGlmZmVyZW50IGZyb20gYWxsIG90aGVyCnN5c2NhbGwgd3JhcHBlcnMgaW4gdkRTTy4uLgoKPiDC
oMKgwqDCoMKgwqAgcmVnaXN0ZXIgbG9uZyBuciBhc20oImE3IikgPSBfX05SX2dldHJhbmRvbTsK
PiDCoMKgwqDCoMKgwqAgcmVnaXN0ZXIgc2l6ZV90IGxlbiBhc20oImExIikgPSBfbGVuOwo+IMKg
wqDCoMKgwqDCoCByZWdpc3RlciB1bnNpZ25lZCBpbnQgZmxhZ3MgYXNtKCJhMiIpID0gX2ZsYWdz
Owo+IMKgwqDCoMKgwqDCoCByZXQgPSAodW5zaWduZWQgbG9uZykgX2J1ZmZlcjsKPiAKPiDCoMKg
wqDCoMKgwqAgYXNtIHZvbGF0aWxlICgiZWNhbGxcbiIKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDogIityIiAocmV0KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8ga2VlcCAiK3IiCj4gZm9y
IGlucHV0IF9idWZmZXIgLyBvdXRwdXQgcmV0Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA6ICJyIiAobnIpLCAiciIgKGxlbiksICJyIiAoZmxhZ3MpCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6ICJtZW1vcnkiKTsKPiAKPiDCoMKg
wqDCoMKgwqAgcmV0dXJuIHJldDsKPiAKPiBUaHgsCj4gLVZpbmVldAo+IAo+IFsxXSBodHRwczov
L2dpdGh1Yi5jb20vYm1pbm9yL2dsaWJjL2Jsb2IvbWFzdGVyL3N5c2RlcHMvdW5peC9zeXN2L2xp
bnV4L2FyYy9zeXNkZXAuaAoKLS0gClhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRlPgpTY2hv
b2wgb2YgQWVyb3NwYWNlIFNjaWVuY2UgYW5kIFRlY2hub2xvZ3ksIFhpZGlhbiBVbml2ZXJzaXR5
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
