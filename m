Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4AFC02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V3xZZ2wpnqC6ULL9arAAs6zUmjwCjpzfyoRYCsirIkE=; b=Tj6NrmjJqnTjMt
	bd7wC9DdNA9YuOsOzkT2fIY9H4fNjD86TCS+5VdXGYuMi5lifuvoW3XAPCS5qvIdwxTXIFT6mwseh
	sTFPXMr1kfJx5p/8yhn3MVapF0dtfOjHN/cj5DH15IXBNpwOM0qGPZpjktXW40C2anewiLa0xUZFq
	kuRZ3/RzJ+nh6tk4f2Nbc3udIN8HBG3QrnkdcOVqjuxDZsWXSNu4FKhVWU2HOBC2Wf0jpDt7gtBQw
	/Y3urxCy4nih6cXsFv1AKGYS1x+jlit7hEajcrg4QaKePrt10/Fm1gDFw6vLWqOcvVqwjX9uyGE0I
	/sR+M0I6j3n4PMobr77Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgZT-00000003ZJ8-1vBm;
	Wed, 05 Feb 2025 14:40:07 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgYY-00000003Z7v-0Gmt
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 14:39:11 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 79E9A3F2BD
	for <linux-riscv@lists.infradead.org>; Wed,  5 Feb 2025 14:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738766347;
	bh=Dme+YavE3h7VKwtVCWsFypxmxtFZq863WhJD/6LnYDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=GhXHX9pE+4J37FUAXH9VWjgMB22PXxqP3qviMwYTTcSU9qqI8sV0SHVb/vUlX++SH
	 NcsKeEryLoCre0X1xwYhfNl5IkrpPm8/k2XCymO5bytC5XrVSUtl3cncuP+zqDmtVo
	 QEkKFGCwVwW1prlY00Te9LMZx0DwaBFAufX1UCTELKq1h9YrEptXKhsf9Q7iD4E3n/
	 cS0/mP84mDzkf3x4LqWW90IkgTFjiUggjciVNplp1njbzlRGA9dDjevKgV0w2yJl0C
	 IAzrPYjhEWe6FpS0mpWmzyBs75TJMBxp1plfMRkocfxip0VgBcUmU4a1YxOk3YEh01
	 5qaQ7N206gKWQ==
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d3f01eeef8so5739306a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 06:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738766346; x=1739371146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dme+YavE3h7VKwtVCWsFypxmxtFZq863WhJD/6LnYDU=;
        b=cXJF6CIeg56+KS92pqETpTIArc67TAE2DMjtsFtpvfql7GdCfd9Ded48jBO2NfN2Mx
         8Rbut1LTnG/dVslMCPJgH0jn7P9+EN0TTcxAEzsjuuCxzSmedo0+7Im0KIp/zrpZV7TN
         NvwJ3sFxG+i4hCJB30sdqLFlQJRLTwxLBKSxbCB2+NbsgYec0fkc37904r6pK8VU3Bfx
         SRIZoyVQdZoEi44CXQZZoT53iJmHxbiX0gOoL5LXggNl29tGWCWQ6mSKHKacbHIhgkxU
         z9jh/mNwxh8vsEpzGF4Z8iK72rJITuYODNhH2yaqD56dJySnvD/zGmhpXIFiY5QtIU0p
         z/wg==
X-Gm-Message-State: AOJu0Ywm4Cwk2yC/bFHggECwbCCvo6hJ8W14TkPb953ff+GN0Y2ZXzr2
	Sgp1mjMXKIYnLHjrHz/ytixQaB65pKGZV1dVYugHmeVnd3+bKwbniWeQWTjxOphCmUqygKCrulI
	AEDvq/+KO81ru8fQGUWp4vAc4pHnhLgrTJPBTug7uft1R7u2INPSpbW/XMkbHD0bf2sTDN0OP5y
	zt7CUnHUvZ4NwLhA==
X-Gm-Gg: ASbGncu+uXkhEl3dpkbmGG2KipUkDJzeU8WObSlOIeZ3kmtCHEAQjiIsBmey0cZyQpy
	IFXd2ptykWOOkSiCm/WDmbyMPbvZwcE4vYxZZ3i5guG6PyG72bwYcoWhnZojz2mHX7u0UjSQR7X
	4D41uv3friv++OILLwH/4d6lgNRzM0oQO+SnD4xlF4Tx97yWkzM7512KNwHjE3d4paxNDAB0hd+
	lw9ajHjWTQBQKjSh/+cyATEKDiKAQt2P7VZSUd/7sqn91pdqRxkXGzdJO27AR0dIucRbE/38OWq
	wfcQZrcK8g0SIModU5U=
X-Received: by 2002:a05:6402:3506:b0:5d0:cfad:f71 with SMTP id 4fb4d7f45d1cf-5dcdb775fbamr7771722a12.32.1738766346346;
        Wed, 05 Feb 2025 06:39:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF70Az63p7FGVorzWY2EiBTjmxe7ybh3PoNumytu8JuoGgxV7u2ogC9A7h+McO4xrKdNx++6w==
X-Received: by 2002:a05:6402:3506:b0:5d0:cfad:f71 with SMTP id 4fb4d7f45d1cf-5dcdb775fbamr7771650a12.32.1738766345763;
        Wed, 05 Feb 2025 06:39:05 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:6754:ef46:cf8c:ad7b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab71166a8e0sm748209766b.158.2025.02.05.06.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:39:05 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v1] riscv: Use of_property_present() to test for non-boolean properties
Date: Wed,  5 Feb 2025 15:39:01 +0100
Message-ID: <20250205143903.413959-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_063910_365530_5EB2FED6 
X-CRM114-Status: GOOD (  11.15  )
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
Cc: Steffen Persvold <spersvold@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Jeremy Linton <jeremy.linton@arm.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Yunhui Cui <cuiyunhui@bytedance.com>, Sudeep Holla <sudeep.holla@arm.com>, =?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The use of of_property_read_bool() for non-boolean properties is
deprecated and since

commit c141ecc3cecd ("of: Warn when of_property_read_bool() is used on non-boolean properties")

a warning is displayed when used incorrectly. Fix it by switching to
of_property_present() as recommended in the same commit.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/kernel/cacheinfo.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 2d40736fc37c..26b085dbdd07 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -108,11 +108,11 @@ int populate_cache_leaves(unsigned int cpu)
 	if (!np)
 		return -ENOENT;
 
-	if (of_property_read_bool(np, "cache-size"))
+	if (of_property_present(np, "cache-size"))
 		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
-	if (of_property_read_bool(np, "i-cache-size"))
+	if (of_property_present(np, "i-cache-size"))
 		ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
-	if (of_property_read_bool(np, "d-cache-size"))
+	if (of_property_present(np, "d-cache-size"))
 		ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
 
 	prev = np;
@@ -125,11 +125,11 @@ int populate_cache_leaves(unsigned int cpu)
 			break;
 		if (level <= levels)
 			break;
-		if (of_property_read_bool(np, "cache-size"))
+		if (of_property_present(np, "cache-size"))
 			ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
-		if (of_property_read_bool(np, "i-cache-size"))
+		if (of_property_present(np, "i-cache-size"))
 			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
-		if (of_property_read_bool(np, "d-cache-size"))
+		if (of_property_present(np, "d-cache-size"))
 			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
 		levels = level;
 	}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
