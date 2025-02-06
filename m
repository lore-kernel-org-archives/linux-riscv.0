Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D32C02196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 13:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yJ/lnizB4D7RM3p77XMYHCN3kbHC1JpUSHz7A8e0blU=; b=TfZ3QM3d126MCb
	YhQc8WKqN1DczkDkNpkxtRju7C6JdOgYWViwuzbEdKmcFDnxdFfnjh46esubEBwJS9rbFQ3ipObHh
	79QLeG3eeW/wHD07/RswRB+UQP4yP1ZwfJCcMQZCnPawF3sis2StwqEuM5Lo838Nhhu8XGZ6032qC
	mqi0CXcihS7N0sxNMRknVIT0Ep7ujJp50+jztBNq6OJMVZpMr4TFgqzZHa+7CQS58IRP32wjPnNfi
	zRTaiAmD1bG2xEx/JCHgJapD2X8Q2peeMqKo48JdxeExoPGMlqnWeB625HFtzSrSXFnJbBRKHu8yu
	ASj0Dz8VZtE8SDEgDAMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1re-00000006Phw-14X4;
	Thu, 06 Feb 2025 13:24:18 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1nu-00000006Ocs-12aK
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 13:20:27 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21f49bd087cso766035ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Feb 2025 05:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738848025; x=1739452825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xce49/BY9vfXB35z8CeRZ6MSP3HJqpKyFsN4Gqyc7dc=;
        b=PkCny4XE+TJ4tzPe4366qCDcmvZeAtmZ6sQKplp9h9tVzZ7GxzEMzP2XsQmxDQuXSW
         MbLjwUmf4+U0T4adoz0K656r53VF2WiCfuCrwcVFVhkByfoi3chy3NxbHod/zEQtI+YM
         KcIm0fHjuz7c+/ciyOxRihQCwYDld0gRxkcyF8NvtHzYBVxYIx3l4KOAAMOaX4L43obP
         IlDPs5YkhJUcplLm5ORi0o8od3U3+qWESLc8UemFXjVItA9udVcf9zR7aak/UaWNtfIH
         vnaWkvDHyhQhem5JMtAiCJQvv6/AtMuF+mErI0iScccgVc1JkdILKF4cQ14nVCSv4Ksi
         NRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738848025; x=1739452825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xce49/BY9vfXB35z8CeRZ6MSP3HJqpKyFsN4Gqyc7dc=;
        b=mR+ac83R/As3J3WHIFKpmVNrCxGhMxpTXCV4Ks5PItnY963LkR2ezq/lnFiyQB8m0M
         ChRqVQj1cvc6g3BZQye65fMsF4ecIPfLrY1Au/d746UZ/NRc4BUrumMRgzVQMjEAYBsq
         h5lRd/6QyRh/jq+qm4TaUbHhomK0hd+u0m6joFIGJ9pNNxRLkNe3ru17oN7GlX67Mi/X
         offm9f7e8rSUJ/xYEBgKMBIQHj0u5WQKCfbE8p4th3oTN3LicEytPlhrtqiNvTL+urqE
         RRuErY5t3iSXFLCdbwIrliVoU51Vhx5iqHNaqz9CfMPD1P46ivUdCHpt3nXmFl1sYYB9
         Tg3Q==
X-Gm-Message-State: AOJu0YzlDsS6aBvXwdgERIRXmM3yCnPUKw9JTBez+aM9vn0GAqLJfEKR
	AsRG+hPHv48thYAdnldj1C6l16zXgmY2luBwEK57d0L/SutoFyyb6BEIDlAArLI=
X-Gm-Gg: ASbGncv+WtrxynQ8hZrzoqVLtoLIzw79QUcz8RkhPiw9/6CcNzL5nIyCZJ5CVmhfsyt
	RtghX56KGRDH7GKVw6DlNFmdRgHIpvsIlTowI7GxZ3ycmrkWOPkqQeu/Bd1DqxYyPBlFyaX2PGM
	ux4rlMOQY8YwH0NLGJto6V6l0kwnGK2g2DiaYUJNgshhDVJI0mnnIqU7bQKNA6YkGyRbvOnC+rR
	ZHIxtH1e2bT8wyUie5nzW26vTQN1cY1QnFeqT8pyQhImXvfFvNA734UZ07JQVFEaXWbIzvMJpIy
	cyQc0WSF8QUNDiYkjA==
X-Google-Smtp-Source: AGHT+IFcNT/rNgI2uCAPNRIwNCrMXf037u5qAVa3V5iSa1fu7wy92g99/HkKLyrbAq4szqQ1+3GzCQ==
X-Received: by 2002:a17:902:eccc:b0:21f:1af3:b318 with SMTP id d9443c01a7336-21f1af3b387mr108852145ad.53.1738848025272;
        Thu, 06 Feb 2025 05:20:25 -0800 (PST)
Received: from L4CR4519N7.bytedance.net ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d987sm12170775ad.120.2025.02.06.05.20.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Feb 2025 05:20:25 -0800 (PST)
From: Rui Qi <qirui.001@bytedance.com>
X-Google-Original-From: Rui Qi
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	haibo1.xu@intel.com,
	guohanjun@huawei.com,
	sunilvl@ventanamicro.com,
	samuel.holland@sifive.com,
	parri.andrea@gmail.com,
	ericchancf@google.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Rui Qi <qirui.001@bytedance.com>
Subject: [RFC 5/5] RISC-V: define ioremap_cache
Date: Thu,  6 Feb 2025 21:19:26 +0800
Message-Id: <20250206131926.91289-6-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250206131926.91289-1-qirui.001@bytedance.com>
References: <20250206131926.91289-1-qirui.001@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_052026_291553_5D0FF9F9 
X-CRM114-Status: UNSURE (   6.36  )
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

From: Rui Qi <qirui.001@bytedance.com>

Define ioremap_cache for riscv, otherwise it will
cause compile errors for bert.c and einj.c

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/include/asm/io.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 1c5c641075d2..c81d2de007bc 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -134,6 +134,11 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
 #endif
 
 #include <asm-generic/io.h>
+#define ioremap_cache ioremap_cache
+static inline void __iomem *ioremap_cache(phys_addr_t addr, size_t size)
+{
+	return (__force void *)ioremap_prot(addr, size, _PAGE_KERNEL);
+}
 
 #ifdef CONFIG_MMU
 #define arch_memremap_wb(addr, size)	\
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
