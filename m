Return-Path: <SRS0=b3sz=MI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F79ECE562
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 08:55:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26E45204EC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 08:55:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VAEAWsb6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYEH3jMl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26E45204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qIEL7YPh5eR4bbRh9I90cUius8RG7V9sP933YLZLDDw=; b=VAEAWsb6FI246ACUP4Nvd6UVqF
	/Xz6PGVdAKvWGipLEY1ZgQYWfE9eBc/o66Ph2m44RtC5LfWtfUUnkhscuu1jaHS391s9vCa32GHhV
	qrn16Q01U/oDMhQHEtFHe8SOn9x2HFyXITeemCnqTkYD99vCAlOfJGmqyPL66Rj5M1sLbtBB++g0U
	c42ZkHjFn029+K/KX6Brb8Cu7hJoWHbNR5c7Fp1jHuJNwi6T0WFlQysBX7VWE93j5dPRLo6J2UsWN
	pRYvlRckFe8mP9JGbebg4+2l65G6WBBtOKYfEDobA4Swqv713x2dGqqfX1xVYQ7ayS8DfVPaAC43e
	q1kvq5cQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g55HT-0004ac-QI; Wed, 26 Sep 2018 08:34:47 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g55GE-0004OO-Cb
 for linux-riscv@lists.infradead.org; Wed, 26 Sep 2018 08:33:32 +0000
Received: by mail-pl1-x642.google.com with SMTP id g2-v6so9593855plo.2
 for <linux-riscv@lists.infradead.org>; Wed, 26 Sep 2018 01:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ul55wigUjE4to1TohXKcjf7rrHR2DeP0tn9CFO87rmQ=;
 b=hYEH3jMlNhLRTGwPJGo2f3wGHDL/EDCtZEHrk/jBVFFQo3S1+2PbIQvscOtoxQx5s0
 KJtZ/i0OsXvbL00R7+7lXHY3Yw1rOfyth5dxZuTixlMqASoGO/sL7QhExPJkbPpEy6IY
 /cC2kRZpmGusKwm61UwrVP2qCQqJZsfW7kNhSyY5gmZGZBn+EWmQcZNYXnCWyodMb5N1
 z/AFpWwJa9OLehnAKeim0lh9acMDcVzW9JOzgdtVIetA08rUNMt+QKS4RSufpnH4+64t
 iy0o7GkTq8PTprWJZxaIf4jsMdmSjWdqwwbXmHor/zPIYVq/bSzQSOk0LpHeb3zqZaf9
 cUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ul55wigUjE4to1TohXKcjf7rrHR2DeP0tn9CFO87rmQ=;
 b=q6hniVc2TgWHgyrVO6PalYbiU8YHuPeZTgDjeMzy70PFmOdW4sDkLZQv7pBD4ZraC4
 AOlGbdn92I1CtNlsFXnDI5+DJmDjgeImyDWGUOdr3z5pVjHSP5oYifyfRkLxU1xlAafu
 11v24n8NNLisCFxCiAr6VpVa5C+/Hh7FjzF8csuVTr8lEWSCGiff1ynn+oIpuWPznWWd
 Sv0HeVtq+ucviYkY/VeQdW5EwmqKJgFhsRRBDXEvorIM4+Nwb5z5rnJ3pv4yx4z4fMcY
 G1QW6xHfJXX2H8kdZB2wzYvncX2Fbb22MeAS3V9sOnf5sYH2sKWuoDBmA8E+yJc7Ycsz
 5Qsg==
X-Gm-Message-State: ABuFfoifdA9FAbuJCKRiO60xmlgyodEjhWh9P+1IZckxw6hoYJtHrUzu
 mLjJPWc5aX/WHpk61Mcu5BM=
X-Google-Smtp-Source: ACcGV61AVIaq65L/UPMDOaBaOxZDgRx4GIKOrQ/BLBI7ZG/Dj2bebNJIkwmqbe7NiYOidRacJsZDJw==
X-Received: by 2002:a17:902:650f:: with SMTP id
 b15-v6mr4948598plk.2.1537950779386; 
 Wed, 26 Sep 2018 01:32:59 -0700 (PDT)
Received: from app09.andestech.com ([118.163.51.199])
 by smtp.gmail.com with ESMTPSA id f15-v6sm5530764pgv.66.2018.09.26.01.32.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Sep 2018 01:32:58 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v2 1/5] RISC-V: Build tishift only on 64-bit
Date: Wed, 26 Sep 2018 16:31:10 +0800
Message-Id:
 <40c77db9ee2d23479ff90f2658539d29d7a30896.1537949825.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1537949825.git.zongbox@gmail.com>
References: <cover.1537949825.git.zongbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180926_013330_459476_F60109F4 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: zong@andestech.com, linux-kernel@vger.kernel.org,
 Zong Li <zongbox@gmail.com>, hch@infradead.org, vincentc@andestech.com,
 linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180926083110.Fto3FfFYt1l1JL-3Koec9zvKM86BdIcrPgLceYt2ahA@z>

Only RV64 supports 128 integer size.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/lib/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 445ec84..5739bd0 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -2,6 +2,7 @@ lib-y	+= delay.o
 lib-y	+= memcpy.o
 lib-y	+= memset.o
 lib-y	+= uaccess.o
-lib-y	+= tishift.o
+
+lib-(CONFIG_64BIT) += tishift.o
 
 lib-$(CONFIG_32BIT) += udivdi3.o
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
