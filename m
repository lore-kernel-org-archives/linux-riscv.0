Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409F2E810A8
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 08:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMOihFn8QIsbZPzG5kRZRpKf9RopBxH9MJHHS9N/IDM=; b=09jreYsLyurhTw
	Q67bVGqSuufeiQImsRWFC2Zg7tcZz0Y8nOS65mROSP79vHBNHl+5lynetadE28g8jVy2HOdZUDhSK
	PXIoyqOyTRrtaN4yJp4JBQn70qHtM+MwhUWhscCkLV1xfTfpXDDcaokY4Dzz9nCmLCBHWzh97W7XD
	j0oFVXDQDaCWHsTiSdPrblRqb3Fr69LTjuiDsiKYsW9ywHr9wkpF78J3oGSqlj8WXnpACyl/2DWmP
	O+7BrhjZtRzztDMQDFIG8B/mCTLBk2rj822GiUfo57R0GH2pj+whhpAl8ha4GQkFZLNUwN6QIGAnB
	KuWAxBhCxYZFedEzYWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQNE-000Ope-0P;
	Wed, 27 Sep 2023 08:58:24 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQNB-000Ooi-22
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 08:58:22 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-1c0fcbf7ae4so6590314fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 01:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695805101; x=1696409901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZTi49m1tRqik4s4OIHpvu+DZ0pGT5ycjrh8hjwTA/U=;
        b=dC4TElN1II8dXHskPJ/4uTlHhzhpLG83HnnT349fR85r0nemtUAFeSjiTzP5GcL407
         RvjUwlPcirXqFBYBK0EMHQdnsMrITd5eAHWB3Tgdpysmu8Yhw5aa5l8a0ODNVRABvkEx
         yDfje+Y4HhYivHy4G92CS3mmqUILWKaFs03hLRBFjwMgiso5pYKowDRHdpv9JHQn8ZEC
         XOr3XAeovut/Rf2Mi2RcA+59IT4TWMOgH67JHB9d98omLEevR86l53ETo2DyA/F4wnwR
         gvurFIFyRgW/d4GVufq0Uo8iXV67pyO3TT6FsB3n5ji2K0t+zEhMwZSXZh4g7zE/yyJL
         uJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695805101; x=1696409901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZTi49m1tRqik4s4OIHpvu+DZ0pGT5ycjrh8hjwTA/U=;
        b=tud6gzjgdGatMdOjayF3y9k3bnkNB8TT4nVMvgHJqBD91XNXifx1PQSBTnsW4zbf0T
         3NRvoaaHxTTVYVoPZlX/4dgoIPjU6xLiEhdN0wG/9L9Thvyt3/55dA0YERLgfoC6quHF
         moILT5agYNWDdjicoWMbB6iEb7tBGjaMycmAJWabMQEuNkc/LTQKw1HL74w15TfU48o7
         H6DJuANwRxf7tyeThmo7KQLwSBB8LEpGGLW+KvP+KdYcZySDA3kjI6m9Sc5QKw9WqqDW
         h1YBKLQ2+PvhnczwUuRz9SZwEP2QF65P4/d7JKus7FernuUkEijSq99kC85MpnwS5xFy
         oMOg==
X-Gm-Message-State: AOJu0YwNjYZ1KGwCOAMR6zdSV5qpKGsIlaMPpheGOtfp7g1tejYVmzaw
	h/dVM4gQeZ0dFkgri2Xcnw0=
X-Google-Smtp-Source: AGHT+IFNIFoEp/iqGlH0vzf3/98sK4WLJfvo5ZvA9UZ3xKUBz6DBslOPOxQslranSCHUMX3oMfyKhQ==
X-Received: by 2002:a05:6870:46a5:b0:1dd:651a:7398 with SMTP id a37-20020a05687046a500b001dd651a7398mr1767181oap.2.1695805100614;
        Wed, 27 Sep 2023 01:58:20 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id v3-20020a056870e28300b001dcde628a6fsm1962325oad.42.2023.09.27.01.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:58:20 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	devicetree@vger.kernel.org,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	apatel@ventanamicro.com
Cc: Chen Wang <unicornxw@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Chen Wang <wangchen20@iscas.ac.cn>
Subject: [PATCH v3 01/11] riscv: Add SOPHGO SOC family Kconfig support
Date: Wed, 27 Sep 2023 16:58:12 +0800
Message-Id: <bfa07dce9eb268b312bd64059773acf055727f17.1695804418.git.unicornxw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695804418.git.unicornxw@gmail.com>
References: <cover.1695804418.git.unicornxw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_015821_670704_534C6BF5 
X-CRM114-Status: UNSURE (   9.45  )
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

The first SoC in the SOPHGO series is SG2042, which contains 64 RISC-V
cores.

Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Chao Wei <chao.wei@sophgo.com>
Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
Signed-off-by: Chen Wang <unicornxw@gmail.com>
---
 arch/riscv/Kconfig.socs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 6833d01e2e70..d4df7b5d0f16 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -22,6 +22,11 @@ config SOC_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	help
+	  This enables support for Sophgo SoC platform hardware.
+
 config ARCH_STARFIVE
 	def_bool SOC_STARFIVE
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
