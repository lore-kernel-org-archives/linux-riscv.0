Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD60C0219D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 07:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29QtilIsT1yCUbqAmNEhQm1LnHkAXMV9G9FaUowRdCs=; b=435G/iSk2EdNF9
	dE4EVwR061VePEfZJV2nsiQMjUDwjQOm9oYjBUR1059Lg60BNRYdTzj+bYlhzRtT+M+KmbyVmdX3I
	bV+Y9XiMi5Qj6p0GlRlB28JL4SeTcMf+XwWrNJxqQwc0pWtQqboC/PfvuoAOyZ+eM079/I5hLCMv0
	bjsKQieCb03aQMqn9xpyAzOfOavx4JP1hcSIv2ZWgs4nhi0itl+ScdvMVOLJ23covw9BOTLm6/Rri
	iAWA4CerBHIepSJ7KrcgWEMTPURPDDR6zq2SDT0+qFGfjc76ILySeD2W6a89NkYadLb3g3aGJmusp
	m7DBML0tHbAQCiqkVvfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiU1I-0000000AA2g-0urJ;
	Thu, 13 Feb 2025 07:52:24 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTz3-0000000A9h5-0Zwo;
	Thu, 13 Feb 2025 07:50:06 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Ytn9Z50cpz9sSC;
	Thu, 13 Feb 2025 08:38:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zu_4Dd552sBQ; Thu, 13 Feb 2025 08:38:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Ytn9Z489bz9rvV;
	Thu, 13 Feb 2025 08:38:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 883988B770;
	Thu, 13 Feb 2025 08:38:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id LjIk626zRboP; Thu, 13 Feb 2025 08:38:42 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E8148B763;
	Thu, 13 Feb 2025 08:38:41 +0100 (CET)
Message-ID: <4fa83d76-117f-41bc-9137-676fb0c204dd@csgroup.eu>
Date: Thu, 13 Feb 2025 08:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
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
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-5-anshuman.khandual@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250213040934.3245750-5-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_235005_341655_D795D4CE 
X-CRM114-Status: UNSURE (   5.74  )
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

CgpMZSAxMy8wMi8yMDI1IMOgIDA1OjA5LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IFBsYXRmb3JtcyBzdWJzY3JpYmUgaW50byBnZW5lcmljIHB0ZHVtcCBpbXBsZW1lbnRhdGlvbiB2
aWEgR0VORVJJQ19QVERVTVAuCj4gQnV0IGdlbmVyaWMgcHRkdW1wIGdldHMgZW5hYmxlZCB2aWEg
UFREVU1QX0NPUkUuIFRoZXNlIGNvbmZpZ3MgY29tYmluYXRpb24KPiBpcyBjb25mdXNpbmcgYXMg
dGhleSBzb3VuZCB2ZXJ5IHNpbWlsYXIgYW5kIGRvZXMgbm90IGRpZmZlcmVudGlhdGUgYmV0d2Vl
bgo+IHBsYXRmb3JtJ3MgZmVhdHVyZSBzdWJzY3JpcHRpb24gYW5kIGZlYXR1cmUgZW5hYmxlbWVu
dCBmb3IgcHRkdW1wLiBSZW5hbWUKPiB0aGUgY29uZmlncyBhcyBBUkNIX0hBU19QVERVTVAgYW5k
IFBURFVNUCBtYWtpbmcgaXQgbW9yZSBjbGVhciBhbmQgaW1wcm92ZQo+IHJlYWRhYmlsaXR5LgoK
Rm9yIG1lIEdFTkVSSUNfUFREVU1QIGlzIG1vcmUgZXhwbGljaXQgYW5kIHNpbWlsYXIgdG8gR0VO
RVJJQ19JT01BUCBvciAKR0VORVJJQ19JT1JFTUFQIG9yIEdFTkVSSUNfR0VUVElNRU9GREFZOiBU
aGUgYXJjaCBwcm92aWRlcyB0aGUgbmVjZXNzYXJ5IApoZWxwZXJzIHRvIHVzZSB0aGUgZ2VuZXJp
YyBpbXBsZW1lbnRhdGlvbi4KCkZvciBtZSBBUkNIX0hBU19QVERVTVAganVzdCBtZWFuJ3QgdGhh
dCBhbiBhcmNoaXRlY3R1cmUgaW1wbGVtZW50cyAKUFREVU1QLCBpdCBkb2Vzbid0IG1lYW4gaXQg
ZG9lcyBpdCBieSB1c2luZyB0aGUgZ2VuZXJpYyBpbmZyYXN0cnVjdHVyZS4KCkZvciBpbnN0YW5j
ZSwgYXJtMzIgaW1wbGVtZW50cyBQVERVTVAgYnV0IHdpdGhvdXQgdXNpbmcgdGhlIGdlbmVyaWMg
b25lIApzbyBJIHdvdWxkIHNheSB0aGF0IGFybTMyIGhhcyBQVERVTVAgYW5kIGV4cGVjdCBpdCB0
byBzZWxlY3QgQVJDSF9IQVNfUFREVU1QCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
