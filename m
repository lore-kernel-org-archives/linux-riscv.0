Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4AAC61D85
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 06:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aUje3nUZ37HZW4ANa5XtRkxG4tR5OzZLztv+6bP+hzg=; b=iPONH0fKOFtGUY
	DiddjE5xAGjWpPfL14Vt8OQj/rwuHprcJDeGqyWzPYG8CiEjp5ufzTlK/8/VLEw+gLFnmMgEeluDR
	G0esi5SaXKb0aGhrKKEROfU7ERO0fLbwhjJDxU0AAa5NMdEwKiA8rrsruGYJNIOT6Syfkg9HeMeqa
	+NYP+s2crzgHHQ9cqhcvpRafNYBONueqNMZyXZuL+5lHUAtkG6J1YRQpUQC5bEN6pdeN7zVY90Bd+
	LdvIRyysvJrV91Ujn2qRpfJ16UBBw6ZCEigyZ2Qmei5MO7bml+zwXx9FnBvTwdKClkWri8QK8b4Wk
	X6LcwAbW7nZkdaCWbzFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r63ed-003xFw-22;
	Thu, 23 Nov 2023 06:57:39 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r63eb-003xEi-2P
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 06:57:39 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6cd1918afb2so354595a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 22:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700722656; x=1701327456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1SlIwZQZIPlzGLzwkEo+aJE2Wdd8/z5GIv+0pytAfk=;
        b=N8zum1ZX+DVCojnEsZnzOm+63fnAyJEqWCbYN1urRo1bQG1E2a8ikuBSNyx2OB3o2/
         fzYhGwG60oBLvE1/4uELczuvYi7nDpEM5veXbRp6GV4XfSn1fY1RWGnm+WV1hjsST8sf
         a5K3xkNOYLl2ocX4lS5e0FUOGIhp7sWaBzkUfQv1RhKE0UaRdmYfLXC+VpRUF84HcZwS
         ObzP80RE6juDb4ZRjIHpXXWJW6EoZ+oI2iPwcmgh0K/amXCvYOTL/IgSAhDzerxGvZcr
         Hq4FM4KHDpPSjb0W9iGgvj3dMCdwzLyoGi+8SYz//4TGPF2Y+yI003oEnfWRWwDSK/nc
         iZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700722656; x=1701327456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1SlIwZQZIPlzGLzwkEo+aJE2Wdd8/z5GIv+0pytAfk=;
        b=vBkkkszEPdaWW8LbSNSE2FXbGY6lVgNxlqodaRgtTi2ZNFXR80BSzLBeuCqXZmtFwr
         FAHEkMac2SkNFe8h8mlcWOx2liM4kl1RYJZZ85aTh2EweP30koy9izyjN7zxgJdK8W3n
         e7mUyZghfIb5zgnyvmTZwty7sEBTmA95WWU2bx0Cfvea2BJRvibRH+cY37ot2C7YfRz8
         D6+V7iPN/qCztpMnI6f8Oo6TILzSZSSN273OnYTssRra1LG+NlQKxDhhVRmVjaGTLKsn
         m5P1C//LyKEETfMZFlrGXkg9taMY5kB3DrPvetHuRRHSOiVcd8Xb7K28do9wA9/L2948
         JpGA==
X-Gm-Message-State: AOJu0Ywi2kCK9jleQbuuIKDE+4Zx3GhsPW0LQXJ4+bdooSBdLjb6ZvF6
	bSjvg9ycW9r4tKF14VpBqWlFxw==
X-Google-Smtp-Source: AGHT+IEzA3h3BSIYMfAOV+OKk+4/Lh1uORa+ogLGTQQeOgfArkr2f4ATFwv21Gu8GGvcH6ELupclgg==
X-Received: by 2002:a9d:6481:0:b0:6d7:f02f:dcc3 with SMTP id g1-20020a9d6481000000b006d7f02fdcc3mr3690469otl.28.1700722656378;
        Wed, 22 Nov 2023 22:57:36 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id w37-20020a634765000000b005bd2b3a03eesm615437pgk.6.2023.11.22.22.57.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 22:57:35 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	songmuchun@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH V1 02/11] riscv: Introduce concept of hardware base page
Date: Thu, 23 Nov 2023 14:56:59 +0800
Message-Id: <20231123065708.91345-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231123065708.91345-1-luxu.kernel@bytedance.com>
References: <20231123065708.91345-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_225737_804733_0B09B442 
X-CRM114-Status: GOOD (  10.73  )
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

The key idea to implement larger base page based on MMU that only
supports 4K page is to decouple the MMU page from the software page in
view of kernel mm. In contrary to software page, we denote the MMU page
as hardware page.

To decouple these two kinds of pages, we should manage, allocate and map
memory at a granularity of software page, which is exactly what existing
mm code does. The page table operations, however, should configure page
table entries at a granularity of hardware page, which is the
responsibility of arch code.

This commit introduces the concept of hardware base page for RISCV.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/Kconfig            | 8 ++++++++
 arch/riscv/include/asm/page.h | 6 +++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a..105cbb3ca797 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -221,6 +221,14 @@ config PAGE_OFFSET
 	default 0x80000000 if !MMU
 	default 0xff60000000000000 if 64BIT
 
+config RISCV_HW_PAGE_SHIFT
+	int
+	default 12
+
+config RISCV_PAGE_SHIFT
+	int
+	default 12
+
 config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN_GENERIC
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 57e887bfa34c..a8c59d80683c 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -12,7 +12,11 @@
 #include <linux/pfn.h>
 #include <linux/const.h>
 
-#define PAGE_SHIFT	(12)
+#define HW_PAGE_SHIFT	CONFIG_RISCV_HW_PAGE_SHIFT
+#define HW_PAGE_SIZE	(_AC(1, UL) << HW_PAGE_SHIFT)
+#define HW_PAGE_MASK	(~(HW_PAGE_SIZE - 1))
+
+#define PAGE_SHIFT	CONFIG_RISCV_PAGE_SHIFT
 #define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
 #define PAGE_MASK	(~(PAGE_SIZE - 1))
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
