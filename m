Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05024606A329
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rxhw8DX5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=WTjj4JUl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3XirrU+Rwt0U4znaK5wk6KLZy3wxpX2hlpLVStFmyXU=; b=rxhw8DX5DnPZBq5M04ikOm7ekA
	p0/CYC5vox3Zz5DE3FG1gXrz1nJhU8ePOgiDe4HzCiZVdkrQ4/a4OUUdLOeaGgIS7wfxmM9cGelAV
	h00Z6AMHwDbW/L2fNdWt54Qpq3lRArCJH1BnACLktmMsBixeF5AndzyPePU5N6kEgNzas2VUxXri9
	bAgXdYu02aJbC8c0lY/HoPkAmCFPRdzk0Ha8wprB0qZvr/l/77ol7n0/iQtR7UtHPTApz0ISGJ3WP
	stgzj5Yn/XxjJ0wkpYfPV6xV79v05VBcKiX5LcFjfIzwxZVRzouRg9DN8RE8KvqVIo5xVIGMthdoO
	ZxtNaRMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIT1-00000005eUH-2fsu;
	Tue, 17 Nov 2026 12:39:19 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTISx-00000005eRy-2k1d
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 12:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794919139;
	bh=WyrNoNNu/NB86HpPrgRxwPVRhvTuGwuFy/4c8+oY+lk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=WTjj4JUlGsyYAkgMhQHzo5eKzYXzlMDEF+tTE+GlM1a69cOp1QBUhRV+HCCdMUdg2
	 ZpiwSbcWqaAWFFj0+UAchs9zVOpZpmIGP4PZaDMLnBYJdzdoM3TEGFbvhlfoFQ9+8M
	 TyA3SDv8aLPEIWE3Gs/5Oi9ISgQSBlzEUej47cz8=
X-QQ-mid: zesmtpsz6t1794919133t2371a5ea
X-QQ-Originating-IP: 6ydtl4G31wbLa9v/Bzv5QTDg8QDH0bcupB+OgsrMpM8=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 20:38:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7029049940140104590
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 17 Nov 2026 20:38:43 +0800
Subject: [PATCH v5 1/9] dt-bindings: usb: ci-hdrc-usb2: add
 spacemit,k1-usb2 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-b4-spacemit-k1-usb2-v5-1-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794919127; l=1574;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=vJgNan3VXHrPIUL1xi2lNNcRCVH0/pu/PtlpRHIGzOA=;
 b=TKYkmXsQGomavDrUhG7EYK8cKbVQ9OZVj+07fN9tkJ3MNab0ch0gRCxyPH/e83ABECXAhvWzs
 JB2NnN5VornD4C8pphTwkA/Rv+Ro/+nNuRJ9HztVrPYKuwhyLMA6w0d
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: MKP3LwvGEIjIy0pNxPZZGHYSqGTfoHcyg09LKEj1X+f57wtDNlyzM1Wk
	sUa9xK3R2leZo9jkSOrVS3UJNca/mbigl4EZOqfsMgKwBGqgV8B5PDAh9VFV2GRhV3XDSJI
	iovB4iYRWIvrfYzmTKULXn5joGQZG8Ee2DVGRyEuCdCojdb+UT5PtK+QWbONmTbe6zHai+P
	6BTDYu71LdXgkU31tUa5Iw4+sHfl+yRHNuo7F+bthE6Bw+CXZnTJC0z+O56ChvYTLzt3lga
	Ark+stGkxWaHIHBDecgOnoyz/pMK24RiXpctYOQcpLG7AVSffjjLs5jKHHziVE3VKWFnVbF
	Z3MNYWSt4enRCDNWedelmm4egKwBY0KIHeA6sW05PpBWEOy2eESgGmz98fqHGgBxnoMp+G7
	M7WCJc6Lq4rzchYgkWrMe9ri2Iv6M0wunwraWIcFPqSqz1sdhrCyg/9uyPi+lZCxAZmOVCX
	X9eu35rtqP58TB3VnGP/0fKI7s35NIkuzzyILQkPs1s7g0uNajWyS7rh7Wk5AwTYVAa1Qno
	TSYrn34R9n67XO/35Q+94tHtj/c15qHf8WgXNZtuthNtbJDb89n3whAcImBKFCOxoZuQ2+9
	eduVJdDBYAP0LQevfGUFClGPlrISOdzym8Jd6CuueFxJxEKrZ8IS5EGH3yIVcTihT2OBEU6
	99VlJy0JAVQhD33KP2tt/adIdqiGQY8z2+rxOhQlyAKsiiW1U12Y0z1w0C6h5Crvw5Ic36p
	dz2Jo+9IKIyu6UQT6+peirRNfei66qOr3dplx7lwe8K8zxjzOG1S3s8AWiCmToB2SjdTqHT
	o0Gcorx6eMvYDs2i4QwPSgXcp25LZrmOhTAPsXcP2ZrK4LCnP0iQ6LcRPaMEpVDlu0oKOF2
	aqA77Aq3e4GCnctgMwKkJ4S6eVRUFmMia0UBSzc8cjpRnQPjJiEUSV94cMRJOvlTRvmdMpr
	DmTFgYWFAjprmYEE2dmq2wj4q7ZQk9oki4EIN4lyGJJYAnQ19dtZCdXHLqhg4lA0UzaNVZE
	YxT49L/hOZUijCeZYONAYfTAmKXQGrDOylGxDZOOtTo9QGGPEmfSXyigOV+k3P1A90A0yuG
	UghCvNsjl2HgP5tgZtmQRZxbw8l44p2tbQmz9iX2p80qxJa6kDaVuwILM2BrBnbhWweTM6P
	oh4ye9iUWOXgkhE=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_043916_246096_D1F95C65 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
