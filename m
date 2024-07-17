Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9662C3DA4B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 06:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K59Ki8F+5lnNVMiCWVqy6Yuh4fx2BYxKWLFSd4GuTGA=; b=KeQfV8Yi2jzmVi
	N/8HieXkbGrtit48Qr+foUnc+DmpiJ3ABlPZ4SQny4J2sJVRKGOLi0dWqIUjH/l8mYRpjLx4Old1t
	p0DHLZmvKNTSUzXG2iJi02m3W5pJFMf0FPT7siTQE/v0FWOK7XNWFw7zAzQdTXMsZJHU/9umH8TDk
	wQtRsaEwuJ+AAKDiZKb91YnfzbqwBJgjdki3OHYlcBNfY1crBUpX2i+za3TtVuPE9sMtKyOrU18sm
	OWmqTDktlHJYv6k0YWbL84ZGxVsZmOnE3odKy9hAYDRr83+wUAHXiigyg5lyAL5dLYtnomLhPGWXF
	KeECRsWHgXOQhRvDRXbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxkO-0000000ClAz-1NUc;
	Wed, 17 Jul 2024 06:02:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxkL-0000000Cl9i-0uE4
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 06:02:38 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4265b7514fcso2102965e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 23:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721196155; x=1721800955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXmippFvjJBdPaOFd0Bb9N+zo48IbYES3OA/c/+iV6I=;
        b=t1sRtZCRfvh8y7NFmC+zdfw3/4zLaquWe2j9YgtMM9rMIPzx3IG5UdMtywuB4B1DMr
         xCfzJXZiqFfSFlOnl5geKhINprytYA6srjNxVyNcjne8avwbKe1DnF2IYwBnz/iiY4z1
         bw6QbVeLKVYDGFeCnHYOSv53+EBzK5sCM93RFL95D5iOOqkHFvkdq4UeuUsWGGYld0B9
         5cHRGSbwGlRhNPPiYaOMJBsx/Fs7i5cSGkK1qTbH8Ezv+39WTbCaXXlNzLU2ovvoBswx
         6/xgdpC9jKFIJdB78LxY1R0FRhw2cXAbEbEW1RnokZtjzQp1SfFEZjtqKjnZFUJBqfIE
         gb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721196155; x=1721800955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXmippFvjJBdPaOFd0Bb9N+zo48IbYES3OA/c/+iV6I=;
        b=lsjD5/p65XbCPH10GwsWdvcwXNUHyvpbtTxKF+LqUh3f9ygT0PbToyzBXv79jGZEDP
         bLPZDliFpe27jV0JRyFoJz5tWAA38puiZFStIeJ7HaZZy8cuApbiUdY4sXD+vCt3Ygwc
         oFrfOWmqLG1iQlDjgsuH2/yPd2IG7P+SBPptafCnz0cLVXepYgNJn162rD4u6pJnkT4Q
         YZopjCFnQEhBBiqNN6o0gJccVyV6MRmvZNgu7elhfG/FIk2MmSqd3ZUgNpCrDYW3VGSF
         SwFCFV+7E8SEXRxTCC8bSZKRIvtoHniB4aNKBuZs9ywtI+m+B5wfsLuV1pCM9vHXVKpD
         NaqA==
X-Forwarded-Encrypted: i=1; AJvYcCWusWFC6ZtZkh7HDOq1U43+1r4XwTkp1EhsnFNe2sYJGEtv93aq2yAO0EMbuXlaxZEDp9q41SkwyhHYi5gMnwWn8qF4EQ8R2ri8LKnXAHkt
X-Gm-Message-State: AOJu0Yz2givT8wQicS9H9+eUZbtc+95aprjm/fcQuyiyTWcjsmzkt+VH
	ywZJwrvox6xRyvT/usnr8ur8/ve1wKgfLIhQfGLc183xQty1f/GBG/sPWfmS3HM=
X-Google-Smtp-Source: AGHT+IEsqNOSqGgGsp+64azNiE6BQN3Oyun3IARQaHDYKamOpOynPrKTjcW0Bs4EgmHDicXeJE1Lzg==
X-Received: by 2002:a05:600c:3c83:b0:426:706c:a55a with SMTP id 5b1f17b1804b1-427bb67fcfcmr30629405e9.2.1721196154921;
        Tue, 16 Jul 2024 23:02:34 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f09d1d8sm188634835e9.0.2024.07.16.23.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:02:34 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/4] riscv: Add ISA extension parsing for Svvptc
Date: Wed, 17 Jul 2024 08:01:22 +0200
Message-Id: <20240717060125.139416-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717060125.139416-1-alexghiti@rivosinc.com>
References: <20240717060125.139416-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_230237_289939_D988DFA7 
X-CRM114-Status: UNSURE (   8.82  )
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

Add support to parse the Svvptc string in the riscv,isa string.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e17d0078a651..6dd0dd8beb30 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,7 @@
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
 #define RISCV_ISA_EXT_XANDESPMU		74
+#define RISCV_ISA_EXT_SVVPTC		75
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 5ef48cb20ee1..60780d246743 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -305,6 +305,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
 	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
+	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
