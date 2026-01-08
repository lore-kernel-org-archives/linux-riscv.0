Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BE4D148AE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 06:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eb0HNMYaDCu/qH38CzyksQM6Uc8hphHsdLRq4Egx6uM=; b=XdTfHicMMULDvr
	vPQAT8VhMZn+mYCZRtyWraOaq8cjIc77Hep0YeJL9K92c5xeIeUVdZbbh+b0C95/vk0bw1RJaXXNE
	LYW/0PHOc/tzuSMRHL7Og9qD9s4SHqwo3pygphgv3Mx2R+732mC5DPw0zcflDJFJOquBi9yTHvWgP
	xY5I326GMiYwptVp6XFvP1C6yubGtIZYs0khbxX8HuttXkiLHU3d3hjfL4HlCxq59wdJBa6SPBBjq
	6+GBUkIC22Txcc/ObahrM0f/USWFC6IgS/7k8p1epSyjyOVYGDMSPxpV5Ft3vuKb5WP9UNqQnUmUm
	qhzJ8jW8jEDP/welO9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjkW-0000000G0nk-20Ws;
	Thu, 08 Jan 2026 06:44:00 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjkR-0000000G0m1-3jbv
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 06:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767854574;
	bh=XUZT6grwZGL3amf/rECaoVBVp6vaVZW4P3oWWpHwRDo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=ZebWRl+0hCKiX5VwSPKoocyALYWnBy8FrssQz0J9XRy7JVG2hEfavHEvJmEOU7uB/
	 HzQqYpIpkLpipjlJ5ZHxP1FJpGFasAC4LEhUaRCPfLUlZfP8OeyTq3hkl2h/DQt2Wh
	 evryVQBGgeM5IQ72gU8pc9TeFmxDHMQpq89GaT5g=
X-QQ-mid: zesmtpsz5t1767854566t9f4502b3
X-QQ-Originating-IP: tbHzB6R+05nY+mVqBP6c06yq7vfpu1onF+MNlbWQMig=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 14:42:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3421227298654861082
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 08 Jan 2026 14:42:38 +0800
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: spacemit: add syscon property
MIME-Version: 1.0
Message-Id: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-1-6bcb46146e53@linux.spacemit.com>
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Linus Walleij <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767854560; l=1758;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=nVReq+M0f8SIE0+5C7Db6sJIn/W+xLXbA07SBl1dRGM=;
 b=YlvEeMKQIoooq2OXBccCvXhzkiLj1a6wAVCBBRSknw8nm2ztmQqLh9GTB1wIr9YqUXXq6874q
 H7bTkkZ+SE+Cixmydyi2HDy7fVrTQXeBdLEP/boD2hw+NHwfPS02a41
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mdwao4Jomn1AKdxrheb0CL9Yx+BkGndkV/rJaO5yHBbsgZQ+RGTtfmWp
	SduiGGy3KNXNmyGgSF4iNHKWvBg8s1hE7gKnl6bh2a9PksATrsfBTBOJpeBpbQkIMOat5tF
	Lvbz52+OOkTYsjpWiB7I/fB7L4IFPrNNDD1DJ6H8+ygzf/X05DNmtqhktzsIY0NyOxDoO4Q
	9V2d6d/8qfD3IIlwp2rzhRC7wwyyjPjXEJl5ISDQxyAQqyU1EZmc8QkXB7oclSe2qsSDdVn
	WI8n3MMPtN4Mpap+4sqvLC4CRn0smDP6tT8YHZfpSgq2aTAR8kjun5M8ab1cfwlew52i/ed
	RyPIOxXQy1P09kkVnjXXDLGwnv0oPzvVLGSda6UySKAU1Mvjm+iP4ycz9z6mWzpdDcQYFS4
	HjI3Q52/i42b6k9b/v0s1aCn6Mqcpl6yCFnMWAc/QPbFvAypnnqW/eBIeYal0NqvWNSmuwj
	TiMbMuxHD5PJyuZFtLQCMa4Zpa7kd3t+/XqntH1P0C3kp6JEMilFWz1WsCgSmMIQ86MoWpT
	t7v+6UM0SCWzjvEC6fQ6g+sxdhrbMPuC5549yopvCjvW50zGTPibDIlbL4myyPZakHdJ+93
	NioGNZdAFuKtesfYlMOsB4WyZNli4iABZc3TD7NBEtOMmg+s+j/2gEjmLU6DEn2nZp9MTZ2
	JdQ6Vitdy+qToJfnFLrPV1F/aZ/ZbepMLfyI/UPNYqKyh7w7PEI8Az7btecu+U1mzzsWUci
	eJBs3RMpj+kuJctDrKPgZhp1Wvj05MvKC5Erp/lQeLr9LgDhXlo6WoR+IL4Cv4P8YOsvKMg
	d24sXpRDazKi9XTLoLcwYwuti8t/vm+yEhcKoQ3Z4+RAFqx3ixiaQF4S7hZS1HeHyWqeONv
	JeBONsAjq+XOIUngeMpwsud38Wh9rAgoGoqxnvHQax0r8fICK41xc+9CJS99z9cI0+t5HL3
	tnupomORAJiwcde5PmlZaXm1P6VO0DJ+c52ZXnDd6FmSymo5Sin9cu7Msq35IDAD209JEuC
	gxpiQinjtIXUnDMGS0GwBB9KHwdIxyupdEm+R68wjQMBZoTCM1leE0bvC4St2Y6ZUPmpvIt
	54kSQwo59zSC+2GQqfLSjXKvrkEv+wPYxZxB+xn+x4HnpBMCMa07T9pecAaNjNlVqIoPwX9
	EeuKtHJkr3WZ1n54N4nxeHJGCg==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_224356_743443_31F293F2 
X-CRM114-Status: UNSURE (   7.79  )
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

In order to access the protected IO power domain registers, a valid
unlock sequence must be performed by writing the required keys to the
AIB Secure Access Register (ASAR).

The ASAR register resides within the APBC register address space.
A corresponding syscon property is added to allow the pinctrl driver
to access this register.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changelog in v2:
- add `spacemmit` prefix in the subject
- remove offset in syscon property
- remove `spacemit,apbc` property in required
- Link to v1: https://lore.kernel.org/spacemit/20260108042753-GYA2796@gentoo.org/T/#m2ab46cd63cbb1b110eb317ee5b9d540d39cbd82b
---
 Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
index 9a76cffcbaee8eb465ebaad3f92c929c2a6815db..141dcedb81fba31bcad39b2fa267224b84ba0535 100644
--- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
@@ -32,6 +32,10 @@ properties:
   resets:
     maxItems: 1
 
+  spacemit,apbc:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to syscon that access the protected register
+
 patternProperties:
   '-cfg$':
     type: object
@@ -138,6 +142,7 @@ examples:
             clocks = <&syscon_apbc 42>,
                      <&syscon_apbc 94>;
             clock-names = "func", "bus";
+            spacemit,apbc = <&syscon_apbc>;
 
             uart0_2_cfg: uart0-2-cfg {
                 uart0-2-pins {

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
