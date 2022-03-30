Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F317C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Mar 2022 23:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odqoylJ3b1+s1Ce5j3/0qEgsEMBKPRi8md9qEMWMgR0=; b=n16aMN+K/6dptF
	Mxn3FgGiJQLIcKL1f+obyG5mJZiea/g2fHaJSEvA/gomuFWpV+2dqo9X1sO96oeO9x+Gg9LFuserM
	fBoy39lo2zd7GxM6/znDTdcMHFcwIl+4Z14sTnf1NM0ek05Br4H5onTi6g/k4nvzHWy9gJo39ohR5
	Hyx0fx1WjtGl9gUvcGTljUQsJSaa2n+A1v1XQ9y815a6+w4rFiMqo4BA9tCNVQhwI8oRytAAz/N9k
	ZvJXIig2IICEyDH8JYHmRzdAm5DiHib5hnu/NUoWq/KnpYIQZ2JnW7f8CDkGpTF//cSTAtVnvnS0l
	7UlQ1E3Z0Ee1NF9sXWdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZi3O-0007gg-Un; Wed, 30 Mar 2022 23:48:42 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZi3K-0007fR-A3
 for linux-riscv@lists.infradead.org; Wed, 30 Mar 2022 23:48:39 +0000
Received: by mail-pf1-x435.google.com with SMTP id s8so20294113pfk.12
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 16:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=uMi8FiJGdw1hSWyPivVKVtp/8/U1PGRylw+D5/i30Yc=;
 b=14gmg1klMYYePDa6VXo32RZDPb5C+8sMP6F4m/UFXM1qi6g+IvhztZfI+b5rYPg/qu
 WIGstSRYe1XuOwQx+KOmKRuCvedzLl3he43lysT1Lhw/LRpElOdwBFTwJFxekaoQtvbK
 0IvL/VN3azuobg7srm2NO5dWvvATE8Ef0R6dMEBXbTrSj54fHldTjiqDC17IqnORNIzc
 qV0lvUZkH/Sslz1W23g/ali1/5gvumNizW9hF7uWg2DYF3cKQ3cX28hjO7ChRr+VlCKz
 7Lv7I5r3CjXuiyOzgxM1RIg1OGxMC7i963+qCf+Xy9ViwSFeN3arbpkYOcZ7Lf0Ily/M
 FEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=uMi8FiJGdw1hSWyPivVKVtp/8/U1PGRylw+D5/i30Yc=;
 b=1aqgVsHdY12bGQO7AIJV931vsl02enHxiCvvtj+urMi8rFe772jF8iDMm8sjc2sPjO
 LGFRLn/VmOP/55mXma9szQuH7f2FkCm6QE4eYLufg1TL5Eb0pADvGSt+mM6jzOoDEBzC
 OzPyK+adHo9NO6gfAUQteVc+a6WQ9w7a19FpUrx7dxlzLs11klKCGXL8BY0ckbxmUtgf
 MwEzirg0UQTnSOR59eJlCdv9FGofznBsdCfcDvq51gDKDQo1+JLD/YoLbnbHKrLP2QqL
 /CtmwJcmRxx/gX/4Zf4mVqP0Z9ayp2VL00zeiYYOf87FRy4YiS/nYceVSzMZOq7sB94x
 cu7Q==
X-Gm-Message-State: AOAM530LeZi1krzOCdNlJz1eG+32Fkn6awu7ma44G4ijsX9mgGJVUsOs
 wXHB6DlX2umg1A+Gx8Gy3DfqBA==
X-Google-Smtp-Source: ABdhPJyBCUBpwiFEgy+YSHgNXEoiI9CiU1wc3B2s9DzUdnEP+7BnnP7cNSFHiO1jGdWv1Id9XE+W/w==
X-Received: by 2002:a63:e041:0:b0:381:1bac:ac85 with SMTP id
 n1-20020a63e041000000b003811bacac85mr8279847pgj.380.1648684117811; 
 Wed, 30 Mar 2022 16:48:37 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 g3-20020a17090a708300b001c7e8ae7637sm7495497pjk.8.2022.03.30.16.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 16:48:37 -0700 (PDT)
Subject: [PATCH 3/3] RISC-V: defconfigs: Re-order CONFIG_DEBUG_MISC
Date: Wed, 30 Mar 2022 16:47:39 -0700
Message-Id: <20220330234739.1956-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330234739.1956-1-palmer@rivosinc.com>
References: <20220330234739.1956-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup@brainfault.org, heinrich.schuchardt@canonical.com,
 atishp@atishpatra.org, 
 mchitale@ventanamicro.com, alexandre.ghiti@canonical.com,
 damien.lemoal@opensource.wdc.com, 
 axboe@kernel.dk, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_164838_370222_A7E42CD1 
X-CRM114-Status: GOOD (  11.31  )
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

This has no functional effect, but is suggested by savedefconfig.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/nommu_k210_defconfig        | 2 +-
 arch/riscv/configs/nommu_k210_sdcard_defconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
index 2438fa39f8ae..172eaa6b935c 100644
--- a/arch/riscv/configs/nommu_k210_defconfig
+++ b/arch/riscv/configs/nommu_k210_defconfig
@@ -80,9 +80,9 @@ CONFIG_LSM="[]"
 CONFIG_PRINTK_TIME=y
 # CONFIG_SYMBOLIC_ERRNAME is not set
 # CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_MISC is not set
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 # CONFIG_FRAME_POINTER is not set
-# CONFIG_DEBUG_MISC is not set
 CONFIG_PANIC_ON_OOPS=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_RCU_TRACE is not set
diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index 9a133e63ae5b..09794b1aebf8 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -77,9 +77,9 @@ CONFIG_LSM="[]"
 CONFIG_PRINTK_TIME=y
 # CONFIG_SYMBOLIC_ERRNAME is not set
 # CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_MISC is not set
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
 # CONFIG_FRAME_POINTER is not set
-# CONFIG_DEBUG_MISC is not set
 CONFIG_PANIC_ON_OOPS=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_RCU_TRACE is not set
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
