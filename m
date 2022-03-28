Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E21C43219
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Mar 2022 09:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KcPbGk5cbT7f9mcmis0hq3w1oOv59dGuJlIzcnrupEU=; b=wa6sJnv0+x2imG
	4QmFMPSXldGL8PijpIxq358FE0LP3sjclnjrTeBUQCXBOwoC0PKjySNTe9JoNXIsJDKjxh1OoO7Ig
	hxcJZj1sGW7fpU+OczpVxOnYs70ZjP8QWGa/za/P4eVcawTMwxfRFqNIxcG7cVMHsWLLpYkb4r9tf
	W4I1unf7hkljg6+bml1QZywFGJgmQKbmGDkbNR7IxV77OyGXHOiFLeC2n/M9w2sS/9bK6eFmsKIn5
	iWqJJXVGYZgDAstw2LthG6UPp+zcmKYZAObW6rWmynRYJr049wfmTSt6rfNHTVm7kIjlfk9l6DGxN
	PgZ7RXAcSqxkE1CoYuzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYm3L-0085hj-9e; Mon, 28 Mar 2022 09:52:47 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYm3I-0085gO-4O
 for linux-riscv@lists.infradead.org; Mon, 28 Mar 2022 09:52:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id f10so3995438plr.6
 for <linux-riscv@lists.infradead.org>; Mon, 28 Mar 2022 02:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wa/jhOBDbzXypLwdqQHP2csPLeVnygjpsw6wefsCgcI=;
 b=Q3fVODma/iyy4N0/11SdBthh/s+q8+fOIxK61L2ALfHDGiUqEW8sE9ALtc52F85OhS
 EkXBFEVuHIE2gB44Iz1tiQrWKcRhG0a6s9aVJoZ9xbfv6CH6SO1u/V6y7NOA/nFFP7kL
 MWw5PXy8/qGv4cSwVRq55OiYaJbUpraPvbXSyzOXE4kADO2Kf1JZfbhCU6qxO9jTsXgm
 1d1XLpCVpErOnecqUNkOmh81lGmRWpaT5KIpA6GNl3UK1gjtK/QJAwR2ccvyRpMAEkVx
 wVs6gKqRgH98VoJLDPbk3D93Dyu6tsiqmt3fVcs9X1kuynctSonwhdo7RXFhfzWcAu5x
 k75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wa/jhOBDbzXypLwdqQHP2csPLeVnygjpsw6wefsCgcI=;
 b=NaDJUIUiVQpXZpScf/sMTHsd3ms9h2MN/C1uXLI6hMAHoBg/Wz1HtJXIIj7/MXG4iL
 IoRLwRHKAacbEhHNIWMnGv0B16+uPQ8JoO4rNUZ5eLGJIoqvGDIVfgD45GbIwenF/Q3m
 NZ/Spk22/UqLRL6aqit8MxKfkgwOUsPnCjrzrtjK4vfXSU0WJ2HnsfntOLxSyrbnWgFW
 dl3jIgQpx2k4nG9W50Dap91jQyQh0ELcM+1227YGqV7QhBQmPF2f0MdArj/eqButviHj
 xNtTCUwP1n8jv96pMIrKfyHJLIVUHVgVIXx9qL1bBA4WHiBAB9f4d38QiIkJWy8PqSb1
 FQIA==
X-Gm-Message-State: AOAM532f2JV25q+SjWf5Rjw4ObgsQpeJTz9fhgU+Rp5c4eo8MaOtTtg7
 9KFmNWImjz7SHFr1BkCZzJeNHQ==
X-Google-Smtp-Source: ABdhPJxHONZ3f2Yc2WSNu+jkr5b+vJB/GJkHJsbhf2730GFrUfxaNbwYpNK9G38hBoG4pMTeWyCn0w==
X-Received: by 2002:a17:90a:470a:b0:1c9:a9b4:f88c with SMTP id
 h10-20020a17090a470a00b001c9a9b4f88cmr5064699pjg.185.1648461163359; 
 Mon, 28 Mar 2022 02:52:43 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a633744000000b00381efba48b0sm12255117pgn.44.2022.03.28.02.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 02:52:42 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v8 3/4] riscv: dts: rename the node name of dma
Date: Mon, 28 Mar 2022 17:52:24 +0800
Message-Id: <edd72c0cca1ebceddc032ff6ec2284e3f48c5ad3.1648461096.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648461096.git.zong.li@sifive.com>
References: <cover.1648461096.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_025244_190998_0F2F358D 
X-CRM114-Status: UNSURE (   9.35  )
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

Rename the node name by the generic DMA naming

Signed-off-by: Zong Li <zong.li@sifive.com>
CC: Vinod Koul <vkoul@kernel.org>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index 6a3011180846..6eebe34c2851 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -167,7 +167,7 @@ uart0: serial@10010000 {
 			clocks = <&prci PRCI_CLK_TLCLK>;
 			status = "disabled";
 		};
-		dma: dma@3000000 {
+		dma: dma-controller@3000000 {
 			compatible = "sifive,fu540-c000-pdma", "sifive,pdma0";
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic0>;
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
