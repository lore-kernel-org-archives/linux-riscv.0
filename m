Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB9BC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Dec 2022 18:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q1plqMK9i6tGsejuacKZKlVawby3oU9yB9P7D+ZDKy4=; b=cKf9ZIxoxqcV2J
	D4KXFytrhPSnmlHBlplY/2w30HoeRxkzJatziDWtC2sLMMXCC0bCSj+BI6kgcI4vjjXjFrFPMzjWQ
	cvLzhbw5V70UemavfI+qQZR4R9Tcl5UAwrIal7zULp3a1fmFj442hsic1bOSJ8U7rQWs3FRy024RK
	Bqt6q5TdjsgfUfgu1FOSA3VLraogC8QPhGdQzDYlStFKQqhCO826nTGTH3MqEDEypnTbdYaRmkQmg
	ZrmFlAI8boUFGMOv12s16tm316iJKAZCrpFoTE1W1TVZCHZOyRl63KlpbiBs1UR5smGfUNpmfkOK+
	I6/IfCmYm3cN6q88Isiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5WY0-001edq-2a; Wed, 14 Dec 2022 18:32:04 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5WXx-001eaw-H8
	for linux-riscv@lists.infradead.org; Wed, 14 Dec 2022 18:32:03 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 62so2543682pgb.13
        for <linux-riscv@lists.infradead.org>; Wed, 14 Dec 2022 10:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=tELdPw6cFVNcMyBhuIyOulB/MhXq/rKQ1MSMiPfWj5c=;
        b=y6Q59yYYpbQekqcn8P6vPhRbEADfwYvjlPI62C8YD2vXLb40XRQYIecXP+TjzB1GOT
         tcDSfSHDD7Uw9P7hrK0Q8yHEJEyAucCPUYd7IbO9ScJmETl0dTJW5LQSNfbXPUBlQVu3
         Mn6pWksO7c49TcL0JLtGrmjcitT51OaAWGm4MJoJMljsuSu3bpAeUW2u6kKS3PzbVtRW
         yp/H1czioEipYvzWtU7TdBOGRkHMA5KLduBivzJKW/racpPMfI6KnxQ2EZESUQD7NV0V
         0mZCnZsdEOlaub+s/UB0TRAcjasOefUi29XqARGOCcv86r7honzhsBzKnMbKnR7aUHvb
         IkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tELdPw6cFVNcMyBhuIyOulB/MhXq/rKQ1MSMiPfWj5c=;
        b=Ob/yr8XOFDyKOlNVWPy+ECBdq1h/lmUmqB72L7GGdoFtFlmgFJYkHNBScmPE1XiMoN
         KVJfbls/LimRyjEebj932EfCD+UAdD5zpFNcAdXmvQeMc4N9MVsPFDfSOltfz6sXFGQr
         oTV5y2B3Nq9cOFXl4iMlPT2L3sdhyjaPti/DPOcV17kFd4E3z5tSkokPy7dG6mbHfGqL
         6nH/v2VmfWpkZmW33MXfyQCgNfNYeSdhCTdfPLhqnrza1+b9WEqxd0qiyMHcsFShr+0s
         7J2aI30MCY8HcNBt88lAMszrnPACRd0io2ktB/snVgW+kUaC2tg5NuyEiBlcYsPpPsCp
         j96A==
X-Gm-Message-State: ANoB5pmhXnKcuQbNSICxaJofBlQagGdYG3iuTojEWlEztVGjIqVpJrby
	m3GbV6TfK+/iMObWfT246qGPNUZ0qpUiUzgr
X-Google-Smtp-Source: AA0mqf4HzKUoz5ydnwk633gHlvihbkPu5a+uyaupKo07EXeqhOttetSGXnQzPJJj0KTpewQOOM5JkA==
X-Received: by 2002:aa7:81cb:0:b0:572:8b7d:f350 with SMTP id c11-20020aa781cb000000b005728b7df350mr28816199pfn.26.1671042718997;
        Wed, 14 Dec 2022 10:31:58 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id d5-20020a621d05000000b005769436a23dsm153889pfd.218.2022.12.14.10.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 10:31:57 -0800 (PST)
Subject: [PATCH] RISC-V: Disable IPMMU_VMSA on rv32
Date: Wed, 14 Dec 2022 10:04:09 -0800
Message-Id: <20221214180409.7354-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, arnd@arndb.de, iommu@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_103201_808571_A77102DC 
X-CRM114-Status: UNSURE (   8.45  )
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

Without this I get a Kconfig warning and then subsequent build failure
when building allmodconfig on rv32.

WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
  Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=y])
  Selected by [y]:
  - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=y] && !GENERIC_ATOMIC64 [=y])

linux/drivers/iommu/io-pgtable-arm.c: Assembler messages:
linux/drivers/iommu/io-pgtable-arm.c:330: Error: unrecognized opcode `lr.d s4,0(s1)'
linux/drivers/iommu/io-pgtable-arm.c:332: Error: unrecognized opcode `sc.d.rl a5,s6,0(s1)'
make[5]: *** [linux/scripts/Makefile.build:250: drivers/iommu/io-pgtable-arm.o] Error 1
make[4]: *** [linux/scripts/Makefile.build:502: drivers/iommu] Error 2
make[3]: *** [linux/scripts/Makefile.build:502: drivers] Error 2

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

---

This one seems pretty ugly, but I like to at least have a workaround for
the allmodconfig failures before sending up a PR.
---
 arch/riscv/configs/32-bit.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/32-bit.config b/arch/riscv/configs/32-bit.config
index f6af0f708df4..7a2fa9b37b1c 100644
--- a/arch/riscv/configs/32-bit.config
+++ b/arch/riscv/configs/32-bit.config
@@ -2,3 +2,4 @@ CONFIG_ARCH_RV32I=y
 CONFIG_32BIT=y
 # CONFIG_PORTABLE is not set
 CONFIG_NONPORTABLE=y
+CONFIG_IPMMU_VMSA=n
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
