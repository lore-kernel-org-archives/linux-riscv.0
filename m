Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ACEC021B5
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 16:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1DnT6sZyI5qTF4jDohntVLmIllhQRLXXojCtZHnxVs=; b=gxhfeaDIbFI6co
	htBPbfgftffcebzmECWbUfkTPypRLX5LO9jvmt+/GQtXAnIr+d44VjR7GfUqPsazAuEcBi7FcZ3sS
	a+EvXrI24B+TRN6rJJu7PtSspq03rWExINC2r48sn3fXPfgddNOalv6FmXSg02OIj9MMmefsO5pHH
	GB7bVnK/cAKFrLlBEQUEErBBdBSBc7A4ffNqTRsl+X6Vq2yGyfKUWcYqWsf3qyXGpQGZDyoTXWQTA
	BUR/SMEWF1pVUgZoi/ZpmqtRHOEI2SLjvx22hYgM4jMUHQCxFKV+q2ecQBDze/xdLmBgZPzkoiCTB
	NLamd3cuSOYTVVEC8oyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVch-000000066ii-0ab8;
	Fri, 21 Feb 2025 16:11:31 +0000
Received: from mail-wr1-f45.google.com ([209.85.221.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUSy-00000005tre-0qFd
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 14:57:25 +0000
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f325dd9e6so1139004f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 06:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740149842; x=1740754642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoVXTPIMs1CQCffXwitKYw9GB5bSc15mRPYc+pFsBJQ=;
        b=TU3avR9mzmXUvg8dwj/JdJTeL4Q7QywqV1qvLP/geHjHXkkNVv7+svXpNYeJGPRJV6
         DbraNTMBp35JQ9CDJ4ISbyQln7ZQF9cv4hV49yRbQgl6gOSHmMNVvjHCe0NdG0M/fzNd
         OFM6x/5H/LDtemiLiu56nHRyiTwWZ0igbjdTn7CBS3oZBEMrE5AdWRmCOZTHe4THdfcw
         45mIOTHZtCUO1980ORqzlQ0LnXzZm9k79wrw98KNwsmmP+zpU6KltbL/xPkLNq+U/0xg
         q4mBYm+12y2rZFoDOP0QV9e8WP9hbXD0sCYPDcI6A4qmaE1Bz04VSonwDHrtd+Y+zPBe
         Ia7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149842; x=1740754642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoVXTPIMs1CQCffXwitKYw9GB5bSc15mRPYc+pFsBJQ=;
        b=Y3aRXQLimZgOYiXCDi//UH0lNBJJqZBjvHh1cYypl0hYTPdcO4I6ZDJckjiyjPvkYg
         Qa0CITZkeZlUUvnDxFLQz2uHDbv5UrJbgjN8h/RyDxwexRQtSWy6LfjXKI+rZQ2r1Ab6
         Y8tOUPHKcGWc2sIDLjS8gjer1lG/T+MgMH8YR82mqD8iEmJqUDV7OAL9fR9rCoqI3RqE
         gAz3GQQAiQquJbgOo003uHw17LL6bjt7hF3pnN31zYgKa0wv/caU1J9yLUt6z0zGXO1D
         AHieDkAJj0Z9rX7Oq0vS8gDq3S8qIlTBFWtkdnG7erskuERYQNJ8NI9pOxaoND5PVXZG
         2I5g==
X-Gm-Message-State: AOJu0YzYB0ooKfHAjNb1ffSYkgKsAEyEj6x6kIdWaF+Yal1s9niVSDeB
	GCR17st0o3cFYXuUmiIDBkYqqogWnqCyXv0zNFjgSjwbGa6Oa+K151RerQ/vmb3iZ28YNJDndTn
	3
X-Gm-Gg: ASbGncsIJZ3SiWspd3jG7zRTdN0oSGMzAS39JnE17d948MGTqQUNpoYR84ETOUEYzAH
	X3iklXYBBm9cmidYbpzcxMgt5OKbWjFlI7E9i6A+49cqSHaGykM5lV32ShCLK8O5YeXEIcqpLOh
	xIlGzG2NtZXTyjZis5i0iGVU+uComNcADnwNZKRl7OgLvEQMnfLUpLMbXd+NvAA/Di1h4QqACAs
	62rAVJF1koUeDLyuvrgslysZFxW0e30GQH6cWawt9olKFzzKtd7UjkZ98UoSBzy7hHHSnZ2/kSM
	aNb+BEK7n8u7xA==
X-Google-Smtp-Source: AGHT+IGLjeXtLMpaUfMeTJi1dFbDUAJnf03JHPPfMuqHzy+Icmy6f1wZrpg8Ii10se+UcAaYlTJT4w==
X-Received: by 2002:a5d:584b:0:b0:38f:3b41:c952 with SMTP id ffacd0b85a97d-38f6e754b82mr2673644f8f.4.1740149842284;
        Fri, 21 Feb 2025 06:57:22 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b0371c67sm19561065e9.34.2025.02.21.06.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:57:21 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 2/8] riscv: Fix riscv_online_cpu_vec
Date: Fri, 21 Feb 2025 15:57:21 +0100
Message-ID: <20250221145718.115076-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221145718.115076-10-ajones@ventanamicro.com>
References: <20250221145718.115076-10-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_065724_235289_2893C1E5 
X-CRM114-Status: GOOD (  11.75  )
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

We shouldn't probe when we already know vector is unsupported and
we should probe when we see we don't yet know whether it's supported.
Furthermore, we should ensure we've set the access type to
unsupported when we don't have vector at all.

Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index b7a8ff7ba6df..161964cf2abc 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -367,10 +367,12 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 
 static int riscv_online_cpu_vec(unsigned int cpu)
 {
-	if (!has_vector())
+	if (!has_vector()) {
+		per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
 		return 0;
+	}
 
-	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED)
+	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
 		return 0;
 
 	check_vector_unaligned_access_emulated(NULL);
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
