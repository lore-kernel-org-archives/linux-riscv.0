Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19F9606D809
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 07:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HBVkx7Xx;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AsX9geCN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Message-Id:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GQ/+AZrjKBLfUUKMK42CZBz+pmuhGM56LHbVBh3FjUU=; b=HBVkx7Xx18K01uhqFymyt3+4Nu
	cvSWJbrFQU15a6ZGEIuUfAM+y2loSWzkJMO8OhDzzRqaqEPB1qW7SuWCiJfqg4y1hCZ6ggPd0SryJ
	Rgq/j84Hnk2ES1gN0GZmjrAMGo1K+wEWn0AYbI+uFYYuBW8subT9u7mt0e6CwS7SkPZposmnAc4ni
	CUvt79Toc/hsH/QqdGOkd+y062s3E+BSnrJFPoXxDJl8ZM5Ulk972NsrHJOSiv/50JPfYPaZFFXyI
	nRagpXLBmF0GGrcPn5snhyM/oEa3OtlJUW5UxHFlwI/vWxES19MACzz4vrKDcKy7WCGbtTzpHE/Th
	j9LahzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOV4D-00000004SXR-0OFE;
	Wed, 04 Nov 2026 07:05:53 +0000
Received: from out-82.mta1.migadu.com ([95.215.58.82] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOV49-00000004SWc-24Bm
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 07:05:52 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=rSnU8lJu7f/t4TTjB5ud1DlUs3JtaUJ65UuR/fs2+h8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793775947; v=1; x=1794380747;
 b=AsX9geCNDR7EPS7ICq2wQRuHqBdiMM04HJ0Z50ez3gs9n3fsl3AvJBTlbJ2yaPqriMoHqV/+
 gghE309eJsfZjsim1i8kAkvycJkYbjUibM0lYyuq2GeZNF5j3xLDeBbuvwYSewzyH3Rcx9EUBM9
 CvOccltcEoZus396viEG4XSY=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id 5f8c3ce56e6e10fc;
	Wed, 04 Nov 2026 07:05:47 +0000
X-Mizu-Trace-ID: 5f8c3ce56e6e10fc
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Wed, 04 Nov 2026 07:05:40 +0000
Subject: [PATCH v5] riscv: disable local interrupts and stop other CPUs
 before reboot/shutdown
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261104-v7-0-rc1-rv-dis-int-before-restart-v5-1-956ec09c900d@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/63RTWrDMBAF4KsErTtBv1bTVe9RspDGo1pQW0FSR
 Urw3SvaQkxXLnQ1vM33HsyNFcqRCns63FimFktMSw/m4cBwcssrQRx7ZpLLgSshoFngkFFAbjD
 GAnGp4CmkTJCpVJcrGK/ISKe9FifWoSmWmvLHV0cT/bz8iWsCBHjUg9fKCHT4/BaX9+txpMbOn
 W9yS9pdpOwkJ8RHE7y3Ifwm1YZUfBepOmkcN9YGHIUafshycUhzrEdM87et7/aJ75uru62l93r
 gqF2g7dy1myGnGeqUyd2f9Q/2un4CZIiKIiACAAA=
X-Change-ID: 20260311-v7-0-rc1-rv-dis-int-before-restart-5b3e52a4b419
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3853;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=rSnU8lJu7f/t4TTjB5ud1DlUs3JtaUJ65UuR/fs2+h8=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmvbrpYVG79FSj093Ts1y/71zva7PD+fC1bkHfj7fc7v
 rRPmaO8uaOUhUGMi0FWTJGl+wHPtgKfKNsCgUJfmDmsTCBDGLg4BWAiTPoMv9lK7+8ozDvmccSn
 7KxFt/h7249lWQzXzuxWUxIoaLL31WX4H3bkfpp2+2uFW5LiHxb/fnWrSNT4xsFzPB28xTu/cfX
 tZwAA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_230549_817286_C86D64B3 
X-CRM114-Status: GOOD (  12.98  )
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
Cc: Troy Mitchell <troy.mitchell@linux.dev>, linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently, the RISC-V implementation of machine_restart(), machine_halt(),
and machine_power_off() invokes the kernel teardown chains (e.g.,
do_kernel_restart()) with local interrupts enabled and other CPUs still
running.

This implementation fails to provide a deterministic execution environment
for registered handlers in the restart or power-off notifier chains. These
chains are intended to be executed in a strict atomic and single-threaded
context.

Specifically, under CONFIG_PREEMPT_RCU, rcu_read_lock() does not increment
the preempt_count. If local interrupts remain enabled, the environment
is not guaranteed to be atomic. This can lead to a context misidentification
within generic kernel teardown code, causing it to incorrectly enter
non-atomic paths (such as attempting to acquire sleeping locks), which
results in fatal "scheduling while atomic" splats or system hangs.

Additionally, stopping other CPUs ensures the primary CPU has exclusive
access to the hardware state during the final teardown phase, preventing
unpredictable interference from other active cores.

Align RISC-V with other major architectures by disabling local interrupts
and stopping other CPUs at the beginning of the shutdown sequences. This
guarantees the architectural expectations of the kernel's restart and
power-off handlers are met.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
---
Changes in v5:
- Rebase onto v7.4-rc1.
- Add Jisheng's Reviewed-by tag.
- Link to v4: https://patch.msgid.link/20260907-v7-0-rc1-rv-dis-int-before-restart-v4-1-42bb460c4afe@linux.dev

Changes in v4:
- Rebase onto v7.3-rc1.
- Link to v3: https://lore.kernel.org/r/20260330-v7-0-rc1-rv-dis-int-before-restart-v3-1-5a0577fcd136@linux.spacemit.com

Changes in v3:
- add Aurelien's tag
- Link to v2: https://lore.kernel.org/all/20260317-v7-0-rc1-rv-dis-int-before-restart-v2-1-0ecc85fbb7ff@linux.dev/

Changes in v2:
- expand the fix to cover machine_halt() and machine_power_off() for
  architectural consistency.
- update commit message
- Link to v1: https://lore.kernel.org/r/20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev

To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: spacemit@lists.linux.dev
---
 arch/riscv/kernel/reset.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index 14eb08a6db85..ec84e3c94a3a 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -6,6 +6,7 @@
 #include <linux/efi.h>
 #include <linux/reboot.h>
 #include <linux/pm.h>
+#include <linux/smp.h>
 
 static void __noreturn default_power_off(void)
 {
@@ -18,6 +19,9 @@ EXPORT_SYMBOL(pm_power_off);
 
 void machine_restart(char *cmd)
 {
+	local_irq_disable();
+	smp_send_stop();
+
 	/*
 	 * UpdateCapsule() depends on the system being reset via ResetSystem().
 	 */
@@ -30,12 +34,18 @@ void machine_restart(char *cmd)
 
 void machine_halt(void)
 {
+	local_irq_disable();
+	smp_send_stop();
+
 	do_kernel_power_off();
 	default_power_off();
 }
 
 void machine_power_off(void)
 {
+	local_irq_disable();
+	smp_send_stop();
+
 	do_kernel_power_off();
 	default_power_off();
 }

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260311-v7-0-rc1-rv-dis-int-before-restart-5b3e52a4b419

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
