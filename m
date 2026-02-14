Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A230EEF48C5
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Feb 2026 12:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWksORoFLvoBwUF/SbAA/zURPCBb8TI99MuG6Guyc3o=; b=ZUpnEPQQRwodro
	PzKIs0Mt/Lmm6+aPrwtHZmOLYsQ9kKqHyIt2WxHwyP55Y1d2BWXwfLOVKvElSUtyfvllxDCUZWW/h
	vc4LVnF8FmtFhyl8HuXWNeGXe1kzrzha6PW9RPDEQmhucQi/Gozq8Q42P6sUfrhWwjKeRC22Iso1z
	suhHzBkQC7/rCFybsUncFPQGAGWLPyASli7eZf4MzQSjp1o2KA5KovVblnOLp8TtDO3XM+OgvOu17
	WBRb7XCkfWFVcyr+1jIRoR5kNqPRs/ASOudfiBZjeJkT/Ie712Hwmqyaw7nMDcSnL7UlHoTqap5CG
	4gNGFf45FwQtD82V1BbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrEmQ-00000004WzR-1Myw;
	Sat, 14 Feb 2026 12:29:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrEmM-00000004WxY-3Z7m;
	Sat, 14 Feb 2026 12:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 89A6E4448D;
	Sat, 14 Feb 2026 12:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A2FC19423;
	Sat, 14 Feb 2026 12:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771072182;
	bh=VfmU0lUs4Slg/JGUcPBhIcqCQuDwGNKonQhkwpcEyFU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dYYvjytUAC3NXiq0SGPRURADH309yF5j7sKkzD2FZaggGJgm8SL5TrAOjM2npwOnQ
	 NtCJc2SPVPfT6hTnYU6LIrzWuQoud5GyO8IAy0E98UxkuxnuIaobTxyHqnO94w7+oY
	 iWmc87Tx02GXtrEFVBOHgLLCOLl7MqRg73d+uW0E0A0TiX9wyiG76lJ83WrlzqvKe/
	 FluisyammkRfQTTGpHfuYGtUrqLF7tSH1IALKM+NnHaJr5A7gJ/M88ibFIHJ7TGnLO
	 OefebFD1QvZH1VGeHHjN0xsw1WW5+xC9bNoP929G8r+PrQ2fKjIrKGVhPvUs5Tu67o
	 xIS54AkxIXTlg==
From: Yixun Lan <dlan@kernel.org>
Date: Sat, 14 Feb 2026 20:29:14 +0800
Subject: [PATCH v2 1/3] dt-bindings: phy: spacemit: k3: add USB2 PHY
 support
MIME-Version: 1.0
Message-Id: <20260214-11-k3-usb2-phy-v2-1-6ed31e031ab4@kernel.org>
References: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
In-Reply-To: <20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1204; i=dlan@kernel.org;
 h=from:subject:message-id; bh=VfmU0lUs4Slg/JGUcPBhIcqCQuDwGNKonQhkwpcEyFU=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpkGqk74oeID65Ro92lCV4S1UmpfWqKztQkaHpX
 wm05uUOB8SJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaZBqpBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1/NQ/9EPpkiSAM4flTUD6Z54ieBpT27zD2O/Qb/o94Ub7O38OVWgKEjffKf
 IjF3QC+Yg1CC9uNhzolxccCY9Rd61lqHh0gYSvg223HNztJb/3KVIh46dOvdeOKRHX35z87Buix
 0jX05MkKsBUwj4ZcoWo7+DCMx4GMl3vOxt4yYUT6YMFh/hiZuHHZPh7f6BSBPx/hvxD0esP7e6U
 mAt6+Zss+ge7WzmP8SMGDaO3CWmB1LXysncj8D01AUx8tjUn8ljgHfAJt8yLThSlyl/nROZyfHU
 iWMqXzpF4n307jNO25kRLQ0x+Pa+MvqFmI/bcAoCZbzGG2j3mkLX9Fx7D1n6IkCdFBQ09JsdAKL
 i5CLV8twPoBw3ZXPXxUI7yzRgwnT4z+EMxGtSWlL9ALW7v+BJFVmTOTVbgxdqqE1ZPnvDl7LEW8
 Ol5Qhf2M9GWfvpbJIGKHUe90RY+oH6yMRB3Av4p+DyTI4SIjt/qRHLNh8GKOf1GpR+/YU1Y4iak
 yNHCxOHVqRbk6WYI8ItFQ6jeTecqG3eFDH2arZU1QHs+0iiPY0nh0fFXaKkMrfjl0Iy+0VEdMqt
 gJQmltBJikJY2MtIGq/idMcc50gf4tRa/0oIOdcIUs2k/GnxiB55FXxwLgZbhFHl+JkzCa6VNXk
 zrxYjLgmq1unKCr4cZ0o3gHkQOhQd4=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_042942_932375_2BF31A3E 
X-CRM114-Status: UNSURE (   6.67  )
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

Introduce a compatible string for the USB2 PHY in SpacemiT K3 SoC. The IP
of USB2 PHY mostly shares the same functionalities with K1 SoC, while has
some register layout changes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
index 43eaca90d88c..18025e5f60d6 100644
--- a/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/spacemit,usb2-phy.yaml
@@ -4,14 +4,16 @@
 $id: http://devicetree.org/schemas/phy/spacemit,usb2-phy.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: SpacemiT K1 SoC USB 2.0 PHY
+title: SpacemiT K1/K3 SoC USB 2.0 PHY
 
 maintainers:
   - Ze Huang <huang.ze@linux.dev>
 
 properties:
   compatible:
-    const: spacemit,k1-usb2-phy
+    enum:
+      - spacemit,k1-usb2-phy
+      - spacemit,k3-usb2-phy
 
   reg:
     maxItems: 1

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
