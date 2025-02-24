Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F140FC021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 11:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=puhRpWnZV0E9cYoOJjPr5Lcy0+bVXMVeB8Ah4J9MoY8=; b=Q5hqhdQdkkJYt3
	dLPm+yZFHMjTw5SuWtgioirAy6fHlxXJh8Jv2EZgIAc3M+Trp0qgLdcpSCn0ACTu4o+YPQsH/RAmo
	D7042GO845iQ7fYuQjdUjgsfUryc6o11oyjtmU/jpt7pxrCMJUxXr5a2GQ4wNyi7g1s4xhy6WazCc
	p4wAv7EAzSic4xM6qgo0PkZtFqhpVhbwGmoJJ7YGDrqY2KctRSw4wDZLbFJUMMdrmr6DSvBLd8jJN
	k9k6BFyWOhzyxP63X542IipQa+vgH591ys+gPMlZiG9nLP62Y44zWMijb/CI2iPbgT70D+D/17RHt
	TuE4c+GaG8Lkym6g2hRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWjK-0000000DQMA-33pj;
	Mon, 24 Feb 2025 11:34:34 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWVJ-0000000DKE6-2BVi;
	Mon, 24 Feb 2025 11:20:06 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z1dPS72wNz9sSn;
	Mon, 24 Feb 2025 12:12:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SIiDK1YPjhuf; Mon, 24 Feb 2025 12:12:44 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z1dPS5txxz9sSm;
	Mon, 24 Feb 2025 12:12:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B3BD38B765;
	Mon, 24 Feb 2025 12:12:44 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id tnzzpVojmwHn; Mon, 24 Feb 2025 12:12:44 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 63CE98B763;
	Mon, 24 Feb 2025 12:12:44 +0100 (CET)
Message-ID: <43937a0a-679e-47e8-a4c5-d20759ef53c8@csgroup.eu>
Date: Mon, 24 Feb 2025 12:12:44 +0100
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
 <4fa83d76-117f-41bc-9137-676fb0c204dd@csgroup.eu>
 <e7f80acd-623b-4fda-9292-6f8344d0f185@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <e7f80acd-623b-4fda-9292-6f8344d0f185@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_032005_723534_553ED0B7 
X-CRM114-Status: GOOD (  18.36  )
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

