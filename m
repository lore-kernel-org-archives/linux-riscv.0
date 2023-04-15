Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CC3C77B70
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Apr 2023 21:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6xScnH14R1UqmNtCWD7S9FOH/d0lICvXJffsJLBwzk=; b=emo3Rl8r5c41WX
	X+/UqXzwY9ba7UKTZrdJQwDT4Ja3bmTcvqF6XmwW6L20p5EztVU1gAjtTy5EgUDYvkmJV4MD8h4k4
	UTwJpz8OETU5UUEIzCervsXXH8tL1zofF/SKM5uxkpaR5eTBmjSZFj9PtseCXF3khynRFhIZOpo3E
	jx2oXKh28HPJy3zLU30g7rdrl/2kHyyBfDgAecWqkntZlNjrxjLnU5ko67lVwaUw31wE+DKgh2K2P
	oDUcbapSBDDPx3Q/gEX/ddwvbGyWgLgaKkhEQkjRpBKHPAbmD4rKeH7eH1ySKKegY8g8FxNwWZ+H1
	EjdjZyDd23lIo4+BBrkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnn6a-00Cirw-1p;
	Sat, 15 Apr 2023 21:06:44 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnn6W-00Ciqj-1o;
	Sat, 15 Apr 2023 21:06:41 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681592799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3DiOB1jbfBoIoBcKhJ+tlgldd4KD5aJr4Sg6j9ebPUI=;
	b=P2JRe5U4lJMHWRXIblQx0pIuiWd2AghPV4KuEWvmDuReSyOVhQCCEFeElO4eRip+BZst8j
	FEt9t2BOSLC4o1kel1IC1nngSPriEuvEd6hiCJGBQiNkbnbNfFcto1Vl3sKZG2ESMonhFs
	An5RJlKu7/tSGpzgHR6Z7KG43eMP0SiKp3vTl4fTzoc+BUJC8yEtxBJufLRq9lbmeibFXN
	sl7kTAsogFv4BEj0maXzziyeRxITPDLItnz8esS3e+KABEeGtBs5ADBH+SUHP2X3sjvsCF
	sA5xfsq3ODgQ/B4I43wW92xDuUJXBh2S1RtOiUBnGhQ7c+K3ylqiGKlbM1+Z/A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681592799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3DiOB1jbfBoIoBcKhJ+tlgldd4KD5aJr4Sg6j9ebPUI=;
	b=QEW/hhbgWQeeaCKMhDdxi3o+5E2lnyqCY4azQRMF5wvL6dQ0zBCYuANaf/0HtZpTDBh4rO
	TIZpqZPJS0yZKOCg==
To: Brian Gerst <brgerst@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Arjan van
 de Veen <arjan@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Paul
 McKenney <paulmck@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>, Oleksandr Natalenko
 <oleksandr@natalenko.name>, Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, David Woodhouse <dwmw@amazon.co.uk>, Usama
 Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 35/37] x86/smpboot: Support parallel startup of
 secondary CPUs
In-Reply-To: <CAMzpN2hUbYpYrqDL1ViXUWGKGa7mDEG6iHtWEZg9GvrAoRgvKQ@mail.gmail.com>
References: <20230414225551.858160935@linutronix.de>
 <20230414232311.379210081@linutronix.de>
 <CAMzpN2hUbYpYrqDL1ViXUWGKGa7mDEG6iHtWEZg9GvrAoRgvKQ@mail.gmail.com>
Date: Sat, 15 Apr 2023 23:06:38 +0200
Message-ID: <87mt38yhwh.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230415_140640_752528_BD6C18F4 
X-CRM114-Status: GOOD (  11.64  )
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

T24gU2F0LCBBcHIgMTUgMjAyMyBhdCAwOToyMiwgQnJpYW4gR2Vyc3Qgd3JvdGU6Cj4gT24gRnJp
LCBBcHIgMTQsIDIwMjMgYXQgNzo0NeKAr1BNIFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJv
bml4LmRlPiB3cm90ZToKPj4gQEAgLTI0OCwxMCArMzExLDIwIEBAIFNZTV9JTk5FUl9MQUJFTChz
ZWNvbmRhcnlfc3RhcnR1cF82NF9ub18KPj4gICAgICAgICAgKgo+PiAgICAgICAgICAqIFJEWCBj
b250YWlucyB0aGUgcGVyLWNwdSBvZmZzZXQKPj4gICAgICAgICAgKi8KPj4gLSAgICAgICBtb3Zx
ICAgIHBjcHVfaG90ICsgWDg2X2N1cnJlbnRfdGFzayglcmR4KSwgJXJheAo+PiAtICAgICAgIG1v
dnEgICAgVEFTS190aHJlYWRzcCglcmF4KSwgJXJzcAo+PiArICAgICAgIG1vdnEgICAgcGNwdV9o
b3QgKyBYODZfdG9wX29mX3N0YWNrKCVyZHgpLCAlcnNwCj4KPiBTd2l0Y2hpbmcgdG8gdXNpbmcg
cGNwdV9ob3QudG9wX29mX3N0YWNrIGlzIG9rLCBidXQgaXQncyBub3QKPiBjb21wbGV0ZWx5IGVx
dWl2YWxlbnQuICB0b3Bfb2Zfc3RhY2sgcG9pbnRzIHRvIHRoZSBlbmQgb2YgdGhlIHB0X3JlZ3MK
PiBzdHJ1Y3R1cmUsIHdoaWxlIHRoZSBrZXJuZWwgc3RhY2sgc3RhcnRzIGJlbG93IHB0X3JlZ3Mg
ZXZlbiBmb3Iga2VybmVsCj4gdGhyZWFkcy4gIFNvIHlvdSBuZWVkIHRvIHN1YnRyYWN0IFBUUkVH
U19TSVpFIGZyb20gdGhlIHN0YWNrIHBvaW50ZXIKPiBhZnRlciB0aGlzLgo+Cj4gVGhpcyBjaGFu
Z2Ugc2hvdWxkIGFsc28gYmUgYSBzZXBhcmF0ZSBwYXRjaC4KCllvdSdyZSByaWdodCBvbiBib3Ro
IGNvdW50cy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
