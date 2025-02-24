Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB25C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 13:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+QD5hXZDcAxFynr87VwoI/xFTZ4Gc5CpYS8pgLusBU=; b=nvY4XZC31jVDGq
	8L6n7DTdp8nrVCmMIViru+YqRA8XrsSAY2F6Nigt3ILODFfKzaQC50M+QR+ll725P7pQAzY0dId/f
	WPw9YX+NTjLAJ8M5NHZsFFx3R88msWuDdX7jixULRHat3N4k706SFFhU1mGbuPvzoXH35r1RTAd+o
	/zKNP9GeRlmq7/KJX/pNLV4qbBBLCgnFwgjGDhBaR0a8LHLgH5BGp71F3khCF476B6uJxWjiBd0Kd
	lKV7mRBqN038buBtCKXZgXVA+aS1kuVtVY703kvYtFkhL1KJZGCg47TWbV5FSzvf2ZV7WeT5f5gdy
	FX2lNmLC4eY4ClIq8ueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYsV-0000000Dyah-396S;
	Mon, 24 Feb 2025 13:52:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYqL-0000000Dxy1-0mUN;
	Mon, 24 Feb 2025 13:49:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3ACCB1515;
	Mon, 24 Feb 2025 05:50:13 -0800 (PST)
Received: from [10.163.40.148] (unknown [10.163.40.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00D913F5A1;
	Mon, 24 Feb 2025 05:49:47 -0800 (PST)
Message-ID: <137a241a-324a-45a9-a60b-d65f27dc4fc2@arm.com>
Date: Mon, 24 Feb 2025 19:19:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 5/5] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org
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
 <ba5b12e4-850c-445b-a1b1-0dc5f3905dda@csgroup.eu>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <ba5b12e4-850c-445b-a1b1-0dc5f3905dda@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_054957_309997_78BF1A9B 
X-CRM114-Status: UNSURE (   9.85  )
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

CgpPbiAyLzI0LzI1IDE3OjMxLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+IAo+IAo+IExlIDE3
LzAyLzIwMjUgw6AgMDU6MjIsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6Cj4+IFBsYXRm
b3JtcyBzdWJzY3JpYmUgaW50byBnZW5lcmljIHB0ZHVtcCBpbXBsZW1lbnRhdGlvbiB2aWEgR0VO
RVJJQ19QVERVTVAuCj4+IEJ1dCBnZW5lcmljIHB0ZHVtcCBnZXRzIGVuYWJsZWQgdmlhIFBURFVN
UF9DT1JFLiBUaGVzZSBjb25maWdzIGNvbWJpbmF0aW9uCj4+IGlzIGNvbmZ1c2luZyBhcyB0aGV5
IHNvdW5kIHZlcnkgc2ltaWxhciBhbmQgZG9lcyBub3QgZGlmZmVyZW50aWF0ZSBiZXR3ZWVuCj4+
IHBsYXRmb3JtJ3MgZmVhdHVyZSBzdWJzY3JpcHRpb24gYW5kIGZlYXR1cmUgZW5hYmxlbWVudCBm
b3IgcHRkdW1wLiBSZW5hbWUKPj4gdGhlIGNvbmZpZ3MgYXMgQVJDSF9IQVNfUFREVU1QIGFuZCBQ
VERVTVAgbWFraW5nIGl0IG1vcmUgY2xlYXIgYW5kIGltcHJvdmUKPj4gcmVhZGFiaWxpdHkuCj4+
Cj4+IENjOiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+PiBDYzog
V2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4KPj4gQ2M6IEpvbmF0aGFuIENvcmJldCA8Y29y
YmV0QGx3bi5uZXQ+Cj4+IENjOiBNYXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPgo+PiBDYzog
TWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlkLmF1Pgo+PiBDYzogTmljaG9sYXMgUGln
Z2luIDxucGlnZ2luQGdtYWlsLmNvbT4KPj4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNs
ZXlAc2lmaXZlLmNvbT4KPj4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+
Cj4+IENjOiBIZWlrbyBDYXJzdGVucyA8aGNhQGxpbnV4LmlibS5jb20+Cj4+IENjOiBWYXNpbHkg
R29yYmlrIDxnb3JAbGludXguaWJtLmNvbT4KPj4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPgo+PiBDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+Cj4+IENj
OiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+PiBDYzogbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IENjOiBsaW51eC1kb2NAdmdlci5rZXJu
ZWwub3JnCj4+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4+IENjOiBrdm1hcm1A
bGlzdHMubGludXguZGV2Cj4+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+PiBD
YzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBDYzogbGludXgtczM5MEB2Z2Vy
Lmtlcm5lbC5vcmcKPj4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+PiBTaWduZWQtb2ZmLWJ5OiBB
bnNodW1hbiBLaGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4KPj4gLS0tCj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gaW5k
ZXggNzYxMmM1MmU5YjFlLi41YWVmMmFhNDEwM2MgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yv
S2NvbmZpZwo+PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gQEAgLTQzLDYgKzQzLDcgQEAg
Y29uZmlnIFJJU0NWCj4+IMKgwqDCoMKgwqAgc2VsZWN0IEFSQ0hfSEFTX1BNRU1fQVBJCj4+IMKg
wqDCoMKgwqAgc2VsZWN0IEFSQ0hfSEFTX1BSRUVNUFRfTEFaWQo+PiDCoMKgwqDCoMKgIHNlbGVj
dCBBUkNIX0hBU19QUkVQQVJFX1NZTkNfQ09SRV9DTUQKPj4gK8KgwqDCoCBzZWxlY3QgQVJDSF9I
QVNfUFREVU1QCj4gCj4gSXMgaXQgT0sgdG8gZHJvcCB0aGUgJ2lmIE1NVScgZnJvbSBiZWxvdyA/
CgpTdXJlLCB3aWxsIGFkZCBpdCBiYWNrLgoKPiAKPj4gwqDCoMKgwqDCoCBzZWxlY3QgQVJDSF9I
QVNfUFRFX0RFVk1BUCBpZiA2NEJJVCAmJiBNTVUKPj4gwqDCoMKgwqDCoCBzZWxlY3QgQVJDSF9I
QVNfUFRFX1NQRUNJQUwKPj4gwqDCoMKgwqDCoCBzZWxlY3QgQVJDSF9IQVNfU0VUX0RJUkVDVF9N
QVAgaWYgTU1VCj4+IEBAIC0xMTIsNyArMTEzLDYgQEAgY29uZmlnIFJJU0NWCj4+IMKgwqDCoMKg
wqAgc2VsZWN0IEdFTkVSSUNfSVJRX1NIT1dfTEVWRUwKPj4gwqDCoMKgwqDCoCBzZWxlY3QgR0VO
RVJJQ19MSUJfREVWTUVNX0lTX0FMTE9XRUQKPj4gwqDCoMKgwqDCoCBzZWxlY3QgR0VORVJJQ19Q
Q0lfSU9NQVAKPj4gLcKgwqDCoCBzZWxlY3QgR0VORVJJQ19QVERVTVAgaWYgTU1VCj4+IMKgwqDC
oMKgwqAgc2VsZWN0IEdFTkVSSUNfU0NIRURfQ0xPQ0sKPj4gwqDCoMKgwqDCoCBzZWxlY3QgR0VO
RVJJQ19TTVBfSURMRV9USFJFQUQKPj4gwqDCoMKgwqDCoCBzZWxlY3QgR0VORVJJQ19USU1FX1ZT
WVNDQUxMIGlmIE1NVSAmJiA2NEJJVAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
