Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72BEC79FA1
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 09:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=828KCJG4TaxtT/dLYBixe1lEfvyhmtKaWO6vjaLfD2M=; b=dagq0/y12swxKy
	6UOgBOJbRyLsEzHom1D5biwyE7tTs4kxiEd+Vm3Bts5bs2+zZ00xE2OhXT7FkfAsSRvvEoAVio0Hq
	edvSmzZwMGG0YiHXuPEdtFver+AAU6q1AJh6I+sFXmTGIZTWpRgK2sp4vnd0zOfVSh7An4NJHRefe
	g+wkXeEDdZzuGkwcBms8HRCIeWUKJ5wLx+e6da6eJ/Acv0nvhgqvP44dlLY5PK6qjnrZMh4dhc3Bf
	+GCNL9GzQYICq3pi/jzfINy6qE94yJhtx6DqDA0010ceLFWQTgxFnACq7BSxnkfZJSDhZuZo4iUer
	vcvWMGPseEIkIxt5xplg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sSX-00000008fQO-3wQS;
	Tue, 08 Sep 2026 09:49:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sSW-00000008fOz-3yE4
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Sep 2026 09:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xz739aXXIMUSh9Rjzk6Ups/xX8HvpqZMo6mX55mUgiw=; b=Cv503Y18nKIi/Rlm4QlYziyVpm
	T+J0+gakBmtWZSUfPxg8C+TlQqh6+/cKcGRj9dF7xbC3Hq0rwGi6Niyqgi2LGfqoQ9m0UHCRkrSaJ
	jAD5UlYEHv4WqWbNNNhJIlS2vqq/chHm04tJ2Y3S7Lo/xg8MUsOFIU8sRK6OYHIqLBxtT84Fm0C2J
	jm/CxgmsnAjFv9hrz5TToNOG8LtRrOhEL4ma2yCwdnmVJ0bQbsD5j0/z0zKnAV3ylvwufOj05lDSg
	JPxoqWJ+lUHI60G2kJspBvZ/CJliswqyzLdxWOcVby5ew4SjDPKSJ+7wxunxPl0xrKWvmqLvXHwg0
	blzcoasQ==;
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3sSO-0000000HE3D-2GWl
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 09:49:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788860938;
	bh=xz739aXXIMUSh9Rjzk6Ups/xX8HvpqZMo6mX55mUgiw=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=BZQpFhBKrpEmq+z7kLQvLtc+IIRkkQHXeuldzS4UdYDIscDq63QiLB2l/LWYwPsLp
	 0PaPNIzgay0cgApWPg31dwlTHxkCogKgSzytyGNAiZ50pOrIj/XlFwWD+qrK0CC4kp
	 HKaU3/svgR+3MrtskG/5LfppTitUNO/kaTLhC9iU=
X-QQ-mid: zesmtpgz5t1788860929tfc1f0512
X-QQ-Originating-IP: 0x2hsZIjGcymUws19v1bVA6FVvDkhR+5jRKxV4RIAaA=
Received: from LT-PANJUNZHONG.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Sep 2026 17:48:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12305366414733721363
EX-QQ-RecipientCnt: 21
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
Date: Tue, 08 Sep 2026 17:48:39 +0800
Subject: [PATCH v2 2/9] dt-bindings: usb: ci-hdrc-usb2: require clocks and
 resets for spacemit,k1-usb2
MIME-Version: 1.0
Message-Id: <20260908-b4-spacemit-k1-usb2-v2-2-f07342ffa051@linux.spacemit.com>
References: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
In-Reply-To: <20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Ze Huang <huang.ze@linux.dev>, 
 Junzhong Pan <panjunzhong@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788860920; l=1019;
 i=panjunzhong@linux.spacemit.com; s=20260306; h=from:subject:message-id;
 bh=fxBkl8UN4tRnHVfp02q8VLqsFWTrQ8bgE6+rw+AmQcc=;
 b=m9KV9hF+XPbk6pI2SQLmdRaoo+k5YOn76xXHv40m1eGF7TS79E9DYA13F62LsJEopGJ1VIzZE
 eJypALXD3B9DNBfj7eep76NJFSjWVboQnfidFtnmSNIy4TaQ4N5X1Pa
