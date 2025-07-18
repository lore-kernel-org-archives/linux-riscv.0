Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36EE4C83F34
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 15:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kOyImPPvAE3ioTDgmkyRd076MoMcbbC1ZekassOrEWE=; b=vx4lVsd47j9tDS
	EFBWsmg24MNHNScHj6Jy0LVEzSozJTya6acI46Sf4Fw9n9f1f9EAStJrVyFtWujWQM2M6Rxv9SEzg
	p601lFjOGeLJ4H4B8X6H5Ny+aaC2Phx9e7q5r4N+Npp3kRllpfblDqnDofGR2hGUku1zqdD8lZvHS
	VhOwUNcBfSlNNELjQ3Q0ZckhZBtjv6kNC9ww+fIYSi/MZcTlmWF3ieqRdh7jXPJCUigpupgQlgLWg
	jOaw1RCdXt0tiw5LKFG+LS2WeBMRJuc/xBGp4Vbql6LpndmhA3p8WxG7+3Bn7IF7cE7V6JixuJd5Q
	5tzA+iziY024mAOAIrjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmk9-0000000CtmI-0y6O;
	Fri, 18 Jul 2025 15:11:25 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmeB-0000000CtGG-0RbL
	for linux-riscv@lists.infradead.org;
	Fri, 18 Jul 2025 15:05:17 +0000
Received: from [127.0.0.1] (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 39350335DBA;
	Fri, 18 Jul 2025 15:05:08 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 18 Jul 2025 23:04:37 +0800
Subject: [PATCH] dt-bindings: serial: 8250: spacemit: set clocks property
 as required
MIME-Version: 1.0
Message-Id: <20250718-01-k1-uart-binding-v1-1-a92e1e14c836@gentoo.org>
X-B4-Tracking: v=1; b=H4sIAIViemgC/x3MTQqAIBBA4avIrBtQIfu5SrSwHGsILLQiCO+et
 PwW772QKDIl6MULkW5OvIcCVQmYVxsWQnbFoKWuZaNalAo3hZeNJ04cHIcFje06MxnS3mso4RH
 J8/NPhzHnD4xyaCxkAAAA
X-Change-ID: 20250718-01-k1-uart-binding-6a996b6e2ff2
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Alex Elder <elder@riscstar.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1081; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=z5nzeOJWQR/Lo0Neg/++bHT0b0RJvmY2gZnAWASGbw8=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoemKhu7vmN4TWmEvIpf6rS0cOUqAVIxlZjiV1l
 Iw/+y0hGlOJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaHpioV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277QwxD/9nW529zHpmqRW9pt
 C8kft28pmDPm5VspeYejobS1RqEXsDQxqc5lX2lYd77tX3pz1vD3t2PZWYrrOS3IRS7xad7xD6P
 y+8yj7TgnW9cRG3H4sQGE6wwI0bUycxeI9gUU314ZkuoESGJoEFOrS6BwrTGsuk6xSwv+SLPU5o
 fok2lvIPkefdL4y/RpxX9u7vQhrvyiwJxRrzNweXr2SztBhjMRlHf5JwwsbVmXByO8r/pm1FcRh
 nlWFXJyqPsaz7cIrewKxC2Qk/ph+CttRfEKpzU+3K2Ow9SghxklmESkSCHBM8lGSLnorzdqC8N7
 qZaxsI2hXgcWDuK4oX7+3co+EF6wrX/KIxcgk7Gr6drYLnnORKHesrq0eGaxS4Zup3DTOfIibtE
 waVgE9N15C3OMIbrDcx2Wbl9AVuaRfaSxoggmyWqfbbgre/t5/a6k5pgBsiyYh2JjhL4Q5YqDXX
 Y/vrtIMI30iYAcJBHrxNTzxeR6lK6bY4lg9cQsfh9Ch/yP81UPv8KICTo0ahjZxCkEyViM3NiIo
 AeIuFv/DKl1BMTRCF7SC1wYsrGS1rgtLQbddCyFicnCGB9X/jDjI/ihfJhX4H9zjcTo2CmyBSU8
 ZBx/ZWllNfCXF/jBInW7eMRnBAS12FyQa1c/iAC+DIJJsqIm9f1wTC5t/NH1lTneJMCQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_080515_184892_3646FA9E 
X-CRM114-Status: UNSURE (   7.83  )
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

In SpacemiT's K1 SoC, the clocks for UART are mandatory needed, so
for DT, both clocks and clock-names property should be set as required.

Fixes: 2c0594f9f062 ("dt-bindings: serial: 8250: support an optional second clock")
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 33d2016b65090d0df257f9780ad8d5e05f7ce798..2c7604ed2a41d029276d3ebe9a3960a8dd44a9d9 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -239,7 +239,9 @@ if:
       contains:
         const: spacemit,k1-uart
 then:
-  required: [clock-names]
+  required:
+    - clocks
+    - clock-names
   properties:
     clocks:
       minItems: 2

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250718-01-k1-uart-binding-6a996b6e2ff2

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
