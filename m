Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE93E7716A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 07:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VtjCll4Z/k7ZuJGm60Im9I6RfrSHiwE1lSxM53w7jwI=; b=fyncCrhMQiOTfX
	GYP155PbQ8cOR+Y/redhOHp3cysISMcyLmbIde+gDSpWs5BDnPHHoly5EEMrjJ1JU0rO/MBBSrI+Q
	aelx/IetIwm4dt/sjTsosuE126XrFZ3LSuVSaISp4u4uAbFb4hBOCn9CGl1fwPhI9pYUbA/J9jpAF
	8VJGGSJvi7uXeX/8RGVQhgzcOkvSBFmsIATKyuuzQfO+E/S7/rnG1eY9tJn3wGESas1BP3BZA2ifo
	mh03BBP8bYfTnXorTnK+uFgtbGvlszGYZajXXhxqObrb5TNAqBz/aexWn0oF1pFgNRa3EnQiPTjTL
	EwD1aekukQ3FuOV6hmDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSLk-0000000CcxZ-3llc;
	Tue, 17 Dec 2024 07:50:36 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSJG-0000000CcaT-2Zue;
	Tue, 17 Dec 2024 07:48:04 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YC86z6Lcmz9sPd;
	Tue, 17 Dec 2024 08:47:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fC7tw8E5ccA2; Tue, 17 Dec 2024 08:47:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YC86z5K7qz9rvV;
	Tue, 17 Dec 2024 08:47:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A3F418B768;
	Tue, 17 Dec 2024 08:47:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id iR2VLUnfgYsc; Tue, 17 Dec 2024 08:47:55 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 73D238B763;
	Tue, 17 Dec 2024 08:47:54 +0100 (CET)
Message-ID: <ddd4439e-6f6f-4513-a7dc-b7f01bec03dc@csgroup.eu>
Date: Tue, 17 Dec 2024 08:47:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/ptdump: Drop GENERIC_PTDUMP
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: steven.price@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20241217034807.2541349-1-anshuman.khandual@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241217034807.2541349-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_234802_816221_B90B3F39 
X-CRM114-Status: GOOD (  20.44  )
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

