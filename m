Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5F0C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FF9C61B1E
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 16:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FF9C61B1E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vKKHx1ja+n4N378ipQROYwpo9yjTMoLGmqyOIlj44SU=; b=abWDPRZG/gSQYJ
	Vxo+bvSmMhe/CEEpOMZi48IhYmc4PkOvfVPg9cOatmNNOfagXfS4LzbHrMg6ey1iAlmbrmJJCjYGR
	mxQQ+IvdpSo2KxFMCvoxWJ/R7sdAkHJAs5GlNiy+JnFZeNsqo65gJI5BeGQQIj44h3hv9Ic1btq4P
	tFyxB1rqyIKaTUIbalZE9SyXn4xymzR6/8zN3knG6vkrNUb2Fwc84/erxekD8NzvatTfaz41pl346
	u/ZBpoNUluTGKdJTiK/mGP1F+WgOAmH/kFH0/M/bV7MgaxEfRM7zBhhq17rsUmvDZYLVubwx65ad5
	F/2Zgga3OC3FlyKKb4nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo70j-00B5ue-Jz; Fri, 19 Nov 2021 16:45:13 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo70W-00B5jj-AY
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 16:45:01 +0000
Received: by mail-pf1-x42f.google.com with SMTP id x5so9882857pfr.0
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 08:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=2p/KFqt/ZADbSAzTepwM8vdeVayJBy01ZQFHi24kNM4=;
 b=cXnJ0Mef1u3KUxfz8OHEsN9OmkwYgvnraNTsYjxJ3MKnYEEgXZ6tL8esNvtPN7wU1w
 eS3lCzYiXMSKF5+CIgCIVmeBCko/kXof2cYYqfacqIbcOXtyVQRBhykpy/U/s/ShQ998
 YX+OKMNiZMmmFvEMYuhLN1Z+JagtuSoH12V079RIVC+hdG2WtbYOOrbk7QAMp9WELrru
 U6UX6SLSX0TgO4F6G2W4uIrleo+0q5LzDSEmgb7GgCop8AK2agifKlfmSx3Snc0uaucB
 SLyMjykEZf5UPbXoqRFRtyKxa9Ag9kQ7XBG7cXl07O9jLpiPC4KqVN+nFcvyucJuclts
 xKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=2p/KFqt/ZADbSAzTepwM8vdeVayJBy01ZQFHi24kNM4=;
 b=nKkzJm6U0V5WahwaMrHTp1Awn7fOWNxSbz1j248BvK0irv3h94IMjs+7AcV9TTPxdd
 ZiEbomLe9mamG63qA4AXXZuPVU/NpQhyF84F78sff6PQ8o1U8MHnp1uam4PC1JRe9vl2
 XlMZjlxv+LwPFCQdy7XC1LrDazV+BlkTxMGla8o72PEzid0w/b7noOflgcgfJLz6tE3O
 QAK7EWpgfrfZ0C2ZMeF+RbciOMx/J7IvKlr1kX7SIvlb0DHz7FMdc4yJNmlax0vNxTab
 OpVnDHZdAUZ0j4s9Qb7iTHDTLwzQsz0MMVIO3Qkjx+S7V/X5Pd8HhY0RF1FT2ixR0tEL
 Vgng==
X-Gm-Message-State: AOAM5304K9MzvHHTJJyYz7Y2ZCbLVBbtrjjhci6+iShCYDZTUE1Px7BV
 GcafzZpdbVvBvpKZQnvrqvfJqg==
X-Google-Smtp-Source: ABdhPJz4LrUZWT0R8rNhNOefr57C60C60P7WGoXavFq81PH0cgQ01ztvYBneRGwD/QO2VStrNrY7+g==
X-Received: by 2002:a05:6a00:148d:b0:49f:def7:9cfe with SMTP id
 v13-20020a056a00148d00b0049fdef79cfemr24944991pfu.69.1637340299119; 
 Fri, 19 Nov 2021 08:44:59 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id lb4sm12657350pjb.18.2021.11.19.08.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:44:58 -0800 (PST)
Subject: [PATCH 06/12] RISC-V: defconfigs: Sort CONFIG_PTP_1588_CLOCK
Date: Fri, 19 Nov 2021 08:44:07 -0800
Message-Id: <20211119164413.29052-7-palmer@rivosinc.com>
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
X-CRM114-CacheID: sfid-20211119_084500_424997_412003BE 
X-CRM114-Status: GOOD (  10.64  )
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

This should have no functional change, it just sorts
CONFIG_PTP_1588_CLOCK the same way savedefconfig does.  This only
touches the rv64 defconfig because rv32_defconfig was already sorted
correctly.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 0f4fe5790fb5..fa9017c60b3d 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -71,9 +71,9 @@ CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
 CONFIG_SPI=y
 CONFIG_SPI_SIFIVE=y
+# CONFIG_PTP_1588_CLOCK is not set
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_SIFIVE=y
-# CONFIG_PTP_1588_CLOCK is not set
 CONFIG_POWER_RESET=y
 CONFIG_DRM=m
 CONFIG_DRM_RADEON=m
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
