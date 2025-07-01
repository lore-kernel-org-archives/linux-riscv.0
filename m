Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA5BC8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 10:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQBliB+CNbcoECbJFbc0WPBWCxywzFm+TXJVtIzwFbQ=; b=bJZdg5suYl6Hfb
	IBACpyQ99maQ8w/8SKkYIkFHLuI87giz16u5P0ItPAADm23PsUuPXqGTRr/ViEzX7vTSGj7KCD1sq
	kjiFDUMFgNjxoCITc4zNYIqMofF7B2+97JT8QBnnPzxX43WRuUgEr+KGSHezuIEhv635aAala0uRI
	li6k0fveADah32znpo1u+g96lWircMDqo6ZYryaRiIGgmuBwjDygABIjKlEYsjVA/oRr9bIHS/de8
	DTP7NmtWbUuKdH30XmkypyZFQS+6cO3shyz5oBNyCm588U5WawDywJm2J16Yj5AN0LUIcFyCHXph3
	yRvzeZ+opmF1SkxOBZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYad-00000004nY5-2xBG;
	Tue, 01 Jul 2025 10:51:51 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYZR-00000004nKc-2iuj;
	Tue, 01 Jul 2025 10:50:39 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bWfLS0w8tz9v4p;
	Tue,  1 Jul 2025 12:25:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fGrApOKWjGf3; Tue,  1 Jul 2025 12:25:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bWfLR2br0z9tCl;
	Tue,  1 Jul 2025 12:25:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A0538B766;
	Tue,  1 Jul 2025 12:25:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id jqdQfO1FQCoF; Tue,  1 Jul 2025 12:25:35 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C5E958B763;
	Tue,  1 Jul 2025 12:25:32 +0200 (CEST)
Message-ID: <0400f0be-6b63-4bc7-846e-8852e1d01485@csgroup.eu>
Date: Tue, 1 Jul 2025 12:25:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] kasan: unify kasan_arch_is_ready with
 kasan_enabled
To: Heiko Carstens <hca@linux.ibm.com>,
 Andrey Konovalov <andreyknvl@gmail.com>
Cc: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, ryabinin.a.a@gmail.com,
 glider@google.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com,
 akpm@linux-foundation.org, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 arnd@arndb.de, rppt@kernel.org, geert@linux-m68k.org, mcgrof@kernel.org,
 guoweikang.kernel@gmail.com, tiwei.btw@antgroup.com, kevin.brodsky@arm.com,
 benjamin.berg@intel.com, kasan-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mm@kvack.org, llvm@lists.linux.dev
References: <20250626153147.145312-1-snovitoll@gmail.com>
 <CA+fCnZfAtKWx=+to=XQBREhou=Snb0Yms4D8GNGaxE+BQUYm4A@mail.gmail.com>
 <CACzwLxgsVkn98VDPpmm7pKcbvu87UBwPgYJmLfKixu4-x+yjSA@mail.gmail.com>
 <CA+fCnZcGyTECP15VMSPh+duLmxNe=ApHfOnbAY3NqtFHZvceZw@mail.gmail.com>
 <20250701101537.10162Aa0-hca@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250701101537.10162Aa0-hca@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_035037_837885_9DC7DBB2 
X-CRM114-Status: GOOD (  27.38  )
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

