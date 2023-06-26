Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EA0EB64D7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=241po2+nvcNE+XphD1fxKYh8e4cFjiM4VfzaxhwW6zU=; b=u1FgTcY+BYX7GI
	dV50eV5ByezxByhnvrxz7Uk7MwMvHFz+rReIoCIiZz7s0ZE/B9zYuyLdd1G2r3GNWPUDgclotwOKl
	UH6SQbZbz8uauFiBu0MzKMiJVCPefHNofYSP+5TbFQUpIzINSX6n0yt6OKzaKC+RPi60st9FBJTNY
	/YD+C+9aYbn/TxeTkzk8uhInOs2tbfKuJXJAeNxQ3ITXqt5NvNlwf01l9F4VYQWF8aWI56i7mUE8g
	Ed8dOXx5tn3XM2tvdB/FnnK1gsdkVPBttNTQwkOYVgathG8GMy9sIEGc/FZ0dkZjGTqtsqzSLVT5G
	6ZSYh9vYkXZgXagnJL3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDnKU-00AP3c-1T;
	Mon, 26 Jun 2023 14:36:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDnKS-00AP2s-0Y
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 14:36:33 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f9b0f139feso47969555e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 07:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687790189; x=1690382189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yyS6js1uEQcGpjrlLFsApXkwWbdmfkq2O19nl/ntD9I=;
        b=0rRx16vPEz4otpjwTB2+xwwCPkN6laJ920t/o9tdeRTI3/IWz7rHFhmjtl4BtcLvbK
         8sd8i1ixF3tILm07mAiNcvuah+F64takI0yNg5lzTCOlWuLa+ihQipMWAUO2Kp7G97oA
         Kl18TQkv7lLhVwW0P5B06IdBRRNGQMkZCAXjn1QX/rmD9XuGHUQIL4tjK7oqW4c6xyS2
         XvOUThw0ASzBjXMK30mELoMgSwN7Os79KpEA2iYAlHD4pXmyBqLFFyOM2aiuoARShzqT
         tWGzwRLzkTbjzHvkL55xqVOVYZF9H4OdGqOpt8tX1uNXHuhNDjLsqM3YFqXjdOr1B+kV
         GlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687790189; x=1690382189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyS6js1uEQcGpjrlLFsApXkwWbdmfkq2O19nl/ntD9I=;
        b=KJtUs4rgg5JiUtTL/G8woAihcinjktCv9Kgwz/rKTaQEqHhISmwONiUS9GHcrWjCm0
         f5wAty7uIr/M7BL1ZtICACWUm5Crf4D79qFhkgrsn6WCcv1jXnCAB/c4QXbLQXaAw8BP
         pBAIfjo8odZNJdcCJy8I3X96LzWMkTFjFvfzOPsVoWHYD33ZDE7oUcykI5nq6sHDcqXP
         1hBfUz7S98063qbG2cxXrJLeoCUQFecfxxyfgMdy075SUOyabu70h7Z3Bbdhftj/lZ44
         ENrG6supnwljECu+OPRn9GWk7PuCmwLGFXo6AxTnF0qAryJ6pqCON91oOKVPDzY1tdsI
         3vfw==
X-Gm-Message-State: AC+VfDyzk0jCtLSv3B57ug0j9mta1RRwUcqQbzlozHNs66XkB0tESP0j
	bTHczBtXBzLoSkPSvXy4cnkbtw==
X-Google-Smtp-Source: ACHHUZ5trI2VVLtdJQUt4Re6CkgIlyCdijkloV8ba7d0Pgi+frLUfcc37GZ0qPHllho9aVsX9sOgmw==
X-Received: by 2002:a1c:6a12:0:b0:3fa:934c:8356 with SMTP id f18-20020a1c6a12000000b003fa934c8356mr3011833wmc.10.1687790188830;
        Mon, 26 Jun 2023 07:36:28 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id z10-20020a7bc7ca000000b003f8f8fc3c32sm7934552wmk.31.2023.06.26.07.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 07:36:28 -0700 (PDT)
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
Subject: [PATCH v4 1/3] Documentation: arm: Add bootargs to the table of added DT parameters
Date: Mon, 26 Jun 2023 16:36:24 +0200
Message-Id: <20230626143626.106584-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_073632_207784_E62950C3 
X-CRM114-Status: GOOD (  10.79  )
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
 Documentation/arm/uefi.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/arm/uefi.rst b/Documentation/arm/uefi.rst
index baebe688a006..2b7ad9bd7cd2 100644
--- a/Documentation/arm/uefi.rst
+++ b/Documentation/arm/uefi.rst
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
