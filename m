Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616B8C79F8C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 02:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Message-Id:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZAFQ3kze7cmURUqomETkqhGj8BqpXEE8nU11HnuyV40=; b=YSxFJyKwSTpOku
	eHKopnIQ91+JtIPok+oYcxwI/SUX+/bspSSESw3/rAkrtloUvZufSxw3aJ9KnEP33f61JxGNYyJHU
	3yOn2z03Jp9dhDSc1cdAqkhnEEhvEQ9y7El68YJR1qNmW//4aa+a6aeE7/bc1mYT4329Vu443fgIR
	1hHCouMvL1RW8AIX2jN5R91tIIsmsNcVewNcumYBkZxBiArbTokLlR0ltXnZrrogRz1AY6Xm6/BpC
	tcZIoQoflS4VF92pj1HlGRKMWvL0E7Sr/oPsJZlRd9wxt3OdLSa2NMuNSBpw3ySjmC4AVvLP4mZuw
	Bfm7r/c8xnf8tNP7NuNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3P80-00000005iN4-2e3P;
	Mon, 07 Sep 2026 02:30:36 +0000
Received: from out-1.mta0.migadu.com ([2001:41d0:1004:224b::1] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3P7y-00000005iM6-0fAA
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 02:30:35 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gGOR70RWSVNpIZlUx4mowRB4v72DW7/ACEGX60I3uQQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788748229; v=1; x=1789353029;
 b=p755C2VN8+m3g+jfNzJqfRl3eQjn8RpJ5Esi7LppET+FuR2iKcUJa63cUlSLDc6SQa6OHX58
 DL1j2/viB5bgYAXrbsiLujKLbVbJ/f/HtpLd8bRVFIZsjK2uGQzCyKLdHgxZRnbXYLo2hE+VJot
 oLhcD5AlqglnoTnlQJiWMTaA=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id 37145613f0e5f374;
	Mon, 07 Sep 2026 02:30:29 +0000
X-Mizu-Trace-ID: 37145613f0e5f374
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 07 Sep 2026 10:30:24 +0800
Subject: [PATCH v4] riscv: disable local interrupts and stop other CPUs
 before reboot/shutdown
MIME-Version: 1.0
Message-Id: <20260907-v7-0-rc1-rv-dis-int-before-restart-v4-1-42bb460c4afe@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XNu04DMRCF4VeJXDORx5c1UPEeKIU9OyYjkd3IN
 laiaN8dC1FEVKE6+pvv3FTlIlzV6+6mCnepsi4j3NNO0TEuHwwyj1ZGm0lbROgBNBRCKB1mqSB
 Lg8R5LQyFa4ulgU+WvYkuOXxRAzpKbWu5/nx0HPP+L64jICRyU3LWI0V6+5Tl67KfuavD4Lu5J
 8NDpBmkZqJnn1MKOf8l7R1p9UOkHaSP2oeQaUY7/ZL1HIlP0va0ntRh27ZvcGW5+XMBAAA=
X-Change-ID: 20260311-v7-0-rc1-rv-dis-int-before-restart-5b3e52a4b419
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3272;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=gGOR70RWSVNpIZlUx4mowRB4v72DW7/ACEGX60I3uQQ=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnzFA8cei8r8T4i7E6z+DR9G8f9D1eeLxO86ejMtZ2Xd
 3vslVaTjlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgIlYnGBkuMk5f/Ik9etJR3ID
 zqac2f9o4XO9h4t/+r3d22njvz/ugyLDP2OnGQzP4jKa1M46SnwufZi0ie28yCHNi7qSD2r2rd/
 NzwcA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_193034_406887_569F2CD8 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: Troy Mitchell <troy.mitchell@linux.dev>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

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
---
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
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260311-v7-0-rc1-rv-dis-int-before-restart-5b3e52a4b419

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
