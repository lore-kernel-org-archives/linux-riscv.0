Return-Path: <SRS0=Mekn=MM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7F1C07E95
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 08:51:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74CE661209
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 08:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74CE661209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FftgNMbAZlOqfRsP097EYuCIUUi8Yj5XBit7e6354+w=; b=A3QnzYOWl+JrrF0maIvm/eMLZE
	A8bCcNNLPg4trQdECU/n5R7vGUUKst4pPBgjGy97lzWzRfblNNbQzQo/CukC5k8oYYTWovhfo3sKX
	lNXrVUk8Z7uLvffSuUGrAqwsGoOZzAgpfHay6Oi+m2R2jipPdo3/K3uwnYtThH/oswUGbGRm3pPBy
	no3c314Fw82WVnGRk39XjuYPzhGz69NuL3wTpLe8vDURBSWcddGKXCsRwyA3YkM4yo4rV3H2GIm7Y
	KAf/O1TcZJAJkZDudE/8RtToKQqxWkdngqdG6UC1X0nwyhHJPj9r1cEISVsoysCvsjiH3tLw/6s+f
	OxOjhAgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5lSw-00CHby-TN; Tue, 20 Jul 2021 08:51:02 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5lSu-00CHax-2O
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 08:51:01 +0000
Received: by mail-pg1-x529.google.com with SMTP id a6so14571459pgw.3
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 01:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=hyHfreQCGU1n08jflxUm3GD5Es1OvyJ8VlqC19lqeQY=;
 b=FbegROJ90Iif54xm+O2OALn405pyfAJ8145JLRjkETF6hKetoYcN0nnEQ5/AjABZWW
 6rZp7tgx2uBFBfBMrmRllXU0Igs7FKFLMVgxFexiOUiEs9sz3WKjb27K+zfbwjdMw4rI
 kxKq92ERO02d7NXieZ6mDNNe514vyrET7Ju2BJX6rn4v1tsIXVmmB5bA16d0Nzg8ivYQ
 4ijlXfz7a7lIuyF8spDdmsM5QHnnmUm17Rref03RXj6Yopo38nW+pqJdZSBgzyjXK1fH
 O2ut3/96E27HBd4yokYh/917EnXg4GgTG/41FlbesLf+GrLDmLjZV35mSXMpxajqmFFm
 RsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hyHfreQCGU1n08jflxUm3GD5Es1OvyJ8VlqC19lqeQY=;
 b=VLsUFho48ye23DgMnv/WmOf+KwBwNt+iz1/K51kshsek8lztGnxQLgxnyPcaQGVSYS
 5EWkaChgflJP0vGVIn5YBxwEts6yOaJ7D4JC98s1/SxOdxF9M6lHKd5LAuOMimAhFBi9
 L+i9LVfIDXb3VItxsSC0d/1iuycn86R4uZ25YMRfQQnKzpaESe3czPp8jtiOrNnfYMOv
 JXFBkqpxFHG7jSZYzyjVTcqob+ApJ+NmtaKjKXbVFbAztd46mScw96Y5m0V1GqoFjz5g
 hggjVQrgjn2VxD+8SaSh1I4uYa8LrZ4spu8eCxQ1KA+rrDBmkZZB1f2hGLQ2MRn1qnV8
 99CA==
X-Gm-Message-State: AOAM530cbqQ3gYU44nYbgUtpAB00beamaZCkKxTLFuKhHY6H73GG/5Oe
 JFn61TENbdG4GBh7DUyZXqk=
X-Google-Smtp-Source: ABdhPJxq5NwFbLCn786YXAAZfvZ5Y0RKQPaxTlLcGvNw8E60U5x7oPuMNvXy8Z9gVpdSlWVx0bVXHw==
X-Received: by 2002:a65:5284:: with SMTP id y4mr10889779pgp.19.1626771058139; 
 Tue, 20 Jul 2021 01:50:58 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id n5sm22829381pfv.29.2021.07.20.01.50.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 01:50:57 -0700 (PDT)
Subject: [PATCH 1/4] riscv: __asm_copy_to-from_user: Fix: overrun copy
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <415f9adf-8dd6-2467-8e74-0ed9d5cdfed9@gmail.com>
Date: Tue, 20 Jul 2021 17:50:52 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_015100_164337_B5B337C6 
X-CRM114-Status: GOOD (  10.91  )
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


There were two causes for the overrun memory access.

The threshold size was too small.
The aligning dst require one SZREG and unrolling word copy requires
8*SZREG, total have to be at least 9*SZREG.

Inside the unrolling copy, the subtracting -(8*SZREG-1) would make
iteration happening one extra loop. Proper value is -(8*SZREG).

Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
---
 arch/riscv/lib/uaccess.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index bceb0629e440..8bbeca89a93f 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -35,7 +35,7 @@ ENTRY(__asm_copy_from_user)
 	/*
 	 * Use byte copy only if too small.
 	 */
-	li	a3, 8*SZREG /* size must be larger than size in word_copy */
+	li	a3, 9*SZREG /* size must be larger than size in word_copy */
 	bltu	a2, a3, .Lbyte_copy_tail
 
 	/*
@@ -75,7 +75,7 @@ ENTRY(__asm_copy_from_user)
 	 * a3 - a1 & mask:(SZREG-1)
 	 * t0 - end of aligned dst
 	 */
-	addi	t0, t0, -(8*SZREG-1) /* not to over run */
+	addi	t0, t0, -(8*SZREG) /* not to over run */
 2:
 	fixup REG_L   a4,        0(a1), 10f
 	fixup REG_L   a5,    SZREG(a1), 10f
@@ -97,7 +97,7 @@ ENTRY(__asm_copy_from_user)
 	addi	a1, a1, 8*SZREG
 	bltu	a0, t0, 2b
 
-	addi	t0, t0, 8*SZREG-1 /* revert to original value */
+	addi	t0, t0, 8*SZREG /* revert to original value */
 	j	.Lbyte_copy_tail
 
 .Lshift_copy:
-- 
2.17.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
