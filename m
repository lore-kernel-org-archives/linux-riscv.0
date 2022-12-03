Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C4BC636F8
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 06:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3Ru3IgErXyyAIdxPGP1vOiy3XUmGIbVRhHyVIFu4Lo=; b=oHHLgf7CTLbOOI
	hXn2kfV4tzFJbV+zCOU7kbcD/lf3m1Jcj7p89nGjLoewbXJoGmSJAVw4ZjhWVDq6HpdQEnpB3PALp
	jeUEoYmAbJmdUgd/f8WTNLjifvjNUfOK/qe0QshLPy7AOgiZreLBOFJJHo4DdrEIG4r8i8jj707LK
	49g8vkFGEjLCgk8rWwjfxCnnAyoy3RN+9e88fHVa6qwGxukcW3KeJOpUooAil1mFOwaQz2pfrqE6E
	wy0oRXlVZLV8UTaLb0glfu4TAhdN/o7hjahTKBfaejUgcNnsbFZEGEjWsOE5CBXyeV84EjOnPQI7L
	Y8cFna06X9+Jzbyniowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1MIi-002djR-56; Sat, 03 Dec 2022 06:47:04 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1MIe-002dgm-Sr
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 06:47:02 +0000
Received: by mail-pl1-x634.google.com with SMTP id g10so6535823plo.11
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 22:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXLvXXdTgugvaqwC5VnS0gtZiRjZW9Lq1RMlH39mGsc=;
        b=Bk8IMyiJJcigVI9/tPvFR3iMFW0qALSihXCl6Q/O+2yH5AaA8bhG3wB0ZMKYLkuwPf
         UqgRpCQW2j/D6WcogjqE+MF8OCpTYarOX1z+fV5KX1ku79rTvsUPtMvCcDoSmpMOMuVz
         DI3dL5wUHZ8hL1Z11rSxjpPQWt8xIfZF2JNScYBHPcwCzvp5Z3mMBxLBwpfCmxDo0J0N
         09drmoMJtBhGX1PxvHvSXPSyRt4miHIXCM6YQKzJYCwn3e/pens4fqt9ezpMJ4QTG6jQ
         YsjGDwgy6UrHEs8KbL1brWzVcasItFUYXLi2CjqlQVPu1x4a8b3RqNAOMyo2G83hiuZN
         EPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXLvXXdTgugvaqwC5VnS0gtZiRjZW9Lq1RMlH39mGsc=;
        b=fV8TWvHg/4BC3CBeezgjciXsLj5Ffr9kzHfGcBs3DhvZ2jhyz1NCCD2teBhyEinTLN
         gNbPBXx8hebBYrMxBgv3/WBiUwMTcNLOsSX/LSeH8evuerZm18d1tg1JGX0LmoIdud2D
         poRm+SZ0tB+DsTGOuB/z1+hPg3TPXBiGasteL6Yhk7IlT2Ktr+FsXVIObPzpNyEUZXYb
         mE3K695YGu2mBAapdLLw+XBJxVS/cahd5Rp/kitwvTCjBhH2O4uBCu2FAjo/kYJxcvJc
         g51BA4O/4+aDOVjbTlvFTzYF2bLWzOvuCKFAPxzpsrqUm+KMRF9jCnD5Mfww20Mgd5FV
         S57w==
X-Gm-Message-State: ANoB5plF80LWcrV2KsdIq8TCGmpcZY89CtrI7cZjYVkyPezxAOUoG/ls
	4vZqkwNQZvqzuqArsbIFWzvBCA==
X-Google-Smtp-Source: AA0mqf5EueLG5umo38k+Oy9FmPwR0t58Ma+OGjVEDqGQWiGk3snpn+pIfIke8R+7tljJ8H3spMsNEg==
X-Received: by 2002:a17:902:b20f:b0:188:fd02:5462 with SMTP id t15-20020a170902b20f00b00188fd025462mr57588715plr.36.1670050009954;
        Fri, 02 Dec 2022 22:46:49 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id t17-20020aa79471000000b00575c8242849sm6102091pfq.69.2022.12.02.22.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 22:46:49 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v15 1/9] RISC-V: Clear SIP bit only when using SBI IPI operations
Date: Sat,  3 Dec 2022 12:16:21 +0530
Message-Id: <20221203064629.1601299-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221203064629.1601299-1-apatel@ventanamicro.com>
References: <20221203064629.1601299-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_224700_948402_2C4D1143 
X-CRM114-Status: GOOD (  10.26  )
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

The software interrupt pending (i.e. [M|S]SIP) bit is writeable for
S-mode but read-only for M-mode so we clear this bit only when using
SBI IPI operations.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/sbi.c | 8 +++++++-
 arch/riscv/kernel/smp.c | 2 --
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 5c87db8fdff2..ac99a70ead6a 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -646,8 +646,14 @@ static void sbi_send_cpumask_ipi(const struct cpumask *target)
 	sbi_send_ipi(target);
 }
 
+static void sbi_ipi_clear(void)
+{
+	csr_clear(CSR_IP, IE_SIE);
+}
+
 static const struct riscv_ipi_ops sbi_ipi_ops = {
-	.ipi_inject = sbi_send_cpumask_ipi
+	.ipi_inject = sbi_send_cpumask_ipi,
+	.ipi_clear = sbi_ipi_clear
 };
 
 void __init sbi_init(void)
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 760a64518c58..c56d67f53ea9 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -83,8 +83,6 @@ void riscv_clear_ipi(void)
 {
 	if (ipi_ops && ipi_ops->ipi_clear)
 		ipi_ops->ipi_clear();
-
-	csr_clear(CSR_IP, IE_SIE);
 }
 EXPORT_SYMBOL_GPL(riscv_clear_ipi);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
