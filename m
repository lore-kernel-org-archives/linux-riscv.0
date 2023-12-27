Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518F6C47077
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Dec 2023 17:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DB3/T/t0FM/jPoLM60N26bZS+7GupNpWMkbWoDfAez4=; b=gk5I8vIiwmeqnS
	Ay+PvawcehLSIJKY4JVhm9R5u4ELyovit4WgZMBDekqsW5x6rYuZQw5efdWMKBt0FLeZ+blRvUp7Z
	qhzkI9ntFc2gs2s7ONOTcQJfkXlNEWU6gBj817f5ZgjLGObcYerqQKxzZ7NI5bSDuyYdw7zuLw3gd
	05hmaAP1jQF6vPm3B+uo+mxFYWyAp0RKpqIvpkItBtPaF/kNnF1cnl9NEICsRHnQUeClTLf35wrPS
	FoUkfoo8nhFgQQvopK47VvcfbKHUozq4RTC0fBtd45pvpRpFWUO5AN59wKM8kMgRyTe+YBBAPwSB/
	T4Qo9WDh/deUA2WOXV2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIXrR-00FDTi-2G;
	Wed, 27 Dec 2023 17:38:29 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIXrL-00FDPe-1f
	for linux-riscv@lists.infradead.org;
	Wed, 27 Dec 2023 17:38:24 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6dc025dd9a9so679871a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 09:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703698696; x=1704303496; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjqGV1Kb/P5zbkrU4HZj42U242Y4ucdb6cKzFhJu16E=;
        b=ii0XXYut5NhANQBBMq1Fz/Y7T/GfJ/I9lUfEQdXnn39docnB1h1Z7M+TD5JHFxCV1o
         y7+hU3R1U5SePWXNaNTy4qiM+NgjkgPdBxhdLFQ/Ipguxq/B6neTzTLkQkSv/8rmkrgj
         5exB1p45ZCyRB2SeT6wUXjLNPoYt1GbVN3uKj+/2fMTw72fLcpExHfoRydrUAAslkbsU
         i8HYoWyBzurP0jHoJ0FrBvD2anpQXG+yy8MX6TbRKQlFLqw4MxRcJnS670Q+BsOnJhcD
         wusmclgGpJkto5KuuhrSqgjgz8IL7kGGIGNRlYjTfgfoEQrXBarrHvyuF2X34tsZKSG5
         5TDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703698696; x=1704303496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjqGV1Kb/P5zbkrU4HZj42U242Y4ucdb6cKzFhJu16E=;
        b=qeYGGYxppVplxO5VkxEwslX3NbFsXrL4GhYyC15eyylvpioVnoCZn5ZYGBLPkP4i2B
         d0Mg5vXRk9ZpgHBFUgYB4DX8LSKGb6f9U/2kLOtKKhMuYIcuIDNqntU0ic1m/pk0g0Pw
         A99q/f1G02odL8aVcyg4/j/hcajbVeUcumzUIydzY9FVmGID4SvAWW1WGau/XLax0VO5
         ZuT9pjMk3OZLi3OxzlzWG4VyX/40OcaTM3M4J149yTF4yrA/6/8+KXgpr0TuJBC3gfbU
         bqmtWHiDeGSw4ZzGD07jIAsThgmm9B/0v0W9XPVP0LxdOkEYqwvxHdkk9AbcM8qc84mi
         aoFw==
X-Gm-Message-State: AOJu0YwTwnRqYDOamuMma2MlOz6W5MB13jLjCmHJfRkX+1oBLLsUOpDN
	3hVkx3KyFQXLxyfrSxjwUMA4ljOhGHS6+w==
X-Google-Smtp-Source: AGHT+IEC0TCsueb9xj6CGGfHkV5Zq8ZY6MZ2NdEdjOM+tCPVn6udluAxHSt66BkStvL/ctF3obevSA==
X-Received: by 2002:a05:6870:5313:b0:203:985a:d559 with SMTP id j19-20020a056870531300b00203985ad559mr12222142oan.23.1703698696650;
        Wed, 27 Dec 2023 09:38:16 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id rl15-20020a056871650f00b002049c207104sm1337173oab.27.2023.12.27.09.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 09:38:15 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 27 Dec 2023 09:38:00 -0800
Subject: [PATCH v14 1/5] asm-generic: Improve csum_fold
MIME-Version: 1.0
Message-Id: <20231227-optimize_checksum-v14-1-ddfd48016566@rivosinc.com>
References: <20231227-optimize_checksum-v14-0-ddfd48016566@rivosinc.com>
In-Reply-To: <20231227-optimize_checksum-v14-0-ddfd48016566@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, Xiao Wang <xiao.w.wang@intel.com>, 
 Evan Green <evan@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
 David Laight <david.laight@aculab.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703698692; l=1517;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=FtbING0Tg9V1myoJvDDTr8ph0mEbsa+4mbxe/ijBRBI=;
 b=EVQ2R0oDdrjYUCtjGIG7LtR556zWizaK9KP7EpvcICoCvv2FlTnhqyqWoF3f+c6pInR/9M0b7
 MOvIb/8692VDNcd4u/I4PxPCe8+Rkmq1PqyHlRthW/n1TVwHLgqPb8o
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_093823_551875_87D2D2ED 
X-CRM114-Status: GOOD (  10.57  )
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
