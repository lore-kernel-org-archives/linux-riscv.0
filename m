Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71ED4D0C5EC
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 09:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e4as04ts8psVhp7qEKqUbQJu8f3ijcZ+yxEuisweMhs=; b=kGOkQimyrKXqo0
	P0up9w7uBg6AeXhENJwl71SruNbJ4ITr+CQo2N1Mqfb+XmZSHf67bLr9soQYyjIp08sThk8E8XFHv
	X7F5Wbdw5wjAnKvXkCQm30pSD+9EsNJ7BXYe7TM/eYvEQg0q5yIjcwZsjaI3K9BfHbLyy1JN1o6c9
	aR86sb/Jv5ThPwI+Jub8DsMCRyQtodx4N8MHIDpuWEKiU8s4tprYeabrQd6G0BuqTvqOTQnAcO5LL
	CmsvykP8vUcYWHrzLa6Xc+CxZY0gFmn1P1LP0HUlMTuk2/F1VsTEc9HZFtchKRreF/294lkgLKn8d
	8Xn3anTI2muuwtRM7D+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GQC-000000038E4-2Bl6;
	Fri, 25 Oct 2024 09:15:52 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GQ8-000000038CT-30x5
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 09:15:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20c803787abso13993325ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Oct 2024 02:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1729847744; x=1730452544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+DTUkSYOlRU3ybbwBrGBMsEPjomkF1Ub5awaswPrW1E=;
        b=OQ/aoQuBYSQQGCJ9TpIF7PKEht8+Jo0L2Tr0gstlPHvc2pdWFvhBZyURBGPDlYt4LM
         geZ5pJUzqmDnDE+10lr3od+r00oDKnxqvq4IH1AG3bYatsxmHYziqrO4C+f9kEpGntTD
         CCVr8iQuQA5Cuo7SpW/9r0U9Tyfw30qSw6Tej2rWSxpdZ1SOaROTj5wuV3c6maXQ2QLI
         HXW7xYl4EXWPoSRQ0leMXJJ7OhrjbjKWYLHekud1/jNt6PIUY2VYb8HdyNI8yJVeN2F6
         3iTKhBpx6AmdE6m6ZvjAqpXHj2LNjrtvv9HDlEhRUCK7kXK5gGiTDukKOC5TfZB8aZRJ
         6DiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729847744; x=1730452544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DTUkSYOlRU3ybbwBrGBMsEPjomkF1Ub5awaswPrW1E=;
        b=WcjVo00ZjOJ1oh1PuiNzSiYELffKNSZ3BqemJmOrUubt6hl7Flb9wwn9fZRDE1jOuT
         PWFRC5912+hC7M03Y2Ciw6fF8TLs+f0Zk6lBU7m5zK/ohm10zejtP7RVZuSs1jfeYWV0
         oDe82lMyVjh+mmtTJdQZKH5qZSaH19LNgi9Fc3sAU41HrqCjZ8T1PZmeIbELxO2YEjUx
         KmmZDnMrsz8DFNYqBWh/jUSwycb5mnR4QlKaJIvhSDk+ImPxbuiG1PccKZ0PHcnl3lXK
         VN4RoBYtpbQh2c7TybVJ5bGSZ9q4R4gNQfG6iEqaQ5oN9PliZA/+EGvRU5mXyDJYVKK+
         xdrg==
X-Forwarded-Encrypted: i=1; AJvYcCUdwJET4hG14fFejocTwf2tKSKM+odhwbGYLWvaedrCkUrDpW+EIjZv/NE4HactIgfvh37qkh/CMGRDog==@lists.infradead.org
X-Gm-Message-State: AOJu0YylDouzyjbC2z7yktchCuNx3ruy3mjXAnlhKOlcWN99FCwP8ZPo
	qhpy8VYwBjVWwn8g6rDhxqYlFkKIBO4vOji9bq2qzRffKkO1wdWyuiUHs3Ng4Pw=
X-Google-Smtp-Source: AGHT+IGn8hflKpoueeCF8Bfpe5DVo3zhQbZebM4N8tBs0x45FvRc0cwkNA0yiljQQ0ZAfVnKIyBHZg==
X-Received: by 2002:a17:902:fc4f:b0:20b:a41f:6e4d with SMTP id d9443c01a7336-20fb89650ffmr77091225ad.15.1729847743607;
        Fri, 25 Oct 2024 02:15:43 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02ee43sm5946325ad.214.2024.10.25.02.15.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Oct 2024 02:15:43 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: punit.agrawal@bytedance.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor@kernel.org,
	cleger@rivosinc.com,
	charlie@rivosinc.com,
	evan@rivosinc.com,
	samuel.holland@sifive.com,
	andybnac@gmail.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH] RISC-V: Enable Zicbom in usermode
Date: Fri, 25 Oct 2024 17:15:27 +0800
Message-Id: <20241025091527.57825-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_021548_991213_1C61BFCA 
X-CRM114-Status: UNSURE (   9.60  )
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

Like Zicboz, by enabling the corresponding bits of senvcfg,
the instructions cbo.clean, cbo.flush, and cbo.inval can be
executed normally in user mode.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1992ea64786e..bc850518ab41 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -924,7 +924,7 @@ unsigned long riscv_get_elf_hwcap(void)
 void __init riscv_user_isa_enable(void)
 {
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
-		current->thread.envcfg |= ENVCFG_CBZE;
+		current->thread.envcfg |= ENVCFG_CBIE | ENVCFG_CBCFE | ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
