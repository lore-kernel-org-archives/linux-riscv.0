Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B08C83F15
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 16:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLcAi8awTk1Xp07X9LFbzvO1Y/ABVZislCSEKoDRfVs=; b=0Cbk0Yb9U4TGby
	DdkPj74IZJvHbuK5BsxLsxOJ156/mt2uuzfg6zGw7VlBJXSRjoNwLSpp54WR7Uj215yajd+p8VePU
	nqVTRF4ctCUujMizqq8FVg3reixaraHgbss4IG5niqcqbaymkAwglYESgPERwN37CaRB/6da2Dw7H
	D2aHQu1KuuwDr2RcDjoHF6h8GHqv2//6lETfgPOR47peQ8igemBbt0dKJ6oGA30zRlk8+cn9pSPuv
	MCpx/ahmsgoPPtK29dmeocjV3ntAiyCY1GRcASeLY4OAiz71nDmmMqTHcrkH7rBVGkAr+OER+/1cf
	Xrp8NO2Wdc23sCtnRtyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOOK-00DsX2-21;
	Wed, 30 Aug 2023 16:50:04 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOOF-00DsUy-0v
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 16:50:00 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31c7912416bso5250490f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 09:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693414197; x=1694018997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlmr8V99km/Hoi5nx3ewfSU7kEwD3RUO3/ugAU4gI/o=;
        b=Y4fL8NyEdRqEsd1cSHCCrSs2kHkFUXz7z0kTg6FzUtWK66DeqvC1uXs/kwl/U9UHBD
         N9PTbTLDgYW1oZs8QZ9+KfjG4xq14fVz7aB4q87qtB5Dli1P7/2tU3FhqlN1WB00wWtv
         lRVitKMlOL9G2JmcSdTq3mCzzxc1iboZ2GUUYpEsmIYGozVAbmYOJazQv6J63GhCZpXk
         Ioh9YGX7sODU61AaSQFC7NQ5xr+c86MbG+6nbRDjmLBy8ozOb/8kZfnplUk910o47mc6
         VBPDDrBMjzUPapEvsbCqsq9R8BFId/81iY71U7zZ7rYS85Yvr183F2zOxoa/ioPIdOJT
         0E+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693414197; x=1694018997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlmr8V99km/Hoi5nx3ewfSU7kEwD3RUO3/ugAU4gI/o=;
        b=EoZZToHXL2N65xer6YfFrGInh/qHwm5B8XBGdHgdhiInc2z5a2niwu2AuszOy4PUb1
         ZeewdM3N8z2g0e4RoX8gE+/m+k+eVTN1utw8cRBOBB8vDuJp9lK/hF2NBc21txLh80Ml
         hlt9/PPvXRtNivtq1S+pBvyxq1vzLlZD8wVnT3gYgV8OekWJM/DY1IT2U3uVml0d6Iwb
         HyezHxSODi0OG2+qo+TWL7jYDUmb+Z8Mw7OFZ/VIywLI2swZGtgsldW4JWEUK2v917fB
         Toi7dlWpciUqf72fYhBNqcFLhRT8ki/IydgDfd8M1oAM6+aQpn2sR/LwG2xgNbv/8JVk
         gg5Q==
X-Gm-Message-State: AOJu0YwKP/GUsmJhZyn+R+h04M2l8XRxJK4YWefHd4Bk632ss/tKW44O
	45p+5QY1Ap3YNBtw0q6EwpE6ODwO7zFq1vbs+QJJ1g==
X-Google-Smtp-Source: AGHT+IHVhG4JQtFMIZLEOAof90x1lUk91NsZKiWzx3D1g1/zLe0gBsDOLLRNRL51OcjPxbGZUSBsAw==
X-Received: by 2002:a5d:6888:0:b0:319:854f:7b02 with SMTP id h8-20020a5d6888000000b00319854f7b02mr2115507wru.51.1693414197436;
        Wed, 30 Aug 2023 09:49:57 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b003142c85fbcdsm17067069wrj.11.2023.08.30.09.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 09:49:57 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v2 1/6] RISC-V: Make zicbom/zicboz errors consistent
Date: Wed, 30 Aug 2023 18:49:56 +0200
Message-ID: <20230830164954.91987-9-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830164954.91987-8-ajones@ventanamicro.com>
References: <20230830164954.91987-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_094959_326921_30FB9CE0 
X-CRM114-Status: GOOD (  10.55  )
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

commit c818fea83de4 ("riscv: say disabling zicbom if no or bad
riscv,cbom-block-size found") improved the error messages for
zicbom but zicboz was missed since its patches were in flight
at the same time. Get 'em now.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index a8f66c015229..31843e9cc80c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -87,10 +87,10 @@ static bool riscv_isa_extension_check(int id)
 		return true;
 	case RISCV_ISA_EXT_ZICBOZ:
 		if (!riscv_cboz_block_size) {
-			pr_err("Zicboz detected in ISA string, but no cboz-block-size found\n");
+			pr_err("Zicboz detected in ISA string, disabling as no cboz-block-size found\n");
 			return false;
 		} else if (!is_power_of_2(riscv_cboz_block_size)) {
-			pr_err("cboz-block-size present, but is not a power-of-2\n");
+			pr_err("Zicboz disabled as cboz-block-size present, but is not a power-of-2\n");
 			return false;
 		}
 		return true;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
