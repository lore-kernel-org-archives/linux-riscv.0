Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46350C7115B
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 03:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5YEpBA+/hbv7WLsUIUa+rgzQHYgyW5hYK0WJDQyWtcA=; b=uDS6jlKZnoqazB
	IujPlb2DL8X3vCO/GXYjt2ODaXDrX4qZz4XlsUhUOQCRLyBOKdfqGJbD13T/LXcPRT1Qq18Q5Yu8K
	31x9JZ6keuPDNk/DNzroWm6OcY8vsfVsU5KbAxqrndrOs6+xKL084J/CJI2y1Dn0xnvhzI0Eqa8qO
	PThbbJAGJcyLdmxMhbslKpdNMvQqL3sTRelpA1R0U3mSmTxm4AtMDxYXoREdBr5R5ric0yt+0fY6d
	MB2Zx264aLqz1rPrRUovJouyesGm9ledLCRWCr+AKLSXA5Y580mJvQLUqY1++ZSJC2RtmCVUZqZ6r
	GtZ+J+Rv4g2+i40vgr9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjom-00000008x7D-1z2x;
	Wed, 18 Jun 2025 03:50:32 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRjjk-00000008wKj-1zmz
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 03:45:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2353a2bc210so57099975ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 20:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750218317; x=1750823117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0fLkDwiiUZSss6sfPf8N7ZCd7V1JUEtWvKlq+l/gMKQ=;
        b=DrAzqNZWYm+ctF10R6iiepV/DV/YWs0TU2E9MdNk/utGN8hm/NpGRx+TQsAOjh8F1w
         sEJO5DuuDmP8Af8aK3rlvyDK2ZKkalmtF34X4m+GPGcgPX6U9pH6UUcOGba0krCBFxYy
         ivLKLrGxsOpx5KctsqAtLrVuiXroNrlmS4aU6j3GNJqSKeFZDQmoYUHSjDWA6VcuyfJY
         Pz0rTO+YZMvR/A8u3BArAw/jyaYTW+WJ6N8McZZZAx+cUjlXRKQW74oLQe93bBJ6f+JY
         W3tHMr1sPniTaAanjTcHWyrFkCohczAVeAxeMee+O+GwP2wwNVmcLXg/w9BhUAGEXkHQ
         fhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750218317; x=1750823117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0fLkDwiiUZSss6sfPf8N7ZCd7V1JUEtWvKlq+l/gMKQ=;
        b=bmGEWQG7Lid9kO5Q4KAohtzMpjUyQDa37+J+V2Vq4gkRbDYeLoSC9QcTJHsb3x3/DJ
         ZAjA2DX2BUnUXfcjaqd0OmO6AZ1R7AARkhDmFcxNIKeY/Ot3m4cxDwpz9TmoGHfBefDQ
         WZKXCAIKVpaPZGwIg0mw4WhTSMzpHSLpfKpxnjiGOR41Hmwl0zUL3GsuznGPjPz86jld
         umh14NmeMJmF4HXHZ3oNlAUIdwBoevqWXf7ouzNVGthSvekF4iNUCeUe3/XoOQCPuIzU
         1GVBTqnLe+NoYASRk4JjeO4dGyYGaAJAqQNzdayCGrh7hOQp9/UMrMEkg7shZdzlM9kK
         QA6A==
X-Forwarded-Encrypted: i=1; AJvYcCXZrfjRqaBcDgyLp4H1mne2/hqVpH8gLCMZB03De3OMHqdRCaFCAy6Y1knklHARHrJNbwwG4TBK4vpHvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu8bRrn5wB/A4aJnH9LixoUshaggCMxeHjdNIiDjMPnNLL8/hj
	DYZ+3I9d18tKICE+IrTamWEHIsuXMR8TCAcepNWjz9akqlSsmOx8aMUVQL2T+/p375Y=
X-Gm-Gg: ASbGnctvoHu43w57oMccBKe2Lw24kJltHp3I/sWndr8Q4QxUDgYEWwEQwxu1B1rUGqN
	yjLj9rbYH0eo3CltM08LlqrT+wSJaRwsZCjHIrO1TetOkozzMzPlznVYhED/Rl/ULuvKcCXXN5m
	693dkmLTfKCwn7irW4Q2ERUtT6Nx/gLdB/jVlAaVtJHpbrzBSXRTOcYPz6SO+hc/zehsKZh64x1
	OV8g/anOyBWKXqVkCTeJ+2F7a6ojQJtBQ/otu57o5qvugtebn/sXtEJocGTmsG4K7mbuJSKJ9pQ
	cBpRKmfXdSoXDHvsipt4MeZmf6A1vqOu3BGdceq1gAoAso+xEE6S8JcmYOGJfeHVi3nCn/s0znL
	sgbDUFlfrGeyoSpkXKBYf
X-Google-Smtp-Source: AGHT+IE7APHlRGasYy3yQ78VvuLvAp4la4XPZdrCuapexPi4U7QqDMCjcD3jPQHCJAuIypThc8r5lw==
X-Received: by 2002:a17:902:d489:b0:234:c2e7:a0e4 with SMTP id d9443c01a7336-2366b32e46bmr212010545ad.3.1750218316850;
        Tue, 17 Jun 2025 20:45:16 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a1ab8sm89333465ad.84.2025.06.17.20.45.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Jun 2025 20:45:16 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	linux-mm@kvack.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH RFC 1/2] riscv: remove irqflags.h inclusion in asm/bitops.h
Date: Wed, 18 Jun 2025 11:43:27 +0800
Message-Id: <20250618034328.21904-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_204520_521952_8818301A 
X-CRM114-Status: UNSURE (   8.65  )
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

The arch/riscv/include/asm/bitops.h does not functionally require
including /linux/irqflags.h. Additionally, adding
arch/riscv/include/asm/percpu.h causes a circular inclusion:
kernel/bounds.c
->include/linux/log2.h
->include/linux/bitops.h
->arch/riscv/include/asm/bitops.h
->include/linux/irqflags.h
->include/linux/find.h
->return val ? __ffs(val) : size;
->arch/riscv/include/asm/bitops.h

The compilation log is as follows:
CC      kernel/bounds.s
In file included from ./include/linux/bitmap.h:11,
               from ./include/linux/cpumask.h:12,
               from ./arch/riscv/include/asm/processor.h:55,
               from ./arch/riscv/include/asm/thread_info.h:42,
               from ./include/linux/thread_info.h:60,
               from ./include/asm-generic/preempt.h:5,
               from ./arch/riscv/include/generated/asm/preempt.h:1,
               from ./include/linux/preempt.h:79,
               from ./arch/riscv/include/asm/percpu.h:8,
               from ./include/linux/irqflags.h:19,
               from ./arch/riscv/include/asm/bitops.h:14,
               from ./include/linux/bitops.h:68,
               from ./include/linux/log2.h:12,
               from kernel/bounds.c:13:
./include/linux/find.h: In function 'find_next_bit':
./include/linux/find.h:66:30: error: implicit declaration of function '__ffs' [-Wimplicit-function-declaration]
   66 |                 return val ? __ffs(val) : size;
      |                              ^~~~~

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/bitops.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index d59310f74c2ba..d9837b3cf05fe 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -11,7 +11,6 @@
 #endif /* _LINUX_BITOPS_H */
 
 #include <linux/compiler.h>
-#include <linux/irqflags.h>
 #include <asm/barrier.h>
 #include <asm/bitsperlong.h>
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
