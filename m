Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B5AFD8746
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ajoprWte/VEIxmAgQ5ZCJ2rIFhcZnP03buMvsHuMAk=; b=SG1O73n71TQuou
	+jfAlbzQpSCmWb33qQRy9IVHNNfAbFT01INj8HoILog5S+D309Ycz+r15/z+kWQHNQh9Qsf129O5O
	MYXC3wZykQBVlzGmmVy84pyafNJ3X9TLOfiwfA26EphoCL5YQAK97gvDtg4N/hxP1FAEvQoiG8umm
	gzf4+eulVtqMML1WETnUhzXaHOavB2cm3ueU6fKuP1SAJYVIViLLp3HuhQ84M+xWVhLbMuLBgVdcb
	AYIo4rpNfWZDu1xR0FT7Q3qbXa4q2Jgq/VE4L8oNW3A7SSWZooztDiMzA6evRCLPlF+o8qBRp/vC2
	NcKiTSoZ3tQboc+C41Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SzZ-00000006EeR-2fVf;
	Tue, 17 Mar 2026 11:53:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SzY-00000006Ee8-3axy
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 11:53:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D71C960008;
	Tue, 17 Mar 2026 11:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076E9C4CEF7;
	Tue, 17 Mar 2026 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773748423;
	bh=FPNp7QabpdT+Z9HS3pynwWIO4HZC6hypayQTp1VHFNs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tWTM/WIwMphth/kUo3rOjdwHzAtuHP98iwVfUg4jnDSfHsggI3NrKYT3mEuk5Y6KE
	 zqhN5Wo9ueMWY7+SVhyQuB5zAOLLFwrG+xBqKzUXDy1YDJVrxj0EQV7Tb6Tj4Gzte3
	 c77k2GkJxcZrqARZxPul8FSt2S3WKjfqelspYxEA4yUXX+E5sgBNLhPrsEyOpaKkbe
	 O5ac+YLslotT+VZT9OH6ZflrthYxIBeDAJLoa8a4dFHSejBcCY8JfypmFZMklyz2nU
	 F9gF8cw9W90r8Cb6OGoiGyCgXZjqPTwF+1e3io/2glN3zMSKOyosA8HOZNUziFbtLI
	 OU7zk760xwnrg==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 17 Mar 2026 11:53:02 +0000
Subject: [PATCH 1/3] dt-bindings: usb: dwc3: spacemit: add support for K3
 SoC
MIME-Version: 1.0
Message-Id: <20260317-02-k3-usb20-support-v1-1-d89f59062ad4@kernel.org>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
In-Reply-To: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Junzhong Pan <junzhong.pan@spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246; i=dlan@kernel.org;
 h=from:subject:message-id; bh=FPNp7QabpdT+Z9HS3pynwWIO4HZC6hypayQTp1VHFNs=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpuUCzXMIuDFwRDPZrJgHXWP2XbVMZY8mDaC3xu
 FFXumtyQe6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCablAsxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2SNRAAhYgJ8Z+GvTYYu481TA4R6s2CmWfIE+ola2aIginwaoFtWwpQsVyWa
 WtmlL3rspUxX5xX31OmOc6fpG5QK/cXPcJvcQckXzX9xj9GfaZ3mtRZ4v1NlofHwZDr6tG3dQ/O
 mqHNRCXp5vUgNCyvWE8Q2mxuV+wFRztAOAcodkhlVOnHOpTQGY3rcrqpqOcZVM4d6po+RBEU1mj
 E5MHl7Y0cMRlZMNSMBA23KgEHTR7wk/y+5gFOycYv+0Y6sP0zNytFTNpVpegJp6K3h6IV46yPsd
 kqTtvekXuucOie8qUjIiODHra/++afjPY3YqmhLhdI0fXDIDLD+nI6B3kEpoxMQlBkGqmygHyje
 u9VBHh+aVT5WkdEFNZFl456y9sxaGuxES+LtbPXoL5mO51sABYTzHBw3jBIiJe95oTAaMmnMaOu
 2uVwcoDXwcfBjZt9CrQixNmhGOFfkhasROEQ1cx5lGXB41imYPORjDtT37/xYA720DQiZpGrz7v
 8FGhWQi0SqpgZeoS/2BDLi5sR83e9J3NCtPfuXjbrzAIZkl7HPHDwPfU6jg9BEFaE7CSZXdHYq2
 7W+urSQhL82oYE1cLb+HfjO4M8X7DyQXCK0AA+P4jJJCi0Y1QeKtWs8yfk0wNy4+zY8lo9l0mv/
 0b760YQEtq11p598Sb0W7cv7TPLWls=
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

Add compatible string for DWC3 USB controller found in SpacemiT K3 SoC.
The USB2.0 host controller in K3 SoC actually use DWC3 IP but only has
USB2.0 functionality, and requires only one USB2.0 PHY connected.

Explicitly reduce number of phy property to minimal one.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
index 0f0b5e061ca1..cc27b363ca79 100644
--- a/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/spacemit,k1-dwc3.yaml
@@ -27,7 +27,9 @@ allOf:
 
 properties:
   compatible:
-    const: spacemit,k1-dwc3
+    enum:
+      - spacemit,k1-dwc3
+      - spacemit,k3-dwc3
 
   reg:
     maxItems: 1
@@ -42,11 +44,13 @@ properties:
     maxItems: 1
 
   phys:
+    minItems: 1
     items:
       - description: phandle to USB2/HS PHY
       - description: phandle to USB3/SS PHY
 
   phy-names:
+    minItems: 1
     items:
       - const: usb2-phy
       - const: usb3-phy

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
