Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC020ECD6F7
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 01:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tnIcF6TWy6CXMpMswbBjh/hb82HpkitqPNniaGjROQ=; b=Vtxp4N4onMQ1WK
	JovaXyBFBwafBdXWN9BbL6LsRqFECS7dOich9vlHvWh4pI4u4uomIp6x9LsMsy1aDs+B8LsbVneAT
	X2XcnmD9Jn+CZqZiVFkYf4NPNkEUTVDtg4TDfi+zMdoUrvmLknPeUjcETHaFQE8TTYLxN1tCdHOJp
	Wgs9erukjJJGK6UKk/2vRRh4VylSeXEFCUiC/9yMtczsHw2jijQ+QPvJzZGtZG/NpFncleWMAI6hg
	837OaGDkfmCMzQyFTX43rem5BLLhGIaSpJJvwhKFB8IQClWgEpBsCf9nXmmLojRPteZPFSULIbc8L
	tjz9oDvV377yIj4j4cQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqLfq-00000001HBS-172O;
	Thu, 12 Feb 2026 01:39:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqLfn-00000001H9r-3EcW;
	Thu, 12 Feb 2026 01:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BEF1660135;
	Thu, 12 Feb 2026 01:39:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9E9C19423;
	Thu, 12 Feb 2026 01:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770860354;
	bh=2fG2J3eWsyvskz/JyfyVtoo2zW/1/dvAbxTesMxxSlw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pMh8lz+faYQZze8QKO7XPA9Aco0gQGbW+/qfsCQiPfjfZ5naxBl8iSjo1NO60G8SL
	 tUHIg+AtMLucE8sjJuoVLz47rROFXVFOjgzw5ULaFuPYO2wCKZtv7psvgXd/Cg2BQH
	 vw8vWStevdVsPGvJxF1aWiGIpAxdljOVickaZtMVQmL+TBJYzSEugJ83BQLzqLCmSn
	 rCc+8JVkjYFSFHUEwhPX0o4n/tMmyQ3mNMuUysFCDEcqTKKaDfe65Wy62ywlr1LFqX
	 6Nc9OoL+RlwpaKPRL9b6a2C23g2KzwMfENjgPhcu+hf5i31eRl1QH4sZUAYzkSynYR
	 KJcvZmWGqMKLg==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 12 Feb 2026 09:38:54 +0800
Subject: [PATCH 1/3] dt-bindings: phy: spacemit: k3: add USB2 PHY support
MIME-Version: 1.0
Message-Id: <20260212-11-k3-usb2-phy-v1-1-43578592405d@kernel.org>
References: <20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org>
In-Reply-To: <20260212-11-k3-usb2-phy-v1-0-43578592405d@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=dlan@kernel.org;
 h=from:subject:message-id; bh=2fG2J3eWsyvskz/JyfyVtoo2zW/1/dvAbxTesMxxSlw=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpjS800dAle+HhsO2L7sGXmR9XF/MO4OA5MrLSX
 yAHfAxfrWqJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaY0vNBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0oJg/+KYza1iIK+9Z4TL0pqqwAMsZFW/P2qdfpaSTf+1relauokxvbhwp8L
 UPzTKTjJNkYlNtoZe+ic8B1JTAW7JBqAhYX5WlD60MRXluyhVV/aA9Gw6vvPUIdJ15SXsAm2B00
 Mpd64a97StuWSCdiMBE0p815WHsmeH4NAef2zXtIJH65WCzrMxhMO2V2opqbn92yWE7bZ4ccMLP
 rzUpCc5+FewOaX/dEWAoTWs+Hgv/ntFNOcEW+I6txaed7G9BQOpeY+GLEHCwn95FAMhTtmh40tP
 UUzLyWM2QMdt1Wf603J13lveobEeEmJkrbBjuNQe2mOwPfev2QIcVWpIditWbwjCSjW8C4SV+NF
 cRYOVaAaQbzf9hO11amyDMmCh/6Ftp8yjh9CmCmto2RRF+WYV5k8AIrn905qIwmwAUNRzl4t0YF
 44cP5+8w/1ScvbwJr+NPTFbLdQIDgOO1OgSEkHqstkAGSeCaBjShs/domLLCdG0pZ4m4ZGfUTVs
 OfGNG3yFhD876g+cIi2RkmGmORPOFGHqICbSajCcY+XtHwrFBFvATmJh8tBZiyM+gnGiEcAaiQS
 A6OFMxLn+1CRbSogFPUkW6gB3wkM4WDTIJ3HFrhJ3S73inTH8GSXccjuuIJCRiZfT91QnaWBr4l
 Pd/lhC+NNRffDI3bqqXorvBPqpYczw=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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
