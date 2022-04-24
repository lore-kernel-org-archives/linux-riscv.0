Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F57C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Apr 2022 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Nl4vgEY9lScPhr9qeFkczx6he+48x1lqbARsFTmmx4=; b=SNPPZHaK52k/yv
	rjDB6tUFF80parkmNpUuKdX+UVbLM+CB2s6OXa0KCykSBCOk1Pfxwl8n+i5deIQUjTcvomkqg1zpv
	efzxmi8AIGn0ty/CSlTa/WwjVpV7RXp9gebDvhltob3Q42pUN3mTKSdIxZTmu29QMrIc89KWinMbf
	9xwWj/OD+VvsVPEnISlypm4SDd419UGy83nQX1oLR0BNxuHXgKRIVqq7TM5Sssr85bF4btOUQrZQG
	zjQOhYuAufAFeYEydBpojaVTjKNNJW+bYOWyij4vDChnHV0C/Hws5UjVcPQO6aKnXZmUUiEdh6JCg
	SogiD3YqCG0VV2bLxPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niY8z-006DwI-Pk; Sun, 24 Apr 2022 09:03:01 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niY8s-006DtO-HZ
 for linux-riscv@lists.infradead.org; Sun, 24 Apr 2022 09:02:56 +0000
Received: by mail-pg1-x52c.google.com with SMTP id s137so10957221pgs.5
 for <linux-riscv@lists.infradead.org>; Sun, 24 Apr 2022 02:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OADGZ4NeVetsPyQBSO9mcsrSYQA5dVk/WxjpwpQYr7E=;
 b=P63OuIsw1QBfEOR4i1gSQNhmJ0s+U20+hj9/fzyXGIErYugQY0/5ZnsllWfBar8zad
 Fy2a4nk/ksuCtN1iu0qZdqnvKISe/AVOTIvOtF2ZPoddx6NEoIbmlCH2gBDOL50iWB9V
 ONqifUT4bsgqRdl3Kccwm8W/X+usw20rJOReqNDe4COEsxRyM/wEe9TbHcqdYhyrW+yt
 6vaY3qRPwz5ZKCUg7KlyLIWbccWrlhiQZSIlKrHmdM9jNDU9Lo2I6BngP20PdzEB2GMc
 QfK28hocZYinSl577NVvuwUW7OeAjAQ5OzBe3OHpc9dxvz9FgU/82oxRtmsW6XKv9SHi
 FhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OADGZ4NeVetsPyQBSO9mcsrSYQA5dVk/WxjpwpQYr7E=;
 b=7pKONh43P4z79DbSgcGvanzye8QOqKK1VoEO7Im2dwfa0p+5i8d7w03SjcP2EElOoD
 VHf/m2AoxAzwoDxk+Y80h4KkCqPo37akW9ZXQDGPT7EN7WYF5MrFwZoKfP1qS6K8dxlw
 4qQHtAloSVtDhpimJ+S4YabDk7o8nL34g5kUoRJMgMakURXmTy2eXKp+qB9ZEqX+QMky
 0v7f2dgJ8+ADB3dY7kfcSxtvxokGQqKXaiAK/gVGClbp6hFHAHYnmchMS4ZjpEDiUHvc
 yTNZjKkuNxMPJ96m8gnKd+8VuTQyQJRZ/+RT66cJLqqvyEq/Nsp10uwyx1d84RkvH/v4
 SMGA==
X-Gm-Message-State: AOAM532cgNLHbz9VNyis6mskmV2ICwCJ3cBEOwvh+sBVLFNk11Zr0ghE
 uXjX5DRv78mP69wl6VpF1ID6Wg==
X-Google-Smtp-Source: ABdhPJzzP6tpxoh8iHJ6wbjE8ikGZwX2D9MPuiH5sorHqBwHPu4anXGkelWwR6Ab4rTGOjo5SE3uPQ==
X-Received: by 2002:a65:4185:0:b0:399:4c59:e3b1 with SMTP id
 a5-20020a654185000000b003994c59e3b1mr10582311pgq.154.1650790972572; 
 Sun, 24 Apr 2022 02:02:52 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([122.169.86.15])
 by smtp.googlemail.com with ESMTPSA id
 n7-20020a17090a73c700b001d9682ad948sm628090pjk.0.2022.04.24.02.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 02:02:51 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org
Subject: [RFC PATCH v2 1/2] riscv: enum for svinval extension
Date: Sun, 24 Apr 2022 14:32:15 +0530
Message-Id: <20220424090216.21887-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220424090216.21887-1-mchitale@ventanamicro.com>
References: <20220424090216.21887-1-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_020255_337614_8BE7E126 
X-CRM114-Status: GOOD (  10.77  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Similar to the other ISA extensions, this patch enables
callers to check for the presence for the svinval extension.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpu.c        | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 0734e42f74f2..c58c7ddd8a2a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -52,6 +52,7 @@ extern unsigned long elf_hwcap;
  */
 enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
+	RISCV_ISA_EXT_SVINVAL,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ccb617791e56..62db19f88704 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -88,6 +88,7 @@ int riscv_of_parent_hartid(struct device_node *node)
  */
 static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1b2d42d7f589..febe744c7f29 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -192,6 +192,7 @@ void __init riscv_fill_hwcap(void)
 				set_bit(*ext - 'a', this_isa);
 			} else {
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
+				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
