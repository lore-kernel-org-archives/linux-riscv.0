Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDE9D60CFD
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2024 23:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AFSxZbRu99z+xO+tH0vwJXgZ39STN2thsd1r2cou/o=; b=TFHq5NhNNDBsW5
	e6MHMDl36/yApcvGyzy7eN2TWc6CbVqWUboHpoaHxJu6Fjw8DaYbV15ITubrkTdIGH3tb2E181v/p
	cgfUtoP3W8Gl7WBH6Tq3wqIzDdxeJiT5seZ5W/Aokbyxdsm7EObq3egwtQIKsUIzMgp6Q65fq2MjO
	jpEwimpVLWq5b6tTCiOAhjhglLfq7YRgypYuOjxubtdGzUR2OmwOfhkuTk9iWSKBdmExjlRcNm52r
	6RYAR2RNchL5KcoKW0gSQDTMWopbfT4GHbig9tf13wUHEzabQj0tQ32q2NbId6rhmbRAJtbYF2YgQ
	pKxHKYEuJaMWUop/SjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAkg-0000000AoL8-1R8x;
	Mon, 18 Nov 2024 23:01:50 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAkN-0000000AoF6-2CpE
	for linux-riscv@lists.infradead.org;
	Mon, 18 Nov 2024 23:01:32 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7b152a23e9aso16170985a.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Nov 2024 15:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1731970890; x=1732575690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PToKMxR8SXs7rV9viWVleXFNB1vBa7oV5mNalHrcMMc=;
        b=hWmArOlAOuIN4Vh7EpXVzyWqxZLrTWzMEv3xfiDHrxaFzeWQKVR9IeU4NE6DEhwfQy
         /bLs4ESRthjhIAfDQKD/UXQK/jBWLvzPAAx34bQRHBFm+zamDMmICYQB+4cvrZNJohSe
         HHYTw/in1LUpeMuRVglP1PrZbLfagu4rXa6z8+h4EA/Y9Nowp/IEqCUfQSK17FU/Ds07
         MZdmAP149NqTKZ5QK5lxtq88KZ40JpowIj/xmGAbo/EX5zd/Eaa9HUvSrqOE4xry2Xiv
         zAHkbzORBdz6aWfzbzL7HuPDb5Fd4teJZcsS6TS7S6ten33ZdgFUAbV3ZYgATGItGytC
         6TQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731970890; x=1732575690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PToKMxR8SXs7rV9viWVleXFNB1vBa7oV5mNalHrcMMc=;
        b=cG0+pANjmsqkqT380dBjLXoKTL3o3ZpNuUbT/yuLj0RGPwOwY4HpKEsSnTlzvB6BCz
         OoAiBVeGSm7oUXkXa0UfELxRJPWAirRfW1DMNlby2klLxd2+oaCAhCoRw+7+6in+LEtj
         hPJQNcovtAf+KKoh+J0X/YsYomZ/n70E0pwSmPYznkaGApVgvnYHMzM5n/NvdbDAi/6V
         qaOrw0UtKryNEejWK91tQ/T+ADjvq6MjtwhOUHRqJf0i6McqtRu9vSBB9te/J1QYpOwj
         kopluS4wrfe3p9qLYPbHYSNzYjJLQD6dVA/FfeYE2XE90xwG+QQiHTIFP1P9bid53jSu
         MpqQ==
X-Gm-Message-State: AOJu0YxHEblJD+b9nTc5wNeP85st3/3NmAeIG1aWd86+gMfT6C/oMBfS
	pNjlFEXTy0ENyyzMqO+CgCahLcszSmNoAzyoq7TnaLTrYOuWmtgh1ENxcoV8dg==
X-Google-Smtp-Source: AGHT+IEdKYZYKIfiFMuOvuSqJaFWovb+3yVp8wkhP6JmHG9WTJacACUFPkjQt/TtG4UdQbsLVQzgYQ==
X-Received: by 2002:a05:620a:45a7:b0:7ad:832a:4063 with SMTP id af79cd13be357-7b36229a32fmr1994256685a.7.1731970890344;
        Mon, 18 Nov 2024 15:01:30 -0800 (PST)
Received: from aus-ird.local.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b37a897eebsm35344185a.94.2024.11.18.15.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 15:01:29 -0800 (PST)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH v2 2/4] riscv: uaccess: use input constraints for ptr of __put_user
Date: Mon, 18 Nov 2024 23:01:10 +0000
Message-Id: <20241118230112.2872978-3-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_150131_571155_E2920F2A 
X-CRM114-Status: UNSURE (   9.17  )
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

From: Jisheng Zhang <jszhang@kernel.org>

I believe the output constraints "=m" is not necessary, because
the instruction itself is "write", we don't need the compiler
to "write" for us. So tell compiler we read from memory instead
of writing.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
 arch/riscv/include/asm/uaccess.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 09d4ca37522c..84b084e388a7 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -186,11 +186,11 @@ do {								\
 	__typeof__(*(ptr)) __x = x;				\
 	__asm__ __volatile__ (					\
 		"1:\n"						\
-		"	" insn " %z2, %1\n"			\
+		"	" insn " %z1, %2\n"			\
 		"2:\n"						\
 		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)		\
-		: "+r" (err), "=m" (*(ptr))			\
-		: "rJ" (__x));					\
+		: "+r" (err)			\
+		: "rJ" (__x), "m"(*(ptr)));					\
 } while (0)
 
 #ifdef CONFIG_64BIT
@@ -203,16 +203,16 @@ do {								\
 	u64 __x = (__typeof__((x)-(x)))(x);			\
 	__asm__ __volatile__ (					\
 		"1:\n"						\
-		"	sw %z3, %1\n"				\
+		"	sw %z1, %3\n"				\
 		"2:\n"						\
-		"	sw %z4, %2\n"				\
+		"	sw %z2, %4\n"				\
 		"3:\n"						\
 		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %0)		\
 		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %0)		\
-		: "+r" (err),					\
-			"=m" (__ptr[__LSW]),			\
-			"=m" (__ptr[__MSW])			\
-		: "rJ" (__x), "rJ" (__x >> 32));		\
+		: "+r" (err)					\
+		: "rJ" (__x), "rJ" (__x >> 32),			\
+			"m" (__ptr[__LSW]),			\
+			"m" (__ptr[__MSW]));			\
 } while (0)
 #endif /* CONFIG_64BIT */
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
