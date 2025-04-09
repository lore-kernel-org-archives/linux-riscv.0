Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94687C369A4
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5+mFg6ifwqw5tnnGtAmwfz2T9oQyJysGnSAjWyaoI4Q=; b=rz29Mj/Z/UtXa9
	sQCPbZNP29FdKD0WJj+0jMtZ309WwjzUQhjGHCT31Ro0WXA3qnf68GN/MaEjafZfCUCOLpkFihsXd
	GOkV/WP7YcANtNY8Y6W3jVMsm1/zAgz8Reye89ZDVtve4v8R76TtFvI/SL38A2fPKzrj3CFISgILq
	M/G4h5NaSHPFkDv5ImImqnqvXwMewKC5dMJZSQeBUP7VmRGJxYgv0iI9bVr6idkdj3ZdIRcIaptL4
	Msd5d/rFj8iuylbwFDCA2I6So+A5vJATf7MhbP3y6d1kGXTR6b7G1cvleYKqdtnc8OrCCcaUAL0gP
	asSVaxed2kcT8DTJwTzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Z1Q-000000080wA-1Gov;
	Wed, 09 Apr 2025 17:15:32 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Z1N-000000080uo-02E8
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 17:15:30 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22a976f3131so45733725ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 10:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744218928; x=1744823728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MM8Y2cXQLfHNhNOO/T9H9RRsOLEM6CjCISm6q61gnfg=;
        b=XofGviiETANb2/WOfel2QUJHsi7T0b12fOtYNesT3Ga1tBV42EnrHDTIwtXwj58uPS
         QQfTssRsQ9FlZppmNu+LeFewz/+8R3pp/q1MIZNVDmLqDdv0+xhOVkwrpHEcl3ObgUqc
         njOVbTioiTb90BFDvtDof43xOAKpt/ZBxSbHmT6UobByLuWPEhhCudIV79+va8kl6gEN
         GBIsFXE/Qws8S4fHurxJ4GjiygnRds68Xr0ZTRbx4eNCt9BCN+P6ki7G43/Oc18/6hVt
         oduS33dG3in3NFi0sckH9d57+jCkB4kMBR3bn2/T67Oaz72DyHI0+MyErNCksr9DE6yT
         jzlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218928; x=1744823728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MM8Y2cXQLfHNhNOO/T9H9RRsOLEM6CjCISm6q61gnfg=;
        b=cvlCekYNalCLCU0s+xaWDXo2VrP0eXIRewn/WSPGZHzzM/Gi4GK3cqslMBETLF3mDW
         l13DlxqJSe4ypkI7+2BiJ7spO7S55+Y1uChzPooVQ6sJ1qt4dFHCxBoeL/XeWo8BZjer
         5G9Y07q7rEkPhm7JUsdOiQEUb7CviIOJxftHK8WeBNqJP2osAHxot003bdMtjH5STsW9
         Vom8uoC4ndXKH2oTrqXTWho0vNpDTegwirK25B0v9L9kBDhCxfq8+yCWCC0Ih8bljFVu
         PMhrBUMcOQ3z/zeFQ8uCZOPr0ZTdOdELFLc7prqBEFOW+sb+XnSE2M8zW2tc2SyFDabK
         jKrA==
X-Forwarded-Encrypted: i=1; AJvYcCXYJplK0jriszNkJhxez+TqyMxo3CbIiSK1rIwrEnzFuLMaq3EQzUAwCyOU36GYN7QQGWMGAewysWTtmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMznnUZEhf/8bEX/KdnMGOr9gT7UlFjn5aBXBNm/yn+VULDLU1
	76rb4SdMqDfkKRYdXKe8ybK168RyiSEwXLjEwT3ySxxfzO8fSYeODbg36F/YxvY=
X-Gm-Gg: ASbGncsUbs1p4+CxpNzYY3M14eERUieDrAcsx9Muh1fhDOOoIpluOZ/hj0IeQl21Fls
	caAmhFDwmjKVG6cBbx9tUDdqwensy/XDuXY+3j5cPjzo4tWvnzPIyxPYhYeGC6NRsx+j9UtWlcW
	AQvZtW1jt3gHl8avorhAv+1ESWrahGFf52yFS8fwaGPc4wsBdEz+4ocZIlWYrWhZC86xVack+dg
	ipDvlbhAY5nKMBBRJ1gahHED46rkhCrKD7tu5P58ID6rFUt5UbnUsn1a4l88RbB3EwH8EdZHVYC
	OPZDKNOb/HffA3V8I2BO9BF9RUokQxSB/uAxEablVZQlbMIZTREgzcnMP7C1+68=
X-Google-Smtp-Source: AGHT+IHV0zeKc/AImZMQV/83LcegWu1jRy/FWQ0Bc25Yi+Ag9JbG0SIUnhTRLnIhtS/lOnbgdqTIfg==
X-Received: by 2002:a17:903:1ce:b0:220:e392:c73 with SMTP id d9443c01a7336-22ac29bf75emr42739105ad.22.1744218928202;
        Wed, 09 Apr 2025 10:15:28 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df400ab7sm1721650a91.47.2025.04.09.10.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:15:27 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Amma Lee <lixiaoyun@binary-semi.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] riscv: module: Fix out-of-bounds relocation access
Date: Wed,  9 Apr 2025 10:14:49 -0700
Message-ID: <20250409171526.862481-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_101529_051481_5539861B 
X-CRM114-Status: GOOD (  10.82  )
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

The current code allows rel[j] to access one element past the end of the
relocation section. Simplify to num_relocations which is equivalent to
the existing size expression.

Fixes: 080c4324fa5e ("riscv: optimize ELF relocation function in riscv")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 arch/riscv/kernel/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 47d0ebeec93c..060f576cc988 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -859,7 +859,7 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 				}
 
 				j++;
-				if (j > sechdrs[relsec].sh_size / sizeof(*rel))
+				if (j == num_relocations)
 					j = 0;
 
 			} while (j_idx != j);
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
