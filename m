Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0CBCDB474
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Oct 2023 15:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mthpoITAa94bE/j9DQc7a/gP3ZfaVz7l/BuIFB6T2VQ=; b=os6BPrrN/q3Ch9
	cG1nqaoPcYlGcA7WldHsLy4B6wzFTcloB52N0h2GOxIx90/jQavJt4Zt/4PJTa97h6YvY8SYcTKfQ
	NvXP95qRdrxiBAugCdILPiHBCJRyiD929a82uyZRtW7HYoW1bpMroBtpk28fNtEqqzGnocsMr1oJB
	nHmyHAhPho0FkBMFFHa19wi9seBtPzSwMqE7KhKp38BV/wcJAMFy88QwPs00t66Md35KYPB+AnrCt
	acz+KjxE07efZk7pASNYQ9QrpLGuOS6p6pGYnGrQeGtoKfy+XqpsiHclV1bWhVq9sDSPgp1DopCfd
	LnCRnAlLFPKIUkuvzk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quam3-005dhL-1o;
	Sun, 22 Oct 2023 15:53:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quam0-005dgP-11
	for linux-riscv@lists.infradead.org;
	Sun, 22 Oct 2023 15:53:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 11D7EB811C3;
	Sun, 22 Oct 2023 15:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EE4C433C8;
	Sun, 22 Oct 2023 15:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697990029;
	bh=OHIHSJz2egyZVm9tXlqMmwRR01/RrOpSIeoHXrWG/FU=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=Si8mMiwl5GJYA7QK4XihFid4XOTJvwoyq9d1X+V7RlG6orxPX6sFGnKTa0EtHqc9o
	 suFL8RbIFO+tiNNpM80EqEmvK31pvfmxEnQdeUbbODYVxfSTyNzexf4MJv4jdTxMp0
	 bbAA2mrmKNLgSkqhSYEAmAb2UvXZIc2MRhMMcjLVl+A1fyMVfGv/eOpvVKP289f1oF
	 Kxz6COpeoC0iUrBckdjdItE22Q9JHP87YkFUhRNpUgkb20pz9Q71oxPLLEVzZniZsT
	 BuA5qoADqV1ENx+OySnIg0LrsGL2jETAIvvcoz5Fa/99eKLqsAnvT4UtRI2GWxqR2Z
	 D/WJF2viqSurQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: soc@kernel.org
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH] riscv: dts: thead: convert isa detection to new properties
Date: Sun, 22 Oct 2023 23:41:35 +0800
Message-Id: <20231022154135.3746-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231022_085352_510418_E226700D 
X-CRM114-Status: UNSURE (   7.14  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Convert the th1520 devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

Hi Arnd,

This is the only one thead patch for v6.7, could you please apply it
directly?

Thanks in advance

 arch/riscv/boot/dts/thead/th1520.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ce708183b6f6..723f65487246 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -20,6 +20,9 @@ c910_0: cpu@0 {
 			compatible = "thead,c910", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			reg = <0>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -41,6 +44,9 @@ c910_1: cpu@1 {
 			compatible = "thead,c910", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			reg = <1>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -62,6 +68,9 @@ c910_2: cpu@2 {
 			compatible = "thead,c910", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			reg = <2>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -83,6 +92,9 @@ c910_3: cpu@3 {
 			compatible = "thead,c910", "riscv";
 			device_type = "cpu";
 			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			reg = <3>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
