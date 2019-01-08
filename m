Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCDFC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 19:46:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A6982063F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 19:46:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jYUFQnM2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJvbDVKo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A6982063F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5+sCPpWSrJG1RXPn53X1bkR6k8O9QuyoMFo1ov52RMo=; b=jYUFQnM2shJ0AM
	40Leo/8DYa6mOnvkb/+l8dgmcLlUQB+AWpmSGQo3CmvhWGK8haUUCpNRY7gF2dk1eIpjJ75vA6LZf
	xPJvRuYfGaT/mse4OnQrQrI79LHCHSH/Eq/EJE21CkUf3QnalW977NzaNv7pu5cIKxN+NEfuVv2Nc
	+rLcm+3h3rg3qjjyrqCKg0rZPJCUtxTFlAM8J5H9+HJP558TL+WR5nJijuHKTuoY/N5RBPr7DZlDe
	LflRWpIfqYBYPiwxUm8LoiZaWtz/vHIoeqIPnwGfOyrTBJ24yadzlDoDhLwmHx11oNAq0RweQYtMx
	ccddVwGIXuAFr2IyfuBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggxK9-0000Dn-NO; Tue, 08 Jan 2019 19:46:05 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggxK6-00009I-GQ
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 19:46:03 +0000
Received: by mail-lj1-x242.google.com with SMTP id v1-v6so4475887ljd.0
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 11:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xMyz4mcBS17XcpDyT1fsU770HGfbZHrViPLICQbNr8A=;
 b=RJvbDVKo2vYhuJy47psOvrUL2GqAKxFKBIGk5S73K5A6cZ/FTwhlDyHm/8EuuzpOui
 POQRyD6FCNIigz4ep/6UGLPrlpUIdXQcUzAEyi+/TQYFAlU5wtKhvUfJ3IJHvXve6H3A
 w5Fp4Mb4zoNb0iR7wrnU6dVQB6ZGu+DO4wQAXCkzeaieZah2hQjLt73FXdMMbIgcC5Lu
 KTgmuZuLQHXqY08Fdezddf/5v7Cj1SSatOZU/P4mI28Dy/1qjAkiPXf9jifo+GW/jURZ
 8BPIMaN50Sv49NjzsLjVPglB7bOKPpvkmlcjDCJW3+c577UrmXH4CenBuz6aqu0O/H2L
 iAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xMyz4mcBS17XcpDyT1fsU770HGfbZHrViPLICQbNr8A=;
 b=BIFidaJDLbSGi9Fqp6y6O3YrZHKkh2XZfybjElf58JqpVyHzii6H8FDj8ivYRkrULF
 O4QRytXvza7wvSKgImzP9Bk3m+3oUYChIn1wxrWmUV1dMi5EpJBNpkbN2YVmf4y7se7g
 Dl2tI83mw7poClD9trwT2//tmUkebvt8UyqzGoQy9f3YOjjtuW+/grIdgZCk/WEbYuJr
 0UWcbmtaJtHzhVYPk8q0mesd9szXBR338cTwd5bTGTI9pMkSQp6OigSKiC0SaYuQVjBM
 RPox4JQd+KkCMuFoahLhAOyuFISUMzO+jdRrtzYdVkXdHUrRNVmTAIUKd5Lzjg0VOjSA
 N60A==
X-Gm-Message-State: AJcUukfuZ5WXEuqGjp6fH6jibjJfUmKWoLjOOvLrfh7EeZAFXQZWELA3
 UGhRFeFk9s9sVkF5D7C5IdYKDKqauxI=
X-Google-Smtp-Source: ALg8bN6eOBeUJltk0sGhLy98nThKZrAkMG1ac78qN5rraPdhMzhX9IDDZ0WmKlFIPZLI1mBFb0pUMw==
X-Received: by 2002:a2e:3308:: with SMTP id d8-v6mr1563346ljc.38.1546976759215; 
 Tue, 08 Jan 2019 11:45:59 -0800 (PST)
Received: from localhost.localdomain ([109.252.109.195])
 by smtp.gmail.com with ESMTPSA id s20sm13052584lfb.51.2019.01.08.11.45.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Jan 2019 11:45:58 -0800 (PST)
From: Antony Pavlov <antonynpavlov@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: Kconfig: fix spelling mistake "traget" -> "target"
Date: Tue,  8 Jan 2019 22:45:57 +0300
Message-Id: <20190108194557.28740-1-antonynpavlov@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_114602_544468_6697858A 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index feeeaa60697ca..515fc3cc96871 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -103,7 +103,7 @@ choice
 	prompt "Base ISA"
 	default ARCH_RV64I
 	help
-	  This selects the base ISA that this kernel will traget and must match
+	  This selects the base ISA that this kernel will target and must match
 	  the target platform.
 
 config ARCH_RV32I
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
