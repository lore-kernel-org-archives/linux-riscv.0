Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC938606A32F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c9If+Dor;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=k1Bn/xaR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M3xuN4H0HiGAT7nYwNzgYuHP/pMhLU9tpTbQpNQqv5A=; b=c9If+DorLEvkBG9OC+N7dwFw7D
	BJ60K4L3Dr0vqixjTaJcq18aohTdrKMdInRNIJwixdwPF4R7JHzO4IocmgJXoSVmD6q0KUiGwu6GY
	u/6+vYgTLS0UgNJcSxc3MV50f2OXI6Mn0q9C6FZ8ST+2oXKVJnZOnlL26HkbuYHvNAqlrkEuzh+8h
	0hwJ6oTK6UafV8HCJ4tZtiITnTYHOzMoaKazLydVRzDgvmrZ80xLFbvWxeJFjsvt5L84YHVc5o+kz
	6H8Mb6IAVZcD91e8N+t12w/bXKX0iXx2XlEfieFLoh39eIvnJQX8BxTQ1I1bS7cS/wNIiuMQGGZn+
	3pfEkb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFl8-00000005Aet-11WT;
	Tue, 17 Nov 2026 09:45:50 +0000
Received: from bg1.exmail.qq.com ([114.132.124.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFkx-00000005AX9-254w
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 09:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794908734;
	bh=TtZ7L+0FStK3cBA/dvaUkjGUZLnkhoPuIPbQ7OTOy9M=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=k1Bn/xaRTFJ2+zDx7EPE0HSWCE/dPNP+Ics5HuSozZa88qavYCkwUJZZvHLf6x2v8
	 WAH2pC65QDVZxs+sTv6CtD/tGW9PT8NZhR5wPwpTJoRLiPjiz8IJSe9zi+vHE62lZ0
	 sMjZU6sdjb8cxFx9E9gXlme0M19V3EjQCtEjTaf8=
X-QQ-mid: esmtpgz13t1794908732ta39893dd
X-QQ-Originating-IP: vEm5orcdwrO02LSErlK8QvDEW+GeaBV8cJ7W7cvFR4o=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 17:45:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7927286612555164191
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 17 Nov 2026 09:45:12 +0000
Subject: [PATCH v2 4/5] riscv: dts: spacemit: Add the K3 APB timer
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-spacemit-soc-timer-v2-4-9264d0ea7755@linux.spacemit.com>
References: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
In-Reply-To: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=Lakketge+7u3TGaLDJYVC3ImXbq0o9pWuFTAwlnXYmc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFl/lNR2zLG5n7p+95lLBeasi16qySo2MRsc3/nj9olfh
 00Dr1883VHKwiDGxSArpsjS/YBnW4FPlG2BQKEvzBxWJpAhDFycAjARodcM/4xmhV445D3BfWrY
 i9R9DJcC022SJFbbPQlZa7HvH2f3fxVGhqMzZTn6GY1+iiUfWpPixynwKfrO0+IQMaEsV2Y16fP
 CnAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Noy+ibaQGaj1sDIZS4pi9+QgWapHO5yHae4EOegMDT1NWGl8BhUd+oII
	t1MlzjgL8j6nhCFUQ0qFE+KYCooZQuZFvp4ybfbUUu2v7KK+83Rpie7ZvtiIGOf7RIEH/t7
	/o8Gc/lxcHF9uAbRm1pg4Da7R0dHYQHrex15u/ZPBQwegKp91ac5A40YzJL21qleY74Rwq4
	d/IZifkTIiZ2Y1xiQtV+5Ff7XyLFO4h8FTjyGTxBTVaprbIrgJb6/Jz55lQv0mRYaCICfOr
	wDEZBVfOIjzNmjq58+SvzGJ+R+dWtRspG4H4QVt/r5O5tem2S+e4njR76tw/hmH3ATbQ6p/
	gxGiUNXgDjh3PQeWTmHdkKpAudbrYwsrRbQ9LuLMR0pjUZcExIkuzoaJCvxydeUaVjbEH4a
	aoW8Hbw+esPb23bSWG0JiBubwwDESSG4DPbxu4hjvlQLsPCtOSwHpplMPmR2UE/lnIw/o1a
	3yQsTTd/G13VB1/GAHAOnjqrSp8OURhP2wme7Ua6/qphyp31WFb/yJa0clOTzAemEmj/5Za
	Vp9ruMvVSUze5ibRprbtYwP1HeNrBrPL7lVqcUyLrKJSZGW65tsixV7pR9GmVkQ1T9j0yoX
	hI2zjxcVJ55mjptD5CA9rwhWFMay1qx3wmm/iW7DsgeAkbrRhw8gXYAex8l63WOxeVLxdFC
	99wqecsYN+sIb6gQ+DbKxymi5fmrQxMFXRGz8E8QWPIUllboTCFlZaC+bo4dn29d29ICS+G
	U8HLoReY94Gj/rul/4+oUGlQUaFey7DSzJl50ISemECiESem6mZ7iKzqTDpKGXbE8rxH3jY
	j0mVK932XG/8JU/pY2OBk2dY63YARWaEeYBVz+GksBKPKWzPUpGxmi8+lUfGx/v01ntoV2F
	LQ/omcZ5KsMSWmcZMulnClie8IXdhOgb7EfvDbFOxEwKctVrOPM4jPK29U1AHq1Lj0/IuwL
	ugy1EeL677GJKeWdkhFlN5yDvMvK5JCXoiwuE4a543ZCIOdEtv7PRoRKOx0FAzh9Z7n7SFB
	7X5aM/CxOxcSOBZ0fIEIsYDCe/e8gEhHhZLrT96kMJ4V+z2SLgzjP8HrSCtNpsK0j47sc5R
	Vy8oTVMbwFJue+PufZbIM/jdky6MRP2XgkQLO8k4wsPG2qAjX6Kpy0=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_014539_863020_F97489C0 
X-CRM114-Status: UNSURE (   7.11  )
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

Describe the APB timer at 0xd4016000 and its counter 0 interrupt so it can
provide a shared clockevent. Select the oscillator-derived 1 MHz input
and connect the functional clock, bus clock and reset.

The register interface is compatible with K1, so use the K1 fallback
following the K3 compatible.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..cee313232c11 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -777,6 +777,18 @@ syscon_apbc: system-controller@d4015000 {
 			#reset-cells = <1>;
 		};
 
+		timer1: timer@d4016000 {
+			compatible = "spacemit,k3-timer", "spacemit,k1-timer";
+			reg = <0x0 0xd4016000 0x0 0x100>;
+			interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon_apbc CLK_APBC_TIMERS1>,
+				 <&syscon_apbc CLK_APBC_TIMERS1_BUS>;
+			clock-names = "func", "bus";
+			assigned-clocks = <&syscon_apbc CLK_APBC_TIMERS1>;
+			assigned-clock-rates = <1000000>;
+			resets = <&syscon_apbc RESET_APBC_TIMERS1>;
+		};
+
 		uart0: serial@d4017000 {
 			compatible = "spacemit,k3-uart", "intel,xscale-uart";
 			reg = <0x0 0xd4017000 0x0 0x100>;

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
