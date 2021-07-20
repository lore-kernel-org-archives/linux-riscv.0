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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5836AC07E9B
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 08:53:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2548261209
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jul 2021 08:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2548261209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zsb/NW4LeJ3ZNhnykQaTj2+DLXDYvVNTJur2f6ALCKk=; b=RbXRWT1n8NeMlqF1j3b8uix+y+
	FOTsWR+n6VV58kaW0IWEqRE2JEEijo1jta5h+AQP7P0sDOjzl6p15LUb6R9lkRcaiRSl3y7+ylYiB
	vMTBa0aN04NwwOG19eK81cwR7OSis9+DpSxBLaMCD1JvWsbcv7LnaVO5va9lh7LjW22SvodgrEvZc
	3tzWpwfuQXkWk6xJsD78x8q6DfyNyLcGqHKVNM4Ho2GIb/CCJa+nLoYefFdPCbMJmj/2gu2VGNrEh
	CsBeBumZtXk7F321vLoNStV8vneiQcfwFgl2ZhHAkEIf1CAWrWmFAL45GY7VCU09cz3RJaS3wzSfI
	OCCYUcCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5lVM-00CIIj-HZ; Tue, 20 Jul 2021 08:53:32 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5lVJ-00CIHK-Kn
 for linux-riscv@lists.infradead.org; Tue, 20 Jul 2021 08:53:31 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 d9-20020a17090ae289b0290172f971883bso1514210pjz.1
 for <linux-riscv@lists.infradead.org>; Tue, 20 Jul 2021 01:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=iZ11XlQ/7LpvSWqpfLjYjm5v/1yKJ1MGXqTuOdCwXh4=;
 b=Sd2kIfTvXXfKi0494oKwDhzLl9t6+qHQ0y9S6DpyTVWMiJ20Mr8LG2sRSNXFo+aPax
 EBmAJ22daE/xFihfPX1dqF4A6Av6BMFF2M1mML3NzEMu88A9cV6eyMBSoZjVUT3YkKSb
 lfcKRx51h3aanM7YhezfUXC9JU+DEv1v9K4s8/dLB1TsEtFBoUq5ItmLuCAW7C35c3kB
 YLd3i8+Kr4EdAl/OHnIFSpV1mx4TDXrYpzhwE1ICm8ZPvrhgm0tB+ZoxHDGTyxKbU1Eb
 LS36UzpBcXKte4R6z8sH+i5WjiS8Jous+gXC5HFWlRbmBC15tx3S4MBOOdZQXUUoGCJa
 WapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iZ11XlQ/7LpvSWqpfLjYjm5v/1yKJ1MGXqTuOdCwXh4=;
 b=n/CyWA0JXwIPw7guRAhqLQp93uDTj0SpuNlGHtKWrZxc+7z6X97rBfBNsrxrFNlLY1
 WGq8jv7qT7jXDs4WRC5LtV0BosUqmDEz+Fw46GWLKXiqC6ZGrxTLnrMkUiLRqwPgOiHo
 jPOzz/pSVn/Zjs0Zvueo4C+LhuP/Tq8wi2erxJC3kLsim6qbGwwnbZkaNVBla79ZGkKK
 K3j0Mt/yEYz5pweS7CPwVCmlakXoFqejLe38J14f/lFzlkYa2NGES1O7EUGFZYlHhRMv
 q6eI4oBtYGTGwLZm6NsLCFtiz9GVfnxsgzmE+JXNDKepTuPgNaQpaKsYbBXdOKpKCIBd
 ZxzA==
X-Gm-Message-State: AOAM533SgKmB5Y1K05WS0PkTkZnvjNhhMfo9PxFYQ6pexccIIWw2bjIh
 41D6tTjACxuhex/TQZwyQ/k=
X-Google-Smtp-Source: ABdhPJwOvzonlcX/HWjjXzujzIEk+xCMC3woFJ4KKx1NW8wFFacD8C/pXaILCf05nRSjHuiVCUuhRA==
X-Received: by 2002:a17:90b:1d84:: with SMTP id
 pf4mr28729285pjb.166.1626771208547; 
 Tue, 20 Jul 2021 01:53:28 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id z15sm25461191pgc.13.2021.07.20.01.53.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 01:53:28 -0700 (PDT)
