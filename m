Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5238EC28B2F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 02:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SnhMprrfqHLpjZUCNBVUgVzJibJqOOO3yl1M5EzN5Vs=; b=G7sDz5VnNe1trB
	qkqB4r27zOJdRB9kjv/VjbCWllyjqH1pw05SiHF7GfC+X7fJB6NUIAPpB/OB+KNwPcbftpheiHGJS
	mYzhCuAXP8FnA/ZUcLl/f5NmpBYKG1qV2pogcB1hqC2ia2ERuYO40LrpwyZIMtdqkj010bdRJgMRi
	Ys688qH3XYuJiYFof0z/idchPDJeSoj92aBHSAjSqma8UF0iVQxoW/YHStMcwud+YtyvnnwWrnqPy
	ujEW6Bnz6QzEzie1t+9NlUeQN5nkhgf4ax5aZ2Me1FJuTpbwvdtwLp/JmBJ7xFzZEw4L9LIO7o/VO
	f0bEpVvO5W4S07FU5Btg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYB6-00000009uur-2th1;
	Thu, 13 Mar 2025 02:20:08 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsYB4-00000009uth-1nuJ
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 02:20:07 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2feae794508so887838a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Mar 2025 19:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741832405; x=1742437205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLw67BqWA0BIkPETmcHm1W/HkXtVEPs+aCbes5Kp6pw=;
        b=K4s6x1YD1giNKrfpWz++3BaULoobv7igx8X+mjBeSY4Ih3GeFR52w3d3avSglB77ec
         1E0oLu9DGTf1mhA+0P41F+rihS2uympMim9G2MMkwJuny3EljSQk2hJJjXqNCZnC0YEl
         gPkQT0YDurkkn/RfohAyhz/1MFhK4t5E+yyqZqxsT4ipgIfKsS9NsX3srpjbhH1X5Ljc
         T7dz8z0NLphEApxjzAZ/NDN6nfI2AAFOEaBgenbjjWke4iJwF2IWvabawKE/Y+66gaYz
         0G2W0gVRuFRpFNqz0lhjgCn3LHcFllI6VisATF4hJYHkPpgD8yNB4nCu6/cLZmTUx/QY
         nvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741832405; x=1742437205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLw67BqWA0BIkPETmcHm1W/HkXtVEPs+aCbes5Kp6pw=;
        b=moidCqgYc7UPSNPtSx1NsKnuzKqC3dvfMvp+mwrveST7bUJ19zV7i8gqmqFCa4Z+lo
         AWGuM/aeSl1iu1xM+VByi3dtt5Bu+6VLAm6SaVgyFZIMCJuEpRnCQuKXrx4F3/GOQb9H
         i39tP0/5LO3+n/fJQIcgHbz/sT5iX78LrExlFXDtuBJ9YFv8CbqSy0LthxpXK2CxRLJD
         V7aou2jJrzVZZjXLI/d94fQuSpxbYfJjm34Cul+yPLLRbYs4kgNsypqlJw5BCkCM5xeV
         BANpap8uLaBfTp2SRtICEBvhxxub9bDYnbUbGLSzygNcb3JTNw0s+isH3E6TXkop5X/J
         R3Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXd+eEHIIo2otakCcOkOWV/UY9V0l90I7Q+YMnxzu7nPywiWd2xng7ALYzowomukbPcHwXHnr8UpQQybw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJeYMeo9aRXALjQZlvMn3a4XqVdtmDbm29tWk+zvp/MPQ2GJM6
	5PO76Ymtc1kYq+GL8l/m+hpIdp6JOUuwGgxVkIM/t4rCyCrj7boJ
X-Gm-Gg: ASbGnctnJ9sv6jzHBchQ7yg588YQ1VQlXWC/8O/xjsoDHu4DR3XdZaFcpvrH4xYdBqS
	TuTUwQMhb1lUOnoyJb/Sk9YT+Oec0wnFNdHm7eb9Zs5ITU5NcdUniIrx+06GmOUO5adrqmWHoJ+
	MDzgwuTiL95+BDqns0lOVeVp3VHQSUdTWRwu8gNyDO2cRBuYmRd7wlmwDbMA+4C1iSV9RJSMYu6
	T40NmrhnjgZXqTWmjOn9Izhjt4JH3SpM0sKSUCrbOyYHKWCh7Le0vTQx/Sv80mLV4gbG+szuTdN
	5AF1HhnZ1+RoTjXLw02wLSGvXjDv8YfgDa3Pe7o99f1y
X-Google-Smtp-Source: AGHT+IGd/HsBjLkc68NP6moc+1YM/RCLuYwV9ycuTAbmTeB62jDlEwfr3ThGTS9nnEwZw2LwUvK2WA==
X-Received: by 2002:a17:90a:d605:b0:2f9:cf97:56ac with SMTP id 98e67ed59e1d1-2ff7cd3ebcfmr41200798a91.0.1741832405575;
        Wed, 12 Mar 2025 19:20:05 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011809f308sm2668096a91.0.2025.03.12.19.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 19:20:05 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH 3/4] riscv: switch set_icache_stale_mask() to using non-atomic assign_cpu()
Date: Wed, 12 Mar 2025 22:19:51 -0400
Message-ID: <20250313021953.86035-4-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313021953.86035-1-yury.norov@gmail.com>
References: <20250313021953.86035-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_192006_471667_3D4622CD 
X-CRM114-Status: UNSURE (   9.95  )
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

The atomic cpumask_assign_cpu() follows non-atomic cpumask_setall(),
which makes the whole operation non-atomic. Fix this by relaxing to
non-atomic __assign_cpu().

Fixes: 7c1e5b9690b0e14 ("riscv: Disable preemption while handling PR_RISCV_CTX_SW_FENCEI_OFF")
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/riscv/mm/cacheflush.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index b81672729887..b8e96dfff19d 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -172,7 +172,7 @@ static void set_icache_stale_mask(void)
 	stale_cpu = cpumask_test_cpu(cpu, mask);
 
 	cpumask_setall(mask);
-	cpumask_assign_cpu(cpu, mask, stale_cpu);
+	__assign_cpu(cpu, mask, stale_cpu);
 	put_cpu();
 }
 #endif
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
