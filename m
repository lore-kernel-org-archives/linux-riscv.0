Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE73D132A8
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 10:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A68/UYz2SwmTswFTnsIyFwhRjSgAZdMpaZxMys/c//8=; b=YrI7Ynuveik9LS
	2YGwldCVYF4gnDYDSqR8ilUZt9cVNxomyi5981t67kXJxg4QFWNXI0DnE3PYn94Np9KREzooEN7C3
	Jtabgohng9VSwxMMuvgMQBRVxjWhZhtxQ1k4Td0wMWNN87dt/O3pYaLsb+fci6+07lKZ4sJd897pA
	9A7O0/AIllbmgF1iEXdCQr7s5WbPFB2wn3Z8vmPxhSSF+5LTN7qGHX+D6pqfQ0/VJcfvhU2Olr8n5
	g6RP/qspj5jy19Dnb0E66gkyftw1tBCg3BmD/gxrlwZSew/nXDQdlMxf9txC0ZLg6NRwUnnOOGN58
	spWRIs3aJyxzOUF3OWxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7u6q-0000000DHgQ-2WHq;
	Mon, 04 Nov 2024 10:14:56 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7u0B-0000000DGCa-3Ev3
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 10:08:06 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241104100802euoutp0108ba822ee81756bb404873bb0b71b2b9~EvAQMrOp20094100941euoutp01F
	for <linux-riscv@lists.infradead.org>; Mon,  4 Nov 2024 10:08:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241104100802euoutp0108ba822ee81756bb404873bb0b71b2b9~EvAQMrOp20094100941euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1730714882;
	bh=vxNiS8XZmEMSZYQqnfyixq5+aqnBLp9jGcPWzOWdRC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cKHu7gBuasc5eAfb7TwtV0Zl+MIpwGHveZ8zwqQkNxenzEcc1UO1TAQsrq6QIx68f
	 YtTWO3WBI0sv6WMJ5K/N7RmAkkgshKdT4VhaJ/4+oeAw3JK3GupBNUgI2ed4I5OoOT
	 4xkOpRnBcpejidyZmwotjHNB7LDkge5mNW0kGaJw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20241104100802eucas1p1b33700ff4fdd391202998a0330c0d8cc~EvAP2EG1X0455904559eucas1p1I;
	Mon,  4 Nov 2024 10:08:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id CD.DE.20397.10D98276; Mon,  4
	Nov 2024 10:08:01 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241104100801eucas1p27cd0d7b9b5b4500604470664884c42fb~EvAPT3Z4K2364623646eucas1p2V;
	Mon,  4 Nov 2024 10:08:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241104100801eusmtrp1757aa91b22956a42dc6fbe959ac26d29~EvAPS0WIq1011310113eusmtrp1a;
	Mon,  4 Nov 2024 10:08:01 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-56-67289d012784
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id 52.B7.19654.10D98276; Mon,  4
	Nov 2024 10:08:01 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241104100800eusmtip1e1410955ce324ec0762b7beedd809821~EvAOeo3AI2849928499eusmtip1S;
	Mon,  4 Nov 2024 10:08:00 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, m.szyprowski@samsung.com, samuel.holland@sifive.com,
	emil.renner.berthing@canonical.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, christophe.jaillet@wanadoo.fr, Michal Wilczynski
	<m.wilczynski@samsung.com>