Subject: [PATCH 4/4] riscv: __asm_copy_to-from_user: Fix: Typos in comments
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <23960a08-22aa-c0dd-57aa-80e73d6859ab@gmail.com>
Date: Tue, 20 Jul 2021 17:53:23 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_015329_725219_0BD1B731 
X-CRM114-Status: GOOD (  13.53  )
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


Fixing typos and grammar mistakes and using more intuitive label
name.

Signed-off-by: Akira Tsukamoto <akira.tsukamoto@gmail.com>
---
 arch/riscv/lib/uaccess.S | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 54d497a03164..63bc691cff91 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -33,19 +33,20 @@ ENTRY(__asm_copy_from_user)
 
 	/*
 	 * Use byte copy only if too small.
+	 * SZREG holds 4 for RV32 and 8 for RV64
 	 */
 	li	a3, 9*SZREG /* size must be larger than size in word_copy */
 	bltu	a2, a3, .Lbyte_copy_tail
 
 	/*
-	 * Copy first bytes until dst is align to word boundary.
+	 * Copy first bytes until dst is aligned to word boundary.
 	 * a0 - start of dst
 	 * t1 - start of aligned dst
 	 */
 	addi	t1, a0, SZREG-1
 	andi	t1, t1, ~(SZREG-1)
 	/* dst is already aligned, skip */
-	beq	a0, t1, .Lskip_first_bytes
+	beq	a0, t1, .Lskip_align_dst
 1:
 	/* a5 - one byte for copying data */
 	fixup lb      a5, 0(a1), 10f
@@ -54,7 +55,7 @@ ENTRY(__asm_copy_from_user)
 	addi	a0, a0, 1	/* dst */
 	bltu	a0, t1, 1b	/* t1 - start of aligned dst */
 
-.Lskip_first_bytes:
+.Lskip_align_dst:
 	/*
 	 * Now dst is aligned.
 	 * Use shift-copy if src is misaligned.
@@ -71,7 +72,6 @@ ENTRY(__asm_copy_from_user)
 	 *
 	 * a0 - start of aligned dst
 	 * a1 - start of aligned src
-	 * a3 - a1 & mask:(SZREG-1)
 	 * t0 - end of aligned dst
 	 */
 	addi	t0, t0, -(8*SZREG) /* not to over run */
@@ -106,7 +106,7 @@ ENTRY(__asm_copy_from_user)
 	 * For misaligned copy we still perform aligned word copy, but
 	 * we need to use the value fetched from the previous iteration and
 	 * do some shifts.
-	 * This is safe because reading less than a word size.
+	 * This is safe because reading is less than a word size.
 	 *
 	 * a0 - start of aligned dst
 	 * a1 - start of src
@@ -116,7 +116,7 @@ ENTRY(__asm_copy_from_user)
 	 */
 	/* calculating aligned word boundary for dst */
 	andi	t1, t0, ~(SZREG-1)
-	/* Converting unaligned src to aligned arc */
+	/* Converting unaligned src to aligned src */
 	andi	a1, a1, ~(SZREG-1)
 
 	/*
@@ -128,7 +128,7 @@ ENTRY(__asm_copy_from_user)
 	li	a5, SZREG*8
 	sub	t4, a5, t3
 
-	/* Load the first word to combine with seceond word */
+	/* Load the first word to combine with second word */
 	fixup REG_L   a5, 0(a1), 10f
 
 3:
@@ -160,7 +160,7 @@ ENTRY(__asm_copy_from_user)
 	 * a1 - start of remaining src
 	 * t0 - end of remaining dst
 	 */
-	bgeu	a0, t0, 5f
+	bgeu	a0, t0, .Lout_copy_user  /* check if end of copy */
 4:
 	fixup lb      a5, 0(a1), 10f
 	addi	a1, a1, 1	/* src */
@@ -168,7 +168,7 @@ ENTRY(__asm_copy_from_user)
 	addi	a0, a0, 1	/* dst */
 	bltu	a0, t0, 4b	/* t0 - end of dst */
 
-5:
+.Lout_copy_user:
 	/* Disable access to user memory */
 	csrc CSR_STATUS, t6
 	li	a0, 0
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
