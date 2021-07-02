Return-Path: <SRS0=3Ayx=L2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928BBC11F6A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 01:43:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59D636140C
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jul 2021 01:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59D636140C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yFpEibQ2Vzq9Redkh3i2kz7rY3h1udoll2biEB/gkmo=; b=2oAK77qHKFwhHS
	Ucy//KIwkM1VkSJNQWOs9F62HAPpwrTsx46dvuncSp3R7UWFjbip4YUbvWuERX1V5lkfDCYfV0Nx4
	OpXMuOG9HI+ymucF+7h4J7zP0d7VZ+BKHA8mMY7QPYLZOEdNoj86mpqETFAum16a2Jh/08mcFrYFW
	EWGKalNAYxsu/xildf7jwK0KXfYZ6Tu+iLvInCiPyiVYLBFlRkMh9I8RE+aM6xNoBm0Dy7miSNw/w
	/G9Jg61OcxyCsgsWDIrK2hMyp5BhJE6vQJoCslToWUOVoNcC0iVWHYbqgynNBoF+fRqVJi68ErzvI
	G87cMNZM4sELsFmG+W/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz8Cn-001mCM-4i; Fri, 02 Jul 2021 01:42:57 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz8Cl-001mAK-4j
 for linux-riscv@lists.infradead.org; Fri, 02 Jul 2021 01:42:56 +0000
Received: by mail-ej1-x631.google.com with SMTP id bg14so13582077ejb.9
 for <linux-riscv@lists.infradead.org>; Thu, 01 Jul 2021 18:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E1Zvb/uiy3iOmHflgjq8JXx3wNW2292VBosbWV1esJ8=;
 b=STn1H9Unt+WHKEKNFfAff+AT9Dm3AcVQsswD8UTf9jF17KFYS1jV8xm67dZI0J0+GE
 CAp7MQpik05b409mi4C77C+GA+swnVNmlto/4WFi6ILwm6hP8Zw01PYwRmbObtd4Teqm
 tkmyb4cBn60oen5p1JnN9S+hMGGxXLDjUue3iYugON7o/DT5dLQpVbjVCW9AExTvJ3XB
 BW97COdMKt4Pvr0KESWdTovkdtOf2bM4iXqyl8OUYvWYWr6tojNR1q1O3UtU8Kes58AI
 ZweS2E7SnCmb6wzSLz43g0YkrbBYOUKSXqX5DprTDj8Amk11TdRvuMLvBKovvjXb12Cp
 VcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E1Zvb/uiy3iOmHflgjq8JXx3wNW2292VBosbWV1esJ8=;
 b=hqMGSJtqEc8FoABmzpLd6Ns78nzJrLBLkx3BLzB2oWYKBdgXGrrtKh7fynsi+qgjm2
 8qKdUVs2s8N7CoyscOFyT6UqcjQZbB2Q6qx03p04W+HA14RbPz1LAKwuV77JuJqBvmBQ
 8gxOlLaYJ2OsKUjFgMYqEGRWy/iPTmrlCxVljXE63yo1GX+fKb+W40Qwx5ugQddKPFQl
 m/Dg2VDJAGTkzvkXdK/5mRm0KcoQ+kFk6Oy1OMrQaNpT1F04D3aYktV16XYLjpcJXoPx
 8D187IHTBRtBDbTiDwOqFdiy2orkE7DkMg+UbcjGUWcEomhFiWMu6sZFW3qezSWtTbpf
 MG3g==
X-Gm-Message-State: AOAM530zb2b7fobatL8r1qXARuhqOGM53iT9PQZP/Jc9pFBkhh+k3PUf
 u0d1j8Hx3RnhJdCcaBMdAEA=
X-Google-Smtp-Source: ABdhPJyuszK90w+8YsfWrm7VGuURTSEbrICR2T9Hqw1M2H01i04/llH03wZNXedgL9V6QmqfJTdAJA==
X-Received: by 2002:a17:907:97ca:: with SMTP id
 js10mr2748153ejc.393.1625190173775; 
 Thu, 01 Jul 2021 18:42:53 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id j19sm629580edw.43.2021.07.01.18.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 18:42:52 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Lewis Hanly <lewis.hanly@microchip.com>, Atish Patra <atish.patra@wdc.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH 1/2] riscv: dts: microchip: Use 'local-mac-address' for emac1
Date: Fri,  2 Jul 2021 09:43:18 +0800
Message-Id: <20210702014319.1265766-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_184255_249398_55DC3387 
X-CRM114-Status: GOOD (  11.45  )
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

From: Bin Meng <bin.meng@windriver.com>

Per the DT spec, 'local-mac-address' is used to specify MAC address
that was assigned to the network device, while 'mac-address' is used
to specify the MAC address that was last used by the boot program,
and shall be used only if the value differs from 'local-mac-address'
property value.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 0659068b62f7..a9c558366d61 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -317,7 +317,7 @@ emac1: ethernet@20112000 {
 			reg = <0x0 0x20112000 0x0 0x2000>;
 			interrupt-parent = <&plic>;
 			interrupts = <70 71 72 73>;
-			mac-address = [00 00 00 00 00 00];
+			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg 5>, <&clkcfg 2>;
 			status = "disabled";
 			clock-names = "pclk", "hclk";
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
