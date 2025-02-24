Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B391BC021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 13:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0zq2Kldiu2i1Z9sW0dFUNwSXU2BAT+vemzLSw4NCik=; b=BerNGySJrLQiaB
	2Em3GEwtqtJPFH/aizEU31dr5Ba6VFkOjq9WvhZJ8MakixTCKqL9ipMuGWZjmQsGVduHr//JKWtDF
	5zPw7oYkqBp2U5e5rX9JkbNWDtW17AFmgmYymrYDiav+byoVxVenGTOfHldO1BdZXad7Cj38gJ+4Y
	FRs+K3BqfnF1d8pamg+DFS97gKt+KOulR29YQEfqaEzHsRcS5t5foTGkoGrd+tpfH1Fbfo2pUpJag
	9tTTee1M85qvbXCHoaH3U7wrK6Zf/3D24kapIx92VbbfhDN3tUcAC4nTtEBQuiCCUzAJ/AFfe9guL
	tTs9wIvkzeKmZykt5NOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYr2-0000000Dy51-1mNp;
	Mon, 24 Feb 2025 13:50:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYoh-0000000DxeN-0Am8;
	Mon, 24 Feb 2025 13:48:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 990B31515;
	Mon, 24 Feb 2025 05:48:30 -0800 (PST)
Received: from [10.163.40.148] (unknown [10.163.40.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 716D33F5A1;
	Mon, 24 Feb 2025 05:48:07 -0800 (PST)
Message-ID: <acc7eb95-a0d2-4f35-96a8-7a370cc1eff6@arm.com>
Date: Mon, 24 Feb 2025 19:18:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/5] arch/powerpc: Drop GENERIC_PTDUMP from
 mpc885_ads_defconfig
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org
Cc: steven.price@arm.com, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <20250217042220.32920-1-anshuman.khandual@arm.com>
 <20250217042220.32920-3-anshuman.khandual@arm.com>
 <93e96586-13a2-4800-9dc7-5b35177a328e@csgroup.eu>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <93e96586-13a2-4800-9dc7-5b35177a328e@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_054815_120715_6EDA8964 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAyLzI0LzI1IDE3OjM0LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+IAo+IAo+IExlIDE3
LzAyLzIwMjUgw6AgMDU6MjIsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6Cj4+IEdFTkVS
SUNfUFREVU1QIGdldHMgc2VsZWN0ZWQgb24gcG93ZXJwYyBleHBsaWNpdGx5IGFuZCBoZW5jZSBj
YW4gYmUgZHJvcHBlZAo+PiBvZmYgZnJvbSBtcGM4ODVfYWRzX2RlZmNvbmZpZy4KPj4KPj4gQ2M6
IE1hZGhhdmFuIFNyaW5pdmFzYW4gPG1hZGR5QGxpbnV4LmlibS5jb20+Cj4+IENjOiBNaWNoYWVs
IEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+Cj4+IENjOiBOaWNob2xhcyBQaWdnaW4gPG5w
aWdnaW5AZ21haWwuY29tPgo+PiBDYzogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJv
eUBjc2dyb3VwLmV1Pgo+PiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKPj4gQ2M6
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPj4gU2lnbmVkLW9mZi1ieTogQW5zaHVtYW4g
S2hhbmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20+Cj4+IC0tLQo+PiBKdXN0IHdvbmRl
cmluZyAtIFNob3VsZCBDT05GSUdfUFREVU1QX0RFQlVHRlMgYmUgYWRkZWQgaW5zdGVhZCA/Cj4g
Cj4gWWVzIHBsZWFzZSBkbyB0aGF0IGFzIGEgZml4IHRvIGNvbW1pdCBlMDg0NzI4MzkzYTUgKCJw
b3dlcnBjL3B0ZHVtcDogQ29udmVydCBwb3dlcnBjIHRvIEdFTkVSSUNfUFREVU1QIikKClN1cmUs
IGRvZXMgdGhlIGZvbGxvd2luZyB1cGRhdGVkIGNvbW1pdCBtZXNzYWdlIGxvb2sgb2theSA/Cgph
cmNoL3Bvd2VycGM6IERyb3AgR0VORVJJQ19QVERVTVAgZnJvbSBtcGM4ODVfYWRzX2RlZmNvbmZp
ZwoKR0VORVJJQ19QVERVTVAgZ2V0cyBzZWxlY3RlZCBvbiBwb3dlcnBjIGV4cGxpY2l0bHkgYW5k
IGhlbmNlIGNhbiBiZSBkcm9wcGVkCm9mZiBmcm9tIG1wYzg4NV9hZHNfZGVmY29uZmlnLiBKdXN0
IGFkZCBDT05GSUdfUFREVU1QX0RFQlVHRlMgaW5zdGVhZC4KCkZpeGVzOiBlMDg0NzI4MzkzYTUg
KCJwb3dlcnBjL3B0ZHVtcDogQ29udmVydCBwb3dlcnBjIHRvIEdFTkVSSUNfUFREVU1QIikKU2ln
bmVkLW9mZi1ieTogQW5zaHVtYW4gS2hhbmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20+
Cgo+IAo+Pgo+PiDCoCBhcmNoL3Bvd2VycGMvY29uZmlncy9tcGM4ODVfYWRzX2RlZmNvbmZpZyB8
IDEgLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL2NvbmZpZ3MvbXBjODg1X2Fkc19kZWZjb25maWcgYi9hcmNoL3Bvd2Vy
cGMvY29uZmlncy9tcGM4ODVfYWRzX2RlZmNvbmZpZwo+PiBpbmRleCA3NzMwNmJlNjJlOWUuLmVh
NmY4MzY0MDdkMiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9wb3dlcnBjL2NvbmZpZ3MvbXBjODg1X2Fk
c19kZWZjb25maWcKPj4gKysrIGIvYXJjaC9wb3dlcnBjL2NvbmZpZ3MvbXBjODg1X2Fkc19kZWZj
b25maWcKPj4gQEAgLTc4LDQgKzc4LDMgQEAgQ09ORklHX0RFQlVHX1ZNX1BHVEFCTEU9eQo+PiDC
oCBDT05GSUdfREVURUNUX0hVTkdfVEFTSz15Cj4+IMKgIENPTkZJR19CRElfU1dJVENIPXkKPj4g
wqAgQ09ORklHX1BQQ19FQVJMWV9ERUJVRz15Cj4+IC1DT05GSUdfR0VORVJJQ19QVERVTVA9eQo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
