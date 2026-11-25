Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A971606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 16:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3hHP1TTW;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=sROnt37P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E4PLdHSoA86cgoAQmABXA3qniu67Vd4iUNZhDF/P+FM=; b=3hHP1TTWdKvoV1/rPp3+P+ck+8
	66Ewdz8N9Fyw1eXyc51osJaZtqjb8sQvL3zpSFYuqyRlD6JekEtKra/Q0ME5mqsAYFW0VrkQes4Pu
	2nH8a61MbN1l6oYXTP74g19msOTvXyrl6A3OWCQFzZAktAZUa/r27xJ29MDIbIAZOZvHY5lMw0mz8
	9YqL2Z6L4yiHWB6N87q4q5auktm4VOBSdKw2GgX9sNl+2HK9vGyVVoxsdqZpBhO752l5ZxuvT0o+9
	CEQKWBjtkewhSu4BC6K5WXno2eJUGqz2IfNfcauc1np83u3wdwXPbdT/EJ0xWXLSfSfaGSOhYyYKk
	hHTjP3xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFbu-0000000AVOw-3LdH;
	Wed, 25 Nov 2026 16:12:42 +0000
Received: from esa1.hc555-34.eu.iphmx.com ([23.90.104.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFbr-0000000AVNl-18gx
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 16:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1795623159; x=1827159159;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=FcwHKGQZvxuxocnNkeTXhHb+QTd10Uycq7uPGuNhmps=;
  b=sROnt37PRLcSttjNVxITDxifsoPZ76fb3Y7tyBGoK2GA8RPXTacY12qn
   RwOMAv8hhf77nr/xdvklGEYtNOXBEryegL0g7+vDwXdk/Eb28RLH4qocf
   9oVcVYD2wKxRXn2yMFI/Eq/XSYAlpZQCVEuWad69udZ2YIxjXrJdI6mi0
   Q4UQWo7wLMhj1s9jDS8rNnIpcweqVkXsEzNTLsOIn85GtTK+omB615RYp
   pc1SKQDqbrld4JxfH3C1ha37v9iphqsZp9Eukdq+asIYRyiC+3CNhO8hC
   VL9+O1up3EKwRB1DPj3FUhIoackwWgjX8yr1SlbBXqtuiPeO4YeP7hCU8
   g==;
X-CSE-ConnectionGUID: 0KSV4sJ3R2WLm19jvpzI0Q==
X-CSE-MsgGUID: AaDbliXaR/K5EDzBMxPGag==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa1.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 18:12:37 +0200
X-CSE-ConnectionGUID: LCkOwF02RD6ZFRu/myprrw==
X-CSE-MsgGUID: DTOuvwIeRXKDMowbWemXIw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 25 Nov 2026 18:21:05 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 25 Nov 2026 18:12:35 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Wed, 25 Nov 2026 18:12:19 +0200
Subject: [PATCH v5 3/3] riscv: kprobes: add KUnit test for LR/SC sequence
 rejection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-probes-in-lrsc-v5-3-38a32e53fcc2@mobileye.com>
References: <20261125-probes-in-lrsc-v5-0-38a32e53fcc2@mobileye.com>
In-Reply-To: <20261125-probes-in-lrsc-v5-0-38a32e53fcc2@mobileye.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Guo Ren <guoren@kernel.org>, 
 Pekka Enberg <penberg@kernel.org>, 
 =?utf-8?q?Patrick_St=C3=A4hlin?= <me@packi.ch>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_081239_615211_09477F82 
X-CRM114-Status: GOOD (  18.42  )
X-Spam-Score: -4.0 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Extend the kprobes KUnit test with a function containing an LR/SC
sequence and assert that register_kprobe() accepts a probe placed
right before or right after the sequence, and rejects a probe
placed on the LR, on an instruction inside the sequence, or on
the SC.

Add never-executed functions that imitates:
- valid short LR/SC loop
- valid maximum size LR/SC loop
- CAS like valid LR/SC with fail and success exit paths
- LR without SC mimicking __cmpwait where LR is followed by
  the conditional branch
- literals inside code, with value interpreted as SC

Suggested-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S | 148 +++++++++++++++++++++
 arch/riscv/kernel/tests/kprobes/test-kprobes.c     |  32 +++++
 arch/riscv/kernel/tests/kprobes/test-kprobes.h     |   6 +
 3 files changed, 186 insertions(+)

diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
index 15e50934bbd7..f09b098bf771 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
@@ -198,6 +198,118 @@ SYM_FUNC_END(test_kprobes_c_jal)
 
 #endif /* CONFIG_RISCV_ISA_C */
 
+SYM_FUNC_START(test_kprobes_lrsc)
+test_kprobes_lrsc_addr0:
+	nop
+	/* valid short LR/SC loop */
+1:
+test_kprobes_lrsc_addr1: /* expect: rejected */
+	lr.w t0, 0(a0)
+test_kprobes_lrsc_addr2: /* expect: rejected */
+	addi t0, t0, 1
+test_kprobes_lrsc_addr3: /* expect: rejected */
+	sc.w t0, t0, 0(a0)
+test_kprobes_lrsc_addr4:
+	bnez t0, 1b
+
+	/* part of __cmpwait - not a valid LR/SC sequence - no SC */
+test_kprobes_lrsc_addr5:
+	lr.w	t0, 0(a0)
+test_kprobes_lrsc_addr6:
+	and	t0, t0, a1
+	xor	t0, t0, a2
+	bnez	t0, 1f
+test_kprobes_lrsc_addr7:
+	nop /* shoult be wrs.nto on platforms with zawrs */
+1:
+	nop
+	ret
+
+	/* valid LR/SC loop with maximum number of instructions */
+1:
+test_kprobes_lrsc_addr8: /* expect: rejected */
+	lr.w t0, 0(a0)
+test_kprobes_lrsc_addr9: /* expect: rejected */
+	.rept 13
+	nop
+	.endr
+	sc.w t0, t0, 0(a0)
+	bnez t0, 1b
+	ret
+SYM_FUNC_END(test_kprobes_lrsc)
+
+/*
+ * CAS with both success and fail exit paths using
+ * instructions not acceptable inside LR/SC loop. Probe
+ * rejected for "cas*" labels inside LR/SC and accepted for
+ * "after_cas*" locations
+ */
+SYM_FUNC_START(test_kprobes_cas)
+1:
+cas0: /* expect: rejected */
+	lr.w   t0, (a0)
+cas1: /* expect: rejected */
+	bne    t0, a1, 2f
+cas2: /* expect: rejected */
+	sc.w   t0, a2, (a0)
+after_cas0:
+	bnez   t0, 1b
+	li     a0, 0
+	ret
+2:
+after_cas1:
+	lw     a0, (a0)
+	ret
+SYM_FUNC_END(test_kprobes_cas)
+
+/*
+ * valid constrained LR/SC sequence can contain a backward branch on a failure path.
+ *
+ * Consider this CAS example, where the failure path placed before the LR/SC sequence
+ */
+
+SYM_FUNC_START(test_kprobes_inv_cas)
+before_invcas0:
+	j 1f
+2:
+	li a0, -1
+before_invcas1:
+	ret
+1:
+invcas0: /* expect: rejected */
+	lr.w   t0, (a0)
+invcas1: /* expect: rejected */
+	bne    t0, a1, 2b
+invcas2: /* expect: rejected */
+	sc.w   t0, a2, (a0)
+after_invcas0:
+	bnez   t0, 1b
+	li     a0, 0
+after_invcas1:
+	ret
+SYM_FUNC_END(test_kprobes_inv_cas)
+
+
+/*
+ * Literals inside code, with value interpreted as CS
+ * shall not confuse the parser
+ * All locations acceptable
+ */
+SYM_FUNC_START(test_kprobes_literal)
+lit0:
+	nop
+lit1:
+	j 1f
+	.word 0x18c7b62f /* sc.d    a2,a2,(a5) */
+1:
+lit2:
+	jal x0, 1f /* force 32-bit jump instruction */
+	.word 0x18c7b62f /* sc.d    a2,a2,(a5) */
+1:
+lit3:
+	ret;
+SYM_FUNC_END(test_kprobes_literal)
+
 .section .rodata
 SYM_DATA_START(test_kprobes_addresses)
 	RISCV_PTR test_kprobes_add_addr1
@@ -253,3 +365,39 @@ SYM_DATA_START(test_kprobes_functions)
 #endif /* CONFIG_RISCV_ISA_C */
 	RISCV_PTR 0
 SYM_DATA_END(test_kprobes_functions)
+
+.section .rodata
+SYM_DATA_START(test_kprobes_lrsc_allowed_addresses)
+	RISCV_PTR test_kprobes_lrsc_addr0
+	RISCV_PTR test_kprobes_lrsc_addr4
+	RISCV_PTR test_kprobes_lrsc_addr5
+	RISCV_PTR test_kprobes_lrsc_addr6
+	RISCV_PTR test_kprobes_lrsc_addr7
+	RISCV_PTR after_cas0
+	RISCV_PTR after_cas1
+	RISCV_PTR lit0
+	RISCV_PTR lit1
+	RISCV_PTR lit2
+	RISCV_PTR lit3
+	RISCV_PTR before_invcas0
+	RISCV_PTR before_invcas1
+	RISCV_PTR after_invcas0
+	RISCV_PTR after_invcas1
+	RISCV_PTR 0
+SYM_DATA_END(test_kprobes_lrsc_allowed_addresses)
+
+.section .rodata
+SYM_DATA_START(test_kprobes_lrsc_rejected_addresses)
+	RISCV_PTR test_kprobes_lrsc_addr1
+	RISCV_PTR test_kprobes_lrsc_addr2
+	RISCV_PTR test_kprobes_lrsc_addr3
+	RISCV_PTR test_kprobes_lrsc_addr8
+	RISCV_PTR test_kprobes_lrsc_addr9
+	RISCV_PTR cas0
+	RISCV_PTR cas1
+	RISCV_PTR cas2
+	RISCV_PTR invcas0
+	RISCV_PTR invcas1
+	RISCV_PTR invcas2
+	RISCV_PTR 0
+SYM_DATA_END(test_kprobes_lrsc_rejected_addresses)
diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.c b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
index 027424a3ff7b..ff9d5bb2b998 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes.c
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
@@ -43,8 +43,40 @@ static void test_kprobe_riscv(struct kunit *test)
 	kfree(kp);
 }
 
+static void test_kprobe_riscv_lrsc(struct kunit *test)
+{
+	/* probes outside the LR/SC sequence must be accepted */
+	for (int i = 0; test_kprobes_lrsc_allowed_addresses[i]; i++) {
+		struct kprobe kp = {};
+		int ret;
+
+		kp.pre_handler = kprobe_dummy_handler;
+		kp.addr = test_kprobes_lrsc_allowed_addresses[i];
+
+		ret = register_kprobe(&kp);
+		KUNIT_EXPECT_EQ_MSG(test, ret, 0, "location %pS rejected", kp.addr);
+		if (!ret)
+			unregister_kprobe(&kp);
+	}
+
+	/* probes on or inside the LR/SC sequence must be rejected */
+	for (int i = 0; test_kprobes_lrsc_rejected_addresses[i]; i++) {
+		struct kprobe kp = {};
+		int ret;
+
+		kp.pre_handler = kprobe_dummy_handler;
+		kp.addr = test_kprobes_lrsc_rejected_addresses[i];
+
+		ret = register_kprobe(&kp);
+		KUNIT_EXPECT_LT_MSG(test, ret, 0, "location %pS accepted", kp.addr);
+		if (!ret)
+			unregister_kprobe(&kp);
+	}
+}
+
 static struct kunit_case kprobes_testcases[] = {
 	KUNIT_CASE(test_kprobe_riscv),
+	KUNIT_CASE(test_kprobe_riscv_lrsc),
 	{}
 };
 
diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.h b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
index 537f44aa9d3f..93393e77a2cf 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes.h
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
@@ -19,6 +19,12 @@ extern void *test_kprobes_addresses[];
 /* array of functions that return KPROBE_TEST_MAGIC */
 extern long (*test_kprobes_functions[])(void);
 
+/* probe points that must be accepted, terminated by NULL */
+extern void *test_kprobes_lrsc_allowed_addresses[];
+
+/* probe points that must be rejected, terminated by NULL */
+extern void *test_kprobes_lrsc_rejected_addresses[];
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* TEST_KPROBES_H */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