Subject: [PATCH v6 3/3] riscv: dts: thead: Add mailbox node
Date: Mon,  4 Nov 2024 11:07:34 +0100
Message-Id: <20241104100734.1276116-4-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104100734.1276116-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOKsWRmVeSWpSXmKPExsWy7djP87qMczXSDa7OtbDY+nsWu8XWg3NZ
	LdbsPcdkMf/IOVaLe5e2MFlc6lzBaPFibyOLxbUVc9ktXs66x2ZxedccNottn1vYLNYeuctu
	sf7rfCaLl5d7mC3aZvFb/N+zg91i9bkrLBYt+6ewOAh5zGroZfN48/Ili8fhji/sHjtn3WX3
	2LSqk81j85J6j5a1x5g83u+7yubRt2UVo8el5uvsHp83yXl8vrueNYAnissmJTUnsyy1SN8u
	gSvj5dcWtoIjXBUn75xlbGDcz9HFyMEhIWAiMeGYSRcjJ4eQwApGibX7dCDsL0D2heQuRi4g
	+zOjxJz2DmaQBEj96i1PWSESyxklpm3oZoJw3jBKfDy0gQ2kik3ASOLB8vlgVSIC65kknu1e
	xg6SYBZYxyjx6Yo9iC0sYC3x4e4TsLEsAqoSF6ZNZAWxeQXsJfqubmSCWCcvsf/gWbAaTgEH
	iV+9X5ggagQlTs58wgIxU16ieetsZpBlEgK7OSWWvXrNBtHsIrH53nxWCFtY4tXxLewQtozE
	6ck9LBB2vsSDrZ+gfquR2NlzHMq2lrhz7hcbKIyYBTQl1u/Shwg7Svz7eYMVEnR8EjfeCkKc
	wCcxadt0Zogwr0RHmxBEtZrE1J5euKXnVmyD+spDYt2EI8wTGBVnIXlmFpJnZiHsXcDIvIpR
	PLW0ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMwLZ7+d/zrDsYVrz7qHWJk4mA8xCjBwawkwjsv
	VT1diDclsbIqtSg/vqg0J7X4EKM0B4uSOK9qinyqkEB6YklqdmpqQWoRTJaJg1OqgWnKrxPM
	7jq6OYfULrC+7FpfuXqis6K8+cygPLNPs7byn/5x+1ny+Zt6V8WvBPcvkxbO/VRjfmPPFrfI
	N+/5OBJ/P7x4nK0keFcK3yv/h5zbfi3Z3uL1482etqeFX758Yf/6X6Rr/tELG7U6b75Vnrr3
	8qzAzx0rGE/9W/JO+dLePlF7hiPvz289ck334C+Ri3eWXrio2JBSfemRlswupwJdb+vzbtUf
	XzolR62eE7LrbECLpkC/lmTuTf7A43EGHRaOy2Pm8zQFdYuu4b736aMxa1HscoFv/6SKY2yi
	Pk5wu7vg4Nt5P0PPHI67L2G3gNmaTV5hv/msfe1fp7sKrbijcu60+6UZ+xennRBzPy45Q4ml
	OCPRUIu5qDgRABP2Lrj6AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRmVeSWpSXmKPExsVy+t/xu7qMczXSDWZMFrPY+nsWu8XWg3NZ
	LdbsPcdkMf/IOVaLe5e2MFlc6lzBaPFibyOLxbUVc9ktXs66x2ZxedccNottn1vYLNYeuctu
	sf7rfCaLl5d7mC3aZvFb/N+zg91i9bkrLBYt+6ewOAh5zGroZfN48/Ili8fhji/sHjtn3WX3
	2LSqk81j85J6j5a1x5g83u+7yubRt2UVo8el5uvsHp83yXl8vrueNYAnSs+mKL+0JFUhI7+4
	xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j5dcWtoIjXBUn75xlbGDc
	z9HFyMkhIWAisXrLU1YQW0hgKaPE2ydaEHEZiWvdL1kgbGGJP9e62CBqXjFKPDgTBmKzCRhJ
	PFg+H6xXRGA/k8Trs0VdjFwczAKbGCUurexnB0kIC1hLfLj7hBnEZhFQlbgwbSJYA6+AvUTf
	1Y1MEAvkJfYfPAtWwyngIPGr9wsTxDJ7iYMH9jBC1AtKnJz5BOwgZqD65q2zmScwCsxCkpqF
	JLWAkWkVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYAxvO/Zzyw7Gla8+6h1iZOJgPMQowcGs
	JMI7L1U9XYg3JbGyKrUoP76oNCe1+BCjKdDdE5mlRJPzgUkkryTe0MzA1NDEzNLA1NLMWEmc
	l+3K+TQhgfTEktTs1NSC1CKYPiYOTqkGpkKDcxJNLBO5f86LFAg/dTEs+cCkqHefnK//YVKf
	NGu96NQZOsv/TF9nV3743rxPS+YrtbiX/kyzOB14eUXvw0T1Xz8T3xRHcagarZY4FVakJ21m
	+M94zeEbHpUbTWc2BB2s/vRKjqlrxiXtvCWh5w9OzQviEsrbetEpvydc8bjC9bU8S74LXTXN
	ulqQtr0jeP7BE+LFERP/3ftwMDWlOdz/0Pm/yTwJe96EvP7ObPq0Yd/U8NcP+57cuVT5/rbv
	hJm3HzQobvpSIzrp7eLsNZ6RO668cdCL2egqtVd76kKN3ct4/diN2ZU29W4Xi7oup7U76SGT
	UH7Q+T63n0vjMw/lrJMMmMp39nmVZ0vjhydKLMUZiYZazEXFiQCe0wTnagMAAA==
X-CMS-MailID: 20241104100801eucas1p27cd0d7b9b5b4500604470664884c42fb
X-Msg-Generator: CA
X-RootMTR: 20241104100801eucas1p27cd0d7b9b5b4500604470664884c42fb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241104100801eucas1p27cd0d7b9b5b4500604470664884c42fb
References: <20241104100734.1276116-1-m.wilczynski@samsung.com>
	<CGME20241104100801eucas1p27cd0d7b9b5b4500604470664884c42fb@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_020804_175680_ADBAA6FC 
X-CRM114-Status: GOOD (  10.33  )
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

Add mailbox device tree node. This work is based on the vendor kernel [1].

Link: https://github.com/revyos/thead-kernel.git [1]

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 6992060e6a54..89de5634d3d3 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -520,6 +520,22 @@ timer7: timer@ffffc3303c {
 			status = "disabled";
 		};
 
+		mbox_910t: mailbox@ffffc38000 {
+			compatible = "thead,th1520-mbox";
+			reg = <0xff 0xffc38000 0x0 0x6000>,
+			      <0xff 0xffc40000 0x0 0x6000>,
+			      <0xff 0xffc4c000 0x0 0x2000>,
+			      <0xff 0xffc54000 0x0 0x2000>;
+			reg-names = "local", "remote-icu0", "remote-icu1", "remote-icu2";
+			clocks = <&clk CLK_MBOX0>, <&clk CLK_MBOX1>, <&clk CLK_MBOX2>,
+				 <&clk CLK_MBOX3>;
+			clock-names = "clk-local", "clk-remote-icu0", "clk-remote-icu1",
+				      "clk-remote-icu2";
+			interrupt-parent = <&plic>;
+			interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
 		ao_gpio0: gpio@fffff41000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff41000 0x0 0x1000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
