Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC51C369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 14:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jgs9XOyuB+P6936Pjfs+cmjMJmeppR+jVYuOUQIA8Qo=; b=iG2m74FKoYHZU7
	KyxiBx9V1nekGq6K0TfdO6ixk4a0fxleLHBgXK3HrFVyzhmFXdEQaUsPphLxtEnvM8SNrqp3Jflxn
	0FBAabGmNwuHeoh8XVbVCZg/ERIDctJhd4DNFWITs+szWZkdvgrYy7yrVuaj0d8s0heH/z27DeApB
	Ubwt3k2DEaB+zliA34sbzASFhnPdxOUIR4LkaQVqUFgkSBjPf9Qm1KEzO/sBZjyLatIY/jhqlzyyA
	CaWyefAo3O1tHFdwRfvRFeDzsu/WaNcCz5OrEh4dkrVoGpFJ5B4BOE7YsmLMmHTwmtkiznHF7rTI9
	KsQCBkLana00hpH9PlQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6s9T-00000004Sgt-29NO;
	Mon, 21 Apr 2025 14:29:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6s9Q-00000004SgD-3lC9
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 14:29:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso34259675e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 07:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745245775; x=1745850575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PqG7/ov+XLPSS/BI8rl8Yyu60TugcPqJyKJ5mLINmc=;
        b=Frj6ukWYhs26muNDST79qJR5DDEW06WlC2rhVM8DAzj+6TMgA2p/WngPadY8/zfams
         ohomcx+0478wGYXJsVH1x5MAy8MS3eZFozkbuVl8DoBcW/cxndyZZ1/5X+rUebvGm2sb
         XJWf6jwuEtvs4ZRYswCBjV3Ud44mcFyKDHXwE0eLXe7wbg4TkcyUUkiF2wDY9j2c3Bc1
         Oz8PtNUSYUbT8w1WwP7l/4EZ+UyaeRCHfipyrRizFedBDxA8Nj6n0NduKRaLBH+3Xyq+
         jUMtirR0AnHTA8aItlYRQswDfYhtVfg0NTorQJ7DWQ50zY95g+ZWmpvXiyoajYNr0uhG
         IAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745245775; x=1745850575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PqG7/ov+XLPSS/BI8rl8Yyu60TugcPqJyKJ5mLINmc=;
        b=Q2cXFjKKU/uN+nZKZ7C9uKRjaeOrCvw7xDaI7hv/T+ND/L7MTw8+4f+wwV6s5i8O8k
         G4VEioCtD8WcIxUJtENg7MSffdUJap15d4CpmQ6yUJDrZeeebc/vGoj4+9sv45kfYcKZ
         P+zimwv8NJLnEKIeeh47LtfDP3vFJhGSVjk25OR4BYfvF42i0idxKLIBdRUGTO+QGFGA
         fookX7pIKCXuOCL6KcpVqJpSVnK6/JY6R5slJ3RyJVrukX6aRc7+gPagAMm6ymODB6Ug
         W94XmyFKsAJpR0wI/Rde4YMiB77mjiDMqYRrazzYAqkfAiVWpKwuBqCslbXENmPfjaGZ
         iTyA==
X-Forwarded-Encrypted: i=1; AJvYcCUaxhcxrcieUgXfIbcXMDotBZbOaEqxoYMAlbKZwJWRmB2e2jjSiYbAmNuPz5oaehCcBCxibUKJTtxgDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4FaUOMhevdNvi77itQA+kV1CIM6nIG2e2gjG24tpWATOFvPBm
	4d2kwemEJmD5kmDC5JopXm9EJEVjWwgjAZ+Ga1WQoMn9W0I66F+MbQY0p7J/wIk=
X-Gm-Gg: ASbGncsC+APoStu5KTleGrYPFI5udwPSyFpSFGspXBQZp/kNFAOriKVGrpAMPyXDgYw
	3lfKeRIbN2Mb4uXOoQqVOmrMqOdiRLAEgtpXCozK4BIXS2ZPHAcENytQRRd/KdxLfSH+oH1ZtDZ
	rtipdwicGookHaSw+4YNRHkrDaJDlH8aTN41G8YlclshaUngKbyKjsAlQ6DUa1pB8txSP4Jyqki
	PTF+68BwnbxU8WEhLuvLNJncipR60cl0zl8qvbf75knw87c6ZMZSfTuthKMuhFvFRP2w7I9tQf2
	VRtuG509ExVqiRigWaztu14YMduXVA68AWyjhx0377iP9j5ClVkwEn3J+/Q=
X-Google-Smtp-Source: AGHT+IFtaZI4HL07N6roaGJageZKu+pJvFMTwymIjfPu+o3nCKfh2t3UeftOSZHfxlA79jnfnWiZmg==
X-Received: by 2002:a05:600c:3b9b:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-4406aa8984fmr117511685e9.0.1745245775271;
        Mon, 21 Apr 2025 07:29:35 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:cd58:9e76:e88c:5cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5bbc13sm135524665e9.17.2025.04.21.07.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:29:34 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 4/4] riscv: xchg: Prefetch the destination word for sc.w
Date: Mon, 21 Apr 2025 16:24:41 +0200
Message-Id: <20250421142441.395849-5-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250421142441.395849-1-alexghiti@rivosinc.com>
References: <20250421142441.395849-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_072936_936794_6EF41357 
X-CRM114-Status: GOOD (  12.47  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The cost of changing a cacheline from shared to exclusive state can be
significant, especially when this is triggered by an exclusive store,
since it may result in having to retry the transaction.

This patch makes use of prefetch.w to prefetch cachelines for write
prior to lr/sc loops when using the xchg_small atomic routine.

This patch is inspired by commit 0ea366f5e1b6 ("arm64: atomics:
prefetch the destination word for write prior to stxr").

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Link: https://lore.kernel.org/r/20231231082955.16516-4-guoren@kernel.org
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/cmpxchg.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 2ec119eb147b..0b749e710216 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -13,6 +13,7 @@
 #include <asm/hwcap.h>
 #include <asm/insn-def.h>
 #include <asm/cpufeature-macros.h>
+#include <asm/processor.h>
 
 #define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,		\
 			   swap_append, r, p, n)				\
@@ -37,6 +38,7 @@
 										\
 		__asm__ __volatile__ (						\
 		       prepend							\
+		       PREFETCHW_ASM(%5)					\
 		       "0:	lr.w %0, %2\n"					\
 		       "	and  %1, %0, %z4\n"				\
 		       "	or   %1, %1, %z3\n"				\
@@ -44,7 +46,7 @@
 		       "	bnez %1, 0b\n"					\
 		       sc_append						\
 		       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
-		       : "rJ" (__newx), "rJ" (~__mask)				\
+		       : "rJ" (__newx), "rJ" (~__mask), "rJ" (__ptr32b)		\
 		       : "memory");						\
 										\
 		r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
