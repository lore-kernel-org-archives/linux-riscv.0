Return-Path: <SRS0=3FEc=4F=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBEEC7619D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2020 08:32:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00E5B20725
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2020 08:32:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R0P4UmS0";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="IUirukFw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00E5B20725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmRXlNLWA66QEXzOsB4SiGAg688bm55gcoXcA+osGcg=; b=R0P4UmS0RqJbGm
	S6OXeOK6Ixd9WHz/+QYxTswuQ4zsI5yuIEww8on5i7kUzPKspiY5GW7VFPz7EcEMPZqEvjSb8FPKD
	Bj78rB/vQ4gu+tu8/9/IBb8Yanfv2geXX7e3KEnA+yKZqks8YJdX8V04q94y880D+vmgaQK8PMx7t
	MSkSy6vkCzJdz19HwOrCzPUoetESMx17ePs8LGJaKFzc8D3fDMf2Nhh5k+kICoYujFAtkUI9S3myz
	vjjaDHAxDHplo2HO/HDosWGXT3O7DtRlQ0OSiZLzvVHEF5OBcP2gDA+79yb4px9QxP9Pw7KUrAkgn
	9v90TJSQ+8vIStZICezA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3bpX-0005hI-0C; Mon, 17 Feb 2020 08:32:39 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3bpS-0005bs-Or
 for linux-riscv@lists.infradead.org; Mon, 17 Feb 2020 08:32:36 +0000
Received: by mail-pg1-x544.google.com with SMTP id z12so8683580pgl.4
 for <linux-riscv@lists.infradead.org>; Mon, 17 Feb 2020 00:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fmRXlNLWA66QEXzOsB4SiGAg688bm55gcoXcA+osGcg=;
 b=IUirukFwdTH2JYN3UHnCoo0xSkpYjWzQiS46cwG+hnudFzmLHkzzCo69fQwm020L7I
 YPsBdfIUfOfK15SP3frTDbrkoT0zSf6OORP+Rc+AX/dvOj0bn39D6xK6hNXTuNE1eu5U
 0BvCTNuD7Dfde9cqHOdhUn5Jf4f6O/9iUEClIMnfDDBmYy+CRhllzS8JaWsyklDfFDfr
 8ZVfNmkCz08xs8qBsuz/d592ISch4tfyoN1Vm2kuEty36Dj5UIPSYkA2iiV0VI0EuJ+Q
 xXuN6aDYQbFtOe0/wjvuIJg1DZ7K8mTC+6ZAlDzw1iGhfhs/lXxI6lWrENRcM1oUsyJO
 8hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmRXlNLWA66QEXzOsB4SiGAg688bm55gcoXcA+osGcg=;
 b=TK3AHZWM0mXyvTSYahpwcbuy6fjZObjZ+1JTWAJv3jQmcs0XQ/G4HkkJX6cw+tDq+N
 JpovG2jkEqf3UJHas2U9VHOl11NZnjdMrcC1NPs2jlO5PkiSiRRF7noAjETS1x0xA+Ok
 V/Qv4tGXU3uFDBJwq1Jx3D6xeyDpbgEcS0c0MEksmeBljD0c8/zGN5jKfzYS4wcaWxXg
 MT8Hib9WAzzHsR9n2LUmOMvep2GaXKmvHkrZ/35vTtqLneHIcy5VL4IffD8te1C0AXs8
 dxzWn+iAMqqw5f+BLQ7Fg7jO4uaDon5ZqhcL5nlkBKL396Ed6EeNDO0XD/ZTu+gw3M8Y
 Q8Bw==
X-Gm-Message-State: APjAAAXwYvIAD7+z2C5bh7yjCO47D5hNWMhURiYB22TG7lehZd0l5FK3
 z7IzAkgE0rH2uE856yu4cMa4Pg==
X-Google-Smtp-Source: APXvYqxORVll252z49WHmr/1Nnbpt/aAf5+1H1wpQBuznOWydoJWlnyYNnl4gawppsH4adiK7zMQHQ==
X-Received: by 2002:a63:c341:: with SMTP id e1mr17315588pgd.334.1581928354167; 
 Mon, 17 Feb 2020 00:32:34 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id z10sm16989319pgz.88.2020.02.17.00.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 00:32:33 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] riscv: add ARCH_SUPPORTS_DEBUG_PAGEALLOC support
Date: Mon, 17 Feb 2020 16:32:18 +0800
Message-Id: <20200217083223.2011-4-zong.li@sifive.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217083223.2011-1-zong.li@sifive.com>
References: <20200217083223.2011-1-zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_003234_815086_92EEBB58 
X-CRM114-Status: UNSURE (   8.81  )
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
2.25.0


