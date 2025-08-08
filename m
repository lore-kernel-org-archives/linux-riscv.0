Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B17C87FCB
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 17:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iI5egDwZPclWDcwllFyif6k/ePy+ARPFBFnflJkNPns=; b=DPXi45NyHhbFDJ
	1QB1/aGKQF/8cnpUssDzB1QbWkKiCvPifIjK5B0hmAPL6drGrTZ5F8LAbpJlqFw17TQt4WnMPAWpx
	1SMt4vj8JVD0JdZPAU4hPjnjS5K3osPdlVGCROuioR+wHW380cqAKCu1WN/2m7wCFLARuI75khbAo
	KBhWZNLE50EymlXOnzl/d3/nH/TrA/coveeoUyRElzUz93OcQEO6cFNfLZu8C/GwVpu5Juqa8zW2b
	IXebSI+cY6WRp73ZyxdaWZNSSa3hU/tKH3B1osZC8IYOzbv1KMfQw2++jPTqpRk4rlDjLR6FANS8O
	XmBcaSty8xh+Pg37UC6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukQoG-00000003OlK-1R09;
	Fri, 08 Aug 2025 17:23:16 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukQlf-00000003OL7-1l8d;
	Fri, 08 Aug 2025 17:20:37 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4bz9NX4Hmyz9sSb;
	Fri,  8 Aug 2025 19:03:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4LtEzBBocysS; Fri,  8 Aug 2025 19:03:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4bz9NX36z3z9sSZ;
	Fri,  8 Aug 2025 19:03:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 55AF68B770;
	Fri,  8 Aug 2025 19:03:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Z2c0fwWGRIPg; Fri,  8 Aug 2025 19:03:56 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 20F878B763;
	Fri,  8 Aug 2025 19:03:55 +0200 (CEST)
Message-ID: <af677847-e625-43d7-8750-b2ce4ba9626c@csgroup.eu>
Date: Fri, 8 Aug 2025 19:03:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: ryabinin.a.a@gmail.com, bhe@redhat.com, hca@linux.ibm.com,
 andreyknvl@gmail.com, akpm@linux-foundation.org, zhangqing@loongson.cn,
 chenhuacai@loongson.cn, davidgow@google.co, glider@google.com,
 dvyukov@google.com, alex@ghiti.fr, agordeev@linux.ibm.com,
 vincenzo.frascino@arm.com, elver@google.com, kasan-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250807194012.631367-1-snovitoll@gmail.com>
 <20250807194012.631367-2-snovitoll@gmail.com>
 <22872a3f-85dc-4740-b605-ba80b5a3b1bc@csgroup.eu>
 <CACzwLxjnofD0EsxrtgbG3svXHL+TpYcio4B67SCY9Mi3C-jdsQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <CACzwLxjnofD0EsxrtgbG3svXHL+TpYcio4B67SCY9Mi3C-jdsQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_102035_710783_E458557A 
X-CRM114-Status: GOOD (  17.40  )
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

