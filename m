Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106F4C77B61
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 20:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FFwGy9csCUzcYyQlxnYUQMuoBFdGwA1FtdNToP54Y1w=; b=DgrApWHu5NCwf9
	liF90f73bl0ydhnYGP/IAhPP8MfH/RWp0x5/otGlv+jp+aDj3lWjK0eEbw1EoyVW0rAwDQ6+mY7Lf
	r/lDl64wxjUWjuE2ZMeUTrRQlBH9rNfGA1lmGJbmuUXIypqvcbfAeZPL3H1OSRHc7faIWvMZlEhb0
	ejZu0jPomEut6u+pAyTcVrl29E3R3gjOnnkVyMU8HNBb4Fy86DefR4/fmAjpfyxPytLtiuYmUcNYq
	yj/xae8izTFQQ2TNTfhUDW+/MePvxnuwH7PN2RLFsINCexUF+NeAKwM58X/cG2xm1Hj0q1+vXXIN+
	KwoSFKr9DPeOZ56NbV5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prOx8-0028AT-0d;
	Tue, 25 Apr 2023 20:07:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prOx3-00289O-2Z;
	Tue, 25 Apr 2023 20:07:51 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1682453268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4O15691mL3gwOERb5M8WwZ/BXXDNqH0+MWC0TCs50QE=;
	b=Bwuzz8Nz/BV6G/VL2bb+kha7mVj8/IRkuvbsjwjzk4USnPr2OW7n7gum3YLTay29fSKm4l
	VIaAVviF4DxNGn2wYM6o0v57oY64CRe+VgXsYQv76pd/utkcrBMIA+Hlh315Cm54VqTo7K
	atpyanHwbqEDa1wx0+1kk6JnSgmhiayROO89bvR9xqhG5h5fXOyJHuELCWZOaAN84arMeq
	GGcJ4Ir8foJBLeP8ch9gHIy9jvOiKYJ4asV3QtfyaAgXR2pzDWC3evufPz0x9jkOlulsT0
	C2Q9I3DEe4BIAOmlzxJr0oVN2tLwYUOfQk+hTo1aBm1XqujojvIZxEYvbxiQIw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1682453268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4O15691mL3gwOERb5M8WwZ/BXXDNqH0+MWC0TCs50QE=;
	b=RrFYGWkb9+Sr7TGoFVSkR/dCgulbRZuvJgUFeQBLzx1gsWc2Iv3HT6T4XcF1FLb33wIMzq
	mCdHr2bCd+lRBoCA==
To: Sean Christopherson <seanjc@google.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Menzel
 <pmenzel@molgen.mpg.de>, linux-kernel@vger.kernel.org, x86@kernel.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, Tom Lendacky
 <thomas.lendacky@amd.com>, Oleksandr Natalenko <oleksandr@natalenko.name>,
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
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
In-Reply-To: <87v8hq35sk.ffs@tglx>
References: <87r0sh4m7a.ffs@tglx>
 <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de> <87a5z443g2.ffs@tglx>
 <877cu83v45.ffs@tglx> <874jpc3s3r.ffs@tglx>
 <0f5463fd-9c4a-6361-adbb-dd89dbb9138d@citrix.com>
 <c2aaa4fb-a5ba-d5bf-634a-dcf4fd8ad246@citrix.com> <871qkf3qek.ffs@tglx>
 <26d385da-2ede-5d73-2959-84c8f7d89e03@citrix.com> <87y1mm3iqz.ffs@tglx>
 <ZEFRhXua6Jxvit1R@google.com> <87v8hq35sk.ffs@tglx>
Date: Tue, 25 Apr 2023 22:07:47 +0200
Message-ID: <87r0s7zpws.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_130749_974900_60A75315 
X-CRM114-Status: UNSURE (   9.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 20 2023 at 17:57, Thomas Gleixner wrote:
> On Thu, Apr 20 2023 at 07:51, Sean Christopherson wrote:
> Something like the completely untested below should just work whatever
> APIC ID the BIOS decided to dice.
>
> That might just work on SEV too without that GHCB muck, but what do I
> know.

It does not.

RDMSR(X2APIC_ID) is trapped via #VC which cannot be handled at that
point. Unfortunately the GHCB protocol does not provide a RDMSR
mechanism similar to the CPUID mechanism. Neither does the secure
firmware enforce CPUID(0xb):APICID to real APIC ID consistency.

So the hypervisor can dice the APIC IDs as long as they are consistent
with the provided ACPI/MADT table.

So no parallel startup for SEV for now.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
