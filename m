Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD2CC0218C
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 09:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P0ah5+mkE/28rYqDbuQJ32MiTUtbkm7APuKhbQKRcdU=; b=YY5SP5SWa19Xug
	7dT0ef9UGNB125AunFqDL02jXHVFbaHb3me8QgRC1kzSNnmOxutUu5DNES0rku2sgfONiJY6iFP+E
	gJHXnekHO81pcbI8CKdcvYoDkJywgHxoVQ1URUhUMWt4bSnTy6IAtwlFl+QnBUuH2ss5hoE0YqVEw
	0oiNnULQly4VhxCDAhwhTjPDqWX2gmU/N5RPlzgH5xf3FrEKOAV7HRTmG8FShA9OeM9gp1sN2Jv5h
	KT0eeeFUGXSPSK4vWB6PzrLZqHKrrHOUSbj5Lqxn/jaZQNK3lSgRlQ6cw1lMkLh5XowSGZqHQXdq6
	xzKinjsSPGgm5fON8Wmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLby-000000022PL-1yeL;
	Mon, 27 Jan 2025 09:40:54 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcLa8-000000021ov-138J
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 09:39:01 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2161eb95317so71651455ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737970736; x=1738575536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nBZ4D1tJ1W6TkH10mNjcGXtl3KHxxjn0+jKOGshQuOE=;
        b=cEs6G+NLWXNNWWZ98qttNrDiEkOrJZS04WSUNBlTimqooMWU1dKS2+NfIvgmkclU8j
         EVu66SmbCfs5sxxMM7pXAl8rf9AVikUhIlcNfnrI8h9UbQk7gl2+GAJEBg9BTTVDM9tn
         PopFtYv3q3r/Z/lux2fARpiZZOci+ftO4oeaFiNJIkYztERLW3esSXU6W/s53CBoMipt
         q0fjlSWZb8E90Ntq62zwo51S1IfZLb5Db2ItFbV2c7egEVoeM9PFzWvofPUdQSPAMWqR
         Svl+C8VZjSoEtql+/a5K0IaNx1gVYsM/baYsR1lbFzFh6pveE9RXAr1N1oMYW7Cwtdju
         jh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737970736; x=1738575536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBZ4D1tJ1W6TkH10mNjcGXtl3KHxxjn0+jKOGshQuOE=;
        b=H2t6vsCRiHzKmRL0E5Dae8czUk4R4nl8quWyEp90HMlSHFZHZ5o533tuJc+QiTrDKO
         DTAqTHFSOSA1gz8mwYEyURkXuuOBP23vyxElho/I6Lu5ZWmwwJOVyBNBQ26Vx9SF4Rhl
         Tf6Lxk8j4a8R8oFDbJt+iY0nmQvuORQWZVGHWfhFnBuPD3xW/T0rpT7ZSuw1DZB04WKy
         auTx2WwmxU2s8lsTcnLwqB++bTHEoylEdAbxiNJcMDLAK01Sn05CWjOoBCeoEseW3g5G
         i/2wjH/4AZQAUyPCEwVbrKIMkg/BpSIqOz8cLXpGRBN1qZ2T6xmyPYoZ0rI4cSnk4svU
         u/dA==
X-Forwarded-Encrypted: i=1; AJvYcCU3yzyC036XAzyP7FRj0rS8ZKTa/bpdz3n5bRvg7KBd+Qh+Z6TtY0NqN2+YKjOhFxYfXbUc++4c5PDsTw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyp/IdvepG/jVeCUNABE8QhG3WpxdysWm8KdCpwvDApQ7CSyOH
	BcCKD/IcVfipDYd8BcJK6ZK4Zw9FhCJWPjbLO86h+joaNUH0jVz4EskUoxXaWV0=
