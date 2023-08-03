Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75928EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 13:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OmeMFKa9FRVJpxLRuJ+b2ZWA3zHE3Jx2pos0Ii9vS78=; b=3iwRUNvvbausIA
	YJIB8nx1Gd/bCwOdwtAADoghskfW4+8AnD2vPJZEzpL5qgVU+ULmvqIxkHmAfK+Yjh3Ziy7TsxL/P
	sjy0TlT1X0HMtQQKv4HW0mNgTjEYYsNeXvy21CEkUhJvGmmBZC3PjFDRwLwDR5FCxFB5bRxrY8Bsb
	vXSoRLmprCxh+MjAnwXa0EvFhvk2jpWEBYxXEDy2fwzcKTj4hnwDgmW5exj5XD0WqO4/HX5LhKNWO
	GiWBIhHYsFQhtJIk2QCKdtNwQpvzgx6hSLfZFR87dLI9iJfysSSKnPEWuEMG+oMA6OairJSnlwwc9
	Kcv44vzDf7SkrexGkDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYOK-0090J6-0H;
	Thu, 03 Aug 2023 13:29:24 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYOG-0090BS-1i
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 13:29:22 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-686be3cbea0so1438575b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1691069351; x=1691674151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ntEvLFlRpNT+qR6jlJekxZXF9ONqBaZB8tTPc8hJxHo=;
        b=aq/S7/aTPM+jsQtw76McH/TkFHY/hJfftBjXoaty8AFCiu52VNsFuIa2y/jT+iW6rG
         qY0TwLe48wBcbUlPMpFNxWv67kyywoGrwj8xJxu3AkhYZRAYf6Wfbt5RFwMpPf9VVQAr
         2pxdC+LjsS1A/x3VvS81QlMwp5FaNPh/y+PHOFG8GmogYfpQ9cA557fuxP9q4bHl+RkZ
         Qy1r5R3kh9wBgwX6cveOxF17KilSfhAlOXlWVBY29U2SIM5XLujru4yVDXHaGrGEYC9W
         25mnc+PIC+/ubhs+UNho4VDIdw+jaA/YTihXZ+CHEH4uwT+iRXdFShji4NOBpL+hopF6
         qyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691069351; x=1691674151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntEvLFlRpNT+qR6jlJekxZXF9ONqBaZB8tTPc8hJxHo=;
        b=T9YNd0RNRFcTi1noH/qvnl+pVvQ1DwzrQoIEzyrnaeeFmP2zwHIOkeLMv4ImAATt5y
         QTpWlhtBWC2V4FI58jmNejoS+Ag+I8umvejPeRehp+dfTYmfd2UErTzHeMJErdus9bRL
         NI1sVKpJYsfE1T1/r3q4o0w/L0+gSKgB9LOEe6uoZFgziE3m9cpXiunq4cmuU3pM6Gbx
         amVVKeCOrI7r0TMPB11AFC7tqXNnKl/Nn9CyvcguWKW/UhvshkkaI6ez3XVMdp7a9kTY
         70eFgPkIOGDTi/036kVFLp9lmqsMIxOpL7S7o8fZHdYWKZ5UwFTvzUhTq5B2ETSLTMGN
         JTjg==
X-Gm-Message-State: ABy/qLaFBBPgjR/t2iylnGYBdJluCkt0893Uv3Qw3LhrUSD8oiGA3CW2
	w0GD7InFVAdJgusGHHcpMdC3Mw==
X-Google-Smtp-Source: APBJJlHIzo4MqHS+k/JCdqgT16BcRk/5v7ytqHftiDKKZXbIZ4AikfQny7La+e94VmPdHMof8J0Wrg==
X-Received: by 2002:a05:6a21:32a1:b0:130:a400:1d65 with SMTP id yt33-20020a056a2132a100b00130a4001d65mr24223360pzb.14.1691069351683;
        Thu, 03 Aug 2023 06:29:11 -0700 (PDT)
Received: from n26-073-040.byted.org ([106.38.226.44])
        by smtp.gmail.com with ESMTPSA id q23-20020a637517000000b0055b4307963dsm6901376pgc.23.2023.08.03.06.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 06:28:46 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH RESEND] riscv: Fix local irq restore when flags indicates irq disabled
Date: Thu,  3 Aug 2023 21:28:18 +0800
Message-Id: <20230803132818.2092166-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_062920_877977_872745A3 
X-CRM114-Status: GOOD (  11.53  )
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
index 08d4d6a5b7e9..7c31fc3c3559 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -49,7 +49,10 @@ static inline int arch_irqs_disabled(void)
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
