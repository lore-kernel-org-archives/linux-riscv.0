Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0C9E8FDD6
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 09:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UGKRD5gRq+iWI5cdkD8TDy65t7CO0Jh/hrmc99CNmk0=; b=cpvAeQlH8SswyY
	QtcqB/2ox4LFu0wYJcpZcQLkpg2mHXILjsANiLghp1cXT3LTCIPWBjhNEcy086wtpFZc/CuCTXqWv
	Nt44i1BIcgeFjkooxV68rnZm70Bz1eOf/E1m3RXwDnhJb/aRDhuzTot79n8UScOS/rHdFDlgczHuF
	/G+Iqauohce8qmNO5upwr72K2RL0c/4AuwOvcp+s/Y+9UDuU2XatAdR4nazQIOIsGlsyQ8fvYEWP8
	IPgHjev7GZLxA13Xcf+jLRDcAO/I9/637vVOiHwSZTCIyDMF0bZ/ofRlv5BmxHfbO9WhzY7Knz4IW
	IO8Mfz0UiS6zMVNWrLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZQX3-00000001pAA-0HML;
	Sat, 27 Dec 2025 09:24:17 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZQWu-00000001p9h-0VUH
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 09:24:15 +0000
Received: from duge-virtual-machine.localdomain (unknown [183.192.221.253])
	by APP-03 (Coremail) with SMTP id rQCowADH4diwpU9pjCYxAg--.8901S2;
	Sat, 27 Dec 2025 17:24:02 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: conor@kernel.org
Cc: cyy@cyyself.name,
	kingxukai@zohomail.com,
	jiayu.riscv@isrc.iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] riscv: dts: Correct the formatting issues about k230 dts
Date: Sat, 27 Dec 2025 17:23:54 +0800
Message-ID: <20251227092355.42825-1-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: rQCowADH4diwpU9pjCYxAg--.8901S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF4DZr4fZF47Zr13GFWfXwb_yoW5JrWfpw
	429Fs5Ga93WF1Sk3W2vFWvgry5ZFn8W3W8Ww1YyryUGr45Xry8Kr13Jan5tryUXF43Z3yI
	9r1Fy34xur12vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r1j6r
	4UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYCJmUUUUU
X-Originating-IP: [183.192.221.253]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_012408_756100_9B6F9A5C 
X-CRM114-Status: UNSURE (   9.97  )
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

Correct the errors in the spacing format, and move the aliases from
the SoC's dtsi to the board's dts, since it's more standard.

Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
---

This patch is based on this initial support for Canaan Kendryte K230
series v6[1], and it is used to fix the [PATCH v6 10/11] of that series.
Although the latest version is v8, this problem still persists.
And this patch hasn't been merged into Conor's branch yet.

[1]: https://lore.kernel.org/all/tencent_DF5D7CD182AFDA188E0FB80E314A21038D08@qq.com/

Thanks for your time and review.

 arch/riscv/boot/dts/canaan/k230-canmv.dts | 4 ++++
 arch/riscv/boot/dts/canaan/k230-evb.dts   | 4 ++++
 arch/riscv/boot/dts/canaan/k230.dtsi      | 6 +-----
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k230-canmv.dts b/arch/riscv/boot/dts/canaan/k230-canmv.dts
index 9565915cea..593ca38e68 100644
--- a/arch/riscv/boot/dts/canaan/k230-canmv.dts
+++ b/arch/riscv/boot/dts/canaan/k230-canmv.dts
@@ -9,6 +9,10 @@ / {
 	model = "Canaan CanMV-K230";
 	compatible = "canaan,canmv-k230", "canaan,kendryte-k230";
 
+	aliases {
+		serial0 = &uart0;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
diff --git a/arch/riscv/boot/dts/canaan/k230-evb.dts b/arch/riscv/boot/dts/canaan/k230-evb.dts
index f898b8e623..bfa53f2e24 100644
--- a/arch/riscv/boot/dts/canaan/k230-evb.dts
+++ b/arch/riscv/boot/dts/canaan/k230-evb.dts
@@ -9,6 +9,10 @@ / {
 	model = "Kendryte K230 EVB";
 	compatible = "canaan,k230-usip-lp3-evb", "canaan,kendryte-k230";
 
+	aliases {
+		serial0 = &uart0;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index 7da4949894..6bc599f079 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -11,10 +11,6 @@ / {
 	#size-cells = <2>;
 	compatible = "canaan,kendryte-k230";
 
-	aliases {
-		serial0 = &uart0;
-	};
-
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -72,7 +68,7 @@ soc {
 		ranges;
 
 		plic: interrupt-controller@f00000000 {
-			compatible = "canaan,k230-plic" ,"thead,c900-plic";
+			compatible = "canaan,k230-plic", "thead,c900-plic";
 			reg = <0xf 0x00000000 0x0 0x04000000>;
 			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
 			interrupt-controller;
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
