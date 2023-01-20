Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB36C38159
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 14:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vsoq2ks4zlw5/1adAaApAsG/x5WITO/3J7w4i2oay0Q=; b=O7uSRsUKF82JAD
	lwbncjdpu6TV4JYTw2bTglsarDu3HmtiRnfJpXuBX+JevNBjvs0+EsKX2aKdzRECvM6//LUZcmgSG
	KgvOlmCaPD885pgZyKB/E/oGhndw68YaYEw3v7wEC8t/0aRSWg1WaLUeN3Xnuhj2KyX+avaJ+b5sj
	8DYmwahWwlkeJZATiDPZuq9zMhntaUdURcHBWEeb135efeW4DBoNfZngF/lDvYbx/+MJ6h9mZAAM7
	Dkk+1dhDa3PrwYtNTTEysjrgMkdwl3mxOmwEaRN0kolp1hayOxEk3hGDcK/HC0ffEot1/JWJ4AxXo
	v5j7ya7YH8E165POdVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIs6M-00AbG6-Co; Fri, 20 Jan 2023 14:10:42 +0000
Received: from smtpout30.security-mail.net ([85.31.212.34] helo=fx304.security-mail.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIs6D-00Ab7I-VM
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 14:10:38 +0000
Received: from localhost (localhost [127.0.0.1])
	by fx304.security-mail.net (Postfix) with ESMTP id 135449D06E
	for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 15:10:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
	s=sec-sig-email; t=1674223829;
	bh=Tdx6DhS9iYMQn8Pwje0Ri02hH2e9yxqRSeBt1yYf7ac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R8pdYrGodKitdXwzV2nzW3qHfWuxYUNkUvaxo0mQARysWxT66IdF/7+CYg5Xg8g1E
	 +ZjRycjH3QG2b5rYcNyxWZjn4WfMoHzEDeP/dayWrjlhjhBNi0fTLZ+a45fcoihDDP
	 68jQR4sqKlClEJtAlI2bg5R/sFkRuA7oauSxXDoA=
Received: from fx304 (localhost [127.0.0.1]) by fx304.security-mail.net
 (Postfix) with ESMTP id C01539D02D; Fri, 20 Jan 2023 15:10:28 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx304.security-mail.net (Postfix) with ESMTPS id 2273E9D0A3; Fri, 20 Jan
 2023 15:10:28 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id CC99E27E0430; Fri, 20 Jan 2023
 15:10:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 86A5727E0437; Fri, 20 Jan 2023 15:10:27 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 7H_ZxR3-jhzL; Fri, 20 Jan 2023 15:10:27 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id E4DF627E0439; Fri, 20 Jan 2023
 15:10:26 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <6f30.63caa0d4.21362.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 86A5727E0437
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1674223827;
 bh=pa4ScTG872xOzuRt8GX8Xf9/eL9W3gZxwoN/kQBQFss=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=mCuKc4/UeROfSPy0qESb6bWw6haYw2yj/Thuaz88gp4Xo6fY7v11akHAnwnsq/SE/
 l71YYm+MloYSX37ktexP6Ugc0NvI9sQziU77LnSg76PpXxXYDYmYnCLgz0FFptdvhN
 uCVOH2np8u2uDy77i3yNVSUCOsRcLW4hLIHMTeNw=
From: Yann Sionneau <ysionneau@kalray.eu>
To: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Mark
 Rutland <mark.rutland@arm.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>, Ingo Molnar
 <mingo@redhat.com>, Waiman Long <longman@redhat.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Nick Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>, Eric
 Paris <eparis@redhat.com>, Christian Brauner <brauner@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jules Maselbas <jmaselbas@kalray.eu>,
 Yann Sionneau <ysionneau@kalray.eu>, Guillaume Thouvenin
 <gthouvenin@kalray.eu>, Clement Leger <clement@clement-leger.fr>, Vincent
 Chardon <vincent.chardon@elsys-design.com>, Marc =?utf-8?b?UG91bGhpw6hz?=
 <dkm@kataplop.net>, Julian Vetter <jvetter@kalray.eu>, Samuel Jones
 <sjones@kalray.eu>, Ashley Lesdalons <alesdalons@kalray.eu>, Thomas Costis
 <tcostis@kalray.eu>, Marius Gligor <mgligor@kalray.eu>, Jonathan Borne
 <jborne@kalray.eu>, Julien Villette <jvillette@kalray.eu>, Luc Michel
 <lmichel@kalray.eu>, Louis Morhet <lmorhet@kalray.eu>, Julien Hascoet
 <jhascoet@kalray.eu>, Jean-Christophe Pince <jcpince@gmail.com>, Guillaume
 Missonnier <gmissonnier@kalray.eu>, Alex Michon <amichon@kalray.eu>, Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <git@xen0n.name>, Shaokun Zhang
 <zhangshaokun@hisilicon.com>, John Garry <john.garry@huawei.com>, Guangbin
 Huang <huangguangbin2@huawei.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Bibo Mao <maobibo@loongson.cn>, Atish Patra <atishp@atishpatra.org>, "Jason
 A. Donenfeld" <Jason@zx2c4.com>, Qi Liu <liuqi115@huawei.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark
 Brown <broonie@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Alexey
 Dobriyan <adobriyan@gmail.com>
Cc: Benjamin Mugnier <mugnier.benjamin@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-audit@redhat.com, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: [RFC PATCH v2 06/31] Documentation: Add binding for
 kalray,kv3-1-ipi-ctrl
Date: Fri, 20 Jan 2023 15:09:37 +0100
Message-ID: <20230120141002.2442-7-ysionneau@kalray.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120141002.2442-1-ysionneau@kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
MIME-Version: 1.0
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_061034_236919_F092C7CC 
X-CRM114-Status: GOOD (  15.23  )
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

From: Jules Maselbas <jmaselbas@kalray.eu>

Add documentation for `kalray,kv3-1-ipi-ctrl` binding.

Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---

Notes:
    V1 -> V2: new patch

 .../kalray/kalray,kv3-1-ipi-ctrl.yaml         | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/kalray/kalray,kv3-1-ipi-ctrl.yaml

diff --git a/Documentation/devicetree/bindings/kalray/kalray,kv3-1-ipi-ctrl.yaml b/Documentation/devicetree/bindings/kalray/kalray,kv3-1-ipi-ctrl.yaml
new file mode 100644
index 000000000000..dc8026b12905
--- /dev/null
+++ b/Documentation/devicetree/bindings/kalray/kalray,kv3-1-ipi-ctrl.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/kalray/kalray,kv3-1-ipi-ctrl#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kalray kv3-1 Inter-Processor Interrupt Controller (IPI)
+
+description: |
+  The Inter-Processor Interrupt Controller (IPI) provides a fast synchronization
+  mechanism to the software. It exposes eight independent set of registers that
+  can be use to notify each processor in the cluster.
+  A set of registers contains two 32-bit registers:
+    - 17-bit interrupt control, one bit per core, raise an interrupt on write
+    - 17-bit mask, one per core, to enable interrupts
+
+  Bit at offsets 0 to 15 selects cores in the cluster, respectively PE0 to PE15,
+  while bit at offset 16 is for the cluster Resource Manager (RM) core.
+
+  The eight output interrupts are connected to each processor core interrupt
+  controller (intc).
+
+properties:
+  compatible:
+    const: kalray,kv3-1-ipi-ctrl
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-parent
+  - interrupts
+
+examples:
+  - |
+    ipi: inter-processor-interrupt@ad0000 {
+        compatible = "kalray,kv3-1-ipi-ctrl";
+        reg = <0x00 0xad0000 0x00 0x1000>;
+        interrupt-parent = <&intc>;
+        interrupts = <24>;
+    };
+
+...
-- 
2.37.2






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
