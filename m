Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DE3C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:51:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7414B611F0
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7414B611F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgiTvvXiEKPD7+HvrTcwfiFMnuGCs5K/TYrueRpvepE=; b=zliD44Sc8/l/am
	YNtenIj42uySAwbClEeArfKfAoMK8D4alTfLmbguWdmVUNc963j/j6PZpuzMBV4fwAiR555Q3jTU1
	HAdVq6TgBYnL23X9C4viViwZfw15MCC8oER0sPyomeewTimbJu6pSs1aaH63O9nswg3a/duK8gngI
	al6JhKLXR9XNzBi0GMJCFdpD9exyJPt7LV0EzYOotu9VtPaQN+CIEy1stb2U8O9NJCmcdvObJTjnE
	q1Zr5b3Azz/j+uhivTTCOCcCt7TgeX+caXGzuC1spq+IIpsrHQwg8J50YGlhWe8E86U2Aip90/5sy
	J80EKn4yxhgEW+ReE7jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNmM-001KKt-ST; Tue, 09 Nov 2021 09:50:59 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNk5-001JST-PM
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:48:39 +0000
Received: by mail-pf1-x433.google.com with SMTP id g18so14196485pfk.5
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YpcZY/wok6Tm8gHdnpmkHhJcSgAyfMAyEx/8/I9XcUs=;
 b=mGhRu8rXvlsNA84eTFxwgWp9m4J1cKKFXXcfXNnU5SmA/pkHRGMEssXgsKzvqdOtDg
 AbmPPvpX0T1PWeOiulcDJTxnUxIycv4eP2lhi01SNVnXAI2kB4m4BgLpaq35HAoBSSvr
 IMcuDW9b4x6lGAFDFeH2vjsIYtCWj6aNEJibfUqHPgy7TAN9hOSHqlSs2r4dykj9Sc+b
 KTb9KXVFQ504U8s8dblYaCtb/EFmNJB6BPTjcgUcseDJdek1FI6cBiJcm4y+jGS4sMjA
 TlGXsEBao0qtmSocXSo1i25CEJR33YWZG15572i6x6Vs9yhEolrtXvQXMMaXF02kr+9j
 X2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YpcZY/wok6Tm8gHdnpmkHhJcSgAyfMAyEx/8/I9XcUs=;
 b=ubLlhL73LtmxfqSQcCCPj18xvl+mfJj2ujw8vUkLUFqrETHS8eyovv1IoRpWEXV+v6
 IURmmhZ581n/6f4okjC6sNwqmDdG74WR4Xdejqf/NSH/vCb4o1nYvaJZFsqOilnhGZt2
 0eUL0ahZdFTMsXGJ9hQFy+BEIXxYKodVB27j6LGiMSJxfg486E4CAiv8IKa48HK1Jf4o
 MxmvuORsvYC1LD42Q8Zy7YFLK1Ssj+K2/BaBCk5EoevNNvsfnXlynNC5jjTwtB3KLa/4
 OG3ZvbxW3Xz6GvduZBUUdLIRuXodnzpuUqkDbuc6Q2YOGgW+tNMtzVxi1eZAPnfYHiyp
 YHGQ==
X-Gm-Message-State: AOAM5315gbqXof2uOzrwkIh2erc5RhioWvDmBYIf0xWokuBazgYt4y9k
 z0bu6UWMSZ/FFK9uhFZWGiln+w==
X-Google-Smtp-Source: ABdhPJwYxHhoWKevx7Kz7vglYN8Vtc3KJug8o9ZQuEPuayY7jpZfqrWb3yV1tSEa/HNgEOaF2BR/7A==
X-Received: by 2002:a05:6a00:2405:b0:44c:1ec3:8dbe with SMTP id
 z5-20020a056a00240500b0044c1ec38dbemr6680157pfh.33.1636451317028; 
 Tue, 09 Nov 2021 01:48:37 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cv1sm1940511pjb.48.2021.11.09.01.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:48:36 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v9 03/17] riscv: Extending cpufeature.c to detect V-extension
Date: Tue,  9 Nov 2021 17:48:15 +0800
Message-Id: <802edef897b4bd40f3ebc2cb47c02b8e2f61a666.1636362169.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636362169.git.greentime.hu@sifive.com>
References: <cover.1636362169.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_014837_874734_8F8A412F 
X-CRM114-Status: UNSURE (   9.39  )
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

From: Guo Ren <ren_guo@c-sky.com>

Current cpufeature.c doesn't support detecting V-extension, because
"rv64" also contain a 'v' letter and we need to skip it.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/uapi/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index 46dc3f5ee99f..c52bb7bbbabe 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,5 +21,6 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d959d207a40d..7069e55335d0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -73,6 +73,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f'] = isa2hwcap['F'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d'] = isa2hwcap['D'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c'] = isa2hwcap['C'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['v'] = isa2hwcap['V'] = COMPAT_HWCAP_ISA_V;
 
 	elf_hwcap = 0;
 
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
