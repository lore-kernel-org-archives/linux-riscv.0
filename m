Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFD4CCF9EB
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 07:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6FujhrY6GhU3ih4UuJBME5ggG8JTKS4X+TskFeXCpUw=; b=23tb1RwK+B1Xjc
	8E2+monulyQ5vkKdSOgJDrT45ItDa6ndW8r7xbrKhcOkVXPOe633bv2qDXkM7GU7XEZEB0DX3OYUg
	rtrgEZz+BK/1CHvnFxLjXTnHE06BqUjTmY1mWjBHFn1pLDF80cfgSdvc8UMWlQRvORe3ph5Uwu2/n
	bCFjyhAGBaYVvrWIYBT9a3Gs96qyoa5PTdey7gDnpH9WPBTY9/D/Ic58w/WUhS4ReM9P1mWNJ6bAb
	uxWM/jaJeo6NG55ix3mzplgHU9F9HDpu82J+2g13AWg7Xi0Z6vzIlQV+dNomdfYIWQw17cHH/jK8Z
	Vl/dWE7e1QoZoB8kVkrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHHc-0000000DFVg-0FGj;
	Mon, 27 Oct 2025 07:04:48 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHHZ-0000000DFUU-0Nv9
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 07:04:47 +0000
X-QQ-mid: zesmtpsz9t1761548586tdf6a05ae
X-QQ-Originating-IP: SnvZo6rZqu1HMv/YMlq3zJ3p0SQy28vtuoi/p8hkNJ8=
Received: from = ( [183.48.247.177])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 15:03:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 993538249610758676
X-QQ-CSender: troy.mitchell@linux.spacemit.com
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 27 Oct 2025 15:03:00 +0800
Subject: [PATCH v2] riscv/plic: assign context ID based on hartid
MIME-Version: 1.0
Message-Id: <20251027-fix-plic-amp-v2-1-f077b9439112@linux.dev>
X-B4-Tracking: v=1; b=H4sIACMZ/2gC/3WMyw7CIBBFf6WZtWOA1Aeu+h+mCwpTO0mlBJTUN
 Py72L3Lc2/O2SBRZEpwazaIlDnx4iuoQwN2Mv5ByK4yKKFOUiiBI68YZrZongEvanC61WdtTQt
 VCZHqv+fufeWJ02uJn72e5W/9E8oSJToaSRmtzXAV3cz+vR4dZehLKV9DIY8fqAAAAA==
X-Change-ID: 20251020-fix-plic-amp-72bd94969ca4
To: Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761548584; l=4685;
 i=troy.mitchell@linux.dev; s=20250710; h=from:subject:message-id;
 bh=qGU9eKrvAy6sRhh2qF+2G1/qW4tdEsW+NXohAD0wJBk=;
 b=QVobr7HfSoGD5b6Tn4MJQ1V02hpGGfuq5xC5UmOXs1nE/R7aokxfR3oT8kPnTydcs5YV0Sstq
 IpuJabINtSYCvVzTmMGjUIMYw1QIplZ5vQaxGYPEzvu6K4dgZ4jiuI9
X-Developer-Key: i=troy.mitchell@linux.dev; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MExkIg7Bfu69me4zLr5MwX8PeHib5G93/iGwuQEtw41iVS237tUMs31+
	Gl6cnsEPQc8MTu6VOKMMGZfWtnXGB0GCOFnuHPOKw8oAsgSX9BG0qrLyItntqcerjuC2Ozi
	O9AxionRuTj9RLRUg3/pcOeXYjZdhfaXL3fn0lTeZeJN2UVbdOxv7qnBnpMaNkchvmBVkvj
	YVOqqWFDkqEjOMcmP3kJxv5ZHyDM8vS6RS87EGUl5wx2NzXpSyJYYHMml63NI3u3p14CPG5
	+ov54eO9f0EB2TMpl5kVqEvumBdf8vkjbehW3kW4Ekf3E6nfoTf/kuGAx9ycu62IztSXTCy
	fERvys0QRsVpTjaxWcy80iV1XFnP25EPcDbxeMPekCtpDTNZ6RAM5pdX4WuEhj9twL7O0Vz
	6FGi5QCnbQiZpdNoVTq93SoR9BvWQmHErgbEe4Zhx7IPd+skhRvwe/gfmqqUcqQUSiKJwFi
	GSzRnK5/iPDGrfrrbEs1lhGensUcx/VOM+GyTLiAQk6n4GnEQykG3rEzoh7xhlXuI3mWilN
	LO83CO5hRfsL+4yh1+0dlBUHL3OSv/yxc4fadN4uAYmHHBpUbTwc0YJtTLqW9roBWunipoR
	MFhntPEBaaxB6vTB1BbiF5pBhdmA3mRMzIuCsjCbLaaq6U39yzyS/6c8XOdQIL0GfhXvXFd
	ta21yXiX/XDCtsto2FdF99/bBMp9v4QlYr/wrkVurXUyMCNfbmJu2LfqwpeqrHzpnTWccMJ
	6Usd4+yg4eFHynFTB2uD7XCeM8mMOjJwaV95gZWyMn8ksOyR3cO0QlKnVSxsgy03To2qbVj
	aMa5+YWZ89c+aZGZdNBQO96gDOkJWGDUTYztD+l9qIWwnnRfb7GcnFG60cIa3H05ea+AGV2
	F7Zg+QcZ/mozs8e/t8HKwy8WuNKgYNjWTq1QPwYhsrz7QV21U4c73Cax2MTUR8S30LZHDEk
	CAmQo1V8QWCHYm/3ecGJvjHx5ahyniZRsDlbcwh8WvqbunBoXBJmNYcyE0bEL000/bk3bU2
	TMDkiw7bxnmSQzF2lHVOE4xheR9qyIk3I6cTzwuhHRnAexMOQSQ2JGriVy8KdPDbSQje6oh
	9jGyINl8ZY4638b2zTGgMjbrWbN317XlA==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_000445_642096_E4A0B68C 
