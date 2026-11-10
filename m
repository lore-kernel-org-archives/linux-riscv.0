Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6CA606A321
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 22:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AdXZGcnQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=TZ/eWRVi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5ZWU82IoVNnBtBMdxaotJ2g3LipzE+Th5xeL1zewSD0=; b=AdXZGcnQOkxHV0iBzMStbrfFvN
	PZTSmMy6o9f0o5qtvRbvQtZbtPjsc7/ATfPi0ygc70ClKjT0lZfEl/6HzyQ7sYttoKKZC/aGKqe4j
	ul1OAbz6IGr4nDYSngMcX/xWYHqS2se7huqlFQv99BkRW2TKfDiBee1TV+rIoH4lqpUIAVpm+jIfv
	lk6mxmGBZ08o1Y1x8rBnL8ZN4GuBL/O1Qyf+z4H6NupItOBG8LnS7BYtoGa5up3/ZXgQ066jdmmoZ
	IJJ5SJds6k5dxKrjIm5T8FkvS+nWtgoQAvdPmERq3h8aUHU8zpxvsDBW43XeUIy+heWPdtiWaGg5e
	KFmMGaBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuGO-000000059S8-10ND;
	Tue, 10 Nov 2026 22:24:24 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuGL-000000059RE-2LUI
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 22:24:22 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-8b32bbd39d5so21411227b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 14:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1794349460; x=1794954260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JD90ByTDonpvaMCJRrmcgNDu133Piwu7ckJt2xX5Ypg=;
        b=TZ/eWRViSASAmrabrlmfhXm2LZR4f63qUJ3TQzX2SearE9uROA2S1oYDYrq4F744Kp
         TUp8LyNphtU3IgSt49CqgfFc4CrNz9y8rnkP4/j7cJ7XYgZHSVWqqFEV+r1V0vS6brkw
         DIn/d/vGpfOJPtCwlcvxbDCyPoWz5x6GmVmauMF29O+GplFZJ9CiqGB1aRYJf6ld/TB4
         v1/+6vUONVq57+6xqcmVGcDw70kc19TiAifyJu9uXcw/3azPWtaNpS7RKY2C/Ea6fo+4
         cJ5C6liNhGnxp13natwcC7u5M8fuI4KHpMkDBj4SjiCiC0cuzcXscNcGa2IQzfKcvD67
         9+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794349460; x=1794954260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JD90ByTDonpvaMCJRrmcgNDu133Piwu7ckJt2xX5Ypg=;
        b=UzDkA99KWKRm3Qjwg+xfU0VnieSk9M2+ceCCbXkvoQz882DSfLu65p3QV4XLXOHeqg
         IGKkMM/NvqvC0/B3iTaBPV///sN4ktmxxQUFrTSe9DbxLUFLSgoRakAiReuUKxevqg1a
         TvT5p2dMN5fycjZ2XAaxVo+j6oV6L6jAI44264lEkQ59X9u1XS+7iiyuIVFNBm14XCz2
         9yMHw3D+0jrXqK1KSsxWGD3Wgbz3ygM3NSfBS2w9XQWX+tbbDJpZC4izOLTciP6MvSa4
         bs5XGqQHnx6tocOyMqnDenZRuZOt0doiIUYPx/eQLJg2y3kZWaFwj0tJbU07NGMJUb1J
         trQw==
X-Forwarded-Encrypted: i=1; AL+hErGjcy3BY5QIxSRGj6y49fN85ROkV+ILk1sJUneKElhGeo7h3AWib3wB7YLUlkbAuEYy07Aja6yittUwOw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9NUVdvywnx81MYZcmJB9I4JLz8qRBO9KWw/YhH7N6vK+4kg0qn
	elKmMzcbQ05FTUElQVopC0CWJbQXKfVaU5jlCtNbVY5iDsAiIUcQ/b9L4WUi07+ETEw=
X-Gm-Gg: AYBFou2YQD7elgZ8buetL/UeAPYxpkiLNpbqLZDsw50bHW6K3XGA++4PJS1NpfP9ChU
	Stjm/gqjwaGYF/Ex37ws9+08wxBONhK8gfPMZSthYpEdEkYdGuB+gKJzlZ4NUUvWtriI/Jtqw4g
	x33uR6JNg3fXF0NBZkzXsQxxZ1pMNzAlqjTjLvot0YTYc1zveXcDdvZeLzXSbcsHCCivlGG2PRR
	eDbSoD6VafnIAJHggwZltBi8jW+H1kYfVNpJFBi56i1z7MKdkVW3sCnL73TVfT2/GvB6W/9hyLH
	1WrlQ7CGHWYYJEhMBKGsWssKfeSMytoRPLvvqxxA3xJRbiUBWECMJxPOogBXK1hFJO/D/FfcJBz
	UY8ak+LLFYq0ejMg7EJCj9/CJfdGAdOsyyIitDN9iw7lghsE6klncsDID4aQG/ykOHLBmZw1N8/
	JT5B/1QD0idfgWJAMavVlvVhJTxzMK2AMEtaVrnRIkKudZSBkqdOkoFoisSkuSS4i8eRUPHoXBM
	a3bYYvsnjN6ZfKhaBA31yvjiMs/BsNDXwCZfoQr2t3SnsiVlyR4TX8N9ZRwjrtGv9JlctR/G/xW
	j3zchnX8K5n8IjtEAjMei+KQNypGemQqIfQUVttePOH8X5qrHmcZBl6u403JNojY4Y6zAA==
