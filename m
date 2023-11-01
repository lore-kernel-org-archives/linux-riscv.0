Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1DAC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 00:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOprndq+UaWCHClizi5Z7v+VaZQhXo625rtCXoUA80Q=; b=n76XZI3feLdaf0
	czb/NUQL4ge2H5tHfE5jhLDDAunOuPAbJMqVaTO+N//M8Okmfu81bzpCWC/n8oR36dALWyF6PPAsP
	vQ7fERCQ/T7np0OOZGKP7hUfrCha6jMy5s7ASuFZcw/e/tipZS86ukI5BkzOrfIDNLsTw6nCp+/bV
	laCVybvG3Dp2yLMM13gEqbnCvJqZstvyUvLISCWsmBGGmzqq2YDbF1+j3mujdlo4TkLuk9J0OZvMi
	Vj+8VcOmBB7kpBLqSh1XeuWd4NTByl/pEPBXzmqxX/aTz2dXLAYF+rJlnfUdu2Xo+nb6KZnL+ws1g
	a81w7Z82f8uQJgjODGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxyx1-006NVD-0m;
	Wed, 01 Nov 2023 00:19:15 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxywy-006NTp-2d
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 00:19:14 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-586ad15f9aaso3150664eaf.2
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 17:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698797950; x=1699402750; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQdBfGrxgT0Dp0rMc/ALsHZTaxuvWcxH/0MUqWK8IuU=;
        b=sCWIO8Dy/Q2lhGSk75gSdm9RmJ8UqGOXnSkogMSCGAEtbHQlOkaoLU7qdzWyvIPtUW
         P0rSNn1AeloUoWy/eXjxmiJ0fVks+cpy2FbaEZkCh4cNj2XLCQkoIh7S9WFSM41rt9eE
         kXsLJBSoAnEfzEw3vWAyBID0mYP7PGkjixDSeIrYGYPDbjbSAarKFjgbco1F74Nzp/Ih
         aHL2EVCgyORUZYG0bfzRl66B6+wJxkkqaLjudHlw+haLF7FUxtf18ySz2l8xzgUdfzS1
         Ap2tHzX1U5TYn+cTAXjErdOj6RhwSMBlLWoOxDQ+1PZKmzgx4HJE3hjMFv9KM3ZEpzoO
         099g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698797950; x=1699402750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQdBfGrxgT0Dp0rMc/ALsHZTaxuvWcxH/0MUqWK8IuU=;
        b=fhpqoooCwUsUQ4Eri1ibOePWFss4lan89iaN2bmyWcrqifGv4py7ZMlu9LqiFptauF
         7nTs8w6tvxR/57QlBmcfF3frgoJdwtJJbuahvf8Qxa1nDpvnTBt+wAAbqbhS1zQDIbA8
         KVgPGxmqLtbHN2JLDacZHDtlpnDefxB3WsmDIwYq8DrEhuTf7rl0iiESQiQV9IEjzBhy
         T8uSqsHW2OQSTqQORd34WaiBOtwlx3kkbVYLSQPOKShtFdkms3GxRrAQt5khwFHSs9AN
         IB4HIYv8Q7t3BJMbpm42SIPv3KrkHl23bG7OFdkyqu0G34yOaa6ApRYldloCQoz1HSQo
         w2Vg==
X-Gm-Message-State: AOJu0YwRXYViyMhbwIbZaoqKFgGzsVGz8j6LfM/TIvkOy4kiwgRgKHWu
	Xq8WuMPZKYRM7mfKfIz/zSQEz5xnthnDyiGStpk=
X-Google-Smtp-Source: AGHT+IFAGiF6OUNLlCeNgyvY/i4c514KoOHClaYHS52YeQ3nA387majS+P1AJ+bMd1hGXTtmOTGzFg==
X-Received: by 2002:a05:6808:9b6:b0:3b2:ef9c:d1b1 with SMTP id e22-20020a05680809b600b003b2ef9cd1b1mr13418380oig.6.1698797949914;
        Tue, 31 Oct 2023 17:19:09 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n21-20020aca2415000000b003af638fd8e4sm65309oic.55.2023.10.31.17.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 17:19:09 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 31 Oct 2023 17:18:51 -0700
Subject: [PATCH v9 1/5] asm-generic: Improve csum_fold
MIME-Version: 1.0
Message-Id: <20231031-optimize_checksum-v9-1-ea018e69b229@rivosinc.com>
References: <20231031-optimize_checksum-v9-0-ea018e69b229@rivosinc.com>
In-Reply-To: <20231031-optimize_checksum-v9-0-ea018e69b229@rivosinc.com>
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
X-CRM114-CacheID: sfid-20231031_171912_850442_04248D94 
X-CRM114-Status: GOOD (  11.43  )
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
