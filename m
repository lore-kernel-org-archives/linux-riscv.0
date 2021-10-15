Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D610FC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 10:10:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CD3660F56
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 10:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CD3660F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CxqZOndBQupbkBEd/frjYSV3O0Bu7OTlNAtA+L178/o=; b=kxfan9ID/9sNhR
	vFAcaCxvdv+NSvBepgZiWGWr3x/nsfm7N4wsPN/Ee097+gmc+Af213bO5X7vGjTy0JDj+9EsBZ5iy
	hACmHdCc/I5NELT2qr05m8yJcPGbhL1N/DFyFD/CoxhfS+atB+detS5Sc5w9FdosbWRUIuE4YH7Bk
	utqlS5+fq8opWE0rgJjKQ5v4gniKMVSui+Sf6b/sDl/PD+YqENj26w+N758+m5mMjp0vnDHGe4ass
	+rTu0/greqz5TF3OrFf29pZs7LcccrtvjEUoAOMKUqhrlfvsrMDTML1iG7dPv6jTCbcQS9lMpVCQy
	SS1tnZIcqVsJz+2/e8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbKA6-006RFf-45; Fri, 15 Oct 2021 10:10:02 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbKA3-006RDy-3W; Fri, 15 Oct 2021 10:10:00 +0000
Received: from workstation5.fritz.box
 (ip-88-152-144-157.hsi03.unitymediagroup.de [88.152.144.157])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 909263F0B8; 
 Fri, 15 Oct 2021 10:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634292589;
 bh=4vBofezLzSZ267ePulcBjbn/3hP3KcAP9nzxWY7BwCc=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=oo7KCxGip8hAvtiFb6719RTzo21kgwTdVknb14u/HrnGiSZ++JCoY/YoYbdd6mrue
 p9vEdK5oHaFbPg+MtyPXXUFK9XxZxtBZDR/Lf+A05aFGsSlvKtg5srEUXJMB4+6RVc
 v/EGNYYyb+zBeT+FSM5goCPaXupEqGePlVv9+35HVzlVAfqAoc3mLSIb/SBj3Houno
 EHVshFC4/ZzcD629vQ/zDl85T0O7CmuoD99/fO8T97j+d8UltFu8q53t0o6GhF7OZt
 Iy2Og74H0FkjnBH+X1XJkMXc+Dx+QRq0eKYfzfy7UOjrXiwHhoHaEsMl0vbiraFkhd
 LVaHi5tzWURYA==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Guo Ren <guoren@linux.alibaba.com>, Bin Meng <bmeng.cn@gmail.com>,
 Xiang W <wxjstz@126.com>, Samuel Holland <samuel@sholland.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, opensbi@lists.infradead.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] dt-bindings: reg-io-width for SiFive CLINT
Date: Fri, 15 Oct 2021 12:09:41 +0200
Message-Id: <20211015100941.17621-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_030959_319752_2DC1B055 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

The CLINT in the T-HEAD 9xx processors do not support 64bit mmio access to
the MTIMER device. The current schema does not allow to specify this.

OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
restriction. Samuael Holland suggested in
lib: utils/timer: Use standard property to specify 32-bit I/O
https://github.com/smaeul/opensbi/commit/b95e9cf7cf93b0af16fc89204378bc59ff30008e
to use "reg-io-width = <4>;" as the reg-io-width property is generally used
in the devicetree schema for such a condition.

A release candidate of the ACLINT specification is available at
https://github.com/riscv/riscv-aclint/releases

Add reg-io-width as optional property to the SiFive Core Local Interruptor.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index a35952f48742..266012d887b5 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -41,6 +41,13 @@ properties:
   reg:
     maxItems: 1
 
+  reg-io-width:
+    description: |
+      Some CLINT implementations, e.g. on the T-HEAD 9xx, only support
+      32bit access for MTIMER.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    const: 4
+
   interrupts-extended:
     minItems: 1
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
