Return-Path: <SRS0=2pxE=P6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E94C43217
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 08:13:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 029FE6109D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 08:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 029FE6109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+f8WhiFLlgj46hsB3PadMKe8jSfmazFHXe0ePudOqk=; b=ou3hTwtJ1fhYxB
	tPyDkzIjXdLahVJzbfcqJfKV2F144S50HkodAYLxWhpOHsZx/54jNOa422t3qaQ+4gF4KUiK3WpPO
	NL7/eFsKIJ7aTU+JYCGYC3IklIJ6gcQ7GJZLnckOjkq/ck57SbCRNE/0wWHhWfn0CpgQTJYGL38zW
	B65MFV53yzF+uVrgfNfWBfwHOvscGIW1CIU+wYc6wurnauTZK38YUJ3bkWEp2hIGsk1mYW06eMkAQ
	xLrK7MuFCJQ8LzweHA2ET/BLzGgfR+qrEI9X+4zuazAWOHnmEUay0+4fhszxwm+8lYLCvKrotn72Y
	HrJ5RZCxtE9PkoZ4jpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml5Cq-007TxL-DL; Thu, 11 Nov 2021 08:13:12 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml5Cn-007TwY-A6
 for linux-riscv@lists.infradead.org; Thu, 11 Nov 2021 08:13:10 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so4022553pjl.2
 for <linux-riscv@lists.infradead.org>; Thu, 11 Nov 2021 00:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=kLaJsuTpaA6GbzdzOlqPA5jPocR/+5/lqXTo7jiLw+0=;
 b=o7bFLqdkHyIiRXgV5aj8kVoIEhvrVp4fOTxjP2K3O4Vn9ijpUB8aSfsrbSQfdeVu1V
 WO8KuPSLIfrM+/yhGNd1nDuOSQzkOMEjwnLcmi79NcVyPP//g+CRK47GsdT+OSbtIg8x
 r+RPoP5P1xHeYJW2h6XcuLCkjYRCDR2yW+qnbmsVp1/JuaxeoWveAwf3GTxCL1GhjgLl
 VV+t+GaqFjDfzR81lyTEjOEEOj54t3mrWItY7CFu2nWZqVHUQQzfHhBbgOWjFrWSU5Ab
 D0ovgHMWeKuO7LwgeLcfI4QiAg74W5rtvk9Un6zexZgiW9d7UwO2/GODkg0JXA3Fltzw
 FTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kLaJsuTpaA6GbzdzOlqPA5jPocR/+5/lqXTo7jiLw+0=;
 b=R7Mlj1JnzyE+r97rTdKoqB2RDWtr1kq62729OBxNR3CZfvmRJrduHCP7vXWWy2HGOM
 ARBR9wfwGpSEzcD6jD97kSQk+LHTAmQ5OPwoaO7tBabTtKAAckDxavq688AZH/BVpJnJ
 yCNnr+/HD0C1Z4WBV/pkULjExLePrsRYYUOO6KTh3tlL0MHx7qPkOtjOCbUO2IA5HKf4
 mpfuV0XLleCfRqIIkR1zrGJYoQD3qhP6L5EP0xtiqoAKfQ4qqg8995etMoNBKqHHNace
 ZGLWS2vDr2+8bZUWOAlPc8qgM9k7mzA2sGGYP8M94HEZ6J0K4Sb6LyWdT0qNV4eAlpoU
 WfbQ==
X-Gm-Message-State: AOAM533Z1zKzV0YG9ZcNFQEPcQysMkbiQwKHqehTSxlV2LiIwFaYK3KX
 GMFlpL7PbC0c8kKj8J+lBVE=
