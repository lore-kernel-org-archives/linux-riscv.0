Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E489AC021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 11:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0nVv5neDq/VrOCM9B0S7lMauVWWJgBuj51XnBkG9t3I=; b=oR3HTx43mVPu7I
	n4PCKYdqBAiZltdibzfAmOUXf+tbV4gwKdQ+66qdMVnUySZhZjx9PCEYEoSk0oyFYtfGJnilm/iEe
	6/zD/unRZzCpc/BAJkBgxQi/gtsoF6xNWH3DhdD28kvZ/UTP3LAVT8ZOcjKk9rgU5rzmnNfFZpdJV
	43eXh0WgxaOHLKQNaglfS6FXAH1Ncyrcsiv7iTxiKLRiVba14WhUvcdKV6Z7t0ApWcm1LJC/BXsnB
	zukr2ajqG2Gw258IZDF0rN8TlI6DuijHYsO4r2Ba1pWLWI18D4JAEGVk5PUWKQs73smIKAhIEpOzB
	EkL3UVG5rbCC//Oy0y9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWhl-0000000DPyr-2zOn;
	Mon, 24 Feb 2025 11:32:57 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWVI-0000000DKD3-3WBj;
	Mon, 24 Feb 2025 11:20:06 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z1dQg35xWz9sSq;
	Mon, 24 Feb 2025 12:13:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id reeUmV24E4zC; Mon, 24 Feb 2025 12:13:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z1dQg2BZFz9sSp;
	Mon, 24 Feb 2025 12:13:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2FFAC8B765;
	Mon, 24 Feb 2025 12:13:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kefUlrU39Hz9; Mon, 24 Feb 2025 12:13:47 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C903F8B763;
	Mon, 24 Feb 2025 12:13:46 +0100 (CET)
Message-ID: <5e8a4dd9-50a8-4080-8d63-dbb8c7241b98@csgroup.eu>
Date: Mon, 24 Feb 2025 12:13:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Steven Price <steven.price@arm.com>, linux-mm@kvack.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-5-anshuman.khandual@arm.com>
 <8e75c5ff-a97b-4a6f-9c8b-ac2598eafe60@arm.com>
 <6e1201a1-60c1-40a3-951f-d603b6341a11@csgroup.eu>
 <03b042ec-1cb7-4419-8741-c65e74e49d51@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <03b042ec-1cb7-4419-8741-c65e74e49d51@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_032005_055654_DE741671 
