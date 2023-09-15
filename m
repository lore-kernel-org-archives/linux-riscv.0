Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8158BEE021A
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 03:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IrQ5YI/7BMTAFKmlgVdjnma5QfcU6tk1EvmZINbMaRs=; b=MlxHZXvZHrCJVJ
	euDEEk4tEANnO57rDY/NkcJHB1AkXU+uNIN0Fx/wamLUT7V58SFw07lAjiElIVMNjt3NGQnVy5F1A
	yq8vrn8MIsIi+93OaE0Rp85LTK5vjaOhgLSugHc9wrpfhe/H6h2Hto5pHuV/6AMp9pVH0QEW8iJLR
	rI6dt+dMqoLDnctFlBsgGQUkvkuAg21mpQEdoPEptCbuGaCYCSO3+Qw9sUtb+3TYl2jm3J8wZTQsS
	XbG+FwKTTr6LsifUlNAuxVL00L8HrFHt6Emas5R3idAx6C27Bmbb1UcG8bJdcDrdjY7RbVjinOfS0
	oKokIKn7zPJSq725FSpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgzpx-009gzx-1X;
	Fri, 15 Sep 2023 03:49:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgzpv-009gzA-2D
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 03:49:44 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bc0d39b52cso14622045ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 20:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694749782; x=1695354582; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYrxQXlYsxlbzxTi4wO/BXPj8sXNJd30qJO9BW1+NbI=;
        b=RkE3SGgocawbeQCkS+HrrXS3xVOY2wBIdCoMW7cfh43ncwzSzlEtNafTTnYpJkr1PJ
         KveaX6e2qtoEafLLwi+CHN6EJUy3OLO8QxvoAsX9HLNkxV4RicXfL3mwx4wxWgg/8mIy
         SKhECVJDnebdCspP+f60/L9Cbz/AdtwTMttfxELUtdqt7ICD3Al0GlwZ9hVzXATGvYCk
         pmnO0HmeQXmhJ7S8VC4JPt+XkfCwgnCocnY2kLOanrODMNaBKkSEWRgWryyg7IkYJrwI
         vkmCRwe9koub70HPsJdGPlz9SoanZsP/UixafHakt+o4CgtINzDTvqb/CElLJu+knYoa
         eldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694749782; x=1695354582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYrxQXlYsxlbzxTi4wO/BXPj8sXNJd30qJO9BW1+NbI=;
        b=nzkRUaY59oQItj64THEktMkLu8Hj5pU/I8QSGbCI9usIKoYbAMewr+EnAPwBrqG7Sb
         hW/o05jXg1j/78ooaJmqwQ5Z3Laq/S074jmK+GqV6jmuYoGpzw3TZRcWp7LoVDhcfr0l
         9AhgoRBbX2kNWP1FVTPcHHWcop4QzArp8+J7At0FhF1e2ZooPNiBOYUTeVpQXrBYSLK/
         RgesarulWLhLDwa2GKratMO5rjetwETJdON9+v3tYGEodpnoKIZp58G/iFavL70AT63D
         dDBkiIhsRi6hZD0erwxkOn3RNYC/6rRnt0Ujs3lOam3ArJMqcnzF38fXdC5JR36wmRFg
         e+DA==
X-Gm-Message-State: AOJu0YxCt2OYT48EKn0d0gm0VQwXCIt8nA01nQ2ICScedv5ET1tHCFBS
	kZHeVWmiC6bEDaktVlXALB+Idw==
X-Google-Smtp-Source: AGHT+IE5tKvO4SXpAoimXWGch4a0PPCgswsOZ5z1Ogsr/mm4ho/Z0k9TYcBVqTcs69mbhoBJ0bgVSQ==
X-Received: by 2002:a17:90a:c245:b0:268:3f6d:9751 with SMTP id d5-20020a17090ac24500b002683f6d9751mr416214pjx.23.1694749782539;
        Thu, 14 Sep 2023 20:49:42 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id g5-20020a17090adac500b002739282db53sm3881409pjx.32.2023.09.14.20.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 20:49:42 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 14 Sep 2023 20:49:37 -0700
Subject: [PATCH v5 1/4] asm-generic: Improve csum_fold
MIME-Version: 1.0
Message-Id: <20230914-optimize_checksum-v5-1-c95b82a2757e@rivosinc.com>
References: <20230914-optimize_checksum-v5-0-c95b82a2757e@rivosinc.com>
In-Reply-To: <20230914-optimize_checksum-v5-0-c95b82a2757e@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 David Laight <David.Laight@aculab.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_204943_721429_05D5BF33 
X-CRM114-Status: UNSURE (   8.95  )
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

This csum_fold implementation introduced into arch/arc by Vineet Gupta
is better than the default implementation on at least arc, x86, arm, and
riscv. Using GCC trunk and compiling non-inlined version, this
implementation has 41.6667%, 25%, 16.6667% fewer instructions on
riscv64, x86-64, and arm64 respectively with -O3 optimization.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 include/asm-generic/checksum.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/asm-generic/checksum.h b/include/asm-generic/checksum.h
index 43e18db89c14..adab9ac4312c 100644
--- a/include/asm-generic/checksum.h
+++ b/include/asm-generic/checksum.h
@@ -30,10 +30,7 @@ extern __sum16 ip_fast_csum(const void *iph, unsigned int ihl);
  */
 static inline __sum16 csum_fold(__wsum csum)
 {
-	u32 sum = (__force u32)csum;
-	sum = (sum & 0xffff) + (sum >> 16);
-	sum = (sum & 0xffff) + (sum >> 16);
-	return (__force __sum16)~sum;
+	return (__force __sum16)((~csum - ror32(csum, 16)) >> 16);
 }
 #endif
 

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
