Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA60C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:46:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BB1661545
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BB1661545
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLt3/wKsK9PQnj7OqMRRExqgo9emYkjqLKoPMckJgWQ=; b=KWxHfS7Vtu3mvA
	jVr91NkvCGj+f41P3afvYpe8vljl82FByt+6S2/3q2H3OkTpP70X8UqgdtAERbm4IkE/rV6dng5Cn
	5EsOkPY2ho3vc8RdUhSmgKGCvH9X3d9VW3E0bZltISSDY0Ha4n8OkQSrirXm14HNHwSLFmrI5+t8I
	xiXEeh21+Zd0NM6bUjk94r/FlLojkDNAYFK+bVdt/fnPmJt9zm833fWewuO2hxWBXqTR0O+iVxeUO
	5/OPTE34pePCvhlBkVNYWrDGAnHFlHkUW98Q1v6DY66zN3JWMQGBm1EkphY0SXtaqtHH9GsVCx921
	2dSRuDwG6WyXq72woL0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo71O-00B6Lk-0A; Fri, 19 Nov 2021 16:45:54 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo70d-00B5q1-Gz
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 16:45:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id u17so8550360plg.9
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 08:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=QtaSSFMsqBIq8kJ2oNDlofo69jd6X8iaroIn8+5/lTM=;
 b=IpNlfu3x0dU6brOg5DNWCgBZ6IQQvWYdhM0507AuWCbi2OXvgJ3/FNqMM/cgIPwYqC
 MC5RSEA3OoF0pz0467PG4AvRFBcCz+AfZuKl3gC3+52fehypa/gySy93x3sSwKL3P1SM
 m6OB9PKLClcwxhyx/B8EhF66k6eMBvuT2/CDn+292P+PIb39RItlSffZFrwKopBmN8ac
 xVnkdNZHzLpUkTxVwXtcF1y/GUhptW5XXy1Qo0ZhMedSilzdRH5ItRsNg2rZZcKbuIEo
 ZsIk147WLEe2Jx93JwVbMu5ovSKypy38Oq4ywlZY7PbdlYWAj1Xv8FbAV62hCHYKpz6n
 pVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=QtaSSFMsqBIq8kJ2oNDlofo69jd6X8iaroIn8+5/lTM=;
 b=ZRJqD5jIHSB6fnkf0zsv0W68HOkbObLMfq+4oB26eJ68UgCDVesKUa9EW7xI+wAuvx
 UKyfACei3KqTmoB04wP7Csn7u5ET9g0Lj8b8Ieo3VTNrRLnRH0W4DatypIbQY5M/pl6u
 3EsEArSEamPKw5bBknDFXxbXy861ZknNYRyIjLzxs/qy6lJC1e8pVS+U6+t7ewnIOtt0
 uYD5wCQyLFmtxu/wEshTGixH6ft8zK3lPvUTXpFJEuqNkjA83+fdD7C1d5tUnjeRCgFQ
 8mz2D2Yqop/F26RMMIU0HwVIqXNBO/Fc2WgcK84rCGcS0Ah9jlZNClvh/pWE7djCSMTB
 pxCw==
X-Gm-Message-State: AOAM531DT9zVqNZgzbTolkWcIGBMs2zoJ/GpNYnTpxIEvTS3aOILfWEu
 3A9LSDRNkwkrWKCOaPewN25F3A==
X-Google-Smtp-Source: ABdhPJzam1HD0HGxNuDaeb2MJR9obhPXVMPUr0q5Y+mqSw/25JXA74d7shGTzIeWWNsFCvvqqEwzBQ==
X-Received: by 2002:a17:902:d2c1:b0:141:f710:922 with SMTP id
 n1-20020a170902d2c100b00141f7100922mr42315105plc.7.1637340306392; 
 Fri, 19 Nov 2021 08:45:06 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c2sm193607pfv.112.2021.11.19.08.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:45:05 -0800 (PST)
Subject: [PATCH 12/12] RISC-V: defconfigs: Remove redundant K210 DT source
Date: Fri, 19 Nov 2021 08:44:13 -0800
Message-Id: <20211119164413.29052-13-palmer@rivosinc.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211119164413.29052-1-palmer@rivosinc.com>
References: <20211119164413.29052-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup.patel@wdc.com, heinrich.schuchardt@canonical.com,
 atish.patra@wdc.com, 
 bin.meng@windriver.com, sagar.kadam@sifive.com, damien.lemoal@wdc.com,
 axboe@kernel.dk, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_084507_637424_D38E1128 
X-CRM114-Status: UNSURE (   9.03  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

The "k210_generic" DT has been the default in Kconfig since 7d96729a9e7
("riscv: Update Canaan Kendryte K210 device tree"), so drop it from the
defconfigs to avoid diff with savedefconfig.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/nommu_k210_defconfig        | 1 -
 arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 89ab76349ea8..e8ceab678e8b 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -29,7 +29,6 @@ CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 # CONFIG_MMU is not set
 CONFIG_SOC_CANAAN=y
-CONFIG_SOC_CANAAN_K210_DTB_SOURCE="k210_generic"
 CONFIG_MAXPHYSMEM_2GB=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index 84b87f8bfc8f..46aa3879f19c 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -21,7 +21,6 @@ CONFIG_EMBEDDED=y
 CONFIG_SLOB=y
 # CONFIG_MMU is not set
 CONFIG_SOC_CANAAN=y
-CONFIG_SOC_CANAAN_K210_DTB_SOURCE="k210_generic"
 CONFIG_MAXPHYSMEM_2GB=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
