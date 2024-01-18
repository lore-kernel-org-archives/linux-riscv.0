Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB621C47422
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 21:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JecznpbjI0/NvaGoMLwxUh2AJOcx0hxx/WUmyhYULRE=; b=Va6iyv10Q5UASO
	8O2onnZKxm6eu5/arFeDcUEbZB9+aweMj64xFb5FF4OyHQqHjOfbOkePLtSfwGv+4An1i+okYxA7U
	PM9UxU5rs7/UUG25pVpH3pDcKEAAimGJuyALxikhSQiUTqq00JPsKk9BTN/jR3a14cPLzPr6lobds
	xHqUUZyr8wFMwpBFmcdjzWE5QwpfKncN+eSl7N8BdDSNPfwhRtBvQj/ncgWWwfPxfeOR8FH3r4vT8
	hrDi+Yn9qWCbdpa2uEDj9LtiG2w9JwMsJ5VXnmpC3j6X5dkRyZdhkbTyzrbO4iLfNmUwiQcYX2bnr
	G6FTGT7eQsxMaS9mKvPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQaKs-003wvF-2X;
	Thu, 18 Jan 2024 21:54:06 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQaKp-003wu7-24
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 21:54:05 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6d9344f30caso117319b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jan 2024 13:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1705614841; x=1706219641; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ykJGA57/c6XjRX+/wiozqy8iJ6Vsrt2RLKtiLpKiLM=;
        b=ehQ8fAvT3817/XTE7vNL7i5L1JsExQ24Lp6BuiV4PV0GkrH0SZtkPjeQSBAB8lqU49
         qXSjJW1VjwvWlTQuky3egxhewA1JkdMqG/m1BcHKUfJavYNjlFvCbDMhkp0siJdoOoHa
         VaMp/kHmQX0Tiz/Y9MaparCNMDRCUdHIfsJErSMZoccaU+mO51cjuNklfUVWrGVdipyR
         yiRD+P94P/qYxtedP/vBRU07uD1rE9/pTeIMp5TX/XN6o0blyGlNfC7hZsWQGZXSvK5Q
         kz8ip6/thYV0ouQDSNJh8lR/F8cJ+2N+6RYzhf36iUnd1lkLihUmFaZjNpG/sooOh2Q6
         AWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705614841; x=1706219641;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ykJGA57/c6XjRX+/wiozqy8iJ6Vsrt2RLKtiLpKiLM=;
        b=LTQIvzmjSLRJP1Na+j14Lfo0zeg3s4w5IHTiB0zjb/9n7DucgERVP8Ny30D3DyTpUw
         vEc0MPW2Z+wPpBvXoghDNku7il/7xJV+9UTdVGgGmHFe0t2VsR4C1655+dqln0OaEBSL
         5gxibcFMazEzD5U9hZ8WN75uaQcKuiNiU/r2sm+E73xYWHa9Z1SP+4Fkfi1bE37ZkOYQ
         pBqUrpm6P0y3vBhwVWCHw1ndTtUHPOozmKgd3DRbEam5Bx/lE0NoQSjenNf6G3UwCZ8/
         uoFY2Xiv+Y2SrgF6EYtXFmJ5yE33mKEeen9McAxR9/4hUhmvT7KkOwbQle7f67lGon+C
         0UnA==
X-Gm-Message-State: AOJu0YyNlIGHoIVF9xpE1oX2l1pyYcidY2reqcoJyeOtQEK2tk/5LeVB
	m+LSH8sfXtDiYlk0qS7aM0f+dX97vspm8yd+lGMEBixGjCMd2J7pQz0diAGLkqk=
X-Google-Smtp-Source: AGHT+IFmbmT0nzrJVhkhIeOG1uqqUQ5TnTG1pxSQSR5fbID+PWzb61gZ7b9wYB/SkmypR7VVqfsHEA==
X-Received: by 2002:a05:6a20:2dc:b0:19b:1da4:8dc with SMTP id 28-20020a056a2002dc00b0019b1da408dcmr18728pzb.34.1705614841620;
        Thu, 18 Jan 2024 13:54:01 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j15-20020aa78d0f000000b006d9c7f2840bsm3771459pfe.57.2024.01.18.13.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 13:54:01 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 18 Jan 2024 13:53:59 -0800
