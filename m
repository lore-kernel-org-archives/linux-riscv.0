Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F034D2ED0F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QvhIOmQFv2dPXhyjWDuy896dAS2lJ+Zc7yvGjARMWaM=; b=N3LT9d4yU9Neot
	t9+JqX5RV/j1JvuXH9G88m3kalq0oLf4gwJJSMxgsFwkXOcIlyWcqceM6BwVdKK5NxNA0UbBUw/Z7
	/ajZivIraBuBzNS2Na8SSn8VNq5IRxhRKqLyo8ZYxF0+XlSMHuxlwcMSPQ2tmDDD4D0uRtmohVzIk
	x/muH6ouKNqy9ExasnJWJTw5nW+jop2LGkcychuCir8x9fLB72/s3leHw7z37sCA809OqbqTkf4Sq
	gfd6pHs7DaFBVs9cVmPr1oyHFOOcYDhZBhDSaO1LT40khnIFuUhwho2CdibKJ5s5Khcw4F7UyX9XC
	muon592/ligk9eOeKyWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39o-000000039U1-49qs;
	Tue, 20 Jan 2026 04:15:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39M-000000039Mu-3C23
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3382760008;
	Tue, 20 Jan 2026 04:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3A1C2BC87;
	Tue, 20 Jan 2026 04:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768882527;
	bh=udCB56ewUuBczR6ctM7up8XACViyJiWY/ibyZC1jejs=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=q9O4T3Iwp5YU9aTtmeJpgqm4DzAdGefVfEQ9vaci4fasVdHhxCtxtl06PwRBg9ERG
	 h4nBCUYcBujNBC5VaUWllNPthZII8W19hZEeJqcnU3cXhADKEIYf43qj2Zw5g6iZQT
	 4IxMq95bY1ARP4MJGC/HikCdl+ip+UlakSpBKhDw0yU/aSRBfRzW0ME6L770zJ+EmK
	 KL8Se3YCpBA+/ETMQAyiACgFGsljmdcS9hlV3ygaw3oBdg8ecLy6/zjUjYxezXL+Tq
	 GiVchXxe9h9bw8OO0rmUuYaZma252RfrfXycAmNh4t+/ryn8mJXFugVqp8kRktGuAH
	 o+5SG6ii9Ve1Q==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 19 Jan 2026 20:14:55 -0800
Subject: [PATCH NFU RFC 18/19] riscv: dts: qemu: add CBQRI controller nodes
MIME-Version: 1.0
Message-Id: <20260119-ssqosid-cbqri-v1-18-aa2a75153832@kernel.org>
References: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
In-Reply-To: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2591; i=fustini@kernel.org;
 h=from:subject:message-id; bh=udCB56ewUuBczR6ctM7up8XACViyJiWY/ibyZC1jejs=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTmMwZb8NY27P2ru04ycsMpxgV11wKXXXzt/+/TjxdWZ
 TE1O+tXd5SyMIhxMciKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAmknWb4X9CjeiBp9XGT/dk
 pz9Kmhp1gzl0e4QFn1Tk+51p269ymuoy/Ga5duGYup/rg52s59Ycknr2elF+qdEf8z9LK+1r/gj
 Lp/MBAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
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

[NOT FOR UPSTREAM]

Add nodes to for CBQRI-capable cache and bandwidth controllers.

Link: https://github.com/tt-fustini/qemu/tree/b4/riscv-ssqosid-cbqri
Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts b/arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts
index 4c6257bec42d..9f65de65f758 100644
--- a/arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts
+++ b/arch/riscv/boot/dts/qemu/qemu-virt-cbqri.dts
@@ -395,5 +395,64 @@ pci@30000000 {
 			#interrupt-cells = <0x01>;
 			#address-cells = <0x03>;
 		};
+
+		cluster0_l2: controller@4820000 {
+			compatible = "riscv,cbqri-cache";
+			reg = <0x0 0x4820000 0x0 0x1000>; /* 4KB at 0x04820000 */
+			cache-unified;
+			cache-line-size = <64>;
+			cache-level = <2>;
+			cache-sets = <1000>;
+			cache-size = <768000>; /* 750 KiB */
+			next-level-cache = <&shared_llc>;
+			riscv,cbqri-rcid = <64>;
+			riscv,cbqri-mcid = <256>;
+		};
+
+		cluster1_l2: controller@4821000 {
+			compatible = "riscv,cbqri-cache";
+			reg = <0x0 0x4821000 0x0 0x1000>; /* 4KB at 0x04821000 */
+			cache-unified;
+			cache-line-size = <64>;
+			cache-level = <2>;
+			cache-sets = <1000>;
+			cache-size = <768000>; /* 750 KiB */
+			next-level-cache = <&shared_llc>;
+			riscv,cbqri-rcid = <64>;
+			riscv,cbqri-mcid = <256>;
+		};
+
+		shared_llc: controller@482b000 {
+			compatible = "riscv,cbqri-cache";
+			reg = <0x0 0x482b000 0x0 0x1000>; /* 4KB at 0x0482B000 */
+			cache-unified;
+			cache-line-size = <64>;
+			cache-level = <3>;
+			cache-sets = <4096>;
+			cache-size = <3145728>; /* 3 MiB */
+			riscv,cbqri-rcid = <64>;
+			riscv,cbqri-mcid = <256>;
+		};
+
+		mem0: controller@4828000 {
+			compatible = "riscv,cbqri-bandwidth";
+			reg = <0x0 0x4828000 0x0 0x1000>; /* 4KB at 0x04828000 */
+			riscv,cbqri-rcid = <64>;
+			riscv,cbqri-mcid = <256>;
+		};
+
+		mem1: controller@4829000 {
+			compatible = "riscv,cbqri-bandwidth";
+			reg = <0x0 0x4829000 0x0 0x1000>; /* 4KB at 0x04829000 */
+			riscv,cbqri-rcid = <64>;
+			riscv,cbqri-mcid = <256>;
+		};
+
+		mem2: controller@482a000 {
+			compatible = "riscv,cbqri-bandwidth";
+			reg = <0x0 0x482a000 0x0 0x1000>; /* 4KB at 0x0482A000 */
+			riscv,cbqri-rcid = <64>;
+			riscv,cbqri-mcid = <256>;
+		};
 	};
 };

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