X-Developer-Key: i=panjunzhong@linux.spacemit.com; a=ed25519;
 pk=bY08BOg2T9H93/jG8fEE/tVmdXoQQMp9M2rtzPFoyJg=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NZER9JwiPlooc+kbkAUnjfuov5yGG/9rElozlcxjprHHd5t1LvUhHpiD
	bdciiFHPQQdIeozqHbvSSIzuwsvwbyX5uP/VIBbyGFoE/ANdpw3CVs6GQ7ykIZa8OnSqR+m
	y1oEguF1BE23M+eedJGvTAY3hA7M60NX/K2s4w0FJ20vbmo22a5ebb7JR2dIeZmxV6kz8QI
	jwmIL7SitiBHMyHvmT7bgFQ2yeGfoRoeAop+hOrFQHrH7vI4OWcu0XtIXwRdEmd37VbpwMR
	AiLH6QSELtAd2fmT1UE/22E0YAGEhVLOBfzrPzqLZIqzrSXyZjhWGtat5aXwQCx7kdgQIF9
	66KFUKyVT3uwZJ/D/BWlKWqpWZWxe0+uX4OvEo7Z2M0CvxDTFm7teddIOrE+tb0GbfEimsd
	s+nS4Wu4CWdQ69mkTT0JFzEv56ffriAizU0ELPLlomgXOye6Jg0mE74JUaioenURzjdnfbq
	5j2VCvtgqhFhzVgTuGDpc7hxdiWfAnxHK0QcyXHECxcX9iQnuQssiGHzU2z5k8q/u93DOf7
	MtcBJEbnIB5wm5zpC4QkgAtqOAN/+vMNzmQWTQV5CLtO3R4yhcG5/t8ny3qrV/dhImH04+e
	LX08fQQjSrpWpJYTcjb1s8G1VsX7ynQhppgBUcxLa+MHeS8yXkRoL0Xnlc3BjmIWil7MNeg
	Vk9L2ruQhGwjJNdufhfDCj1g2amrplYqTrScTsTCJ3TLz0Mp8Fn372oT4nCSpf7/oZoLXZu
	yAIvPKV9QwSfI6Hp0WCZ3QHdrk8Et0oM+4/tG0qqjblNTVh4NpDYsUmP38Z7Has0vlYsusE
	6a09gCuyU2/rszy5XOpO3LlCQ9SmL5AKj8FMwkeeAqC4Pt011wYCkt3BwtzIl41azVe+Dlx
	L4HzvW+6sEc1+4MiuzqP0X0xKFar3zdGGtJ4+duSf5li8i7keWn2B7Mrsdg8wtctoyAP5rS
	WpjS0Zyq8T0zdq/AxDA8PFgTlV1xS3GjP+Qe/wS+mK0NXMXSojrSu+FTube0j1j21//XQ5k
	8wL2o9PnoQGStmS8qiBCRA5j1JcMRy91fSeQJYTtkMfuyvHM7QwCJtpuFwkt6ok0WPDQ6Nn
	NyBOYrbC4a7kPZ4IkAatYoJlDOo3M+XakTXpwqWAOFjORGV9ofQSbIfAq9wyDY/jsiMH/2q
	SMVxCILvGTZSIHqktV1kQnT0Umo3wKlp2TIrZHByG+2+9zRHYVpldco6qA==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_104939_008920_0FB08B32 
X-CRM114-Status: UNSURE (   7.30  )
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

Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
work, add constraints for it.

Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 6f8d88a0681d..5c2b7eb1a6ff 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -114,6 +114,20 @@ allOf:
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
