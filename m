Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1D0C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gG1QM11ZCufhCnqCMrj/DmDrE4/7DcFXlP/bY7SlM+I=; b=L07NlYHe5oRkgI
	R3Zh2zX24JMOaZgK1LtjuGoheDmnQupd01PkKBWD4WIsAgyUkeXLqQoPxa6GcPtUBGyUf3NYlt8Ps
	j4vjlUwUJxt1Le3eBopYUOkG65+DG6c0ZWSvFQKv8r9M0/bPkGDoNZ9t8p4Yv9tBa7fT6NVfa0oXj
	slOdFMB2bO8utkdFV6RPePy0dwBukcFz+4EuI6mIv5IhZ6lYQo73lrHA2FVMkQa2srXxSX30EpiTq
	Rh04Wx05374i3Zoh/rei4qzGgDI8whSxv6wEaUHjccVP8HZT4pfg3i/yyobCh0fIOsUL5IO+N4U8n
	UrGt3mX85ScJb9ZLyJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4pI-00DK9I-7O; Fri, 20 May 2022 15:46:04 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4oj-00DJkU-7L
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 15:45:31 +0000
Received: by mail-pl1-x635.google.com with SMTP id 10so4253266plj.0
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 08:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=U/MW6rSbN5zBgusIBhKQzePh9cnp8uaNotWlLIHTUsY=;
 b=JQyzbPvORX1IKsTlWc0qkUHSKntueefkGU8dfB3thfUfkSYRjG91vooo6vChrw9Bf7
 9Z5XY/rjVuwzsrlkQA5pcgEYx+QnJKtt5nmCn9DhLAdeLEqucw8pOG8J12o96ngdNp5g
 itgIArPjfmV3PmE0JpQd4a+cAR95KxK2BRwn0m7OypbO/75j+MGw0tQDgXO551FebRyN
 04wS/DqNscTUoNHtWgoitV/Yu0wzpeaqdS7LdRbwE65wXveDL69cHyxRiC2N2xewmWjM
 UTbLdEVcVlOT/o6zIiNUwcdDEW8akpNDod5tvoD9ZEXINE7/RJScDiChs8rEREGK9MC4
 rYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=U/MW6rSbN5zBgusIBhKQzePh9cnp8uaNotWlLIHTUsY=;
 b=0b2Y3K2NqOsPPk0hS7ymR667c5Llok1XY/Y3iLnCBSr3YT5PABd69EMnLqeLJ4ibL/
 WulpzqBAv2zx5jeAKN7CgRtWMqMTobRTyOqI8PyuqIl1sQFSjDwsdKieSK4XHsI6xsJT
 K8ghptRqelE+qq64jeAkHmafFF/jXhkzLZ23ecTRSo2+MXKbjHrRxTQIpFoQ7LgqQ/tT
 YVH/F5zqeLWXacxmBcyVbAVzQ+XxvYLdzQWRgzHq23SOzze6GwCdLwe+KhlJ+tb+TN6p
 EjLJimAyVOHiPLO9lIHkF10khurDb3lZsSNycmbyWNUh9k0vpJ7xXQph0wVQC6FBsBku
 DjHA==
X-Gm-Message-State: AOAM533v38w6haBZVUPvNEpbuXdTphWpCXpc2s6kr0jpgybhs3nt1aO3
 TUEy7yIH6vRvU16iUslGQrbjGg==
X-Google-Smtp-Source: ABdhPJxcVY/NCwkycro4XerYgWAVjh079yzImy34/DKN8DSXqYHS1KYB9wqnCW7AFPycA9lFB2mEsg==
X-Received: by 2002:a17:902:7788:b0:15e:ec55:2cfd with SMTP id
 o8-20020a170902778800b0015eec552cfdmr10405450pll.113.1653061527803; 
 Fri, 20 May 2022 08:45:27 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090a4f0b00b001df78f27c10sm2091006pjh.42.2022.05.20.08.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 08:45:27 -0700 (PDT)
Subject: [PATCH v1 4/5] RISC-V: purgatory: Use XLEN-length loads to support
 rv32
Date: Fri, 20 May 2022 08:44:30 -0700
Message-Id: <20220520154430.18593-5-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220520154430.18593-1-palmer@rivosinc.com>
References: <20220520154430.18593-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, robh+dt@kernel.org, frowand.list@gmail.com,
 zohar@linux.ibm.com, 
 dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com,
 liaochang1@huawei.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: lizhengyu3@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_084529_312826_99BB105B 
X-CRM114-Status: UNSURE (   9.98  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

This uses an explicit "ld" to load up target address, which dosn't work
on rv32.  Convert it to a REG_L macro, like everywhere else.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/purgatory/entry.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/purgatory/entry.S b/arch/riscv/purgatory/entry.S
index 0194f4554130..71c50fef051c 100644
--- a/arch/riscv/purgatory/entry.S
+++ b/arch/riscv/purgatory/entry.S
@@ -8,6 +8,8 @@
  *
  */
 
+#include <asm/asm.h>
+
 .macro	size, sym:req
 	.size \sym, . - \sym
 .endm
@@ -26,7 +28,7 @@ purgatory_start:
 	/* Start new image. */
 	mv	a0, s0
 	mv	a1, s1
-	ld	a2, riscv_kernel_entry
+	REG_L	a2, riscv_kernel_entry
 	jr	a2
 
 size purgatory_start
@@ -41,7 +43,7 @@ size purgatory_start
 
 .globl riscv_kernel_entry
 riscv_kernel_entry:
-	.quad	0
+	REG_ASM	0
 size riscv_kernel_entry
 
 .end
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