Subject: [PATCH] riscv: lib: Support csum on GCC <11
MIME-Version: 1.0
Message-Id: <20240118-csum_remove_output_operands_asm_goto-v1-1-47c672bb9d4b@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAPadqWUC/x3NQQrDIBBA0auEWVfIiNCmVylFxEzTWeiIoyEQc
 vdKl2/z/wlKlUnhOZ1QaWdlyQN4myB+Q97I8DoMdrZuRnyYqD35Skl28tJb6c1LoRryqj5o8ps
 0MW5ZrI3oMNIdRqpU+vDx37ze1/UDe5WzqHYAAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705614840; l=2787;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=0OLoge7JRZVK/JTs8M53rSZCOS6zKNIvbnryNlKfkNs=;
 b=dJpuJl1dFpZjTsUOyTWIxBNNNkZvncdUMycB4TzPg8EkchYbaXeZWzM0gJrYusU4KUPaoHcVO
 XLWURTe24UwBbkRTIcQdUzshBpJFlZdeoMxWOC8rVKRzmO3g1hoiBq2
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_135403_682601_3FA7F5FB 
X-CRM114-Status: UNSURE (   9.47  )
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

The OutputOperands field for asm goto statements is only supported
starting from GCC 11. Split the asm goto to remove the use of this
feature.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: a04c192eabfb ("riscv: Add checksum library")
---
The OutputOperands field for asm goto statements is only supported
starting from GCC 11. Split the asm goto to remove the use of this
feature.
---
 arch/riscv/lib/csum.c | 42 ++++++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index 06ce8e7250d9..23be289f52b6 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -177,22 +177,35 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 				  : no_zbb);
 
 #ifdef CONFIG_32BIT
-		asm_volatile_goto(".option push			\n\
+		/*
+		 * OutputOperands in asm goto is not supported until GCC 11, so
+		 * this asm has to be split to be compatible.
+		 */
+		asm (".option push				\n\
 		.option arch,+zbb				\n\
 			rori	%[fold_temp], %[csum], 16	\n\
 			andi	%[offset], %[offset], 1		\n\
 			add	%[csum], %[fold_temp], %[csum]	\n\
-			beq	%[offset], zero, %l[end]	\n\
-			rev8	%[csum], %[csum]		\n\
 		.option pop"
 			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
-			: [offset] "r" (offset)
-			:
-			: end);
+			: [offset] "r" (offset));
+
+		if (offset == 0)
+			goto end;
+
+		asm (".option push				\n\
+		.option arch, +zbb				\n\
+			rev8	%[csum], %[csum]		\n\
+		.option pop"
+			: [csum] "+r" (csum));
 
 		return (unsigned short)csum;
 #else /* !CONFIG_32BIT */
-		asm_volatile_goto(".option push			\n\
+		/*
+		 * OutputOperands in asm goto is not supported until GCC 11, so
+		 * this asm has to be split to be compatible.
+		 */
+		asm (".option push				\n\
 		.option arch,+zbb				\n\
 			rori	%[fold_temp], %[csum], 32	\n\
 			add	%[csum], %[fold_temp], %[csum]	\n\
@@ -200,13 +213,18 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 			roriw	%[fold_temp], %[csum], 16	\n\
 			addw	%[csum], %[fold_temp], %[csum]	\n\
 			andi	%[offset], %[offset], 1		\n\
-			beq	%[offset], zero, %l[end]	\n\
-			rev8	%[csum], %[csum]		\n\
 		.option pop"
 			: [csum] "+r" (csum), [fold_temp] "=&r" (fold_temp)
-			: [offset] "r" (offset)
-			:
-			: end);
+			: [offset] "r" (offset));
+
+		if (offset == 0)
+			goto end;
+
+		asm (".option push				\n\
+		.option arch, +zbb				\n\
+			rev8	%[csum], %[csum]		\n\
+		.option pop"
+			: [csum] "+r" (csum));
 
 		return (csum << 16) >> 48;
 #endif /* !CONFIG_32BIT */

---
base-commit: 080c4324fa5e81ff3780206a138223abfb57a68e
change-id: 20240118-csum_remove_output_operands_asm_goto-49922c141ce7
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
