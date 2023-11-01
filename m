Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A868C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 22:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOprndq+UaWCHClizi5Z7v+VaZQhXo625rtCXoUA80Q=; b=WNR9InX1z8UYJW
	Pgnz/mXRjT3n0ZJEgAd1AztJ/5jOU1UhSsiEQ+ljwn6Nz0M8pCo3e0+t97R+R+w12I29OI7kHjFTg
	EPgJnhPIbZ+JngYlrqTOyq2qtU/uutPUxvkGhL6mtRqnpgQyTNub07DJjudRjeB7s6U1F4rj2aSyv
	GIfjyHkChKjgS6hB/YM7n4dZfWyhbQWtWHENPKbVzJlV0Xjcu8Ant5J/4Tt9HHu/eEvGdMEkl5td6
	TArlLW8VTJ2XTdscNzoO6KlSu4rzwpYFwkZj9PoHgOkRykbE3jKDdXcEiTNuvsVUcylDjQEMp22fe
	C061Ym3MQzZfDH2S8kdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyK0a-008Epl-00;
	Wed, 01 Nov 2023 22:48:20 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyK0X-008EoW-0j
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 22:48:18 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3b2f28caab9so203536b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 15:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698878895; x=1699483695; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQdBfGrxgT0Dp0rMc/ALsHZTaxuvWcxH/0MUqWK8IuU=;
        b=hL5KC94b9+X5Qf4WxVq/FT+Va+DnJTf1W/6Y9cl+mQGfsrRq85n7ksLWl9gjt2f9cR
         XSu/IAmAHcA7an7y45IohQiTMRGJP0z7luJgC4iL+4u7y0pAAgpxgCEG4441nhukyKvu
         W1EPfFdUEYgkPEToAXpbtD3Fu9LrByCS02Qa5vumAhLnwbr/444pwrUT1OD2vLfOttPJ
         79vVqM4uF/kjimL+u9vynlOVlJZlfvUISwa16F6i15znzf0FMXWqV9FoKkmQAoZ0cV7v
         LXRI45x5DS1Sk/ZiQM+f8o8FseCs93PeMkQJSp3tTQDHwJm/KkknVMWbH4tymLpQHLW3
         nMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698878895; x=1699483695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQdBfGrxgT0Dp0rMc/ALsHZTaxuvWcxH/0MUqWK8IuU=;
        b=cb5MO+9leH2M+8HHa6fYy2X1fx5MshXMA6552+R2XVl8x4C0dxZcQNXJJffbxuPzXI
         OCR9Pufd1JpgxA1UBX2sZxIIW1UureNCS8DDr6hBp23BP47A/wiLm+VWWuu5dX2zMlNq
         +9C43M7ckE7pUXrzgJGaGZPmfy2ltQh3yJXwDYPNDszgu3xDM8YqdDwjCRj9SlncKrwD
         Gv5kyx4V0XMuiFihYjUxJ6Ebs8wAEWTWC+kca5rU1yWzG+C8mCgcP4FoUfsLtuMYmcMH
         m1oELT5gcCq1ykkQfOOq6oq8aiF2gXPvBSFIEtg0XwqLCXkgh1BfXqfxrqaEM83wTbLj
         yHMQ==
X-Gm-Message-State: AOJu0YwFVzMcweUV6ih5h0wm0ijDZnkpPGHzgEYLEonni2aKhCvgQUiD
	CdA+CzdLeO6tyCELgI35sflFyw==
X-Google-Smtp-Source: AGHT+IFzBCyL2t03Y1FiJ9LyIJnMA8zrXeS9r4tc6wfUloR8MlbKpjUOkT8jBL2SJ1RUlCdhsNdOCA==
X-Received: by 2002:a05:6808:1b20:b0:3a1:dfa0:7e18 with SMTP id bx32-20020a0568081b2000b003a1dfa07e18mr21827450oib.25.1698878895176;
        Wed, 01 Nov 2023 15:48:15 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id be24-20020a056808219800b003b274008e46sm376580oib.0.2023.11.01.15.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 15:48:14 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 01 Nov 2023 15:48:11 -0700
Subject: [PATCH v10 1/5] asm-generic: Improve csum_fold
MIME-Version: 1.0
Message-Id: <20231101-optimize_checksum-v10-1-a498577bb969@rivosinc.com>
References: <20231101-optimize_checksum-v10-0-a498577bb969@rivosinc.com>
In-Reply-To: <20231101-optimize_checksum-v10-0-a498577bb969@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, Xiao Wang <xiao.w.wang@intel.com>, 
 Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
 David Laight <david.laight@aculab.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_154817_260874_8ECFB85F 
X-CRM114-Status: GOOD (  11.68  )
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

This csum_fold implementation introduced into arch/arc by Vineet Gupta
is better than the default implementation on at least arc, x86, and
riscv. Using GCC trunk and compiling non-inlined version, this
implementation has 41.6667%, 25% fewer instructions on riscv64, x86-64
respectively with -O3 optimization. Most implmentations override this
default in asm, but this should be more performant than all of those
other implementations except for arm which has barrel shifting and
sparc32 which has a carry flag.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: David Laight <david.laight@aculab.com>
---
 include/asm-generic/checksum.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/asm-generic/checksum.h b/include/asm-generic/checksum.h
index 43e18db89c14..ad928cce268b 100644
--- a/include/asm-generic/checksum.h
+++ b/include/asm-generic/checksum.h
@@ -2,6 +2,8 @@
 #ifndef __ASM_GENERIC_CHECKSUM_H
 #define __ASM_GENERIC_CHECKSUM_H
 
+#include <linux/bitops.h>
+
 /*
  * computes the checksum of a memory block at buff, length len,
  * and adds in "sum" (32-bit)
@@ -31,9 +33,7 @@ extern __sum16 ip_fast_csum(const void *iph, unsigned int ihl);
 static inline __sum16 csum_fold(__wsum csum)
 {
 	u32 sum = (__force u32)csum;
-	sum = (sum & 0xffff) + (sum >> 16);
-	sum = (sum & 0xffff) + (sum >> 16);
-	return (__force __sum16)~sum;
+	return (__force __sum16)((~sum - ror32(sum, 16)) >> 16);
 }
 #endif
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
