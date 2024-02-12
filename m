Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21175C4829B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 02:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJ2PeWnyTz+DZHm4dRJzYjn8aLgUcK3WhWvsNMo+Yls=; b=Dy4vRflb3FFXBo
	eDq/mYPrNhFSwBrvPz4NE7mECG0AQYZQjysQmM9o54pi/ANgqvVP45dY0siTQ9MsquODUsdtdznIb
	GOTLLEY3ZyPsMxF0cr6K3GE6XmR5YdCRBnyCKXxkf8GpDJ2QtdZDHz6BpN3IpwAFg8UaU9Rj6NVPu
	4izKsnVIKdyKw2ceyYyjDI9/ikFfzatd8JMEVnbNydyUgQ+Hhw8bJvHyuRGVDyAyCtyioXaADYJ2r
	42rLq4IyMl5DPtzlLUi2Yvohf4Dqrk+Qe2didc+YMZnOJ2F0IvPMuE3G02w54R5DRiD9RvFC0OvUf
	Sjc+1lUAqCL7pigYlEQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZMTv-00000004DE2-0Y8m;
	Mon, 12 Feb 2024 02:55:43 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZMTp-00000004DAf-3K3f
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 02:55:39 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-785d5e6c87cso46978685a.2
        for <linux-riscv@lists.infradead.org>; Sun, 11 Feb 2024 18:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1707706536; x=1708311336; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PK2hM2nZE9ySNRKSB/nk6SwrsE+3tTyo2UQmA0OZOPw=;
        b=R2di8YpuNLjmiPghwPJl0CAwQiNzeJlVC747DnAw5BRooGxRhJO/DUWdbkDs3H3IT+
         j1UY8LqL8yFHv1i92JPG1u7QD3oNj2i/al5mgQAnI7NluKDqLgOlVpeYQ1L+7++SQZNR
         eKSSRHFEYYBJNj8tuDGj3OEYz4pBtmlvRciLPL9yzF7EkgUEFX7wTLDLbIiSHEp5NBZ6
         YAotrHZDQpjUvs1bUvUZ77r459F6Pk+QIvPx32xM+JzEDUsUbfVRR+fsUiPzntnS0L/U
         UDenfkXfWpbPvgjcFWLxxb8Dhp1ZG/z1MJVJ86eff6B5xCa7pzP4uh78fXWzphnOD80T
         nLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707706536; x=1708311336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PK2hM2nZE9ySNRKSB/nk6SwrsE+3tTyo2UQmA0OZOPw=;
        b=oEOc4NZ2rVN37+Mp6vEvx/M/Bu0wGlaYhMHuw4caRqxL/4ToczeoDGh6WQ3ePIhKLi
         p376N0T6/12CfzjtNCEytyI5b5RyqNfx67Fs4K0EzHvFYu+DFV+wMnmBUGX7gfb6Pv1m
         vuSOuMXD16trAAJ2Vo+12k4B3JC72cyyYUkwg73TgIfn0jYCitjSU/bmVGfVMpeN1mct
         cLT4/1d2ivftQju9QYz9iys25ReNOkb4HnEyfE5YH4SjjBwhwpYicpUOOj8sOc/LKOcU
         h1Qlo7k3YRnhavMFLN+UxDCiitO4TX/YTLLSll3L/kzRvw7iFqBFO6OIZV2HAhsziQFp
         S/Tg==
X-Gm-Message-State: AOJu0Yxmk800ibWT00Ru5nfMB1u2H1ugdyr9H/I6U6Tvp3UR9qiWYSXT
	1GIRoTTaqTf+b5uyTVV9+7eb1QN/HX1g6oprWrnZdRo+X8IGgIzxfIkBSvaUhlI=
X-Google-Smtp-Source: AGHT+IEJZiiN+n5FqhSyHOC/KRPz1kIg5v3LNtLiqUhxBX3/4QKShWOHHV0lSJwdo/2+wfJXwKlCGQ==
X-Received: by 2002:a05:620a:4492:b0:785:afa3:6c0b with SMTP id x18-20020a05620a449200b00785afa36c0bmr8529739qkp.52.1707706536469;
        Sun, 11 Feb 2024 18:55:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+KlvTiXx022Iyrq5kcQK+MzTTlcaxsSbYU2t+6MhI5RpPjrlocOnjYKK/WCv3H83/9SWx7WX/BFI+bbrFB0A4cr9omAmYvnt7rtoYc7xaGrWDlBZz5xD632qkgPpJq6IWM1seYeIr
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id lb3-20020a170902fa4300b001d9af77893esm4906443plb.58.2024.02.11.18.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 18:55:36 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 6/7] riscv: Use offset_in_page() in text patching functions
Date: Sun, 11 Feb 2024 18:55:17 -0800
Message-ID: <20240212025529.1971876-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212025529.1971876-1-samuel.holland@sifive.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240211_185537_853199_02484BFE 
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

This is a bit easier to parse than the equivalent bit manipulation.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/patch.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 9aa0050225c0..b0cf050738aa 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -54,7 +54,7 @@ static __always_inline void *patch_map(void *addr, const unsigned int fixmap)
 	BUG_ON(!page);
 
 	return (void *)set_fixmap_offset(fixmap, page_to_phys(page) +
-					 (uintaddr & ~PAGE_MASK));
+					 offset_in_page(addr));
 }
 
 static void patch_unmap(int fixmap)
@@ -65,8 +65,8 @@ NOKPROBE_SYMBOL(patch_unmap);
 
 static int __patch_insn_set(void *addr, u8 c, size_t len)
 {
+	bool across_pages = (offset_in_page(addr) + len) > PAGE_SIZE;
 	void *waddr = addr;
-	bool across_pages = (((uintptr_t)addr & ~PAGE_MASK) + len) > PAGE_SIZE;
 
 	/*
 	 * Only two pages can be mapped at a time for writing.
@@ -98,8 +98,8 @@ NOKPROBE_SYMBOL(__patch_insn_set);
 
 static int __patch_insn_write(void *addr, const void *insn, size_t len)
 {
+	bool across_pages = (offset_in_page(addr) + len) > PAGE_SIZE;
 	void *waddr = addr;
-	bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
 	int ret;
 
 	/*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
