Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8264DC433E5
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FD2E20782
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aLAV0gJ1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEzrVaDC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FD2E20782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sF90Y4V2gIkIGtYSBFk+3AvgujOzTKKt2mn84iEESmk=; b=aLAV0gJ1yVdAuenwLL5HcoAYl
	yLz1BWMmkBR9sqCN/WofQWMkf1JYhYGK/8kIXrLcuUyrthq4hnjYbK1iqboz/7MBbwhnacYv9qfu3
	R9U8qy6VZ7e68dA6dkhTlg6F9T9kg5HoilpjjEvsAzZyYbJ6JNTROYKzHJmvRZZdAZqXQuvi4z+4G
	wpsueHDJXvPcSQFgdIWLxQK2EHmBrzVXcrKvjva0r8T2wh5e+omr1o6Sp+xZCEcelvxysjI4drXLM
	/Ij2fEo3OPYwTpAZV4dFy3rb30KEiPsRL8OSp/335m1TzQmjJdGNHaqwFIS+9Fml9Ov/vNFGQGXz6
	QDl9Az4WA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAdr4-0000DL-1x; Tue, 25 Aug 2020 18:39:34 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAdr0-0000Ai-3j
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 18:39:31 +0000
Received: by mail-lj1-x244.google.com with SMTP id i10so15004005ljn.2
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 11:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RUac+/9yyHQ1kgUdabHOHD3/HPkoLaV5tOTxGGm31qM=;
 b=FEzrVaDCnJOKXmu9dyU4pj41GQEF+BHsSG5UwifT2A9zmYizoH2z6Xr5k9+D2ezQZx
 UkUVj89nM19my+cjr1JKnU3JZ3L370zt+Ze3gmGDlxOrhygbvJoyGm5q/7h81pOz+QMY
 MEBtDUpQSsvIK0UKpF1Dj5z5nwDlowM3Dl2FGGi2QJl7jaWwKaW2sS5+s+sbS229QUbS
 EQAMf5StbO1ob8AHawxYJ415rZqNjEjQisH8DGxoNp3TYCogvzm4viOFo9PM2ZzZ/HXY
 nhC/YBCMzhR/mrpUNtpIOZuh+xoqnF9i1WWiaFmW+oJ5AV2Mqw5i9zMbuBtLlmXe9g15
 NBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RUac+/9yyHQ1kgUdabHOHD3/HPkoLaV5tOTxGGm31qM=;
 b=eyyM1MVmUF7ZQo6m6T7sW+Md+2sYqAWyWpD5jsVmhj4bKfz0jxqAu0wD1q3JQWf8CA
 szKfBNn1uCaHwcSc1h/3tiOF1Z+TKg/Ep0IW8uVt7HlhgmX7r+fIAuh1seSa2dye7Z9v
 c6238P5pKyR1pUtU58M8mRho1kXsJc1VDX8GV9kiMqVpzmfKgvvcdgYmAZgclom7G04A
 u+biJe10BBYCoDsLuNCGEazIoShYkTtuapbnMRP0JosvTf7Ex6cQ6+rpawfX4V05Vx/s
 8V4kV9fX/AywG6bwiBevqBT4LcKUf68XNfmt13ir8XaKOUI21Bb9w7rscL7/NRgte3wI
 EXkQ==
X-Gm-Message-State: AOAM531vkcftbutDeTwiySBYzeB4WLg3FkBchuWbzUROly356r/2ol8R
 xbjR6cjBpnf1eHPuFHQAO1PkrCms37YO+Q==
X-Google-Smtp-Source: ABdhPJzn2SLmqmB4Rwc/GrTnBTMaavI9tzI2H8rmEiWqNnGLID/S4vxSZOwpqFL+SJpcyWesaE/qxQ==
X-Received: by 2002:a2e:5018:: with SMTP id e24mr5794038ljb.261.1598380768922; 
 Tue, 25 Aug 2020 11:39:28 -0700 (PDT)
Received: from nero.bb.dnainternet.fi
 (dyn9cmyyyyyyyyyyyyyft-3.rev.dnainternet.fi. [2001:14ba:2fa:2500::9])
 by smtp.gmail.com with ESMTPSA id e14sm3187120lfd.19.2020.08.25.11.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 11:39:28 -0700 (PDT)
From: Pekka Enberg <penberg@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 8/8] riscv/mm/fault: Move access error check to function
Date: Tue, 25 Aug 2020 21:39:07 +0300
Message-Id: <20200825183907.275950-9-penberg@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200825183907.275950-1-penberg@gmail.com>
References: <20200825183907.275950-1-penberg@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_143930_251380_FBC3B670 
X-CRM114-Status: GOOD (  13.48  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pekka Enberg <penberg@kernel.org>, palmer@dabbelt.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Pekka Enberg <penberg@kernel.org>

Move the access error check into a access_error() function to simplify
the control flow in do_page_fault().
---
 arch/riscv/mm/fault.c | 48 ++++++++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index bdc70d3d507f..a23eaf5ce95c 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -156,6 +156,30 @@ static void inline vmalloc_fault(struct pt_regs *regs, int code, unsigned long a
 	local_flush_tlb_page(addr);
 }
 
+static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
+{
+	switch (cause) {
+	case EXC_INST_PAGE_FAULT:
+		if (!(vma->vm_flags & VM_EXEC)) {
+			return true;
+		}
+		break;
+	case EXC_LOAD_PAGE_FAULT:
+		if (!(vma->vm_flags & VM_READ)) {
+			return true;
+		}
+		break;
+	case EXC_STORE_PAGE_FAULT:
+		if (!(vma->vm_flags & VM_WRITE)) {
+			return true;
+		}
+		break;
+	default:
+		panic("%s: unhandled cause %lu", __func__, cause);
+	}
+	return false;
+}
+
 /*
  * This routine handles page faults.  It determines the address and the
  * problem, and then passes it off to one of the appropriate routines.
@@ -236,27 +260,9 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 good_area:
 	code = SEGV_ACCERR;
 
-	switch (cause) {
-	case EXC_INST_PAGE_FAULT:
-		if (!(vma->vm_flags & VM_EXEC)) {
-			bad_area(regs, mm, code, addr);
-			return;
-		}
-		break;
-	case EXC_LOAD_PAGE_FAULT:
-		if (!(vma->vm_flags & VM_READ)) {
-			bad_area(regs, mm, code, addr);
-			return;
-		}
-		break;
-	case EXC_STORE_PAGE_FAULT:
-		if (!(vma->vm_flags & VM_WRITE)) {
-			bad_area(regs, mm, code, addr);
-			return;
-		}
-		break;
-	default:
-		panic("%s: unhandled cause %lu", __func__, cause);
+	if (unlikely(access_error(cause, vma))) {
+		bad_area(regs, mm, code, addr);
+		return;
 	}
 
 	/*
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
