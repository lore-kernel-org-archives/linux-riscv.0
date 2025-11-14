Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F85CE7B1F
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 15:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NE5aLdiLGwLCE4yP8zXHj3Xg/rNiUgVrXIkEivddD0=; b=rp9ckDtcIn7qIH
	boK+Dq9GuaQnpkTP8b3tRCBRoU2UV4teSB5i+1LS4utglViNV9EZGcBDnypRqcVqBONcWm+TvoG+s
	tJmXsA155eR3qvGs76AOkCGeSgE5wU1v1TAjpUNX4I6bWuFUyiNy2jay+4GN1CG/FEVQQaR7tChoi
	hEiMt2ga1Xhap94bbDrMU9hCwr2mKU9kGUM6t1Vvz83giqC3zf3m0N8BrOT/Ttbr0a7ORkrkNJtNy
	gKXYkoDTDzqsCKQLAjtg/1UqaClaNJTIIyGkwxXVH1EHYwHf4cmDDT7EjC9dYcgCWICjxkzwD1az6
	m0kUNQQ4hCj4QVAnDCmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvY7-0000000CVEM-0YDR;
	Fri, 14 Nov 2025 15:17:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvY5-0000000CVDQ-3nBZ
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3X87uiojng2a6RCMXxkyxjZHQ7qUm6Xyc1h3s0fKM3s=; b=Knxleuzj0P651/z1P0sSSru78F
	iqzw1zTQA5YZ0X+k0sUh4f1X0khpRKDlqa+AZ42Ugr1sVvbmzyfTFJYHjI3qT759J++ZlHdGBYnIk
	LvOL1Gu9gcCIGeA/MiS7R/VlYD71jKuFVQEJmIbCDLpneep/PgpeM6BOUmcDpUFUV3lTm0DH0qfhE
	Xxj96mF5Gg4GgBDflZ9fUOgebF406wfHudlf1QvHaakfWh2wgJwFcHbb4UfgZs7eDh0Z+B4c6IJtF
	Sv4i7sFpkisk1vl0BMBiB/GwQ5oRyZ8McHTf8/nEmwBy9QDOz7Ssre5cyaAGfm1D8f+hVKmYdnfhz
	DrO88YnA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJugN-00000002n93-29oZ
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 14:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763133433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3X87uiojng2a6RCMXxkyxjZHQ7qUm6Xyc1h3s0fKM3s=;
	b=az/THQw/Nef9DVwrFDjDZtykiTD5qR2NqW2UM235/x7W4P8dCyJCBUIj1SOLmrXoMRy6aM
	h5ZhOXXOwqZYZhSJYC31a7UwRPhC/UttDyMpYgXbw2ag/0K1w/9YO33TOZ7lo3HY8dEsr1
	L87X0VCMOHYY2vhJU0BZaUqaqEIyFis=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763133433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3X87uiojng2a6RCMXxkyxjZHQ7qUm6Xyc1h3s0fKM3s=;
	b=az/THQw/Nef9DVwrFDjDZtykiTD5qR2NqW2UM235/x7W4P8dCyJCBUIj1SOLmrXoMRy6aM
	h5ZhOXXOwqZYZhSJYC31a7UwRPhC/UttDyMpYgXbw2ag/0K1w/9YO33TOZ7lo3HY8dEsr1
	L87X0VCMOHYY2vhJU0BZaUqaqEIyFis=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-128-2-uC21UoNNia6LI_UqojzA-1; Fri,
 14 Nov 2025 10:17:08 -0500
X-MC-Unique: 2-uC21UoNNia6LI_UqojzA-1
X-Mimecast-MFC-AGG-ID: 2-uC21UoNNia6LI_UqojzA_1763133423
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C8653180009D;
	Fri, 14 Nov 2025 15:17:02 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.226.10])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7E4EA180049F;
	Fri, 14 Nov 2025 15:16:48 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rcu@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>,
	Rik van Riel <riel@surriel.com>,
	Jann Horn <jannh@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Daniel Wagner <dwagner@suse.de>,
	Petr Tesarik <ptesarik@suse.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [RFC PATCH v7 29/31] x86/mm/pti: Implement a TLB flush immediately after a switch to kernel CR3
