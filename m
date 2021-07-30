Return-Path: <SRS0=Eoui=MW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C0BC4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jul 2021 13:53:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8001160F12
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jul 2021 13:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8001160F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yDk8I5ueBsJ5lRs2mM/kHa7PMwlRRe4FrcryP6It6Cs=; b=CuEY1B964Qv4hPt441n9qdvqiQ
	uA74KSO5o1adlVpT5ba2Xv1V89cvz2gxPOcd3qJMZ2cjrh2KLrb1/8ZjiiN2P45EevBHBAfM4qfoD
	IpjTwI1iPgjuiLrJmPNnVKB2paTVzwWTWr35WNjHLDSJ3G6Lunm0cuh2GbWnkP9G6qXCKACUi6t/m
	4p0OI51WUEwEMKnUJQKZwUu5uvP4/hqLRzkWJx4ZO0tzJLMDES+pFZTVhPuXwH+gxLsA8Cq6BYx/I
	KaaKQ7oZ58bPuuUEPGoVC/rcR7vUr+Z/0otrcFpsL5xEmBpj+t3uosgIca5uPiD2zya8dg/ZQHbU+
	GiVjWIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9SwZ-008rUv-C3; Fri, 30 Jul 2021 13:52:55 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9SwV-008rTS-Qc
 for linux-riscv@lists.infradead.org; Fri, 30 Jul 2021 13:52:53 +0000
Received: by mail-pl1-x629.google.com with SMTP id u2so2896952plg.10
 for <linux-riscv@lists.infradead.org>; Fri, 30 Jul 2021 06:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9jaR2rmX/3dC2lW1w3ahiNAnSoQAbHd0csMaeJZR0hU=;
 b=FcyR6kZNKGmJN9ZVh1OuJWghpYEzqbh0B3Dq9cY4PwdF4MgHJKKgEaiQqYM4yUM3+l
 LhZw6RYcaJfPpZWpDf+9axNLSOj5VhsfmkriITvXK7xcsauPhR5zrug6BPdizHBPtnUT
 9fFjKILH+g+yiNlaM3VhJ9+BcxnaufFcPN5cQGeBlELg0yN/7YTgg46vIZcouyUY/7dS
 iXoFJqAz4O3H8XwcfFpvEhfue/oriROfKJzf8Byr5B0isBYTgj5X1BVtmc9x4lcS562M
 B+30SLXW2eQhwkJQkLELaCNNgLFzl6ZxMdQI47JXxdzfq8Kb4CbW93gcRy6ClAfCSPRH
 2dbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9jaR2rmX/3dC2lW1w3ahiNAnSoQAbHd0csMaeJZR0hU=;
 b=SEAGUJFTxEOtO37mvcTxiPRcffPUboM6hpTseUxNrG0LnlckEbwd+KDlsSqivuPqRA
 Xn5ydQwedTyrHwg7Tii4SkC0YbxOFl/mkr7e+UwweX16SQ0QxNcRCXLLthB/VCOTt74d
 dPLaptU/NDFuqxKNe9GpbKvdirbmpJsN4lc1k59oxZWLmwSeU/atjPru32VPRgSuf5UL
 rRt9kMnolCetM1oFRITJUoJGGSgS9iRI7UkSj9a7Gpj3tV6hZtylF5jN8Zq7bTKGEX4L
 OaoZx+/ZPbYNUuoMWP4mEHmvN9h4FAr9+0Vc0Ocjll/RrHCwaY7c41jOuw0HR+phvUdU
 9Kug==
X-Gm-Message-State: AOAM530/p5/CyeYePywqOSbjl5ij5RwpyC0a1Jj9M/Q1Ec0CZOegDucw
 x8nkUX/D5vuVrfgxB3/A7Ck=
X-Google-Smtp-Source: ABdhPJwXBqF8MeVB/0tvzqUQZ7D8xt5lt36DIcY+nYPnFJjM3xrJ64/EDsbMiw2Es9izMZs/wfslEA==
X-Received: by 2002:a17:90a:1941:: with SMTP id
 1mr3279539pjh.217.1627653170600; 
 Fri, 30 Jul 2021 06:52:50 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id m2sm2314432pja.52.2021.07.30.06.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 06:52:50 -0700 (PDT)
Subject: [PATCH 1/1] riscv: __asm_copy_to-from_user: Improve using word copy
 if size < 9*SZREG
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <65f08f01-d4ce-75c2-030b-f8759003e061@gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <e3e9fb3a-40b1-50f3-23cc-50bfa53baa8d@gmail.com>
Date: Fri, 30 Jul 2021 22:52:44 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <65f08f01-d4ce-75c2-030b-f8759003e061@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_065251_921301_DE64D951 
X-CRM114-Status: GOOD (  11.29  )
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

Reduce the number of slow byte_copy when the size is in between
2*SZREG to 9*SZREG by using none unrolled word_copy.

Without it any size smaller than 9*SZREG will be using slow byte_copy
instead of none unrolled word_copy.

Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
---
 arch/riscv/lib/uaccess.S | 46 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 63bc691cff91..6a80d5517afc 100644
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
+	 * None unrolled word copy with every 1*SZREG iteration
+	 *
+	 * a0 - start of aligned dst
+	 * a1 - start of aligned src
+	 * t0 - end of aligned dst
+	 */
+	bgeu	a0, t0, .Lbyte_copy_tail /* check if end of copy */
+	addi	t0, t0, -(SZREG) /* not to over run */
+1:
+	REG_L	a5, 0(a1)
+	addi	a1, a1, SZREG
+	REG_S	a5, 0(a0)
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
