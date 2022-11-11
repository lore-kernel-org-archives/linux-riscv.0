Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5905BC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 04:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2TCh+LcVf3fhuKW4peOgmxleL/1sVc0ts0GyvZu8g8=; b=xiOKmlz034tEUj
	EQqN0d0GMt1KQBn7vayKVJOWLmokhPvTOZ1uOU0I8v8tU3wbMiKOdUy1SR+exTrdoOhIEMNnRGIZt
	fMd8rs8groTxpgNTIhNzMp4MLCfrDl80XrXHRxLO0tQK6oFcu0rmjuaGP58DTWHdz45+0RaozA1YO
	xDXyFXAuKIVjPrI6od3OynQhDnrKnOTkiPNDC4eQGcwZI54HV6EH9003NmUZAeM5LuyPBd+eFQyKq
	b1O8+vJodJDGUhtFFfKEjYM54rZ1skgIL7ytZby37Awajre0ssvMMXJTXMZ5uI/dUeWgHonq1BUkm
	jyxv8hRvXB4yGmqlMSCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLsZ-00Cz1L-QH; Fri, 11 Nov 2022 04:42:59 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLsW-00Cz08-87
	for linux-riscv@lists.infradead.org; Fri, 11 Nov 2022 04:42:57 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-12c8312131fso4385149fac.4
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 20:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSr+LP3yV4OOZhD9NcYiTnkoNf9zOkOMx7sbT8NwJMQ=;
        b=EszwmvSgBsLo5au5Ol02Ed/IoaPq7iPdKrytiZj6Ucn91sWHFOpGKMYlMzshaC+j6q
         Z9WICNiRQGeucG6yMpxx3M3g4rv2BAkABuTIy/v+XePpDw9+4TCbk5RUQ6QipZ2DbzGK
         /zDyLPTVmlB8N0czRKK67hO0Z5O3iYLbOm7/eAldssQQhnFtSLcI/N3lnItLTvWeeY1I
         dnZJq/hr6IppN3IQGySZ0LKh9DREEX52BfvxeKwWgwsr4FaAIQlhfeOFmKQjZJE2jXuc
         6RkcJ5yVHUfdb6RKlTTB2y0S4NPJzkkOCiNKPDon7R0Ky6uZUE7tBVuBd5omdYndpxCN
         g/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSr+LP3yV4OOZhD9NcYiTnkoNf9zOkOMx7sbT8NwJMQ=;
        b=n3yRutdJzsU/ilAws9PZ/agcS6D0mAKI+zXfw92zgIBzWCDYqoHyj6rfDZl5MTOCMc
         YXYLYTuow1zK7qWVK00C1weVWD2nOiGHjVI2Icrt8YgzdBxjIbiVpBs/NTwwwJVPHza3
         yeaEM0IMc3bx8CEOw6UioXZcnbZFDgQHODUdH6I1i5wiK6VyDLM0BlwYkUhlTYgaRtks
         eHpUSxKliXcnhSd29ZDNwfdGlUh+d8luoqwYIyYXcXu5EFzSY6Ccz5z9awnLqyXCB68T
         uXeAJ6pULjnFKmCwaj+ZjVBBIPMIMTA3b84LMAvBiMyGc9a6R25hZDWrpiO8KjTEB6jQ
         mpPw==
X-Gm-Message-State: ACrzQf1Tsolw9a3IpKz3xWEWa7IiuN8OVaGMl/4YfpXf9w5qR2dQfhp9
	ymLRnLGKjBNjJ/XRQmOUUifj6w==
X-Google-Smtp-Source: AMsMyM7E/xFTeC7gRif0vGIlVkquafuqvQbuudYs11qdAfCksU0FyfFcA4mFdJB7FuPEyGVzV2Z1vA==
X-Received: by 2002:a05:6870:be03:b0:13b:5fff:1d84 with SMTP id ny3-20020a056870be0300b0013b5fff1d84mr2906288oab.190.1668141774762;
        Thu, 10 Nov 2022 20:42:54 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id k14-20020a056870350e00b0013d9bd4ad2esm787353oah.12.2022.11.10.20.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 20:42:54 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/9] RISC-V: Detect AIA CSRs from ISA string
Date: Fri, 11 Nov 2022 10:12:00 +0530
Message-Id: <20221111044207.1478350-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111044207.1478350-1-apatel@ventanamicro.com>
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_204256_315407_6FFF8381 
X-CRM114-Status: UNSURE (   9.46  )
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

We have two extension names for AIA ISA support: Smaia (M-mode AIA CSRs)
and Ssaia (S-mode AIA CSRs).

We extend the ISA string parsing to detect Smaia and Ssaia extensions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 8 ++++++++
 arch/riscv/kernel/cpu.c        | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b22525290073..06314220284f 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -59,9 +59,17 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_ZIHINTPAUSE,
 	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_SVINVAL,
+	RISCV_ISA_EXT_SSAIA,
+	RISCV_ISA_EXT_SMAIA,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
+#ifdef CONFIG_RISCV_M_MODE
+#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
+#else
+#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
+#endif
+
 /*
  * This enum represents the logical ID for each RISC-V ISA extension static
  * keys. We can use static key to optimize code path if some ISA extensions
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 852ecccd8920..3c84680c2289 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -138,6 +138,8 @@ device_initcall(riscv_cpuinfo_init);
  *    extensions by an underscore.
  */
 static struct riscv_isa_ext_data isa_ext_arr[] = {
+	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 694267d1fe81..e6d750d088ab 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -205,6 +205,8 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
+				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
+				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
