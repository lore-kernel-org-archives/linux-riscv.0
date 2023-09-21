Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607E4E70703
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 09:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DXbJ2f1+owEmodJcPBFQSrZ01MCNs1YS1bXvPN5vNsw=; b=GwrEu8kzdWU5/H
	oOsCQA6vETQKQ/jnIQnp2QTNPxV7+lmbpWccd0qAB/lVkIdqW3yLoFn+me9D11sUX2xTS6NlDMDpr
	Nho61DQV8+gVoezx/Asr7idbKjgubf4p/nxJQPDRwBGp50sVMV9jekeT6JCk41P+1MJU8O1h2p/+H
	nXrAhOuyzUDl/mEYr/frg112O6SPacJ4G58dX49QrICUos3jZ3/hVRmJ9Xv2Yaf6wDeAYFErEQvwa
	ity3l4uz188mXdkFlaj/ZaxumUn1FRnNbH6VIrFgjBb0zbGr9wyOhnn3/Q0mduPgOTjtSi8geMs5g
	3k3N5Wz/7BciyU04+Ngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGRb-005eOt-15;
	Thu, 21 Sep 2023 09:57:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGRW-005eKj-2I
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 09:57:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3740761E6D;
	Thu, 21 Sep 2023 09:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2CAC3277F;
	Thu, 21 Sep 2023 09:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695290273;
	bh=FSrPmOaSMx7Qkcei56gJBLc+xA1QXErHfQ4fZST4jRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EFNT4OwWarwZ2PiwVpoDC3pBw05MsnkzPxAwOMKCzWiacPbcMBUf378pGIlu35Tpg
	 NJiaTDJWWXcF8YMb/Rn14yeTU7/lbrtDTVoyA7UK+2jTHbnAzK3J1X4GrLAXXzdqLY
	 it4DVEtTcw4miParWFmG7wKCMCse6xdW/87WfLznwWicKSAUmLw9DYxgInS98lz42A
	 DwKVzb59UCkho/r02fF9kESGSnjJjEdOgV+/N2ljSATpb5VAYbqufQFaOFR36gvTmB
	 CxEJK+MSypba7dfr1+Ev6GZ6qx7LChqhQBXAeSXxBbl4oZTr90lQ+rYPQBs4Uov5OQ
	 B1kwlUb39nQGQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org
Subject: [RFC v1 5/6] riscv: dts: allwinner: convert isa detection to new properties
Date: Thu, 21 Sep 2023 10:57:22 +0100
Message-ID: <20230921095723.26456-6-conor@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921095723.26456-1-conor@kernel.org>
References: <20230921095723.26456-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_025754_789915_488DF5AB 
X-CRM114-Status: UNSURE (   9.45  )
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

Convert the D1 devicetrees to use the new properties
"riscv,isa-base" & "riscv,isa-extensions".
For compatibility with other projects, "riscv,isa" remains.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 8275630af977..6b721172390b 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -25,6 +25,9 @@ cpu0: cpu@0 {
 			mmu-type = "riscv,sv39";
 			operating-points-v2 = <&opp_table_cpu>;
 			riscv,isa = "rv64imafdc";
+			riscv,base-isa = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
