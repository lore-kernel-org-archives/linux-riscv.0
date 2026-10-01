Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615BFCA5FCF
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 07:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57LYBH4PIR/mm3yL3CYcOBqYU85rFW0owOkq1mLishY=; b=ZaMJ23pZCwg4Zk
	/jZVkpdggKmNaJ6ACBO3FycuZXa27haw4BuhY2OY/V6DaaK+JfEPfhgbpliL2Ufti1T6vGnSsRTo4
	Ttp54F+trKqe6h8FT3gO9gTYvTiw73G1F3+qtZ/dL9byrtYvODrk/g+Kwlqhn1t+aA+W31uqncl1o
	A1pSbQT5HIp119yPEne2JF0yfefiCVCRo7QK461KNFCVQfMng+xDHQSch4Q2X03sDNaIrpGHy9e56
	A8SlbDSQLNi+FunIbIer1vkcbYfefON+xozaWlqfMjV8iRUKrPayu5ijCioeYEHXJYqFvj0E2HG3Z
	yvWv8iCWMgQtYfYTviow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBT0-000000082P2-2r0j;
	Thu, 01 Oct 2026 07:44:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBSz-000000082NB-0hwO
	for linux-riscv@bombadil.infradead.org;
	Thu, 01 Oct 2026 07:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9kKrMJKy3JNdfndcJRu51L1/+E8m8ixLeH3nw5TlBl0=; b=EtXjqS/ULi8ojEj6a1CTvaFRBp
	2wpXnA3D9wlopWwvPNaEoV4DMmt2j1ZFiyLjBjtrRtBIARLyjGtl0+yUwr422mk7z2aRL+oI5I/Tg
	EVya6dhJnl9egnuvQtdhrbJE+astsCerjeFuftW+SMUEcgMeW3Fr87SQBftTKBBG8EL+8R/eHyVm9
	iH3NMUlIR/2hCDg1/+qny8h6O5IBUxPA6EVncXv6pr/mYkHt2Usk0FzzZcYsvNZ10uo30bNCUX09w
	ilbh72m2LmA5MQ7ZBiTnBRIwT1zbOVoVxr9KgO9Lw860H3XfGYTZ391NxcvmrB5mJRP99m6728wI9
	4FKTWAXQ==;
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCBSu-00000004gyR-2JPt
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 07:44:32 +0000
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-05 (Coremail) with SMTP id zQCowAD3J0JPD75qjtLZCQ--.7172S6;
	Thu, 01 Oct 2026 15:44:20 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 01 Oct 2026 15:44:13 +0800
Subject: [PATCH v2 4/4] riscv: dts: thead: enable HDMI on Milk-V Meles
MIME-Version: 1.0
Message-Id: <20261001-rv-meles-v2-4-c61052262f84@iscas.ac.cn>
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
In-Reply-To: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, 
 Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: zQCowAD3J0JPD75qjtLZCQ--.7172S6
X-Coremail-Antispam: 1UD129KBjvJXoW7CF17Zw45AF4kZFWfKF4kZwb_yoW8XF4xpa
	n3Cr4FvFykGr43GwnIyF4jgF15KFn5ZF9xtr13G34UCanrX3ykA34rJrySgF4UJay5Xw4F
	yrs5Aw1UWw1Utw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUma14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsG
	vfC2KfnxnUUI43ZEXa7VUbPC7UUUUUU==
X-Originating-IP: [223.166.93.127]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAMHDGq9sMO43wAAsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_084429_469427_2A479439 
X-CRM114-Status: UNSURE (   9.06  )
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

Enable the DC8200 display controller and DW-HDMI transmitter. Connect
the transmitter to the board Type-A HDMI connector with reciprocal graph
endpoints.

Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/thead/th1520-milkv-meles.dts | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
index bb1be377569063b0f6d6864c8d18d37103c2c7a6..1c9de6b37a3e6f7a4ec34fdfa584332c7ab3fc59 100644
--- a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
+++ b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
@@ -38,6 +38,17 @@ wifi_32k: clock-wifi-32k {
 		/* The module LPO input is supplied by PMIC_32K_OUT. */
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x2 0x0>;
@@ -83,6 +94,10 @@ &aogpio {
 			  "AOGPIO_8", "", "AOGPIO_10", "AOGPIO_11";
 };
 
+&dpu {
+	status = "okay";
+};
+
 &emmc {
 	bus-width = <8>;
 	max-frequency = <52000000>;
@@ -133,6 +148,16 @@ &gpio3 {
 	gpio-line-names = "GPIO3_0", "GPIO3_1", "GPIO3_2", "GPIO3_3";
 };
 
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out_port {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &mdio0 {
 	phy0: ethernet-phy@1 {
 		reg = <1>;

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
