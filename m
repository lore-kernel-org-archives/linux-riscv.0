Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541BBC433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 06:15:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EA8E20760
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 06:15:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ucVtAGby";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="al9N3pH2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EA8E20760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3ZjNKuX95AxRQUlcqODQBKoHNvQMIyRLbQenbEpbsGY=; b=ucVtAGbyMUlPXwyAoDCHfnljh
	ulx7o+CE/zcz5abUNiIbagz/snh+cYV0nwaWDHhLjk2n+nrKTtFmG6P5C6sDKZUQDNm5Wp5vRQH3V
	zvTkWufDffeUAltN7UXTGiUsdG7wuqHJ/gUyxZJxTwzRJf26Bj/YjmIiegIei2rVC/v/AtHnb2jOo
	s6V2dDWPdvu50R/H9kgpP7MFbHgfE3ltlcDQUEKF8hDPw1PWKHpZkpTGtUPKiM628pAA+Djr2AfLs
	DToKswBxWlvwuGQVV+E/nxMhznvcu60sBzDmbR4QA6c6MKOCBeZeKUcGEW1G91XbjCzwtUWG6Q4jx
	dxlj2C8sA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvxBF-0005wz-E2; Thu, 16 Jul 2020 06:15:41 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvxBB-0005uD-09
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 06:15:37 +0000
Received: by mail-pj1-x1041.google.com with SMTP id f16so4150275pjt.0
 for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2020 23:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NH8aoxyeroB9r2QCUkJbzC8njwuGOl2txaaxtAHbw8Y=;
 b=al9N3pH2qFvWwSBc8W/ztrqzKd8bd1pyR+1d1oVXLKb49o52h5gNdw9FNyFPExLy0C
 Wfftfu7vRuEfQNU83Zw+n370ONmwthk2AIMqzgMjgOiOqKHirErJOc6nY9kgSSI82mDi
 CXbWLS/zhRxRh1jnPa8B4fG5mMSZWcg3idp+CiJsDQGP50k9FUCZbzbDstw1L9PrxoQh
 h2zGbKTWGiEh8KdRIeCZ5MziDD8BEzW1O9cPCsnwQIO47UOE+N9qjSKuRnoVhN79zC0F
 3jp//s+xZ4R5E/hZX+N65zfCjVDcPySj11v+cR0aoeGksyu2p+F6MMpy3NW5yQdgYP9a
 HBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NH8aoxyeroB9r2QCUkJbzC8njwuGOl2txaaxtAHbw8Y=;
 b=rVAAHY23YxRKQImknv1qSFPTLi9o6yhtG7tutSQ99NDd+XeI3qgk1PAntIOBtaj+Mq
 ty4fNrMhiaAeNx7oQdHleeJK5exMnGiYLuEf1lZ/7KohWfj+dvM+k65Fo0rnCPlXxrTe
 +YhDIpDtn1YM1iwhd3fR+poBCksEJyKG9Rp+b2zjdlT+2vJLCsLZVpzfWySjnJTMpGKe
 FZn5eR0Nh0XfExnKnd6Mc3Vodsao8HcNRldSXsao6/LLZPvHnnbIZMvzknXlS71ABL8Y
 tKarf4ppXkIOR2zZVP3PUa6chv9N9Hlvv47Z3BNwqgWRwRFhK/WQ3DDa5NTNQO/xFc4y
 CaGA==
X-Gm-Message-State: AOAM532QHtT7X+6nQfxRlYIL314khZT6MpE0u3HqDiguw9tRHNbSdvDX
 cDSGK9Dmo/x6dHGbmLaP76W+cg==
X-Google-Smtp-Source: ABdhPJzleHvggTpz3JiVT7FG0OtQVvIPyv7xwLfn4i023ZwXgV+KjpcGGIOtQaCuKqOKSR3mKS+2/A==
X-Received: by 2002:a17:90a:1acc:: with SMTP id
 p70mr3456925pjp.210.1594880133577; 
 Wed, 15 Jul 2020 23:15:33 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id w20sm3669904pfn.44.2020.07.15.23.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 23:15:33 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: Fix build warning for mm/init
Date: Thu, 16 Jul 2020 14:15:26 +0800
Message-Id: <0ce0ae99b9af776497bce02f9ee1efb85797ce9f.1594880014.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1594880014.git.zong.li@sifive.com>
References: <cover.1594880014.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_021537_057762_576E6C2B 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add static keyword for resource_init, this function is only used in this
object file.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 92002952c621..66f5952f39c0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -517,7 +517,7 @@ void mark_rodata_ro(void)
 }
 #endif
 
-void __init resource_init(void)
+static void __init resource_init(void)
 {
 	struct memblock_region *region;
 
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
