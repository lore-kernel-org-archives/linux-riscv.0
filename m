Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46259C433F4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 13:06:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17176207DD
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 13:06:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SIYDcUW0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="L4NVGjJ4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17176207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dLjslYifA2PaLz+NobKb+7BBufAx3Yfn0CmQRZMDq38=; b=SIYDcUW0IbpAkXPn2m0/+AGVw
	7xNeKCeTdU4Vcyj9LIsRBMT+0GAGcb4FXwUyXjkI0O/EFDkIEQ7rRmp4Y6k6jJjpGMqej1srwrCgv
	/O9coOMRVJHrcU5ToPc17puBlGLvcZ3z/E1rIp1j6o7as0plOf970+i/FK1Bpy6HAX1PkzrLz75+z
	4xz2bYun4DEEnic2bRiOrq/ps+HinVszdD/K+uzyYfziUkyhKNAhL3BafGyEnP7WM65CnOxhKyGui
	3wT7WWUSgeratqCr0+9elxkdcx5orPtq0pWSAY6IYv7GZA4NENwi+6AI0pDnCo20AGmbaeHPBN75W
	EVnUZfZyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw3aG-0005Oa-V9; Thu, 16 Jul 2020 13:05:56 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw3aE-0005NP-LM
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 13:05:55 +0000
Received: by mail-pf1-x441.google.com with SMTP id 207so3668126pfu.3
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 06:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M9lp+Kxwx0lmE4Cwlw3/F+vQGoahFcCHs4bRN+684nE=;
 b=L4NVGjJ4DvPjs6puIdx8yJNxFpLBd0/It5C6pnxG9k6fFceXEA5VzlWNS11zFIWGwR
 wpwD33JGixX4HMEy9TgBBwvBMY3xVFzWmNJan3dm/m3akokLW3q5PHfwfqtxhD9QOL7H
 4wx20QjtKda8POtSNnsrX5i6o5S+lzGP+04LjZmeYMLPWm+s1iFWqeTqp+n22qgpeAlF
 qnla2J/k+x59dNPck2pkV0riZCslQAD/Xy82YXmK0uSo+QHX5MwVpSAmAjF0TtEWY8Ho
 JEUKqcUXcEDqMxMozlVifBJRVG5t8AaqLcHhi7PpbBx7l+HkV+ilzGH8wB36GnxetM0o
 3Wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M9lp+Kxwx0lmE4Cwlw3/F+vQGoahFcCHs4bRN+684nE=;
 b=GfFlM6sBAdJpUbM/9VkjIMmEvJpWSufY+YR48ToiPTKvhnc94i+OYyzXzzSZjoTuOj
 PATu+0BM4GBMlE4SnZLuH7WetP7uj/y0u9+YdSmt6fHqagod0cDCDs9kheBhJu8iJhY9
 X4eKxdMCDwL3idbgsIbVmyTv3IHKoFCju/rnyf4nSTUmsuXiZVDS0xV34ZqvDI7DQxdY
 x8+ozQz4nWcIOb9XxXT+k2iSN0r+3ElgsNn3o9xPQqCutgez1UdCYQ8Rvs0XNlGGjfK9
 mASAa/D6SDuzfofmOdEPIiHJIOeE1TgRtnfgLFXlxXjqGX1lcqDMi1Hm4TUmwfsNyAEj
 Q8wg==
X-Gm-Message-State: AOAM533F1OAkMJv98JS5xYGgRPEs6ie++4aUaq8hTCJhT7aUouVOmz6X
 jo1toJ/0qxmF11g32NWlA7SoKA==
X-Google-Smtp-Source: ABdhPJwkWq6qUCrMJ7Xg5jzNdHjpMLh+4nr7QZ7Ae/8qhjpcLPgL+7HEDL10K3IpRsGwFWeV3ctDZw==
X-Received: by 2002:a63:ca0c:: with SMTP id n12mr4323915pgi.216.1594904752552; 
 Thu, 16 Jul 2020 06:05:52 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id c134sm4770203pfc.115.2020.07.16.06.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 06:05:51 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] riscv: Fix build warning for mm/init
Date: Thu, 16 Jul 2020 21:05:45 +0800
Message-Id: <628efa24c79a493e39ce6ef13017ae52eaf13388.1594886530.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1594886530.git.zong.li@sifive.com>
References: <cover.1594886530.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_090554_712084_120FDB25 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add static keyword for resource_init, this function is only used in this
object file.

The warning message as follow (with W=1 build):

arch/riscv/mm/init.c:520:13:
warning: no previous prototype for 'resource_init' [-Wmissing-prototypes]

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 92002952c621..66f5952f39c0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -517,7 +517,7 @@ void mark_rodata_ro(void)
 }
 #endif
 
-void __init resource_init(void)
+static void __init resource_init(void)
 {
 	struct memblock_region *region;
 
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
