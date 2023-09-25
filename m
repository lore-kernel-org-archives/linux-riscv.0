Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57191CE7A9A
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 15:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iI/5Ab1DjLlYPWZQ/S1RO3prM06YBvTUbHUjepB5Xiw=; b=ily8eEEL5KHm+p
	yARLUEzZsh648LMvFRK+9Vo2I719HZDaWVfKB0PbxRpTXxg5GEGbVyVFVf2hnjEfYc1AnIxZQWBra
	e9bCzZxqiqv3Nd4v5RQmp9S542Dpwcz5Jl/1qWizBNIqpF+jDZhMPejjf4rf5AQUOBhti5xTOIwiX
	Wf8EamubSkfA64TKPg5HdEjFEsllYgPrfN8s3WgdrqjUnVLHJjusqhWV+t6hNyzNWo8pyOjIWhIUA
	GdGjRwlbpB466cEH9g8GoN+f3Kzzow3CIFEM4m/ldbQFrAQUc4swFjAvOfJ4E84L5nd2oUTdP+fi5
	8fhPbA3V4yt+KRxonCZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qknRy-00EXmz-2k;
	Mon, 25 Sep 2023 15:24:42 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qknRw-00EXli-1Z
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 15:24:41 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c44a25bd0bso56519335ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 08:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695655477; x=1696260277; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ie0I8vPiPu7fWmL9QMaLa54dXoB+86VLEOUcIFiG3I=;
        b=gFlUJpRSZ4KG9udEIZkxQz7ZD0XJZf6DNYJrS0NaNbxj0ny5CQZFrFg8e2dwH6iupT
         dwGcgCqx3iWnGIaAo5I4fEl1aCKAxGDAVxY0h7Om3PzUJq3bhXrSFE46kWAQb7wqV/pV
         2B0c+kWnS0Hk70LbmSe0b4jPk0XzisD6eUutE68sFpugdkJY59G1t8/rczNZvoD/c3wh
         6VZIhxSIAUtXHXXUtbZ4uKGwaic0gCaM4ZM5v9/3Gd56oatylZvZcfvqlJucKRB/8sla
         H+wLmCzenUHXU1v2m7YAaZ4Js9SHVdhwnURIbSLbzb11lL1COmxrdKwgMBW4GHQ+GEv/
         9z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695655477; x=1696260277;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Ie0I8vPiPu7fWmL9QMaLa54dXoB+86VLEOUcIFiG3I=;
        b=CMdHWhkcawdC2ExegHVuX+poajiscXtIgrGPPOvW7xP8hKxbXKs5TRCPmeHB3pXq4O
         FjMd8mdjUALreQ4Sm1nRPEvXRKPR6bZbhrSK4JGXALlqOleEhfmy6Xx77OnxqEU4meyd
         7mRApEcdS80g+nrShfaxDIu80UEYFd5rDAuYCmIc6gNp3SXg7T7pBGNww2VZQO4DA7G0
         zHJ3h1mLIFdv8z+Y3mJpMamHT0aYlgu3sBd5DGGYH9y8OaCRwCGc+0T6ilyrxPTNrycn
         GfHhFniHIEMLFwnYOawonc8rCD3BLt2YBGd3UIPNjMrtIynN++i48ISQzYso49LMDrmX
         0F+g==
X-Gm-Message-State: AOJu0YxBBuAYZbt1FaVzsM9PVGw7ffT1uc6gjsQvgNG8D3EvKiRii0Lc
	zl7mHbKmqScoGJ9WyAdqhIUFDQ==
X-Google-Smtp-Source: AGHT+IGz114UixM1Ve8x2nN4BzbRTk8luqnv0RrFRU+P4huuqBhX2kxEzLfCN/zc/Jbs/bAy4mFJQQ==
X-Received: by 2002:a17:902:ab1a:b0:1c6:d0a:cf01 with SMTP id ik26-20020a170902ab1a00b001c60d0acf01mr5791024plb.11.1695655477424;
        Mon, 25 Sep 2023 08:24:37 -0700 (PDT)
Received: from localhost ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id c24-20020a170902b69800b001bb1f0605b2sm8940905pls.214.2023.09.25.08.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 08:24:36 -0700 (PDT)
Subject: [PATCH v3 2/2] riscv: correct pt_level name via pgtable_l5/4_enabled
Date: Mon, 25 Sep 2023 08:22:20 -0700
Message-ID: <20230925152409.29057-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925152409.29057-1-palmer@rivosinc.com>
References: <20230925152409.29057-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Song Shuai <suagrfillet@gmail.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
  stable@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_082440_531649_D2CF50D9 
X-CRM114-Status: GOOD (  11.00  )
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

From: Song Shuai <suagrfillet@gmail.com>

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
Link: https://lore.kernel.org/r/20230712115740.943324-1-suagrfillet@gmail.com
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20230830044129.11481-3-palmer@rivosinc.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