Date: Fri, 14 Nov 2025 16:14:26 +0100
Message-ID: <20251114151428.1064524-9-vschneid@redhat.com>
In-Reply-To: <20251114150133.1056710-1-vschneid@redhat.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_142147_664848_0C653EB7 
X-CRM114-Status: GOOD (  18.17  )
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

Deferring kernel range TLB flushes requires the guarantee that upon
entering the kernel, no stale entry may be accessed. The simplest way to
provide such a guarantee is to issue an unconditional flush upon switching
to the kernel CR3, as this is the pivoting point where such stale entries
may be accessed.

As this is only relevant to NOHZ_FULL, restrict the mechanism to NOHZ_FULL
CPUs.

Note that the COALESCE_TLBI config option is introduced in a later commit,
when the whole feature is implemented.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/entry/calling.h      | 25 ++++++++++++++++++++++---
 arch/x86/kernel/asm-offsets.c |  1 +
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/x86/entry/calling.h b/arch/x86/entry/calling.h
index 0187c0ea2fddb..620203ef04e9f 100644
--- a/arch/x86/entry/calling.h
+++ b/arch/x86/entry/calling.h
@@ -10,6 +10,7 @@
 #include <asm/msr.h>
 #include <asm/nospec-branch.h>
 #include <asm/jump_label.h>
+#include <asm/invpcid.h>

 /*

@@ -171,9 +172,27 @@ For 32-bit we have the following conventions - kernel is built with
	andq    $(~PTI_USER_PGTABLE_AND_PCID_MASK), \reg
 .endm

-.macro COALESCE_TLBI
+.macro COALESCE_TLBI scratch_reg:req
 #ifdef CONFIG_COALESCE_TLBI
	STATIC_BRANCH_FALSE_LIKELY housekeeping_overridden, .Lend_\@
+	/* No point in doing this for housekeeping CPUs */
+	movslq  PER_CPU_VAR(cpu_number), \scratch_reg
+	bt	\scratch_reg, tick_nohz_full_mask(%rip)
+	jnc	.Lend_tlbi_\@
+
+	ALTERNATIVE "jmp .Lcr4_\@", "", X86_FEATURE_INVPCID
+	movq $(INVPCID_TYPE_ALL_INCL_GLOBAL), \scratch_reg
+	/* descriptor is all zeroes, point at the zero page */
+	invpcid empty_zero_page(%rip), \scratch_reg
+	jmp .Lend_tlbi_\@
+.Lcr4_\@:
+	/* Note: this gives CR4 pinning the finger */
+	movq PER_CPU_VAR(cpu_tlbstate + TLB_STATE_cr4), \scratch_reg
+	xorq $(X86_CR4_PGE), \scratch_reg
+	movq \scratch_reg, %cr4
+	xorq $(X86_CR4_PGE), \scratch_reg
+	movq \scratch_reg, %cr4
+.Lend_tlbi_\@:
	movl     $1, PER_CPU_VAR(kernel_cr3_loaded)
 .Lend_\@:
 #endif // CONFIG_COALESCE_TLBI
@@ -192,7 +211,7 @@ For 32-bit we have the following conventions - kernel is built with
	mov	%cr3, \scratch_reg
	ADJUST_KERNEL_CR3 \scratch_reg
	mov	\scratch_reg, %cr3
-	COALESCE_TLBI
+	COALESCE_TLBI \scratch_reg
 .Lend_\@:
 .endm

@@ -260,7 +279,7 @@ For 32-bit we have the following conventions - kernel is built with

	ADJUST_KERNEL_CR3 \scratch_reg
	movq	\scratch_reg, %cr3
-	COALESCE_TLBI
+	COALESCE_TLBI \scratch_reg

 .Ldone_\@:
 .endm
diff --git a/arch/x86/kernel/asm-offsets.c b/arch/x86/kernel/asm-offsets.c
index 32ba599a51f88..deb92e9c8923d 100644
--- a/arch/x86/kernel/asm-offsets.c
+++ b/arch/x86/kernel/asm-offsets.c
@@ -106,6 +106,7 @@ static void __used common(void)

	/* TLB state for the entry code */
	OFFSET(TLB_STATE_user_pcid_flush_mask, tlb_state, user_pcid_flush_mask);
+	OFFSET(TLB_STATE_cr4, tlb_state, cr4);

	/* Layout info for cpu_entry_area */
	OFFSET(CPU_ENTRY_AREA_entry_stack, cpu_entry_area, entry_stack_page);
--
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