CgpMZSAxNy8xMi8yMDI0IMOgIDA0OjQ4LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IEdFTkVSSUNfUFREVU1QIGRvZXMgbm90IGd1YXJkIGFueSBjb2RlIGJ1dCBpbnN0ZWFkIGp1c3Qg
dXNlZCBmb3IgcGxhdGZvcm0ncwo+IHN1YnNjcmlwdGlvbiBpbnRvIGNvcmUgcHRkdW1wIGRlZmlu
ZWQgdW5kZXIgUFREVU1QX0NPUkUsIHdoaWNoIGlzIHNlbGVjdGVkLgo+IEluc3RlYWQgdXNlIFBU
RFVNUF9DT1JFIGZvciBwbGF0Zm9ybSBzdWJzY3JpcHRpb24gYW5kIGRyb3AgR0VORVJJQ19QVERV
TVAuCj4gCj4gQ2M6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+Cj4g
Q2M6IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+Cj4gQ2M6IEpvbmF0aGFuIENvcmJldCA8
Y29yYmV0QGx3bi5uZXQ+Cj4gQ2M6IE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+Cj4gQ2M6
IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4KPiBDYzogTmljaG9sYXMgUGln
Z2luIDxucGlnZ2luQGdtYWlsLmNvbT4KPiBDYzogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xl
eUBzaWZpdmUuY29tPgo+IENjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgo+
IENjOiBIZWlrbyBDYXJzdGVucyA8aGNhQGxpbnV4LmlibS5jb20+Cj4gQ2M6IFZhc2lseSBHb3Ji
aWsgPGdvckBsaW51eC5pYm0uY29tPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRy
b25peC5kZT4KPiBDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+Cj4gQ2M6IEFuZHJl
dyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnCj4g
Q2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzoga3ZtYXJtQGxpc3RzLmxpbnV4
LmRldgo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+IENjOiBsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXMzOTBAdmdlci5rZXJuZWwub3JnCj4g
Q2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEFuc2h1bWFuIEtoYW5kdWFs
IDxhbnNodW1hbi5raGFuZHVhbEBhcm0uY29tPgo+IC0tLQo+IFRoaXMgcGF0Y2ggYXBwbGllcyBv
biB2Ni4xMy1yYzMgYW5kIGhhcyBiZWVuIHRlc3RlZCBvbiBhcm02NCwgYWx0aG91Z2ggaXQKPiBh
bHNvIGNsZWFycyBidWlsZCB0ZXN0cyBvbiBpbXBhY3RlZCBwbGF0Zm9ybXMuCj4gCj4gICBEb2N1
bWVudGF0aW9uL2FyY2gvYXJtNjQvcHRkdW1wLnJzdCAgICAgICB8IDEgLQo+ICAgYXJjaC9hcm02
NC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gICBhcmNoL2FybTY0L2t2
bS9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8IDMgKy0tCj4gICBhcmNoL3Bvd2VycGMvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgIGFyY2gvcG93ZXJwYy9jb25maWdz
L21wYzg4NV9hZHNfZGVmY29uZmlnIHwgMSAtCj4gICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgIGFyY2gvczM5MC9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMiArLQo+ICAgYXJjaC94ODYvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAyICstCj4gICBhcmNoL3g4Ni9LY29uZmlnLmRlYnVnICAgICAgICAgICAgICAg
ICAgICB8IDIgKy0KPiAgIGtlcm5lbC9jb25maWdzL2RlYnVnLmNvbmZpZyAgICAgICAgICAgICAg
IHwgMSAtCj4gICBtbS9LY29uZmlnLmRlYnVnICAgICAgICAgICAgICAgICAgICAgICAgICB8IDgg
KystLS0tLS0KPiAgIDExIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRp
b25zKC0pCj4gCgo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2FyY2gvcG93
ZXJwYy9LY29uZmlnCj4gaW5kZXggYTBjZTc3N2Y5NzA2Li5jNzE2ZjhkZjEwZGUgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcKPiArKysgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZwo+
IEBAIC0yMDMsNyArMjAzLDcgQEAgY29uZmlnIFBQQwo+ICAgCXNlbGVjdCBHRU5FUklDX0lSUV9T
SE9XCj4gICAJc2VsZWN0IEdFTkVSSUNfSVJRX1NIT1dfTEVWRUwKPiAgIAlzZWxlY3QgR0VORVJJ
Q19QQ0lfSU9NQVAJCWlmIFBDSQo+IC0Jc2VsZWN0IEdFTkVSSUNfUFREVU1QCj4gKwlzZWxlY3Qg
UFREVU1QX0NPUkUKClBsZWFzZSBrZWVwIGFscGhhYmV0aWNhbCBvcmRlci4KCj4gICAJc2VsZWN0
IEdFTkVSSUNfU01QX0lETEVfVEhSRUFECj4gICAJc2VsZWN0IEdFTkVSSUNfVElNRV9WU1lTQ0FM
TAo+ICAgCXNlbGVjdCBHRU5FUklDX1ZEU09fVElNRV9OUwoKPiBkaWZmIC0tZ2l0IGEvbW0vS2Nv
bmZpZy5kZWJ1ZyBiL21tL0tjb25maWcuZGVidWcKPiBpbmRleCA0MWE1ODUzNjUzMWQuLmIyMDZl
NWExMWY5NiAxMDA2NDQKPiAtLS0gYS9tbS9LY29uZmlnLmRlYnVnCj4gKysrIGIvbW0vS2NvbmZp
Zy5kZWJ1Zwo+IEBAIC0xODcsNyArMTg3LDcgQEAgY29uZmlnIERFQlVHX1dYCj4gICAJYm9vbCAi
V2FybiBvbiBXK1ggbWFwcGluZ3MgYXQgYm9vdCIKPiAgIAlkZXBlbmRzIG9uIEFSQ0hfSEFTX0RF
QlVHX1dYCj4gICAJZGVwZW5kcyBvbiBNTVUKPiAtCXNlbGVjdCBQVERVTVBfQ09SRQo+ICsJZGVw
ZW5kcyBvbiBQVERVTVBfQ09SRQoKVGhpcyBjaGFuZ2UgaXMgdW5jbGVhciB0byBtZS4gSXQgd29y
a3MgYmVjYXVzZSBhbGwgYXJjaCBzZWxlY3RpbmcgCkFSQ0hfSEFTX0RFQlVHX1dYIGFsc28gc2Vs
ZWN0IEdFTkVSSUNfUFREVU1QLiBGb3IgcmlzY3YgaXQncyBldmVuIG1vcmUgCnRyaWNraW5nLCBS
aXNjdiBvbmx5IHNlbGVjdHMgR0VORVJJQ19QVERVTVAgd2hlbiBNTVUgaXMgc2V0LCBzbyBpdCB3
b3JrcyAKYmVjYXVzZSBoZXJlIGl0IGFsc28gZGVwZW5kcyBvbiBNTVUuCgpCdXQgd2hhdCBoYXBw
ZW5zIGlmIGluIHRoZSBmdXR1cmUgYW4gYXJjaGl0ZWN0dXJlIHNlbGVjdHMgCkFSQ0hfSEFTX0RF
QlVHX1dYIHdpdGhvdXQgc2VsZWN0aW5nIFBURFVNUF9DT1JFID8KCgo+ICAgCWhlbHAKPiAgIAkg
IEdlbmVyYXRlIGEgd2FybmluZyBpZiBhbnkgVytYIG1hcHBpbmdzIGFyZSBmb3VuZCBhdCBib290
Lgo+ICAgCj4gQEAgLTIxMiw5ICsyMTIsNiBAQCBjb25maWcgREVCVUdfV1gKPiAgIAo+ICAgCSAg
SWYgaW4gZG91YnQsIHNheSAiWSIuCj4gICAKPiAtY29uZmlnIEdFTkVSSUNfUFREVU1QCj4gLQli
b29sCj4gLQo+ICAgY29uZmlnIFBURFVNUF9DT1JFCj4gICAJYm9vbAo+ICAgCj4gQEAgLTIyMiw4
ICsyMTksNyBAQCBjb25maWcgUFREVU1QX0RFQlVHRlMKPiAgIAlib29sICJFeHBvcnQga2VybmVs
IHBhZ2V0YWJsZSBsYXlvdXQgdG8gdXNlcnNwYWNlIHZpYSBkZWJ1Z2ZzIgo+ICAgCWRlcGVuZHMg
b24gREVCVUdfS0VSTkVMCj4gICAJZGVwZW5kcyBvbiBERUJVR19GUwo+IC0JZGVwZW5kcyBvbiBH
RU5FUklDX1BURFVNUAo+IC0Jc2VsZWN0IFBURFVNUF9DT1JFCj4gKwlkZXBlbmRzIG9uIFBURFVN
UF9DT1JFCj4gICAJaGVscAo+ICAgCSAgU2F5IFkgaGVyZSBpZiB5b3Ugd2FudCB0byBzaG93IHRo
ZSBrZXJuZWwgcGFnZXRhYmxlIGxheW91dCBpbiBhCj4gICAJICBkZWJ1Z2ZzIGZpbGUuIFRoaXMg
aW5mb3JtYXRpb24gaXMgb25seSB1c2VmdWwgZm9yIGtlcm5lbCBkZXZlbG9wZXJzCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
