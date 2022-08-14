Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E6BC3F6B0
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6oa92CUzGPExYtSCnwXbpwRZ0tX09GSQsx9T3b1mnOo=; b=iemOK9ugZ7fMlU
	qBbbtsQ918umDV/y2TOyr+GQpuKXB3XuN4gK72VOZ5HMVwFe3SZo+BQTuTkquDPeXYX+J4zelDVBn
	oY8C0Ccnqoyhrm1wHcoSJelp0Mns9Yjk4Bs/n4+IPJnhMDlViUf1MpIUY9HhRGBHAr8CiXlyhGbkV
	02f6/l+ntwSlXi3e8zjMlj4ygCe8MXj0y+q0gh8ZDgPbxBevkjWPsbV7HIp4UrTgAB5+GK6QjSirq
	oyl98Sy3sSAvMRkcyWy586xXWBekM/3RPY+os7nIgoXzd6nIATIjClIjZJlX81A34Q22V1iJoLVwh
	xXKTp2Rgfk36ql0tIugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGPP-007rjU-NF; Sun, 14 Aug 2022 16:24:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGP2-007rZG-4q
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 16:23:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B8585B80B79;
	Sun, 14 Aug 2022 16:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA77C43141;
	Sun, 14 Aug 2022 16:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494229;
	bh=QycXXiRXYvZUqf9kFMY/DwyY1FZDeN0MoDAl5eoQP24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UNV9lD6pr/UwkP1ZNXL01p76S6QGlTWtrIpSRf1rT2h86Orz74qEBwStR0YhajYeG
	 KriJBvC1czCYoChBzlV9+d8uIODUu5cGyj4gQP/PlJsIiubPSjy+dzs7JLpHB0j5Ja
	 CBODuO68X3jcnE3nJdRoLND0SipbMid3VKn9XADuC4RZWyZx2pRIo3NOIZAGtRr9nR
	 eSaznbxKIBkMFY93dWbeqeZoc/XnjLiexp0gTY7K0lS7BH/fMwdPmS/qkZvHRlN8eT
	 d2ub+nW+QLpoIpWbMAnC2+OXY+uhV1IkvSnyOrMyeUbqPj4bo9N8jgCxRFTmo6SHil
	 jsvhl4/XgsbWA==
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
Subject: [PATCH AUTOSEL 5.18 07/39] riscv: dts: microchip: Add mpfs' topology information
Date: Sun, 14 Aug 2022 12:22:56 -0400
Message-Id: <20220814162332.2396012-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162332.2396012-1-sashal@kernel.org>
References: <20220814162332.2396012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_092352_353651_6B64A18D 
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
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 2f75e39d2fdd..37c05ba6e6bf 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -143,6 +143,30 @@ cpu4_intc: interrupt-controller {
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
