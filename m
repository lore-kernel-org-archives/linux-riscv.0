Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971F2C02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 07:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BtfqUCtgNtWcgEJfKGzZggQU5t4lYLIbFldR2l3kL7s=; b=qPV0r7NA7EjF/N
	kSTlxwhS3TIQYxsThXs2+IAvlDmS6F/e9TXQgW5b+VyqXGFReQqNT+NhGIjQHskJQCLc1t6n/V7jH
	W0IFvj7qkwD/8+W4OpDIo8Ng0DlOPKCaJ9++Wt04774TUSF1BvU76PRmebHK6udiOmYptFnyz6gEN
	CtFoR5742TRnTcv8DG8rRaz4V7K0mq2f4/CaNnqevz0D0vuWYFBgwdiW8hfvnjQiuH1VV0JcNboF5
	e/c+179zDHBopEwnhTYHNcr9+x1WQVqPG1HM4uqAGOBPyL56680Xjc7u0TT64j29C2HIVC6Vq+I/X
	7vxSTBhqYs++dmx3R/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipyl-0000000DwE0-1gDy;
	Fri, 14 Feb 2025 07:19:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tipxI-0000000DvwY-3F4X;
	Fri, 14 Feb 2025 07:17:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D429D113E;
	Thu, 13 Feb 2025 23:18:03 -0800 (PST)