CgpMZSAwMS8wNy8yMDI1IMOgIDEyOjE1LCBIZWlrbyBDYXJzdGVucyBhIMOpY3JpdMKgOgo+Pj4+
IEFub3RoZXIgdGhpbmcgdGhhdCBuZWVkcyBjYXJlZnVsIGNvbnNpZGVyYXRpb24gaXMgd2hldGhl
ciBpdCdzCj4+Pj4gcG9zc2libGUgdG8gY29tYmluZSBrYXNhbl9hcmNoX2lzX3JlYWR5KCkgYW5k
IGthc2FuX2VuYWJsZWQoKSBpbnRvIHRoZQo+Pj4+IHNhbWUgY2hlY2sgbG9naWNhbGx5IGF0IGFs
bC4gVGhlcmUncyBvbmUgaXNzdWUgbWVudGlvbmVkIGluIFsxXToKPj4+Cj4+PiBIZWxsbywKPj4+
IEkndmUgcmVtb3ZlZCBrYXNhbl9hcmNoX2lzX3JlYWR5KCkgYXQgYWxsIGluIHRoaXMgc2VyaWVz
Ogo+Pj4gW1BBVENIIHYyIDExLzExXSBrYXNhbjogcmVwbGFjZSBrYXNhbl9hcmNoX2lzX3JlYWR5
IHdpdGgga2FzYW5fZW5hYmxlZAo+Pj4KPj4+IElzIGl0IG5vdCB3aGF0J3MgZXhwZWN0ZWQgYnkg
dW5pZmljYXRpb24/Cj4+Cj4+IEkgZ3Vlc3MgdGhlIGlzc3VlIGRlc2NyaXB0aW9uIGRpdmVyZ2Vk
IGEgYml0IGZyb20gd2hhdCBuZWVkcyB0byBiZQo+PiBkb25lLCBzb3JyeSBhYm91dCB0aGF0Lgo+
Pgo+PiBUaGUgY29yZSAyIHRoaW5ncyBJIHdhbnRlZCB0byBhZGRyZXNzIHdpdGggdGhlIHVuaWZp
Y2F0aW9uIGFyZToKPj4KPj4gMS4gQXZvaWQgc3ByYXlpbmcga2FzYW5fYXJjaF9pc19yZWFkeSgp
IHRocm91Z2hvdXQgdGhlIEtBU0FOCj4+IGltcGxlbWVudGF0aW9uIGFuZCBtb3ZlIHRoZXNlIGNo
ZWNrcyBpbnRvIGluY2x1ZGUvbGludXgva2FzYW4uaCAoYW5kCj4+IGFkZCBfX3dyYXBwZXJzIHdo
ZW4gcmVxdWlyZWQpLgo+Pgo+PiAyLiBBdm9pZCBhcmNoaXRlY3R1cmVzIHJlZGVmaW5pbmcgdGhl
IHNhbWUga2FzYW5fZW5hYmxlZCBnbG9iYWwKPj4gdmFyaWFibGUvc3RhdGljIGtleS4KPj4KPj4g
SW5pdGlhbGx5LCBJIHRob3VnaHQgdGhhdCBzL2thc2FuX2FyY2hfaXNfcmVhZHkva2FzYW5fZW5h
YmxlZCArIHNpbXBseQo+PiBtb3ZpbmcgdGhlIGNhbGxzIGludG8gYWZmZWN0ZWQgaW5jbHVkZS9s
aW51eC9rYXNhbi5oIGZ1bmN0aW9ucyB3b3VsZAo+PiBiZSBlbm91Z2guIEJ1dCB0aGVuLCBiYXNl
ZCBvbiBbMV0sIHR1cm5zIG91dCBpdCdzIG5vdCB0aGF0IHNpbXBsZS4KPj4KPj4gU28gbm93LCBJ
IHRoaW5rIHdlIGxpa2VseSBzdGlsbCBuZWVkIHR3byBzZXBhcmF0ZSBjaGVja3MvZmxhZ3M6Cj4+
IGthc2FuX2VuYWJsZWQoKSB0aGF0IGNvbnRyb2xzIHdoZXRoZXIgS0FTQU4gaXMgZW5hYmxlZCBh
dCBhbGwgYW5kCj4+IGthc2FuX2FyY2hfaXNfcmVhZHkoKSB0aGF0IGdldHMgdHVybmVkIG9uIGJ5
IGthc2FuX2luaXQoKSB3aGVuIHNoYWRvdwo+PiBpcyBpbml0aWFsaXplZCAoc2hvdWxkIHdlIHJl
bmFtZSBpdCB0byBrYXNhbl9zaGFkb3dfaW5pdGlhbGl6ZWQoKT8pLgo+PiBCdXQgdGhlbiB3ZSBj
YW4gc3RpbGwgbW92ZSBrYXNhbl9hcmNoX2lzX3JlYWR5KCkgaW50bwo+PiBpbmNsdWRlL2xpbnV4
L2thc2FuLmggYW5kIHVzZSB0aGUgcHJvcGVyIGNvbWJpbmF0aW9uIG9mIGNoZWNrcyBmb3IKPj4g
ZWFjaCBhZmZlY3RlZCBmdW5jdGlvbiBiZWZvcmUgY2FsbGluZyBfX3dyYXBwZXJzLiBBbmQgd2Ug
Y2FuIHN0aWxsCj4+IHJlbW92ZSB0aGUgZHVwbGljYXRlZCBmbGFncy9rZXlzIGNvZGUgZnJvbSB0
aGUgYXJjaCBjb2RlLgo+IAo+IEZXSVcsIGFzIEFsZXhhbmRlciBHb3JkZWV2IGFscmVhZHkgbWVu
dGlvbmVkOiB0aGlzIHNlcmllcyBicmVha3MgczM5MCwKPiBzaW5jZSB0aGUgc3RhdGljX2JyYW5j
aF9lbmFibGUoKSBjYWxsIGluIGthc2FuX2luaXRfZ2VuZXJpYygpIGlzIG5vdwo+IGNhbGxlZCB3
YXkgdG9vIGVhcmx5LCBhbmQgaXQgaXNuJ3QgbmVjZXNzYXJ5IGF0IGFsbC4gV2hpY2gsIGFzIGZh
ciBhcwo+IEkgdW5kZXJzdGFuZCwgbWF5IGJlIHRoZSBjYXNlIGZvciBvdGhlciBhcmNoaXRlY3R1
cmVzIGFzIHdlbGwuIHMzOTAKPiBzZXRzIHVwIHRoZSByZXF1aXJlZCBLQVNBTiBtYXBwaW5ncyBp
biB0aGUgZGVjb21wcmVzc29yIGFuZCBjYW4gc3RhcnQKPiB3aXRoIEtBU0FOIGVuYWJsZWQgbmVh
cmx5IGZyb20gdGhlIGJlZ2lubmluZy4KPiAKPiBTbyBzb21ldGhpbmcgbGlrZSBiZWxvdyBvbiB0
b3Agb2YgdGhpcyBzZXJpZXMgd291bGQgYWRkcmVzcwo+IHRoYXQuIEdpdmVuIHRoYXQgdGhpcyBz
ZXJpZXMgaXMgYWJvdXQgdG8gYmUgcmV3b3JrZWQgdGhpcyBpcyBqdXN0IGZvcgo+IGlsbHVzdHJh
dGlvbiA6KQoKSSBoYWQgdGhlIHNhbWUga2luZCBvZiBjb21tZW50IG9uIHBvd2VycGMvMzIuIEFs
bHRob3VnaCB0aGlzIHNlcmllcyB3b3JrIApvbiBwb3dlcnBjMzIgYXMgaXMsIGl0IGlzIG92ZXJr
aWxsIGJlY2F1c2UgaXQgYWRkcyBjb2RlIGFuZCBkYXRhIGZvciAKc3RhdGljIGJyYW5jaGVzIGZv
ciBubyByZWFsIGJlbmVmaXQuCgpZb3VyIHBhdGNoIGJlbG93IGlzIHNpbXBsZXIgdGhhbiB3aGF0
IEkgcHJvcG9zZWQsIGJ1dCBpdCBrZWVwcyB0aGUgCnN0YXRpYyBicmFuY2hlcyBzbyB0aGUgb3Zl
cmhlYWQgcmVtYWlucy4KCkkgYWxzbyBwcm9wb3NlZCBhIGNoYW5nZSwgaXQgZ29lcyBmdXJ0aGVy
IGJ5IHJlbW92aW5nIHRoZSBzdGF0aWMgYnJhbmNoIApmb3IgYXJjaGl0ZWN0dXJlcyB0aGF0IGRv
bid0IG5lZWQgaXQsIHNlZSAKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xp
bnV4cHBjLWRldi9jb3Zlci8yMDI1MDYyNjE1MzE0Ny4xNDUzMTItMS1zbm92aXRvbGxAZ21haWwu
Y29tLyMzNTM3Mzg4IAouIEZlZWRiYWNrIHdlbGNvbWUuCgpDaHJpc3RvcGhlCgo+IAo+IGRpZmYg
LS1naXQgYS9hcmNoL3MzOTAvS2NvbmZpZyBiL2FyY2gvczM5MC9LY29uZmlnCj4gaW5kZXggMGMx
NmRjNDQzZTJmLi5jMmY1MWFjMzlhOTEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9zMzkwL0tjb25maWcK
PiArKysgYi9hcmNoL3MzOTAvS2NvbmZpZwo+IEBAIC0xNzIsNiArMTcyLDcgQEAgY29uZmlnIFMz
OTAKPiAgIAlzZWxlY3QgSEFWRV9BUkNIX0pVTVBfTEFCRUwKPiAgIAlzZWxlY3QgSEFWRV9BUkNI
X0pVTVBfTEFCRUxfUkVMQVRJVkUKPiAgIAlzZWxlY3QgSEFWRV9BUkNIX0tBU0FOCj4gKwlzZWxl
Y3QgSEFWRV9BUkNIX0tBU0FOX0VBUkxZCj4gICAJc2VsZWN0IEhBVkVfQVJDSF9LQVNBTl9WTUFM
TE9DCj4gICAJc2VsZWN0IEhBVkVfQVJDSF9LQ1NBTgo+ICAgCXNlbGVjdCBIQVZFX0FSQ0hfS01T
QU4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rYXNhbi1lbmFibGVkLmggYi9pbmNsdWRl
L2xpbnV4L2thc2FuLWVuYWJsZWQuaAo+IGluZGV4IDI0MzZlYjQ1Y2ZlZS4uMDQ5MjcwYTIyNjlm
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgva2FzYW4tZW5hYmxlZC5oCj4gKysrIGIvaW5j
bHVkZS9saW51eC9rYXNhbi1lbmFibGVkLmgKPiBAQCAtMTAsNyArMTAsMTEgQEAKPiAgICAqIEds
b2JhbCBydW50aW1lIGZsYWcuIFN0YXJ0cyDigJhmYWxzZeKAmTsgc3dpdGNoZWQgdG8g4oCYdHJ1
ZeKAmSBieQo+ICAgICogdGhlIGFwcHJvcHJpYXRlIGthc2FuX2luaXRfKigpIG9uY2UgS0FTQU4g
aXMgZnVsbHkgaW5pdGlhbGl6ZWQuCj4gICAgKi8KPiArI2lmZGVmIENPTkZJR19IQVZFX0FSQ0hf
S0FTQU5fRUFSTFkKPiArREVDTEFSRV9TVEFUSUNfS0VZX1RSVUUoa2FzYW5fZmxhZ19lbmFibGVk
KTsKPiArI2Vsc2UKPiAgIERFQ0xBUkVfU1RBVElDX0tFWV9GQUxTRShrYXNhbl9mbGFnX2VuYWJs
ZWQpOwo+ICsjZW5kaWYKPiAgIAo+ICAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIGthc2Fu
X2VuYWJsZWQodm9pZCkKPiAgIHsKPiBkaWZmIC0tZ2l0IGEvbGliL0tjb25maWcua2FzYW4gYi9s
aWIvS2NvbmZpZy5rYXNhbgo+IGluZGV4IGY4Mjg4OWE4MzBmYS4uMTQwNzM3NGU4M2I5IDEwMDY0
NAo+IC0tLSBhL2xpYi9LY29uZmlnLmthc2FuCj4gKysrIGIvbGliL0tjb25maWcua2FzYW4KPiBA
QCAtNCw2ICs0LDEzIEBACj4gICBjb25maWcgSEFWRV9BUkNIX0tBU0FOCj4gICAJYm9vbAo+ICAg
Cj4gK2NvbmZpZyBIQVZFX0FSQ0hfS0FTQU5fRUFSTFkKPiArCWJvb2wKPiArCWhlbHAKPiArCSAg
QXJjaGl0ZWN0dXJlcyBzaG91bGQgc2VsZWN0IHRoaXMgaWYgS0FTQU4gbWFwcGluZ3MgYXJlIHNl
dHVwIGluCj4gKwkgIHRoZSBkZWNvbXByZXNzb3IgYW5kIHdoZW4gdGhlIGtlcm5lbCBjYW4gcnVu
IHZlcnkgZWFybHkgd2l0aAo+ICsJICBLQVNBTiBlbmFibGVkLgo+ICsKPiAgIGNvbmZpZyBIQVZF
X0FSQ0hfS0FTQU5fU1dfVEFHUwo+ICAgCWJvb2wKPiAgIAo+IGRpZmYgLS1naXQgYS9tbS9rYXNh
bi9jb21tb24uYyBiL21tL2thc2FuL2NvbW1vbi5jCj4gaW5kZXggMGYzNjQ4MzM1YTZiLi4yYWFl
MGNlNjU5YjQgMTAwNjQ0Cj4gLS0tIGEvbW0va2FzYW4vY29tbW9uLmMKPiArKysgYi9tbS9rYXNh
bi9jb21tb24uYwo+IEBAIC0zNiw3ICszNiwxMSBAQAo+ICAgICogRGVmaW5pdGlvbiBvZiB0aGUg
dW5pZmllZCBzdGF0aWMga2V5IGRlY2xhcmVkIGluIGthc2FuLWVuYWJsZWQuaC4KPiAgICAqIFRo
aXMgcHJvdmlkZXMgY29uc2lzdGVudCBydW50aW1lIGVuYWJsZS9kaXNhYmxlIGFjcm9zcyBhbGwg
S0FTQU4gbW9kZXMuCj4gICAgKi8KPiArI2lmZGVmIENPTkZJR19IQVZFX0FSQ0hfS0FTQU5fRUFS
TFkKPiArREVGSU5FX1NUQVRJQ19LRVlfVFJVRShrYXNhbl9mbGFnX2VuYWJsZWQpOwo+ICsjZWxz
ZQo+ICAgREVGSU5FX1NUQVRJQ19LRVlfRkFMU0Uoa2FzYW5fZmxhZ19lbmFibGVkKTsKPiArI2Vu
ZGlmCj4gICBFWFBPUlRfU1lNQk9MKGthc2FuX2ZsYWdfZW5hYmxlZCk7Cj4gICAKPiAgIHN0cnVj
dCBzbGFiICprYXNhbl9hZGRyX3RvX3NsYWIoY29uc3Qgdm9pZCAqYWRkcikKPiBkaWZmIC0tZ2l0
IGEvbW0va2FzYW4vZ2VuZXJpYy5jIGIvbW0va2FzYW4vZ2VuZXJpYy5jCj4gaW5kZXggYTNiMTEy
ODY4YmU3Li40NTUzNzZkNWYxYzMgMTAwNjQ0Cj4gLS0tIGEvbW0va2FzYW4vZ2VuZXJpYy5jCj4g
KysrIGIvbW0va2FzYW4vZ2VuZXJpYy5jCj4gQEAgLTQyLDcgKzQyLDggQEAKPiAgICAqLwo+ICAg
dm9pZCBfX2luaXQga2FzYW5faW5pdF9nZW5lcmljKHZvaWQpCj4gICB7Cj4gLQlzdGF0aWNfYnJh
bmNoX2VuYWJsZSgma2FzYW5fZmxhZ19lbmFibGVkKTsKPiArCWlmICghSVNfRU5BQkxFRChDT05G
SUdfSEFWRV9BUkNIX0tBU0FOX0VBUkxZKSkKPiArCQlzdGF0aWNfYnJhbmNoX2VuYWJsZSgma2Fz
YW5fZmxhZ19lbmFibGVkKTsKPiAgIAo+ICAgCXByX2luZm8oIktlcm5lbEFkZHJlc3NTYW5pdGl6
ZXIgaW5pdGlhbGl6ZWQgKGdlbmVyaWMpXG4iKTsKPiAgIH0KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