X-CRM114-Status: UNSURE (   9.36  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAxNC8wMi8yMDI1IMOgIDA4OjI2LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IAo+IAo+IE9uIDIvMTMvMjUgMTc6MTksIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Cj4+Cj4+
IExlIDEzLzAyLzIwMjUgw6AgMTI6MjMsIFN0ZXZlbiBQcmljZSBhIMOpY3JpdMKgOgo+Pj4gT24g
MTMvMDIvMjAyNSAwNDowOSwgQW5zaHVtYW4gS2hhbmR1YWwgd3JvdGU6Cj4+Pj4gUGxhdGZvcm1z
IHN1YnNjcmliZSBpbnRvIGdlbmVyaWMgcHRkdW1wIGltcGxlbWVudGF0aW9uIHZpYSBHRU5FUklD
X1BURFVNUC4KPj4+PiBCdXQgZ2VuZXJpYyBwdGR1bXAgZ2V0cyBlbmFibGVkIHZpYSBQVERVTVBf
Q09SRS4gVGhlc2UgY29uZmlncyBjb21iaW5hdGlvbgo+Pj4+IGlzIGNvbmZ1c2luZyBhcyB0aGV5
IHNvdW5kIHZlcnkgc2ltaWxhciBhbmQgZG9lcyBub3QgZGlmZmVyZW50aWF0ZSBiZXR3ZWVuCj4+
Pj4gcGxhdGZvcm0ncyBmZWF0dXJlIHN1YnNjcmlwdGlvbiBhbmQgZmVhdHVyZSBlbmFibGVtZW50
IGZvciBwdGR1bXAuIFJlbmFtZQo+Pj4+IHRoZSBjb25maWdzIGFzIEFSQ0hfSEFTX1BURFVNUCBh
bmQgUFREVU1QIG1ha2luZyBpdCBtb3JlIGNsZWFyIGFuZCBpbXByb3ZlCj4+Pj4gcmVhZGFiaWxp
dHkuCj4+Pgo+Pj4gWy4uLl0KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2NvbmZpZ3Mv
bXBjODg1X2Fkc19kZWZjb25maWcgYi9hcmNoL3Bvd2VycGMvY29uZmlncy9tcGM4ODVfYWRzX2Rl
ZmNvbmZpZwo+Pj4+IGluZGV4IDc3MzA2YmU2MmU5ZS4uZGIwMDU2MTg2OTBiIDEwMDY0NAo+Pj4+
IC0tLSBhL2FyY2gvcG93ZXJwYy9jb25maWdzL21wYzg4NV9hZHNfZGVmY29uZmlnCj4+Pj4gKysr
IGIvYXJjaC9wb3dlcnBjL2NvbmZpZ3MvbXBjODg1X2Fkc19kZWZjb25maWcKPj4+PiBAQCAtNzgs
NCArNzgsNCBAQCBDT05GSUdfREVCVUdfVk1fUEdUQUJMRT15Cj4+Pj4gIMKgIENPTkZJR19ERVRF
Q1RfSFVOR19UQVNLPXkKPj4+PiAgwqAgQ09ORklHX0JESV9TV0lUQ0g9eQo+Pj4+ICDCoCBDT05G
SUdfUFBDX0VBUkxZX0RFQlVHPXkKPj4+PiAtQ09ORklHX0dFTkVSSUNfUFREVU1QPXkKPj4+PiAr
Q09ORklHX1BURFVNUD15Cj4+Pgo+Pj4gSSdkIHN1Z2dlc3QgZHJvcHAgdGhpcyBmcm9tIHRoZSBk
ZWZjb25maWcgdG9vLCBqdXN0IGxpa2UgcGF0Y2ggMSBkcm9wcGVkCj4+PiBpdCBmcm9tIGRlYnVn
LmNvbmZpZy4KPj4+Cj4+Cj4+IFRoYW5rcyBmb3Igc3BvdHRpbmcgdGhhdC4KPj4KPj4gVGhhdCBv
bmUgaXMgd3JvbmcuIFdhcyBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCBkMjEwZWUzZmRmZTggKCJwb3dl
cnBjL2NvbmZpZ3M6IFVwZGF0ZSBjb25maWcgZmlsZXMgZm9yIHJlbW92ZWQvcmVuYW1lZCBzeW1i
b2xzIikgd2hpY2ggYWltZWQgYXQgZml4aW5nIGNvbW1pdCBlMDg0NzI4MzkzYTUgKCJwb3dlcnBj
L3B0ZHVtcDogQ29udmVydCBwb3dlcnBjIHRvIEdFTkVSSUNfUFREVU1QIikgYnV0IGl0IGRpZCBp
dCB3cm9uZy4KPj4KPj4gSXQgaXMgQ09ORklHX1BURFVNUF9ERUJVR0ZTIHRoYXQgaXMgd2FudGVk
Lgo+IAo+IFNob3VsZCB0aGlzIHJlcGxhY2VtZW50IGJlIGRvbmUgaW4gdGhlIHNlcmllcyBvciB3
b3VsZCB5b3UgbGlrZSBpdAo+IHRvIGJlIGhhbmRsZWQgaW4gcG93ZXJwYyBsYXRlciA/CgpZZXMg
SSB0aGluayB5b3Ugc2hvdWxkIGRvIHRoZSByZXBsYWNlbWVudC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
