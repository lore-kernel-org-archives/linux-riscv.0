Return-Path: <SRS0=ZKx/=K2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588B2C4708F
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 09:33:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15C776023C
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 09:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15C776023C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=96g6j9GpoPCDivjaxKQCksjvQFtyWxjSnYi/5jGKUWA=; b=u4zTDY+MhlJW+S
	ADTrR4jDd5ADy+fsrr0O2hKh55UCD9wFyQj+Eh608xZ4W+H6XMpmDq1hCnuQG+ch7QW0Yj4adCVV9
	GNTwO7FWUnC1U+aamOB3PUE7VIDLik2Rui3KWO2zpD+wW81d5FscC+DDnbfdxVTv58COjM2qfqM7P
	zq43boAIoHopnQFiNmneYFa3GeHBd/vK8NTDjTnHaZGehULJsXB9gr7pTguvpuk3gmt/WszgyilPw
	wFi/zl3Q6b9FxDCMGuPRy72FaG/RUvJ3LhKa8dL3TNdegmAEZnExl/B2SjySjsY6o4Q/mN0ev0fHb
	g+rrd8CJ8SzGycrV2CLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lneIZ-00BiLO-OP; Mon, 31 May 2021 09:33:27 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lneIW-00BiKn-Oh
 for linux-riscv@lists.infradead.org; Mon, 31 May 2021 09:33:26 +0000
Received: by mail-ej1-x633.google.com with SMTP id lz27so15687640ejb.11
 for <linux-riscv@lists.infradead.org>; Mon, 31 May 2021 02:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QlW4bYq81nyisrtrUVoWrmunmTjcyX7t4KAsIegw1/s=;
 b=aaR5VvNKN1f8jOfLwWTsdqvg4mcItM3sehGPrb2pHza8VQqjxIZNY6tsoeuVGTNfQM
 TvX9Miewoo6u33/cbwmKXg9oTTLFAexXvkOFne9m6zMy3/fVBQcgC2YW2B+8Xkvm+Eh0
 z+My42Z0p4WAUqAFm4zWiHcMuMbiZwUMBt6XE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QlW4bYq81nyisrtrUVoWrmunmTjcyX7t4KAsIegw1/s=;
 b=EHGOtdtMx9jSkvXxuQ/oxa+YEFB6DAsDceoroKGST0vEb5p6H0jF+45Oenn9HhqdLR
 obrTvUgzSMjXVhIz8DhGzJ2mn5G8mu0S4zOr/W3gWiDXCmCkkunXGC4zEZ+jalxXI2aa
 Ld1zfQMq/AvRAr9S8Y/4DA3J3XlNxZIT4aoSrgY11PdS3loMJ89hDGidlDzL60YsMIPk
 lOyeGatHi7yYhQBwHBwwiXjxsxBfkPtPdETr26nqfYH8UM2K5TFWjTpWnUtXayf+u3DU
 SLK22qgJfBoVOpjigEgtChKa3fGSYZqY2X6tIV2lVjdRONRn21r1JNOh+5DWWUS+0L+8
 ma7w==
X-Gm-Message-State: AOAM532TnA84gxyR6ITEwDkKzQqjGmTBvxWkJn+jIe28ateeygxpUcZP
 3zb82bkThduejdnvx2skp02gOTX6e78nhp5ihD8=
X-Google-Smtp-Source: ABdhPJzrQuPHSEyrK7AWt9DIXjaWovRyAoYMfuz6+ZqFf8eVx+fD51Fv07VK39X5VmTpuFKgEFtlww==
X-Received: by 2002:a17:906:ae91:: with SMTP id
 md17mr8539582ejb.433.1622453601886; 
 Mon, 31 May 2021 02:33:21 -0700 (PDT)
Received: from lootbox.konsulko.bg (lan.nucleusys.com. [92.247.61.126])
 by smtp.gmail.com with ESMTPSA id he37sm5529252ejc.61.2021.05.31.02.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 02:33:21 -0700 (PDT)
From: Vitaly Wool <vitaly.wool@konsulko.com>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>
Subject: [PATCH] riscv: alternative: fix typo in macro name
Date: Mon, 31 May 2021 12:33:10 +0300
Message-Id: <20210531093310.17848-1-vitaly.wool@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_023324_828547_96984C23 
X-CRM114-Status: UNSURE (   8.47  )
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

alternative-macros.h defines ALT_NEW_CONTENT in its assembly part
and ALT_NEW_CONSTENT in the C part. Most likely it is the latter
that is wrong.

Fixes: 6f4eea90465ad
	(riscv: Introduce alternative mechanism to apply errata solution)
Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
---
 arch/riscv/include/asm/alternative-macros.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 88c08705f64a..67406c376389 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -51,7 +51,7 @@
 	REG_ASM " " newlen "\n" \
 	".word " errata_id "\n"
 
-#define ALT_NEW_CONSTENT(vendor_id, errata_id, enable, new_c) \
+#define ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c) \
 	".if " __stringify(enable) " == 1\n"				\
 	".pushsection .alternative, \"a\"\n"				\
 	ALT_ENTRY("886b", "888f", __stringify(vendor_id), __stringify(errata_id), "889f - 888f") \
@@ -69,7 +69,7 @@
 	"886 :\n"	\
 	old_c "\n"	\
 	"887 :\n"	\
-	ALT_NEW_CONSTENT(vendor_id, errata_id, enable, new_c)
+	ALT_NEW_CONTENT(vendor_id, errata_id, enable, new_c)
 
 #define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k)	\
 	__ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, IS_ENABLED(CONFIG_k))
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
