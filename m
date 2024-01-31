Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6848C47DB3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 13:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTTCIMc6JnMx6rHMVUqwlAqehejj0RitRKiJHNfBCxI=; b=bUzip6cqM7rtuD
	2FhyhnQ5eJK/LLns6xEoSfY4pRkCkDoEgRJJGMYELdxwJyhoCun46BYejpF1QPfDi3D1uamve7Wnn
	6FXMMWxOuaIwW3GXAU/yFa0h337ajvib7544ihCb8cSvHRFYSXPengLiE7Sx8CWFArhFKbeZgVtvA
	7gwdqsG2QWjoiattJuSnyY11vN5yKpdyxyz2nqLNx/JC7ovNtl+tik+whc1ubGLLFq/cgcr9E4SOG
	pYZQerorq7LxtqxOsuAfVbic7VwZPQX50VA+LMGEC1yH2lIifHCbOh9QYFmzuIrwikV+O38OpHr0Z
	Yt9AQIdZWvoMyxz4GElg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAo1-00000003exe-01bN;
	Wed, 31 Jan 2024 13:39:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAnw-00000003etJ-0Lqj
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 13:39:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F53C6177E;
	Wed, 31 Jan 2024 13:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B7EC433C7;
	Wed, 31 Jan 2024 13:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706708343;
	bh=13OUnsu4tCIrpbyuApz07RJcqNYojrwlsLe/2mWWH+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lv9KVagMAcmv/uJXGdauMwhW96ZNGAh9TDxF64Vg7X9/ZWcr4nxYQGANP6qXs5kZF
	 Yet1qsOQsc63Uvy6SryyZo1/2g27vrDMJE8Ue1/ZzMDkQ+idnojyEw159DNE3E+qxD
	 ItUDiI7Oh2CFoZVlML2a3mdzsrgCezX2xdp7seFpn+Jy59wcxiaBf1UniBcjS/h0Bf
	 Clr0OILfc2oECtpo2SzjLNyQl25VssVOTJTw8ALT9YrhGndsiUY2ombbb6JFIhgIuA
	 O1Q1U5qlOrsWcnn843Us5cBFPu0mHgF8648eJctJifKo5Oky7onAlHXjVHufufAJd6
	 w787kKPFD71GA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 4/6] riscv: dts: starfive: visionfive 2: use cpus label for timebase freq
Date: Wed, 31 Jan 2024 21:25:58 +0800
Message-ID: <20240131132600.4067-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131132600.4067-1-jszhang@kernel.org>
References: <20240131132600.4067-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_053904_250921_ECE64942 
X-CRM114-Status: UNSURE (   9.13  )
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

As pointed out by Krzysztof "Board should not bring new CPU nodes.
Override by label instead."

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 11db93966dd6..974851a764e1 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -26,10 +26,6 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	cpus {
-		timebase-frequency = <4000000>;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0x1 0x0>;
@@ -69,6 +65,10 @@ codec {
 	};
 };
 
+&cpus {
+	timebase-frequency = <4000000>;
+};
+
 &dvp_clk {
 	clock-frequency = <74250000>;
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
