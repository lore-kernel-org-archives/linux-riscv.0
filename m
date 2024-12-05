Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7A0E77170
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5EaP7/K1wkDb6/G48sRR+TuuxTYmjZzHE3x3TeAPK4=; b=EfG9VpDwC4++7a
	I2iWg7gGiLtHfHFzLG+TNG1KOUovgl7sxhqagopJbw3PQbqBwq3s5FFd07aDb4w02uQWTLSduCpMG
	WZ9i6c/uqwNVHA1qgnYabjpsM6f0wZ+h46WVgfn+Ncw4GWt+FLnjmBcyQk4lnQmdlCsJyCdHFrLM8
	9fexQRERJh13nQsV08HO823FDC4gavz5a53zLIJ+4EY4WQSHU/fnz5CUw18tExb0THb+v1PdFSmYm
	ZfV/8tbo0ycAaftm6dUKH0KdcbSPKmf2ferOzj+S5AhOW3AnwPbojlU0bZ6Gn6m97HifOYuBaw5PF
	Buy7SiFuVRbmJk/t2p8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9M1-0000000Fagq-3n8g;
	Thu, 05 Dec 2024 10:45:05 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9G0-0000000FYPq-3tU9
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:38:54 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7fcc00285a9so834647a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395132; x=1733999932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fWC9OQ8fDv8IwsAqd/wbk191tCVh4tSTxqplFbmaYk=;
        b=CKN0SMZ7Kx78PrJw1bMMomfDIPq0CqjvdYbzF289ETyDLd2I8NFUHjYlGztX2X1o7R
         SUSDxm4VVkbvswhuR9TtRH+DVU9Vo2B0ZGqFzNNZX3VSbo+7ijhaIWfcbThFxmRztbLd
         Wyw09zJ6BaHGItBgIhF1iwL9rvxQfXmYpS5o2rUWBc/IcfiLZxwqYX14pl1CNEkBs9kU
         2RypXiCuiy/taRZFS4Kr1C5OobGuoIevgppG5uhA9C/AICF6STNGy4JNBD0M9VKmBYF4
         g6Xlsmf9jUTjcvwkTUcatQEAfDE6b6+TfZNu5b3Gd0x/5Fpg28dfmt2NUw5L/RWXFAHN
         UlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395132; x=1733999932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fWC9OQ8fDv8IwsAqd/wbk191tCVh4tSTxqplFbmaYk=;
        b=IRWq62m1ue5Xl1dv35IGcIAdvnHexZENi17wcbEHckidOwwJeYG/l5sQxsa7k4HRek
         7yLxiIOjkd5/sBeK8qsMT5vlX+NOYbd+676SKXXpwEkydTefMJ7HvXmCfmYWsbY1gpxM
         Thq0KkmGr4/RuuJwhp2GmBDTyTHKOW7K23BGelIYCLYy9Qg9DnlW+8PiDVHqp9AZsSd8
         V1fXCNXNZCNIh3WQ+j01LVuaWm6jfFjWeHGWN6dXjwsWDX33Qzq88yoNfxKMFRr2pb5v
         +uHTUH+wbE+7uLooVRz9becO1qBza4xtSZBWX8B2y9bhSBguwy10J+6lNLndAfPh7HJh
         GcqA==
X-Forwarded-Encrypted: i=1; AJvYcCWLZgxdXhPFja0OUF72JqrsXScN2DJyhPcOTAVJrbvzl2RhXHYh24QXIYOx1HxBPfAHS1T4ZP+QHEJBwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwH/nGDA0U+Xqil8gy0NED/ngWxtg+D0O/Dz9JFCs7VdvaDIQJL
	GFawmvdxj3jfP7//aJnLCogqsMGy1arFYcTpcFraWnt8HuITWyCn2hddrFg+dic=
X-Gm-Gg: ASbGncviorIeTn13XuAkJw7IiKKNnB2srOz50V1ahjuwnqWKZpYGwiFrkrb2wiwiY5w
	PxgTLuhohyr5/qI2ai3MhsPtUpV5GErQ0gy1bVmV1eP2QODfmiIdlcWHZFccCDs4s6RI+9egX3x
	+wPVuWkKQxyDOC2vxyrw+eOu52ZFOnse/+7sKHHwfOm/6ziKg3h7FZO/VCXbikatQ729HK008Jl
	PbO1NB6Q+qJrLaU0RdH0sm3v54RymTAe0fYqyQP+yJ1qT9L0E/JhtYMk6XdYP78JVke/XSTqWq8
	hTnALF3yegFOjRLcQ5tj2vP4Vs7/nD0g
X-Google-Smtp-Source: AGHT+IEXD1d9VHmdEfHzDn4iIzGpKroyoIRBm9V8GpOCRUVEQI3tEWlF/wbQq82AYL+CFEewTt8KjA==
X-Received: by 2002:a05:6a20:7350:b0:1db:ff9d:1560 with SMTP id adf61e73a8af0-1e1653bb992mr16055868637.18.1733395132079;
        Thu, 05 Dec 2024 02:38:52 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.38.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:38:51 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 18/21] riscv: Kconfig: Introduce 64K page size
Date: Thu,  5 Dec 2024 18:37:26 +0800
Message-Id: <20241205103729.14798-19-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023852_965711_3B0B365A 
X-CRM114-Status: UNSURE (   8.10  )
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

This patch introduces new config to control whether enabling the 64K
base page feature on RISC-V.

The 64K config will set software page size as 64K and automatically use
svnapot to accelerate basic page mapping.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/Kconfig | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 2c0cb175a92a..592eb5766029 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -167,7 +167,6 @@ config RISCV
 	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
 	select HAVE_MOVE_PMD
 	select HAVE_MOVE_PUD
-	select HAVE_PAGE_SIZE_4KB
 	select HAVE_PCI
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
@@ -885,6 +884,28 @@ config RISCV_BOOT_SPINWAIT
 
 	  If unsure what to do here, say N.
 
+choice
+	prompt "Page size"
+	default RISCV_4K_PAGES
+	help
+	  Page size (translation granule) configuration.
+
+config RISCV_4K_PAGES
+	bool "4KB"
+	select HAVE_PAGE_SIZE_4KB
+	help
+	  This feature enables 4KB pages support.
+
+config RISCV_64K_PAGES
+	bool "64KB"
+	depends on RISCV_ISA_SVNAPOT && 64BIT
+	select HAVE_PAGE_SIZE_64KB
+	select RISCV_USE_SW_PAGE
+	help
+	  This feature enables 64KB pages support.
+
+endchoice
+
 config ARCH_SUPPORTS_KEXEC
 	def_bool y
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
