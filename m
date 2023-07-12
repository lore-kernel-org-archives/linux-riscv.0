Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC59EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 11:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9+RIkFVxdLtSARFmmADt3IKt9ZwKqBsxeGDnUhJP2G8=; b=lF79qd59oiJmQw
	H79/8hPK2DkAYmrEM/LpOMtM8tIaAJ1FtkNx+tsMAVPXYqQ6LLlEUXsw9FY4eC4vfmuputY43d1YR
	YydBo73XMcDDs5VTuRFuUnf0vI97xXzKXWBg8xjo7kIsZQ2rZUDdMD/JwEGDr+maMGHrQM0QaW1Tk
	J0lK2c2ds9AMhrc6EHIfIWkiCwbY4bJZ9/g1TkLZ3EjbT3RYMigAp08yj1KHmPU17g9ciQA1/3zWg
	7VlLJChTaNLO//hM6Jl6H/YyoNLualFYiwQGehW1pqv5aEEQIl5e3432UM/7a5zEowf4RoPa440Ai
	bgCdN1z1Fc1Tb7qQK0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYTg-00HT4y-2p;
	Wed, 12 Jul 2023 11:57:52 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYTf-00HT4R-0N
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 11:57:52 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-666e916b880so3404052b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 04:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689163067; x=1691755067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oRloNku7QBs7+rRFTQTcTft39Fk9qqWwqKwoNHtqY6Y=;
        b=GXfTHOiFHimVzVMyq6dwDFjDSd2l+xRXuVvggA2r16bp1OoUTuadnvDEOCq2pxn9gK
         A+XzxKfJ6raDbyBFXGK1TCC0P2cNgoJtIrV1MEnflPjaYN9WqeOhv1lCQ6rrQ3dlFDaR
         lc67+wPX8acphX6x2hy+BYSXIl5JVoyG+EV8U4g//iNjoJS5GjhK/+Ev2i9z2nW9/5p6
         LJ/SNJ/1pbaar1wsUk7/YqU+YIbcEEaOkJu9xm/UNNrlwMj419ytSIIezE9OjcEswJI2
         Mqsff2yj9v9RSp/nhuz62nZ4dsV8owMiRnFgjR+fEHamOlFKyvv1mlFZMyCXyvk55dkq
         K5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689163067; x=1691755067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRloNku7QBs7+rRFTQTcTft39Fk9qqWwqKwoNHtqY6Y=;
        b=VGHlmed123yVcrX2gaS7jHNFVkqANahZGAz2XHIzRtnQhu1iV/F1kDahAsjjwxEiHb
         i24ftxhLgbkMjo8u+yAXvKtSQ5/IIo5MBuevWrl5b94L0QDKMQ6oMOdTmXfkoImGIf0t
         AiUYupi7YI/XGACAR9EfAVNxWlLT4Jqos74ngv7+OJSyD35K/avAWOKPe1gwPYCpV4qk
         peT0miWEN3NU65JIp2SbgWtP7dqq+gSZrJzn5x8EFm21c+9+wVMqZgjR9jrso89kdaOV
         rM0HpS/xIt9+ZtC8i8sk6y+QD39J+xdZZkPq+JRV2vVDFbYBDeL9+GI8/9PDQJWOeSu+
         M0rw==
X-Gm-Message-State: ABy/qLYDTyrcZAArG0MC9pLxtG4yPXrIw4o/+qsRuKY27ImBf1s54Fb/
	zKoE6JzdFg7kc66SMKWJ8hs=
X-Google-Smtp-Source: APBJJlEn1w7vlNNZvNj/9mgFOogZbrzCs+YZCTWMxvopFTpsoveDWfKTbwjCosOSn9r5qFc8VSdgyg==
X-Received: by 2002:a05:6a20:138c:b0:126:a5e3:3927 with SMTP id hn12-20020a056a20138c00b00126a5e33927mr12662680pzc.8.1689163067326;
        Wed, 12 Jul 2023 04:57:47 -0700 (PDT)
Received: from localhost.localdomain ([58.240.82.166])
        by smtp.gmail.com with ESMTPSA id ji19-20020a170903325300b001b7cbc5871csm3830336plb.53.2023.07.12.04.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 04:57:46 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	bjorn@rivosinc.com,
	suagrfillet@gmail.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] riscv: correct pt_level name via pgtable_l5/4_enabled
Date: Wed, 12 Jul 2023 19:57:40 +0800
Message-Id: <20230712115740.943324-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_045751_156508_6B7E574E 
X-CRM114-Status: GOOD (  10.87  )
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

The pt_level uses CONFIG_PGTABLE_LEVELS to display page table names.
But if page mode is downgraded from kernel cmdline or restricted by
the hardware in 64BIT, it will give a wrong name.

Like, using no4lvl for sv39, ptdump named the 1G-mapping as "PUD"
that should be "PGD":

0xffffffd840000000-0xffffffd900000000    0x00000000c0000000         3G PUD     D A G . . W R V

So select "P4D/PUD" or "PGD" via pgtable_l5/4_enabled to correct it.

Fixes: e8a62cc26ddf ("riscv: Implement sv48 support")
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
Changes since V1:
https://lore.kernel.org/linux-riscv/20230711105202.842408-1-suagrfillet@gmail.com/
- remove the reduntant #ifdef
- correct the Fixes tag and add Reviewed-by from Alex
---
 arch/riscv/mm/ptdump.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 20a9f991a6d7..e9090b38f811 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -384,6 +384,9 @@ static int __init ptdump_init(void)
 
 	kernel_ptd_info.base_addr = KERN_VIRT_START;
 
+	pg_level[1].name = pgtable_l5_enabled ? "P4D" : "PGD";
+	pg_level[2].name = pgtable_l4_enabled ? "PUD" : "PGD";
+
 	for (i = 0; i < ARRAY_SIZE(pg_level); i++)
 		for (j = 0; j < ARRAY_SIZE(pte_bits); j++)
 			pg_level[i].mask |= pte_bits[j].mask;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
