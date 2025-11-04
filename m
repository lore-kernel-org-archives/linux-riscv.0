Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EDCCCFA00
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 06:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRaZUpQia/oKruB38T2z17e5LV/l0NehRw9UupMbVKI=; b=KonPOgJ59spJR3
	cQ9heTZh/64iUKq6l/XfvwefF/58fzYvjtLNN5mwEh/JIBMnCpzydaUTQJpzU/E+m8R41eQGdAZTm
	7i0BW6ZDTdwCVKPbPJh9ht7ApS1z/RvIU4A/7odaFjCJ95RpKrBX/NvnHPmIK0MFowbelnsBQJyvZ
	fas87T5NVEbFOR0sj/8O38SCfSRomrytplORbYG8I3LJ7oGyV3ds+HwQ/zrdZujFZd1zF+qwrtEtE
	jVI+6+u2zCYqYUBpyGzbJrmsJPNzu40HPFKezjUlRLa9m/bZmn5FXksD2/RIDGQqXfwLX9No+HuJy
	0uJmVW6QPuCzo6m1EA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGArs-0000000BGSw-0wOE;
	Tue, 04 Nov 2025 06:50:12 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGAro-0000000BGQx-4C8U;
	Tue, 04 Nov 2025 06:50:10 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d0yqn4Hdvz9sSL;
	Tue,  4 Nov 2025 07:15:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KvWCvtBuZZqr; Tue,  4 Nov 2025 07:15:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d0yqn3J6sz9sS8;
	Tue,  4 Nov 2025 07:15:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 595658B76C;
	Tue,  4 Nov 2025 07:15:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fIxXjoi-bve2; Tue,  4 Nov 2025 07:15:33 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E3778B763;
	Tue,  4 Nov 2025 07:15:31 +0100 (CET)
Message-ID: <f8872b02-d7f5-421d-8699-5d27987c6e1f@csgroup.eu>
Date: Tue, 4 Nov 2025 07:15:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 04/12] powerpc/uaccess: Use unsafe wrappers for ASM
 GOTO
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.356628509@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251027083745.356628509@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_225009_199027_0EFE6D2A 
X-CRM114-Status: GOOD (  14.24  )
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

