Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F0CECAA24
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 18:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzR/5gLJsm+HCMbj8dxWo8wJzIAMjZSQq7X5nXCilKY=; b=uGu3A/kupskUtF
	JJw5hdUvXz8VrVFmG0yoZpQ7EaedbTVgeLAQh4Hs69zegaq3vAlEUsicSkxdU/3ZuqDTP/VtJkbV1
	Qw7CHAnpJq47y/VbCHnY2Ucuq0MbZt5mNQBqkj8DCLPN3MCP4U4F4h6nejEypfYekQHhnN1HAo5mB
	/3ZZzHR832+iMsT77oD+tNJBcgYN+DL8eNTStm+EiBcnbunUCihqQiGPIleTtAcwtQBhIy0OdyoW+
	jAwkIl+dFCKLgdPZ+YgGE+D5eG+dwl+UIdepx4YM4hmnOREmn/bP5wTR/MFmBaSRYJ6MBKUxke4/Y
	Md3U20UeBmhewuepQSqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRHEb-0007oX-W5; Thu, 25 Aug 2022 18:05:42 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRHEP-0007XU-HJ
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 18:05:31 +0000
Received: by mail-wm1-x32e.google.com with SMTP id bd26-20020a05600c1f1a00b003a5e82a6474so2923432wmb.4
        for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 11:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=vL5A1E76Veik6n5XYhBLm8foWbkD11MRUns8HQxABwE=;
        b=JBu5IQX8xe8tZjdbGeompjkIOFOyxa8s4kf8oTt5/4iy+ew9NtRcz93SqBwZKVTH44
         XSdAW+mE0EBfMORK/DcJ/HhDfbIXtj/PbZ5sea2exMk16ewDx2KqpZnwbgdEXC4ytHiG
         wNZOaW7Kn0mUT/o9KM/1CeOxe8k2BqedSQwU7Vmdxw7S6o6J1QBYVnljbRYUHtL8Fq/C
         zWMboFXBmamwDWcfekdax/A2hGXwxPEtCBAUymQ89xqCr+PqaSKOnDPnBvJn0RxTHdFB
         5uLa1/gbuGWjSGVhwBx0x0USLViBAK/Vcsatsl0X0NYVcwgcFSMO/DMn14PsnKLejou7
         7keQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=vL5A1E76Veik6n5XYhBLm8foWbkD11MRUns8HQxABwE=;
        b=E7toy+ESQIh748uL2VeQBozWA1feNeRwEMlyUky+lsasm5KIPFwvloMJHvyqd4QTX1
         8J638Q/ymRa17PLVAFjgRd/RdTxJkH+gWCgDw4hP6m7wQ9X4lfKlyyYl4A75+0nboRB5
         bidmScThZlzeBoaAHc7Yk58MHl3cYDvHXUoYvlBgPMEgBcfHOul4+AVQBNcOb/fLD5C1
         3dQs93dzN2+orLv7KVw4qC0qfuAu76tB6GiSBnEsXsxcjz0JJAmatHyP0VIv0Uf7S38r
         jKYGe5XWbfxK6A3JQPGPq3XthwIp8zoUrpe437KR2niNYnN+FJshc0yMZbE9HFCc9Xij
         +j4w==
X-Gm-Message-State: ACgBeo1y0V5upvXPU9/FY+TY+8hal5/DJcG0wuLmi+ijnCIcQCaCJhjj
	FzddCRpVDxzaiaby1py7cz8lmQ==
X-Google-Smtp-Source: AA6agR7Iv4zB7rXpV1buE/jjnhbKekVEkxkgj8UkRFjcXWAe8us7XcoEngBVxTPwI+UzghxBpBOk8w==
X-Received: by 2002:a05:600c:17d0:b0:3a6:8235:504e with SMTP id y16-20020a05600c17d000b003a68235504emr2881496wmo.58.1661450727396;
        Thu, 25 Aug 2022 11:05:27 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id j4-20020a5d6044000000b002254a7f4b9csm14967970wrt.48.2022.08.25.11.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 11:05:27 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>
Cc: Sagar Kadam <sagar.kadam@sifive.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Atish Patra <atishp@atishpatra.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: dts: microchip: use an mpfs specific l2 compatible
Date: Thu, 25 Aug 2022 19:04:18 +0100
Message-Id: <20220825180417.1259360-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825180417.1259360-1-mail@conchuod.ie>
References: <20220825180417.1259360-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_110529_596141_32C9A9B4 
X-CRM114-Status: GOOD (  11.02  )
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

PolarFire SoC does not have the same l2 cache controller as the fu540,
featuring an extra interrupt. Appease the devicetree checker overlords
by adding a PolarFire SoC specific compatible to fix the below sort of
warnings:

mpfs-polarberry.dtb: cache-controller@2010000: interrupts: [[1], [3], [4], [2]] is too long

Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
Fixes: 34fc9cc3aebe ("riscv: dts: microchip: correct L2 cache interrupts")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 718d077b2549..3a00e4c765a5 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -185,7 +185,7 @@ soc {
 		ranges;
 
 		cctrllr: cache-controller@2010000 {
-			compatible = "sifive,fu540-c000-ccache", "cache";
+			compatible = "microchip,mpfs-ccache", "sifive,fu540-c000-ccache", "cache";
 			reg = <0x0 0x2010000 0x0 0x1000>;
 			cache-block-size = <64>;
 			cache-level = <2>;
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
