Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97152C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 10:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zUhA9NKC5kO6UcIZ+ARdIj7eWl63HtReCYxVzkEV/sU=; b=BG+wR+z1VgetWC
	hW2H+WNnvx5/czMhxkO50t+m5jZ1NIP+287DRk8Wh89ov7j8Wf1MyypGJXP0OU/n1AGyZloA06x9o
	njiusXatUB66IdSYZ6YKLBe384XPMbsqZ8tkYkbxpZs4SAxtsW5Vp5aqoSAImRxfcnnUlQD4/MrC8
	SC5/x8U7Phf8BiDjVccgcaulMWNApf64uZQuCrqMYm3BF+zAFlIU4KTvmK3vq5HQuZS1B11C7n2Jm
	QBc1cyw8PPTEMTyAqR4TK2ozd9DFjIvlEHkXpy4WvkJG7QHTwNl9jgXCCBMXSvBbUU0iNno08o+rw
	0gt2TmQCc4WvSFufF4mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWCZ-0000000EOMt-04MI;
	Tue, 18 Jun 2024 10:36:35 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWCV-0000000EOKE-0k0g
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 10:36:32 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-706264e1692so67037b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 03:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718706987; x=1719311787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=catoYdsWevgpEjlIZ+NShj85YA1mrFcOHb8JN6JQXXA=;
        b=MBAKLQtvYHYfB9KTBE/vvXgNkT+RMsSahiSevZCAZKcVsdJmi6zlmOlEvRNFMgQk5D
         /kb0bLxfj9nWcwhsaAHsqM/jGiL3sdmW75AV5GljueFImeSh80IGoYa2eSvOrLw1Zfoe
         u+xzTTwUZRqABVOlIg+ntYop2gqajtKnd+wpFScJswEYaAPUJPv+oP7xm7XdK82Nd+D6
         ZSdS2YKpnEr0w9lc51OpgoT20aUGC5rvcZs7IYZnDfav/v7TcBr723vKQlhedrxJUmrG
         TSQTVB5CWGm4Twys80RJ1G5vlqhh/dkE7KE7kn7Dw7KpjEHn7W9TheTzDRQiBKbHXhLX
         XY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718706987; x=1719311787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=catoYdsWevgpEjlIZ+NShj85YA1mrFcOHb8JN6JQXXA=;
        b=mmR3cbS/9G9dFmFKwCqzA7q8t8FYFgLR4O51HWypyZSKIV7UwAPnw64hWWzCfFd5pU
         KPJ0aVyHwhaOVBp+yyYvg5Qwo6ecevoQbia5WyzgGZNDCmP/Bl5l3pp8BAdcLr2GCS/n
         ak1EPeASO0jubP1Si+mZAAdH3Lcil5oAGAiNjFwGJgmawqwOR5oeDuSH6Y7VD3tCirOc
         EuqPf6jo24JDyOCoLs7PruYKFCpnBQRraHG8r8xswJSoj8///6Icb62oK+nnv3fSyaU5
         egOLsj9QNVdLZT2NUFUpMbsaaufFueAFU/4yIGRPBI8lipdrOPsFDtli+UDz0pgI8G+V
         Qi/A==
X-Gm-Message-State: AOJu0YzaElu4KCVce5jISVBdcsrkWPJjkwwutwjNZm7hGzvXVELmPl63
	6t2/Lntjspa3Fr5fkp7L0tQ/4nGFNvb9OnJjNwm7K9v75J6fQ0Hyck4wZaPs+ih5ipPykXqXG5E
	olf0=
X-Google-Smtp-Source: AGHT+IEPcrkKO9fF/9sMw9xs4nt146SzoMnCyd73hiRrHlgPnc9m1W3XJdahbA0T8v83u2t0gvprZA==
X-Received: by 2002:a05:6a00:80e8:b0:705:be21:f2be with SMTP id d2e1a72fcca58-705d714f713mr12704987b3a.18.1718706987366;
        Tue, 18 Jun 2024 03:36:27 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb92c89sm8662454b3a.213.2024.06.18.03.36.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 18 Jun 2024 03:36:27 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: alex@ghiti.fr,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH] riscv: Fix local irq restore when flags indicates irq disabled
Date: Tue, 18 Jun 2024 18:36:20 +0800
Message-Id: <20240618103620.40531-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_033631_540997_FD4DCC29 
X-CRM114-Status: GOOD (  10.63  )
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

When arch_local_irq_restore() is called with flags indicating irqs
disabled, we need to clear SR_IE bit in CSR_STATUS, whereas current
implementation based on csr_set() function only sets SR_IE bit of
CSR_STATUS when SR_IE bit of flags is high and does nothing when
SR_IE bit of flags is low.

This commit supplies csr clear operation when calling irq restore
function with flags indicating irq disabled.

Fixes: 6d60b6ee0c97 ("RISC-V: Device, timer, IRQs, and the SBI")
Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/irqflags.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
index 6fd8cbfcfcc7..f3aad7bfadb7 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -48,7 +48,10 @@ static inline int arch_irqs_disabled(void)
 /* set interrupt enabled status */
 static inline void arch_local_irq_restore(unsigned long flags)
 {
-	csr_set(CSR_STATUS, flags & SR_IE);
+	if (flags & SR_IE)
+		csr_set(CSR_STATUS, SR_IE);
+	else
+		csr_clear(CSR_STATUS, SR_IE);
 }
 
 #endif /* _ASM_RISCV_IRQFLAGS_H */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
