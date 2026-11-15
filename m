Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095D5606A330
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 12:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tnXf7xqO;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=K27xmwB6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PFkVEGkqbH9/iNWsn7eQdGYaEQC66R+AWyLs5HlSz54=; b=tnXf7xqOySDgtAhUSWedxOCZOQ
	2GLJXs/fqRur79ZWLJ0f7AHHSFSVrMm/VkcsVij2Keab2EQBb/XU9uk7fzLI1y6s7JA7RQyvjws8H
	/km0XhZr18p1kPDDep8oLZzPGXqed7oX48vhKCpICX4Z2QLIfsH3B+Ty8HabpXJkx+psCiel5tBj6
	fLmHVTYKNY+upShzp+VT/7bcu/C/DURc7RXw4cooG6JcRsZt5GMhBNmG9rfPNVMZ2aeK8joEe6EHZ
	BS73DRbNmrTPJ1kntEwQuzbggzPCkm9T+pJqOuhAWSWB84XBYGic83qXxnq6nCLYgVTBuwVJDSwRk
	YVS8Qfog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSZVW-0000000HWTH-2Q9y;
	Sun, 15 Nov 2026 12:38:54 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSZVQ-0000000HWQr-330x
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 12:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1794746328; x=1826282328;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=BUw7JeXvBZLkWxt5vkiT5i6cqwipH2FSgC84R9mmaUA=;
  b=K27xmwB6R7WrSWA8WBKSSOAPf8JuecrJ/4FS/T8+pPqVTGW80TBu1BOO
   wN6V12yDGO05XUj/Wb1ln9U4T/bEMQHbEjGt2QGYZNgE7L5j8SPWQUA+g
   83mpaUrRBbIrZuW0pc8yv3AopcNDm/tTIrojjLDFZ7vgLGyMqNKGDcPxW
   WpHueAJMNqKm4A+wo+Xdfn9JSLQMX0ETMfOvwlB21BF+3+MB8hVqjKdGs
   SdRf5FKdVg0vLMG3hxv5k2wFtX2uLVHAgfN/PSKmBMKWT/ngSKTK3rzeU
   zYZOVop8vlr1hhSu/9rZ8fIfnvwZ7+OrqDSL421ovdgsAJhUO6/t57KVk
   A==;
X-CSE-ConnectionGUID: 3BkzRWWSR9WnNDjsf36bxg==
X-CSE-MsgGUID: 4A23IctwTFeRIo09zcU2lQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 14:38:45 +0200
X-CSE-ConnectionGUID: yxI1yTDiRGCBQZJr7fk+nA==
X-CSE-MsgGUID: 5mDrb12bTFmvJxspl4pAPQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces03_data.me-corp.lan with SMTP; 15 Nov 2026 14:46:46 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Sun, 15 Nov 2026 14:38:44 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Sun, 15 Nov 2026 14:37:35 +0200
Subject: [PATCH v4 3/3] riscv: kprobes: add KUnit test for LR/SC sequence
 rejection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-probes-in-lrsc-v4-3-48b9b036bd1d@mobileye.com>
References: <20261115-probes-in-lrsc-v4-0-48b9b036bd1d@mobileye.com>
In-Reply-To: <20261115-probes-in-lrsc-v4-0-48b9b036bd1d@mobileye.com>
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
X-CRM114-CacheID: sfid-20261115_043849_095218_C492B06F 
X-CRM114-Status: GOOD (  16.39  )
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
sequence and assert that register_kprobe() accepts a probe placed right
before or right after the sequence, and rejects a probe placed on the
LR, on an instruction inside the sequence, or on the SC.

Add never-executed function that imitates s valid LR/SC section, one
with short and one with maximum valis size body, and section with
LR and no SC, mimicking __cmpwait where LR is followed by the
conditional branch.

Suggested-by: Xiaofeng Yuan <yuanxiaofeng@eswincomputing.com>
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S | 58 ++++++++++++++++++++++
 arch/riscv/kernel/tests/kprobes/test-kprobes.c     | 32 ++++++++++++
 arch/riscv/kernel/tests/kprobes/test-kprobes.h     |  6 +++
 3 files changed, 96 insertions(+)

diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
index 15e50934bbd7..ca5b9223f885 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
@@ -198,6 +198,44 @@ SYM_FUNC_END(test_kprobes_c_jal)
 
 #endif /* CONFIG_RISCV_ISA_C */
 
+SYM_FUNC_START(test_kprobes_lrsc)
+test_kprobes_lrsc_addr0:
+	nop
+	/* valid LR/SC sequence */
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
+	/* not a valid LR/SC sequence - no SC */
+test_kprobes_lrsc_addr5:
+	lr.w	t0, 0(a0)
+test_kprobes_lrsc_addr6:
+	and	t0, t0, a1
+	xor	t0, t0, a2
+	bnez	t0, 1f
+test_kprobes_lrsc_addr7:
+	nop
+1:
+	nop
+
+	/* valid LR/SC sequence */
+test_kprobes_lrsc_addr8: /* expect: rejected */
+	lr.w t0, 0(a0)
+test_kprobes_lrsc_addr9: /* expect: rejected */
+	.rept 16
+	nop
+	.endr
+	sc.w t0, t0, 0(a0)
+	nop
+	ret
+SYM_FUNC_END(test_kprobes_lrsc)
+
 .section .rodata
 SYM_DATA_START(test_kprobes_addresses)
 	RISCV_PTR test_kprobes_add_addr1
@@ -253,3 +291,23 @@ SYM_DATA_START(test_kprobes_functions)
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
