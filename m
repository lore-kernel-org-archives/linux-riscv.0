Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7531EC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Mar 2022 08:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DK47oPIFtybjLvyVYcTL6TTllwL2rJTLUJsv0TJwuNY=; b=mm+p6B3yceV251
	rDu5miLxO4fFMHfVbtanLUwLSimFR7/za/VI0fJzNA0BQ43WWHzGV3CbBbcVbU0tuCfnXBOQOjrl5
	Crc72hDJd/ioKZKgXarj83nhC+5DbaqgaV/+h/iY60ytZPyTKRGZ9+oNamtzneQq+GxwHrr0HynQA
	g/RJnlIU/PasDPLP/xVlWplixfIwmbIZYVj3rM12A77xjGQ30atcTMLj5RpQsdZpGH5VD0RzegVtr
	YnHB1OudEc2vLrOLZQipChiII5XRE4Mmpl3+wZXsCkg7x9r6MhXfnJrCopBeGHWCUsWA9igpzYBQ0
	VVI8tY+PctpbEr8TaZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVqmB-004v0F-JY; Sun, 20 Mar 2022 08:18:59 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVqm8-004uzH-OK
 for linux-riscv@lists.infradead.org; Sun, 20 Mar 2022 08:18:58 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 mm17-20020a17090b359100b001c6da62a559so2251263pjb.3
 for <linux-riscv@lists.infradead.org>; Sun, 20 Mar 2022 01:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bZTlK/Bl88+jvg7euRJCR0++f1eoFemf2mpVTfihNXE=;
 b=DChlEfN5MJw+CFm9abAQAMev+aFzzLVXr0n7WQ6JvzpSpERkj0wUQQZ4/2EFjkwGIm
 1Mi3PxNF5hv2FFRNahxFS6s0pPSylgkx3j4T7QvAkJYpw8L83G0ULenWyZIfkye1h+Ln
 FpOCTBztz2ndUPS0jhmnMZsTKtz2k9ICoIJobYlTNaUiZveUBbEXmPr6dQeahxyosrHk
 Wc3nY1ApIR/PdIakksdVIXywTh1DYDlQeqh0fOLr/GEFFbw79SYmgSmFRYdqm/x14UmV
 mVc7Q0fvBeu3R4hEVcGn0XjlXlZWDDjTma2PMsORzi7AgI2g9Z/7Nhoa8ch5erPzTuF6
 kgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bZTlK/Bl88+jvg7euRJCR0++f1eoFemf2mpVTfihNXE=;
 b=rSRq8NrC4HWwgQQTUiEYgaeBISh0k+uvP1qGKuYODJNGnGnRwUv6Chih2M4WjxZsb0
 7ftL8c0eMtk6VuG2YZZvjg5PkFXeu3EbXewRCeLRiTwn4iT1aIkD6uKcracNG/wL94ec
 5Ktc5zKaLeAknAp3J+LshBMUI8NGkZU2chBDecuxGUdm+oIcCMsjKgf9U1c1F5ZEDExZ
 9wE9txkp1boGRCTR2IHBm1AMP8eWggtxtY+B3BNZLzZi9JyDmElj+SATQlTMbLknql3k
 5rBWUwleSwaPxGxL7qWOKjhBnZdEVOghF46lDs+MCdcm2MJkAglGtEJepOL9aG86SXBC
 uRFA==
X-Gm-Message-State: AOAM5319/G8Q3bMm2PBXvpmFHGcTXZ7RBm3SU0AlsijQAzqw/bZ7MfJb
 oksAz1GC3dm7EI1UhISv6H0=
X-Google-Smtp-Source: ABdhPJzQKDV1VuFHoGFiCY4nHH5I5fPsIlsorg2wnWzdj5GeKFEWEIBt9zXWxosu8/Jsbtez4UGN8w==
X-Received: by 2002:a17:902:7fc1:b0:150:1ae7:94c5 with SMTP id
 t1-20020a1709027fc100b001501ae794c5mr7264326plb.45.1647764335140; 
 Sun, 20 Mar 2022 01:18:55 -0700 (PDT)
Received: from ubuntu.mate (subs02-180-214-232-2.three.co.id. [180.214.232.2])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a638c42000000b003817671cb29sm11228639pgn.41.2022.03.20.01.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 01:18:54 -0700 (PDT)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: lkp@intel.com
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: kvm: copyright comment fix for vcpu_sbi.c
Date: Sun, 20 Mar 2022 15:18:10 +0700
Message-Id: <20220320081810.405589-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <202203130225.OBpOOQrW-lkp@intel.com>
References: <202203130225.OBpOOQrW-lkp@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_011856_849700_532CAA0C 
X-CRM114-Status: GOOD (  10.58  )
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

kernel test robot reports warning copyright comment warning for
arch/riscv/kvm/vcpu_sbi.c. Since the comment isn't for kernel-doc
consumption, fix the warning.

Fixes: dea8ee31a03927 ("RISC-V: KVM: Add SBI v0.1 support")
Link: https://lore.kernel.org/linux-doc/202203130225.OBpOOQrW-lkp@intel.com/
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Atish Patra <atish.patra@wdc.com>
Cc: linux-riscv@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 arch/riscv/kvm/vcpu_sbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index ebdcdbade9c652..2888cde02fddd0 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * Copyright (c) 2019 Western Digital Corporation or its affiliates.
  *
  * Authors:

base-commit: dea8ee31a039277576c215fffa13957970246366
-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
