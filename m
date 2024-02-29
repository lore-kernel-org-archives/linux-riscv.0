Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02ABC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 23:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xSJNB+WljEt6zSY9Y2oOakXqXXPUcaIDmq/8qWXDdTg=; b=1A4OaWDfIl8N6P
	QRZirAR2VN+9NBRmOFGrm7CpgYbxhnCkTya21Z6fmz6N0jSgTn9sT7DPMCMKVddVVxnJokNs484/s
	3c9rlrlgrETH7DAtTrbk+xHHNbGhRiA8i2ZiNrQ/2dx6EsjrYE/KOkYo+nepvPkuhs2lHJ+iafPoQ
	fNwdDO4TmIc+PpPNngBTEHRzHx4Us6SkXUOx9d2GVEQuFy/t0XdKerJAC153b6vu9XqszhGPNL3fF
	U4HftXB6FGXnV2vxOkqpxcpW+S3MKV+iMB/QVpAETa/IkInemzIzMCgzzPhcD3Qd/nJdqvui2iYtL
	IJOh4im1mQ8Yu4hZx1Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjZ-0000000Fa8a-3YIO;
	Thu, 29 Feb 2024 23:22:37 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfpjH-0000000FZue-3aM0
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 23:22:21 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3c19aaedfdaso723678b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 15:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709248938; x=1709853738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YO6O944kqWb4oNKtEMwGtpxpVk1nDXsHdzKgYw/NyE=;
        b=aAX1L979Qg6qqAYiD/986t/7RQ1+yFJKjbvbBMGMG/Njmk/YGbJhrKf2wjG1taWsBq
         uSYh6ZcZfadWMTDdHx6qkciTmWTHACKxTcQnkOzEHxw9cypFhELcWB1QfvnbzPD+8RAJ
         N9qBMU89LOPRa3wBAQhFbSgox3mr38S1YlXMCA97+2EZURVi5v8j28PL+vNgd2VXwfbz
         NCQ3QEeOQxG4YeK3XtCaY9kq5Wfk5+bwqIzepI2VQLBGutqAFjqVsDbq+9ndYN8Q20ZK
         u9DzJSd2KbaBIQTUT5svbtdhe8gV2Ms14TU1JUaD1rMiWx76JaScL6i+7Shzioj9xtaY
         6GvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709248938; x=1709853738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YO6O944kqWb4oNKtEMwGtpxpVk1nDXsHdzKgYw/NyE=;
        b=fMynwB6yj6TwUy8rH2oeBNrnoG+Dgm95E41OA4x5pk2UAZLwMJYy4bPBN9i5BQwUES
         vts85EPibLGeJEGZpeVBurc0/FpuV8zCLe1aNuO+MIV7J1+YuGHECwkz57sUdfjB9mHv
         pH/F2BZW2a4Sr9sn6U5JeRBv1yWsy4i2Yw9m2Nmdx/m8hh8yB5CTLhcJyLXsaJ+Qv57E
         eXhLMa9LK6VIifbTLJZN317QnSfxc8ZAkeBk8RizFeI5MQYunXs1FAg0ErlnthSQxsKQ
         VUcIAm6P7AyVfwDBt/M8fuB175Q6GrWmCazvV5gH7WAmgG+Qd9+7kKDl5tQ4BVvFAL8s
         hTmA==
X-Forwarded-Encrypted: i=1; AJvYcCVe7r7N8F0dup3hWRMqnlrjUlx/ocMc3xZUBlW0GG4pFXo671k5d8SBNRXsJwyYgEiKg9Buyr00MUBAWhfrnrh4jETQql58qbHKtdWW3olN
X-Gm-Message-State: AOJu0Yyi+ORNbrQQnDIEi82MX9aNe+K0r3uM/LYitn1M0XPnw6AQpdOs
	N18SLj2muwt+vq/FFVGkwWgEztaEg3FKeT4DpY8Slerk0YZQFalV4kovfsJ7Gy4=
X-Google-Smtp-Source: AGHT+IF/+PdA1OOJxMn23/EE1kPZ70u92KMkSqj19wYtg5glHTCWIaPOP2OtxcWfToq1z4V1DP9b6Q==
X-Received: by 2002:a05:6808:8f2:b0:3c1:c37b:1a71 with SMTP id d18-20020a05680808f200b003c1c37b1a71mr62346oic.57.1709248938472;
        Thu, 29 Feb 2024 15:22:18 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id c6-20020aa78806000000b006e55aa75d6csm1779719pfo.122.2024.02.29.15.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:22:17 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 05/13] riscv: Only send remote fences when some other CPU is online
Date: Thu, 29 Feb 2024 15:21:46 -0800
Message-ID: <20240229232211.161961-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240229232211.161961-1-samuel.holland@sifive.com>
References: <20240229232211.161961-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_152220_097956_5D6A5B78 
X-CRM114-Status: GOOD (  11.47  )
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

If no other CPU is online, a local cache or TLB flush is sufficient.
These checks can be constant-folded when SMP is disabled.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v4)

Changes in v4:
 - New patch for v4

 arch/riscv/mm/cacheflush.c | 4 +++-
 arch/riscv/mm/tlbflush.c   | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 47c485bc7df0..f7933ae88a55 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -21,7 +21,9 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (riscv_use_sbi_for_rfence())
+	if (num_online_cpus() < 2)
+		return;
+	else if (riscv_use_sbi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 8cdb082f00ca..69402c260a89 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -78,7 +78,9 @@ static void __ipi_flush_tlb_all(void *info)
 
 void flush_tlb_all(void)
 {
-	if (riscv_use_sbi_for_rfence())
+	if (num_online_cpus() < 2)
+		local_flush_tlb_all();
+	else if (riscv_use_sbi_for_rfence())
 		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
 	else
 		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