CgpMZSAwOC8wOC8yMDI1IMOgIDE3OjMzLCBTYWJ5cnpoYW4gVGFzYm9sYXRvdiBhIMOpY3JpdMKg
Ogo+IE9uIEZyaSwgQXVnIDgsIDIwMjUgYXQgMTA6MDPigK9BTSBDaHJpc3RvcGhlIExlcm95Cj4g
PGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6Cj4+Cj4+Cj4+Cj4+IExlIDA3LzA4
LzIwMjUgw6AgMjE6NDAsIFNhYnlyemhhbiBUYXNib2xhdG92IGEgw6ljcml0IDoKPj4+IEludHJv
ZHVjZSBDT05GSUdfQVJDSF9ERUZFUl9LQVNBTiB0byBpZGVudGlmeSBhcmNoaXRlY3R1cmVzIFsx
XSB0aGF0IG5lZWQKPj4+IHRvIGRlZmVyIEtBU0FOIGluaXRpYWxpemF0aW9uIHVudGlsIHNoYWRv
dyBtZW1vcnkgaXMgcHJvcGVybHkgc2V0IHVwLAo+Pj4gYW5kIHVuaWZ5IHRoZSBzdGF0aWMga2V5
IGluZnJhc3RydWN0dXJlIGFjcm9zcyBhbGwgS0FTQU4gbW9kZXMuCj4+Cj4+IFRoYXQgcHJvYmFi
bHkgZGVzc2VydmVzIG1vcmUgZGV0YWlscywgbWF5YmUgY29weSBpbiBpbmZvcm1hdGlvbnMgZnJv
bQo+PiB0aGUgdG9wIG9mIGNvdmVyIGxldHRlci4KPj4KPj4gSSB0aGluayB0aGVyZSBzaG91bGQg
YWxzbyBiZSBzb21lIGV4ZXBsYW5hdGlvbnMgYWJvdXQKPj4ga2FzYW5fYXJjaF9pc19yZWFkeSgp
IGJlY29taW5nIGthc2FuX2VuYWJsZWQoKSwgYW5kIGFsc28gd2h5Cj4+IGthc2FuX2FyY2hfaXNf
cmVhZHkoKSBjb21wbGV0ZWx5IGRpc2FwcGVhciBmcm9tIG1tL2thc2FuL2NvbW1vbi5jCj4+IHdp
dGhvdXQgYmVpbmcgcmVwbGFjZWQgYnkga2FzYW5fZW5hYmxlZCgpLgo+Pgo+Pj4KPj4+IFsxXSBQ
b3dlclBDLCBVTUwsIExvb25nQXJjaCBzZWxlY3RzIEFSQ0hfREVGRVJfS0FTQU4uCj4+Pgo+Pj4g
Q2xvc2VzOiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91
cmw9aHR0cHMlM0ElMkYlMkZidWd6aWxsYS5rZXJuZWwub3JnJTJGc2hvd19idWcuY2dpJTNGaWQl
M0QyMTcwNDkmZGF0YT0wNSU3QzAyJTdDY2hyaXN0b3BoZS5sZXJveSU0MGNzZ3JvdXAuZXUlN0Nm
ZTRmNWE3NTlhZDY0NTJiMDQ3NDA4ZGRkNjkxMDI0YSU3QzhiODdhZjdkODY0NzRkYzc4ZGY0NWY2
OWEyMDExYmI1JTdDMCU3QzAlN0M2Mzg5MDI2NDA1MDMyNTkxNzYlN0NVbmtub3duJTdDVFdGcGJH
WnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9uUnlkV1VzSWxZaU9pSXdMakF1TURBd01DSXNJbEFpT2lK
WGFXNHpNaUlzSWtGT0lqb2lUV0ZwYkNJc0lsZFVJam95ZlElM0QlM0QlN0MwJTdDJTdDJTdDJnNk
YXRhPVVNNHV2UWloSmRlV3djQzZESWlKWGJuNHdHc3JpampSY0hjNTV1Q01FckklM0QmcmVzZXJ2
ZWQ9MAo+Pj4gU2lnbmVkLW9mZi1ieTogU2FieXJ6aGFuIFRhc2JvbGF0b3YgPHNub3ZpdG9sbEBn
bWFpbC5jb20+Cj4+PiAtLS0KPj4+IENoYW5nZXMgaW4gdjU6Cj4+PiAtIFVuaWZpZWQgcGF0Y2hl
cyB3aGVyZSBhcmNoIChwb3dlcnBjLCBVTUwsIGxvb25nYXJjaCkgc2VsZWN0cwo+Pj4gICAgIEFS
Q0hfREVGRVJfS0FTQU4gaW4gdGhlIGZpcnN0IHBhdGNoIG5vdCB0byBicmVhawo+Pj4gICAgIGJp
c2VjdGFiaWxpdHkKPj4+IC0gUmVtb3ZlZCBrYXNhbl9hcmNoX2lzX3JlYWR5IGNvbXBsZXRlbHkg
YXMgdGhlcmUgaXMgbm8gdXNlcgo+Pj4gLSBSZW1vdmVkIF9fd3JhcHBlcnMgaW4gdjQsIGxlZnQg
b25seSB0aG9zZSB3aGVyZSBpdCdzIG5lY2Vzc2FyeQo+Pj4gICAgIGR1ZSB0byBkaWZmZXJlbnQg
aW1wbGVtZW50YXRpb25zCj4+Pgo+Pj4gQ2hhbmdlcyBpbiB2NDoKPj4+IC0gRml4ZWQgSFdfVEFH
UyBzdGF0aWMga2V5IGZ1bmN0aW9uYWxpdHkgKHdhcyBicm9rZW4gaW4gdjMpCj4+PiAtIE1lcmdl
ZCBjb25maWd1cmF0aW9uIGFuZCBpbXBsZW1lbnRhdGlvbiBmb3IgYXRvbWljaXR5Cj4+PiAtLS0K
Pj4+ICAgIGFyY2gvbG9vbmdhcmNoL0tjb25maWcgICAgICAgICAgICAgICAgIHwgIDEgKwo+Pj4g
ICAgYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20va2FzYW4uaCAgICAgfCAgNyAtLS0tLS0KPj4+
ICAgIGFyY2gvbG9vbmdhcmNoL21tL2thc2FuX2luaXQuYyAgICAgICAgIHwgIDggKysrLS0tLQo+
Pj4gICAgYXJjaC9wb3dlcnBjL0tjb25maWcgICAgICAgICAgICAgICAgICAgfCAgMSArCj4+PiAg
ICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20va2FzYW4uaCAgICAgICB8IDEyIC0tLS0tLS0tLS0K
Pj4+ICAgIGFyY2gvcG93ZXJwYy9tbS9rYXNhbi9pbml0XzMyLmMgICAgICAgIHwgIDIgKy0KPj4+
ICAgIGFyY2gvcG93ZXJwYy9tbS9rYXNhbi9pbml0X2Jvb2szZV82NC5jIHwgIDIgKy0KPj4+ICAg
IGFyY2gvcG93ZXJwYy9tbS9rYXNhbi9pbml0X2Jvb2szc182NC5jIHwgIDYgKy0tLS0KPj4+ICAg
IGFyY2gvdW0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+Pj4gICAgYXJj
aC91bS9pbmNsdWRlL2FzbS9rYXNhbi5oICAgICAgICAgICAgfCAgNSArKy0tCj4+PiAgICBhcmNo
L3VtL2tlcm5lbC9tZW0uYyAgICAgICAgICAgICAgICAgICB8IDEwICsrKysrKy0tCj4+PiAgICBp
bmNsdWRlL2xpbnV4L2thc2FuLWVuYWJsZWQuaCAgICAgICAgICB8IDMyICsrKysrKysrKysrKysr
KysrKy0tLS0tLS0tCj4+PiAgICBpbmNsdWRlL2xpbnV4L2thc2FuLmggICAgICAgICAgICAgICAg
ICB8ICA2ICsrKysrCj4+PiAgICBsaWIvS2NvbmZpZy5rYXNhbiAgICAgICAgICAgICAgICAgICAg
ICB8ICA4ICsrKysrKysKPj4+ICAgIG1tL2thc2FuL2NvbW1vbi5jICAgICAgICAgICAgICAgICAg
ICAgIHwgMTcgKysrKysrKysrKy0tLS0KPj4+ICAgIG1tL2thc2FuL2dlbmVyaWMuYyAgICAgICAg
ICAgICAgICAgICAgIHwgMTkgKysrKysrKysrKystLS0tCj4+PiAgICBtbS9rYXNhbi9od190YWdz
LmMgICAgICAgICAgICAgICAgICAgICB8ICA5ICstLS0tLS0tCj4+PiAgICBtbS9rYXNhbi9rYXNh
bi5oICAgICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKysrKy0KPj4+ICAgIG1tL2thc2FuL3No
YWRvdy5jICAgICAgICAgICAgICAgICAgICAgIHwgMTIgKysrKystLS0tLQo+Pj4gICAgbW0va2Fz
YW4vc3dfdGFncy5jICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4+PiAgICBtbS9rYXNhbi90
YWdzLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4+PiAgICAyMSBmaWxlcyBjaGFu
Z2VkLCAxMDAgaW5zZXJ0aW9ucygrKSwgNjkgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2FyY2gvbG9vbmdhcmNoL0tjb25maWcgYi9hcmNoL2xvb25nYXJjaC9LY29uZmlnCj4+PiBp
bmRleCBmMGFiYzM4YzQwYS4uY2Q2NGIyYmMxMmQgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL2xvb25n
YXJjaC9LY29uZmlnCj4+PiArKysgYi9hcmNoL2xvb25nYXJjaC9LY29uZmlnCj4+PiBAQCAtOSw2
ICs5LDcgQEAgY29uZmlnIExPT05HQVJDSAo+Pj4gICAgICAgIHNlbGVjdCBBQ1BJX1BQVFQgaWYg
QUNQSQo+Pj4gICAgICAgIHNlbGVjdCBBQ1BJX1NZU1RFTV9QT1dFUl9TVEFURVNfU1VQUE9SVCBp
ZiBBQ1BJCj4+PiAgICAgICAgc2VsZWN0IEFSQ0hfQklORk1UX0VMRl9TVEFURQo+Pj4gKyAgICAg
c2VsZWN0IEFSQ0hfREVGRVJfS0FTQU4gaWYgS0FTQU4KPj4KPj4gSW5zdGVhZCBvZiBhZGRpbmcg
J2lmIEtBU0FOJyBpbiBhbGwgdXNlcnMsIHlvdSBjb3VsZCBkbyBpbiB0d28gc3RlcHM6Cj4+Cj4+
IEFkZCBhIHN5bWJvbCBBUkNIX05FRURTX0RFRkVSX0tBU0FOLgo+Pgo+PiArY29uZmlnIEFSQ0hf
TkVFRFNfREVGRVJfS0FTQU4KPj4gKyAgICAgICBib29sCj4+Cj4+IEFuZCB0aGVuOgo+Pgo+PiAr
Y29uZmlnIEFSQ0hfREVGRVJfS0FTQU4KPj4gKyAgICAgICBkZWZfYm9vbAo+PiArICAgICAgIGRl
cGVuZHMgb24gS0FTQU4KPj4gKyAgICAgICBkZXBlbmRzIG9uIEFSQ0hfREVGRVJfS0FTQU4KPj4g
KyAgICAgICBoZWxwCj4+ICsgICAgICAgICBBcmNoaXRlY3R1cmVzIHNob3VsZCBzZWxlY3QgdGhp
cyBpZiB0aGV5IG5lZWQgdG8gZGVmZXIgS0FTQU4KPj4gKyAgICAgICAgIGluaXRpYWxpemF0aW9u
IHVudGlsIHNoYWRvdyBtZW1vcnkgaXMgcHJvcGVybHkgc2V0IHVwLiBUaGlzCj4+ICsgICAgICAg
ICBlbmFibGVzIHJ1bnRpbWUgY29udHJvbCB2aWEgc3RhdGljIGtleXMuIE90aGVyd2lzZSwgS0FT
QU4gdXNlcwo+PiArICAgICAgICAgY29tcGlsZS10aW1lIGNvbnN0YW50cyBmb3IgYmV0dGVyIHBl
cmZvcm1hbmNlLgo+Pgo+IAo+IEFjdHVhbGx5LCBJIGRvbid0IHNlZSB0aGUgYmVuZWZpdHMgZnJv
bSB0aGlzIG9wdGlvbi4gU29ycnksIGhhdmUganVzdAo+IHJldmlzaXRlZCB0aGlzIGFnYWluLgo+
IFdpdGggdGhlIG5ldyBzeW1ib2wsIGFyY2ggKFBvd2VyUEMsIFVNTCwgTG9vbmdBcmNoKSBzdGls
bCBuZWVkcyBzZWxlY3QKPiAyIG9wdGlvbnM6Cj4gCj4gc2VsZWN0IEFSQ0hfTkVFRFNfREVGRVJf
S0FTQU4KPiBzZWxlY3QgQVJDSF9ERUZFUl9LQVNBTgoKU29ycnksIG15IG1pc3Rha2UsIEFSQ0hf
REVGRVJfS0FTQU4gaGFzIHRvIGJlICdkZWZfYm9vbCB5Jy4gTWlzc2luZyB0aGUgCid5Jy4gVGhh
dCB3YXkgaXQgaXMgYXV0b21hdGljYWxseSBzZXQgdG8gJ3knIGFzIGxvbmcgYXMgS0FTQU4gYW5k
IApBUkNIX05FRURTX0RFRkVSX0tBU0FOIGFyZSBzZWxlY3RlZC4gU2hvdWxkIGJlOgoKY29uZmln
IEFSQ0hfREVGRVJfS0FTQU4KCWRlZl9ib29sIHkKCWRlcGVuZHMgb24gS0FTQU4KCWRlcGVuZHMg
b24gQVJDSF9ORUVEU19ERUZFUl9LQVNBTgoKCj4gCj4gYW5kIHRoZSBvbmVsaW5lIHdpdGggYGlm
YCBjb25kaXRpb24gaXMgY2xlYW5lci4KPiBzZWxlY3QgQVJDSF9ERUZFUl9LQVNBTiBpZiBLQVNB
Tgo+IAoKSSBkb24ndCB0aGluayBzbyBiZWNhdXNlIGl0IHJlcXVpcmVzIGFsbCBhcmNoaXRlY3R1
cmVzIHRvIGFkZCAnaWYgS0FTQU4nIAp3aGljaCBpcyBub3QgY29udmVuaWVudC4KCkNocmlzdG9w
aGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
