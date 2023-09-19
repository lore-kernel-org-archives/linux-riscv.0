Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8655CE79AC
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 18:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3JwdKiJ6kUWavlgPTH05Ns2V41sQ9aNJe+VuKMgwz/g=; b=Pl8opWRpdY9mwt
	suaoaXWPuBW8YE3OWykFT5YdGMWiBaUsEIKA3yIYLSVskHsTDz3r7SF56PArQmzNS8ssYfyjOuLn6
	D3qNzh+y40Igt03O1EVyjfrZhdJDkT3bC2jiCmtDoDazp7pBa5MEz/mNgfZIrTcvxh+5zCqnRvQgu
	reB8PjhV7S8h6jvU9cGxgqqNfxb219nhDacDCd2A3Ztc/8Dd9q9ZBf7UkDRuMMJ0L71ZEaMxzqnS+
	bU9ne2X3P/6ku2Sz6waasTuYaL9mOelmiJQ4NaXIRcNe6s1ApTyV1MRmYUmlu9+sXkT2x6QEal7eK
	lWscEsh5nHLKT1Uv8aeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qific-0015iC-0O;
	Tue, 19 Sep 2023 18:45:06 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qifiX-0015gl-0H
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 18:45:02 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2749b3e682aso3460358a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695149099; x=1695753899; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55gQAkGJdgEhOiqM5Y2FlQbtEmx2dMpuljRL7f6iQqU=;
        b=iD1lGnIhm9iBZ8yPhF6TfXo0HZ9pDfaWiav2tx/sH4bgdf/jNX7U0N8l/qDIAVQCTx
         Uz64bZ01/XZ87QiVn6Sj0445Ulv/Iu2KBqnRsZBWNQ8RIfO7rXm6PKEr028gULaAauLw
         vmtZz4+BR1NTDEVnKgRAPtPZvOaXCNXgSJEaLM7gC76XZT0zPahT2JEBmlTGUW1N25p1
         YnJKdbOejfNMGNbI2zrs/0vCcu5KvdT2dvL1a4aR+gJEu3wQ9eMwjMM7TCtOPO6liqK9
         lHVf0O7UCqozcu8vDUEaJ/wsEw/EkHciiYIT/+pRhcfaK+uj6G6ptBjF8H7os/9DpoT7
         z+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695149099; x=1695753899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55gQAkGJdgEhOiqM5Y2FlQbtEmx2dMpuljRL7f6iQqU=;
        b=oAJZBkKVOr5Lrd2ydPg/N6loFeB4ellzLv2RX4qb/UkFDibQqC9Nr/DEDZXIylULwb
         okJeoP9NJYI1ll+UFOzZrFXlv4DXq0i0oLFKxAYhPl+Lqc5ZgwbPay0vNB0tEqbMMHGb
         +5aAlPVtOL0W76S0kkUiPjFx6Ms8dFnEyL4cTpxOH4RwA3aT47uGBCpDwi4i4hqS3//P
         BKVjxY+Tiq54OnEwFrEEuVOmvM2nmfbex1jtKlJObEnyC9MaqFdnQairT55/ex4/5a6y
         zIp+4aoRl5Cg92OIrQYF9UQrhEihDb96GperGr1kMQIY7otgVy+uArGLDXRAOSnr8AlJ
         Gw5Q==
X-Gm-Message-State: AOJu0Yz2Ed8Y36KBnIMn60J0i4gzOS1g82sRDqFJPXmrTnPwoqRl7Fmr
	OP8EREL1mY5F2nDYF7lNmBLdXA==
X-Google-Smtp-Source: AGHT+IECeD0t3KVVjp83+SDRaC/7OrzIU81MVJ+7IrS4+dRmUhHoCcO+7uyA3Gf++yea4S5twdODgw==
X-Received: by 2002:a17:90b:23c1:b0:26c:f9a5:4493 with SMTP id md1-20020a17090b23c100b0026cf9a54493mr539248pjb.5.1695149099376;
        Tue, 19 Sep 2023 11:44:59 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id m5-20020a17090b068500b0026309d57724sm3876846pjz.39.2023.09.19.11.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 11:44:59 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 19 Sep 2023 11:44:30 -0700
Subject: [PATCH v7 1/4] asm-generic: Improve csum_fold
MIME-Version: 1.0
Message-Id: <20230919-optimize_checksum-v7-1-06c7d0ddd5d6@rivosinc.com>
References: <20230919-optimize_checksum-v7-0-06c7d0ddd5d6@rivosinc.com>
In-Reply-To: <20230919-optimize_checksum-v7-0-06c7d0ddd5d6@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
 David Laight <david.laight@aculab.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_114501_124436_51B1725A 
X-CRM114-Status: GOOD (  11.67  )
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
