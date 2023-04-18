Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A94C77B71
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 08:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYuW79Jfl/o+Obsj9PLEliMe3NnlfjbtUk2RSiSoEbk=; b=pOkGM5QxN5NmxF
	zt6EMvTmWS7rqP/tJ6bfcEO3aox2nbphrcG67Lz1uPAxJrxmMAyIkKOLMF5OT0CK1U/JdMIa45DUB
	mgyLdPGkt6RRrT2gsiUxXJCJIe7IC0tMJLOxCkwKG06i51sPpd9QOByL2kWcuT2mEso3s/KNQbbnG
	uFdV+REGZdEn1eNjCGt9FYhozRNaKesa8qKLSj6hhHtKe0P8Xpi8SPJ+u36sfrL+su2kHR8SO4ZRI
	mv9AkJTqj+1oU9ZHytfVxoY7fzbct62Q4oD1aB8HH7XEhndbnVOXpSeRyPJoXEBiCO3Z26hDfSe2E
	FMOOZQBqb2PHhsQVHn/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pogth-001MBr-1d;
	Tue, 18 Apr 2023 08:41:09 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pogtd-001M8a-0n;
	Tue, 18 Apr 2023 08:41:07 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681807259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcloEN6PHwdxX+wR7PTxsLZ5R7H2GaplG8eadvwcPdo=;
	b=YSKoMebO1SMgoiijw3sT6dUmL/DeC/wEBV7I8b1z9zceTKQGSQcXYB/YeSo0ccQDTS56AJ
	nhdRaDZ0NwXgH8hEOLQ/dTVz+deZ2fOLHnFZiiQisU0IHpMqNc6BSUUtDUgjhVk1lqhuiZ
	hUb1G4MomabLXGs1y5CDoqcnpdFFKWDNC8+YA3UX2Tbl5n22OpF5WIiJBUlmrHKqBerKx2
	wlWzIAPgOX14nhVpRxuNgRbo/aKsOKfHG6jdAiFfsWbGz9WdOu4gVRxQNpL5YEqBPaHGvU
	oTthGjE00T8jwQcWEiZWH5/TiAxdRfJ1M3JoIe2bb3crK0Gl32O2LSnNFxiq6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681807259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcloEN6PHwdxX+wR7PTxsLZ5R7H2GaplG8eadvwcPdo=;
	b=rNfKPYcxDWHHNemvWuh/rsGPuG8dn/TolEBJI+1ZiBhvXwc9cXh+Pw7pgY4xNT8GFDtc33
	j+rvG82H6UitkyAQ==
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, Tom
 Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, David Woodhouse <dwmw@amazon.co.uk>, Usama
 Arif <usama.arif@bytedance.com>, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E. J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
In-Reply-To: <87ttxd4qxz.ffs@tglx>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de> <87wn2a4la5.ffs@tglx>
 <bd5a6a93-def1-9248-2258-c3d3b40071ef@molgen.mpg.de> <87ttxd4qxz.ffs@tglx>
Date: Tue, 18 Apr 2023 10:40:57 +0200
Message-ID: <87r0sh4m7a.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_014105_446312_4CD02CAD 
X-CRM114-Status: GOOD (  13.34  )
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

T24gVHVlLCBBcHIgMTggMjAyMyBhdCAwODo1OCwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+IE9u
IE1vbiwgQXByIDE3IDIwMjMgYXQgMTk6NDAsIFBhdWwgTWVuemVsIHdyb3RlOgo+PiBBbSAxNy4w
NC4yMyB1bSAxNjo0OCBzY2hyaWViIFRob21hcyBHbGVpeG5lcjoKPj4KPj4+IE9uIE1vbiwgQXBy
IDE3IDIwMjMgYXQgMTM6MTksIFBhdWwgTWVuemVsIHdyb3RlOgo+Pj4+IEFtIDE1LjA0LjIzIHVt
IDAxOjQ0IHNjaHJpZWIgVGhvbWFzIEdsZWl4bmVyOgo+Pj4+IFsgICAgMC4yNTgxOTNdIHNtcGJv
b3Q6IENQVTA6IEFNRCBBNi02NDAwSyBBUFUgd2l0aCBSYWRlb24odG0pIEhECj4+Pj4gR3JhcGhp
Y3MgKGZhbWlseTogMHgxNSwgbW9kZWw6IDB4MTMsIHN0ZXBwaW5nOiAweDEpCj4+Pj4gW+KApl0K
Pj4+PiBbICAgIDAuMjU5MzI5XSBzbXA6IEJyaW5naW5nIHVwIHNlY29uZGFyeSBDUFVzIC4uLgo+
Pj4+IFsgICAgMC4yNTk1MjddIHg4NjogQm9vdGluZyBTTVAgY29uZmlndXJhdGlvbjoKPj4+PiBb
ICAgIDAuMjU5NTI4XSAuLi4uIG5vZGUgICMwLCBDUFVzOiAgICAgICMxCj4+Pj4gWyAgICAwLjI2
MTAwN10gQWZ0ZXIgc2NoZWR1bGVfcHJlZW1wdF9kaXNhYmxlZAo+Pj4+IFsgICAxMC4yNjA5OTBd
IENQVTEgZmFpbGVkIHRvIHJlcG9ydCBhbGl2ZSBzdGF0ZQo+Pj4gCj4+PiBXZWlyZC4gQ1BVMSBm
YWlscyB0byBjb21lIHVwIGFuZCByZXBvcnQgdGhhdCBpdCBoYXMgcmVhY2hlZCB0aGUKPj4+IHN5
bmNocm9uaXphdGlvbiBwb2ludC4KPj4+IAo+Pj4gRG9lcyBpdCB3b3JrIHdoZW4geW91IGFkZCBj
cHVocC5wYXJhbGxlbD1vZmYgb24gdGhlIGtlcm5lbCBjb21tYW5kIGxpbmU/Cj4+Cj4+IFllcywg
dGhlIHRlbiBzZWNvbmRzIGRlbGF5IGlzIGdvbmUgd2l0aCBgY3B1aHAucGFyYWxsZWw9b2ZmYC4K
Pj4KPj4gVGhlcmUgd2FzIGEgcGF0Y2ggc2V0IGluIHRoZSBwYXN0LCB0aGF0IHdvcmtlZCBvbiB0
aGF0IGRldmljZS4gSSB0aGluayAKPj4gdXAgdG8gdjQgaXQgZGlkICpub3QqIHdvcmsgYXQgYWxs
IGFuZCBodW5nIFsxXS4gSSBuZWVkIHNvbWUgZGF5cyB0byAKPj4gY29sbGVjdCB0aGUgcmVzdWx0
cyBhZ2Fpbi4KPgo+IENhbiB5b3UgcGxlYXNlIGFwcGx5IHRoZSBwYXRjaCBiZWxvdyBvbiB0b3Ag
b2YgdGhlIHBpbGUgcmVtb3ZlIHRoZQo+IGNvbW1hbmQgbGluZSBvcHRpb24gYWdhaW4/CgpCYWgu
IFRoYXQgcGF0Y2ggZG9lcyBub3QgbWFrZSBhbnkgc2Vuc2UgYXQgYWxsLiBOb3QgZW5vdWdoIGNv
ZmZlZS4KCkNhbiB5b3UgcGxlYXNlIHByb3ZpZGUgdGhlIG91dHB1dCBvZiBjcHVpZD8KClRoYW5r
cywKCiAgICAgICAgdGdseAoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
