Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC06ECA6012
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 07:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XirrU+Rwt0U4znaK5wk6KLZy3wxpX2hlpLVStFmyXU=; b=BH3d5gZkE7X2NS
	mj8CJP1AAcAr81S+GM+qo0aHWIeEfuSOv/Eos0jUPaHHmhQ2CA45hgHDLHOQOMQIjBUxhPTO2eSrL
	tJtaGnbra7fdNZ9XHjlWJijGnAeFd2j0vTdygq+9xz7x5YxKqTrseXvf6lHvvvcXkdRU9ZmU2ULkJ
	GdgmOVCiv+kton8HC060VF4BUnte38iaMDQCdy7QPPsnwDoKPMSyqcaruzVoff/7LBPKE8RkpSRV4
	KUzwK5j7xwWzNr7+6sUDpCGarUY3lD48XuzaEhUVuc7ieCjSU4aCaYVUk8c1gG3qcgjrJiY0i3uKe
	f4qCmmFqObnfIl90uqVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF54K-00000005jCP-2dJ1;
	Fri, 09 Oct 2026 07:31:04 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF54G-00000005j8y-0DmX
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 07:31:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1791531038;
	bh=WyrNoNNu/NB86HpPrgRxwPVRhvTuGwuFy/4c8+oY+lk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=XNUQsiFybJfb8GOUgjS0GOc+WwgD5NzSD2lA8ObZAH8f3zQMgPlx8AA8rY1wl+GSw
	 ocpmgbzvnR+Y11tKJE0gPwbEEJDnJIOEzkQirz56d3z3+1m8HCaOYRyjcVn1jjBMXu
	 iEGYfOC6BhQCd0kS2Nj6cNxec0CFHKaIjVvq9fwA=
X-QQ-mid: esmtpgz13t1791531030te91ea3d4
X-QQ-Originating-IP: GG4F2ullY74Zcb31mcORZE2+mBiBAStiIiUm9OvXucQ=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 15:30:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18415433431050836106
EX-QQ-RecipientCnt: 20
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Fri, 09 Oct 2026 15:30:24 +0800
Subject: [PATCH v4 1/8] dt-bindings: usb: ci-hdrc-usb2: add
 spacemit,k1-usb2 compatible
MIME-Version: 1.0
Message-Id: <20261009-b4-spacemit-k1-usb2-v4-1-2d98e5324d9a@linux.spacemit.com>
References: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
In-Reply-To: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791531025; l=1574;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=vJgNan3VXHrPIUL1xi2lNNcRCVH0/pu/PtlpRHIGzOA=;
 b=+OeOzx25lSmWLBlsntQ3Q20ZIemLbGeUyRoRTeLDri726JgjOjbjWGJ3bZMviwvhrFS2AiFOO
 1lQjxbCoGCqDGVZQQGnLZQ44Ppx17V3MZDMG0U4QI9PwRvH0xHMtiBd
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: Njm7hxZIEajZJSZcEk86J/60G5hi0Yq+EbXRDxVp1Ar7+Jexr3VR6JaD
	Pdfyr1ocHCaUD6+FmvF6eaFYlAFFLLiq2SZSBhe9fX15YdtqrdwY+AvEfaTkB3cl9gQgihA
	9aaas1v2yy3we6od3zJteVVzF84E+BrUlzTMAt0DeAZWof+s3y0ycKPfQ3blC6jbOtx/c4t
	GyXMULxwwWknGxzm8U6ya4ehb7/n7YPYi9HrrsoTH8q+CMRZehczuKHPBk/SB5aHQhc4S2U
	BXqYDrXpOrDwmgUVeiuQ7VPz1foADgVN7IU8A1Xo+4/u5SNZzB1ABZT6ZEryda/oQmgnHu/
	2Mcjk0UNskvy0jW7dWSgLQCJ/4SIuhlmjmIpLIRbsBx4vN1BdPXKhTJ4YYyqz+IZtLqfMMz
	MWsazHhDPxm6XsAwSROZaUqzIxlfP1LwFWGsL7uPNFMoa60JtQw8EI9t2vHtOLQbZpY888P
	+nn6e8ftBCrrWjp2T4FZkRS9gdNucbF0ZpPSrI95xFJGmoMOkfH+YGdqnR5CAVp17uDLyTG
	xtNtSb6LTK14QMaeRA42HqsfGl+fduaZx9kXc/LswvqOhRsOYLSt0wknS9ygQw0uQutFjZe
	Boj09CGaU2aBsmapocNP8/fXJQBaco65/NfpHxUwBmcznSLZZQHw/dCb+HH0HGvtSgHUXKY
	yhvtwtbr8T8iQZEg7rNxovQisDmfQXSTEXpw1s8gGhzqj8II/Qr4dd6O75w8o2TgYSSYSgR
	ybIkruR+slr/gg8nl2a4Ndesr+rsRTF3463TFcNOOEhdoA7wajgJS+ySUqa+1p6JeoXTxEH
	3tNWTh1xXMy4AxuQhUtLas4PY/0GYq5q96GUUKL71qrelfuhgiT6pIqoFnLAf7YKJRWvlig
	rr86aYDqPiEjEl98k+S62imV/cLEmxVDS7b3Y1F2XOCTenReuR7dSGY/ioN0+af5B8DffDy
	yiufB2HxdesamE8fkAFZFSY13t5rzctudGDXC1+O9rUiPKys37sMRH/icZ60sNbU7CbDVo3
	9fcmNTzevIvPDr4KKGpV/fK5olcrw87N4wIdxdtATrRj6qsKxYIFEatQnKEWlibx0zlkNhB
	JjciRsoK7P6hLAY1/F8JtCodGqF6B7OMo+XWFo+9l87FRVJYDEWuGo7z69y58N6/SeMRSbo
	WTAXP+oTuhUGICI5iQdqQuofzqOdvh8Bc5dB
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_003100_390861_2E21B61B 
X-CRM114-Status: UNSURE (   7.96  )
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

The USB2.0 controller on the SpacemiT K1 SoC is dual-role capable but
has no internal OTG registers, this requires flags which disable
related features set in platform data. Add a compatible string to match
the platform data.

Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
work, add constraints for it.

Reviewed-by: Yixun Lan <dlan@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 620b564914d4..5c2b7eb1a6ff 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -25,6 +25,7 @@ properties:
           - nvidia,tegra124-udc
           - nxp,s32g2-usb
           - qcom,ci-hdrc
+          - spacemit,k1-usb2
       - items:
           - enum:
               - nvidia,tegra114-ehci
@@ -113,6 +114,20 @@ allOf:
           maxItems: 2
         clock-names:
           maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-usb2
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        resets:
+          minItems: 1
+      required:
+        - clocks
+        - resets
 
 unevaluatedProperties: false
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