CgpMZSAyNy8xMC8yMDI1IMOgIDA5OjQzLCBUaG9tYXMgR2xlaXhuZXIgYSDDqWNyaXTCoDoKPiBB
U00gR09UTyBpcyBtaXNjb21waWxlZCBieSBHQ0Mgd2hlbiBpdCBpcyB1c2VkIGluc2lkZSBhIGF1
dG8gY2xlYW51cCBzY29wZToKPiAKPiBib29sIGZvbyh1MzIgX191c2VyICpwLCB1MzIgdmFsKQo+
IHsKPiAJc2NvcGVkX2d1YXJkKHBhZ2VmYXVsdCkKPiAJCXVuc2FmZV9wdXRfdXNlcih2YWwsIHAs
IGVmYXVsdCk7Cj4gCXJldHVybiB0cnVlOwo+IGVmYXVsdDoKPiAJcmV0dXJuIGZhbHNlOwo+IH0K
PiAKPiBJdCBlbmRzIHVwIGxlYWtpbmcgdGhlIHBhZ2VmYXVsdCBkaXNhYmxlIGNvdW50ZXIgaW4g
dGhlIGZhdWx0IHBhdGguIGNsYW5nCj4gYXQgbGVhc3QgZmFpbHMgdGhlIGJ1aWxkLgoKQ29uZmly
bWVkIG9uIHBvd2VycGM6CgpCZWZvcmUgdGhlIHBhdGNoCgowMDAwMDFlOCA8Zm9vPjoKICAxZTg6
CTgxIDIyIDA1IDI0IAlsd3ogICAgIHI5LDEzMTYocjIpCiAgMWVjOgkzOSAyOSAwMCAwMSAJYWRk
aSAgICByOSxyOSwxCiAgMWYwOgk5MSAyMiAwNSAyNCAJc3R3ICAgICByOSwxMzE2KHIyKQogIDFm
NDoJOTAgODMgMDAgMDAgCXN0dyAgICAgcjQsMChyMykKICAxZjg6CTgxIDIyIDA1IDI0IAlsd3og
ICAgIHI5LDEzMTYocjIpCiAgMWZjOgkzOCA2MCAwMCAwMSAJbGkgICAgICByMywxCiAgMjAwOgkz
OSAyOSBmZiBmZiAJYWRkaSAgICByOSxyOSwtMQogIDIwNDoJOTEgMjIgMDUgMjQgCXN0dyAgICAg
cjksMTMxNihyMikKICAyMDg6CTRlIDgwIDAwIDIwIAlibHIKICAyMGM6CTM4IDYwIDAwIDAwIAls
aSAgICAgIHIzLDAKICAyMTA6CTRlIDgwIDAwIDIwIAlibHIKCjAwMDAwMDAwIDxfX2V4X3RhYmxl
PjoKICAgICAgICAgLi4uCiAgICAgICAgICAgICAgICAgICAgICAgICAyMDogUl9QUENfUkVMMzIg
LnRleHQrMHgxZjQKICAgICAgICAgICAgICAgICAgICAgICAgIDI0OiBSX1BQQ19SRUwzMiAudGV4
dCsweDIwYwoKQWZ0ZXIgdGhlIHBhdGNoCgowMDAwMDFlOCA8Zm9vPjoKICAxZTg6CTgxIDIyIDA1
IDI0IAlsd3ogICAgIHI5LDEzMTYocjIpCiAgMWVjOgkzOSAyOSAwMCAwMSAJYWRkaSAgICByOSxy
OSwxCiAgMWYwOgk5MSAyMiAwNSAyNCAJc3R3ICAgICByOSwxMzE2KHIyKQogIDFmNDoJOTAgODMg
MDAgMDAgCXN0dyAgICAgcjQsMChyMykKICAxZjg6CTgxIDIyIDA1IDI0IAlsd3ogICAgIHI5LDEz
MTYocjIpCiAgMWZjOgkzOCA2MCAwMCAwMSAJbGkgICAgICByMywxCiAgMjAwOgkzOSAyOSBmZiBm
ZiAJYWRkaSAgICByOSxyOSwtMQogIDIwNDoJOTEgMjIgMDUgMjQgCXN0dyAgICAgcjksMTMxNihy
MikKICAyMDg6CTRlIDgwIDAwIDIwIAlibHIKICAyMGM6CTgxIDIyIDA1IDI0IAlsd3ogICAgIHI5
LDEzMTYocjIpCiAgMjEwOgkzOCA2MCAwMCAwMCAJbGkgICAgICByMywwCiAgMjE0OgkzOSAyOSBm
ZiBmZiAJYWRkaSAgICByOSxyOSwtMQogIDIxODoJOTEgMjIgMDUgMjQgCXN0dyAgICAgcjksMTMx
NihyMikKICAyMWM6CTRlIDgwIDAwIDIwIAlibHIKCjAwMDAwMDAwIDxfX2V4X3RhYmxlPjoKICAg
ICAgICAgLi4uCiAgICAgICAgICAgICAgICAgICAgICAgICAyMDogUl9QUENfUkVMMzIgLnRleHQr
MHgxZjQKICAgICAgICAgICAgICAgICAgICAgICAgIDI0OiBSX1BQQ19SRUwzMiAudGV4dCsweDIw
YwoKCgo+IAo+IFJlbmFtZSB1bnNhZmVfKl91c2VyKCkgdG8gYXJjaF91bnNhZmVfKl91c2VyKCkg
d2hpY2ggbWFrZXMgdGhlIGdlbmVyaWMKPiB1YWNjZXNzIGhlYWRlciB3cmFwIGl0IHdpdGggYSBs
b2NhbCBsYWJlbCB0aGF0IG1ha2VzIGJvdGggY29tcGlsZXJzIGVtaXQKPiBjb3JyZWN0IGNvZGUu
IFNhbWUgZm9yIHRoZSBrZXJuZWxfbm9mYXVsdCgpIHZhcmlhbnRzLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IENjOiBNYWRoYXZhbiBT
cmluaXZhc2FuIDxtYWRkeUBsaW51eC5pYm0uY29tPgo+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxt
cGVAZWxsZXJtYW4uaWQuYXU+Cj4gQ2M6IE5pY2hvbGFzIFBpZ2dpbiA8bnBpZ2dpbkBnbWFpbC5j
b20+Cj4gQ2M6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4K
PiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKClJldmlld2VkLWJ5OiBDaHJpc3Rv
cGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+CgoKPiAtLS0KPiAgIGFyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS91YWNjZXNzLmggfCAgICA4ICsrKystLS0tCj4gICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IC0tLSBhL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiArKysgYi9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vdWFjY2Vzcy5oCj4gQEAgLTQ1MSw3ICs0NTEsNyBAQCB1c2VyX3dyaXRlX2FjY2Vzc19i
ZWdpbihjb25zdCB2b2lkIF9fdXNlCj4gICAjZGVmaW5lIHVzZXJfd3JpdGVfYWNjZXNzX2JlZ2lu
CXVzZXJfd3JpdGVfYWNjZXNzX2JlZ2luCj4gICAjZGVmaW5lIHVzZXJfd3JpdGVfYWNjZXNzX2Vu
ZAkJcHJldmVudF9jdXJyZW50X3dyaXRlX3RvX3VzZXIKPiAgIAo+IC0jZGVmaW5lIHVuc2FmZV9n
ZXRfdXNlcih4LCBwLCBlKSBkbyB7CQkJCQlcCj4gKyNkZWZpbmUgYXJjaF91bnNhZmVfZ2V0X3Vz
ZXIoeCwgcCwgZSkgZG8gewkJCVwKPiAgIAlfX2xvbmdfdHlwZSgqKHApKSBfX2d1X3ZhbDsJCQkJ
XAo+ICAgCV9fdHlwZW9mX18oKihwKSkgX191c2VyICpfX2d1X2FkZHIgPSAocCk7CQlcCj4gICAJ
CQkJCQkJCVwKPiBAQCAtNDU5LDcgKzQ1OSw3IEBAIHVzZXJfd3JpdGVfYWNjZXNzX2JlZ2luKGNv
bnN0IHZvaWQgX191c2UKPiAgIAkoeCkgPSAoX190eXBlb2ZfXygqKHApKSlfX2d1X3ZhbDsJCQlc
Cj4gICB9IHdoaWxlICgwKQo+ICAgCj4gLSNkZWZpbmUgdW5zYWZlX3B1dF91c2VyKHgsIHAsIGUp
IFwKPiArI2RlZmluZSBhcmNoX3Vuc2FmZV9wdXRfdXNlcih4LCBwLCBlKQkJCQlcCj4gICAJX19w
dXRfdXNlcl9zaXplX2dvdG8oKF9fdHlwZW9mX18oKihwKSkpKHgpLCAocCksIHNpemVvZigqKHAp
KSwgZSkKPiAgIAo+ICAgI2RlZmluZSB1bnNhZmVfY29weV9mcm9tX3VzZXIoZCwgcywgbCwgZSkg
XAo+IEBAIC01MDQsMTEgKzUwNCwxMSBAQCBkbyB7CQkJCQkJCQkJXAo+ICAgCQl1bnNhZmVfcHV0
X3VzZXIoKih1OCopKF9zcmMgKyBfaSksICh1OCBfX3VzZXIgKikoX2RzdCArIF9pKSwgZSk7IFwK
PiAgIH0gd2hpbGUgKDApCj4gICAKPiAtI2RlZmluZSBfX2dldF9rZXJuZWxfbm9mYXVsdChkc3Qs
IHNyYywgdHlwZSwgZXJyX2xhYmVsKQkJCVwKPiArI2RlZmluZSBhcmNoX2dldF9rZXJuZWxfbm9m
YXVsdChkc3QsIHNyYywgdHlwZSwgZXJyX2xhYmVsKQkJXAo+ICAgCV9fZ2V0X3VzZXJfc2l6ZV9n
b3RvKCooKHR5cGUgKikoZHN0KSksCQkJCVwKPiAgIAkJKF9fZm9yY2UgdHlwZSBfX3VzZXIgKiko
c3JjKSwgc2l6ZW9mKHR5cGUpLCBlcnJfbGFiZWwpCj4gICAKPiAtI2RlZmluZSBfX3B1dF9rZXJu
ZWxfbm9mYXVsdChkc3QsIHNyYywgdHlwZSwgZXJyX2xhYmVsKQkJCVwKPiArI2RlZmluZSBhcmNo
X3B1dF9rZXJuZWxfbm9mYXVsdChkc3QsIHNyYywgdHlwZSwgZXJyX2xhYmVsKQkJXAo+ICAgCV9f
cHV0X3VzZXJfc2l6ZV9nb3RvKCooKHR5cGUgKikoc3JjKSksCQkJCVwKPiAgIAkJKF9fZm9yY2Ug
dHlwZSBfX3VzZXIgKikoZHN0KSwgc2l6ZW9mKHR5cGUpLCBlcnJfbGFiZWwpCj4gICAKPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
