Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6980FCFC52C
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 10:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qv7dy11FR5CxaGA7+mRXzJfaNu+z1ofre+ECxYHqPyQ=; b=I4nR3LaCg95VfS
	oKVIXAx+9u6e6igOeCzfzQisS9vXJNsIoH2zs3k1Zwb74YhFZdViGy5COZMQC8TvEJNqmRbY1on4r
	1LoIzZ1qPnBSn/H9besK2cNSpMmTdQjQ8HIMtDp4kji++LGS+h9OKNo2iGq4dSBbRyyTDHc16eUE0
	j8/SOYIMM7gcr19pikHnHJZfjcnZawdTzZE7QbICb0UgAGynpF+sDVZTjCmosgFd2asfJxtjzZomF
	dYxcrBb1O+vLjpF929cMxeEhK9J6Yh6JzYphmJLIaOYDOJ6zVRnVkrpzYJuYL6Autn2grVkxKzkGM
	lse6z+3gLlFC09v40uaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0HwE-00000004dV2-1XeL;
	Mon, 14 Oct 2024 10:04:30 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Hfj-00000004aiC-1fEk
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 09:47:28 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20ce65c8e13so7315315ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 02:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1728899242; x=1729504042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n58iiwTpzY85BchUZIr1TDODnx4LudJgqcinpAoQ7vk=;
        b=gocCSX7XQf7lU73n4/3IBjaOUtXKCEVopjCiECdlGgtb8bZh3dSy4tQjLW1aJPuvl3
         U7K2r9jAiC2kK82nn3bX7TyPVjS+YFihWQEhrPl+YRDaSrVOjf6OkbX84FW7pknjnz0g
         aOD9uTacts8Kl9rR3LXdFYHcL1SX4ziPpywkIeUVRWg+zGVeNrLmyw4N0EiFr/8zpOPZ
         o5v0i/M/VtsrgRbz9LSJS5DaJZmBrLuuFGW//2YcFBAfKT7eWvFmOfDTiEPMM8ULpWCU
         f/7PJ4rvwObLP5QN1QI1pTLADkTZXNXRP8SlWkDQiEGZyLVFZj6KMJbX+rlNeAhZGHqE
         d6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728899242; x=1729504042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n58iiwTpzY85BchUZIr1TDODnx4LudJgqcinpAoQ7vk=;
        b=L+aG3Ug96rDbV5ylp4qVo4apizhRMxQ7xqQ7HYtkwPZINR2YLnNU1iAxyXqUUacFek
         +eB4dqXL4h+Hwv3LCWPKphIk6niYWDQ9qyCX8i/nsRTgnSFuMmyaPfPKgYMjbpHAdLq1
         Hg7q19G600LuE5cC521qmgK2ZganMqbXGG2aIuwjBvkwanVHLpwOjd+GxdKux02cYIU8
         aa8OIrP95u1uxP8GwKKf+CmzbU605bvuhZw7q7zGxB37e3S2vtJ4SgKYey/PoHkvgZlN
         ky4jXJ6L0nmDPMlQLy+bbmS81V3oWdexvPdI1DLB5HVOdaZwfDFD9RfC9XZEPW/RTVwq
         AyLQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4wva09Itj9gEJce5hagrXEYcfZw4ipCu4bYwbYF9zZitwkyj+UFj6YD6R5+FisgcFSfqoORw2zyjttQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCRZ3ewJUzl72LCt7UWAH3zal3A3tbCAbGUegQrLDWI5uFAyhb
	Powfk+kgo4QWwqRdFgAfu3VcufGZkgtqCytKrxklq/FOcShtdsFDhaVWTE0mU4k=
X-Google-Smtp-Source: AGHT+IGmzF68/qQ+7bOjFdgyKBRsCojyZ+YIvq/M5Xf7hscDg17luLPgQdaAdaYtZxk1MyR8puiWEQ==
X-Received: by 2002:a17:902:d588:b0:20c:7898:a8f5 with SMTP id d9443c01a7336-20ca148bea0mr155253285ad.28.1728899242026;
        Mon, 14 Oct 2024 02:47:22 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c2133besm62817625ad.211.2024.10.14.02.47.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Oct 2024 02:47:21 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: punit.agrawal@bytedance.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	sunilvl@ventanamicro.com,
	cuiyunhui@bytedance.com,
	ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	jeeheng.sia@starfivetech.com,
	haibo1.xu@intel.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: ACPI: fix early_ioremap to early_memremap
Date: Mon, 14 Oct 2024 17:47:05 +0800
Message-Id: <20241014094705.71775-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_024727_608293_69D286E1 
X-CRM114-Status: UNSURE (   8.69  )
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

When SVPBMT is enabled, __acpi_map_table() will directly access the
data in DDR through the IO attribute, rather than through hardware
cache consistency, resulting in incorrect data in the obtained ACPI
table.

The log: ACPI: [ACPI:0x18] Invalid zero length.

We do not assume whether the bootloader flushes or not. We should
access in a cacheable way instead of maintaining cache consistency
by software.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 6e0d333f57e5..3177c9af8764 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -210,7 +210,7 @@ void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
 	if (!size)
 		return NULL;
 
-	return early_ioremap(phys, size);
+	return early_memremap(phys, size);
 }
 
 void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
