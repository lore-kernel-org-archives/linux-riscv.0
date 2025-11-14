Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA27CE8D40
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 15:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+ATGoRIj8ZNvE9mECSUBN9qPqob9fOy6cNsznuYLE0=; b=4PY96uGZot98b2
	Fd/R+/PHhWMGKjOZ/U4h+eyIJkSosTFJOi4jq6HDXEy0ItIT6p8+zzbS5z3tDiXyrOpokgwEjPri1
	+fgKdM30OGf22RnSr/NiHbBfy/mebD/ylnAyfeUIIwd3JC2TwPbaEZj0hGvHfZjZzNb7X88Rbdh3t
	fAizNQQvbPvcgAtpndeD/hAK9iMwambeAnaVjnnmX0zQQe3OSnjx5zpvLDU6NpPxu86CfnYKvrJVG
	h77RjDmY3GsXUuJ6aEO6MLfkIfDtBryYY/1fF2tSsPM35//RJij1qlwFWozpXHfqJIP0dUaQ8/6wA
	3o7hHYdKvWQFzJeBwbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvXr-0000000CV3W-2bVE;
	Fri, 14 Nov 2025 15:17:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvXp-0000000CV1L-2D4o
	for linux-riscv@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:17:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KrHUzPGBZEMSREH/RvanIYE5RDDkqwnke9Df1bzomfM=; b=YfpfqfVJXTGfClVCXhv3f7rjbj
	b1JaRlUics1XBE0D8l+W3spejdRTfwC77hrhK4nJ7/FGzOT6NNwwhcl1ws3V5n2bA1rNS2BV0UmLJ
	eDkHtK1Us9exYdsAq4au16zhNMM1v10AWmrM9cDv3CMs5XmmZcJStGcIoYgaTMTmRC5ZWAm5JCrLs
	iDU0mn8hdnYln8/M1Lxb2yH9o3D8dsqrNbK7/VyYZ7AFFtv67rz+qfQVuzznWHONvKjhYVu0rEEpj
	AWFBtSz8sELxlFAE5jY6kHL7QvzENvc/SE6R2intCIxtfPVrv1BvP5ml1yrBXXDbg2immJAvpDnHk
	1gdpmg3A==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJug7-00000002n6b-1RYJ
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 14:21:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763133416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KrHUzPGBZEMSREH/RvanIYE5RDDkqwnke9Df1bzomfM=;
	b=XCTqeKX153TipfeGUl7G91a/fy+XWeh0Umv5lUjzllOl68SlZGub6iE+96Xx959c0T7GUy
	TJ+9hQDNnMEgrSdNx50SRUh8UQfJ2T4jVMFmkgA1PhO+u/QCXNwsg+1NYoBS114nIZ1SMy
	xpaDPPSn5sLHNxzNcks9hOOcYH3SI38=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763133417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KrHUzPGBZEMSREH/RvanIYE5RDDkqwnke9Df1bzomfM=;
	b=RkflcW9UUJbN+rI4OqVAuD7U/T5VFar47pzBnMws6EvqWHsCPEbeDxcqZTBWovBV+uFKvO
	SuKZxKBaUd2zAQxMVJzSlj7HyNu0oDnlqAyq1EZmNdWpE9+je8WiUyx5HyLwzN0Ti/MsoK
	WELz9V8CnWNiH3p1OJsQZsPWw2TeNco=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-683-nkLlETgCP3ukpkMvj_2ARA-1; Fri,
 14 Nov 2025 10:16:52 -0500
X-MC-Unique: nkLlETgCP3ukpkMvj_2ARA-1
X-Mimecast-MFC-AGG-ID: nkLlETgCP3ukpkMvj_2ARA_1763133407
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 66EDF18D95D1;
	Fri, 14 Nov 2025 15:16:47 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.226.10])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BF03E180049F;
	Fri, 14 Nov 2025 15:16:32 +0000 (UTC)
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
Subject: [RFC PATCH v7 28/31] x86/mm/pti: Introduce a kernel/user CR3 software signal
Date: Fri, 14 Nov 2025 16:14:25 +0100
Message-ID: <20251114151428.1064524-8-vschneid@redhat.com>
In-Reply-To: <20251114150133.1056710-1-vschneid@redhat.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_142131_557957_9CF306F6 
X-CRM114-Status: GOOD (  16.33  )
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

Later commits will rely on this information to defer kernel TLB flush
IPIs. Update it when switching to and from the kernel CR3.

This will only be really useful for NOHZ_FULL CPUs, but it should be
cheaper to unconditionally update a never-used per-CPU variable living in
its own cacheline than to check a shared cpumask such as
  housekeeping_cpumask(HK_TYPE_KERNEL_NOISE)
