Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5966AEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 07:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PQhkSWSABCREN12kaIh5RT9kiYWBgQh9hXmOXP5QePw=; b=2w/RjMS8zjINxa
	9tLv+Qu6/6hd+R/xPiqZQuARcPZ0sEYPtlI+Je2orrBg9lnaXlniu6B4X4UFdq95PhEQCjDpCHNGZ
	mbN0DE744tTcD0MSSoDzLVwcwjCItwfDS/2ZFJOP8yXAhiIZK7PKHswtT5UJXji22RXP+H6RtMuKE
	X5mq45lNFBJMCblwPbZi5bWwvzno6M4wrC/h9mcvjd1RE4idsJ8rKVuJv1nLvDd7X0Z4pmofmHevC
	PjpGF7f9hSnuq1KNMpjxYuH8nkQUK2OWQwGvhEVQLXOKLuQy4iY/HEauSN7VPGFqgxj/FFYWxAYCJ
	3x7oYWOV8GU/25dKl45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsAt-00DXJ3-0d;
	Wed, 21 Jun 2023 07:22:43 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsAq-00DXIb-1B
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 07:22:41 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f87592eccfso3687365e87.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 00:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687332158; x=1689924158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wJtAM0L0emx8T5IXtJyi6+wwS3eppT8Ww5R/dqqSfCU=;
        b=xAn7hv2GhspML86OK+9CMBbl4yllWSvz7GtWiNe5kWjztw7kYR099vtWl+qdLljqDR
         xX7L1O5Q9ekcZ4EAiT0t0Br4tUilHxRM2Qs1tLI95j+VUC7elWKK+D+5gBTOqwqcXNWl
         xaEngegewU7PBuQXtJJqZQJ4Y6V3eBJk2hhBefjIVlziB/IvGBf9z0Y/k0LmhJ5HQzhB
         ytKekaJBpOXeqZVMBh+2+UkNz+ob2SF1DEI7+Q2Lo2CAU2SyKvrj6WbICyFtU+XzC3Ef
         OsdlarEYl64xwYAcKUOwVE+3iS1H+DWlq+LtRT+z5Wp9FNBMoKEDcl0w30pLE0dlzuqs
         cziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687332158; x=1689924158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJtAM0L0emx8T5IXtJyi6+wwS3eppT8Ww5R/dqqSfCU=;
        b=faGdk9SYUjLcgTkkxkcMGEHVEEMuutAH+j6/1cuDAdZeOW+XPmVeryYX9CKvG/bgff
         kO5EOzadDCj7wk38Pv6kDMBT3u0JUmBPdQsNUjM4RUQ/xnadjnOvmvep2h23VYeBzp+l
         Ck5sXdMhQlsGNcSjqSD5Q1Ep606YMVPoMHTw9jNLyHJryyRwa6YmT2j1bQK4Ax3phC8r
         X8uERe6xmaC1PATOBgNyxy6w6FoDhUBopzjv86DORN+/b8v17OjCv7abYKj3HmPx2chH
         jX2rdMbdpIzTZvROtNK/MC4LtulxzlfuNv8L5w4otmz/dKw4GlOXd7onqjXP/J7BoZAU
         Spug==
X-Gm-Message-State: AC+VfDzWNg6IwJ8dlv3zNyB8W+yBM78GhGfJATHpjauG57HonB21sqBb
	OaSvl6XdDbgavkcmNOXvSiE1SQ==
X-Google-Smtp-Source: ACHHUZ5ldRVlcEfwc998L1BxSn/pP/SIE+aK6aDHYb8bc7cN5x1dLZ7PwHw26+4Fnw1q0bmaT1Yr2Q==
X-Received: by 2002:a19:9142:0:b0:4f6:394d:96c2 with SMTP id y2-20020a199142000000b004f6394d96c2mr8645566lfj.29.1687332158089;
        Wed, 21 Jun 2023 00:22:38 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id f20-20020a7bcd14000000b003f7f2a1484csm4192394wmj.5.2023.06.21.00.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 00:22:37 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Song Shuai <songshuaishuai@tinylab.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 1/3] Documentation: arm: Add bootargs to the table of added DT parameters
Date: Wed, 21 Jun 2023 09:22:32 +0200
Message-Id: <20230621072234.9900-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_002240_636485_FF2DA62D 
X-CRM114-Status: GOOD (  11.26  )
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
