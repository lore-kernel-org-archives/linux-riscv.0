Return-Path: <SRS0=x9rf=L6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF18C07E96
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jul 2021 16:27:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F1AD619D4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jul 2021 16:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F1AD619D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hmv9iHhLEN6q6DknWLMbZoRkDTJh50tBW+BxYFvyGvU=; b=0YZkHaQJNQQbRB
	+6FvAYSaFgVyTVvRvkMhcnNyShexEq37RT1Cng4BN5dhw/0JkwC7eASxw7Egx3TeEc6lYDu7sPR1p
	4/PBOIaik6lHZ4Xc2a7W8DUffL8DF4gG6ieRZES57BomfeBRdTB4IgKOBJB7+A7N7GKE7U+5zz7CE
	VtSFqhd/fkgek0sT3/YKx0dG60tM2JzeNb35/Q3eYqrr4+7YRi1I/8GYq/b0U2aqMSmORDXAJlwSK
	mhdlFyBEG9i/dXD8JUdQQc5CvDsDMRyyTexKOgLeuj9/7rg9MSW8DilPcjVu+vpDT5jHumYFawsfP
	MR7iaW+Xf6SeATG/JkpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0nu9-00CGTx-F6; Tue, 06 Jul 2021 16:26:37 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0nty-00CGTL-CX
 for linux-riscv@lists.infradead.org; Tue, 06 Jul 2021 16:26:27 +0000
Received: by mail-oi1-x234.google.com with SMTP id l21so4224591oig.3
 for <linux-riscv@lists.infradead.org>; Tue, 06 Jul 2021 09:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xNz5hC6gd0RICEGuO8Kja9lfPwHmN+gkPzAwiuNbxcM=;
 b=ZbiaI59teQehGCROuzgxise6D+/ebTp3pHt/2fmm8meseWDiuHBtMb2mFp22SaWCk+
 8Vi3h2u/6cDhasQQk5g/XRBi7a5xNAisj1g+ULwR3lQXwk2f/XXZKAzcyPjYrOeyL8UB
 FjazDuWnZkVDvZt8Y0KUTGNmFXGf2G16vpTFM9Ebz6cUVeO+eKQk/D4neDL1MvCzLLku
 8/qJvq1qEwEKUwcS2k06UjPD4a2+BvNsl1GhMAThANkA15sKsFWdldaAc5BMGGIZpObQ
 RKZj/nGlH8vMLE2gqHoTELipQ7J6j2fCMsNrUIA06jy9DVGL/R4HpTXhC1yBZRWsQYip
 sW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xNz5hC6gd0RICEGuO8Kja9lfPwHmN+gkPzAwiuNbxcM=;
 b=czr9YIFenx2pouM0nlSad8zJ7yJHMDq9+ijv4ZRCL5daFLsW55Pxoq42aIe7aUqhLP
 SOBNqfp4iRdg3PBpFO8KdeV8sLI5SQ80LEqnvYk9Azg86MEQRMcBJROB4S9j87/nb90I
 SaHtXonHFaxWIzPTm3lWhPtM+YeNzvXE1v5iaRwOcnhrITWBDaDRxfdzgAfkTOuA5CfI
 MeqkCotZo8qDx/MC2HwUXf/v980qMyGnVO5ZiOlpLS2zWdGLo4KZJ70jMGvGVr/q6NGR
 +YWEFO4a10aIldJShkcYrDseIohqLJfbMLLrvtEseQ9cvToI0638EeR4zgR/a9io0LuW
 6MpA==
X-Gm-Message-State: AOAM531e1YEK8vW8ijhvWv9D32R4QhzHZ+I9YyIWAqDbncuGci50rvSw
 6hl93pc0N3mToUsZZOD7buA=
X-Google-Smtp-Source: ABdhPJyr0KilJxGDDxi92JYBtK6XSjfvtjCWsUVJDIcARXhdENVebdhJRrNevs2yUdXcyUWTznCK7Q==
X-Received: by 2002:aca:1809:: with SMTP id h9mr1114359oih.4.1625588784716;
 Tue, 06 Jul 2021 09:26:24 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id f20sm120586otq.35.2021.07.06.09.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 09:26:24 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] riscv: Disable STACKPROTECTOR_PER_TASK if
 GCC_PLUGIN_RANDSTRUCT is enabled
Date: Tue,  6 Jul 2021 09:26:21 -0700
Message-Id: <20210706162621.940924-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_092626_471248_B5E8B196 
X-CRM114-Status: UNSURE (   8.94  )
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

riscv uses the value of TSK_STACK_CANARY to set
stack-protector-guard-offset. With GCC_PLUGIN_RANDSTRUCT enabled, that
value is non-deterministic, and with riscv:allmodconfig often results
in build errors such as

cc1: error: '8120' is not a valid offset in '-mstack-protector-guard-offset='

Enable STACKPROTECTOR_PER_TASK only if GCC_PLUGIN_RANDSTRUCT is disabled
to fix the problem.

Fixes: fea2fed201ee5 ("riscv: Enable per-task stack canaries")
Cc: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 469a70bd8da6..3afb84fa2190 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -486,6 +486,7 @@ config CC_HAVE_STACKPROTECTOR_TLS
 
 config STACKPROTECTOR_PER_TASK
 	def_bool y
+	depends on !GCC_PLUGIN_RANDSTRUCT
 	depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_TLS
 
 config PHYS_RAM_BASE_FIXED
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
