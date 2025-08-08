Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1257C87FCB
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 05:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZkae6R6bFvotMWfwpwn4T+6RE+LKSw913hDwneIRk8=; b=jy617JGejOC0/W
	zb3lOObT2eYvp00LbvqFvcffG3d3eqOXMvYTHUOOGxnmluAfAduxI20jqJ+Sy/z3onCtSiCKIliKJ
	u1NcmDobzhhxssH+Uxt4fDvP9kEMDG5ySZxLNTl2vkKIyoeFx09fNPBJPc8XAaZ7Y32I6ligkHPIQ
	zQ4k8rDsCEJN3NSKAz5PZwdi9vkSMqBBa9aoTemVqbUTYNIP5njzUlJq97lta+W8s8bRwYHJLmvYJ
	AWt+tMxoBTGVIPXW7Rh8XdjAxUEoRYTJ39vaXRTxG/bHUXRWfxkt6CJdcMxrFIPn/CrMUaZeVIGRy
	xWnKJaeLFwH3JWImORNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukFZP-000000021Mu-1hMT;
	Fri, 08 Aug 2025 05:23:11 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukFWu-0000000215r-06ID;
	Fri, 08 Aug 2025 05:20:37 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4bysTv1SGvz9sRs;
	Fri,  8 Aug 2025 07:07:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 136VSEc6Znrg; Fri,  8 Aug 2025 07:07:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4bysTv0NP1z9sRk;
	Fri,  8 Aug 2025 07:07:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E9F118B770;
	Fri,  8 Aug 2025 07:07:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ibwVE1n70MLp; Fri,  8 Aug 2025 07:07:30 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E61968B763;
	Fri,  8 Aug 2025 07:07:28 +0200 (CEST)
Message-ID: <07ffb27c-3416-43c9-a50a-164a76e5ab60@csgroup.eu>
Date: Fri, 8 Aug 2025 07:07:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] kasan: call kasan_init_generic in kasan_init
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, ryabinin.a.a@gmail.com,
 bhe@redhat.com, hca@linux.ibm.com, andreyknvl@gmail.com,
 akpm@linux-foundation.org, zhangqing@loongson.cn, chenhuacai@loongson.cn,
 davidgow@google.co, glider@google.com, dvyukov@google.com
Cc: alex@ghiti.fr, agordeev@linux.ibm.com, vincenzo.frascino@arm.com,
 elver@google.com, kasan-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mm@kvack.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20250807194012.631367-1-snovitoll@gmail.com>
 <20250807194012.631367-3-snovitoll@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250807194012.631367-3-snovitoll@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_222036_219072_50F4BD1F 
X-CRM114-Status: GOOD (  17.10  )
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

