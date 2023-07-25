Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81609C001DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 07:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jjkw1UErBG/MZlm7EdNqAUAp6DDCdEEB5cJVZzSAcE0=; b=2SJfxuAZkTzMCJ
	0Q8BA+c3WeiST2JgJ2ungfo2V1tsTc7Bs/sE4fLmsiBqsv+6hy4RsDDid6W/l5/7t30/Gwt41AipC
	8ZFClN8xtnAIJW1EsFLcfUPnzCUcHIVC9QdugT07t7KOkhg2tBKBeOJmxAEY/NHQ+phjkngi+HSN6
	oTj87+Ph7dDiaApoB0GdKarwjDQW75WAToPAvJqGdMI7jRQdmZwUk59U0wWcnNWaMRfVHQHQRPSLh
	8dexbLQEIOp9qQu+U2Pk1IExVI7jpVGXMl4wSVqiGiJyhIZsLz7KXKAj+mA+BnuO5/fBpEdnbcKHm
	Uc2ODvEy+y4FH5dka4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOC7U-006WXJ-22;
	Tue, 25 Jul 2023 07:06:08 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOC7P-006WV9-2b
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 07:06:05 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-666e64e97e2so3054583b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 00:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690268757; x=1690873557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3YiFtbazXCGKkSvCu29PAaqFDD+rQJcJJfLFd8Lc7dE=;
        b=Lo8PhI9mKE9la2FEdDvKX1tKoJGeVXRVcEQOW8jg2w5CkcWv8ZCbVQoo+JCfVSl54g
         Q5oJhDZ3TzZ7C7f224IcRM8uioFnSKcrB1Pdr3oK9+sDnWK6kd/KXRBMXqCeeYoeTpUJ
         MuP9Gl3ESPfQLD1iIuQDEpJkLT6PhSJHM+mSwSGBK9n/umasczanNmv3dkxRML+cA/6o
         hz/XazC11REsa+u1YQHtT5OxoXhozjrPCdMJjG/tH+b3nSxQs9R569DldPwxdVpzhK9F
         jUFVWptCwB8EEhQSjyNw0S1XavIOqT4w97EAteNO4iJZ6461qx8mn6jPQtdMdgKKY8jf
         aKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690268757; x=1690873557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3YiFtbazXCGKkSvCu29PAaqFDD+rQJcJJfLFd8Lc7dE=;
        b=Jif+PwtrdlCVumEuRg5TyUkXVIP1duTlD4RhqmnzxxVW2z1SoJU1drtcWG5EnRTCFJ
         HDa/AdtESxaKuH59pRP0X3hHuYSyn1M82kHq8ZWNY6u/yx3KTwCUEskVaCFwx2HMQak4
         laVdAulyVVtf/gEmwshpq6p79nWId2cdSCw28cecttrQ1OGofmHLTEDO7IWBH+xQspl8
         KPZLR1AKgv9jN6FqafL0wMPt42vhchONHjG+eoNj7n4tsYlFNShMXtjb97ceInM9JdAD
         ejX9S6VhB0Snfnvg08HKPpZL8Q0CBKwpvcbJPchuzbt37NvHLB11WaeyxgVAe9wsHIcB
         iZwQ==
X-Gm-Message-State: ABy/qLYHkSHPb4sloV7ORgkbtzkhSHiqRcutONJzamtK5YqDBeCZygWQ
	FUwHJ91vhK83MWhQluamOZcKAg==
X-Google-Smtp-Source: APBJJlF1A/Z82CCGebQwtGRBNWpKXwCNpXTVvBfVWCdAsLP+dS3MDL1fCd2yzzWjcU83xc4D0sJCQQ==
X-Received: by 2002:a05:6a20:9717:b0:12d:4c17:bb2d with SMTP id hr23-20020a056a20971700b0012d4c17bb2dmr9066791pzc.26.1690268756829;
        Tue, 25 Jul 2023 00:05:56 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id p6-20020aa78606000000b00640dbbd7830sm9165478pfn.18.2023.07.25.00.05.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Jul 2023 00:05:56 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH] riscv: Fix local irq restore when flags indicates irq disabled
Date: Tue, 25 Jul 2023 15:05:49 +0800
Message-Id: <20230725070549.89810-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_000603_850639_4F5E1FD1 
X-CRM114-Status: GOOD (  11.41  )
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
2.39.2 (Apple Git-143)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
