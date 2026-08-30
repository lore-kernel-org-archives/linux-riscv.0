Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1335C61DD9
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Aug 2026 16:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6bphaXP9pxrY8TaYgbUTD/2ZDrYuucWDCvC7uMvXCc=; b=XoOvcTqURypv2X
	lgi4RZxsUmq3d7xS2jW/L0E/K8Y2AkRWki8I3jWCW9DGuQS01L+j7vNS6lO0KhUKTPjmTwLci3sCa
	D+I7ZwbUnACx2ynvJCT3xbCNHwCvUwHDjSu/A8lep6iOxosS5UrRtqr3AmCNRWZb1euQU3qxMKVc1
	uFTPkm75v0mkJfUxY29Kv/Vi3GPCXy9Qq6p0aF2+b2ZZaB6usgU9sIZ6bn9/6rb3EI+8n+ME5wAkM
	lfizKWTjS097FV/O+y4J+fitlpyfZjTYk5bdR3gFleXP7hGKf0AYfMB5iKMwEzjL59YAD1z7ghNQG
	BAb4OwV1wD2DdldvDmXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0i97-00000007txE-1WJ7;
	Sun, 30 Aug 2026 16:12:37 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0i95-00000007twE-1YHS
	for linux-riscv@lists.infradead.org;
	Sun, 30 Aug 2026 16:12:36 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2d53197d8b5so21365935ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 30 Aug 2026 09:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788106354; x=1788711154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NdTRN44Y9INGZlIdKi2+i3Dw0ibf1fzMAsMfvmYvVnE=;
        b=M/5rebHhl1X9nfNAp+QjUL+yiffx/l1dQ29ve6ZhapU0d5dsoEBqCOCWpv8S1MegRK
         1tKmogkMGclaxs8+tIAq6RZpw6qzHssRdIl20vS+mU+DVSeM8VglHtN2gCnLDvAfxcgR
         pS7oiRluoHDcDeabMsrH7cwKj7Px/P7VLn/BhivgotiQm7dmAYY+vW7Y9bAPUYGBvNx1
         F4Cbk5jdHCK8PA40/MXkawNE3UQc59A8D0145iZ3YfNgDGX2XcHd8nmwnRBhRXgDDoGA
         tZAB0LwwAOZlkQL4AOlFSG5S7GDKWrIQ4wrSUHwva73DTn1bYIwafmw6GHGG8wblLjuh
         MeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788106354; x=1788711154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NdTRN44Y9INGZlIdKi2+i3Dw0ibf1fzMAsMfvmYvVnE=;
        b=LuiEHQU9gIo5OfUXeiQbo12XNC3ylU8mIQxdLuqQ5Z52v6hk5zpIwVHvx7tDkWEpqd
         7hlYT8+Rehyy70iG3t2VQyZqRay9GktIi+nf6kq5SNuRjVG3iesPlcTwfQzRJIaH4vYa
         QkYaUw1e71+qHIds4pViv03OU2qIlzCFcO/RYd5v0cGvgBsgxo7AbLFoQmR04H6xkKtx
         bFnQ60nhSjncg7kQp0PzpG2C8xRNbml1pwf/JmNscJ5CbgxToNCOJcd04SmThf2JbVzA
         HCJOP/k6AdenNyqifMwJOtG09TNwwhSLm1TOwmUFeH+P59zw2eXaTB3fMnqnxDhxDfWZ
         qkmQ==
X-Gm-Message-State: AFuF++n2gDeAsbbsUGAVAlzttRTnn8e5cFyN49XQuVhy3p6Rlr3c+rY8
	ITOma8Tg848pwrp8ILdFjIcBUviM+tzjw6Kb4AelGXGxAi2jOFsjpiiYe7xfXxj3qhNYYA==
X-Gm-Gg: AYBFou3ccDxqK1+HN11NXkwBtbWm5ZGitEoBT4TowJkzlu11Wl2xX6mROtXaEsGCEYR
	sLSNfy9xaAuLpy5aJCw3NYeoumWaLGEJRlkPXXRRqx16bioM4nngx08lO8XiVzNjYPs3XrCkO7I
	CCxf6bW8zxFBKCTM2/T14ujEb8j/gqerJcX1I85ZHbxgI7VUvFeSRbLFHrRIuea3tQn1+B84Tjk
	eo6Ff22VJljaE3SqZYwO1k6y/jBv37Db5if390LeOZvCKvoQlxS8xHPyW4zLjf5X/MabjRyHhTg
	r0FIIj0YCDw4Qqp1Vxk2Tuhum+ofd/yrXIeCiewgQGPc2SVq7urTlDR/Tnwitf6u/LxjUc+ykvf
	4WEPX11rUiuBs8rUVIStFuzCgUCFxGfhjfDHhoSlo1NBvvOJerOClyl4WlN3st9YhqMvyvPskGF
	5UqI52t/hkO9sHJH1lZxn2EO05YaLff2nKKJLezZGOJj7fSWEp0ziUCmfVhHpQ4kPCPp50GosiE
	+ICL6cjsOapT+K2xgXTkC5a6zZC3K6ZQZg=
X-Received: by 2002:a17:903:1aec:b0:2d7:203b:9863 with SMTP id d9443c01a7336-2d74dc6e97fmr364985975ad.1.1788106354469;
        Sun, 30 Aug 2026 09:12:34 -0700 (PDT)
Received: from localhost.localdomain ([134.195.101.83])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm5719005eec.1.2026.08.30.09.12.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 09:12:34 -0700 (PDT)
From: Yu Jin <lambda.jinyu@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yu Jin <lambda.jinyu@gmail.com>
Subject: [RFC PATCH 2/2] riscv: mm: correct the stale RV32 TASK_SIZE comment
Date: Mon, 31 Aug 2026 00:12:05 +0800
Message-ID: <20260830161205.80162-3-lambda.jinyu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830161205.80162-1-lambda.jinyu@gmail.com>
References: <20260830161205.80162-1-lambda.jinyu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_091235_417162_AC069654 
X-CRM114-Status: GOOD (  11.52  )
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

RV32 defines TASK_SIZE as FIXADDR_START. Its value depends on
VMEMMAP_SIZE, which in turn depends on the configured size of struct
page. The fixed 0x9fc00000 value in the comment is therefore stale.

Describe the macro relationship instead of replacing one
configuration-specific address with another.

Signed-off-by: Yu Jin <lambda.jinyu@gmail.com>
---
 arch/riscv/include/asm/pgtable.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 40b1ed4f3ea8..32348787462c 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1231,10 +1231,8 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 #endif
 
 /*
- * Task size is 0x4000000000 for RV64 or 0x9fc00000 for RV32.
- * Note that PGDIR_SIZE must evenly divide TASK_SIZE.
- * Task size is:
- * -        0x9fc00000	(~2.5GB) for RV32.
+ * For RV32, TASK_SIZE is FIXADDR_START and depends on VMEMMAP_SIZE.
+ * For RV64, task size is:
  * -      0x4000000000	( 256GB) for RV64 using SV39 mmu
  * -    0x800000000000	( 128TB) for RV64 using SV48 mmu
  * - 0x100000000000000	(  64PB) for RV64 using SV57 mmu
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
