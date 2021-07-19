Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F97C07E9B
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 20:54:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFECB60FE7
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 20:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFECB60FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sXoGAsvnrBmwpx3X2FpN/HPX2783mMkdx5mHy47VLJo=; b=TlT2bhoIY53PjY
	Ouy2fhvlQG20i71jIg0bsdve+v8oaZMCU1C9V2FQ4Xt2nrB4bMc4xpH46mdid7p/dX9VJG4fpM+DW
	Ll6ljUKmJyNycMgQ3nDF3wZ1YsJLkLxjhVtwSKaiEjG5wXH4fb0+1OTFvgUSEVD8U5IZKuRuMqJ7b
	0SpZW82n1I+PvqmeDfn21ik+G/ozvVp/AJy0+Evh9swgw2Msbu9vLN1J7tTKxAasrNcTNFpNYvam3
	CD5JZDwe083iFR1wk9CnE4xv9HIB/XwsSfEbDfSSf0ktbKS9S6Zpv4MMwr9UZRnU2Pg1VoyqNY8CT
	T5uWtYX+U0qE1lXObA1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5aH9-00BK6t-7o; Mon, 19 Jul 2021 20:54:07 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5aGm-00BJtP-WA
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 20:53:49 +0000
Received: by mail-pl1-x62b.google.com with SMTP id j3so10293329plx.7
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 13:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=To1VQqsP4sYw5X8oyJk6rrmdug4zweFow7cNnsopET8=;
 b=lNhr3LLsTXM94akRp7828XzwiOuQP2milj8pr2RBpTxaUvyzeufKtaQ/h9x0p86sdN
 pInK5Dm4srswz8AdqpSbpE9Lw2qXDCRUiohBhEwasrrKcH91kJwqs9cTDr9cJMd0rx7y
 uNw3hkOgcXQf0jv7NbyMqiOC07gGytUdKu7f89pA7DBdfd4HfWoqFy1oFQQDEy2nO4O/
 tewVEVrU64igwQ8mHRlmS6R6EUVJvUG0RxCG4ZCBi0JwTJH6thjIzZ1kHauYwMzGqu6Q
 CRKhbqRoIIwQPXIhn6CK2dQRI12jugEXmxijM1oDlRMkaS9t7lDSA3KQvwu2m9yOTX1X
 Htmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=To1VQqsP4sYw5X8oyJk6rrmdug4zweFow7cNnsopET8=;
 b=WW3TTQQqgCUgJxZx2GBebO/0aM/hPuu8Fk8+tOsXC/IGly0BbFdv4/+KpDzzKIOJjQ
 B6ST470sxC/O9n4fjfghALT3FfGUHIQohVm2SL/Ox1cxxlzQrBam3bGiSXvwiSWAf/1e
 +OyyQcMZgBt3ucnQbyhIKZhZ9yCVanwwv4j/M4DGXmLmCnL/rqM+28DmD+KjoQGPSX0L
 XE31p4nwDGhkA6KFazZYSgVsLVG/lMQp1OGocP23Lyiv3wJ6KOeQHvnfil2uO5rg72XM
 dQWtg2Y42xtPoRV1CHVny8UTl+fIjJYa2b0FAJuHhFNvKq0Z9uZtSdPce+uZJIfHP5jZ
 WETA==
X-Gm-Message-State: AOAM532k8Pp0GsPsSRVe9u0L//leKH05Ufks9ssdT55wj13P3Lah3mmR
 StTPSbpEKNkd6EoDqJPmnPM=
X-Google-Smtp-Source: ABdhPJxRMPZhp2P72BQeVsPGUhsFeDBZVSS9XpUyU0dz4JLNXJzYQCGypGRLuzOVdjcnLtDvENw4SQ==
X-Received: by 2002:a17:90a:8c93:: with SMTP id
 b19mr13591410pjo.107.1626728022956; 
 Mon, 19 Jul 2021 13:53:42 -0700 (PDT)
Received: from localhost.localdomain ([2604:a880:1:20::1f:7001])
 by smtp.gmail.com with ESMTPSA id x3sm397267pjq.6.2021.07.19.13.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 13:53:42 -0700 (PDT)
From: Wende Tan <twd2.me@gmail.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: Wende Tan <twd2.me@gmail.com>,
	clang-built-linux@googlegroups.com
Subject: [PATCH 3/3] RISC-V: build: Allow LTO to be selected
Date: Mon, 19 Jul 2021 20:53:39 +0000
Message-Id: <20210719205339.1023572-1-twd2.me@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_135345_086375_33D2122E 
X-CRM114-Status: UNSURE (   7.60  )
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

Signed-off-by: Wende Tan <twd2.me@gmail.com>
---
 arch/riscv/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8fcceb8eda07..b593e5031c79 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -34,6 +34,8 @@ config RISCV
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
+	select ARCH_SUPPORTS_LTO_CLANG
+	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_USE_MEMTEST
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
