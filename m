Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0336C38159
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 14:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XW3PTt+L3OyN2ru/DySGevrfHbq/Nu+ruPpJCxoE1gg=; b=gXZyvcpb71Lz6v
	fGQiJ2TrLjI/tyBeygDwvnt5rjRdovZXO98vKgPt7fTka+/koQuf73KlKKencAtxeOW8E0qoOK1BO
	PqPV1xyyxfYBRGXsNUzyvtCVzdLetTu3pry2Cqkd0iBNhrpa2F1T8X2tCovPa0fNt95pFb7xu6flo
	Ld/iYJMs4uo5NOMbIIMqBDvWHmWZwC+WyWTViIoC/q4aMfRh/F/htbnVqzIYfIjn11qX2oBUTiarw
	pX2BQQ4PsPVPZS4PrsQ7rHhNZpVvN24YgaxX510xBnNLGxX3KXEslfpXIV/8ii1QTzo4zuK7DoPCO
	ETxcOfKV3wHzCsaqJn+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIs6d-00AbQs-1S; Fri, 20 Jan 2023 14:10:59 +0000
Received: from smtpout140.security-mail.net ([85.31.212.148] helo=fx408.security-mail.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIs6F-00Ab7Z-Ur
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 14:10:42 +0000
Received: from localhost (fx408.security-mail.net [127.0.0.1])
	by fx408.security-mail.net (Postfix) with ESMTP id 00289322B25
	for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 15:10:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
	s=sec-sig-email; t=1674223831;
	bh=ipV6uYEByPI5c+C5yQy7aqSsXm8TxX991WZckgEkaks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=2CGIfUOHxu04MrsP1f2l1zsW7QPwbJykD6jGD42mN0f9R/ljnHoqPL5k7B55pv+4w
	 TQXlhh3dO0sXftpyS9amibvUJ8ueC2qgc5kzfZitepp/bTpc8j6OaLuvbtEB+35V5R
	 OrXmoWAsNqpa4YOLIQXMSgREsjEz5ZfaJeRMUNdM=
Received: from fx408 (fx408.security-mail.net [127.0.0.1]) by
 fx408.security-mail.net (Postfix) with ESMTP id B64663225D4; Fri, 20 Jan
 2023 15:10:29 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx408.security-mail.net (Postfix) with ESMTPS id 84EBF3229C1; Fri, 20 Jan
 2023 15:10:27 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 4587527E043A; Fri, 20 Jan 2023
 15:10:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 0E1ED27E0430; Fri, 20 Jan 2023 15:10:27 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 qEQcUNiyIIfp; Fri, 20 Jan 2023 15:10:26 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 6DE6527E0437; Fri, 20 Jan 2023
 15:10:26 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <1010c.63caa0d3.82e25.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 0E1ED27E0430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1674223827;
 bh=BhrYTlway6H47k+1WH6tY+7D+lekRPB9kTC8Yr1liXc=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=oFg5sEcCLpoupdKUAJVDuBV1Yxh9BZLNZVHVECdDWl/HZrggI6m//7aB/zUkRD5ML
 GDYlchdCVVn7Xb9cxeNZJNnf8AI3loDdEUh6uWAVMFL+FcHinJp2cSNSasIrxrWySo
 +2PhSeUvRBMs9MSoflMTXb8aLv5jpAfzT4Fxwp0k=
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
Subject: [RFC PATCH v2 05/31] Documentation: Add binding for
 kalray,coolidge-itgen
Date: Fri, 20 Jan 2023 15:09:36 +0100
Message-ID: <20230120141002.2442-6-ysionneau@kalray.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120141002.2442-1-ysionneau@kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
MIME-Version: 1.0
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_061036_205194_3FEDF364 
X-CRM114-Status: GOOD (  14.50  )
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

Add documentation for `kalray,coolidge-itgen` binding.

Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---

Notes:
    V1 -> V2: new patch

 .../kalray,coolidge-itgen.yaml                | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/kalray,coolidge-itgen.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/kalray,coolidge-itgen.yaml b/Documentation/devicetree/bindings/interrupt-controller/kalray,coolidge-itgen.yaml
new file mode 100644
index 000000000000..47b503bff1d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/kalray,coolidge-itgen.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/kalray,coolidge-itgen#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kalray Coolidge SoC Interrupt Generator (ITGEN)
+
+description: |
+  The Interrupt Generator (ITGEN) is an interrupt controller block.
+  It's purpose is to convert IRQ lines coming from SoC peripherals into writes
+  on the AXI bus. The ITGEN intended purpose is to write into the APIC mailboxes.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: kalray,coolidge-itgen
+
+  "#interrupt-cells":
+    const: 2
+    description: |
+      - 1st cell is for the IRQ number
+      - 2nd cell is for the trigger type as defined dt-bindings/interrupt-controller/irq.h
+
+  interrupt-controller: true
+
+  msi-parent: true
+
+required:
+  - compatible
+  - reg
+  - "#interrupt-cells"
+  - interrupt-controller
+  - msi-parent
+
+examples:
+  - |
+    itgen: interrupt-controller@27000000 {
+        compatible = "kalray,coolidge-itgen";
+        reg = <0 0x27000000 0 0x1104>;
+        #interrupt-cells = <2>;
+        interrupt-controller;
+        msi-parent = <&apic_mailbox>;
+    };
+
+...
-- 
2.37.2






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
