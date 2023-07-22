Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108B4EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 11:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=13pTUGozNQ6lFQuWIeeujFuZEUT32VyJ5YZRyP1Id5Q=; b=dxMH/cizdQ3JZE
	LN51/QRxPmaOgpdztcJHiFdCxQ+8wBRpSU1bduAVHInBYJm9qOnp3oO8Dppw2reqqe/v+20MCo4MK
	GmYdUuI0h6D/cavsLigPqEXbk/PchKDIYzRpO9eiR04BgUGWp2qDaiDDCCB+SpXx+J6G2skvnBXMQ
	gCfHI2TTVjA9qrmOlc1/OL7VYT7Wcch7kp2Tg8DHI83AAK5DMqQeNHJ3f7Q/4U9/dxQjAqor/6HeS
	D8esiXN4TAwsOnVTHP41rVJRkzpCbuRdbLT+UCzSmsj/c+r6a/7t3LadsoPCjyFi/c85acF9Qkb0h
	rjiFm+hcfwM66xfMGjKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNAtB-00Gaj4-1m;
	Sat, 22 Jul 2023 11:35:09 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNAt8-00GaiR-16
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 11:35:08 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3163eb69487so2433091f8f.1
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 04:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690025704; x=1690630504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TI4WEo8JBa7BZd/mm79h4G4Y9fT6R4+52BHu8koh6+Q=;
        b=GcLKCNdhfz9AtVp8vPinQcaHhYG4hgecZqRq5JQrY942MZ3nkQu53lwsnvSHsAssYd
         eu4qOhlWAi/ryUU+DZnGsHkL6J0C9AhN94UoGdWVlcS2T5RmFcYyUuA+zg0SfJO0kbY1
         UNH7JjmiZY8uxzA/IaUA1f8Ps1GhxwmURxo97pSXrFIZD4s9LlGp3jUDlh4CEstUIG4+
         2oUBBCOUBH84+6SNu8SMqg4MfDGZb3oKExpaNqGY1/POvysle4gzlFm5GCh75/m/IRAy
         +QAHCbY/UE0eXAeNVaNoWgRshZo0hEx5YuegIosh8gzOLY+do02zvLhSje0YwBP/Pny5
         eEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690025704; x=1690630504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TI4WEo8JBa7BZd/mm79h4G4Y9fT6R4+52BHu8koh6+Q=;
        b=AzbLGBzAypN2LzPzW7NS5jgKUOk/RTgrtzLnTidWlqqpy1dY7HqnOZdUnXaI9PhDnO
         1U88WWxC4uZ0AO8KLoeVAIxhEOROZIKzQKvgXhOnEIK9YCfyPptTSsM+HrT/cJq8eQCX
         a/MMlqRhHJ0CKX8s4Y95ZkzagHBrF8nHr2bzZd7jjUgYgn8EYk5z/TpB4iZIK3rydChk
         bCBCUpsgRNhgSFYdA0F658Lg8ju2lOGVO+wAkajjDjl1ahtr8eieOkP7yrxY7kl6qL6X
         Zs2UKlo0/VBpGfBLpgS5x9BqHIq+P/JAW+MBXK+jBytaY71yl5AsoTVjfcspJbFA0LNq
         lZKg==
X-Gm-Message-State: ABy/qLaUnj0gCfRhvzsoSTx1E5dS9oVlyJHGGEvOLNHmcams7joG0BFF
	r+2cG5jGKPe4NrLjd7Lt1PuOlA==
X-Google-Smtp-Source: APBJJlEVUSbNLiyfrVKWFMO5MdJL/wRkRpJQQubQvCsbTl7xbGOd+kXBKY85bijDDTDE7ntSB/CoiQ==
X-Received: by 2002:adf:fa48:0:b0:311:b18:9ca4 with SMTP id y8-20020adffa48000000b003110b189ca4mr7402449wrr.17.1690025704047;
        Sat, 22 Jul 2023 04:35:04 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v4-20020adff684000000b0031431fb40fasm6694886wrp.89.2023.07.22.04.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 04:35:03 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Song Shuai <songshuaishuai@tinylab.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v5 1/3] Documentation: arm: Add bootargs to the table of added DT parameters
Date: Sat, 22 Jul 2023 13:34:43 +0200
Message-Id: <20230722113445.630714-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_043506_598922_E66C8891 
X-CRM114-Status: GOOD (  10.55  )
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

The bootargs node is also added by the EFI stub in the function
update_fdt(), so add it to the table.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Song Shuai <songshuaishuai@tinylab.org>
---
- Changes in v5:
  * Rebase on top of docs-next

 Documentation/arch/arm/uefi.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm/uefi.rst b/Documentation/arch/arm/uefi.rst
index baebe688a006..2b7ad9bd7cd2 100644
--- a/Documentation/arch/arm/uefi.rst
+++ b/Documentation/arch/arm/uefi.rst
@@ -50,7 +50,7 @@ The stub populates the FDT /chosen node with (and the kernel scans for) the
 following parameters:
 
 ==========================  ======   ===========================================
-Name                        Size     Description
+Name                        Type     Description
 ==========================  ======   ===========================================
 linux,uefi-system-table     64-bit   Physical address of the UEFI System Table.
 
@@ -67,4 +67,6 @@ linux,uefi-mmap-desc-ver    32-bit   Version of the mmap descriptor format.
 
 kaslr-seed                  64-bit   Entropy used to randomize the kernel image
                                      base address location.
+
+bootargs                    String   Kernel command line
 ==========================  ======   ===========================================
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
