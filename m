Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34E5C61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 18:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Va53vADhg4yK7APcji0Mi+1WyFZTMv1tYA+ZQWnBnkM=; b=t0GZzCAooISuVF
	EhsvKs7DOt/Lh009OD/WjnuhRjcELwRcdYspdvKWPtE4cfL1+7QttT1sbGlowFEh67pBfXwENd6Lb
	cuKsiLOQ2ygZG5UIkIJ5W9gwRWwkvI/+r7sm8ZRDZHkkL3pFSmQ1YZPuCvxjh0Bsn4R/DCLdgDlfz
	WdNdqtity3BKt2a5MFXnP7KE8RgTJTsKfb36Mm64/bkXtXpZGoYi15KeaMDW/xJCEvgd5x5/Pp/U4
	ZqJBA5jvaS9eSBlyBVe7ejYrlUiCyKIREBIWMJDNuNqrcwiPjeOCvyiQifPQNhNXBBrvWt+2rJGhr
	T0QZsAJabm0CMd5SeJ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXoO-009Rp6-Ni; Tue, 21 Feb 2023 18:56:24 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUXoE-009Rk5-R1
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 18:56:16 +0000
Received: by mail-ed1-x52b.google.com with SMTP id s26so21200633edw.11
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 10:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Og71LrObtS1yzwYX+O+5Em/eKqR41zpeBRkbhQ6w52o=;
        b=W6MErgKHnuE8h7IGs7wNeQckwxXI576Tb/Vt5AvTGKM4cq4Fkvv9rDS+na30CQihtR
         qutKJAdZsMqBqLur75TB0v0AinL92nZmfTK3Qt3F2QzzVKE1w5WswVgFGSiiTltfro6H
         fh2y8VOHiacSTWYEqe0ikmTz8xxSWuo1/vgAhoQBPqHhPV1Npdh8ZKpiEz/iqOngC9Fs
         Ucv+t1XK/AZQjB/HJh6CvYZwZLwqKC/6UtkFo1cIJEMmKWe21zucDudRjKXJ5LGX/Tmo
         rivLY68MgdKv/q35XiGPneqbDGBsF0q17T1XD6DROEl8CbXDLfJDOzKnpsVyiUwAzIZA
         CfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og71LrObtS1yzwYX+O+5Em/eKqR41zpeBRkbhQ6w52o=;
        b=SP+AcPuu9WnXetxn7fwKBqeLheeIwfiohkPWsLb1LCDHIohsvqi05lRUd7u9X3Dnxk
         tCTtkumgGGrxiO1n9hm9ozwd8eyjcRkOnWSvm0VLw1zDMHbwt9AnCFBOCTsyZTzWcsvW
         mMNEmSi2goDcjxkYhunzYrCSG1kVnDOSe5B5pAyHlA498gw6S9BOvr4CTJJJSshIyG5F
         L6YCAW8ZlBncxNJsZTvV7yGH9ZQUsE+WpPqmpw0RcgWakxAwSzZ9Lq9zceMLg25O1gkD
         YaN7LwTq/c6PFG+9E+zVNMESLWlTqF4j5fL+x1BzCINya9TjWrqYxX3sU85z42lGhVHd
         vGBQ==
X-Gm-Message-State: AO0yUKXNoCmhWpMva3k0LXprY5wtY6czsicXwbGXurf5Ryw/GDiBdUyx
	JxXS4IhuLvjtA/FVvcUiO1C2YQ7ZMo+bxmqx
X-Google-Smtp-Source: AK7set/hem1TXFBAOSy26MAb4biaHcfCsIvQ6Z8aJqX5iKI32GX26xwOZZqB5UlAdxpMA/+SoWw5Sg==
X-Received: by 2002:a17:906:518:b0:8b1:3554:25 with SMTP id j24-20020a170906051800b008b135540025mr12596275eja.61.1677005772489;
        Tue, 21 Feb 2023 10:56:12 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id um17-20020a170907cb1100b008e076ae6783sm981564ejc.14.2023.02.21.10.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:56:12 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: 'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: [PATCH 5/5] riscv: cpufeature: Drop unused includes
Date: Tue, 21 Feb 2023 19:56:03 +0100
Message-Id: <20230221185603.570882-6-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221185603.570882-1-ajones@ventanamicro.com>
References: <20230221185603.570882-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_105614_897611_E7354701 
X-CRM114-Status: UNSURE (   7.05  )
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

Do some additional include pruning while dropping errata_list.h,
which is getting dropped, since cpufeature.c includes hwcap.h
directly to get cpufeature IDs.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/cpufeature.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 85c99ae64017..151e1a715db9 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -8,19 +8,14 @@
 
 #include <linux/bitmap.h>
 #include <linux/ctype.h>
-#include <linux/libfdt.h>
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
-#include <asm/errata_list.h>
 #include <asm/hwcap.h>
 #include <asm/patch.h>
-#include <asm/pgtable.h>
 #include <asm/processor.h>
-#include <asm/smp.h>
-#include <asm/switch_to.h>
 
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
 
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
