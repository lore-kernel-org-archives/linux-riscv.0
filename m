Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFC9C25B0E
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 16:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxz5q4YN7dikWGpP77xdokqy+QcnoomtsOjEDnFOPeg=; b=i5fDbwg8Ymna71
	Et6QJfqseyAuEqq1iYuO9Tnr3h6msBKy+FGV/KM+ED1hyD2AZL/I9ef1sDQIVzCc8uX01m8Kl9EYF
	9nxDdm0ehnF6xWfit5Rhk1WH69Et9U5NBBNVDNUkCWnlRlbtVEwgx2rfKaSf1qdsNrwaLFTjIJsbk
	Hxb6wyhFOYAI9TgE+/pcS4iHNtWcNShBinpQtu80QwuiQ383bl3rm8eZhcN05c37T80YWrOe0b9Z8
	vT/8XZw2QAErS4fAxdikfp4ObO0zb2osRi0Lpxw3GvVlVAdcCd2lb+6ubuMIQhhoj98X2Kbj1FsTn
	GjbzRhS57kTK+i8qmkBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGLP-007pLD-8X; Sun, 14 Aug 2022 16:20:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGLM-007pIQ-Pa
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 16:20:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A0DB160B4E;
	Sun, 14 Aug 2022 16:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62147C433C1;
	Sun, 14 Aug 2022 16:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494002;
	bh=DwkobU+BMVJXJJWUeB8LPhbQL15JLQM4IwAWMPhJRpA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HC9Lo8NuhW6O6Mwvx067K3FL1AXcnyMxHJS7PzeUuabs2gmN7Ndidh5oMuuzEdNOs
	 vUEP4mGag/Wo1gEraZI72BTihkdNML5XaFlO/Q3s+ylHjK+yFYoeWc/1a7Vrw4u7Wz
	 Uxz15VPgUst+H0WK8oxOo3o+ttMWqxOXG/ffc27K8hOikdPVSHV9/X9TeY2Vvaqac0
	 duOBPMWrqtDwKMmUe3+jivpOaIYwF1G+UFQNAAXwvrKjGwdXOnho55mc2Eo81bSPjN
	 Lux4AtDH/By1qqnBPeml6iXe8BSpq6eRTU4AcWAgfI8XJ6NFOCm5h6qmhgfGZI8WyC
	 Yovb1FFDBrNGw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Brice Goglin <Brice.Goglin@inria.fr>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	daire.mcnamara@microchip.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 08/48] riscv: dts: microchip: Add mpfs' topology information
Date: Sun, 14 Aug 2022 12:19:01 -0400
Message-Id: <20220814161943.2394452-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814161943.2394452-1-sashal@kernel.org>
References: <20220814161943.2394452-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_092004_885378_FB64B0BC 
X-CRM114-Status: UNSURE (   8.01  )
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

[ Upstream commit 88d319c6abaeb37f0e2323275eaf57a8388e0265 ]

The mpfs has no cpu-map node, so tools like hwloc cannot correctly
parse the topology. Add the node using the existing node labels.

Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
Link: https://github.com/open-mpi/hwloc/issues/536
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 496d3b7642bd..e3793916a1e5 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -142,6 +142,30 @@ cpu4_intc: interrupt-controller {
 				interrupt-controller;
 			};
 		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+			};
+		};
 	};
 
 	refclk: mssrefclk {
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