at every entry.

Note that the COALESCE_TLBI config option is introduced in a later commit,
when the whole feature is implemented.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
Per the cover letter, I really hate this, but couldn't come up with
anything better.
---
 arch/x86/entry/calling.h        | 21 +++++++++++++++++++++
 arch/x86/entry/syscall_64.c     |  4 ++++
 arch/x86/include/asm/tlbflush.h |  3 +++
 3 files changed, 28 insertions(+)

diff --git a/arch/x86/entry/calling.h b/arch/x86/entry/calling.h
index 77e2d920a6407..0187c0ea2fddb 100644
--- a/arch/x86/entry/calling.h
+++ b/arch/x86/entry/calling.h
@@ -9,6 +9,7 @@
 #include <asm/ptrace-abi.h>
 #include <asm/msr.h>
 #include <asm/nospec-branch.h>
+#include <asm/jump_label.h>

 /*

@@ -170,11 +171,28 @@ For 32-bit we have the following conventions - kernel is built with
	andq    $(~PTI_USER_PGTABLE_AND_PCID_MASK), \reg
 .endm

+.macro COALESCE_TLBI
+#ifdef CONFIG_COALESCE_TLBI
+	STATIC_BRANCH_FALSE_LIKELY housekeeping_overridden, .Lend_\@
+	movl     $1, PER_CPU_VAR(kernel_cr3_loaded)
+.Lend_\@:
+#endif // CONFIG_COALESCE_TLBI
+.endm
+
+.macro NOTE_SWITCH_TO_USER_CR3
+#ifdef CONFIG_COALESCE_TLBI
+	STATIC_BRANCH_FALSE_LIKELY housekeeping_overridden, .Lend_\@
+	movl     $0, PER_CPU_VAR(kernel_cr3_loaded)
+.Lend_\@:
+#endif // CONFIG_COALESCE_TLBI
+.endm
+
 .macro SWITCH_TO_KERNEL_CR3 scratch_reg:req
	ALTERNATIVE "jmp .Lend_\@", "", X86_FEATURE_PTI
	mov	%cr3, \scratch_reg
	ADJUST_KERNEL_CR3 \scratch_reg
	mov	\scratch_reg, %cr3
+	COALESCE_TLBI
 .Lend_\@:
 .endm

@@ -182,6 +200,7 @@ For 32-bit we have the following conventions - kernel is built with
	PER_CPU_VAR(cpu_tlbstate + TLB_STATE_user_pcid_flush_mask)

 .macro SWITCH_TO_USER_CR3 scratch_reg:req scratch_reg2:req
+	NOTE_SWITCH_TO_USER_CR3
	mov	%cr3, \scratch_reg

	ALTERNATIVE "jmp .Lwrcr3_\@", "", X86_FEATURE_PCID
@@ -241,6 +260,7 @@ For 32-bit we have the following conventions - kernel is built with

	ADJUST_KERNEL_CR3 \scratch_reg
	movq	\scratch_reg, %cr3
+	COALESCE_TLBI

 .Ldone_\@:
 .endm
@@ -257,6 +277,7 @@ For 32-bit we have the following conventions - kernel is built with
	bt	$PTI_USER_PGTABLE_BIT, \save_reg
	jnc	.Lend_\@

+	NOTE_SWITCH_TO_USER_CR3
	ALTERNATIVE "jmp .Lwrcr3_\@", "", X86_FEATURE_PCID

	/*
diff --git a/arch/x86/entry/syscall_64.c b/arch/x86/entry/syscall_64.c
index b6e68ea98b839..2589d232e0ba1 100644
--- a/arch/x86/entry/syscall_64.c
+++ b/arch/x86/entry/syscall_64.c
@@ -83,6 +83,10 @@ static __always_inline bool do_syscall_x32(struct pt_regs *regs, int nr)
	return false;
 }

+#ifdef CONFIG_COALESCE_TLBI
+DEFINE_PER_CPU(bool, kernel_cr3_loaded) = true;
+#endif
+
 /* Returns true to return using SYSRET, or false to use IRET */
 __visible noinstr bool do_syscall_64(struct pt_regs *regs, int nr)
 {
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 00daedfefc1b0..e39ae95b85072 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -17,6 +17,9 @@
 #include <asm/pgtable.h>

 DECLARE_PER_CPU(u64, tlbstate_untag_mask);
+#ifdef CONFIG_COALESCE_TLBI
+DECLARE_PER_CPU(bool, kernel_cr3_loaded);
+#endif

 void __flush_tlb_all(void);

--
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
