Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A99C77B72
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvMGnAZJ1NAj0elp/jafDt48Zu9iQXtcnqEpI6UkBCw=; b=e/HPwujnifd8LI
	e2xqzB3EMZy5CFyYPaTZ+YrJ53bHWbxffMBHmJN84QdQI50LWMePJg7nFKFMrBZDCbbRrbM5g2acI
	3aUnCyK7XQv21TerI7VkRVObPddcOw6EKNz9ecGUVoLHuolQaMtpnDIwL1LWrStvjzO1bYP3/j0bj
	HLPCyoE6O+QDVsoa/a4xaZwMcuJvq0zhgeGEABHl0D7gJ61f1bV30s7WevnkX/BVc56if1v1mugJL
	B01orDAOGLJOWUEFSVydhENo+n+blf8Dq047tTW4tObWeItCJ20k9h/2oNJvUT/+y7KLDJP8RCfmt
	+6ptAguxVMNyPd/8eeYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppSIU-007uoD-1F;
	Thu, 20 Apr 2023 11:17:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppSIQ-007umF-1R;
	Thu, 20 Apr 2023 11:17:51 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681989462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t5XqcHn966UpzdXXi00/lSAzdYJUEVQOjSwT6u3WS8Y=;
	b=pAb6n5DzMyj9cPuaDVh1nEa4eMPTGWjlabRanF0gKYgC9Dt16bSxIF65k8A6Phxdd7b+m1
	8rtjGcomkGZGHPfqi5gCMDsNgIxkIz7fE3iWI1yVPEr7CzAxuLO52VMUjueL9yA1cignQ0
	2aZBXvrGK95/A3SZLIzR4CO2Gt6BjAJeGZFwZ0r5DeQJZY9f+42NHleeHSDTjxF+sNMncp
	Pj8zsu3xSjO1U4uiCaq79l7sMSO/XzBLws+gTsKxCyOwMVcTz52DRxt/Fl9qBPDScBZpAE
	EzRwxWNG9FQP9wQGTFVsN5ZBm94BxGBjsCTcRwuXnpgNipezItO8FzlRvwCjfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681989462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t5XqcHn966UpzdXXi00/lSAzdYJUEVQOjSwT6u3WS8Y=;
	b=K7n7gkxobQSbdvGZErkz25VRgfZFGdff1cfdZxrOPRjWpL/QdasoOCujc47S1yFH9hOfDu
	jdhNH58O+gxzlPDw==
To: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Menzel
 <pmenzel@molgen.mpg.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Brian Gerst <brgerst@gmail.com>, Arjan van de Veen
 <arjan@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, Paul
 McKenney <paulmck@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>, Oleksandr Natalenko
 <oleksandr@natalenko.name>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>, David Woodhouse
 <dwmw@amazon.co.uk>, Usama Arif <usama.arif@bytedance.com>,
 =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, Russell King <linux@armlinux.org.uk>, Arnd
 Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E. J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
In-Reply-To: <26d385da-2ede-5d73-2959-84c8f7d89e03@citrix.com>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de> <87wn2a4la5.ffs@tglx>
 <bd5a6a93-def1-9248-2258-c3d3b40071ef@molgen.mpg.de> <87ttxd4qxz.ffs@tglx>
 <87r0sh4m7a.ffs@tglx> <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de>
 <87a5z443g2.ffs@tglx> <877cu83v45.ffs@tglx> <874jpc3s3r.ffs@tglx>
 <0f5463fd-9c4a-6361-adbb-dd89dbb9138d@citrix.com>
 <c2aaa4fb-a5ba-d5bf-634a-dcf4fd8ad246@citrix.com> <871qkf3qek.ffs@tglx>
 <26d385da-2ede-5d73-2959-84c8f7d89e03@citrix.com>
Date: Thu, 20 Apr 2023 13:17:40 +0200
Message-ID: <87y1mm3iqz.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_041750_648114_B722A9A1 
X-CRM114-Status: GOOD (  15.34  )
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

T24gVGh1LCBBcHIgMjAgMjAyMyBhdCAxMDoyMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAy
MC8wNC8yMDIzIDk6MzIgYW0sIFRob21hcyBHbGVpeG5lciB3cm90ZToKPj4gSSdtIHBvbmRlcmlu
ZyB0byBzaW1wbHkgZGVueSBwYXJhbGxlbCBtb2RlIGlmIHgyQVBJQyBpcyBub3QgdGhlcmUuCj4K
PiBJJ20gbm90IHN1cmUgaWYgdGhhdCB3aWxsIGhlbHAgbXVjaC4KClNwb2lsc3BvcnQuCgo+IEp1
c3QgYmVjYXVzZSB4MkFQSUMgaXMgdGhlcmUgZG9lc24ndCBtZWFuIGl0J3MgaW4gdXNlLsKgIFRo
ZXJlIGFyZQo+IHNldmVyYWwgZ2VuZXJhdGlvbnMgb2YgSW50ZWwgc3lzdGVtIHdoaWNoIGhhdmUg
eDJBUElDIGJ1dCBhbHNvIHVzZSB0aGUKPiBvcHQtb3V0IGJpdCBpbiBBQ1BJIHRhYmxlcy7CoCBU
aGVyZSBhcmUgc29tZSBtYWNoaW5lcyB3aGljaCBoYXZlCj4gbWlzbWF0Y2hlZCBBUElDLW5lc3Mg
c2V0dGluZ3MgaW4gdGhlIEJJT1MtPk9TIGhhbmRvdmVyLgo+Cj4gVGhlcmUncyB2ZXJ5IGxpdHRs
ZSB5b3UgY2FuIGRvIG9uIHRoZSBCU1AgYWxvbmUgdG8ga25vdyBmb3IgY2VydGFpbiB0aGF0Cj4g
dGhlIEFQcyBjb21lIG91dCBvZiB3YWl0LWZvci1TSVBJIGFscmVhZHkgaW4geDJBUElDIG1vZGUu
CgpZZWFoLiBSZWFkaW5nIHRoZSBBUElDIHRoYXQgZWFybHkgaXMgZ29pbmcgdG8gYmUgZW50ZXJ0
YWluaW5nIHRvbyA6KQoKPiBPbmUgd2F5IGlzIHRoZSDDhlBJQyBMZWFrICJsb2NrZWQgaW50byB4
MkFQSUMgbW9kZSIgZ2lhbnQgc2VjdXJpdHkKPiBib2RnZS7CoAoKQmFoLgoKPiBJZiB0aGUgc3lz
dGVtIHJlYWxseSBkb2VzIGhhdmUgYSBDUFUgd2l0aCBhbiBBUElDIElEIGFib3ZlIDB4ZmUsIHRo
ZW4KPiBjaGFuY2VzIGFyZSBnb29kIHRoYXQgdGhlIEFQcyBjb21lIG91dCBjb25zaXN0ZW50bHku
Li4KCkFueXRoaW5nIGVsc2Ugd291bGQgYmUgcmVhbGx5IG1hZ2ljIDopCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