CgpMZSAwNy8wOC8yMDI1IMOgIDIxOjQwLCBTYWJ5cnpoYW4gVGFzYm9sYXRvdiBhIMOpY3JpdMKg
Ogo+IENhbGwga2FzYW5faW5pdF9nZW5lcmljKCkgd2hpY2ggaGFuZGxlcyBHZW5lcmljIEtBU0FO
IGluaXRpYWxpemF0aW9uLgo+IEZvciBhcmNoaXRlY3R1cmVzIHRoYXQgZG8gbm90IHNlbGVjdCBB
UkNIX0RFRkVSX0tBU0FOLAo+IHRoaXMgd2lsbCBiZSBhIG5vLW9wIGZvciB0aGUgcnVudGltZSBm
bGFnIGJ1dCB3aWxsCj4gcHJpbnQgdGhlIGluaXRpYWxpemF0aW9uIGJhbm5lci4KPiAKPiBGb3Ig
U1dfVEFHUyBhbmQgSFdfVEFHUyBtb2RlcywgdGhlaXIgcmVzcGVjdGl2ZSBpbml0IGZ1bmN0aW9u
cyB3aWxsCj4gaGFuZGxlIHRoZSBmbGFnIGVuYWJsaW5nLCBpZiB0aGV5IGFyZSBlbmFibGVkL2lt
cGxlbWVudGVkLgo+IAo+IENsb3NlczogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3df
YnVnLmNnaT9pZD0yMTcwNDkKPiBTaWduZWQtb2ZmLWJ5OiBTYWJ5cnpoYW4gVGFzYm9sYXRvdiA8
c25vdml0b2xsQGdtYWlsLmNvbT4KPiBUZXN0ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gIyByaXNjdgo+IEFja2VkLWJ5OiBBbGV4YW5kZXIgR29yZGVldiA8
YWdvcmRlZXZAbGludXguaWJtLmNvbT4gIyBzMzkwCj4gLS0tCj4gQ2hhbmdlcyBpbiB2NToKPiAt
IFVuaWZpZWQgYXJjaCBwYXRjaGVzIGludG8gYSBzaW5nbGUgb25lLCB3aGVyZSB3ZSBqdXN0IGNh
bGwKPiAJa2FzYW5faW5pdF9nZW5lcmljKCkKPiAtIEFkZGVkIFRlc3RlZC1ieSB0YWcgZm9yIHJp
c2N2ICh0ZXN0ZWQgdGhlIHNhbWUgY2hhbmdlIGluIHY0KQo+IC0gQWRkZWQgQWNrZWQtYnkgdGFn
IGZvciBzMzkwICh0ZXN0ZWQgdGhlIHNhbWUgY2hhbmdlIGluIHY0KQo+IC0tLQo+ICAgYXJjaC9h
cm0vbW0va2FzYW5faW5pdC5jICAgIHwgMiArLQo+ICAgYXJjaC9hcm02NC9tbS9rYXNhbl9pbml0
LmMgIHwgNCArLS0tCj4gICBhcmNoL3Jpc2N2L21tL2thc2FuX2luaXQuYyAgfCAxICsKPiAgIGFy
Y2gvczM5MC9rZXJuZWwvZWFybHkuYyAgICB8IDMgKystCj4gICBhcmNoL3g4Ni9tbS9rYXNhbl9p
bml0XzY0LmMgfCAyICstCj4gICBhcmNoL3h0ZW5zYS9tbS9rYXNhbl9pbml0LmMgfCAyICstCj4g
ICA2IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm0vbW0va2FzYW5faW5pdC5jIGIvYXJjaC9hcm0vbW0va2FzYW5f
aW5pdC5jCj4gaW5kZXggMTExZDRmNzAzMTMuLmM2NjI1ZTgwOGJmIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvYXJtL21tL2thc2FuX2luaXQuYwo+ICsrKyBiL2FyY2gvYXJtL21tL2thc2FuX2luaXQuYwo+
IEBAIC0zMDAsNiArMzAwLDYgQEAgdm9pZCBfX2luaXQga2FzYW5faW5pdCh2b2lkKQo+ICAgCWxv
Y2FsX2ZsdXNoX3RsYl9hbGwoKTsKPiAgIAo+ICAgCW1lbXNldChrYXNhbl9lYXJseV9zaGFkb3df
cGFnZSwgMCwgUEFHRV9TSVpFKTsKPiAtCXByX2luZm8oIktlcm5lbCBhZGRyZXNzIHNhbml0aXpl
ciBpbml0aWFsaXplZFxuIik7Cj4gICAJaW5pdF90YXNrLmthc2FuX2RlcHRoID0gMDsKPiArCWth
c2FuX2luaXRfZ2VuZXJpYygpOwo+ICAgfQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L21tL2th
c2FuX2luaXQuYyBiL2FyY2gvYXJtNjQvbW0va2FzYW5faW5pdC5jCj4gaW5kZXggZDU0MWNlNDVk
YWUuLmFiZWI4MWJmNmViIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvbW0va2FzYW5faW5pdC5j
Cj4gKysrIGIvYXJjaC9hcm02NC9tbS9rYXNhbl9pbml0LmMKPiBAQCAtMzk5LDE0ICszOTksMTIg
QEAgdm9pZCBfX2luaXQga2FzYW5faW5pdCh2b2lkKQo+ICAgewo+ICAgCWthc2FuX2luaXRfc2hh
ZG93KCk7Cj4gICAJa2FzYW5faW5pdF9kZXB0aCgpOwo+IC0jaWYgZGVmaW5lZChDT05GSUdfS0FT
QU5fR0VORVJJQykKPiArCWthc2FuX2luaXRfZ2VuZXJpYygpOwo+ICAgCS8qCj4gICAJICogR2Vu
ZXJpYyBLQVNBTiBpcyBub3cgZnVsbHkgaW5pdGlhbGl6ZWQuCj4gICAJICogU29mdHdhcmUgYW5k
IEhhcmR3YXJlIFRhZy1CYXNlZCBtb2RlcyBzdGlsbCByZXF1aXJlCj4gICAJICoga2FzYW5faW5p
dF9zd190YWdzKCkgYW5kIGthc2FuX2luaXRfaHdfdGFncygpIGNvcnJlc3BvbmRpbmdseS4KPiAg
IAkgKi8KPiAtCXByX2luZm8oIktlcm5lbEFkZHJlc3NTYW5pdGl6ZXIgaW5pdGlhbGl6ZWQgKGdl
bmVyaWMpXG4iKTsKPiAtI2VuZGlmCj4gICB9Cj4gICAKPiAgICNlbmRpZiAvKiBDT05GSUdfS0FT
QU5fR0VORVJJQyB8fCBDT05GSUdfS0FTQU5fU1dfVEFHUyAqLwo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L21tL2thc2FuX2luaXQuYyBiL2FyY2gvcmlzY3YvbW0va2FzYW5faW5pdC5jCj4gaW5k
ZXggNDFjNjM1ZDZhY2EuLmJhMjcwOWIxZWVjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0v
a2FzYW5faW5pdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9rYXNhbl9pbml0LmMKPiBAQCAtNTMw
LDYgKzUzMCw3IEBAIHZvaWQgX19pbml0IGthc2FuX2luaXQodm9pZCkKPiAgIAo+ICAgCW1lbXNl
dChrYXNhbl9lYXJseV9zaGFkb3dfcGFnZSwgS0FTQU5fU0hBRE9XX0lOSVQsIFBBR0VfU0laRSk7
Cj4gICAJaW5pdF90YXNrLmthc2FuX2RlcHRoID0gMDsKPiArCWthc2FuX2luaXRfZ2VuZXJpYygp
OwoKSSB1bmRlcnN0b29kIEtBU0FOIGlzIHJlYWxseSByZWFkeSB0byBmdW5jdGlvbiBvbmx5IG9u
Y2UgdGhlIGNzcl93cml0ZSgpIAphbmQgbG9jYWxfZmx1c2hfdGxiX2FsbCgpIGJlbG93IGFyZSBk
b25lLiBTaG91bGRuJ3Qga2FzYW5faW5pdF9nZW5lcmljKCkgCmJlIGNhbGxlZCBhZnRlciBpdCA/
Cgo+ICAgCj4gICAJY3NyX3dyaXRlKENTUl9TQVRQLCBQRk5fRE9XTihfX3BhKHN3YXBwZXJfcGdf
ZGlyKSkgfCBzYXRwX21vZGUpOwo+ICAgCWxvY2FsX2ZsdXNoX3RsYl9hbGwoKTsKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9zMzkwL2tlcm5lbC9lYXJseS5jIGIvYXJjaC9zMzkwL2tlcm5lbC9lYXJseS5j
Cj4gaW5kZXggOWFkZmJkZDM3N2QuLjU0NGU1NDAzZGQ5IDEwMDY0NAo+IC0tLSBhL2FyY2gvczM5
MC9rZXJuZWwvZWFybHkuYwo+ICsrKyBiL2FyY2gvczM5MC9rZXJuZWwvZWFybHkuYwo+IEBAIC0y
MSw2ICsyMSw3IEBACj4gICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICAjaW5jbHVkZSA8
YXNtL2FzbS1leHRhYmxlLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvbWVtYmxvY2suaD4KPiArI2lu
Y2x1ZGUgPGxpbnV4L2thc2FuLmg+Cj4gICAjaW5jbHVkZSA8YXNtL2FjY2Vzcy1yZWdzLmg+Cj4g
ICAjaW5jbHVkZSA8YXNtL2FzbS1vZmZzZXRzLmg+Cj4gICAjaW5jbHVkZSA8YXNtL21hY2hpbmUu
aD4KPiBAQCAtNjUsNyArNjYsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQga2FzYW5fZWFybHlfaW5p
dCh2b2lkKQo+ICAgewo+ICAgI2lmZGVmIENPTkZJR19LQVNBTgo+ICAgCWluaXRfdGFzay5rYXNh
bl9kZXB0aCA9IDA7Cj4gLQlwcl9pbmZvKCJLZXJuZWxBZGRyZXNzU2FuaXRpemVyIGluaXRpYWxp
emVkXG4iKTsKPiArCWthc2FuX2luaXRfZ2VuZXJpYygpOwo+ICAgI2VuZGlmCj4gICB9Cj4gICAK
PiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvbW0va2FzYW5faW5pdF82NC5jIGIvYXJjaC94ODYvbW0v
a2FzYW5faW5pdF82NC5jCj4gaW5kZXggMDUzOWVmZDBkMjEuLjk5OGI2MDEwZDZkIDEwMDY0NAo+
IC0tLSBhL2FyY2gveDg2L21tL2thc2FuX2luaXRfNjQuYwo+ICsrKyBiL2FyY2gveDg2L21tL2th
c2FuX2luaXRfNjQuYwo+IEBAIC00NTEsNSArNDUxLDUgQEAgdm9pZCBfX2luaXQga2FzYW5faW5p
dCh2b2lkKQo+ICAgCV9fZmx1c2hfdGxiX2FsbCgpOwo+ICAgCj4gICAJaW5pdF90YXNrLmthc2Fu
X2RlcHRoID0gMDsKPiAtCXByX2luZm8oIktlcm5lbEFkZHJlc3NTYW5pdGl6ZXIgaW5pdGlhbGl6
ZWRcbiIpOwo+ICsJa2FzYW5faW5pdF9nZW5lcmljKCk7Cj4gICB9Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gveHRlbnNhL21tL2thc2FuX2luaXQuYyBiL2FyY2gveHRlbnNhL21tL2thc2FuX2luaXQuYwo+
IGluZGV4IGYzOWM0ZDgzMTczLi4wNTI0YjllZDVlNiAxMDA2NDQKPiAtLS0gYS9hcmNoL3h0ZW5z
YS9tbS9rYXNhbl9pbml0LmMKPiArKysgYi9hcmNoL3h0ZW5zYS9tbS9rYXNhbl9pbml0LmMKPiBA
QCAtOTQsNSArOTQsNSBAQCB2b2lkIF9faW5pdCBrYXNhbl9pbml0KHZvaWQpCj4gICAKPiAgIAkv
KiBBdCB0aGlzIHBvaW50IGthc2FuIGlzIGZ1bGx5IGluaXRpYWxpemVkLiBFbmFibGUgZXJyb3Ig
bWVzc2FnZXMuICovCj4gICAJY3VycmVudC0+a2FzYW5fZGVwdGggPSAwOwo+IC0JcHJfaW5mbygi
S2VybmVsQWRkcmVzc1Nhbml0aXplciBpbml0aWFsaXplZFxuIik7Cj4gKwlrYXNhbl9pbml0X2dl
bmVyaWMoKTsKPiAgIH0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
