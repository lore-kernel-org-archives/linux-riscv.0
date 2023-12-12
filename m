Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972F6C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 19:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f+Sfbct22cPfD76mhdvQ5viPErzOkaAl5cf5NCKTV2Y=; b=ctDYeyseBBMkoG
	mNGyjlVGNw6CEeUvpmFzb/1OS9+WfK/0lhf5XF3Z2wypmSq1UoL+zSxEPA7dE4JO49XwaJ9lPkZJD
	xrvJA0X0mJNB0NglROIulVewJgVXe5dtAvqG+FzZ3FEcX6IUKwljZCrrNsO88iG9NVQHpi4fOhfeJ
	lf7WRS8GE88lSF0mkKlvh1OAGVDUY1B0CFBIjW5aFT+sVEmb47tzcZDR29d3RejeYNEyK6Q1piyps
	dlgoI28rPea1+v3GKC1kwE5IiRHi3B8NPrKjVZZtpY5xNFg4jjWVD5QSSZbsnJGmhgZDHhNdSbuUv
	fsrTB4TXXFaGOs9ycJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD8pa-00CeBd-1A;
	Tue, 12 Dec 2023 19:54:14 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD8pX-00CeAx-0T
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 19:54:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c317723a8so51268635e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 11:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702410848; x=1703015648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JvZSnb3frgLpz0T6ZYUyMh/rwMmfERMcSWI4MbVdOSg=;
        b=F7fxxCi2/MOw8Wd/TXvdvuppx5LsS12SBVqzaP1581vYuvz48sSWJUqJ2d0nZ0Zy40
         F+vlzJWAdRApxbZM02dzHtNFEANX7rhYHfIssLFxyu7as+YaKEjvAUgSwvqYU9QqOFtf
         DKB3XaSjmQiYOC6h4siea+XDT8jLnnTlexXJ8KwhOeQYjI34Px775dBw1YORFGWRybYi
         RV34XcAu2BSRUBz9NMYrkF0GrZwGoHejpKT21OIMvxaqKPsO6gDvNF7QxbKPqJl9v+Hx
         CEDn8nVGbTlGf2KOOEH7rBnvxRvxwEa5t1/Nr9yY0AqOAPPEvcFyhQVjELYrO+4OMGIW
         3NCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702410848; x=1703015648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvZSnb3frgLpz0T6ZYUyMh/rwMmfERMcSWI4MbVdOSg=;
        b=qhbWUZDvooD84D/0QjDxEVb4onG1p1veENDaof8yJBbUsykS9KWBI0qLSs4mdzsndc
         vSymuLojza2NUUOmY5U+M4yUIteXB6FbH45WbZt1veOTyRZYJCtJmHsuEa4dPzV74Ngi
         3K3bSCf+UpyjhBIdijUsOLa2QqGsBwxdtAfV6iEOlXTongXhllmrOJjVPziP3eoyuEGg
         JV0fOBYKR2kVSdXbOx75fN9TODnFZk7+8szcooEYaw8NY511MbXQHUbgR7zvRidwk/gQ
         6tFvw589+9fY/evrgpQ+kj/igF4PgTrkMNMWeP5ZvAM5jbj0w2VikS68nJ6/tR9+wqAA
         zABg==
X-Gm-Message-State: AOJu0YynvDSF+R+2IeLmQJ2Ri+MJhHSReEqFj9esgoaG5rSugY5B5BVL
	+GX98D+yXV/k2NuSNGwkncaPYA==
X-Google-Smtp-Source: AGHT+IFX8nhEI0rbRpXhN/yjpVG2jYdKFpfLKOx+8sbynBMkPhmvV7Er0fQU4K1nNgFwq+Xh7r9xLQ==
X-Received: by 2002:a05:600c:2a41:b0:40c:32f1:816b with SMTP id x1-20020a05600c2a4100b0040c32f1816bmr3121626wme.162.1702410848328;
        Tue, 12 Dec 2023 11:54:08 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id e12-20020a05600c4e4c00b0040b398f0585sm17973419wmq.9.2023.12.12.11.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 11:54:07 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: syzbot+afb726d49f84c8d95ee1@syzkaller.appspotmail.com
Subject: [PATCH -fixes v2] riscv: Fix wrong usage of lm_alias() when splitting a huge linear mapping
Date: Tue, 12 Dec 2023 20:54:00 +0100
Message-Id: <20231212195400.128457-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_115411_183465_64B1BA21 
X-CRM114-Status: GOOD (  10.40  )
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

lm_alias() can only be used on kernel mappings since it explicitly uses
__pa_symbol(), so simply fix this by checking where the address belongs
to before.

Fixes: 311cd2f6e253 ("riscv: Fix set_memory_XX() and set_direct_map_XX() by splitting huge linear mappings")
Reported-by: syzbot+afb726d49f84c8d95ee1@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-riscv/000000000000620dd0060c02c5e1@google.com/
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

Changes in v2:
- Fix llvm warning about unitialized return value

 arch/riscv/mm/pageattr.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index fc5fc4f785c4..96cbda683936 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -305,8 +305,13 @@ static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
 				goto unlock;
 		}
 	} else if (is_kernel_mapping(start) || is_linear_mapping(start)) {
-		lm_start = (unsigned long)lm_alias(start);
-		lm_end = (unsigned long)lm_alias(end);
+		if (is_kernel_mapping(start)) {
+			lm_start = (unsigned long)lm_alias(start);
+			lm_end = (unsigned long)lm_alias(end);
+		} else {
+			lm_start = start;
+			lm_end = end;
+		}
 
 		ret = split_linear_mapping(lm_start, lm_end);
 		if (ret)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
