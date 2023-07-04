Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA0FEB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 07:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2AqzPtYiAcT+JsmHbgq519sfrc5lnoTqJ64Y+17MlEE=; b=WN3cJyoW0C+VKZ
	9LZPknJPPFRA9cqq/x1W4e5yLcI3Zv3DvEm1FsRLyXe2p22zi+zw5kbV71nJP0+kINU8b0a7b9Rmz
	qBWVf2AFN77Rmnbeoky5cVUXMO3PMq31MSnEIF7T8IUbswohcsBIn7607hqVq5u+iujVvZn0IB8Ub
	uLaZCSnbgWZBZzk7fuk9LzSOa/YFIrD1HGzZbsh63skxydxcfEbQ1Mvi4xtjqyKvWDA04uW+4ZKde
	bHtR0KPhUnn0vMZDjeh6LI0wSnl6Hrcgk5PJz/RCDvbKmcFbJqm3WnQ6yS0OqPsA/psXV/AbWoGk0
	KVjx4aGNiYPcbTrOGxHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGahi-00CT32-2Z;
	Tue, 04 Jul 2023 07:44:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGahe-00CT1l-2o
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 07:44:04 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fa93d61d48so63097225e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 00:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688456640; x=1691048640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NaN7FLuvwVnpnxsPOCNUh4V539jNJliF9+H8DZcJ4YM=;
        b=UW+p9aqobog562ULP3FjwFIYW3w4oDw/L8bG6v3uAVk7Cgjoh9ylTtxrzwp0ioAakV
         SSd2Lq69ada7NGqCwOziqGEuQ4msC0QC0h2Pp30r3LgXqI7pwM4PUvdmQvjH5A6Rha6f
         BihFqeSFAM2bpNbzqU9jtLX2jxaC+LBSiajG5EiQbKg3KWCIzhEZJBmBSBMCITwZFUHF
         nIFOW0h+8qoFJOm7OA/JkmvHCJKlWgKzrAcXicREr52rqEpQKiHB35ySdtOOPlawua7+
         ZYotALMumf7cWbBsp2Szn29OyUpN0xzrm5rHtZjStkTUvz6zv3gSbQpgIAsDWx0qSbTC
         tj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688456640; x=1691048640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaN7FLuvwVnpnxsPOCNUh4V539jNJliF9+H8DZcJ4YM=;
        b=kT/1x7kk9B8n1PFlxhGR4dgsI+AgTOHRUd1krKvvQLJAHrnkhbBeZ7tFYxxQiv/WON
         Q/Zcx6DEy/ZKOJxm74zfztyrh+JuDdK3ntwXF7G8hm7n8aiSlotil1zSCnkuBRROe/Vd
         fgeBuAWlnnSgEp6PKrIS2NpxgiVGhvjNaHmE4Z/58A1ork4ZOlwKs+nhLfA/nreWe9s4
         o/KWt6rzHSgQRRoHcoXdfkTix/JyHJ0X6p3gxDddxczALA0I+AG8OrApqPGtuV+YKUCs
         ltnRed088QuMT84So7upopB3HLfED6bICMGputRQmdfSXqJqHhr1LhBf8lgxILiARasf
         EXSg==
X-Gm-Message-State: AC+VfDzVu8jQL+1XUCdWw5q1y64zwoCGvkITZmHE35SIBws3x35rRykF
	KTo9TeuT08jFuj0MFyWxaJMvDA==
X-Google-Smtp-Source: ACHHUZ6M+qhM9G8h9/aI0f5Bll9cIwjv/ArSQTrd/5+etwzEx2vSgFdmUVw+eICVPHbFMf4oxTQAHw==
X-Received: by 2002:a7b:cc82:0:b0:3fb:b008:2002 with SMTP id p2-20020a7bcc82000000b003fbb0082002mr10415933wma.0.1688456640324;
        Tue, 04 Jul 2023 00:44:00 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([93.23.105.195])
        by smtp.gmail.com with ESMTPSA id y5-20020a05600c364500b003fbc9d178a8sm10790933wmq.4.2023.07.04.00.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 00:43:59 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] riscv: Mark KASAN tmp* page tables variables as static
Date: Tue,  4 Jul 2023 09:43:56 +0200
Message-Id: <20230704074357.233982-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_004403_124038_DC231046 
X-CRM114-Status: UNSURE (   9.80  )
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

tmp_pg_dir, tmp_p4d and tmp_pud are only used in kasan_init.c so they
should be declared as static.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306282202.bODptiGE-lkp@intel.com/
Fixes: 96f9d4daf745 ("riscv: Rework kasan population functions")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/kasan_init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 8fc0efcf905c..b88914741f3d 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -23,9 +23,9 @@
  */
 
 extern pgd_t early_pg_dir[PTRS_PER_PGD];
-pgd_t tmp_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
-p4d_t tmp_p4d[PTRS_PER_P4D] __page_aligned_bss;
-pud_t tmp_pud[PTRS_PER_PUD] __page_aligned_bss;
+static pgd_t tmp_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
+static p4d_t tmp_p4d[PTRS_PER_P4D] __page_aligned_bss;
+static pud_t tmp_pud[PTRS_PER_PUD] __page_aligned_bss;
 
 static void __init kasan_populate_pte(pmd_t *pmd, unsigned long vaddr, unsigned long end)
 {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
