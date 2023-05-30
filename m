Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A3BC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 12:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+4xoZ7yAeO9iFsn9G/7LHKN12WpgaVpzBxnxS5lIfc=; b=TlSsP3mOQeH2Sc
	lM6T/+1TWqRvAL+2ymMho1OvhU0xZeL60o/ImS4Q/JWi2LHQL9cEIch8lPqdYkq+llyJthj412LZq
	wh1TCecDqoyvsVoiR9SotPd15gMZZnAA6emVWzMM+Hu3uzkR7XZKSJ1SNOT845w6zMpgEcvU7tKDQ
	vsDcmT2dSz4NwvZIAEjjPEl12nbRPsftC8XqvKKqOfA6x1gt6vWjamsz5P6/J4Tx9Ov6ciXxF/eE2
	+UBFQjtTzd0JFeW8Y5cVhtiDkLgvd3b8qKJcubOkFLHRF8W7NtSNuA9VzeenwN4KMAhN2ryDbkrG5
	pN+oo0Z2SKk4g8jqdrHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3yAM-00DnXd-04;
	Tue, 30 May 2023 12:09:30 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3yAI-00DnUd-32;
	Tue, 30 May 2023 12:09:28 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685448557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iZKRAQ6PZ8GK4gaM6K1HebRWTpJfBGLswDCJGgLN5o0=;
	b=m4WMewK162ZNFwFaX5aCd5h4XR9fVfFKlcOKr0XvrKt28u52sp90XWujVFM8gK3h4ofwRI
	SOK74XcgObHGkHLKgrJtnZmuimwWXh/wXN5q9j6Dv8gCxwb+AXijmXtlT1aYPYK1KlmCia
	BRY4IEuplIYlboTaZlXuZ97GEPZdzEDaxJWuCfBZTFHFXe1n4ZZe6munDRdPajOfnef4JY
	B2aRHT8SvnCVu5Z0nVzDGLL0t8nspaFR5wLfetwgGrG6VTVTYbuigWgnfZFxZNY8e+e9jz
	fk5DZ/0bhEUcm9JiTR/8v3EDg6m0oY8ot+sN837vZzmjbxzjbsdTnvzWX7grnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685448557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iZKRAQ6PZ8GK4gaM6K1HebRWTpJfBGLswDCJGgLN5o0=;
	b=ePubrlCxuRaMVoLtUqukHirTYLds6qKP6f4ORS+5dYI6s8wS4PLvyw0YznjLBK3j2Pn/GB
	8pWP8hu7tKt0KJDA==
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, Tom
 Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, Paul
 Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, Usama
 Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: [patch] x86/smpboot: Disable parallel bootup if cc_vendor != NONE
In-Reply-To: <87jzwqjeey.ffs@tglx>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name> <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx> <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx> <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name> <87mt1mjhk3.ffs@tglx>
 <87jzwqjeey.ffs@tglx>
Date: Tue, 30 May 2023 14:09:17 +0200
Message-ID: <87cz2ija1e.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_050927_120289_4F6894A8 
X-CRM114-Status: GOOD (  10.73  )
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

The decision to allow parallel bringup of secondary CPUs checks
CC_ATTR_GUEST_STATE_ENCRYPT to detect encrypted guests. Those cannot use
parallel bootup because accessing the local APIC is intercepted and raises
a #VC or #VE, which cannot be handled at that point.

The check works correctly, but only for AMD encrypted guests. TDX does not
set that flag.

Check for cc_vendor != CC_VENDOR_NONE instead. That might be overbroad, but
definitely works for both AMD and Intel.

Fixes: 0c7ffa32dbd6 ("x86/smpboot/64: Implement arch_cpuhp_init_parallel_bringup() and enable it")
Reported-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/smpboot.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1282,7 +1282,7 @@ bool __init arch_cpuhp_init_parallel_bri
 	 * Intel-TDX has a secure RDMSR hypercall, but that needs to be
 	 * implemented seperately in the low level startup ASM code.
 	 */
-	if (cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT)) {
+	if (cc_get_vendor() != CC_VENDOR_NONE) {
 		pr_info("Parallel CPU startup disabled due to guest state encryption\n");
 		return false;
 	}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
