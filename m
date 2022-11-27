Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691BEC4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 13:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnanvtpA8nlzoSXCVSU+E4Tsi98e1DZzXCtgeF+tIHc=; b=JtttpnZIeHwEKj
	b04jD3jNhSN+Cvl2UXTmYLwA2BRuE4Yt6QD3XLjJ7+KcHKmUQCLZeCMTxe2WNu/yWeqKNEtrnG5o2
	cr3xC2cRepdLoSsL907FAPn1mGPooIcNRRc039w0+qSFzeHjSpZvyVrhiEuvXvxQD/CX59WTxUal2
	QNPys+0V45NG8wsT9HI1TuRQ/yXqmx2bmITctZiznvaUdSXVRco8dXSjir+tIWyMoRcipzC9C3tlu
	9PuVqWFxp7iJ1v/OY6XmnXPM/vrll3Y+stfgKXCQPLUMg2o0BBwpjRP9X0elmBGqgxEG1g1gnyXiv
	MAPkFy95L8FJNbN3Iy+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHo7-00BPmS-AZ; Sun, 27 Nov 2022 13:34:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHo4-00BPjz-LA
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 13:34:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 627CEB80AFE;
	Sun, 27 Nov 2022 13:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821D5C433D6;
	Sun, 27 Nov 2022 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669556090;
	bh=U1BBZe96a/tTQWl6eRpC2brtXLC0B1aCss8DfwQWm5o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XYFxDEK1GpNY7U8Lsg8VPWSi//ri1THgjsu2MKQp/e8LedIJHigaZHuxb5yN8ekTG
	 1HhcAlVcTp5GxJX8JMoxw7rIDlEp1DeSdAk4nor1pnPLEBbfUUplbyZ0mo7F3wUOVQ
	 zHA7EHm0HOJB79YcrKMZhgBJc+fxvjE74eIzf7+2SlIMm/KulqkVol6g4nYgiSK/tH
	 /K/qdcjvUNZTdB0uO+xks6ZkkWSSOcE1oB0/ibaoyFhyiJ7g0YdJ/lF1rCQ24eIS4A
	 Npjvipr//7Ms10m/M25yTNa5tzudfvSgKLG2A8bCtUPdjFfre8rHK1v+Mq9SYaalLw
	 9g09jh0u5wXtw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/9] riscv: add the Bouffalolab SoC family Kconfig option
Date: Sun, 27 Nov 2022 21:24:42 +0800
Message-Id: <20221127132448.4034-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127132448.4034-1-jszhang@kernel.org>
References: <20221127132448.4034-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_053452_870178_678DB859 
X-CRM114-Status: UNSURE (   9.01  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
