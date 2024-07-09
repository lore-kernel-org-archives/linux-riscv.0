Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504DFC3DA42
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 19:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tV7PR8V4Els5ZcnBHAwxZaPgi9LysW4f8xBrFRnWr70=; b=GFVtyyPzX5uDlf
	xbi719ETO+eMa/Q4mlJPE4tArqtfTPxAYj/loQaauEQH3dcRfqATfUpM8Zk+xTtW45dcOVw5YKTEA
	7SISPoxSOrONt9Ob0SxufIrMZzXdMNIGyeSnpdIZi2fqxq1jA6hF9wn8G3CngMm5dpnoeNuRMI0x/
	sFNo+iJPHg6AuaQgwL9Hp8N0MYfBWHCv1spJ5Kat2d0/0s8bld8ar9r9L6itNrgWZ+AEiifujAqd0
	U99XwcDOwiv0Ln4JzirOMrNPUYZ1wxBCimcjoSK1379IMCugGo7R/Y7tTYQ9jrwx/gWVmefwv6vp6
	LtVUrY+vF7YddDanZBrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRGpL-00000008R84-2BUK;
	Tue, 09 Jul 2024 19:48:39 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRGpH-00000008R6a-3TY5
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 19:48:37 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WJWkg1HkPz9sSr;
	Tue,  9 Jul 2024 21:48:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xf_IeGqSmWKy; Tue,  9 Jul 2024 21:48:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WJWkg01nkz9sSq;
	Tue,  9 Jul 2024 21:48:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A3C098B778;
	Tue,  9 Jul 2024 21:48:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id NiN-SJ2v4SUl; Tue,  9 Jul 2024 21:48:26 +0200 (CEST)
Received: from [192.168.233.17] (unknown [192.168.233.17])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4FBE08B773;
	Tue,  9 Jul 2024 21:48:26 +0200 (CEST)
Message-ID: <56a0340a-2534-4d2e-92e4-cf27a6358b23@csgroup.eu>
Date: Tue, 9 Jul 2024 21:48:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mm: Add p{g/4}d_leaf() in
 asm-generic/pgtable-nop{4/u}d.h
To: Peter Xu <peterx@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, Oscar Salvador <osalvador@suse.de>
References: <b601e1a88e3a5d4d93b130fa20184b555e2a2bea.1720074307.git.christophe.leroy@csgroup.eu>
 <c8cb83b709740f7ac835997b88c5ddda610f66ab.1720074307.git.christophe.leroy@csgroup.eu>
 <Zoa2Qnpzl97hmpHC@x1n>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <Zoa2Qnpzl97hmpHC@x1n>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_124836_044413_C03D4458 
X-CRM114-Status: GOOD (  18.33  )
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

