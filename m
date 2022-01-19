Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F3CC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 18:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MEBg4VBxErqLwPnNgd1+W9PEim2M3F+3QoNfaTYxwRs=; b=oEZIknk+TRtRF9
	5L9OxBz/PF4EZL3VznNJyB/P1tvnW87681iD/hqLzyu4/wIV8/eVt7A0Py9UCxumtbfJohOJ8Q3Qm
	JhGMFgAv2VipW8nOF+Wooj9bMS90zTMqZGbCngXR/hTQQAKGNDXitbNSxC4H+szh3ngU/JuqXLtqb
	gxh9rgvi6MnMKnTOwa9v0B6pKrL6dtTBNp0xHtU/SKj8dcjQJIZr8UnyilnX7SnDC3EntSS/5Tibx
	7lOQ0wM0XTRpSkBRGsFyzaAgk/buUZ/vahxtwYETmuDrnI5Oghkuc/fGhuXZDafjYqr/BJmP1fB9A
	PskMWN/1OXkPsZvEV8lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAFvi-006reX-3q; Wed, 19 Jan 2022 18:43:34 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAFvX-006rZg-0w
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 18:43:24 +0000
Received: by mail-pl1-x62e.google.com with SMTP id t18so3012369plg.9
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jan 2022 10:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=/Cfe1873xO1xXDXTVkWc+/TfrkTu3OhMH8ndAhhKuV8=;
 b=zxr8zMQ/v6hklXsy25B8aji47s03VEDDq7tlii0h51fyxYtnizKlUP8z//SsQkRCVJ
 POMCZf6PzITCxlYYc/Kyz0ex7PQUFPkrLym8ZKdtQLIJ429E/Bx4t6giTvTJWxafudw7
 ljXoCHWLKV4vwlzNg3vyYbn3Pl3ibKvvkPvzRrCp8pQLMICF/6sjy1NMYqtdeFVRQ/sW
 EKlYMx1xO06giz9PP6xa1/c6r2I0dzGzxf6R2PDvzA/Gnhl69zn2dH29NhHEvCvA1cUH
 A57i2xVuky30ApXa7jX4/OTKHHe5H+hRQ6y7qIIhYGERMmdbSbzXlPAnS5DrF8cflA3d
 u+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=/Cfe1873xO1xXDXTVkWc+/TfrkTu3OhMH8ndAhhKuV8=;
 b=zuauitYBY7bj9gIYTgP3sKuI0Bsr0Wkiw4LEIPm9qlP39J0QZPvA/QIpm2gLYWLOqW
 xHa5Yq9utZ0NN8oBX8wLxULjLMI2Ah0Z72zXveWiq1VhYj7MMuNXOzaoccY0lFGGa2U5
 jLwcSll7f76CDGitTHkdqD3FTo7yyufT5H2Y50COZ4dH2RrQPYlUzzhYCiDP5n8/HiKM
 oXZzARirthQ2GgjpwQgaYmY+TkRfiBXkgRSjOExS6MP7NbEzbM0VFbG7VPx42BkcwpIO
 PqZuDfovbBtZe0JdBZCdiTF8q1RxiZWXmUoGNgI1Mx27VqDqvzNhU2a/b/Q9hHWp9gl4
 bsgg==
X-Gm-Message-State: AOAM531/qfLIMEN9mi6j2lHAugHrKQuxxwO1hLvZZ8ZQUyKjD/Ffd9Ts
 MEwkU209OF5nYpHvqfvKuwr41g==
X-Google-Smtp-Source: ABdhPJxHzUywvLngC9h5BepVMrgb0A6N9EplGMmY9S8f0T/lugWlcTR7yUS+ts/TTrD6Yjoos+sZEA==
X-Received: by 2002:a17:902:8695:b0:14a:f006:db03 with SMTP id
 g21-20020a170902869500b0014af006db03mr4985763plo.173.1642617799505; 
 Wed, 19 Jan 2022 10:43:19 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id ga21sm5618700pjb.2.2022.01.19.10.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 10:43:19 -0800 (PST)
Subject: [PATCH] RISC-V: nommu_virt: Drop unused SLAB_MERGE_DEFAULT
Date: Wed, 19 Jan 2022 10:42:26 -0800
Message-Id: <20220119184226.15867-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, anup@brainfault.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_104323_094647_66F3BAF9 
X-CRM114-Status: GOOD (  10.30  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

Our nommu_virt_defconfig set SLOB=y and SLAB_MERGE_DEFAULT=n.  As of
eb52c0fc2331 ("mm: Make SLAB_MERGE_DEFAULT depend on SL[AU]B") it's no
longer necessary to set the second, which appears to never have had any
effect for SLOB=y anyway.

This was suggested by savedefconfig.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/nommu_virt_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
index 385cca741b01..3bfd063b70c5 100644
--- a/arch/riscv/configs/nommu_virt_defconfig
+++ b/arch/riscv/configs/nommu_virt_defconfig
@@ -24,7 +24,6 @@ CONFIG_EXPERT=y
 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLOB=y
-# CONFIG_SLAB_MERGE_DEFAULT is not set
 # CONFIG_MMU is not set
 CONFIG_SOC_VIRT=y
 CONFIG_MAXPHYSMEM_2GB=y
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
