Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA0AC44537
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 02:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jStl6LJadJfkzxCd2V/wHxN5H5Zl0z8wpXl6roEMIik=; b=VNdoZVSmNy4FtE
	VeHXxybea1jUmf3NTyUKGY1grFez/IpTBsJtIk7JVbZ4BU8Kk3v+xgSq/FU18RNnUQPx9cTHZT8U5
	puu03LJVZohvgQrxfPT+FOCXpZrmuzTALObDHEzcHFSo7qVNFLeCAQYe3wazfTRLaeSTo9zucD4QG
	j895tJXf/In8/7HDwfQQf0bRurq2mzB4na+GE0qVElDFS7K1P4SEdRkjk/Vq6QHwyUl4ulGhtRDj7
	YyP5dVZ8mSDg4DGqaY5yexh55EjJ0aK0UNFIiaf0hDY2nbu/As+m7I+E6Hp8ooIyj7uO+Os8xKREf
	tgBFsJdq/2uKZe4iwe3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMpG-0000000AlTD-2t8q;
	Wed, 22 Jul 2026 02:36:50 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMpB-0000000AlGL-0iwq
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 02:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784687791;
	bh=0LIYMvSbkVDvGKEztdCzkGVC30RoqH4EtrEATgjRjOg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=CQuowJnTJChkuRHPaMZVJee/nbyqfFaaqbb7NtjmJegxrTtEBKtQMr7PEOnihYdlC
	 yfDXImUCIr7BRfrOEri4zepdnprKC9ZPyw9mpqwIZ7RmaK2Ud0ILe30Sz1dIdoXtKw
	 8LtGud6uWAXgd9+2Zkf4e5NQE0YLWrBhon+Klw68=
X-QQ-mid: esmtpsz11t1784687789te7033f80
X-QQ-Originating-IP: euxu36iqrpcNRQBO9pCgux1QwcGXj9dKFoLBfyM4jJA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 22 Jul 2026 10:36:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12298450221840552904
EX-QQ-RecipientCnt: 19
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 21 Jul 2026 19:35:57 -0700
Subject: [PATCH 3/3] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
MIME-Version: 1.0
Message-Id: <20260721-kx-i2s-dts-v1-3-d22cb6cfaab5@linux.spacemit.com>
References: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
In-Reply-To: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5069;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=fAIvRMKmHFJmx3qSR54EVi7APP1r/3dlylgc7iXhFgQ=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkJOrO4I3+bT3e4o1VWGjxnuqhdJ9uG/tJ20WiOfx6qG
 9an/D/dUcrCIMbFICumyNL9gGdbgU+UbYFAoS/MHFYmkCEMXJwCMBFhF0aG+TuZBAwcdlys3inY
 7p8w+bLBztNyb7RnhllxKBo+/LSymuGvpMPewOnn/Ze9a3/FvHLCjVcMXzsL8k6s8taoeHNTtGY
 ZJwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N8Oih4CtySWPCg6Hsdr2Wv77TMOfzGZYeU3lG2sSUeGeCZQ82//PYnS5
	v/6xDsCWHipv3ZiQMsUeZBfzApH4G5zVwUm1hf3p0walzgrVW0Laq8/WvFvQCi2JMenhLqh
	FU4gvMHovBD0u9XuezH9cg3RC9ml4mgug7qMIn40kslNf7gRCBcVQtqF/l8AxJ6qdcxWl35
	YxBFTvJlk1nZgXjyVGZlkUMlnyrBZxHIDGpHRjmU5chBxOHjWlwvcmnKuRKDx9mwl7mVjtm
	byuqKa2kT7ds8kj81yY7muD6MVwN34EojMphc//ly8+0fQ9p+aFct3Zh3mYt3XHM9N9X91b
	MZYnoY/LewXKh+TUI+huk+6DFlr7VnMJlGYRVwOJ6iXOG+k2k6FDamaktBTdWUnasXnfN7f
	1j3Y9yTshXzGOZQyU9nPaZ4bf9pYIGWaH/WfvlhNjMlhrtqmSVmzg6+5RmbJ+ZEQUtca4BN
	348XeOcF9MQbIVvhj8p4cRTA52GtpPKYS2HoLLcDm8dZG8T1A6N4oZXssTmmDnPpD6V5WLU
	tX+lx4A47ci0n0JkNKW8vAFmyyySEHXVYsCHZ5qNog2lakE2QuxgJ8YoDC9cEUHu6e9mql/
	iLvvTVnip/nAQjQqg/53WI/luZxgX/nU8JRlzul9/b7gaBg0QkDfTAxUnP9tiHLsIQIDR22
	WnfTiI3THcBzMKm2o3NBhk4MQDbu1MWRsC1Y48+CX5zp3eSn+P0TLl9ed3E9mfD/9CekcI5
	hpUQDTFFTfa0Uxqgks+EFhR9b7dSga/WF7vZ0Rcvnvc7Tt6pfFSZn66GAT8EGZe6pFznJRg
	U5MU5mtQxhiWAcd0M5Fp8rfWSmFvwl6HSMvztymt2sy1R0IqPKjkKBc9w9PXNFZ0yimwU7y
	Nk9D8GrV2j0pI8SnRV4ecZ2coGBj3RLPrwjJc/BArooOYzTbvh/kjTMMjHdk+Zd5fnDanr9
	aDn2EzEHD0fD8ubTf8YPqbDZxIpVcYA8aLkP4vuV3NKGwXMOej+r5Jczz7MHI22aaGU0mkd
	Rd5TyEv0AphvOc/WVa4+yE/yupTMj2aw5eUWUNg9Nfts2YVfKVEJULsKbGnr3qGwQLrsFG6
	0iSTsrDiR98lkSCRa/MmaKCmysXfpSxpQZBdLQuJIiZNnGRujqSM+LxTFrh81QHnu/Fvusi
	rph/s3XS8+Fvzxc=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_193646_044214_FE43BCE1 