X-Gm-Gg: ASbGncsrgOs3UX5vMii2BFiWrIFgEi9YywDlTCQWEDoxnwiQN1FkoLcAGpLb9BYJMPD
	UA0jiD5Gq4O0oaaMcDpIPcagl09vXqkM81P+boQO4rnX6ic/wcydJ/jnSlD1XyhATaNhatV7xAa
	L2qoa4vxulJbHWWyQKUquDR9obcb1MJWay1f1VCE8pDmXtl+AGovBP7V2rv9txPMPitpbz/+F/V
	jOiAeM5m8j+L+aqpdGlceG7g9e7JarC5GDAq0Ukmi+IBpJ1cVJsiUqb0pSJ56YBKt/5wgjl734v
	Xr1OXwFi9wAp7cqyFUA56BMOqX7Nz3Lw0GyNE6WWmQ==
X-Google-Smtp-Source: AGHT+IETKwfqNE6+LUefp51bAMetIMLbA43PTxyjl4cfwvVpnzMMAYTSq2DLVQgYP2Jax1dm3aYnRQ==
X-Received: by 2002:a17:903:41c3:b0:216:386e:dca with SMTP id d9443c01a7336-21c3554c994mr574535425ad.30.1737970735803;
        Mon, 27 Jan 2025 01:38:55 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9c59asm58710975ad.29.2025.01.27.01.38.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Jan 2025 01:38:55 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: tglx@linutronix.de,
	anup@brainfault.org,
	charlie@rivosinc.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH RESEND] irqchip: riscv: Order normal writes and IPI writes
Date: Mon, 27 Jan 2025 17:38:46 +0800
Message-Id: <20250127093846.98625-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_013900_290315_670C39B0 
X-CRM114-Status: GOOD (  12.67  )
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

RISC-V distinguishes between normal memory accesses and device I/O and
uses FENCE instruction to order them as viewed by othe RISC-V harts and
external devices or coprocessors. The FENCE instruction can order any
combination of device input(I), device output(O), memory reads(R) and
memory writes(W). For example, 'fence w, o' can be used to ensure all
memory writes from instructions preceding the FENCE instruction appear
earlier in the global memory order than device output writes from
instructions after the FENCE instruction.

RISC-V issues IPI by writing certain value to IMSIC/ACLINT MMIO
registers, which is regarded as device output operation. However, the
existing implementation of IMSIC/ACLINT driver issues IPI via
writel_relaxed(), which does not guarantee the order of device output
operation and preceding memory writes. Then the hart receiving IPI may
not have seen the latest data yet.

This commit fixes this by replacing writel_relaxed() with writel() when
issuing IPI, which will use 'fence w, o' to ensure all previous writes
made by current hart are visible to other harts before they receive
the IPI.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c      | 2 +-
 drivers/irqchip/irq-thead-c900-aclint-sswi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index c5c2e6929a2f..275df5005705 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -27,7 +27,7 @@ static void imsic_ipi_send(unsigned int cpu)
 {
 	struct imsic_local_config *local = per_cpu_ptr(imsic->global.local, cpu);
 
-	writel_relaxed(IMSIC_IPI_ID, local->msi_va);
+	writel(IMSIC_IPI_ID, local->msi_va);
 }
 
 static void imsic_ipi_starting_cpu(void)
diff --git a/drivers/irqchip/irq-thead-c900-aclint-sswi.c b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
index b0e366ade427..8ff6e7a1363b 100644
--- a/drivers/irqchip/irq-thead-c900-aclint-sswi.c
+++ b/drivers/irqchip/irq-thead-c900-aclint-sswi.c
@@ -31,7 +31,7 @@ static DEFINE_PER_CPU(void __iomem *, sswi_cpu_regs);
 
 static void thead_aclint_sswi_ipi_send(unsigned int cpu)
 {
-	writel_relaxed(0x1, per_cpu(sswi_cpu_regs, cpu));
+	writel(0x1, per_cpu(sswi_cpu_regs, cpu));
 }
 
 static void thead_aclint_sswi_ipi_clear(void)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
