Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C781BC2BA15
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 10:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zUhA9NKC5kO6UcIZ+ARdIj7eWl63HtReCYxVzkEV/sU=; b=CcrUvTj922XquQ
	wOBG6sTE+RgcOZEW9b+S4Kjh6k1zouFqZtn2wuQJzgvOXCVMEabzVZfcxhF8QLvy9MuKYDu+4SoBE
	CrOyVXlBks+7dK03/s3Z6W3KxP0YX+f+cJbZ+PfTp5yWvTNVR+M9473WhU1CMBzOHkO/cPxzFjWcP
	0Z/XP6zx2cgmEjDJZxNGNg6OtwjyWf4cudQeK5F6TKoBpMsHVOjP8elwASTayzNLymuj2dpFF212R
	iazJtk9/k0t4YJD7gkZ27Co+3K+JKhOXam9hKT0AgKKVhRumijTWKhT0/7iqqZU1CeKtmKLZerwPy
	CsXoPNto+bUsau0ZgHRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWEL-0000000EOxT-1lgj;
	Tue, 18 Jun 2024 10:38:25 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWE7-0000000EOsy-0LJI
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 10:38:14 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-6fd8506a0b2so4308136a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 03:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718707090; x=1719311890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=catoYdsWevgpEjlIZ+NShj85YA1mrFcOHb8JN6JQXXA=;
        b=OG7OpBEzMYAFCWEBarFsN1R4Aw3xS03ZLM9oOXSzGbZslHcUagYrx+xWjUSdXCp4kj
         1YWpjQ1YMnPMDKlxuOZP48o120PFArQ27T4nsyjpfn5cI7U8iniOvBgiCkR/y4VfCePh
         7AVykeCOlFfJgm0PJ2cm28Oq3bN+PgllwdGiS6TeXtlGi5JEbCgwOGsEqCDQMxzTZDef
         xULqCJoq9XbMcMJLnUjD4MQSxaRb3GEcP6kD+3JMnPfVeFlOju1JcKdlMmmD7uQhM/9z
         AWIMeZ4PVv0jxM+kTgTUOGIvn6t8YuaTRoF2fWLpwKnl2Vz1M5C5Bcoj+2TiFrj9M+H0
         3+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718707090; x=1719311890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=catoYdsWevgpEjlIZ+NShj85YA1mrFcOHb8JN6JQXXA=;
        b=JUtFsUi0De4bJK+6LS654/xHFdjOXviBArbfNPHlP7Ze4RgrhE7T9Jo1JvVEGdA9sN
         LoP3Apc1gIHwxtl49xVbfV46yn7sRJcvy2NHBVZuAz8e+91OEpaRTYo5Ey/eR3wD0WK8
         0Yn7Nq6myc0Rpu3/8qBqQcf53ylqu+ozrseGAb5jflKASZnI8CwD3V0E0XDGkVZKjjE9
         D7Hc3CfX9ATDReNjYPMeRnVM5YSSt9KTciTietMtv3TY0M7QBSn2fSRsuBu6cTpJGl9C
         SGBmGpawz+j3AOFkd95QQxZbrl+qFBiRc8IJsl02/r0iMnkWbfXMTXHPvYhuuHN5imgh
         TIIA==
X-Gm-Message-State: AOJu0Yxv6VOLIMVdTwTL8jIpDcXnFN7L3fU0YRVXZuMf0aUhZassfjJH
	/6H/futQv1Vm1H7E2XCLmt3iK/aTUtJkS+vwqWQ/miDRUMsrG01IHaKOkPNzmv4=
X-Google-Smtp-Source: AGHT+IHf+BZuoVA2Xpv7qf8brMwvsr1IjVgs7uVQL0X7eDnkfLxqGefrMgAitNCtb2bohl/3B7BEAw==
X-Received: by 2002:a05:6a20:daa8:b0:1b8:622a:cf7b with SMTP id adf61e73a8af0-1bae80222f8mr14219877637.44.1718707089932;
        Tue, 18 Jun 2024 03:38:09 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9a23ee04esm3375205ad.258.2024.06.18.03.38.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 18 Jun 2024 03:38:09 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: alex@ghiti.fr,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH] riscv: Fix local irq restore when flags indicates irq disabled
Date: Tue, 18 Jun 2024 18:38:03 +0800
Message-Id: <20240618103803.40578-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_033812_649156_C54706CB 
X-CRM114-Status: GOOD (  10.85  )
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