X-Received: by 2002:a05:690c:c4e3:b0:8b3:2f3d:b33e with SMTP id 00721157ae682-8b3a803b56cmr6204057b3.25.1794349460098;
        Tue, 10 Nov 2026 14:24:20 -0800 (PST)
Received: from lima-default.tail89d63.ts.net ([108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393479120sm30087317b3.45.2026.11.10.14.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:24:19 -0800 (PST)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <tchiu@tenstorrent.com>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Nam Cao <namcao@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Rui Qi <qirui.001@bytedance.com>,
	Zong Li <zong.li@sifive.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1] riscv: uaccess: fallback to byte copy on misaligned fault
Date: Tue, 10 Nov 2026 16:23:46 -0600
Message-ID: <20261110222351.1140267-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_142421_607968_5E6C673E 
X-CRM114-Status: GOOD (  13.26  )
X-Spam-Score: -2.1 (--)
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

If a machine is advertised to support fast unaligned access but somehow
triggers a S-mode misaligned fault on user copy, we recover it by the
exception fixup, which falls back to byte copy. Meanwhile, schedule a
work to turn off the static branch and redirect the code flow back to
software aligning.

This can happen if we boot an machine that doesn't fully support
misaligned access but somehow it passes the fast unalign access speed
probing (hypothetical). Or, if we specify 'unaligned_scalar_speed=fast'
as boot argument while in fact booting a machine that traps on unaligned
access.

Both have to boot with an OpenSBI that delegates misaligned traps,
enabled by RISCV_SBI_FWFT_DELEGATE_MISALIGNED under NONPORTABLE.

Fixes: 30514aa420fd ("riscv: optmize ucopy for has_fast_unaligned_accesses")
Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
 arch/riscv/kernel/traps.c | 43 +++++++++++++++++++++++++++++++++++++++
 arch/riscv/lib/uaccess.S  |  3 +++
 2 files changed, 46 insertions(+)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f8292adda099..7b88e9c716d2 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -213,6 +213,45 @@ static const struct {
 	},
 };
 
+#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
+static void disable_misaligned_ucopy_work_fn(struct work_struct *w)
+{
+	static_branch_disable(&fast_unaligned_access_speed_key);
+}
+
+static void disable_misaligned_ucopy_helper(struct irq_work *unused)
+{
+	static DECLARE_WORK(disable_misaligned_ucopy_work, disable_misaligned_ucopy_work_fn);
+
+	schedule_work(&disable_misaligned_ucopy_work);
+}
+
+static bool disable_misaligned_ucopy(struct pt_regs *regs)
+{
+	static DEFINE_IRQ_WORK(disable_misaligned_ucopy_irq_work, disable_misaligned_ucopy_helper);
+	unsigned long addr = regs->badaddr;
+
+	if (!IS_ENABLED(CONFIG_JUMP_LABEL))
+		return false;
+
+	if (!(regs->status & SR_SUM))
+		return false;
+
+	if (!fixup_exception(regs))
+		return false;
+
+	if (static_branch_unlikely(&fast_unaligned_access_speed_key))
+		irq_work_queue(&disable_misaligned_ucopy_irq_work);
+
+	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
+	*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED;
+
+	return true;
+}
+#else
+#define disable_misaligned_ucopy(regs)	(false)
+#endif
+
 static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type type)
 {
 	irqentry_state_t state;
@@ -222,6 +261,10 @@ static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type
 		local_irq_enable();
 	} else {
 		state = irqentry_nmi_enter(regs);
+		if (disable_misaligned_ucopy(regs)) {
+			irqentry_nmi_exit(regs, state);
+			return;
+		}
 	}
 
 	if (misaligned_handler[type].handler(regs))
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index ad1457e789fb..26316c5fe745 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -114,6 +114,9 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	addi	a1, a1, 8*SZREG
 	bleu	a0, t0, 2b
 
+#if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS) && defined(CONFIG_JUMP_LABEL)
+10:
+#endif
 	addi	t0, t0, 8*SZREG /* revert to original value */
 	j	.Lbyte_copy_tail
 

base-commit: 551bdd6fcaba4ffc98fd95c4d969d4470eae580f
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
