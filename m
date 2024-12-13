Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08728E7717D
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 09:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x2OwRP/jFdHAoYQqlk6qWExFF/WWxF0+Ln2iXc6ZiBA=; b=pDDNSpBWIgGFDK
	9d9RLWyxkKEhTHIHjCGrJtkOncAKgDtg2jvjqZcKG9iVEo0jGw3+NSXJUyaQ7kQMu+yvfbNVuwXwq
	JkkyZRKTHyLnb5Vggr+XAKNtpwwPbUBCAjTsUpvWXvSoDuHxmErM8XvPmSzf/anj+xwbYlmi+X8k/
	p0faOJ/+chVE6jpW4wseHoArW3aCDy/x3zuwfhNYjqwaAEqLkWgMuth/Ii2KHCvJizzlPQyqupHYF
	VdquKXddQAQDGkQf8uGFLmqxkwd+Xj2sQRFhX5Kid3EmrGtRTR/aiIOC9woiXTWAZ3h8TXOB/eeqH
	qNgmJ5LxnA4/Y6PaW4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1go-00000003C2Y-1glf;
	Fri, 13 Dec 2024 09:10:26 +0000
Received: from out28-98.mail.aliyun.com ([115.124.28.98])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1gk-00000003Bzy-0Dmj
	for linux-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 09:10:25 +0000
Received: from localhost.localdomain(mailfrom:huangborong@bosc.ac.cn fp:SMTPD_---.ad2ZQpQ_1734081005 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 13 Dec 2024 17:10:12 +0800
From: Huang Borong <huangborong@bosc.ac.cn>
To: anup@brainfault.org,
	tglx@linutronix.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	trivial@kernel.org,
	Huang Borong <huangborong@bosc.ac.cn>
Subject: [PATCH] dt-bindings: interrupt-controller: update imsic reg address to 0x24000000 in Example 1
Date: Fri, 13 Dec 2024 17:09:24 +0800
Message-Id: <20241213090924.181249-1-huangborong@bosc.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_011022_233926_3A48AB83 
X-CRM114-Status: UNSURE (   7.40  )
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

Change the 'reg' property address from 0x28000000 to 0x24000000
to match the node label interrupt-controller@24000000.

Signed-off-by: Huang Borong <huangborong@bosc.ac.cn>
---
 .../devicetree/bindings/interrupt-controller/riscv,imsics.yaml  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index 84976f17a4a1..c23b5c09fdb9 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -142,7 +142,7 @@ examples:
                             <&cpu2_intc 11>,
                             <&cpu3_intc 11>,
                             <&cpu4_intc 11>;
-      reg = <0x28000000 0x4000>;
+      reg = <0x24000000 0x4000>;
       interrupt-controller;
       #interrupt-cells = <0>;
       msi-controller;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
