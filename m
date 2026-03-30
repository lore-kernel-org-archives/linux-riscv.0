Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1928FB3CE5
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BR1f5ufjOZ/nx2kuESzN+kHT0+3f14ISjQf1Z38wSuc=; b=L2oXqNS7CDE1dJ
	xBbPD8ZiAymDmkgZAf5pJF1Unp+z0hLTF6wtpEQecu2mKz4731hSWj3KsDADYeu/1OYB+vJLefA0i
	G50sK5QNnlAb2ad9o2jQl3832G/PKKomejGrPW8az9sR+YOIrzVA1r0r3jX1sGJ5uZYir6/xjTFrg
	jzGE8KvH29QwopfOybyghG9208uXl1cMfITBI3ay4ejnHxe0DbpABq/YZP12pVP4VUvGCU3gI0Sdv
	1DENA2TKqATFBNEb0RDZDTDLgvEHj/QUyw28MjccJhDL6GZLHLyqpRrGIDCTBdTfQg/qqc2Q6+zy2
	clLhzzk2V4a1m3BW30WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79Qd-0000000B0S2-1OcO;
	Mon, 30 Mar 2026 10:01:03 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79QU-0000000B0P4-0Pz4
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 10:00:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774864748;
	bh=xj4JN/9EQzjiCXrEokRfqA2hGHPDxG/GX0nXcofrD5I=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=BNkT2/58daOeB+rjzYolq35IW/lF2gr+X9JdN6wALabywurfODKElATskSxO4ytSP
	 tkDO2hFFrPfVRTHL9oFJ3YbqGXlU0wJmvvUK7YnbJ2mTG1JbbMSCBJI8Zq/UqccRPe
	 nbrfRYF0Mzb+PJWIUlAJ2cceYDC8wVy24b3OeCFk=
X-QQ-mid: zesmtpgz8t1774864740t33e6c603
X-QQ-Originating-IP: BCda8jq6DPAm3ZfzAbSnMcHwGxjKRjGZGjnJwoDRAYk=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 30 Mar 2026 17:58:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11463941060989676982
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 30 Mar 2026 17:58:53 +0800
Subject: [PATCH v3] riscv: disable local interrupts and stop other CPUs
 before reboot/shutdown
MIME-Version: 1.0
Message-Id: <20260330-v7-0-rc1-rv-dis-int-before-restart-v3-1-5a0577fcd136@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XNywrCMBCF4VeRrB3JtVVXvoe4SNKJHZAWJjEop
 e9ucNWlrg7/5juLyMiEWZx3i2CslGmeWpj9TsTRT3cEGloLLXUnjVJQe5DAUQFXGCgDTQUCppk
 RGHPxXMAFg057G6w6iQaNlMvM7+9HVW2uf3FVgYIQbRescSr6eHnQ9HwdBqzi1viqt2T/E6kbK
 THGo0sh9CltyXVdP33VWQMXAQAA
X-Change-ID: 20260311-v7-0-rc1-rv-dis-int-before-restart-5b3e52a4b419
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.dev>, 
 Aurelien Jarno <aurelien@aurel32.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774864736; l=2941;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=X4sDXSviogdNNvGG5ErzZa5dJDLfstRYX6nniJzWXak=;
 b=uC6StRG89pkJqwItrW3uM/AV18FzGXVLpE3hQgVfqLZZYcRbix8vggs3eIl32DWUjiopZj92H
 7dsSFNTKoCQDz3f9ln4CttJmc3Bo5xfWE+tmr5c0Q/gRtm24FYcyEg/
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NhQ9hXNievYaeuzkVpCWdHu6+BAd7bXHUDhnBmsgeZuBLD4ovlA8O6XI
	4jHsFWyFLTR8QrtCkALXz8dSYTV9Et/AeGsdUEiSMd6q9TKVfiA1REZExOuos13Opc2/aFZ
	+2CtxEn3U+gATWk1NBoKjIrSrXzsXJviRPJOPI9g1qwjAdHMjCevzFhvBZgowfpKqSdxn7y
	djD3r9N6gZ+MKbn1wLwU3TYyjRE9v7hvmvKPpCOVKzWxJ62nEVC0TGO2L+vmwgBGhYFtVOV
	oKJUNimzg01pG0mUOFIDAR+kSUld1NOW2rqnFQSrhVvR66D+/ylb6vXe5Lm4pF9vHA9ERP9
	7lsjHmH/L2X0Vs57Z9o9PpwXvXmOiC/JiiEKTc45OWvrrkPteYaLShDS9so9XorjIh86qx8
	BF+U3Dg0hNfcnXQmd/idsYMoW7b2Hev2gMb4Ko2XC56tFQ/NC72MQNku9J7tDgZ16T4m9L3
	NfFAb6PDRQzrpZuNrq0p6M0JUp/2d6l0cV/Le2ztulXCyolo3pI0dir1Tdr/Y/BFkSduDlj
	j4ak1S2V15MNifM58pPoKDK0ttek8jg2zSjP2bQu/Hmf7KfaGvmVtVr3Dr9u9nbfJOm05yU
	e8/ZtdDs4lf3OVni8Orx9giVsnFgM1T+pRhbJ6ifcgcFPCabKOdqJctbTorce7hWBBSUtpb
	Hi8ZzOGZbytke1gAtPbb7Q6hBQVfFBe6j6QUHuJxe4M8hIa6YhVAXb/2r4qcV1DUxWd7GAU
	cehn7lKRN7kpQNo3kzk+/rf+vSIppEFKMqCbDiyULddQE9uLyNTlBEAusMtjZCdrbzS8RuA
	ssOdVE2ZSWZxECMacEpv3zRcVImECsWC5CrxL5PqE1rGLLXQX9suaaX5CL5QofK83o1ogdc
	xL8Xi9tdujkRjblWTRjXnneLNjfTsFFVc85EEfDFdYaAKKxKdaaYacrzU6DgOL1ZMnHi3+E
	4tGrwNEV8BkeskuEp9/sIBggosiqhDrnmB/s1Xl9zNT1fghufcjayTn2V18dJZGc0XD45No
	ucxgChDO2WFc2ALmAaFS38L1SGoP/MZNcuqq2ZveASOo1dGA5TaRLv/vklbZmNZmDYJTaBP
	m5qijmklBm4LdkNFdJUGNiFE1QXEN5FQg0H++DoIAahsJjO/kdoi9GUTBNJ1BbEhw==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_030054_877978_58F59778 
X-CRM114-Status: GOOD (  10.75  )
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

From: Troy Mitchell <troy.mitchell@linux.dev>

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
---
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
index 912288572226..8c48466c50e9 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -5,6 +5,7 @@
 
 #include <linux/reboot.h>
 #include <linux/pm.h>
+#include <linux/smp.h>
 
 static void default_power_off(void)
 {
@@ -17,18 +18,27 @@ EXPORT_SYMBOL(pm_power_off);
 
 void machine_restart(char *cmd)
 {
+	local_irq_disable();
+	smp_send_stop();
+
 	do_kernel_restart(cmd);
 	while (1);
 }
 
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
base-commit: 31489a8c1e95cfa2039b7ec4abf124d1fdda31a6
change-id: 20260311-v7-0-rc1-rv-dis-int-before-restart-5b3e52a4b419

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
