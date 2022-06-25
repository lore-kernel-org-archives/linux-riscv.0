Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41239C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jun 2022 15:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Umn/7FMxg88nAfGqhCEVttv1Qb8l6z99szpeXV3JDKk=; b=jFh9sh+LpTil/6
	3Qkc8hrZPrxb8XQ+zYxlYmImi5TrKE1TR+SUc9AIKAqoU9NhwujpFGiz4OqYXWraKDgH2s6GS9uQ3
	9KgTShPwePGVK9KsaZfxoUr/3dBh7i1mUjB6E3r4kpm3N7yUIfxVkXnGBBI2IMUhbmmXfHUXfhBeE
	s0Bj8/PHjwI+UVKE2UcaSt8pE7oPK5l9r6HPa//kWB6TJiGXNPUxT1DQW5aF1LTnVSqT6WrDuCkuY
	AQZQusE4s6cpRvFfA4vzh1eNNuMRryyGL3z6ir2Z6LvyFKl/DK4bVDNdOzITGoE8VsrbWkQeG+ift
	ZQyKEsAK9lRRKh53LIxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o57vQ-006ZfC-FP; Sat, 25 Jun 2022 15:42:20 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o57vO-006Zct-3N
	for linux-riscv@lists.infradead.org; Sat, 25 Jun 2022 15:42:19 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8F7A83FBD8
	for <linux-riscv@lists.infradead.org>; Sat, 25 Jun 2022 15:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1656171729;
	bh=F3RxS92s6HC7mDr70wELutMLarrjjf9M1klJ5znbLyM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=TKLRMG0FhfZIJiRDMYIl+EuxvQ8yx5PVYdKfSLkRY59YDBvv/ugL7plefeZYCudYt
	 itRawkly5Vm+qxJALV4EXDq2DLMESSJcRIhFyThNE/Y7rZYcT6gKzFgjWYyCkvlvbL
	 UpSGIVBoHnTq1hOzIR3VPiZe40uOAYHSKkrB9Q0DRCsw/vzTW/S/7nyD5WIa3bh+0l
	 UUTnAEfI4awL/CuSUqxilpFXAxFIF9B3Bp8p22rhSKs7jRz/Y+gi+A3FY5rlDQ062D
	 er+SfO7W5CVkB7QEP/+BES52tcVpoGMXKFsBd28TJLhErUDrWdEY83OoHrMcScDUQT
	 cDEAYO71LYH0w==
Received: by mail-ed1-f72.google.com with SMTP id y5-20020a056402358500b0043592ac3961so3974359edc.6
        for <linux-riscv@lists.infradead.org>; Sat, 25 Jun 2022 08:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F3RxS92s6HC7mDr70wELutMLarrjjf9M1klJ5znbLyM=;
        b=e2Ne9hSkRc3eyzcPyhWCG4Dx3iOkmZAIoyxmF0n2Q9Uutg0rwfUbm6OYaNYgDFVX24
         o7BDtFXnB0HTliA6zgYpXcTXv660Qq75prtIIa4YrRLCerBM2Lb49JRIkd/9SXvOZJWz
         mMox7Yyo7Vt5ltC39ivPheyw4UWvO0TNbG64ZXq15UxeA9un/AcBdy5mxTZD/c0rI0zj
         ovagWPOU51q2cXn3HLXibANKgag5PVWC6ekKKJPcjgWcAPpyZduINYgDpcacVUzA8EPH
         GfkGx6ji75p6zYVqvO0YzykbC3L8UJCbdupEXtM5RjCodTfI6g/2m8EJHivcmkHS5bd9
         da+g==
X-Gm-Message-State: AJIora9AP1r99FURFFSg2wW99t/yYsxSEggYGy7mtuNv0WFUp2vQacMr
	yOjLjnNfjlXPv3R0GdWavmohk3pk/DZeEDHd/qRoYuXkqIxPKlMUEOlimMeXDwYJb2PGOzhJmNG
	hVn2f79xFjgHLgbNv1xzhqMtl8mV1pYLScuP0p9nTiZwJoQ==
X-Received: by 2002:a17:907:97d1:b0:722:e6fc:a04 with SMTP id js17-20020a17090797d100b00722e6fc0a04mr4306660ejc.217.1656171728940;
        Sat, 25 Jun 2022 08:42:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uYGJDDSMNvYv5uR9pGeZx1Jsr335Pjv0f9MZFs+TktvMHV6apBD3ph5wMlh5CGZNyhkmfAdA==
X-Received: by 2002:a17:907:97d1:b0:722:e6fc:a04 with SMTP id js17-20020a17090797d100b00722e6fc0a04mr4306647ejc.217.1656171728790;
        Sat, 25 Jun 2022 08:42:08 -0700 (PDT)
Received: from archlinux.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id d18-20020a05640208d200b00435bfcad6d1sm4239439edz.74.2022.06.25.08.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 08:42:08 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org
Cc: Guo Ren <guoren@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: compat: vdso: Fix vdso_install target
Date: Sat, 25 Jun 2022 16:42:07 +0100
Message-Id: <20220625154207.80972-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_084218_316567_962C98E9 
X-CRM114-Status: GOOD (  10.05  )
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

When CONFIG_COMPAT=y the vdso_install target fails:

$ make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- vdso_install
  INSTALL vdso.so
make[1]: *** No rule to make target 'vdso_install'.  Stop.
make: *** [arch/riscv/Makefile:112: vdso_install] Error 2

The problem is that arch/riscv/kernel/compat_vdso/Makefile doesn't
have a vdso_install target, but instead calls it compat_vdso_install.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 34cf8a598617..5cfbef613e34 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -110,7 +110,7 @@ PHONY += vdso_install
 vdso_install:
 	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
 	$(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
-		$(build)=arch/riscv/kernel/compat_vdso $@)
+		$(build)=arch/riscv/kernel/compat_vdso compat_$@)
 
 ifeq ($(KBUILD_EXTMOD),)
 ifeq ($(CONFIG_MMU),y)
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