CgpMZSAxNC8wMi8yMDI1IMOgIDA4OjE3LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IE9uIDIvMTMvMjUgMTM6MDgsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Cj4+Cj4+IExlIDEz
LzAyLzIwMjUgw6AgMDU6MDksIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6Cj4+PiBQbGF0
Zm9ybXMgc3Vic2NyaWJlIGludG8gZ2VuZXJpYyBwdGR1bXAgaW1wbGVtZW50YXRpb24gdmlhIEdF
TkVSSUNfUFREVU1QLgo+Pj4gQnV0IGdlbmVyaWMgcHRkdW1wIGdldHMgZW5hYmxlZCB2aWEgUFRE
VU1QX0NPUkUuIFRoZXNlIGNvbmZpZ3MgY29tYmluYXRpb24KPj4+IGlzIGNvbmZ1c2luZyBhcyB0
aGV5IHNvdW5kIHZlcnkgc2ltaWxhciBhbmQgZG9lcyBub3QgZGlmZmVyZW50aWF0ZSBiZXR3ZWVu
Cj4+PiBwbGF0Zm9ybSdzIGZlYXR1cmUgc3Vic2NyaXB0aW9uIGFuZCBmZWF0dXJlIGVuYWJsZW1l
bnQgZm9yIHB0ZHVtcC4gUmVuYW1lCj4+PiB0aGUgY29uZmlncyBhcyBBUkNIX0hBU19QVERVTVAg
YW5kIFBURFVNUCBtYWtpbmcgaXQgbW9yZSBjbGVhciBhbmQgaW1wcm92ZQo+Pj4gcmVhZGFiaWxp
dHkuCj4+Cj4+IEZvciBtZSBHRU5FUklDX1BURFVNUCBpcyBtb3JlIGV4cGxpY2l0IGFuZCBzaW1p
bGFyIHRvIEdFTkVSSUNfSU9NQVAgb3IgR0VORVJJQ19JT1JFTUFQIG9yIEdFTkVSSUNfR0VUVElN
RU9GREFZOiBUaGUgYXJjaCBwcm92aWRlcyB0aGUgbmVjZXNzYXJ5IGhlbHBlcnMgdG8gdXNlIHRo
ZSBnZW5lcmljIGltcGxlbWVudGF0aW9uLgo+IAo+IEkgZG8gcmVhbGl6ZSB0aGF0IEdFTkVSSUNf
IGlzIGFub3RoZXIgbWV0aG9kIGZvciBhY2hpZXZpbmcgc2hhcmVkCj4gZmVhdHVyZSBhY3Jvc3Mg
bXVsdGlwbGUgcGxhdGZvcm1zIHZpYSBwcm92aWRpbmcgbmVjZXNzYXJ5IGhlbHBlcnMuCj4gQnV0
IEkgZ3Vlc3MgdGhlcmUgbWlnaHQgYmUgYSBkaWZmZXJlbmNlIC0gaXQgbWlnaHQgbm90IGhhdmUg
b3RoZXIKPiBzaW1pbGFyIGJ1dCBzZXBhcmF0ZSBkZXBlbmRlbnQgY29uZmlncyA/Cj4gCj4+Cj4+
IEZvciBtZSBBUkNIX0hBU19QVERVTVAganVzdCBtZWFuJ3QgdGhhdCBhbiBhcmNoaXRlY3R1cmUg
aW1wbGVtZW50cyBQVERVTVAsIGl0IGRvZXNuJ3QgbWVhbiBpdCBkb2VzIGl0IGJ5IHVzaW5nIHRo
ZSBnZW5lcmljIGluZnJhc3RydWN0dXJlLgo+IAo+IEFSQ0hfSEFTX1hYWCBpbmRpY2F0ZXMgdGhh
dCBhbiBhcmNoaXRlY3R1cmUgc3Vic2NyaWJlcyB0byBhIGdlbmVyaWMKPiBmZWF0dXJlIFhYWCwg
YnkgaW1wbGVtZW50aW5nIGFsbCBuZWNlc3NhcnkgaGVscGVycy4gQnV0IHRoZSBmZWF0dXJlCj4g
aW4gaXRzZWxmIGlzIGEgZ2VuZXJpYyBhbmQgYSBzaGFyZWQgb25lLgoKSSdtIG5vdCBzdXJlIGFi
b3V0IHlvdXIgaW50ZXJwcmV0YXRpb24uCgpGb3IgaW5zdGFuY2UgQ09ORklHX0FSQ0hfSEFTX0lM
T0cyX1UzMiBtZWFucyB0aGF0IGEgcGxhdGVmb3JtIHByb3ZpZGVzIAppdHMgb3duIGltcGxlbWVu
dGF0aW9uLiBXaGVuIHRoaXMgaXMgX05PVF8gZGVmaW5lZCwgdGhlbiB0aGUgZ2VuZXJpYyAKaW1w
bGVtZW50YXRpb24gaXMgdXNlZCBpbnN0ZWFkLgoKPiAKPiBJZiB0aGUgcGxhdGZvcm0gd2VyZSB0
byBpbXBsZW1lbnQgYSBmZWF0dXJlIG9uIGl0cyBvd24gd2l0aG91dCBhbnkKPiBnZW5lcmljIGNv
bXBvbmVudCwgaXQgY291bGQgZG8gdGhhdCB2aWEgYSBzZXBhcmF0ZSBwbGF0Zm9ybSBzcGVjaWZp
Ywo+IGNvbmZpZyB3aXRob3V0IHJlcXVpcmluZyBBUkNIX0hBU19YWFggYmFzZWQgc3Vic2NyaXB0
aW9uIGluZGljYXRpb24uCgpOb3Qgc3VyZS4gVXN1YWxseSB3aGVuIGEgcGxhdGVmb3JtIG5lZWRz
IHNvbWV0aGluZyBnZW5lcmljIGl0IHN1YnNjcmliZXMgCnRvIHNvbWV0aGluZyBsaWtlIENPTkZJ
R19BUkNIX1dBTlRfR0VORVJBTF9IVUdFVExCCgoKPiAKPj4KPj4gRm9yIGluc3RhbmNlLCBhcm0z
MiBpbXBsZW1lbnRzIFBURFVNUCBidXQgd2l0aG91dCB1c2luZyB0aGUgZ2VuZXJpYyBvbmUgc28g
SSB3b3VsZCBzYXkgdGhhdCBhcm0zMiBoYXMgUFREVU1QIGFuZCBleHBlY3QgaXQgdG8gc2VsZWN0
IEFSQ0hfSEFTX1BURFVNUAo+IAo+IEFjdHVhbGx5IGl0IGRvZXMgbm90IG5lZWQgdG8gc2VsZWN0
IEFSQ0hfSEFTX1BURFVNUCwgYXMgaXQgZG9lcyBub3QKPiBzdWJzY3JpYmUgaW50byBnZW5lcmlj
IFBURFVNUC4gTGV0J3Mgc2VlIFBURFVNUCBjb25maWdzIG9uIGFybSAoMzIpCj4gCj4gQVJNX1BU
RFVNUF9DT1JFCj4gQVJNX1BURFVNUF9ERUJVR0ZTCS0tPiBzZWxlY3QgQVJNX1BURFVNUF9DT1JF
Cj4gQVJNX0RFQlVHX1dYIAkJLS0+IHNlbGVjdCBBUk1fUFREVU1QX0NPUkUKPiAKPiBUaGUgcGxh
dGZvcm0gaGFzIGEgc2VsZiBjb250YWluZWQgUFREVU1QIGltcGxlbWVudGF0aW9uIHdoaWNoIGRv
ZXMKPiBub3QgZGVwZW5kIG9uIGdlbmVyaWMgUFREVU1QIGF0IGFsbC4gSGVuY2UgYWxsIHRoZXNl
IHB0ZHVtcCBjb25maWdzCj4gYXJlIG1hcmtlZCBhcyBBUk1fIGV0YyBhcyB0aGV5IGFyZSBwbGF0
Zm9ybSBzcGVjaWZpYy4KClRoYXQncyB0aGUgcmVhc29uIHdoeSBJIGJlbGlldmUgdGhlIHdvcmRp
bmcgQ09ORklHX0FSQ0hfSEFTX1NPTUVUSElORyBpcyAKbm90IGFwcHJvcHJpYXRlLgoKQ2hyaXN0
b3BoZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