X-CRM114-Status: UNSURE (   8.59  )
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

Add the six SSPA-based I2S controller nodes for the K3 SoC.

i2s0 and i2s2-i2s5 each have a dedicated per-controller sysclk
divider, so they use the published 7-clock layout (sysclk, bclk, bus,
func, sysclk_div, c_sysclk, c_bclk).

i2s1 uses 6 clocks (sysclk, bclk, bus, func, c_sysclk, c_bclk) because
its sysclk is driven directly by a DDN (ISCCR0) and has no separate
divider stage.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 119 +++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..967e5d87527a 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1081,6 +1081,125 @@ uart10: serial@d401f000 {
 			status = "disabled";
 		};
 
+		i2s0: i2s@d4026000 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4026000 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S0_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S0_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S0_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S0>,
+				 <&syscon_mpmu CLK_MPMU_I2S0_SYSCLK_DIV>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "sysclk_div", "c_sysclk", "c_bclk";
+			dmas = <&pdma 21>, <&pdma 22>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S0>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2s1: i2s@d4026800 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4026800 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S1_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S1_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S1_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S1>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "c_sysclk", "c_bclk";
+			dmas = <&pdma 23>, <&pdma 24>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S1>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2s2: i2s@d4027000 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4027000 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S2_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S2_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S2_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S2>,
+				 <&syscon_mpmu CLK_MPMU_I2S2_SYSCLK_DIV>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "sysclk_div", "c_sysclk", "c_bclk";
+			dmas = <&pdma 56>, <&pdma 57>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S2>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2s3: i2s@d4027800 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4027800 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S3_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S3_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S3_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S3>,
+				 <&syscon_mpmu CLK_MPMU_I2S3_SYSCLK_DIV>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "sysclk_div", "c_sysclk", "c_bclk";
+			dmas = <&pdma 58>, <&pdma 59>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S3>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2s4: i2s@d4041000 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4041000 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S4_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S4_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S4_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S4>,
+				 <&syscon_mpmu CLK_MPMU_I2S4_SYSCLK_DIV>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "sysclk_div", "c_sysclk", "c_bclk";
+			dmas = <&pdma 60>, <&pdma 61>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S4>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2s5: i2s@d4041800 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4041800 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S5_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S5_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S5_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S5>,
+				 <&syscon_mpmu CLK_MPMU_I2S5_SYSCLK_DIV>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "sysclk_div", "c_sysclk", "c_bclk";
+			dmas = <&pdma 62>, <&pdma 63>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S5>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
 		syscon_mpmu: system-controller@d4050000 {
 			compatible = "spacemit,k3-syscon-mpmu";
 			reg = <0x0 0xd4050000 0x0 0x10000>;

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
