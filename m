Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35098CCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 03:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hOlCvTUvNdgdZe85bNamBifdfjQZz+eDsjnZcyOFDnA=; b=r+qMF1Wcd8U2Iv
	NNvwGT/Y1Ym60cg86PZilrDEL4s7hGXAG6X6oz93HDLccTATf6NDR3/uY6N+4amTpgA2T2aDdDvpD
	vXisNHuYlF/ku1eNlTbxDxeXuK9FmjXek+vZHLHe8pK+bk3xw3jwcN1/NtWaPy8co6pHa5rOyoIJB
	0YPS366xre2R3loR2o3/wvYERrlzQ3EP+cOT7hFzlWtkZmqepG48GYHQbvJuC4PcxS6VdaXg2KENA
	SaYSQIwI7YgzPQwTxrg9yrze0Gi/RXfEPyJF5xLNBoOS6xA7uhEtpPZYLDab/FMFC+HwXsEmThB7T
	3uGU6QJiCDGxhld9BMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAgvy-0000000Bo3w-12xT;
	Mon, 20 Oct 2025 03:51:46 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAgvu-0000000Bo3I-3N5M
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 03:51:44 +0000
X-QQ-mid: zesmtpsz2t1760932206t517f9aae
X-QQ-Originating-IP: wyKiwACbVfUQybFOMCCka2mwIAAqvRZ3aD4pA0CfH7g=
Received: from = ( [14.123.254.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 20 Oct 2025 11:50:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12576403627784975051
X-QQ-CSender: troy.mitchell@linux.spacemit.com
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Mon, 20 Oct 2025 11:49:45 +0800
Subject: [PATCH] irqchip/sifive-plic: use hartid as context_id in OF to fix
 AMP conflicts
MIME-Version: 1.0
Message-Id: <20251020-fix-plic-amp-v1-1-defe2a99ab80@linux.dev>
X-B4-Tracking: v=1; b=H4sIAFix9WgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMD3bTMCt2CnMxk3cTcAl1zo6QUSxNLM8vkRBMloJaColSgPNi46Nj
 aWgAQINMfXgAAAA==
X-Change-ID: 20251020-fix-plic-amp-72bd94969ca4
To: Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760932204; l=3513;
 i=troy.mitchell@linux.dev; s=20250710; h=from:subject:message-id;
 bh=uRvWV0R2c5iAFDC5+jFevLBgjxm1CeDDvGaWVsTm9N4=;
 b=HHzy1uYczXIJW/omts5VBBri9mYOWiWOW+DYDjrvx8dopdpdMo1zEiQXk4Qakw29XkzJOaVEs
 16ZpaRlKIdQAeWrg+MkaDF2ZPonk5M34NZ5sSZRrwZt9puicNXf0Ofy
X-Developer-Key: i=troy.mitchell@linux.dev; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NBUSIVIw0bNzC+M+oW5TpRqP6uMX2KaHK2dPFEckfGvZWrr7UARK5Aln
	qxPCzzJiro3IgZH9QUBglsHMwfTFepHgxVUEWjF0o1LLbrUWx+DPXA3vZBmixuJS30Ngofu
	GFaLFxySJMqlP/7J7wHXgxFdHQTyHlX0l3TlgUqlyq8FQYizgxd/MNwPZu3OH7fhZn+ZfBd
	k3cjiqbSRh71V4joy7zSIfzjqlQhsHGOMvtuAlEStkR5VekUoLuPI32ySUTpvKnIHIouW18
	7rDzB1NRKaLD2rbkFREQpGy5ksxNAnPsuxBD8WU44FjVXosAOo5p6GKhuSYHiUlsLVD/rZW
	TAy55hL4pOUZVPbL1Zs46T2t/bml3XZt/I1RQZtAVjrbK074KVuflgNDTRF8KE+At2pUDk5
	ogPLiyHvPCLRNtnAYZwT2DR5yphBvqbtVQwdMi9CVBT8QZ9iXSK9KzyhpmBfIWFtLTkJp8F
	tuYYIXsBW8rcNEUY2MuwQXp5u4lS1D6b+k0cyh+hlq0jgoHHamsDDD8II891SrRu++FTIgN
	TJmo0JdgUMmWiO/gNQQLwAb0immTMp/Xxm9RAVZ8s5CSErK+NM6V9K+uy02dlbiou61bcqN
	GxtXbkxVfFjfz/JSOS8JrGGy4kAK1lw6/7lW4InxF2WiVCAHQsa7+M1J2dRVlEUZ4XX7lLE
	+RANQ7HpWz06MwCzw4DUamtEspC/E9CScPLxC6JYFaFAbOHGZ9FcKikhL3PxzWZB6ypbV66
	CpaXUAOP0b/JNPkk+i3XI3cTTbv9fUucb2kyIDZT+PtawKRnMFybOPv5VCR4PMFg3yT5W2/
	3kHaFZw5L5ynDYjyAh87N/x1oedt3L7mx/Q1a4v1kfqTVUWy6N9xcxsPJwgGF+r8sGtcUIw
	KsiU7Un2BmnDUvd7kj77kNXc40279yUVEa5D2Hu/JU7T4wgvj1B8m5cWQl1Gs1Pfmb1n0lH
	O2mNqkCZClL6G0czSX4UV02L71ONzROuGuzpO37u+ubF050YeU3zhs4daGEmfmYqLuhIQER
	VtnIKqR5XCnzx0shJioUFkdvv5RsI3GJLHGgL7zQmqbuARYGGpRC2TqKghCTSqJG8zi9hJv
	2CzpT3R3GqT
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_205143_364929_A2161411 
X-CRM114-Status: GOOD (  12.77  )
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

In asymmetric multi-processing (AMP) scenarios, the original PLIC
driver used the context loop index 'i' as context_id for OF (device
tree) platforms. This caused multiple contexts from different harts
(e.g., core0 and core4) to share the same enable_base, leading to
conflicts when initializing the PLIC.

This patch resolves enable_base conflicts on AMP platforms while
maintaining SMP/UP behavior.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 drivers/irqchip/irq-sifive-plic.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index cbd7697bc14819cbe3b77096b26901b605491f75..79867afcd321e42ad837adb5c15d0e1dc9e0e1b4 100644
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
@@ -569,14 +569,14 @@ static int plic_probe(struct fwnode_handle *fwnode)
 
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
+			context_id = hartid * 2 + i % 2;
 		} else {
 			context_id = acpi_rintc_get_plic_context(priv->acpi_plic_id, i);
 			if (context_id == INVALID_CONTEXT) {
@@ -694,7 +694,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
 
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
