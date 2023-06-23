Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C093BEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 09:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PQhkSWSABCREN12kaIh5RT9kiYWBgQh9hXmOXP5QePw=; b=w20nnT3xgjlZ1J
	WdaYA3dQX4CpKgQ8Dau0jFe+XRsczzwnp7q/RnCZiHImf5JIjlW2aH2Euo/5zIFoBrUlYR5K1+q6H
	geExroWHCu5+yOyfVF6Z6ckhoR+QXbyLxb/M/Vgi4gzMbo0VNwxLqtVkllJbiKc1DgHjiIbIpO5cy
	mZqN48PGgGXrrStl2TVEIjjKsYLzpEzbCvoW9SgxzWgYMejx2vzPzD7397zTcGcALOJUKP6P/Fk8l
	K2ixVFuZcC8sxp5kLzR0doRrszo98NE+0enfbi++/BNx4mZ9cwt2edEGxNkhM/otCDDPn+tlx1MsF
	6HKq945KUzOtwoXeE24A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCdWG-00357h-0s;
	Fri, 23 Jun 2023 09:55:56 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCdWC-00356S-2Y
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 09:55:54 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f875b267d9so519769e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Jun 2023 02:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687514150; x=1690106150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wJtAM0L0emx8T5IXtJyi6+wwS3eppT8Ww5R/dqqSfCU=;
        b=NKkG8bNv3EO4QeYMT85sNX4yymCntNQSlDHlNCBUiXhJCFZLTYnc1fxigDu1UDYqjT
         x/WHlYdO1RARm72vbFOKJXt7Xi2B+Gc7a/WaQSbrVle9IwixizNMq29S5TYpy7Lsr2La
         iuQ1s6+4Jt+oah+t9i0eHptytK7zsSCgpuxYNEom/yED+at5UjJcN8Tkw48lkezSp3ZW
         CgEHz9obTkkSzWUlis3Ov9jN3wq4G5X/i2+Uqp2Q8SdXAU4otfDnNsnspefpXF63Vo3w
         juyH31zimZv063v6oUxIjqsuPXY+ALHeFtdf+vqPr3TRwAXtLlJc5Cz6sDKOFfu7VbTq
         FOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687514150; x=1690106150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJtAM0L0emx8T5IXtJyi6+wwS3eppT8Ww5R/dqqSfCU=;
        b=GSyb9rDFKpJbITrt5uHqA4iZ/1GepyOOG08JShCPLTlunnbW9rmkdkAjo4ehqkv7sz
         hR3jNKhrG/lFm2tci/KntGK+EmuoIvfjC4AZFjSPHwZ9lwAdPt0Ub+DNleYsmsekBXyu
         GIVEqbC3TUoUSUd/uShh42mbZsQ3BwTBCM0Al/59Ubwd0mRz9HzXUse14KbFbd2jgVPy
         VzZxSd1Q2Xk5eJJybtHPzo12QbQYC/SBxDMjH2lgnAydew+hgCtcrmwU/3f2PPeM8jd5
         ZIqP4shZwtAix9OjIz+cgKj1h6U3gLTZIJIO/iDhRpoPBucrx7lEmao+MOm8YI7ka2MS
         pnpQ==
X-Gm-Message-State: AC+VfDx5gmnz2q2lRCtpE0F7Zovj4eXICronWM1W8HxjvjXsHumJZSDi
	9yIxgpr377fmq4YL7Yg8TGg9gg==
X-Google-Smtp-Source: ACHHUZ56QVDSKsm4uhHAhKIZIWN2wRB+s5t+Y+A8bNdb79k8zsowL0ID1EaqAwo4QKkcWaDAMc8Rsw==
X-Received: by 2002:a19:2d01:0:b0:4f8:7568:e94b with SMTP id k1-20020a192d01000000b004f87568e94bmr7651114lfj.56.1687514149706;
        Fri, 23 Jun 2023 02:55:49 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id g17-20020a7bc4d1000000b003f7f87ba116sm1876221wmk.19.2023.06.23.02.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 02:55:49 -0700 (PDT)
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 1/3] Documentation: arm: Add bootargs to the table of added DT parameters
Date: Fri, 23 Jun 2023 11:55:45 +0200
Message-Id: <20230623095547.51881-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_025553_052894_DF206C37 
X-CRM114-Status: GOOD (  10.64  )
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
