Return-Path: <SRS0=mZrj=NK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A31C4320E
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 15:45:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3648661029
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Aug 2021 15:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3648661029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXY6pqPLjUL3EYsjmUdX+x9L99S5LC4N4lu96GKC/S4=; b=Diu74IB1jt3Yvt
	gHL1Gv0fspe1qsbj6B3rvmGwCBVFAYJxX5CQGWlzzCLsM3R4l9tc8HHGprDmo+Ice4YEtGLF/i+kx
	8Xggy/zgsGily2MIwbApXPq0kUKdBkFAnm1L2PTUYxDYGre5L5al4vX/yGymtPAwCxQv+iSYGiagt
	r3zng0UWFgJ4oqgV6wuimiyQrdMwr8GEVZK/MB+H0V1FSI0OE2HkJNAr8n2RtlQOWed9xPxliAsBR
	vnAy14SaN4/7BDNq1cI/wN1zlFS8xyPyrXbOV9i0SQRGH6yE2Vg41j9sD1CLRc9xikGEK9yKI/0TA
	vdUA1kAcnAzcRW+8I8qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGkEa-008qwS-Bx; Thu, 19 Aug 2021 15:45:36 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGkEP-008qqR-AB
 for linux-riscv@lists.infradead.org; Thu, 19 Aug 2021 15:45:32 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 6A99F41F0C
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 15:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629387921;
 bh=49SQrS5qR/DGh2JT33Ed3tk6OzvNaJscxeaopNy6uIc=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=OPTF5lllgss6UEEJ8M6/soyQRuNHwjF6WuDv+1kFo1JnCiiipLe/SDpPjax63uQCa
 3rtEHyzAOajOazJBX7Y/z/NBY5ppeLkC7cOREy0xm9dKF+IVmmDUqnpCkk8MKIOaBU
 vrc8DMfL0P0HjnE4qEMZHDLyJTTMmSWXFVdvPVmW+BeJxmd6W8R4pxCAFoHoPsnrTA
 XDlGEhHM1wHTrDyhTyIMFemcZp99sV2KK5D7nLnf/D3PE4rdABFziPy0a7pyRwmpIg
 YZUtU90SAddkl+WYiWQ8PeW8SRaHEBzlFocM+fNPEgvLPCU/nY3rU+4GrCw5HwaqFy
 5dASVwUWiZAMA==
Received: by mail-ed1-f72.google.com with SMTP id
 f21-20020a056402005500b003bf4e6b5b96so1241395edu.5
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 08:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=49SQrS5qR/DGh2JT33Ed3tk6OzvNaJscxeaopNy6uIc=;
 b=udXrk/g3ftTEDnDJsJLRaxOP4edxF8b5ZJMd6k2z6sM72eH14DH3uvVyLQ5F1L2D6M
 T1W3a9PqiE7q8QC7Tc6eUWDWVMr98+eZuMOkWT0T9z/TVFiyYNCDrjnR0q2ZdyElNbMG
 LAGzcl+/yLiHqJ7/eIYEF942nlAWikmVipiWMe1ypzEnNCRWhNtBIA8zOrMaKHFknlgc
 vBm7ze7JypsQcPU+V8cNJ9vw300GwjJtMULHn/4oV/ti881L15bvHlnS46Bd6qq57yKu
 +PTssjbfXLrZew2TpyCOu3B+s37KJviqnl5T7PcHMt+MaJwOlIZ97vo5H4Mijj01ivQa
 w9rw==
X-Gm-Message-State: AOAM532qo51gvaSCjhA64CJEJne1zkVE41vimPjL3Rm5oRez81m6PxTk
 OelTZs3COmv228GZQQb8OxN30q01sSupi1SIgyCCWbQygAMN/ctLlpAxbqBxRcAq0D2wJW70e64
 l/pauhm0suxRhqjuxSCDeoYqHA7SN931EjdEeFaJErJehgg==
X-Received: by 2002:a17:906:5909:: with SMTP id
 h9mr16162311ejq.329.1629387920972; 
 Thu, 19 Aug 2021 08:45:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbVkNbqqPYyJfh7GB4lkzG2WE+LhjQwuFLKnM8+tFCQCy672AdvPh8cIFy52i1DWdjPI27+w==
X-Received: by 2002:a17:906:5909:: with SMTP id
 h9mr16162276ejq.329.1629387920830; 
 Thu, 19 Aug 2021 08:45:20 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id f16sm1925373edw.79.2021.08.19.08.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 08:45:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Atish Patra <atish.patra@wdc.com>, Yash Shah <yash.shah@sifive.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 4/6] riscv: microchip: mpfs: fix board compatible
Date: Thu, 19 Aug 2021 17:44:34 +0200
Message-Id: <20210819154436.117798-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
References: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_084525_548956_2BC25D6D 
X-CRM114-Status: GOOD (  12.99  )
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

According to bindings, the compatible must include microchip,mpfs.  This
fixes dtbs_check warning:

  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: /: compatible: ['microchip,mpfs-icicle-kit'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 2 +-
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index 237830583514..62f7651de538 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -10,7 +10,7 @@
 
 / {
 	model = "Microchip PolarFire-SoC Icicle Kit";
-	compatible = "microchip,mpfs-icicle-kit";
+	compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
 
 	chosen {
 		stdout-path = &serial0;
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index b9819570a7d1..cb54da0cc3c4 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -7,7 +7,7 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 	model = "Microchip MPFS Icicle Kit";
-	compatible = "microchip,mpfs-icicle-kit";
+	compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
 
 	chosen {
 	};
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
