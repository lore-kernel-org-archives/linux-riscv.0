Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2F4E732E3
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 15:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFrxuFEOU4rzzVVZD/ibe3/u5PHNZ97zV2VtN9ZHb+k=; b=lAjz2yrmWOMrNW
	jFz6kqk/9mTkE40b0oK02ThhZeN30wrnAq6d2B1+oDBJ5HTVPbDQZvZN+X2YbIkSR4cA5KyTL/QiI
	YOngBWPRDGc96NA+uzzJ3dtlktkcroJoVSgE6adcDRnjK5MCDqmNu9WRnusuh9lU96Nu6dnZI99ak
	JbKEVLeqQ5BedJC8fJkICcwAA5cbIcrDJju82aPrFaruV1dKFQwEhMD0aeTnCLfRSQ5b/dLTJXgBe
	8a4AMoaju68qNolPFYltXbwiM1EkS+/5gPio22bPFtEjF4Ck0C7O+OkVeWI3g2ZoS+bs9o69weS8e
	p+/U9awbV1JakoqOEnJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlso6-005NRB-11;
	Thu, 28 Sep 2023 15:20:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlso3-005NLx-0l
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 15:20:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso102961745e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 08:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695914395; x=1696519195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQIW28iugADvBEABL7y0pWJwukdro8ctMwfbqsan8LM=;
        b=yb1VluWukrHYdDoiwxvT+mvqGKH2B5+i+hyAWocIJtw142si3BCUcjWvdsm6zhXHxu
         9fIqSNGLxPLPB883LtCCjXNRvqm25M9ppaeUlvFG+NRMWWjUpnIoDAWMmZ/LKagGr4bK
         PPhKHv8ar2OXaHkwVG/cYzzXGIZtWQeiByk+bzoRO0TDpNs4Z1K9aB4p2eSzF9ifL80u
         zYdczZU1z0/PqAtJxoTGunZkYA7MD6TcfqJFYoFL367qlHvg215hPmS1t+mz87KSuLFY
         IKtY/zsRUmHDj1vE93gORVzYcn+8FygW61BLtfVtM7DvueEyNdt07+30SjwyrpeyyuGG
         SXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695914395; x=1696519195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQIW28iugADvBEABL7y0pWJwukdro8ctMwfbqsan8LM=;
        b=qBPkn4DcAUV7Lh209yFe2/IDPFfB8W4ZUtdhtDp07yqWa+vcXM3GF5Xdd1mvgXx3Xo
         0hqCwldgvSnlCYmkCMG00mDmCQ+wYlMHsbWO2i2nJrCtkadyvRZVo29k4md8t8mBp+8a
         7YEqhCOe6p9Y1yFLl+jRBXshiyvsREnaLtuiIGQiMs59g4BaKwKIWhpmTcZKLjtgtsMM
         /x7/WH59j57fBJpVTLzaH2312cYmL77CyAMNFohZivCp1ZEI1hub8jx21FDz84FE7+zm
         /SCxuLW2tYEj8P0Frag7AmzVeOPfR6x+EqoPvAWUNf5frvvxciZfcjCruya6RBRONJ9C
         opbg==
X-Gm-Message-State: AOJu0YzwYrzVfiELjYug9vjBFQtzqXNy4FIu+e2kHKSt7gxF0U1qK50d
	BoPiLyureddSC8IKBsDSOTm6Jw==
X-Google-Smtp-Source: AGHT+IEDhPiD3spqKlIFdXrJWeBlpdxdjvj34bobPi9FQk5MmYA/SlcbPlLXpJTTuzWJ13sPk2CNtA==
X-Received: by 2002:adf:eb47:0:b0:31f:e2b9:de1f with SMTP id u7-20020adfeb47000000b0031fe2b9de1fmr1247149wrn.24.1695914395323;
        Thu, 28 Sep 2023 08:19:55 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2a02:8440:4541:1a11:c4e7:d9ee:586b:e201])
        by smtp.gmail.com with ESMTPSA id t6-20020a5d6906000000b00321773bb933sm950874wru.77.2023.09.28.08.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 08:19:54 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes 1/2] riscv: Handle VM_FAULT_[HWPOISON|HWPOISON_LARGE] faults instead of panicking
Date: Thu, 28 Sep 2023 17:18:45 +0200
Message-Id: <20230928151846.8229-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928151846.8229-1-alexghiti@rivosinc.com>
References: <20230928151846.8229-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_081959_287999_5C7BA7E3 
X-CRM114-Status: GOOD (  10.46  )
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

We used to panic when such faults were encountered but we should handle
those faults gracefully for userspace by sending a SIGBUS to the process,
like most architectures do.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/fault.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 6115d7514972..90d4ba36d1d0 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -72,7 +72,7 @@ static inline void mm_fault_error(struct pt_regs *regs, unsigned long addr, vm_f
 		}
 		pagefault_out_of_memory();
 		return;
-	} else if (fault & VM_FAULT_SIGBUS) {
+	} else if (fault & (VM_FAULT_SIGBUS | VM_FAULT_HWPOISON | VM_FAULT_HWPOISON_LARGE)) {
 		/* Kernel mode? Handle exceptions or die */
 		if (!user_mode(regs)) {
 			no_context(regs, addr);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
