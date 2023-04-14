Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8EDC77B72
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 23:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=VrULnU0IxrKtX9mb+FVACxp42xoUKTHq5PivMjXwINA=; b=uUScgWGCPmwde6
	TgftD+Q/LzRoaC8ncHKxLOA+xYtGdFLTh3AhG0hLr2fqchUsvsHSIC22jJuBZJz06UViq0E3jiFc7
	BtU7TVGUiwASnZSf5wh/NCo1M7JJt8+XQAyWdURNkXSFdTJ1PoJWpqHfOWQNnWlAWTv/410a8e44/
	T9n7CZOSbjlqrLENs+qSG2c0YSrqNpC13y3rWUow7LqSX6uh/Em+RnyBmiV0GDUcXoQCjQ8kj8YHs
	5ecMIUMPyt77yZcqjFF78t5LysrHIgFpmIcE0NZJsaTk9oaooUXb9AWYrP1fuApZpkvGzDa6bAqwW
	OgInxHoEvYZkDulx4bew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnTBF-00ApDC-22;
	Fri, 14 Apr 2023 23:50:13 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT6N-00AkkJ-14;
	Fri, 14 Apr 2023 23:45:19 +0000
Message-ID: <20230414232311.316352541@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=2PTnDdSuwes/9NjD8Pm7hXlACOxFTN9vJCNjWOfgGXM=;
	b=Jh6ZM0Us9GGh285BMnb5fEm77rslh++J6j/QuRkHBnu0IJ3u2WPmnGe/3gdgkhs+Itn6YC
	EYm2JHM+HCoiKXud+mnLR3pzE3sn62xS6OTtxoSRYTybybUo7HLhqrcnKqV1RwxPAi5wc5
	OBp150tG8AHyoMw6+86zMyjFChURpnILiUkhTuUlpHCRtOIbCa3VMT62a8kcqkB8R+gKQ4
	U9tfXpB5IVu1MhpvFCVN68arP6yea+vniJ2RVD3n3fNQwQKszlDZIcpnpbeZf4M7nBLa8W
	ZFeGomntJTFI5LAn96fL2tniH8jRiNy2rM7ZxO27HO46gpoe/qq365pH/j/4pA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=2PTnDdSuwes/9NjD8Pm7hXlACOxFTN9vJCNjWOfgGXM=;
	b=JDEmTRQRnlWI2RxVIaPHzb6Y3x+BSeHE+/1j/fasD5aAeXT8ZfKeZ96xHuB6wXG5qxyGWZ
	eqmeypWBVFC7DyAA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 David Woodhouse <dwmw@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Gerst <brgerst@gmail.com>,
 "Arjan van de Veen" <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Usama Arif <usama.arif@bytedance.com>,
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: [patch 34/37] x86/cpu/amd; Invoke detect_extended_topology_early() on
 boot CPU
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Date: Sat, 15 Apr 2023 01:45:08 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_164511_591752_65C92A4B 
X-CRM114-Status: UNSURE (   8.17  )
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

The early detection stores the extended topology leaf number which is
required for parallel hotplug.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/cpu/amd.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -692,6 +692,8 @@ static void early_init_amd(struct cpuinf
 		}
 	}
 
+	detect_extended_topology_early(c);
+
 	if (cpu_has(c, X86_FEATURE_TOPOEXT))
 		smp_num_siblings = ((cpuid_ebx(0x8000001e) >> 8) & 0xff) + 1;
 }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
