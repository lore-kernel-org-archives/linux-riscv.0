Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE02DC54E41
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 00:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fze7OEoRtfkX6EfeOn31upiiCf5As2LdNkKsgPfdgyg=; b=IEEKxaaFnKBcmP
	V5gQzFYSn9mnzu1slFSzSACg83mvIIhjU9kZLHMlBMdHHgcqkKaFq9W4nU3Dy6g1kXUYMh1GHhClZ
	e8pMBNyGZyLQ2+VPxT1s0CbOcepa+DTKWvbsqNOYxY79mX762BVFL+UYPEHrLwoCEX0EVDhDF2MkT
	K2dXfDTwu8pAllS27wMoYIaqSRiaGuCSlh/I1hysHg66Ivej8Ef6Ssqi/Lev52FGBzUQV84taIxhA
	FYqev6qHOME1tAAxeCJd55j8dxfoflO8/qzaeIk7oQzOpX7WGg0LTVXLoavfqsIR9JPFUIsB5GqAF
	kqcag+y11AkELJeZEnoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1relSd-0000000370S-3Xij;
	Tue, 27 Feb 2024 00:36:43 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1relSW-000000036xd-1lMy
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 00:36:38 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6e0f803d9dfso2532587b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 Feb 2024 16:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708994195; x=1709598995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xj3OP08z+QmSADpUch3bINy+udg5hxpgq6aJUETENlU=;
        b=ZcTRf0HFxsZbXWCp8OvncgveRrr9ne0/LSVYbOnryCGzflwG3WkLYzA1QncOReIpeR
         OHAfYBV4m1Izy5VuBg+5XhLmdPKnc44yL5jl2o/DvAPDrBV6Q+MISAHtAsP3HoEny4Sj
         RDZcdPjgLpcCWBYnvTtojpwYC7qYDjajNjUkM7GyhmjHRcOpi33lGrD2hVVdz2zL89nN
         CMvJ9cs/RXzn7DiYjqv9N+JXMPEjuHTfJo7g+40Ibs5+X0E231tJrjN7sfjQ7W7HXUZ7
         2doCtmFUz31sfJ0AuV2Ya7l7CikC4h2Hm5x6vgQEkTqGdaIaFCWaqcmHSA6mO6bYoDxq
         OtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708994195; x=1709598995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xj3OP08z+QmSADpUch3bINy+udg5hxpgq6aJUETENlU=;
        b=jvxFGGnMnGmEGuH8sZjX5buOo4AOsrJT3qJtXIYetDewo4WMoyo/e/Zdmne/aWnw/n
         OfG32s533qTM5RxOMzYKpUbmtploo+fVDNObm6uNPJ7WKhDRUvv7zXpPPw5yf+slxlXH
         DHjerjsU19KZsPXuZHB+NaCeMuI42R7vxWOLyyv0/o+OjcviKeC+5X0mh+A9WfcF4b23
         fZGIiposFbPWD3UhNWaLQgARuAkHQSwbaYjTVb9WEfB6ESgvH9ExWqyyysYkPOQcUuXC
         j+ViVNkLu+v6z4+ui72tCjz9jg4N+Un6soz1iPO+Ku46RNjlau/r7O2zyKs3bhz8q/Jg
         SVZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGJ/x6Wey6RiTtg0XHmyhQA2/Jsu/Aogig+nW88de698/pIZRsWWyKdoPDQDGPbvZlcXZtdOQX2q8ApDbbFA+H7ncv09UL1mjFQxpMSi1I
X-Gm-Message-State: AOJu0Yxm28AlX3t+zUgLloP491Z1Qhs+msFmOuqewsYJmZzSpzl1ILOp
	xxLd2ziJCLzI6YmcBT4OzFUlB5F6yWBnIenK0YMjROTbOM1mLgglLA1m7kx1fdg=
X-Google-Smtp-Source: AGHT+IFgPx9lY7vngIVEaxgfVmEppG2EU25f61Y7UcVq+5kUQ65nzj4A2GDggdH2jKZXiIDb84Cgkg==
X-Received: by 2002:a05:6a21:910c:b0:1a1:fb:7586 with SMTP id tn12-20020a056a21910c00b001a100fb7586mr944213pzb.57.1708994195402;
        Mon, 26 Feb 2024 16:36:35 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id z25-20020a631919000000b005dc85821c80sm4504117pgl.12.2024.02.26.16.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 16:36:35 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 2/4] riscv: Fix loading 64-bit NOMMU kernels past the start of RAM
Date: Mon, 26 Feb 2024 16:34:47 -0800
Message-ID: <20240227003630.3634533-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227003630.3634533-1-samuel.holland@sifive.com>
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_163636_479937_221CA5B5 
X-CRM114-Status: GOOD (  14.95  )
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

commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear
mapping") added logic to allow using RAM below the kernel load address.
However, this does not work for NOMMU, where PAGE_OFFSET is fixed to the
kernel load address. Since that range of memory corresponds to PFNs
below ARCH_PFN_OFFSET, mm initialization runs off the beginning of
mem_map and corrupts adjacent kernel memory. Fix this by restoring the
previous behavior for NOMMU kernels.

Fixes: 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear mapping")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/include/asm/page.h | 2 +-
 arch/riscv/mm/init.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 57e887bfa34c..94b3d6930fc3 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -89,7 +89,7 @@ typedef struct page *pgtable_t;
 #define PTE_FMT "%08lx"
 #endif
 
-#ifdef CONFIG_64BIT
+#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
 /*
  * We override this value as its generic definition uses __pa too early in
  * the boot process (before kernel_map.va_pa_offset is set).
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fa34cf55037b..0c00efc75643 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -232,7 +232,7 @@ static void __init setup_bootmem(void)
 	 * In 64-bit, any use of __va/__pa before this point is wrong as we
 	 * did not know the start of DRAM before.
 	 */
-	if (IS_ENABLED(CONFIG_64BIT))
+	if (IS_ENABLED(CONFIG_64BIT) && IS_ENABLED(CONFIG_MMU))
 		kernel_map.va_pa_offset = PAGE_OFFSET - phys_ram_base;
 
 	/*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
