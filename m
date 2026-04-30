Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6849BFF886F
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 03:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UNMbVkRRGcRUJ3Up7+UieOPK3vPVpXdlW2pTXaSvIaA=; b=lvKvIPzroYRLYp
	gYS37pGVBEWCifperzGrwkl2zZgOEtYViVJT4pSuSeKp79mr/KOU9JDVAZxs95Jz6hyFXq7iaBXMJ
	NYM7Itjc0V9DNJ/gLSSDC28yBrddJWry4i5l7Tv/xTHRhQDHMUZULLBLiu95qe3qc6ZtK4yVtAgJj
	bDy1R1jRlp8JR+phGp8Hzf1fM+ZCZRr5u76Qn9wbbCzhD07megzSJG3ZmWG4rAHTO6jXbQ3sfE5vH
	Rh1A8ahGn1vognMfmB02Ezebml8HUOCPJhn30ekEfXCUF96RTkkTj5bSEoMjsbR9TmBJwbnT8qizt
	HkQsNxv1w83lkeFbOqmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIISz-00000004cF9-2S66;
	Thu, 30 Apr 2026 03:53:33 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIISx-00000004cEj-2UGK
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 03:53:32 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8d560ede296so53248785a.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Apr 2026 20:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777521210; x=1778126010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pUZbQ4Dd2SvmJrip6uLhP8gH/Og40z7uVed005qXp7o=;
        b=MZSuYIhoHRKLHPsIpJmFytJsuRAg1NC6fpnn9aeE3rAboCkfvUDkRt87nJC6KU60wo
         w0MvYy5SV8xNQodvpVDqr5imAKVg1dduV/FiPNr6Hw+d45CP07LqWI/WdDSSJ6QMqXGu
         +KgwvHTBYL5Ia2FpPw9dQK24laGGIFtM4l5GMhbSuaQO3AJp1oUonnbqxyak+ltra29C
         n4YK0P4qck4N8M9xeo7N0Hy+1B+c2cjQF2hbXCcT3ZohsmkA5GJg25aMVOsOrHT++Xmz
         qJxHTeAbNskZyk2bRABo/PGl2qo/Ur2+GJS2Lmxc+gtRL4HLgzO38qUmiuMx+QWZhSgC
         Yamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777521210; x=1778126010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUZbQ4Dd2SvmJrip6uLhP8gH/Og40z7uVed005qXp7o=;
        b=FT5V67YTbZz7LsxkdphT+M2nGu7xcdHcrwxbqUJvKomxak1fD4fMIVK1C/822mUn22
         roRAC7tTXiC/+yubgckJlbF3R46YeEcLGoQ/zI2j7zYgrsHTJGTK4hqFTTF7H4m4u3tJ
         p0gbuO3Ec3sFqi+C2jbANGUts7tOBMn0a7Yh8juDSv8iF9UJGiY90Y/BtNz9h30AZgXJ
         q8Yge3yZAD4d61I8640XLAvk9mQK/woVYB5llWJqP/m5pxH1v6ZKsLjfNJcg7WDCi+ct
         jngXXxYNLIeZSljwepCFHNC9RuQdVTR7eQj2tNH77gTGB14A9LapNv2F0OgiHO3ZOi4r
         CbRg==
X-Forwarded-Encrypted: i=1; AFNElJ8faW5tZN/eBPSI8t16fvyzPi5+PfJ7xeNzNQx3qR+IfOiqYaJCDMSFHHW9lWf8RflmWYmCuahE6u2CEg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxthVYm8b/enlv6IUbVAgmDUjQlDKpUYpjGnA6tEz8QU1U7Su6s
	qdaXlVDtFclfZtQ2Sh1xW+hgNS+ZdE9yj1nWq8tV3r0XcB6eqJPZGMk1
X-Gm-Gg: AeBDieu1G0zy31HuSvgKn2mVVw+20LGkwPFIrGp7rYtrlu0FZdTDDvpsoL8rkeElbpq
	EuF7gypG2uzHY7m9zL26JlR1uHFD29AAbdVygL/MUalELEqY4YCpaLl7ott7HNpY7jvuap6zg6s
	zNQ/TaKE1lSEvA2arUMnvajTu/C3avjl0gJeJgahMVkKskmVFdW3PNhSu8iBe1YQXvK2+zIuX/w
	Gi/AOQH83Q/RCZocPAgvJlVvs/TFlOGG/nk/cgJo4s7yIV1HbnhXAC15SNtDrzMJEjJImfD4QOA
	Ys5abX0oYDMF7i427W1EBQWfBdDku88Xrys39/z8xPSTwUdq2LbEUjz2m0xqRRgvMsPjok+4kCW
	CMXVwp0TYCS6ayglaPVJXMOT/RF6bIpxwEDOK01t/sRpsK8/tRsYy3EhAlflaOOOmG4kiepT8qo
	H3Y0M1TS47FgSx05YzdJGS0fC9cIke2NfUzfWspeg9CwEPRQyTwy2Lxm5qzg==
X-Received: by 2002:ac8:5f87:0:b0:50b:577c:e259 with SMTP id d75a77b69052e-5102adbf648mr15843261cf.35.1777521209758;
        Wed, 29 Apr 2026 20:53:29 -0700 (PDT)
Received: from 96364762d92a.hsd1.ct.comcast.net ([73.100.172.13])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ff43b896sm7486106d6.25.2026.04.29.20.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 20:53:28 -0700 (PDT)
From: Dominique Belhachemi <domibel@debian.org>
To: Conor Dooley <conor@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cache: sifive_ccache: Add StarFive JH7110 SoC support
Date: Thu, 30 Apr 2026 03:52:59 +0000
Message-ID: <20260430035259.3402954-1-domibel@debian.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_205331_696738_026F52D6 
X-CRM114-Status: GOOD (  10.82  )
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

This cache controller is also used on the StarFive JH7110 SoC. It does
not have the data-uncorrectable ECC quirk that JH7100 has, so only
QUIRK_NONSTANDARD_CACHE_OPS is set.

Signed-off-by: Dominique Belhachemi <domibel@debian.org>
---
 drivers/cache/sifive_ccache.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index a86800b123b9..2acb8bdf06d5 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -124,6 +124,8 @@ static const struct of_device_id sifive_ccache_ids[] = {
 	{ .compatible = "sifive,fu740-c000-ccache" },
 	{ .compatible = "starfive,jh7100-ccache",
 	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS | QUIRK_BROKEN_DATA_UNCORR) },
+	{ .compatible = "starfive,jh7110-ccache",
+	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS) },
 	{ .compatible = "sifive,ccache0" },
 	{ /* end of table */ }
 };
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
