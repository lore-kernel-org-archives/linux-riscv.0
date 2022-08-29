Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4ECC0502C
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 12:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBewGTy4OM826OrlD8xL7kJmwzGN9N70oSvCyzqnMK0=; b=mNp7YVX8kSYlpM
	Bs86Cx8Up8p2yLHxSTyw3ZLkDaVteEiXy3TYdniD35XMeXHQAGc6tTI6y30Ly7OXiLRzer8iniGs1
	xJMM07n2qSLkvFC5j1r25brWQNbctmuI3I4UY56cYG4BNyJkPripRQrvyvVb9PguHHpBF0xuZHpV4
	cs9drsT/uyaKI4FNAyBI+Y1FT7xOo81iCIHw5ZlXjBUSafMO2/27WN5tMMOBSXJbnjohySEmlkVBq
	xj6ZVmCfsGJqNxzpebspWMPlmPinLE+wfQEl/Xjq2pvtnKvcu0TpSDdsM2hc/fbVxff5rwO9gfOTj
	PMyLlkvg50QpnGr+wPkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSeGN-009xYC-TG; Mon, 29 Aug 2022 12:53:12 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSeGK-009xO0-6U
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 12:53:09 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 202so7604076pgc.8
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 05:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Z/mBY2jgNDkWQ3lEWcoeCOwOWescKqJwUlwqGO5KuJY=;
        b=ZrXS+/PN7MjuqSu/+/xHyffxoijmukarDdtB/3TARKB7q3BLr1Vx7T/fs09i5kfugF
         IG3pbHjIj1TI+B5S/YOQM445Su0v1nateqtk6N7kYtOhsP3V5tr1fuC+doi9JHoSs3ip
         QKkcw0r9fSo7tD6i5+VV/UT9qzWyi4mPSrbcxqH2ufl8dvCiPGhUvpmgRKa6iB0pXDMj
         wPAwssvvOlhxuGtBoT0Z3eXyd53o0ZUdJUVSVQ3ClJse3sXsB0IY+smFNWvdap+CgkGt
         L4Tvs1C2aAVcXZTcyF1QbyeHX6DffONomhBO7oBimH0a3kUfzDwEM6K+5M6x7M5nKj6W
         gVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Z/mBY2jgNDkWQ3lEWcoeCOwOWescKqJwUlwqGO5KuJY=;
        b=nSX8ATUv52biw5p7wiXT5JfYkJIn/tDgiXF3tvkadlbx5nC3y0njleLznRGneUf56o
         oYt/ayllr/buT9MrTg5P+8TBgsufM5Ca3bb/bdBffOc4tkdl89V0tGKhZCfIq3pyepjC
         diAGa+udGTvwqveeyHiAEy6SpTMbz0ZV95zgHvqqM7j2mx5i5Zrkh3hZ8DqzIioiY/tF
         B+Sjf7yuwC5F2fjrhxRCzwxfqhIllbQ14pM2jit0Ea7BNKWv7VluxeQD9rREtFrx22jW
         SH2tx6ncObzm+jZzafoGmUEAG9eStdKxIxzGFSlsR5BgLGLGOONiBQAenhWDGtKpr/9B
         vDAA==
X-Gm-Message-State: ACgBeo0w9hc61d8SQ5D+Uw38fD/7BZd67Yd65KIGEygPr1pCuFWBYRcd
	JZba4q11jju1peqEIKyoqRIwYQ==
X-Google-Smtp-Source: AA6agR7EiSZno8PJhvukHxS/VfWScLMZXn5Vlfkr+Zp9Me2vZrYE8Ww3BqQJI+4eSdeYl9Ih2996hA==
X-Received: by 2002:a65:6d0b:0:b0:42a:19dc:e76e with SMTP id bf11-20020a656d0b000000b0042a19dce76emr13623850pgb.6.1661777587046;
        Mon, 29 Aug 2022 05:53:07 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.81.110])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ecc600b0016ed5266a5csm7517607plh.170.2022.08.29.05.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 05:53:06 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH 4/4] RISC-V: Enable PMEM drivers
Date: Mon, 29 Aug 2022 18:22:26 +0530
Message-Id: <20220829125226.511564-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829125226.511564-1-apatel@ventanamicro.com>
References: <20220829125226.511564-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_055308_402239_9E394ADA 
X-CRM114-Status: UNSURE (   7.14  )
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

We now have PMEM arch support available in RISC-V kernel so let us
enable relevant drivers in defconfig.

Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index aed332a9d4ea..010b673ebd11 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -159,6 +159,7 @@ CONFIG_VIRTIO_MMIO=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
+CONFIG_LIBNVDIMM=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