Received: from [10.163.37.128] (unknown [10.163.37.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A8453F58B;
	Thu, 13 Feb 2025 23:17:34 -0800 (PST)
Message-ID: <e7f80acd-623b-4fda-9292-6f8344d0f185@arm.com>
Date: Fri, 14 Feb 2025 12:47:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org
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
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-5-anshuman.khandual@arm.com>
 <4fa83d76-117f-41bc-9137-676fb0c204dd@csgroup.eu>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <4fa83d76-117f-41bc-9137-676fb0c204dd@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_231744_849445_F94360EF 
X-CRM114-Status: GOOD (  11.69  )
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

T24gMi8xMy8yNSAxMzowOCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiAKPiAKPiBMZSAxMy8w
Mi8yMDI1IMOgIDA1OjA5LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+PiBQbGF0Zm9y
bXMgc3Vic2NyaWJlIGludG8gZ2VuZXJpYyBwdGR1bXAgaW1wbGVtZW50YXRpb24gdmlhIEdFTkVS
SUNfUFREVU1QLgo+PiBCdXQgZ2VuZXJpYyBwdGR1bXAgZ2V0cyBlbmFibGVkIHZpYSBQVERVTVBf
Q09SRS4gVGhlc2UgY29uZmlncyBjb21iaW5hdGlvbgo+PiBpcyBjb25mdXNpbmcgYXMgdGhleSBz
b3VuZCB2ZXJ5IHNpbWlsYXIgYW5kIGRvZXMgbm90IGRpZmZlcmVudGlhdGUgYmV0d2Vlbgo+PiBw
bGF0Zm9ybSdzIGZlYXR1cmUgc3Vic2NyaXB0aW9uIGFuZCBmZWF0dXJlIGVuYWJsZW1lbnQgZm9y
IHB0ZHVtcC4gUmVuYW1lCj4+IHRoZSBjb25maWdzIGFzIEFSQ0hfSEFTX1BURFVNUCBhbmQgUFRE
VU1QIG1ha2luZyBpdCBtb3JlIGNsZWFyIGFuZCBpbXByb3ZlCj4+IHJlYWRhYmlsaXR5Lgo+IAo+
IEZvciBtZSBHRU5FUklDX1BURFVNUCBpcyBtb3JlIGV4cGxpY2l0IGFuZCBzaW1pbGFyIHRvIEdF
TkVSSUNfSU9NQVAgb3IgR0VORVJJQ19JT1JFTUFQIG9yIEdFTkVSSUNfR0VUVElNRU9GREFZOiBU
aGUgYXJjaCBwcm92aWRlcyB0aGUgbmVjZXNzYXJ5IGhlbHBlcnMgdG8gdXNlIHRoZSBnZW5lcmlj
IGltcGxlbWVudGF0aW9uLgoKSSBkbyByZWFsaXplIHRoYXQgR0VORVJJQ18gaXMgYW5vdGhlciBt
ZXRob2QgZm9yIGFjaGlldmluZyBzaGFyZWQKZmVhdHVyZSBhY3Jvc3MgbXVsdGlwbGUgcGxhdGZv
cm1zIHZpYSBwcm92aWRpbmcgbmVjZXNzYXJ5IGhlbHBlcnMuCkJ1dCBJIGd1ZXNzIHRoZXJlIG1p
Z2h0IGJlIGEgZGlmZmVyZW5jZSAtIGl0IG1pZ2h0IG5vdCBoYXZlIG90aGVyCnNpbWlsYXIgYnV0
IHNlcGFyYXRlIGRlcGVuZGVudCBjb25maWdzID8KCj4gCj4gRm9yIG1lIEFSQ0hfSEFTX1BURFVN
UCBqdXN0IG1lYW4ndCB0aGF0IGFuIGFyY2hpdGVjdHVyZSBpbXBsZW1lbnRzIFBURFVNUCwgaXQg
ZG9lc24ndCBtZWFuIGl0IGRvZXMgaXQgYnkgdXNpbmcgdGhlIGdlbmVyaWMgaW5mcmFzdHJ1Y3R1
cmUuCgpBUkNIX0hBU19YWFggaW5kaWNhdGVzIHRoYXQgYW4gYXJjaGl0ZWN0dXJlIHN1YnNjcmli
ZXMgdG8gYSBnZW5lcmljCmZlYXR1cmUgWFhYLCBieSBpbXBsZW1lbnRpbmcgYWxsIG5lY2Vzc2Fy
eSBoZWxwZXJzLiBCdXQgdGhlIGZlYXR1cmUKaW4gaXRzZWxmIGlzIGEgZ2VuZXJpYyBhbmQgYSBz
aGFyZWQgb25lLgoKSWYgdGhlIHBsYXRmb3JtIHdlcmUgdG8gaW1wbGVtZW50IGEgZmVhdHVyZSBv
biBpdHMgb3duIHdpdGhvdXQgYW55CmdlbmVyaWMgY29tcG9uZW50LCBpdCBjb3VsZCBkbyB0aGF0
IHZpYSBhIHNlcGFyYXRlIHBsYXRmb3JtIHNwZWNpZmljCmNvbmZpZyB3aXRob3V0IHJlcXVpcmlu
ZyBBUkNIX0hBU19YWFggYmFzZWQgc3Vic2NyaXB0aW9uIGluZGljYXRpb24uCgo+IAo+IEZvciBp
bnN0YW5jZSwgYXJtMzIgaW1wbGVtZW50cyBQVERVTVAgYnV0IHdpdGhvdXQgdXNpbmcgdGhlIGdl
bmVyaWMgb25lIHNvIEkgd291bGQgc2F5IHRoYXQgYXJtMzIgaGFzIFBURFVNUCBhbmQgZXhwZWN0
IGl0IHRvIHNlbGVjdCBBUkNIX0hBU19QVERVTVAKCkFjdHVhbGx5IGl0IGRvZXMgbm90IG5lZWQg
dG8gc2VsZWN0IEFSQ0hfSEFTX1BURFVNUCwgYXMgaXQgZG9lcyBub3QKc3Vic2NyaWJlIGludG8g
Z2VuZXJpYyBQVERVTVAuIExldCdzIHNlZSBQVERVTVAgY29uZmlncyBvbiBhcm0gKDMyKQoKQVJN
X1BURFVNUF9DT1JFCkFSTV9QVERVTVBfREVCVUdGUwktLT4gc2VsZWN0IEFSTV9QVERVTVBfQ09S
RQpBUk1fREVCVUdfV1ggCQktLT4gc2VsZWN0IEFSTV9QVERVTVBfQ09SRQoKVGhlIHBsYXRmb3Jt
IGhhcyBhIHNlbGYgY29udGFpbmVkIFBURFVNUCBpbXBsZW1lbnRhdGlvbiB3aGljaCBkb2VzCm5v
dCBkZXBlbmQgb24gZ2VuZXJpYyBQVERVTVAgYXQgYWxsLiBIZW5jZSBhbGwgdGhlc2UgcHRkdW1w
IGNvbmZpZ3MKYXJlIG1hcmtlZCBhcyBBUk1fIGV0YyBhcyB0aGV5IGFyZSBwbGF0Zm9ybSBzcGVj
aWZpYy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
