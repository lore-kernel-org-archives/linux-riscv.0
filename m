Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B40CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 22:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AjWcSF1JJRD92zj9vJYAy2XDQZaA+XIefJ2sQtokwI0=; b=kkzrmNZT6yAVJL
	skRElT64VCnkpLaEJ2S24ow4jKNI+HH5w/gdOoyCQxAOdX5UQvCmNKuWT2C15ui2lJ4RbVEb4YQvz
	Jhjo8DA8/Jt57qW6lWK5AQzj73Zi19OQRnow6dPBBmk8ZGHHEsQ/MXFb8iEmfvSxKc89YLvHpji+x
	YraF8LEPgSlVDtInJAxeeu99Cm1YgTOXP/uVpoYl/6aqFQBUQ84cuFfOx8O7qIcEX6cevlG2b824a
	gUcKQHunM8N8jYXoEdFzXttAKm80Cus65hqJC27CKeNYcksjgY78lBZUbyn/mfsFLZFAdkplaHwXP
	G0bcJ0igdrEmL2wwnYaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8UFl-000GIf-Dn; Thu, 22 Dec 2022 22:41:29 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8UFQ-000G3e-1c
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 22:41:10 +0000
Received: by mail-pg1-x52b.google.com with SMTP id e190so2218728pgc.9
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 14:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SBGdHOhoY5Jv0iqOaJqNuYCDNa4x5g+RkNNsqE54HN4=;
        b=YsI+xSj64siyBDiJDoQaRXG2GEubKdNEC3BVutPFmTeKVXc/gVeE0QdtLrK1FOt4EM
         wEhbUQhcVhF/TocvrBC1WRidZIuKHcSAYKgTA+3aosUZ9PCQ0TzaCWJAkjJM48P+eyDY
         AB3ku7A36FSoC+MXi0h80wuRkC0UAwxyV4N8xub6aQAPaEbNJBeVZWX8Hq65cr/SoG3P
         aUWGgCiypSTom9vmWb4EnjiUZse0tzcf3HuL7WmWzEhK3jMBPlS2k4v8PyOU2uoAcfkn
         hmMFOHQdsFvDIUgjYYMiaKW03iec6WPEUufWC2hBSpMtRjzBSnpRPS6nbq4WOs9SyH4h
         Rvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBGdHOhoY5Jv0iqOaJqNuYCDNa4x5g+RkNNsqE54HN4=;
        b=QD4FEHx3ao1QTtqenwFAyM3AGWUR2JzBm0evt0TgcNLdu2VKZxewVX6pzZ9a01iEHS
         ywFY3iZYZK/RZ9gw+9lZD48Pqxj0VCEQrzZo/0BeAyHwI9iiyZwPHkFKPh0okEtSsyuu
         agC70YaBbDS6Z4elYliRSmNyvruArCId3AMF7w8thGYehcicf9DrGDo0mSl7BjN39BD7
         xEvqEY0B2F+6EDb9R6XnxyroyUKr2B5/z/aSf/bb9Nhi/8cluxCV/V7uniiNi03RQQBI
         ceFsHyqcobWkUQaQLNvvjtbCesA9Axaah83KoV/4XOgMb3OrVo2DZwJBLr9vLUHF0Phy
         h1tQ==
X-Gm-Message-State: AFqh2kqzOxfE6+Hp7wqqVS6sE2iQ82Zb15YPhKnUfghr3hoJrhwQQnJG
	/Bzg2DJBb2D0svifIbtee3PAQc3XDLnnS+CT
X-Google-Smtp-Source: AMrXdXt4HDdXJaxp8x9kXdiQSzD4Hutq6cE52NonB1+PJ/bivHMpvjTvApZ3ljFaeTjLixIY5F8eXA==
X-Received: by 2002:a62:1511:0:b0:577:ad:49c5 with SMTP id 17-20020a621511000000b0057700ad49c5mr7223545pfv.9.1671748866689;
        Thu, 22 Dec 2022 14:41:06 -0800 (PST)
Received: from vineet-framework.ba.rivosinc.com (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id l190-20020a6225c7000000b005771d583893sm1231132pfl.96.2022.12.22.14.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 14:41:06 -0800 (PST)
From: Vineet Gupta <vineetg@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: linux@rivosinc.com,
	Vineet Gupta <vineetg@rivosinc.com>
Subject: [PATCH] riscv: add base extensions to enum riscv_isa_ext_id
Date: Thu, 22 Dec 2022 14:41:04 -0800
Message-Id: <20221222224104.3449841-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_144108_347046_62B5EEF6 
X-CRM114-Status: UNSURE (   7.08  )
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

This allows for using the enum in general to refer to any extension.

Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b22525290073..b861e711e3ac 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -26,16 +26,6 @@ enum {
 
 extern unsigned long elf_hwcap;
 
-#define RISCV_ISA_EXT_a		('a' - 'a')
-#define RISCV_ISA_EXT_c		('c' - 'a')
-#define RISCV_ISA_EXT_d		('d' - 'a')
-#define RISCV_ISA_EXT_f		('f' - 'a')
-#define RISCV_ISA_EXT_h		('h' - 'a')
-#define RISCV_ISA_EXT_i		('i' - 'a')
-#define RISCV_ISA_EXT_m		('m' - 'a')
-#define RISCV_ISA_EXT_s		('s' - 'a')
-#define RISCV_ISA_EXT_u		('u' - 'a')
-
 /*
  * Increse this to higher value as kernel support more ISA extensions.
  */
@@ -53,6 +43,15 @@ extern unsigned long elf_hwcap;
  * available logical extension id.
  */
 enum riscv_isa_ext_id {
+	RISCV_ISA_EXT_a = ('a' - 'a'),
+	RISCV_ISA_EXT_c = ('c' - 'a'),
+	RISCV_ISA_EXT_d = ('d' - 'a'),
+	RISCV_ISA_EXT_f = ('f' - 'a'),
+	RISCV_ISA_EXT_h = ('h' - 'a'),
+	RISCV_ISA_EXT_i = ('i' - 'a'),
+	RISCV_ISA_EXT_m = ('m' - 'a'),
+	RISCV_ISA_EXT_s = ('s' - 'a'),
+	RISCV_ISA_EXT_u = ('u' - 'a'),
 	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
 	RISCV_ISA_EXT_SVPBMT,
 	RISCV_ISA_EXT_ZICBOM,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
