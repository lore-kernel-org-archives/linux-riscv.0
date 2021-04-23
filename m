Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA6CC433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 06:01:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10A5B61404
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 06:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10A5B61404
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UoBshhVyDW7hsCXBBM0r2GGqztytYeg841a21b0LXp0=; b=Osdf7RfbECzruDlqV//5kUTX82
	PR8XzY9gnT7EDGtehLBNbHUeaWa0TC9bgMlQt4Yi+1Um3J9bbKrLvfdXDvGytd5Ara5yl+PRp6EKj
	mXjvgu2j2RgTtDSnYT8uypyKrLWdXHZLGPMMyPoOGa8/DhuJk+ies+lN9sqFuCxxdoCHaC6+gFWO8
	tnG1pLwbf+iQWxyGNmTR/AioMaVZjc6k18N0llYiQVlnrS2coMnsOJJgqKrAZgo213aMdrym+E10o
	khTHK2WAhD7BUBiJbHFlmrc+KNJTa0S0nh7J144jNGt69iJhR6DMR3wXpbQIdtzVfGroQfoPE21gG
	UkaMMS6A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZor0-000n3V-Kj; Fri, 23 Apr 2021 05:59:57 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoox-000mxN-C0
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 05:59:25 +0000
Received: by mail-pg1-x532.google.com with SMTP id t22so3019900pgu.0
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 22:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=mmA6Vp3R9Yzy8NAMi+3T3BUImkb39vxQ+mRKRyz+djU=;
 b=Nlqx/fH90FX0BbxBthrIddjCiNcBnP5j1oG0KIDMfLDn/Xi+haixH8grgjOrGwKbD6
 inKGNQNeHH/3gSrSN5wbidsKaQL2OTeekl5pqw64bpk38ReJy5gPcOKkTKrfeDNhD/Jd
 vcP0PVKbsijSSRpczj+l6CZdpMmxdBpt8xFIQywXdTl87BB0EIr8AfIVmZ+KC66ylzXa
 3m5XkiKSL/y8taGcKAjGR1DABZBqXX8L8SnMJxf6gs/s7rbglv+6HgLLGDhJJGMt1Ta1
 xTUjtYyqAr6sWFh7CWvhF1EbtmGWGLeydJ3uuAbrAcCX3h4MAooD0lvm1H9BSFA+MUg/
 jZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=mmA6Vp3R9Yzy8NAMi+3T3BUImkb39vxQ+mRKRyz+djU=;
 b=b8VESacfyKzKz3oTpmeyw5PhKThf7UckiqfTQeZVXPy9aCtZMir28CdPWaXQcLTWxM
 wp+VKd6laKa1daySgyJvLMi8IHgJ+h8qPVEo5atqYhLEuaJtyAQ+SJW93vvpfXuKBgzD
 gX6A1sQGHQcj4LTxMHAQmp/S0GkHqiI2t/aPQhinrwAezprC4AN0jHyfhSlcgKigrGJG
 uaig9yeBFk7WFJ/E8E8vuXEVuzHGc6h6O3rjyxQ9U3IGyrEUGDVjlWaOwRaH4dTztjpW
 BOMEp/lp6ofJHu2z2mULqWu/TeOBK2t+enY6Cd10wNfElyaajbH3g9Zui/WOh3jNM4PP
 Dmsg==
X-Gm-Message-State: AOAM532Lz7jHyowdRxqezSCmi4dwyzur4U7mHtrpuxHHGJ6DD9oAOKtg
 LspzZFiCCyNNvilaNede0d4jGKeLQf5LYqLv
X-Google-Smtp-Source: ABdhPJyGsJZhLU+QXGqeYV7J5jxgb/H86ZoIGXqKMsmwXFz3iiYUEyobiMzITH+Y4bWC0K7u+IcKpQ==
X-Received: by 2002:a65:4486:: with SMTP id l6mr2246741pgq.347.1619157365863; 
 Thu, 22 Apr 2021 22:56:05 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x83sm3544603pfc.219.2021.04.22.22.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:56:05 -0700 (PDT)
Subject: [PATCH] RISC-V: Don't build XIP kernels under allyesconfig
Date: Thu, 22 Apr 2021 22:55:51 -0700
Message-Id: <20210423055551.447922-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_065922_799908_04C9BF6F 
X-CRM114-Status: GOOD (  12.31  )
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

From: Palmer Dabbelt <palmerdabbelt@google.com>

We have a fixed memory layout for XIP kernels, which means we can't
support very large kernel images.  This is good enough for now, as XIP
users aren't likely to build huge kernels.  It does, however, mean that
allyesconfig breaks which is an issue.

This makes XIP depend on !COMPILE_TEST.  That's a bit of a hack, but
there are some other !COMPILE_TEST dependencies.  This will result in
build bots getting less coverage for XIP, but it's the best I could come
up with.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

---

I've squashed this into the XIP patch, which is on for-next.
---
 arch/riscv/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index eec1ede79609..66a03b38d12a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -508,9 +508,6 @@ config PHYS_RAM_BASE
 config XIP_KERNEL
 	bool "Kernel Execute-In-Place from ROM"
 	depends on MMU && SPARSEMEM
-	# This prevents XIP from being enabled by all{yes,mod}config, which
-	# fail to build since XIP doesn't support large kernels.
-	depends on !COMPILE_TEST
 	select PHYS_RAM_BASE_FIXED
 	help
 	  Execute-In-Place allows the kernel to run from non-volatile storage
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
