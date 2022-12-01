Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7D9C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 15:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xem0OW5rMKYG7ayhLTyWUu3Bi4cy/J7+O4pE7paKce0=; b=FYqXWS6BlMczC9
	cSiV34l8KhR86S3e45zldjUNEwQ5JawOc1FCkZPdevN3AFQFQfPbNJ6zvOljziFW0iF8CA2Bodnjw
	3bPJLLusa0l469lsou5Py6LwKcUbDMWKVOQiEvYQLrrv19AvOdK3MPDxuYR6mNrfQxsbu03hwTB+m
	7tQUTeLVu+29PObU459im+rb6ioLu7bD+u/PXUmoSGSfAkMSfcIa/Jt61qwH/svauh3T3UFUHysMJ
	8xy5MoiPoIl3YFW8Gt8RJB5KjuV3Qjf1RmFTpvxY+hVndBjjkpfW3nyyQ8kaR7jpthqoRbfogEyeP
	lMLEQ14VFgEK9I7Z6ZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0lGJ-0089Co-1D; Thu, 01 Dec 2022 15:14:07 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0lGF-0089B1-R1
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 15:14:05 +0000
Received: by mail-pf1-x42e.google.com with SMTP id c15so2114214pfb.13
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 07:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/er6mpZXuoOXiwjII93qCAD0DwhwK6TrNP8twH3ex9c=;
        b=Wh42ilCrtHogvmaFxBSyOZkt9nk1GMDPGzbrMCvJqS4LX9nGXWV3BTsxxgqqX4pNDW
         pzZzVVkViYwtb3woFOL2sBIEQ+xa3ceXjzFC77TfjktFqbm8tjMuyDWjs2DHyrtFKSZX
         esfCXo1cepoNbyjO0//ov0aSQradFf0ofVzZpSjkP7Ft+cWCcJGanQJQuZ/9DCTQQeT+
         YdULKrVNJYFTrPeWP9Bh/YEIg7Kd4sFE/zTVECh5GbQZ5ZjQM/jEU7FOJYWJ6fB2vKlv
         i3RluPWBAC7jx9ZuPMtYgRF5wHnCs/iD5pRboq/U8la8UIKoSiQWUclbYNEhOF8XqjGj
         yASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/er6mpZXuoOXiwjII93qCAD0DwhwK6TrNP8twH3ex9c=;
        b=tK24qLk1bRMy8U57LFXnD4YynS67enQFPF5K+6MKP/1mIk/yAaubzzlxj4CaIKPue0
         ouU6y3S2iXhz5yezWhctReOFaPN9uRQ6Dn7tLVaDHot4LagARloWeiaJDVPVOLvioodt
         j0udeZqAXvsrckznTvdyItBNhieJpeTxcMBekYGVR0bB+qi9ObZWFhBVyZfziTdz/RQk
         G2J4fV228SBxioZO6T9qQqIbWgXZpX7UNNOmOSOxByn4uulMpSuUgKbHL3Xe2WoFG0Sf
         7Bdg32Jdcz90CCOcUTnGUdCUt1c1M5lAUzAUx2N5t8A9Q3ghx4kE+8lhpAdTDzrt8Nps
         +pwQ==
X-Gm-Message-State: ANoB5plfS+aYUeEXCEhS2c9BPHoLtX7dflhzEBYCj+PXOTLx9NsnOLVU
	1tkoQLk8N+xeLdvjfo9blzg=
X-Google-Smtp-Source: AA0mqf4wg1LApXKzAVVBhTOwJDdWKh84yT8AM7iTreutx1Uu7x2S5xSi20wRnhDAkZVcxljrbKbMaw==
X-Received: by 2002:a63:6742:0:b0:478:538a:8d1b with SMTP id b63-20020a636742000000b00478538a8d1bmr9700251pgc.140.1669907639530;
        Thu, 01 Dec 2022 07:13:59 -0800 (PST)
Received: from localhost.localdomain ([112.2.230.25])
        by smtp.gmail.com with ESMTPSA id z32-20020a17090a6d2300b002190eabb890sm4996174pjj.25.2022.12.01.07.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 07:13:59 -0800 (PST)
From: Song Shuai <suagrfillet@gmail.com>
To: guoren@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	heiko@sntech.de,
	anshuman.khandual@arm.com,
	suagrfillet@gmail.com,
	liaochang1@huawei.com,
	juerg.haefliger@canonical.com,
	wangkefeng.wang@huawei.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] riscv : select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
Date: Thu,  1 Dec 2022 23:13:36 +0800
Message-Id: <20221201151336.8044-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_071403_928162_5E2BFB26 
X-CRM114-Status: UNSURE (   8.74  )
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

In RISC-V, -fpatchable-function-entry option is used to support
dynamic ftrace in this commit afc76b8b8011 ("riscv: Using
PATCHABLE_FUNCTION_ENTRY instead of MCOUNT"). So recordmcount
don't have to be called to create the __mcount_loc section before
the vmlinux linking.

Here selects FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY to tell
Makefile not to run recordmcount.

Link_v1: https://lore.kernel.org/linux-riscv/CAAYs2=j3Eak9vU6xbAw0zPuoh00rh8v5C2U3fePkokZFibWs2g@mail.gmail.com/T/#t
Link_v2: https://lore.kernel.org/linux-riscv/CAAYs2=iYn8sLQB8oh+RzTKd2VKs8MXOLX6Mwpamx5gdVVN6mkA@mail.gmail.com/T/#m62138d7a76664798d00051818a438a601eff4cf1
Signed-off-by: Song Shuai <suagrfillet@gmail.com>
Tested-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 572973103d73..c19cddb8feb9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -277,6 +277,7 @@ config ARCH_RV64I
 	select 64BIT
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
+	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if DYNAMIC_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SAMPLE_FTRACE_DIRECT
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
