Return-Path: <SRS0=yxlK=42=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913D2C10F29
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2020 08:22:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63E8E20848
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2020 08:22:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Caxv7z3G";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="m/giYsQO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63E8E20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOfAoLdk+wyu9cMPPwg3ptCFXLjHocYAW+86LT+5msM=; b=Caxv7z3G1atcqk
	9EEqAUSAMKOcwsfcy5Z2HyYrRuV+xhrwtmCXYaY95o8LZe3HRW6xJmswx6JCMBU6cijcA+meFOAqP
	bmXVVgwsr9VqBrMhXpyRsJnC040o+QU8aZdcKxnYNE18UEzxNfYh8rDPuYR3qw9QG3Wioeu3VLfet
	SmtFAIGqLKwuwGMxWJ6YEAmeuMNG4nCskARotyn2GF7GGCqO7EZwmSoS4MEyrFM2F8odBvxTG3Vrn
	BCvpSXHL5UAXf62LkOJhwqjyGxVvK7u703QIt7w05I6BHj3s9LBt5CbtGIyE8C4/2wDn1eEmChlD9
	I1m1IP9M58kNKMZMAAjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBDgW-0005xz-24; Mon, 09 Mar 2020 08:22:48 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBDgS-0005sO-5T
 for linux-riscv@lists.infradead.org; Mon, 09 Mar 2020 08:22:45 +0000
Received: by mail-pf1-x442.google.com with SMTP id n7so4504506pfn.0
 for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2020 01:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dOfAoLdk+wyu9cMPPwg3ptCFXLjHocYAW+86LT+5msM=;
 b=m/giYsQOqBKciJBZcJMXG3pJIU8PzNA/YNo1CXykqc3wPCLwBGH6k2idh+ZXn05yE4
 yRciCQY9RJloiOJwvlJMD6Kq7e+lTftgYDsLY45GGla2EpqtQL2xThwzrXP3vaw8T+E8
 ilhj8Ef/PETZkQnyDqHqgB7VKnhRYu6xwv9b3C2p5CDCMq5HajGUi00OKf1AsAEfiZGx
 WYDOZvYQcT6HFoUIpoD6fqGE6b4LCfgg0ktM8Z5TGwjKJL7SFv72j+SYEIXpQyQ8AKGL
 c6C5c1caGCYFf+wV6+XQyLSB0/yPpD89KnvgSTyv4jILmkZwMyql4ahKfoLtPpNotbmr
 c1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dOfAoLdk+wyu9cMPPwg3ptCFXLjHocYAW+86LT+5msM=;
 b=JCyUYwrjWuW9Nq6tMmc6ZodtZKZEaHUFinndgCKktjzq4Xf5GCCMQ3TYsAXXH1N3qt
 E8EO+UCyrlFX75R8gD2195mGrerVal2Taqtt1aV0xj4ZwHGRF2vMspxo2AbqEU4F5pSv
 UM0xn+r193Rf/peWLo1bQdZQi/3YIoMz0u9GXsi0UtkN57b1ak8ht8ytOP9CmFH6lU9u
 IH3KWuI3X825jXB+pF42hIErzRco04MDQ0hlREzHP7UlBxv8eJ2pYMbZs9wQpkNY9g/A
 IL4RyVei1hTsatSDt6MnGQmH/kK5B0wbISQwv2SQf+ExPyzgF0KDU6i3rAnBHULQ9TXC
 t0rQ==
X-Gm-Message-State: ANhLgQ3Yvon0U1sOxzhF/TdNDzJZxW7q/tddYMoj4Pw91lgwEicmJy20
 38wZPrx8JW4hmAJN9Gcm5vg1BA==
X-Google-Smtp-Source: ADFU+vteMe3ewvhpJQl/NECjXwkfEf/awPln9cYkogZavclnc7ufmZRdrvr43bRED8C+ximaAcRKkg==
X-Received: by 2002:aa7:9e8b:: with SMTP id p11mr15205017pfq.26.1583742163604; 
 Mon, 09 Mar 2020 01:22:43 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id v5sm18364779pfn.64.2020.03.09.01.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 01:22:43 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] riscv: add ARCH_SUPPORTS_DEBUG_PAGEALLOC support
Date: Mon,  9 Mar 2020 16:22:23 +0800
Message-Id: <d3ff736aeca7146310e0338d87e2d2c09dc0da9b.1583741997.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1583741997.git.zong.li@sifive.com>
References: <cover.1583741997.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_012244_228242_C6C06A91 
X-CRM114-Status: UNSURE (   8.14  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

ARCH_SUPPORTS_DEBUG_PAGEALLOC provides a hook to map and unmap
pages for debugging purposes. Implement the __kernel_map_pages
functions to fill the poison pattern.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/Kconfig       |  3 +++
 arch/riscv/mm/pageattr.c | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 07bf1a7c0dd2..f524d7e60648 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -132,6 +132,9 @@ config ARCH_SELECT_MEMORY_MODEL
 config ARCH_WANT_GENERAL_HUGETLB
 	def_bool y
 
+config ARCH_SUPPORTS_DEBUG_PAGEALLOC
+	def_bool y
+
 config SYS_SUPPORTS_HUGETLBFS
 	def_bool y
 
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 7be6cd67e2ef..728759eb530a 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -172,3 +172,16 @@ int set_direct_map_default_noflush(struct page *page)
 
 	return walk_page_range(&init_mm, start, end, &pageattr_ops, &masks);
 }
+
+void __kernel_map_pages(struct page *page, int numpages, int enable)
+{
+	if (!debug_pagealloc_enabled())
+		return;
+
+	if (enable)
+		__set_memory((unsigned long)page_address(page), numpages,
+			     __pgprot(_PAGE_PRESENT), __pgprot(0));
+	else
+		__set_memory((unsigned long)page_address(page), numpages,
+			     __pgprot(0), __pgprot(_PAGE_PRESENT));
+}
-- 
2.25.1


