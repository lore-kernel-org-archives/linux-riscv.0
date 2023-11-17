Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02210C54FB9
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 21:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOprndq+UaWCHClizi5Z7v+VaZQhXo625rtCXoUA80Q=; b=BaWWtqLid1L0G6
	+YiDIS2DYaQgQOC16KACZpk6720nFCul1hBAnYz3U62Kr3Gj7tFJZbz2l+Q+UwyzCFmx66Qdbj0y5
	fFG8AydvakxQWogIzcu4uAzXmUBkS8HusRVrjazLSXoOHVoAL4MZvdaQdORuaDFibeqAnPxjSRk60
	llnG9t4LFyRkceXnX0EEmSiNVo4Vzu4feagIHwXyriKOJoOdzc+xoQP+TcHJforC7NMP7+Sy3dsWK
	OB6WE80MZYR9oRiCzTUhEsHBudZBfUXhopWAwxkoiXunpBzu+YsnwDbQxZ5qhxtTMFySPU85qJk/h
	5Wm2oYYpabRYJcUbzi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r46Nr-007NJd-1u;
	Fri, 17 Nov 2023 21:28:15 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r46Nn-007NFU-0R
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 21:28:12 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6ce2d4567caso1310794a34.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 13:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700256490; x=1700861290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQdBfGrxgT0Dp0rMc/ALsHZTaxuvWcxH/0MUqWK8IuU=;
        b=Vunnv8cGfEp1/SCcHzHyTPriofwCIih321eYSCQ6GnVfyi6GDcSsw+c7AYoLDUOatM
         QYsrw0cz5R69QYx/zTxTnqALLF93AyqLYKV36zzP9sKUsrEmKt4VbdOJjKbWAjOWPAlz
         SK4bq41BKOeBUH9FayzCZWSwIZffGcy/2sTGan4YG3K9ERg8SnRz6u7Taxgy+xVwzIqX
         F25rFmcA/qgw22gKWnI4JpvYkawD6MY8urQn8roa/z3NX3/GQl90SC6Jkj9+6zBPiv0l
         xMobWdFcmN+DMK9CL42AXgU64AWWI4AqGMWmklmfEhJkxdbiFxtQPLMn8GVFmTi1KFKA
         m/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700256490; x=1700861290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQdBfGrxgT0Dp0rMc/ALsHZTaxuvWcxH/0MUqWK8IuU=;
        b=RPFdtsBSamOx0G3JD4SF+I642JXvAPcbIZpF0Zb+Kdi6f3vtwiKWNEB702nC+5z77F
         vzdweYbQShpumhMnsREAFlWd1suWu6HqZw3GtuRVI0ifaiDzvyABDe6lzo67IUEAQ/8/
         9jemrPj8bUpfYi9bTfU8TaSyitGgl6mYnkXC44LzOQRSqmWC9luSG8vxNQeUy/uI89kU
         m3qFpnW42QhKAxNpHPcvPpAP8d0IUbMeUMXPw08rjbWU2amHDo9ZYRE6AhRbu2Vm+I5H
         V/GKzKcoX5QNynf6JbGBNatJ54f5c0LmarUbq7IANHD9+QzAAnIWhs3uyVoGHYenwwaP
         GN/Q==
X-Gm-Message-State: AOJu0YyeDlGzv3vbV/lYFtAhWRKyCTb2lHpo/A4g5iiBgg8jVXUtDbtW
	EbiYWUVZkYaz3CwC5vgWLLRY4A==
X-Google-Smtp-Source: AGHT+IERQ0+DN8SQn6/wJ3vrUeFjmy9jXeWoMn+tLYoESOPbb2DXJmsV20QZd0x5Dm205tCkq4OFHA==
X-Received: by 2002:a05:6871:3788:b0:1f5:2b0c:706b with SMTP id nq8-20020a056871378800b001f52b0c706bmr394978oac.28.1700256489806;
        Fri, 17 Nov 2023 13:28:09 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e2-20020a05683013c200b006d3127234d7sm365677otq.8.2023.11.17.13.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:28:09 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 17 Nov 2023 13:27:59 -0800
Subject: [PATCH v11 1/5] asm-generic: Improve csum_fold
MIME-Version: 1.0
Message-Id: <20231117-optimize_checksum-v11-1-7d9d954fe361@rivosinc.com>
References: <20231117-optimize_checksum-v11-0-7d9d954fe361@rivosinc.com>
In-Reply-To: <20231117-optimize_checksum-v11-0-7d9d954fe361@rivosinc.com>
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
X-CRM114-CacheID: sfid-20231117_132811_175668_BA04C1F1 
X-CRM114-Status: GOOD (  10.92  )
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
