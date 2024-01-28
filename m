Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8B0C47258
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jan 2024 12:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j5Q214srGFmST2A+2uwh604oZDgneFhnoMb/9+ue7R8=; b=fN64xfscR+nus/
	GE7knNUkYeKqUGVHo3BBM/pgwl4oTXu0vm2p1xFUiZj53AIhmSD+Ln5co0rIUPT7fLMb5HeioBEy9
	sxBHionZoKe6qstiS4zastJ8z1rqYR81vRh5i0fHFMheNOtTkYU2DJ7D0uEzVxlES9ZP2thisvGqH
	8AtiOJDV71MNZgnVVqqirF6G5voZpdGvGZXB1oNbWXoej2VhTVSnJUiz/E0Z6/KQWbYKSXKm3Qee5
	EXDH71WB/eO4rccmwgLPKzvlZGb2wVv0MNktT8eeFbcJO05kOAYT03CWVq44qalTG9p/79HWlS3x+
	ggeHnNJq4VbOGmXm/+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU3pQ-00000009NYX-3ZXh;
	Sun, 28 Jan 2024 12:00:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU3pM-00000009NXb-47oD
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jan 2024 11:59:59 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40e76626170so26760105e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 28 Jan 2024 03:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706443195; x=1707047995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iQXpMM6MssEsk2oLvh57e4djnu+gVgpIUXXI62pyybA=;
        b=iLyAbz4UBo2xKw3HJM/gywaY+5MEp3RFpsfmbaYzFPO8I7vkzPdLpIjElWWiQ3japM
         RRH8zkkCTw/7GuAD0XPdSPeaA5ipTeqQJuBkaTosWoJblhwhbr8sR6iHJMiuhEe/ZZC8
         oSf0DaERw56gjQtYedftQ3Pn6jMVGNtecXF23DtUZOelIWa6Lib5MjvAOuxB2LBH/PCz
         Je4fYcE4WffgN1IP/TcKEwF58MwbxuLmEudl/ppczboB2lPahSA2hHe/7za0DReIZbAT
         2r8sezc4lTEnbP5dg2uw6V+k5sbU2/K2Gc0on6GuPE12fD+i+FaBhHsThvHc5KbEQfb9
         zSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706443195; x=1707047995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQXpMM6MssEsk2oLvh57e4djnu+gVgpIUXXI62pyybA=;
        b=iJHExUiLFSaOeUJekOFpDRAcrbNMI55PswLRBj39PGeO5PSN+2ek0spq83xtGfXG9K
         vm56xTyg2+mqtNL/nQSum9kINA+DR6ns8b9bpdFgQPqVQofsHsBi0gWg2r8jZmmE36Nq
         JN/WVJ2f+kGmjST3M3y6wa0U85+eZDnknm4sUAWzBERIGIOccThoTy2kwwBabAN+0gw5
         to5QbHJH+hWe2SVrtAPWadrUXEOXAdkK7IGQUOMFakEv0vmZ/1c4UqGc8XkGEsDCEoSw
         Z+aTUHLUB+cLXQOLFgYdwyI2jv78azze/GVE04yOrbuDC8vnwYf4f02Vg2IPn4K9tGvY
         2RpQ==
X-Gm-Message-State: AOJu0Yx8VJa9y/P3K17vdws57xmdi/8uCunh9TBE/hnKo+AKAljbbsDZ
	XGRZ9XsethHbRkGg+hsX26q2TOMsrMH5e8VpxNGo34cl39o2U2nT8b4JvufusSY=
X-Google-Smtp-Source: AGHT+IGma6x2uAQftFRw+t34Rigv73YGbVESS515n/ezSqGLzQ60pjQMjIRMC7yGXXA7fqpMBZw0GQ==
X-Received: by 2002:a05:600c:19ce:b0:40e:f6f5:9398 with SMTP id u14-20020a05600c19ce00b0040ef6f59398mr6888wmq.24.1706443194612;
        Sun, 28 Jan 2024 03:59:54 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id q13-20020a05600c46cd00b0040e89ade84bsm11101843wmo.4.2024.01.28.03.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 03:59:54 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: Implement pte_accessible()
Date: Sun, 28 Jan 2024 12:59:53 +0100
Message-Id: <20240128115953.25085-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_035957_275961_D6C7B9ED 
X-CRM114-Status: UNSURE (   9.54  )
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

Like other architectures, a pte is accessible if it is present or if
there is a pending tlb flush and the pte is protnone (which could be the
case when a pte is downgraded to protnone before a flush tlb is
executed).

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 0c94260b5d0c..3b46677827f6 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -353,6 +353,19 @@ static inline int pte_present(pte_t pte)
 	return (pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROT_NONE));
 }
 
+#define pte_accessible pte_accessible
+static inline unsigned long pte_accessible(struct mm_struct *mm, pte_t a)
+{
+	if (pte_val(a) & _PAGE_PRESENT)
+		return true;
+
+	if ((pte_val(a) & _PAGE_PROT_NONE) &&
+	    atomic_read(&mm->tlb_flush_pending))
+		return true;
+
+	return false;
+}
+
 static inline int pte_none(pte_t pte)
 {
 	return (pte_val(pte) == 0);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
