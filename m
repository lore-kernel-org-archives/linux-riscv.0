Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40236CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 10:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjzla2ZxRakDM0ODoPA/3Fa4eGxyKpSAX8d2nD5WOaA=; b=fqQDtt8J6ZbmXi
	tXnEUZRjrZFKR4FeiJbEQsAQr1BZp+cD0ynqRzHzlmTx8RpNCxdIrMLJzkZut1AOWzFfM2YHiDhg7
	t2TK+lSunanjLmQ4CLrZzIOaJzhNTb8Xx8F4v0MoH62YMIplW8yRJQLLtTDxrnLG8FSS6/Hju0CZO
	S2D/TD+ltOb6jOQixGMTnWJmxIOuf43s1tgUVwsNVNVP7oWqATihmFbuFa8RsdUBvwXR7VUbIT3ua
	WfoTuk1labS8QRWD7l7BxbeVme0BRZR07+Kzgfn3vAN0VMr2VBYNJBBDBYnILzs1nS0umb2KxcfqH
	qCmix16qYRYgl6lQJJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUzl-000000038oN-1BRr;
	Tue, 29 Sep 2026 10:23:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUzk-000000038nd-0UlR
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VyvUVRKH5BsOu7x7CCzy/4uTLPKkX05hLrcXyYg/cOg=; b=S8hsZJjd7+qIhULjnlKT4KRlZh
	rOkJn4poI7CK273M2uTV5NgIkbEulEQ5n+sINrmnAlHk3vmMqwHpo8fRT3ieqt+xEmi6Q+tvD+ZP9
	7yOwRFZZ8zfxCPB7VUvPYz5N6fDSc28KBPrBzyzyc5IrJbdEPImnuc133sVZ6yZtuX31n83c/57ce
	wU6oN61a+QVyjSOaoARkS0a4Uu1MKG5UTcH8l3k9di+LGeXxWammjf9IyhAmhPCXMDe5nalIrH4Vn
	9bLw0A/ny70I5WljrW7JByAD/bBpH1Vxk2x+DWwp3x7RrkQEgrRMu+SnT0D9k12ixQHkACpQZfD6T
	cURcDd7Q==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBUzg-00000002TP3-0pqV
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 10:23:30 +0000
Received: from [127.0.1.1] (unknown [223.166.93.127])
	by APP-01 (Coremail) with SMTP id qwCowAD3kPR2kbtqxsxdCQ--.22338S6;
	Tue, 29 Sep 2026 18:23:19 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
Date: Tue, 29 Sep 2026 18:22:48 +0800
Subject: [PATCH 4/4] riscv: dts: thead: enable HDMI on Milk-V Meles
MIME-Version: 1.0
Message-Id: <20260929-rv-meles-v1-4-effdd14a76e8@iscas.ac.cn>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
In-Reply-To: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
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
X-CM-TRANSID: qwCowAD3kPR2kbtqxsxdCQ--.22338S6
X-Coremail-Antispam: 1UD129KBjvJXoW7CF17Zw45AFW7Ar1kKF1rJFb_yoW8Xr45pa
	n3Cr4FkF9akr4fGrnIyrWjgrn8KFZ5uF9Iyr13W34UCFsrX395A34rJrySgFWDJay3Xw4S
	yr4kAw1UWw1Dtw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x0JUQFxUUUUUU=
X-Originating-IP: [223.166.93.127]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAIFDGq7jI8QYAAAsl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_112329_031268_1508D3EA 
X-CRM114-Status: UNSURE (   9.63  )
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

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/thead/th1520-milkv-meles.dts | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
index 92b44cb90f57f4830efd29145744c005afa73119..47b1ce4316468ff94b161cbf56e634040fd03306 100644
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
