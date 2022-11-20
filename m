Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D606FC43217
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 08:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qt45V4CL5Uim5yDH2asZ5gXC0tPkCIHJEdsPNpmkz5U=; b=Q6AZ2uAmKV+05E
	466JQ8Ce3KieAupbQpljitCCxv4e1SNqVRMda0R/g8bsBLfbVGRFLUaUvKpxJQv3yv7SOI2xHNE43
	IAeSUpS3SJRQGnBJcf8o12gR0PLlag41zFx56fN/ROcbJhbmuC8aYUh0N1xcoVXeowpSCN8ngVIzO
	yT6VuiN4dHoevN82FedE74P3RLEVJt6koyq9A6TjZBvvhH3KU+0RivFx0R5UEVp8uYqL0TJUTZK4h
	j7oAl1FzE68GUZZePvCpByk0h1x/Z1n1QOv6uDZIEsao06BXRgGRY6Wejnwcs8ictnBMQNZZ3tKSg
	s30U6OKoI3Op0QP16B9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owfjY-0031Hf-NH; Sun, 20 Nov 2022 08:31:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owfjT-0031EJ-Rt
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 08:31:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8D1C1B80AB7;
	Sun, 20 Nov 2022 08:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931AEC433B5;
	Sun, 20 Nov 2022 08:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668933076;
	bh=ZIyxtDK+5wX/gBokLdTl5DvntJdJCnlFQwtz1yaZio0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ts4sR6+/pZZaUipGd83QQ/CEzfvA0M1VKs6GeRoST3/w0zSjXFPfA5YVlTCmLuTGE
	 wNJmnIcPVnYHzWPbsU5SLxhWGAm3vdNFgXMRye8/mgw+GufcRgqfyMfFPhM5ySRy/I
	 gJPzyfCDa2NrqVw7mDCQzAHMclbtJrr+7Tzy3s3h+SvVlmzsaZ+dXJA9NAZ8jz1IsW
	 aOzTADAaHzlvBXrjzzpNubDgIjY9Amk9yfJJj0Ejp8zO2KIF3KVB/6br/achcyKhf4
	 2JuEzAinCyiiCIvadXVz/Nqdz71X5PQcTAFiuTIgYC3ZKVtSjDBiYDSbPXWaaByZII
	 u5sAI/KJfbSNQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 4/7] riscv: add the Bouffalolab SoC family Kconfig option
Date: Sun, 20 Nov 2022 16:21:11 +0800
Message-Id: <20221120082114.3030-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221120082114.3030-1-jszhang@kernel.org>
References: <20221120082114.3030-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_003120_062465_40D134CC 
X-CRM114-Status: UNSURE (   9.42  )
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

The Bouffalolab bl808 SoC contains three riscv CPUs, namely M0, D0 and
LP. The D0 is 64bit RISC-V GC compatible, so can run linux.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig.socs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 69774bb362d6..90256f44ed4a 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -1,5 +1,11 @@
 menu "SoC selection"
 
+config SOC_BOUFFALOLAB
+	bool "Bouffalolab SoCs"
+	select SIFIVE_PLIC
+	help
+	  This enables support for Bouffalolab SoC platforms.
+
 config SOC_MICROCHIP_POLARFIRE
 	bool "Microchip PolarFire SoCs"
 	select MCHP_CLK_MPFS
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
