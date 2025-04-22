Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1C5C369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 09:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UoO2IT4mZHbMe7My5wNJ14Re96RYKcDq5oluxthYh8s=; b=ts8zDeDmgVzQs1
	P9ilvbtmGWSeOcM4NTd6QMJGYcv6FaL2e3cmsvqw6fgvPXvCEAqVeAOmt/g8IPalLxEFUDNh+gwFX
	ROWiWQ4Z8qWxbR5cENR+NQnh1wej9XTXr/qQLsFHb8pwtOvOWTtI4QpveOeKuATf/YvrqXC+cvqTT
	xUQIQa39usjlJpepb/qZ5criF5KA5sV3kWexD4HSMpwVbgDECn+Bx67HP7RHOXxtlOLgSUtDXAcKO
	b99U2it552hZ5UHgUQVDEyb/zEhALMTvyNKdNTE0Xj7HIt29vWPauRv56cHUkv510VbllJg9DyKQ+
	/pPwM9nHrCBPFgpCAkUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79VS-00000006TD8-1t4v;
	Tue, 22 Apr 2025 09:01:30 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78yM-00000006J2i-3mNn
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 08:27:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso41594505e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745310437; x=1745915237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2nnnGh2oXeC0IbaXY+fafQ44YKw6BKWItIZxE22UTc=;
        b=YIswWcphALumu/9UWgwGc39defr2P3+VLjNVw0RBxnzfE3ibWHXmEWT7QlL3jgBB1p
         0aWS9DbRw0knYIfqbrmD3wARiV+h268pqMQhIM7bo3NMvkHbyjS4xQmWnEHpFtqipnZQ
         0I5ufhWQ1lr2O2x2CvBnnmOJ9F4xmd2U51KMBUUXCQY2Bds2LV+u482Hj8qe9nvrjmXo
         4otPedZ+ChHPa5QqphY0NyQ3/04Z30PPKz+JZS9bT5Im5xEbYWGwAMo7/xqnPfi5ZGOB
         IKWWKL8XCsM4ULlI9rUrQavFPKpwrOgvjW0iQeOyMsddA3cXYwVijvPgD5G3DMQhXrMG
         M75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310437; x=1745915237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2nnnGh2oXeC0IbaXY+fafQ44YKw6BKWItIZxE22UTc=;
        b=SEuJx3+MInAetynCrKO24IaMUNRbpJrSU/0bnQ4Tbix8/iYb5vqs68FiOPQZbRPtGU
         FkgUjupPUe95XxFqrJbqsEeIrvZPXPACkY6UDi3XbUHsIx6NnsK6FAy0ueerM/N0iqCb
         YoA5KBRRZVXyWtKV9B9+iIxFT6FH0rGDdW5H+idPknL+KfiknZ4EvGTVbXRnt4Mdilw7
         2I2s77ckEXuk3zLtsuqmv8327hGV+U4IyWULqNmuLa2zZ+hXbU9s3klBM6jf9XmbpqfV
         2KohYTynpdjXUd5rBu46c1Y/ANdTSWTuDd322RLie47KdTYlJ3wRBN/BLSZEB3iedgKA
         Kg8A==
X-Forwarded-Encrypted: i=1; AJvYcCVJHXI5SowWL8ZwtDOtPVgBQGGnaNuL2KKK6dzwlSA/khBWYxKjUiZJ+dgpQ3pE2FKvC/P5BI7idd8jug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2aJHXApxAW7lURApKM0Ext1LNFeda1wIxaVKlFDr79+C7hSEo
	qVd+OlDi0gSr/RyZi6DWha75sE6A811TcB6RCTw6CzC4UX+saJ+68Nn1ZdoKnPd+GznMy0e4UqU
	G
X-Gm-Gg: ASbGnctqmmMAgC+wqQCeJz65YZXHDVD32JR1bjQxpLED5eVnAyIQFmBpyKYSeMVz8Wr
	dk+N3lyWYATMsFX7KvAzv8Zkp19pYzMLNR7O5WBTTGCPyhMY5l+LjpR/cFEad8fODqoqLAwLmYy
	fPrI1uRqy8O9dI9Vsw9zoT3A6jgdOSgWsK0czEemdNV0M8yuMapg8ojM4U8dZUpYnvUVtr19lqT
	fVm+aA7oc3pyC5g1Gonn88iMewRpv/g3kAhamwzXA2Wp1SrTp6OHkH7P95nDDqKFnMdfVWeCAp/
	2xsPzt41YiX49NNZE2Seg7HLaITc8cXObSFPre5j+QBhkHH4+kWPFQDisy6X
X-Google-Smtp-Source: AGHT+IEAXQjlvVXuUS+hvcD4d/xsSZzW3BjuYaxD4G0D6IJrYehsEjbaj37l5/daqRdzRScEtV0rfA==
X-Received: by 2002:a05:600c:5110:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-4406aba758cmr110202625e9.19.1745310437275;
        Tue, 22 Apr 2025 01:27:17 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:9fbe:20e3:2fc3:8d19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbd35sm163735605e9.22.2025.04.22.01.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:27:16 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 1/3] riscv: Fix typo EXRACT -> EXTRACT
Date: Tue, 22 Apr 2025 10:25:43 +0200
Message-Id: <20250422082545.450453-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250422082545.450453-1-alexghiti@rivosinc.com>
References: <20250422082545.450453-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_012718_990256_5767FD5D 
X-CRM114-Status: GOOD (  11.23  )
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

Simply fix a typo.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/insn.h | 2 +-
 arch/riscv/kernel/vector.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 09fde95a5e8f..2a589a58b291 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -352,7 +352,7 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 	({typeof(x) x_ = (x); RV_X(x_, RVFDQ_FL_FS_WIDTH_OFF, \
 				   RVFDQ_FL_FS_WIDTH_MASK); })
 
-#define RVV_EXRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
+#define RVV_EXTRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
 
 /*
  * Get the immediate from a J-type instruction.
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 184f780c932d..901e67adf576 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -93,7 +93,7 @@ bool insn_is_vector(u32 insn_buf)
 		return true;
 	case RVV_OPCODE_VL:
 	case RVV_OPCODE_VS:
-		width = RVV_EXRACT_VL_VS_WIDTH(insn_buf);
+		width = RVV_EXTRACT_VL_VS_WIDTH(insn_buf);
 		if (width == RVV_VL_VS_WIDTH_8 || width == RVV_VL_VS_WIDTH_16 ||
 		    width == RVV_VL_VS_WIDTH_32 || width == RVV_VL_VS_WIDTH_64)
 			return true;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
