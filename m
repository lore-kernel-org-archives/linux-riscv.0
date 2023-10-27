Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E172C25B48
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 22:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3JwdKiJ6kUWavlgPTH05Ns2V41sQ9aNJe+VuKMgwz/g=; b=ggHzOAjv8W8Kn9
	fhF5BubQRWJCaPek1s7D3m+LDPprBjEC+EAOS7r96IJXAWiQaZWNKnNzsLotjBh1CnUaFElF+GgMH
	wPnk78uy9C7PzqR4EwFS7hBgREsYjOmu/kWJ/zz9UtU804iF5KY3OAKoNtW/GqXS6exydPaAohgCo
	eA/YTCJ/AT+KVeBUYWGQLEgGYEKZBN6c0qcbpeBwTQedaJSgiEqpH3b74bSHBkwVIuIqDB7ZSKSBy
	2Oy+Rb2waimd7u3J0V2paH7b+S/xZgh9f8vNvGjl53RyIt5JuWyBcPfItFAYgQX85fQuVoVIs97wc
	kEBRO3hyZKRsfDCPhVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwVYk-00HJPw-1c;
	Fri, 27 Oct 2023 22:44:06 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwVYf-00HJNd-28
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 22:44:03 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3b2f4a5ccebso1654799b6e.3
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 15:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698446640; x=1699051440; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55gQAkGJdgEhOiqM5Y2FlQbtEmx2dMpuljRL7f6iQqU=;
        b=ejYunPu+VGc+vxVfSLnfvY7RzBKIEUTbHIBqx+r80T2LVguueUht2XDirSYRAWqcC/
         IukB6lxmZOq5dQJvQtlgW3akFJA9ezpn38clRFfMnp05iHfqgB/WdVx1r5yX0Dkv0wz0
         4hf7W3S76FVt9TC0n2plhluw68iwLh/WwmnF02sryYA7LKg1oqRTes0Y6qHNDluhYbds
         ZIj1zjOTRhkxquApvfWj3sWjlUJXmyDL4vNHq4P2SpC5bYXKMQzagZbanOE/ktCimq+e
         fdbYr8TfE4flLpFFYz8wkh5F3pyc13i9zwY4Ds2V2IDYMZMu1d4DQLIf/LfuhyfIoRdX
         LOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698446640; x=1699051440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55gQAkGJdgEhOiqM5Y2FlQbtEmx2dMpuljRL7f6iQqU=;
        b=Duf4tRW1en2C/l1gxZSV6XfZvhwTEmcyNqxlAZVLD2dMeNkzrVwORHO45x0oV4EX/R
         hC9DSPuuS/8V4GHzKDFYnWOeYlDzlZiNchu5V5Wp5CwuUmi07UKl5iHfd6Yv+9wYXENe
         t8779UtSsAG9xqDI8TZ54AL0Ge+8OLdXQGo3MaIaHNXAADLXFYtxIslukfxUzKluDS3d
         jg+JHcUroDKoTHa/Dm/6I+BXWSPhOtVoyP5sTpHBmQhFOjZZofchN7Vk/PtjR7xUy4vG
         t8ZRbl0SsgQDArb+t420e/JlHdxqWSo9Q6VX8HyQq1z+P65hEZhgJrEUeQ81C10ICGBd
         JYsQ==
X-Gm-Message-State: AOJu0YyyqdOhkWWwRHcJIe4V138kSs6UuuGbwV0htWfQj93mZDyrJwyv
	m69fHtDFYwJ0gHOhQR4Gol1h0Q==
X-Google-Smtp-Source: AGHT+IG4k0gp0a3h540O4mCCfn992tcUqZ2t7vGEc6rgkeHNvjiAj4FfdD3krEwmZfIvyEKIXhhtJg==
X-Received: by 2002:a05:6870:ad0c:b0:1e9:c252:4853 with SMTP id nt12-20020a056870ad0c00b001e9c2524853mr5049857oab.5.1698446640404;
        Fri, 27 Oct 2023 15:44:00 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id t15-20020a9d748f000000b006c61c098d38sm448564otk.21.2023.10.27.15.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 15:43:59 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 27 Oct 2023 15:43:51 -0700
Subject: [PATCH v8 1/5] asm-generic: Improve csum_fold
MIME-Version: 1.0
Message-Id: <20231027-optimize_checksum-v8-1-feb7101d128d@rivosinc.com>
References: <20231027-optimize_checksum-v8-0-feb7101d128d@rivosinc.com>
In-Reply-To: <20231027-optimize_checksum-v8-0-feb7101d128d@rivosinc.com>
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
X-CRM114-CacheID: sfid-20231027_154401_696308_FBB6AE87 
X-CRM114-Status: GOOD (  11.04  )
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
