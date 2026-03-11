Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4335FD88E1
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 02:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mJ/LSs4Kwzn21Km/6q9iLS/uy5gUnOTYcA/0i0mvriI=; b=f8AH6y2p4C2PWQ
	fcOttOs77Pg62kQ3JGcgiep4QIt2qmSTuLQe2Cg6UlGZVQWX4Bs/CLEchK1tqFCNsW7Q3UTKunrbQ
	/MPTBGYgvvWmL1jajZRC8Alt0/6FN79pbpujeoFoZNsUWtVhRRCWbkYm8gCOLBIMZ5geyVuHAmSUk
	YypW9EFRPeOBWTXPTbYf83kjby/sN9ESrGZaUDXvwXkNEpzDj2iU81zIy3TMrwgKqbiIJrGsR99Qq
	nSOwH4h6x7Iy3EgQIyIPQWBtjYZerbj5qWhsmWFt6T9mwlh/sonVWAIIwMJRzxVwlmNIRA7d51nMl
	PCbZluR4qApCdW6QCivQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w09hR-0000000AZXV-2udh;
	Wed, 11 Mar 2026 02:53:29 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w09hO-0000000AZWL-0hjN
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 02:53:28 +0000
X-QQ-mid: zesmtpsz3t1773197520t47c586fc
X-QQ-Originating-IP: sdF9k/qqbfx5xHwfrMQdZ7mOpjfe5m/MCdhh9M9/keE=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Mar 2026 10:51:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3368258366227887137
X-QQ-CSender: troy.mitchell@linux.spacemit.com
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Wed, 11 Mar 2026 10:51:55 +0800
Subject: [PATCH RFC] riscv: disable local interrupts and stop other CPUs
 before restart
MIME-Version: 1.0
Message-Id: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQrCMBBG4auUWftDkraKbgUP4FZcJO1UZ5PKT
 AhC6d0NLr/NexsZq7DRpdtIuYrJmhv8oaPpHfOLIXMzBReOrvce9QQHnTy0YhaD5ILEy6oMZSt
 RC8bU8xjikAZ/phb6KC/y/U8edL9d6bnvP8hZ5w55AAAA
X-Change-ID: 20260311-v7-0-rc1-rv-dis-int-before-restart-5b3e52a4b419
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773197518; l=2848;
 i=troy.mitchell@linux.dev; s=20250710; h=from:subject:message-id;
 bh=gy7SA+8vj/QLWMAenN3Vxk5AfAdTFQ8XwfDJ5fmJE3U=;
 b=kHDZeMGQFMACmKsjUfZeMNJAuhwEWGczNZs3+BSngFXZ8rHoZKCrSzIgDCtM//OLMTYX0+vPn
 CRFG/dk8lBkAZGhb8SCUk8HR+oDpeJzHOV7O7hauAPASx9nkXIbqPNW
