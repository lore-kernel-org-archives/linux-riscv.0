Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AA5C25B42
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 08:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2lHLv2X50W9820+wOaqWCiF5aFI91WthJUa7cSvA6SI=; b=yLqX/xjeBsRA6p
	MZlQW8bUPy9RAFeUaeWXNpiaUkfKWK4mWZsS6pXDTUWFQhHCigiP5DX9KLfVwPLKjH7WwVCG7a/gj
	zJvJSjjDx27TQDvoWp9pTh3kqPSlS4d5Om7BPCbKYnBL58SzbRzMsmUcjPhV9IbATDIIiL7xqV8We
	yRiOdXQJaoLRtdUlwPjIs84myuZr4kpHjnsyTp4yn91UKnC1s+O5a3RiGsL/k6D9jf+U3CqzmY+Rs
	fBMU9gHzR8XCS1ifYt1iWFN43HAKSlBsFZJ/qtwNEcEgZ9RTQ5cXJHRqbZu9rotP3PoMaOBHwjen4
	0cdhGkm63wnmG+tNWoEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqK9-006lCH-31;
	Mon, 23 Oct 2023 08:30:09 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqK7-006lAO-0C
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 08:30:08 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1ca6809fb8aso18195255ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 01:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698049806; x=1698654606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFjJUDD1OgrURVFCNfyqhpsKd5+0kFPMkXoyM2g55XE=;
        b=Cd0OUPbSSlrJ/ShnnfPDf9dyvEkC77LPwZ9oeqWQFf7LLk7DpIMz2+Q54JMUka9SDz
         b3j4PYpcO/Oy4E0jlSSG8T2e0EC80CZyMnor8HhJrJwIoEzp9YBGI29tnmCq4e7cQMSc
         PFuDX96sDlUJy13KPLfPwOvXSCmEvB4mAMEYoLmxIUjbYDrwsLUHlithh9tmOyxARW0G
         YoQNOV70RSi4dwlrOC02MWO25rHJHkOKtTlBunEgKgMF1rQeJWuMmkOVHKiI4q8MO3uv
         tzoin1Z7dN/NSUdDWCkcCWYh9u4D14YFCETULpyuo6WecgKNP3PccLyncAorbb7geu/l
         4iuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049806; x=1698654606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tFjJUDD1OgrURVFCNfyqhpsKd5+0kFPMkXoyM2g55XE=;
        b=arejs7y9P+emU8UUYwEjNQcAPP38hlDLx67KRpxa8ErKBqxeFKjGTaELTc7nACVZ56
         9vE8pu34rWkDcwJiRCu3HZLZQnBodgkhZbkN0uHLpY1LN7OStU0Rs5wZ0BqRPpwXHP8z
         L4hEkL4OHk1mNmM8mRJIN6to9hyp5EnCWrx8bjLbAKw7zUFyk2FrhQacbrG1h8Or57Hd
         23iUQMRFIZjZjgxjDkcmQBk51mSJxpv1RPt5MuOes8Knf5Q+kIzxahs7U7DdZFcDpm2w
         YTWYOy3mlUHX6VZk9IDflHCeMyw2MhRck5eOACOP5NOQXJ6ghb6+WHJQeDh2552MMw4/
         Zmgw==
X-Gm-Message-State: AOJu0YwZkPNjoA+T4G2qOC2tchAt3jxk0TpYfFAOtQoz018gKFo4xCRD
	a2VjkZDeDszcoJdbAxIGDRkDDw==
X-Google-Smtp-Source: AGHT+IHxUbIFNlkoPGxo4yFGNIhvxArkkFh19bAzzG/qz3kZJnf4Ua56mvZKJnXAyEFXPQjbUdh3rQ==
X-Received: by 2002:a17:902:ecc6:b0:1c9:cc41:76e4 with SMTP id a6-20020a170902ecc600b001c9cc4176e4mr5988168plh.10.1698049806521;
        Mon, 23 Oct 2023 01:30:06 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d15-20020a170903230f00b001b8b07bc600sm5415805plh.186.2023.10.23.01.30.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Oct 2023 01:30:06 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@linutronix.de,
	maz@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	liyu.yukiteru@bytedance.com,
	sunjiadong.lff@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	chaiwen.cc@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC 08/12] riscv: Enable NMIs during irqs disabled context
Date: Mon, 23 Oct 2023 16:29:07 +0800
Message-Id: <20231023082911.23242-9-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231023082911.23242-1-luxu.kernel@bytedance.com>
References: <20231023082911.23242-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_013007_099700_495029ED 
X-CRM114-Status: UNSURE (   9.20  )
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

This commit allows NMIs to happen even when irqs are disabled. When
disabling irqs, we mask all normal irqs via clearing corresponding bits
in CSR_IE while leaving NMI bits alone.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/irqflags.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
index 9700a17a003a..42f7803582df 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -54,13 +54,13 @@ static inline void arch_local_irq_enable(void)
 /* unconditionally disable interrupts */
 static inline void arch_local_irq_disable(void)
 {
-	csr_clear(CSR_IE, irqs_enabled_ie);
+	csr_clear(CSR_IE, ~ALLOWED_NMI_MASK);
 }
 
 /* get status and disable interrupts */
 static inline unsigned long arch_local_irq_save(void)
 {
-	return csr_read_clear(CSR_IE, irqs_enabled_ie);
+	return csr_read_clear(CSR_IE, ~ALLOWED_NMI_MASK);
 }
 
 /* test flags */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