CgpMZSAwNC8wNy8yMDI0IMOgIDE2OjQ4LCBQZXRlciBYdSBhIMOpY3JpdMKgOgo+IE9uIFRodSwg
SnVsIDA0LCAyMDI0IGF0IDA4OjMwOjA1QU0gKzAyMDAsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6
Cj4+IENvbW1pdCAyYzhhODFkYzBjYzUgKCJyaXNjdi9tbTogZml4IHR3byBwYWdlIHRhYmxlIGNo
ZWNrIHJlbGF0ZWQKPj4gaXNzdWVzIikgYWRkZWQgcHVkX2xlYWYoKSBpbiBpbmNsdWRlL2FzbS1n
ZW5lcmljL3BndGFibGUtbm9wbWQuaAo+Pgo+PiBEbyB0aGUgc2FtZSBmb3IgcDRkX2xlYWYoKSBh
bmQgcGdkX2xlYWYoKSB0byBhdm9pZCBnZXR0aW5nIHRoZW0KPj4gZXJyb25lb3VzbHkgZGVmaW5l
ZCBieSBhcmNoaXRlY3R1cmVzIHRoYXQgZG8gbm90IGltcGxlbWVudCB0aGUKPj4gcmVsYXRlZCBw
YWdlIGxldmVsLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+Cj4+IC0tLQo+PiAgIGluY2x1ZGUvYXNtLWdlbmVyaWMvcGd0
YWJsZS1ub3A0ZC5oIHwgMSArCj4+ICAgaW5jbHVkZS9hc20tZ2VuZXJpYy9wZ3RhYmxlLW5vcHVk
LmggfCAxICsKPj4gICBpbmNsdWRlL2xpbnV4L3BndGFibGUuaCAgICAgICAgICAgICB8IDYgKysr
LS0tCj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2FzbS1nZW5lcmljL3BndGFibGUtbm9wNGQuaCBi
L2luY2x1ZGUvYXNtLWdlbmVyaWMvcGd0YWJsZS1ub3A0ZC5oCj4+IGluZGV4IDAzYjdkYWU0N2Rk
NC4uNzVjOTZiYmM1YTk2IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2FzbS1nZW5lcmljL3BndGFi
bGUtbm9wNGQuaAo+PiArKysgYi9pbmNsdWRlL2FzbS1nZW5lcmljL3BndGFibGUtbm9wNGQuaAo+
PiBAQCAtMjEsNiArMjEsNyBAQCB0eXBlZGVmIHN0cnVjdCB7IHBnZF90IHBnZDsgfSBwNGRfdDsK
Pj4gICBzdGF0aWMgaW5saW5lIGludCBwZ2Rfbm9uZShwZ2RfdCBwZ2QpCQl7IHJldHVybiAwOyB9
Cj4+ICAgc3RhdGljIGlubGluZSBpbnQgcGdkX2JhZChwZ2RfdCBwZ2QpCQl7IHJldHVybiAwOyB9
Cj4+ICAgc3RhdGljIGlubGluZSBpbnQgcGdkX3ByZXNlbnQocGdkX3QgcGdkKQl7IHJldHVybiAx
OyB9Cj4+ICtzdGF0aWMgaW5saW5lIGludCBwZ2RfbGVhZihwZ2RfdCBwZ2QpCQl7IHJldHVybiAw
OyB9Cj4+ICAgc3RhdGljIGlubGluZSB2b2lkIHBnZF9jbGVhcihwZ2RfdCAqcGdkKQl7IH0KPj4g
ICAjZGVmaW5lIHA0ZF9FUlJPUihwNGQpCQkJCShwZ2RfRVJST1IoKHA0ZCkucGdkKSkKPj4gICAK
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvcGd0YWJsZS1ub3B1ZC5oIGIvaW5j
bHVkZS9hc20tZ2VuZXJpYy9wZ3RhYmxlLW5vcHVkLmgKPj4gaW5kZXggZWI3MGM2ZDdjZWZmLi4x
NGFlYjhlZjJkOGEgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvYXNtLWdlbmVyaWMvcGd0YWJsZS1u
b3B1ZC5oCj4+ICsrKyBiL2luY2x1ZGUvYXNtLWdlbmVyaWMvcGd0YWJsZS1ub3B1ZC5oCj4+IEBA
IC0yOCw2ICsyOCw3IEBAIHR5cGVkZWYgc3RydWN0IHsgcDRkX3QgcDRkOyB9IHB1ZF90Owo+PiAg
IHN0YXRpYyBpbmxpbmUgaW50IHA0ZF9ub25lKHA0ZF90IHA0ZCkJCXsgcmV0dXJuIDA7IH0KPj4g
ICBzdGF0aWMgaW5saW5lIGludCBwNGRfYmFkKHA0ZF90IHA0ZCkJCXsgcmV0dXJuIDA7IH0KPj4g
ICBzdGF0aWMgaW5saW5lIGludCBwNGRfcHJlc2VudChwNGRfdCBwNGQpCXsgcmV0dXJuIDE7IH0K
Pj4gK3N0YXRpYyBpbmxpbmUgaW50IHA0ZF9sZWFmKHA0ZF90IHA0ZCkJCXsgcmV0dXJuIDA7IH0K
Pj4gICBzdGF0aWMgaW5saW5lIHZvaWQgcDRkX2NsZWFyKHA0ZF90ICpwNGQpCXsgfQo+PiAgICNk
ZWZpbmUgcHVkX0VSUk9SKHB1ZCkJCQkJKHA0ZF9FUlJPUigocHVkKS5wNGQpKQo+PiAgIAo+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmggYi9pbmNsdWRlL2xpbnV4L3BndGFi
bGUuaAo+PiBpbmRleCAyYTZhM2NjY2ZjMzYuLmIyN2U2NmY1NDJkNiAxMDA2NDQKPj4gLS0tIGEv
aW5jbHVkZS9saW51eC9wZ3RhYmxlLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9wZ3RhYmxlLmgK
Pj4gQEAgLTE4ODIsMTMgKzE4ODIsMTMgQEAgdHlwZWRlZiB1bnNpZ25lZCBpbnQgcGd0YmxfbW9k
X21hc2s7Cj4+ICAgICogLSBJdCBzaG91bGQgY292ZXIgYWxsIGtpbmRzIG9mIGh1Z2UgbWFwcGlu
Z3MgKGUuZy4sIHBYZF90cmFuc19odWdlKCksCj4+ICAgICogICBwWGRfZGV2bWFwKCksIG9yIGh1
Z2V0bGIgbWFwcGluZ3MpLgo+PiAgICAqLwo+PiAtI2lmbmRlZiBwZ2RfbGVhZgo+PiArI2lmICFk
ZWZpbmVkKF9fUEFHRVRBQkxFX1A0RF9GT0xERUQpICYmICFkZWZpbmVkKHBnZF9sZWFmKQo+PiAg
ICNkZWZpbmUgcGdkX2xlYWYoeCkJZmFsc2UKPj4gICAjZW5kaWYKPj4gLSNpZm5kZWYgcDRkX2xl
YWYKPj4gKyNpZiAhZGVmaW5lZChfX1BBR0VUQUJMRV9QVURfRk9MREVEKSAmJiAhZGVmaW5lZChw
NGRfbGVhZikKPj4gICAjZGVmaW5lIHA0ZF9sZWFmKHgpCWZhbHNlCj4+ICAgI2VuZGlmCj4+IC0j
aWZuZGVmIHB1ZF9sZWFmCj4+ICsjaWYgIWRlZmluZWQoX19QQUdFVEFCTEVfUE1EX0ZPTERFRCkg
JiYgIWRlZmluZWQocHVkX2xlYWYpCj4+ICAgI2RlZmluZSBwdWRfbGVhZih4KQlmYWxzZQo+PiAg
ICNlbmRpZgo+PiAgICNpZm5kZWYgcG1kX2xlYWYKPiAKPiBJcyBpdCBwb3NzaWJsZSB0byBkbyBp
dCB0aGUgb3RoZXIgd2F5IHJvdW5kLCBzbyB0aGF0IHdlIGNhbiBzdGlsbCByZWx5IG9uCj4gImlm
ZGVmIHB4eF9sZWFmIiB0byBkZWNpZGUgd2hldGhlciB0byBwcm92aWRlIGEgZmFsbGJhY2ssIGFu
ZCBkZWZpbmUgdGhlbQo+IHByb3Blcmx5IHdoZW4gbmVlZGVkPwoKV2hhdCBkbyB5b3UgbWVhbiBi
eSB0aGUgIm90aGVyIHdheSByb3VuZCIgPyBEaWQgSSBkbyBhIG1pc3Rha2UgPyBJIGNhbid0IApz
ZWUgaXQuCgpUaGUgcHVycG9zZSBoZXJlIGlzOgotIElmIHRoZSBhcmNoaXRlY3R1cmUgaGFzIHRo
ZSBzYWlkIGxldmVsIGFuZCBpbXBsZW1lbnRzIHBYZF9sZWFmKCksIAp0aGF0J3MgZmluZQotIElm
IHRoZSBhcmNoaXRlY3R1cmUgaGFzIHRoZSBzYWlkIGxldmVsIGFuZCBkb2Vzbid0IGltcGxlbWVu
dCAKcFhkX2xlYWYoKSwgdGhhdCdzIGFsc28gZmluZSwgYSBmYWxsYmFjayBpcyBwcm92aWRlZC4K
LSBJZiB0aGUgYXJjaGl0ZWN0dXJlIGRvZXNuJ3QgaGF2ZSB0aGUgc2FpZCBsZXZlbCBidXQgaW1w
bGVtZW50cyAKcFhkX2xlYWYoKSwgaXQgd2lsbCBjb25mbGljdCB3aXRoIHRoZSBkZWZpbml0aW9u
IGluIAppbmNsdWRlL2FzbS1nZW5lcmljL3BndGFibGUtbm9wWGQuaCBhbmQgdGhlIGJ1aWxkIHdp
bGwgZmFpbC4KClRoZSBwdXJwb3NlIGlzIHRvIG1ha2Ugc3VyZSBhcmNoaXRlY3R1cmVzIGRvbid0
IGltcGxlbWVudCBwWGRfbGVhZigpIGF0IAp0aGUgd3JvbmcgbGV2ZWwsIGZvciBpbnN0YW5jZToK
LSBhbiBhcmNoaXRlY3R1cmUgd2l0aG91dCBQTURzIHNoYWxsIG5vdCBpbXBsZW1lbnQgYW55dGhp
bmcgZWxzZSB0aGFuIApwbWRfbGVhZigpCi0gYW4gYXJjaGl0ZWN0dXJlIHdpdGhvdXQgUDREcyBz
aGFsbCBub3QgaW1wbGVtZW50IHBnZF9sZWFmKCkuCgoKPiAKPiBJTUhPIGl0IHdhcyBhIG5lYXQg
d2F5IHRvIGF2b2lkIHdvcnJ5aW5nIG9uIGFueSBtYWNybyBkZWZpbmVkOyBpdCdsbCBiZSBhcwo+
IHNpbXBsZSBhcyAiaWYgZnVuY3Rpb24geHh4IG5vdCBkZWZpbmVkLCBsZXQncyBkZWZpbmUgYSBm
YWxsYmFjayBmb3IgeHh4Ii4KPiBQZXIgbXkgbGltaXRlZCBleHBlcmllbmNlIGl0IGhlbHBlZCBh
IGxvdCBvbiBhdm9pZCBjb21waWxlIGlzc3VlcyBoZXJlIGFuZAo+IHRoZXJlLi4KClRoYXQgd2ls
bCBzdGlsbCBiZSB0aGUgY2FzZS4KClRoaXMgcGF0Y2ggYWRkczogImlmIGZ1bmN0aW9uIHh4eCBp
cyBkZWZpbmVkIGZvciB3cm9uZyBsZXZlbCwgYnJlYWsgdGhlIApidWlsZCIKCkNocmlzdG9waGUK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
