Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FF3FB44B0
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 05:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b7CYFQiS2pph4r27sZPQO1CWZYKVlelgkSjNnNb56DU=; b=UK1KDhf+PIB9nu
	2YXwgnoH85XUEhWUu77hkkl0j70dQzU01wTc3QdagMFTagy/YXFF8Yx/x7EWjS5Sn0994QsIysivx
	jfMP6yKQKMqYMPe83cIz/zJxmqqw2LT/86JpK+hH1jLzuK4YT7XHB0FNeIReThnB8TXCSeqyejxAt
	KeDUUukqZEJ3519igSbRqYN979QzCpts/W1wUAmIaB4fqn6J5GvSAuAjG3yiKnZhtuov32mufbneD
	pyA8zUSpJTe9vYTGVznK+38eJiiP+WLo8Gkdbq2PiopaceFcR4gK2dhEnmRQQKwdSuOIjzb1Y4K19
	kzEZjLIGB20FO4DwHgGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG9HF-0000000Cfjl-47Zj;
	Fri, 24 Apr 2026 05:40:34 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG9HC-0000000Cfig-3abm
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 05:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	References:In-Reply-To:To:Cc; bh=CazP3N52f1nCvmZtjzHZ7Mf6Mbw4Oxl
	XtuudHXoWhHM=; b=lLrKq+7Q1XFzZ7yiUSomLcS1Lbjl9JV3fc36eoR8+jaSNS/
	AmOHwHgH7vvoo/xwVIjrG9VlEm9rQx3DN87ZzWkJlh6cXuJMSltE2FLxRSAOfUFY
	qExQW/gHBfj8vgKFgqrVqoP1L3kMLvZz+HTcrf4s6+XFf2iBDDfy131PMXlk=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUJlAutpm8gCAA--.1607S5;
	Fri, 24 Apr 2026 13:41:10 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Date: Fri, 24 Apr 2026 13:39:30 +0800
Subject: [PATCH v4 3/4] dt-bindings: serial: snps-dw-apb-uart: Add
 UltraRISC DP1000 UART
MIME-Version: 1.0
Message-Id: <20260424-ultrarisc-serial-v4-3-1765a0b4c4a0@ultrarisc.com>
References: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com>
In-Reply-To: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777009209; l=940;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=OBxaCDrLhDZu5z052SqiNPQvLxJomqwT7wxTFCttk4A=;
 b=t2QN21ycEbR44HY0SqQBFZxlVSqKR+YNmTHW0QtrUQj8DZVA9qQUeYp6erNEYx0uTji1JAo35
 jLch4ixTDH6BcXXVTYN33CbB32qGnGmQ0oifbFdGFhgRwCZgBNt5+4Q
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwAnYUJlAutpm8gCAA--.1607S5
X-Coremail-Antispam: 1UD129KBjvdXoWrKF1UuFW5XrW5GF1UWr1DAwb_yoWfZrg_C3
	yxuayDZF45AFWFva1DAF1xtr1rZF47WFs5urn8t3WDC34DZay5Ka4kKr90yw1rKr1fur4f
	Cr9akryqkrsxGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAHEWnq6L8ACQAFsP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_224031_257319_9B872F73 
X-CRM114-Status: UNSURE (   6.22  )
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

UltraRISC DP1000 integrates a Synopsys DesignWare APB UART, but it does
not provide the standard CPR and UCV registers.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 6efe43089a74..f84600f66df8 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -77,6 +77,7 @@ properties:
               - starfive,jh7100-hsuart
               - starfive,jh7100-uart
               - starfive,jh7110-uart
+              - ultrarisc,dp1000-uart
           - const: snps,dw-apb-uart
       - const: snps,dw-apb-uart
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
