Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445E3C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 20:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryDJGvKn8fG069+hlZosiT5G4IZdH1sVDN5/Xwu2Qr4=; b=U3dAihZ7icx8Un
	5beTosTXqPVHgEkri7rtoNohwkuiQdKmvIM62L+xrwJDTmXkwZrWZ3/j+fWjCPqeffv9OjKiNyTSG
	XrS6O5DBRdfjdG5G2ijGkP5YJI82q4bk3YZrZpW8XtHW5v5E1sDNVT0hkap/OdJBmyfldo+8fRtL7
	utFxlu87oYN+D+PAp7LWW6QoMKIB6Vta6Gl+yf8aReYikicz2yf1BeOQCU5r7l/V70XrMKM2wIxp0
	4YJJ1mHcpFWzY8m3vMyuvk9NrhNA9vYmYbisSlAUvs40Cde11yLNIQjGDgwJ6D5wM9oV3iDDGbz/r
	CHLzzfjm1der2mAeCRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zm0-0077m0-1O;
	Wed, 07 Jun 2023 20:28:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zlw-0077kf-2l
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 20:28:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B824644B1;
	Wed,  7 Jun 2023 20:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6713C433D2;
	Wed,  7 Jun 2023 20:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686169727;
	bh=lXhMAVAHnw/Oo1O+4NojcGUuF4uMH1LW3zpYfd5lKDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uoXyyCqpJp5OkmELmBgzRSOxxvdTXS7/jRfQ9GagZdnJx2dSYcdYduVTiuavkjFh9
	 bUHtEm3712JoWHKzgaxMB//ZWWlMZGYs9kY7KpUN81x3gYX4Lxtsk3gPRH4Wn4wCH7
	 5pWSKmp/ngpvqof3HVMWvN68xtkfZxNiFyIcYBrgY0ZS8lrhydYgXw5sReJoqauj9a
	 fGoBjtq9OeTcZmrts8zhi4/E9VXGATlgnZY+txv4j40EA77L/pR3eo7qH/ntMQstrt
	 BTIv1AN3Dr9zIkC/hu7zjVS/dHpLBWsnMNa+KAJsTJ46YwdEYg1Z7xfhLoebtLbnpo
	 pe26kdsS3qPkg==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v3 2/7] RISC-V: split early & late of_node to hartid mapping
Date: Wed,  7 Jun 2023 21:28:26 +0100
Message-Id: <20230607-glade-pastel-d8cbd9d9f3c6@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230607-audacity-overhaul-82bb867a825f@spud>
References: <20230607-audacity-overhaul-82bb867a825f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3295; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=QiCH3jp+i6O49v44UqeRlbwmpTwYeRZiPHSENjDshIs=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkNLzIT826wPWL9nWe2gWO6o8Y0jpLXrjfuMTxqn3k5+ WZ/hSZ7RykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYypZjhr8BNFeapTg+511i8 XnnhZG2ijqTEWuvK49yKnAv/ztn49QQjwwNG8S5GV6cor+lqu88tvD5V8lPOF/vyho8WrNnC1dN bmQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_132848_981631_5AEE6A3E 
X-CRM114-Status: GOOD (  16.42  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Some back and forth with Drew [1] about riscv_fill_hwcap() resulted in
the realisation that it is not very useful to parse the DT & perform
validation of riscv,isa every time we would like to get the id for a
hart.

Although it is no longer called in riscv_fill_hwcap(),
riscv_of_processor_hartid() is called in several other places.
Notably in setup_smp() it forms part of the logic for filling the mask
of possible CPUs. Since a possible CPU must have passed this basic
validation of riscv,isa, a repeat validation is not required.

Rename riscv_of_processor_id() to riscv_early_of_processor_id(),
which will be called from setup_smp() & introduce a new
riscv_of_processor_id() which makes use of the pre-populated mask of
possible cpus.

Link: https://lore.kernel.org/linux-riscv/xvdswl3iyikwvamny7ikrxo2ncuixshtg3f6uucjahpe3xpc5c@ud4cz4fkg5dj/ [1]
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/processor.h |  1 +
 arch/riscv/kernel/cpu.c            | 22 +++++++++++++++++++++-
 arch/riscv/kernel/smpboot.c        |  2 +-
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 94a0590c6971..3479f9fca4b0 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -75,6 +75,7 @@ static inline void wait_for_interrupt(void)
 
 struct device_node;
 int riscv_of_processor_hartid(struct device_node *node, unsigned long *hartid);
+int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *hartid);
 int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid);
 
 extern void riscv_fill_hwcap(void);
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 637263f9a7b9..8025de06edb7 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -22,6 +22,26 @@
  * isn't an enabled and valid RISC-V hart node.
  */
 int riscv_of_processor_hartid(struct device_node *node, unsigned long *hart)
+{
+	int cpu;
+
+	*hart = (unsigned long)of_get_cpu_hwid(node, 0);
+	if (*hart == ~0UL) {
+		pr_warn("Found CPU without hart ID\n");
+		return -ENODEV;
+	}
+
+	cpu = riscv_hartid_to_cpuid(*hart);
+	if (cpu < 0)
+		return cpu;
+
+	if (!cpu_possible(cpu))
+		return -ENODEV;
+
+	return 0;
+}
+
+int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *hart)
 {
 	const char *isa;
 
@@ -30,7 +50,7 @@ int riscv_of_processor_hartid(struct device_node *node, unsigned long *hart)
 		return -ENODEV;
 	}
 
-	*hart = (unsigned long) of_get_cpu_hwid(node, 0);
+	*hart = (unsigned long)of_get_cpu_hwid(node, 0);
 	if (*hart == ~0UL) {
 		pr_warn("Found CPU without hart ID\n");
 		return -ENODEV;
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 67bc5ef3e8b2..3f42331c8912 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -148,7 +148,7 @@ static void __init of_parse_and_init_cpus(void)
 	cpu_set_ops(0);
 
 	for_each_of_cpu_node(dn) {
-		rc = riscv_of_processor_hartid(dn, &hart);
+		rc = riscv_early_of_processor_hartid(dn, &hart);
 		if (rc < 0)
 			continue;
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
