Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15C2C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 09:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=se1aFUtWw2aoXVymvt/DM6qvRtA3RaWALOaXF3LIKcI=; b=zieynD0GbZjiVj
	LzcQpxr+nplOkyJMUXUymnXGVG4011zQ3SZjt9yBmw5BnQjyz+H44zcvIMHmI3jlpwLvaNL4BQkRs
	jQ7GmOVAxOLXwPiLqnchswSQlPunJnqJrg97aB23xaQbpTDvomX/4O2y1skHDR7bgTUiNb7dQvC0M
	KD1s0sndAB8TIFgpB3lT48NS4lK1ki1td7s3ckQOcq/1R5dQ0bn1Od9Lqc3hcRaLmS5ja3tfiYROd
	lfePZtSygdUWMTm0eaZuvgw6W6NfQxit/R0Iv4Xd2djqWXtF9BMS3o18o7pCNkc/XECIK+Uilm4oD
	NMKX4ogte/CYLrelAYWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp4Gm-004ldn-2M;
	Wed, 19 Apr 2023 09:38:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp4Gi-004lbA-28;
	Wed, 19 Apr 2023 09:38:30 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681897102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3ahWW2+Q3S/RvB6qR72sS8HIsTdCuAt1S9bqdH2z+7w=;
	b=qc5CvobL2r3hZWvSzSJqNdvsc3YOVQi05uwUK7zoWReiby465BIJI/zuxMUu5qXpSXXyVJ
	vzTv9ILxgQrJkJR8zzEJpve7BFlEE6OioXHOKbuuQuiRK8FoLk871pSTksNqCCIxl8ucz5
	wmXiG7xJVjNb7Bo6RoRV9J4Lz7UUc8BPgbwLe4YNDPdH4DGHf7Ptnhs3DupHwgSPtRAHBW
	rOKHJXmOZJEWGQe1t29Q6HPEqx9hwBtb4vRyuoV7kVeWG6zEx76YqS0yoDbWMbvMs5WCQW
	MFgUf5iaArW/mcuy/Cw2R/4IofuuCDjuJoLMyvJOsnpRGsf+HQwI40VP2uCO1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681897102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3ahWW2+Q3S/RvB6qR72sS8HIsTdCuAt1S9bqdH2z+7w=;
	b=h9kGxEZF0/449e5pzKL8RjkYF5PGK7O3l0s7czECIEu7mvAFDvboALol8fOrjIlj6I4Yg9
	stFZXVlGYGrqZrAQ==
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
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
In-Reply-To: <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de> <87wn2a4la5.ffs@tglx>
 <bd5a6a93-def1-9248-2258-c3d3b40071ef@molgen.mpg.de> <87ttxd4qxz.ffs@tglx>
 <87r0sh4m7a.ffs@tglx> <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de>
Date: Wed, 19 Apr 2023 11:38:21 +0200
Message-ID: <87a5z443g2.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_023828_859327_FD746100 
X-CRM114-Status: GOOD (  10.46  )
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

Paul!

On Tue, Apr 18 2023 at 22:10, Paul Menzel wrote:
> Am 18.04.23 um 10:40 schrieb Thomas Gleixner:
>> Can you please provide the output of cpuid?
>
> Of course. Here the top, and the whole output is attached.

Thanks for the data. Can you please apply the debug patch below and
provide the dmesg output? Just the line which is added by the patch is
enough. You can boot with cpuhp.parallel=off so you don't have wait for
10 seconds.

Thanks,

        tglx
---
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -814,6 +814,7 @@ static int wakeup_secondary_cpu_via_init
 	unsigned long send_status = 0, accept_status = 0;
 	int maxlvt, num_starts, j;
 
+	pr_info("Kicking AP alive: %d\n", phys_apicid);
 	preempt_disable();
 	maxlvt = lapic_get_maxlvt();
 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