X-Google-Smtp-Source: ABdhPJySLKMKCrEWqEdAc0zqnwqogKMEhup18KbnmcPbOhSOn0qy9qkvP2D4yL126UA7R6AQGktc4w==
X-Received: by 2002:a17:902:c713:b0:141:bc54:f32c with SMTP id
 p19-20020a170902c71300b00141bc54f32cmr5807716plp.82.1636618388359; 
 Thu, 11 Nov 2021 00:13:08 -0800 (PST)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id me7sm8998550pjb.9.2021.11.11.00.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 00:13:08 -0800 (PST)
Message-ID: <747e611a-2225-0685-b1e6-8b45ef45042d@gmail.com>
Date: Thu, 11 Nov 2021 17:13:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: [PATCH v2 1/1] riscv: __asm_copy_to-from_user: Improve using word
 copy, if size is < 9*SZREG
Content-Language: en-US
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <6ebbb5e0-c2bc-89ce-2cb8-4f537c5aea13@gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
In-Reply-To: <6ebbb5e0-c2bc-89ce-2cb8-4f537c5aea13@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_001309_402700_D9E02EB5 
X-CRM114-Status: UNSURE (   9.31  )
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


Reduce the number of slow byte_copy being used.

Currently byte_copy is used for all the cases when the size is smaller than
9*SZREG. When the size is in between 2*SZREG to 9*SZREG, use faster
unrolled word_copy.

Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
---
 arch/riscv/lib/uaccess.S | 46 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 63bc691cff91..50013479cb86 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -34,8 +34,10 @@ ENTRY(__asm_copy_from_user)
 	/*
 	 * Use byte copy only if too small.
 	 * SZREG holds 4 for RV32 and 8 for RV64
+	 * a3 - 2*SZREG is minimum size for word_copy
+	 *      1*SZREG for aligning dst + 1*SZREG for word_copy
 	 */
-	li	a3, 9*SZREG /* size must be larger than size in word_copy */
+	li	a3, 2*SZREG
 	bltu	a2, a3, .Lbyte_copy_tail
 
 	/*
@@ -66,9 +68,40 @@ ENTRY(__asm_copy_from_user)
 	andi	a3, a1, SZREG-1
 	bnez	a3, .Lshift_copy
 
+.Lcheck_size_bulk:
+	/*
+	 * Evaluate the size if possible to use unrolled.
+	 * The word_copy_unlrolled requires larger than 8*SZREG
+	 */
+	li	a3, 8*SZREG
+	add	a4, a0, a3
+	bltu	a4, t0, .Lword_copy_unlrolled
+
 .Lword_copy:
-        /*
-	 * Both src and dst are aligned, unrolled word copy
+	/*
+	 * Both src and dst are aligned
+	 * Not unrolled word copy with every 1*SZREG iteration
+	 *
+	 * a0 - start of aligned dst
+	 * a1 - start of aligned src
+	 * t0 - end of aligned dst
+	 */
+	bgeu	a0, t0, .Lbyte_copy_tail /* check if end of copy */
+	addi	t0, t0, -(SZREG) /* not to over run */
+1:
+	fixup REG_L   a5, 0(a1)
+	addi	a1, a1, SZREG
+	fixup REG_S   a5, 0(a0)
+	addi	a0, a0, SZREG
+	bltu	a0, t0, 1b
+
+	addi	t0, t0, SZREG /* revert to original value */
+	j	.Lbyte_copy_tail
+
+.Lword_copy_unlrolled:
+	/*
+	 * Both src and dst are aligned
+	 * Unrolled word copy with every 8*SZREG iteration
 	 *
 	 * a0 - start of aligned dst
 	 * a1 - start of aligned src
@@ -97,7 +130,12 @@ ENTRY(__asm_copy_from_user)
 	bltu	a0, t0, 2b
 
 	addi	t0, t0, 8*SZREG /* revert to original value */
-	j	.Lbyte_copy_tail
+
+	/*
+	 * Remaining might large enough for word_copy to reduce slow byte
+	 * copy
+	 */
+	j	.Lcheck_size_bulk
 
 .Lshift_copy:
 
-- 
2.17.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