X-CRM114-Status: GOOD (  15.32  )
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

The PLIC driver for OF-based platforms currently assigns 'context_id = i'
within the context loop. This implies an assumption that all harts are
numbered contiguously starting from 0.

In Asymmetric Multi-Processing (AMP) systems, where Linux might boot on
a non-zero hart ID (e.g., hart4), while other harts (e.g., hart0) are
running a different OS, this assumption is violated. This can lead to
 different system inadvertently sharing the same
PLIC enable_base register. Consequently, this causes configuration
conflicts and incorrect interrupt handling.

Assign the PLIC context ID based on the actual hart ID provided by the
OF node. This ensures that each hart context maps to a unique enable
region within the PLIC, thereby resolving conflicts in AMP setups. This
change preserves the correct behavior on Symmetric Multi-Processing (SMP)
and Uniprocessor (UP) systems.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
Changelog in v2:
- add comments
- modify commit message
- use `context_id` instead of `i` when skip contexts other than external
  interrupts for our privilege level
- Link to v1: https://lore.kernel.org/r/20251020-fix-plic-amp-v1-1-defe2a99ab80@linux.dev
---
 drivers/irqchip/irq-sifive-plic.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index cbd7697bc14819cbe3b77096b26901b605491f75..2289eb2f77bbd0da460d22ad3ffcd3e7ef2bde40 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -487,18 +487,18 @@ static int plic_parse_nr_irqs_and_contexts(struct fwnode_handle *fwnode,
 }
 
 static int plic_parse_context_parent(struct fwnode_handle *fwnode, u32 context,
-				     u32 *parent_hwirq, int *parent_cpu, u32 id)
+				     u32 *parent_hwirq, int *parent_cpu, u32 id,
+				     unsigned long *hartid)
 {
 	struct of_phandle_args parent;
-	unsigned long hartid;
 	int rc;
 
 	if (!is_of_node(fwnode)) {
-		hartid = acpi_rintc_ext_parent_to_hartid(id, context);
-		if (hartid == INVALID_HARTID)
+		*hartid = acpi_rintc_ext_parent_to_hartid(id, context);
+		if (*hartid == INVALID_HARTID)
 			return -EINVAL;
 
-		*parent_cpu = riscv_hartid_to_cpuid(hartid);
+		*parent_cpu = riscv_hartid_to_cpuid(*hartid);
 		*parent_hwirq = RV_IRQ_EXT;
 		return 0;
 	}
@@ -507,19 +507,19 @@ static int plic_parse_context_parent(struct fwnode_handle *fwnode, u32 context,
 	if (rc)
 		return rc;
 
-	rc = riscv_of_parent_hartid(parent.np, &hartid);
+	rc = riscv_of_parent_hartid(parent.np, hartid);
 	if (rc)
 		return rc;
 
 	*parent_hwirq = parent.args[0];
-	*parent_cpu = riscv_hartid_to_cpuid(hartid);
+	*parent_cpu = riscv_hartid_to_cpuid(*hartid);
 	return 0;
 }
 
 static int plic_probe(struct fwnode_handle *fwnode)
 {
 	int error = 0, nr_contexts, nr_handlers = 0, cpu, i;
-	unsigned long plic_quirks = 0;
+	unsigned long plic_quirks = 0, hartid;
 	struct plic_handler *handler;
 	u32 nr_irqs, parent_hwirq;
 	struct plic_priv *priv;
@@ -569,14 +569,15 @@ static int plic_probe(struct fwnode_handle *fwnode)
 
 	for (i = 0; i < nr_contexts; i++) {
 		error = plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu,
-						  priv->acpi_plic_id);
+						  priv->acpi_plic_id, &hartid);
 		if (error) {
 			pr_warn("%pfwP: hwirq for context%d not found\n", fwnode, i);
 			continue;
 		}
 
 		if (is_of_node(fwnode)) {
-			context_id = i;
+			/* each hart has two contexts: M-mode and S-mode */
+			context_id = hartid * 2 + i % 2;
 		} else {
 			context_id = acpi_rintc_get_plic_context(priv->acpi_plic_id, i);
 			if (context_id == INVALID_CONTEXT) {
@@ -594,7 +595,7 @@ static int plic_probe(struct fwnode_handle *fwnode)
 			if (IS_ENABLED(CONFIG_RISCV_M_MODE)) {
 				void __iomem *enable_base = priv->regs +
 					CONTEXT_ENABLE_BASE +
-					i * CONTEXT_ENABLE_SIZE;
+					context_id * CONTEXT_ENABLE_SIZE;
 
 				for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
 					__plic_toggle(enable_base, hwirq, 0);
@@ -694,7 +695,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
 
 fail_cleanup_contexts:
 	for (i = 0; i < nr_contexts; i++) {
-		if (plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu, priv->acpi_plic_id))
+		if (plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu,
+					      priv->acpi_plic_id, &hartid))
 			continue;
 		if (parent_hwirq != RV_IRQ_EXT || cpu < 0)
 			continue;

---
base-commit: fdbc36b17e9f2fa24c940959e39df90f53ccce2b
change-id: 20251020-fix-plic-amp-72bd94969ca4

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
