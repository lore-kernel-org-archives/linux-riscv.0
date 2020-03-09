Return-Path: <SRS0=yxlK=42=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121C9C10F27
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2020 08:22:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB66B20848
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2020 08:22:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hhbJWcEr";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XVjAAwpw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB66B20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eOiyM2uGzUc6zhWPwWC3bZJGaa62phcZiPuWR1LO/LM=; b=hhbJWcErAQ2QZM
	kOuENScok0jZ3aG0/73ohloQbeydNtifgmJ++WdmIgbfHsHhA9JBouePt8vdsSI991kzJLS/e5M5o
	I8y+y9hYYfirCl/tyuTH4NsmrJuA/7SglVuyyNt+zL5FGB8Gx5yOvPKgf8Bza5psf0qvD5wC7fyC1
	7BQKA1PROh2sojHhMoWx43wi4ws3F6tRD2W2zLpP/dOW458+QCIsbp8fdm4orHW/3UZ9dilGIaJrL
	9ihBMZuWGeZLHnO8n2ngdyjlBxE7ON+v5jKsxoDLbT5V+qic/ntTfOBFX8wLXYwAzY59sNb36TAol
	oIuUUS02aH9dXamgBRzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBDga-00063O-2t; Mon, 09 Mar 2020 08:22:52 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBDgU-0005vN-Sx
 for linux-riscv@lists.infradead.org; Mon, 09 Mar 2020 08:22:48 +0000
Received: by mail-pf1-x441.google.com with SMTP id f5so4484948pfk.9
 for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2020 01:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eOiyM2uGzUc6zhWPwWC3bZJGaa62phcZiPuWR1LO/LM=;
 b=XVjAAwpw3TIfdPOsY5Hi9J6JcOtTWJAkDw9er4N1bmY9EtLRPbDrcMGvAuAN1JHlB8
 dvqJ/Id+necoQN/ItafyLCv12x3kRG6RRPocDa80UcowtkzhRoeyWwZoycO+Bt1Jb9qp
 HUpIX3GJRn2JzDI82wwL+0aPH1UbuekEvyEs/DMyolW4PH6WGXB1Gy7i9TLlmXtZUgAG
 jkC2Pq5L4tjZjokC/bwL+s2QhLWvMFvyyu16q6xQ3n23abW4DhRd7bkhBd0wUFafG4cG
 ZqvbxIyP/bpIUcqHbWkp6RsM/kdKT7m5GLx0ljSkH0K7ZFK5hXsyt5T5y7A2tiEYViee
 zWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eOiyM2uGzUc6zhWPwWC3bZJGaa62phcZiPuWR1LO/LM=;
 b=qEawQ7AlWCDjnEMUpfwSlTP+Ai0eNT1kRhvvK27E7c5VTRDs24HNTNC2PLY5bZ59h4
 iTaRofG5/wgPx+hss6PZg2Z9pGWlFCdXAq+4kRPD3fvp72s8R6hgmkUzKhkakWJ01wV8
 tTmqj2lSr23TyGLENRk/q29FabNZl06UkqOOqR4N3Wr78xmnaAfG3Ps3hsrpQDolFr7/
 //fU7qQyZzdRaNTmzk+s4ig+c/V+2NBpqLTlF5Kz4Yb5NzLhEWP2rOAPNb8xjgTEYdmx
 KjbAi9c8/I70W8KcsSxRJ6WuXhgrHdAhdnNgaU74G7u9G7IwpvBZKtjgQ2MILlmcFJ8H
 9O8w==
X-Gm-Message-State: ANhLgQ14fd2HK8SBuEhzGoXTNGVRG+kBSCflgXCQk/YQJfXXzhnOvktU
 FuuI+I0O8RcLy/6kIZPiKCUq9Q==
X-Google-Smtp-Source: ADFU+vun+g27lkPxDCAAj467Dy8sCcdhE7EoSAKg4LPyr31qU0IxBeR2FOjubEoQClHB6p/eqbb+LA==
X-Received: by 2002:a63:715:: with SMTP id 21mr14981815pgh.234.1583742165744; 
 Mon, 09 Mar 2020 01:22:45 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id v5sm18364779pfn.64.2020.03.09.01.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 01:22:45 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/9] riscv: move exception table immediately after RO_DATA
Date: Mon,  9 Mar 2020 16:22:24 +0800
Message-Id: <96f4735f9845ddf7f778d4977c25d405ade92644.1583741997.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1583741997.git.zong.li@sifive.com>
References: <cover.1583741997.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_012246_954076_634B0778 
X-CRM114-Status: UNSURE (   9.82  )
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

Move EXCEPTION_TABLE immediately after RO_DATA. Make it easy to set the
attribution of the sections which should be read-only at a time.
Add _data to specify the start of data section with write permission.
This patch is prepared for STRICT_KERNEL_RWX support.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/kernel/vmlinux.lds.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1e0193ded420..02e948b620af 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -58,6 +58,10 @@ SECTIONS
 		*(.srodata*)
 	}
 
+	EXCEPTION_TABLE(0x10)
+
+	_data = .;
+
 	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
 	.sdata : {
 		__global_pointer$ = . + 0x800;
@@ -69,8 +73,6 @@ SECTIONS
 
 	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
 
-	EXCEPTION_TABLE(0x10)
-
 	.rel.dyn : {
 		*(.rel.dyn*)
 	}
-- 
2.25.1


