Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A057C8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 05:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqqQT2LE13AwKbG80b71dArKpFxAtWszlKxSpleL0aw=; b=Ke9tkv0ilBskzu
	HMqyAGh+3dip1BXtN+cUumwogjolkZVRf26MNYQoDfSFEcn97YXi90B8fYbCqBthlNmHobDW6qK+U
	3jjnpVmSieBj1G10aUQiMpZ/GoToMlxfhsDhAK8ry2HuvAKd0tqSisP6O1/yQv8bDfzGd88iRvaxQ
	qUEAlR+LB9sEJ3/wNo+XTM4ANoENVdgtSj1gsmwhFaFmJ5FZbMRX109YUj1bVIhOAUa8V/Gk8i/Yg
	8PKcI4vjjm5gPj2IXy0Ba5bKy6ZL6L8NbSS29LsyAEmBFCQKeTtQHT6x4yRUNLPS50Dh8S1I8zrG3
	CdRs4UYSJ1gTxOKaG4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWThA-000000043ZD-24ul;
	Tue, 01 Jul 2025 05:38:16 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWTh6-000000043Wx-47CM
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 05:38:14 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3141b84bf65so5064196a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 22:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348292; x=1751953092; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmX5fOXWCoBnrBEU79U5TxH9E1pYhnhJLwNdCcpNrA0=;
        b=PAe/Mdr1ork0QB4/IKzE8t/pYX07PGb6hDSBWXpXXax5qVrK+JSabg8ynr33LlH3A8
         oS/PbPxp/EHcM6aC60hCM75E6d2zWSjdDZOiYfDDlukpQp/2GxFNqwn9emW7+Db3xANd
         pcHkT73p/THF9zZ6uaXKgtef/oaT1DGz1hlq1zwAaKjnUEH+Q2e5fXcUwmroVwdGtAka
         PQDEDjUXh7eUfGq9wfotsD8/30WwzJgcJBhE88CSW+nNLMvkC7fpWnEdJ77gWKxlV5Y7
         jWJ7pp4eP3PVVhML3xSLI3Luyak7XJhLovYJOOV3OY9kUCoViMgzGWmNp+f1M6GuLo2Z
         oA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348292; x=1751953092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmX5fOXWCoBnrBEU79U5TxH9E1pYhnhJLwNdCcpNrA0=;
        b=I9CDM0kniHfQ068cYa1FUx/shKF3NaYJ9xnTTyRdO0whfVoNJhjX3s4Xb+E+x0yEeJ
         IuGGLZgpWH74HhsAXZ5fA8uD/3QDTpJNvWW2I5vU86NypFamgxWKYV7uJg7Dqxl5e9Bl
         AIOzN8aGN5bZCFxleLSimwZ3U6jXQZK+n1RfBsgacSCXVMlhlym4e98+w21u85Otx3sO
         8dG/VSM5SmXof2A/Mk9BIr0Ku7CvAuECnmkN82sVEQ0xkHGBFxiba/P0mGPeNoShvlOz
         bF2Kov2JGUDD0m68zlXbHg0zR1XPclX1OD9Dy0LlEmqIUC/XHTvCbVHu8EJkV38sVYrS
         f5HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh1iYM3X/hylukzBp9WO2v9JTOHIYLrRyp5+27qxMepGArj/gzJtP1Rue4Tso+91W/Z8W5RIo5iIspGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiEokCG9EXiD7wsrDQr32mYKCTp5POuMCtpZOeN1KRsd0S2HBq
	nj8/an9xUksgyuxuQuO4LjrielcmM8r/tK0EzSEitr6AlTdgycfexqPCUX5Fdm2fm54=
X-Gm-Gg: ASbGncshvcSVsUvJ/jjUe0rfdlupo7/0k05jIow3PpO3AP09tMFjvhbE9DGS2K8uv6L
	Hrv2C8M9jB4ZMAV3IyzmWYz48Nygd5qhS3Y2fEff/ML4d7gfTdOqymzYYdoT1JdLz9Vp2kbJkgK
	6crbxlUx7X8WmzU1dWNXdStXGflGBGkTGJm2qLnV6ofeRgv9s0yBkKeh7vvg4PclK5kt3YXEkGi
	YETwO8vLlgIv93SK3BScIPdTAz7yYk35ddQ6LWEY49YsrA4QK5VxtOxGnshZvP0+BZMVdVDrwl/
	6OlXSVP7g7AJbob9zhVuUnHdjZgFV81AUy6zDi4=
X-Google-Smtp-Source: AGHT+IFg+6q2IUBlKBteqcounl7lX9NwIth1jTPA47B/kJW1lDcCrpe2PThA1nJP2lbTdGGwBbnrEQ==
X-Received: by 2002:a17:90b:1dc4:b0:313:17e3:7ae0 with SMTP id 98e67ed59e1d1-318c93252admr20461773a91.34.1751348292231;
        Mon, 30 Jun 2025 22:38:12 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:38:11 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 01 Jul 2025 13:37:00 +0800
Subject: [PATCH v2 6/8] riscv: dts: spacemit: Add PDMA0 node for K1 SoC
MIME-Version: 1.0
Message-Id: <20250701-working_dma_0701_v2-v2-6-ab6ee9171d26@riscstar.com>
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
In-Reply-To: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_223813_034358_316F1268 
X-CRM114-Status: GOOD (  10.49  )
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

Add PDMA0 dma-controller node under dma_bus for SpacemiT K1 SoC.

The PDMA0 node is marked as disabled by default, allowing board-specific
device trees to enable it as needed.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2:
- Updated the compatible string.
- Rebased. Part of the changes in v1 is now in this patchset:
   - "riscv: dts: spacemit: Add DMA translation buses for K1"
   - Link: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn/
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 8f44c1458123be9e74a80878517b2b785d743bef..69e0b1edf3276df26c07c15d81607f83de0e5d57 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -591,6 +591,17 @@ uart9: serial@d4017800 {
 				status = "disabled";
 			};
 
+			pdma0: dma-controller@d4000000 {
+				compatible = "spacemit,k1-pdma";
+				reg = <0x0 0xd4000000 0x0 0x4000>;
+				interrupts = <72>;
+				clocks = <&syscon_apmu CLK_DMA>;
+				resets = <&syscon_apmu RESET_DMA>;
+				#dma-cells= <2>;
+				#dma-channels = <16>;
+				status = "disabled";
+			};
+
 			sec_uart1: serial@f0612000 {
 				compatible = "spacemit,k1-uart",
 					     "intel,xscale-uart";

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
