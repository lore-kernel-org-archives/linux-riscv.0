Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F36C021BC
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQNzUPSvgHI3Whj/OQQ2qHZErQCUMmxGpy/bQHaAZ4A=; b=nX30SSjUrCJH+c
	2LbRPBN7oXJiMDHAFt4lb25pQX5HIm+pKlWxKA6CyqDmA7PF3K74VNwuz4+7WanuY2q+hrm0vHe+9
	v1A+OBenLf3WQ1a/5fs8S4yRfn376k7keNA0dDRag0XGcjsY9F/TgqFYoJgmzzew+eV61mLo+QZbX
	TDkT4RU1XGWzylgcaLBgORl3WbxeVLUjY3pT9ajDHwW49427VwaHjVeU3eKrvG7DPHq3b6ErGs6bu
	2/ka+yUp/SvWjjN5scuX0VqhEQ923+vghap5vEErp2Z1nrgQOTYCpS9Sf1OTJsyi/d2IYN7NqB2/H
	YijnK5/SniHiY0wljMzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHf-0000000DnYm-2Gti;
	Mon, 24 Feb 2025 13:14:07 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXRM-0000000Dfe6-0qDU;
	Mon, 24 Feb 2025 12:20:05 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z1fV21lT7z9sSH;
	Mon, 24 Feb 2025 13:01:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RSWOAySpYadf; Mon, 24 Feb 2025 13:01:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z1fV20Znwz9sRy;
	Mon, 24 Feb 2025 13:01:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EF2E28B775;
	Mon, 24 Feb 2025 13:01:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id U8aocdpqgbdH; Mon, 24 Feb 2025 13:01:45 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A584D8B763;
	Mon, 24 Feb 2025 13:01:45 +0100 (CET)
Message-ID: <ba5b12e4-850c-445b-a1b1-0dc5f3905dda@csgroup.eu>
Date: Mon, 24 Feb 2025 13:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 5/5] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: steven.price@arm.com, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>
References: <20250217042220.32920-1-anshuman.khandual@arm.com>
 <20250217042220.32920-6-anshuman.khandual@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250217042220.32920-6-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_042004_405398_A7C5A40A 
X-CRM114-Status: GOOD (  11.23  )
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

CgpMZSAxNy8wMi8yMDI1IMOgIDA1OjIyLCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IFBsYXRmb3JtcyBzdWJzY3JpYmUgaW50byBnZW5lcmljIHB0ZHVtcCBpbXBsZW1lbnRhdGlvbiB2
aWEgR0VORVJJQ19QVERVTVAuCj4gQnV0IGdlbmVyaWMgcHRkdW1wIGdldHMgZW5hYmxlZCB2aWEg
UFREVU1QX0NPUkUuIFRoZXNlIGNvbmZpZ3MgY29tYmluYXRpb24KPiBpcyBjb25mdXNpbmcgYXMg
dGhleSBzb3VuZCB2ZXJ5IHNpbWlsYXIgYW5kIGRvZXMgbm90IGRpZmZlcmVudGlhdGUgYmV0d2Vl
bgo+IHBsYXRmb3JtJ3MgZmVhdHVyZSBzdWJzY3JpcHRpb24gYW5kIGZlYXR1cmUgZW5hYmxlbWVu
dCBmb3IgcHRkdW1wLiBSZW5hbWUKPiB0aGUgY29uZmlncyBhcyBBUkNIX0hBU19QVERVTVAgYW5k
IFBURFVNUCBtYWtpbmcgaXQgbW9yZSBjbGVhciBhbmQgaW1wcm92ZQo+IHJlYWRhYmlsaXR5Lgo+
IAo+IENjOiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+IENjOiBX
aWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPgo+IENjOiBKb25hdGhhbiBDb3JiZXQgPGNvcmJl
dEBsd24ubmV0Pgo+IENjOiBNYXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPgo+IENjOiBNaWNo
YWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+Cj4gQ2M6IE5pY2hvbGFzIFBpZ2dpbiA8
bnBpZ2dpbkBnbWFpbC5jb20+Cj4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lm
aXZlLmNvbT4KPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiBDYzog
SGVpa28gQ2Fyc3RlbnMgPGhjYUBsaW51eC5pYm0uY29tPgo+IENjOiBWYXNpbHkgR29yYmlrIDxn
b3JAbGludXguaWJtLmNvbT4KPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXgu
ZGU+Cj4gQ2M6IEluZ28gTW9sbmFyIDxtaW5nb0ByZWRoYXQuY29tPgo+IENjOiBBbmRyZXcgTW9y
dG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtZG9jQHZnZXIua2VybmVsLm9yZwo+IENjOiBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGt2bWFybUBsaXN0cy5saW51eC5kZXYK
PiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKPiBDYzogbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZwo+IENjOiBs
aW51eC1tbUBrdmFjay5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBLaGFuZHVhbCA8YW5z
aHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4KPiAtLS0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9L
Y29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gaW5kZXggNzYxMmM1MmU5YjFlLi41YWVmMmFh
NDEwM2MgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIvYXJjaC9yaXNj
di9LY29uZmlnCj4gQEAgLTQzLDYgKzQzLDcgQEAgY29uZmlnIFJJU0NWCj4gICAJc2VsZWN0IEFS
Q0hfSEFTX1BNRU1fQVBJCj4gICAJc2VsZWN0IEFSQ0hfSEFTX1BSRUVNUFRfTEFaWQo+ICAgCXNl
bGVjdCBBUkNIX0hBU19QUkVQQVJFX1NZTkNfQ09SRV9DTUQKPiArCXNlbGVjdCBBUkNIX0hBU19Q
VERVTVAKCklzIGl0IE9LIHRvIGRyb3AgdGhlICdpZiBNTVUnIGZyb20gYmVsb3cgPwoKPiAgIAlz
ZWxlY3QgQVJDSF9IQVNfUFRFX0RFVk1BUCBpZiA2NEJJVCAmJiBNTVUKPiAgIAlzZWxlY3QgQVJD
SF9IQVNfUFRFX1NQRUNJQUwKPiAgIAlzZWxlY3QgQVJDSF9IQVNfU0VUX0RJUkVDVF9NQVAgaWYg
TU1VCj4gQEAgLTExMiw3ICsxMTMsNiBAQCBjb25maWcgUklTQ1YKPiAgIAlzZWxlY3QgR0VORVJJ
Q19JUlFfU0hPV19MRVZFTAo+ICAgCXNlbGVjdCBHRU5FUklDX0xJQl9ERVZNRU1fSVNfQUxMT1dF
RAo+ICAgCXNlbGVjdCBHRU5FUklDX1BDSV9JT01BUAo+IC0Jc2VsZWN0IEdFTkVSSUNfUFREVU1Q
IGlmIE1NVQo+ICAgCXNlbGVjdCBHRU5FUklDX1NDSEVEX0NMT0NLCj4gICAJc2VsZWN0IEdFTkVS
SUNfU01QX0lETEVfVEhSRUFECj4gICAJc2VsZWN0IEdFTkVSSUNfVElNRV9WU1lTQ0FMTCBpZiBN
TVUgJiYgNjRCSVQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
