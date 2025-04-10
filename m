Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA486C369A5
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 07:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gUSezpNG+tv1bxmlSB8jSWXI6cM5+ITA0N549WY/jM=; b=ZP8uioRWeVv2ZA
	hRgD8epwvj4tsIpL7qS3yDY254GAyFlJF6PCZVeu+UxwA1La1ay8cQvZfK9Ccu/gkPLV6yasFlg82
	fAxdMwVmKkI0p4zIwGG39JhYsT2YdxmNjGs95BG0jb2jxBnFVf4MMbLqsa2uE/XaNq6lwtTM0CMn+
	2hMjj9ng/fACPsAATaFBQZR8t/rHw/GenyxSKp29Hu6D57rnGuQC4lkK4lK0TP1n1FGeiSyOcGGK1
	GcKPzpIBAy4SsdO4YCdhb/HyDmG/0+lB4Qv/Iltucy9expgUuwLSSrpiWtxIzIs+1Y9b+52/irq3K
	XQwgAW9OyP+CfviM4cYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mUS-00000009am4-33Df;
	Thu, 10 Apr 2025 07:38:24 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lyf-00000009TBH-2AHf
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 07:05:35 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3fa58dc37c5so848757b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 00:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1744268732; x=1744873532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mh8UBXGzUbnvdsif2sw+KTYhRC1BSjBoml8SqEobyIk=;
        b=AhVkAAwK923gMXT2oc3rAtZt6Bg+ARUeWBLsClMaU26Re6RoHz6Gt1n0E9ZbAIfALq
         ppwWwbEs0dFH1naskF4hTOsv60dfmLWe/5lr7KyBK44KcaKwWSimqnz98gZyKtmbuOe7
         tsbzXFhbEfdSxGV7HzIzA2cYhO/AXL/rag3GZBVlfAk33/C0+v/a375n5UuurcrTe1oI
         gmmyW7zVCs1QEZtJ885g5QU3Z7RhqULSgBI8tqUgThEXVrMuRxNLM0YnM4CJOI7iTA9S
         F3HK4V7UifO6Lp6iD6JbFLDF4C0n58fnMj8JNQawhQmOQi/vqmbYY1BW7GHb+m4aQ/Mf
         Y2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268732; x=1744873532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mh8UBXGzUbnvdsif2sw+KTYhRC1BSjBoml8SqEobyIk=;
        b=YeTkHaozkT4KXSr/NbBCwCGt+GgWG70RtIeEsp+i1M/rIR+eYkMRd1LUxtcfJjQPxi
         A6ErodrJboSJKN5yl37wEvKw0HVCzCBWmNx4j31cGlYzT8ADyKRfwU3MiEuMWRRKK0lo
         0/IJIZIT6X0rMA+2vElZp1xlzzU+eneZSpzTbN4HLulocVqfplnY5fOT277cNjAx38AQ
         gq7fRugc0+9y3EWwDUKqwRTmGoaa8rCB1bfNN8laVV6N9lsDNtvaHuqbXAZYXkifgwCs
         hs28kb1PAgubZil3MxmsPXtDGYypLjMxwwp3p9dCQPnrJlWY8dgI68SgX9n7CHPcv1Bf
         n55Q==
X-Gm-Message-State: AOJu0YxvzczmTjQkJtBxv9esKPWwxGvw5Vjvhk8exJH2IYKk14vEGTLF
	X8v4Ac0p8sGZdUqfP4qQZ8tuxBoXe5NHuyJgLzt40ZSUOhYT1dDbRW7vF8utlmZKjIYHPcW9cVG
	vSw==
X-Gm-Gg: ASbGncvCTfB7l6JZfZR8U8LxfgkDJh1YzdW1rohUqiyNvhVtMq5n1LnkJJNnB/oZwBU
	o/ji5lBz7A/nR6ZSrggGK1iRixW4MpjLCMlH8uqk5rhuxq8ckVGkTYYitvYUYwVx+DRtcXkP5lY
	0WdqPkCUGZUnrD9xosR35iFJf61gp6Ox6saQ751BaKbVFV25zUVq9ESsGOgVFszRVf5qdQ84liV
	A2bE8LlH4YHqyFVJ7kbLUmiJdFV5+YtDlgdEo1lOMUvQbCgHL4ji5oQL1JPbTGCK6UwUzFGMKEc
	ojkUoBDRPwVCcu2zG2ku9nurKoTK9fHn8mikDtOilRCXQvgiW/rsmSa6jTaMSju79kesDg==
X-Google-Smtp-Source: AGHT+IE/XTUu6u5msxN+Qw7e3Ta4Mxkm8pI5BxCJg/oExJOAteicyPdgbu1SRM4uzbVEJeCFnx0ZuA==
X-Received: by 2002:a05:6808:2f13:b0:3f6:7677:5bef with SMTP id 5614622812f47-4007bfa52femr977035b6e.2.1744268732358;
        Thu, 10 Apr 2025 00:05:32 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40076282ce8sm461369b6e.9.2025.04.10.00.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:05:31 -0700 (PDT)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	ben.dooks@codethink.co.uk,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org
Subject: [PATCH v6 3/5] riscv: uaccess: use input constraints for ptr of __put_user()
Date: Thu, 10 Apr 2025 07:05:24 +0000
Message-Id: <20250410070526.3160847-4-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_000533_557335_0F7A8261 
X-CRM114-Status: GOOD (  10.40  )
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

Putting ptr in the inputs as opposed to output may seem incorrect but
this is done for a few reasons:
- Not having it in the output permits the use of asm goto in a
  subsequent patch. There are bugs in gcc [1] which would otherwise
  prevent it.
- Since the output memory is userspace there isn't any real benefit from
  telling the compiler about the memory clobber.
- x86, arm and powerpc all use this technique.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921 # 1

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
[Cyril Bur: Rewritten commit message]
Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
---
 arch/riscv/include/asm/uaccess.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index c9a461467bf4..da36057847f0 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -219,11 +219,11 @@ do {								\
 	__typeof__(*(ptr)) __x = x;				\
 	__asm__ __volatile__ (					\
 		"1:\n"						\
-		"	" insn " %z2, %1\n"			\
+		"	" insn " %z1, %2\n"			\
 		"2:\n"						\
 		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)		\
-		: "+r" (err), "=m" (*(ptr))			\
-		: "rJ" (__x));					\
+		: "+r" (err)					\
+		: "rJ" (__x), "m"(*(ptr)));			\
 } while (0)
 
 #ifdef CONFIG_64BIT
@@ -236,16 +236,16 @@ do {								\
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