X-Developer-Key: i=troy.mitchell@linux.dev; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M66Ywu80wllzikAOOl1u9GffJrRc4C+PZ4pfmYHtJW3zfi1smvkFoBM+
	irGIznW0X78obohDM3LZSXZLbhY/9YXaZEkLpQZPvE8p7WuatOoR/m690xV7YJwfk89WsiH
	WOGe6B1xKqvgMue5DKniB6p0gqfU3GascgRbbQFnMa/jCi+sIyniI5dl5NcrHmiYL9Mqkq0
	MUHsCCZu0mSnrMiI8apbTpC4lnVsmByFEdxx02jsOE0Wel+nDU2bi+E+eE7DSnTEdcUxF4w
	nu2V6/97wtV08uUGpFIVpcGd+x/zywCpMqMMZdrvlXIFHQJB5On14D7yDRdeIfaryYrO0xu
	F0mUMQ4JIhmqGR1q3OA3yRn3NahLRM7SH4quvgE9Q/bCIIKZtf2V/9My33mDfhiax+P3fDU
	/yFtI1Ygqn2kYsckd6ych8WldjnRQ27v1yJby4gt0a4p+1p974lp4GcxLAxLFaYjcbXFuMx
	8+5+QQQzh/9KYBn4vdjSOUWCBCMDy6Zpg60cln2FW7DaMHZaNArqSF/idBS5V3GhS7XbajR
	La4FaYBOKh5v9leWt7W+kuuDWjgSCMhTje/nIKNx2Z1oZoRPFWHODzNpkFflHh1FQUu9Y/x
	ZlM46R53hcCig/IKvbzYGDUP5MamtHzpYylKpL0HrUva7bw4Hh9YxLLzCsqcKT8xI65E22i
	jl58gAtzLO/6r8IwmwHCYDta/TvR2dmCiP5OEUN1YDp53/EibCWLbqAswP9r3xg8OIGlPDK
	NKbouycAaZxruAJ9n7cPvxnZk6aeC9Q7xkRkNUsNvaKAP0rURuKbPCaTadoZ/EhvZ+XL9I8
	u6Fb3+sFxu1UeGmDOxuF9i9QDvzlfBRQ56RUc3tQTZ3Ce0l6U9NCMl5iOtW8eDgRaNMfC1v
	ekhegHvLkP4wJtkYdUK4Mf9QmlIEycxTfr4b/MRhipWxyG0ApmlySDlYW/16l4t5GIFQ8De
	TkzUlR+zyrxZQYaBO5TPuIaiApU4m8Key8V1vEuyA78Y0eHaQzy/FlUx5ceMnyMNR34la+T
	0vJ2l25Bdm034zawaOyfthgpbA7H0v3K0JmX8+c1+m43stwcZXkHnvFcCTQM0waQHnO7RtI
	ybq7bOBP1ClD4GW6YkrgqmivyWRhT98CS9pkXVhuEG4eGYjc5fl84Th95LKnJ9y3XY3Ta0N
	a+vP
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_195327_101643_977AF8A1 
X-CRM114-Status: GOOD (  10.22  )
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

Currently, the RISC-V implementation of machine_restart() directly calls
do_kernel_restart() without disabling local interrupts or stopping other
CPUs. This missing architectural setup causes fatal issues for systems
that rely on external peripherals (e.g., I2C PMICs) to execute the system
restart when CONFIG_PREEMPT_RCU is enabled.

When a restart handler relies on the I2C subsystem, the I2C core checks
i2c_in_atomic_xfer_mode() to decide whether to use the sleepable xfer
or the polling atomic_xfer. This check evaluates to true if
(!preemptible() || irqs_disabled()).

During do_kernel_restart(), the restart handlers are invoked via
atomic_notifier_call_chain(), which holds an RCU read lock.
The behavior diverges based on the preemption model:
1. Under CONFIG_PREEMPT_VOLUNTARY or CONFIG_PREEMPT_NONE, rcu_read_lock()
   implicitly disables preemption. preemptible() evaluates to false, and
   the I2C core correctly routes to the atomic, polling transfer path.
2. Under CONFIG_PREEMPT_RCU, rcu_read_lock() does NOT disable preemption.
   Since machine_restart() left local interrupts enabled, irqs_disabled()
   is false, and preempt_count is 0. Consequently, preemptible() evaluates
   to true.

As a result, the I2C core falsely assumes a sleepable context and routes
the transfer to the standard master_xfer path. This inevitably triggers a
schedule() call while holding the RCU read lock, resulting in a fatal splat:
"Voluntary context switch within RCU read-side critical section!" and
a system hang.

Align RISC-V with other major architectures (e.g., ARM64) by adding
local_irq_disable() and smp_send_stop() to machine_restart().
- local_irq_disable() guarantees a strict atomic context, forcing sub-
  systems like I2C to always fall back to polling mode.
- smp_send_stop() ensures exclusive hardware access by quiescing other
  CPUs, preventing them from holding bus locks (e.g., I2C spinlocks)
  during the final restart phase.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 arch/riscv/kernel/reset.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index 912288572226..7a5dcfdc3674 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -5,6 +5,7 @@
 
 #include <linux/reboot.h>
 #include <linux/pm.h>
+#include <linux/smp.h>
 
 static void default_power_off(void)
 {
@@ -17,6 +18,10 @@ EXPORT_SYMBOL(pm_power_off);
 
 void machine_restart(char *cmd)
 {
+	/* Disable interrupts first */
+	local_irq_disable();
+	smp_send_stop();
+
 	do_kernel_restart(cmd);
 	while (1);
 }

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260311-v7-0-rc1-rv-dis-int-before-restart-5b3e52a4b419

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
