Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957D3C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 11:11:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20DBE6121F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 11:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20DBE6121F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CqI/EApFRW0l1gNrq259TgMf2HoW7x22lycDdp3I9H8=; b=dDMA9kZXA93oFaukFQsnGpx23y
	ojb+WfzB9xwCLPv1dTb8RS+BGSHHquKOkzkXUw3w7W6gsOh9t+xP12AMpyEyjlSVx9TSkoTQON6iy
	mFQPGUqE/atzpEV9zgRc8rerma0C35/nJsx5F4B1QvKv3o9NnBqgqNjGKLJeIZ9xJhN7Se82bleNc
	EwyqJRVxHFHuWlGd2faeeSqhviE8cgzUf2o4X7/n3C/Bv6W1l13+te4JUp4peq/34WZLOvAbq+toJ
	mkps09oIhKYRpqgcXrNhFxo0rPrZFULD+o9HMXMoD3gsjGkd0XlwsHyjn3aI4cSdHp9w8Y+sTwJ0/
	MmiKyAUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVuT4-006VHa-C2; Mon, 12 Apr 2021 11:10:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVuT0-006VHD-VH
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 11:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=mb1vA15hZD931RQK7RN8mTEab90zXQ5woZmvbFTBal0=; b=RAq9gme6TdwKdyvfJjaI7yHx2K
 UcF797mElaUDHiDgkwIYDMsZ+7AaRYV8A6ngi+YbqID14HUuHSsl5c6rDJyHGtT18XQXQYFATyLl/
 m6HyVKdGdjFC4O3YNbzJ9ToGjKNuMv9ecPGl+T/dGpPyDXp0kKqonhQv+1dNxQ3E0q/YhORwkRT9D
 V4wCBMcF9HWxTQDsCRjsLVk5XjTt0G1mjN+7bHJwoUKx6F28gxKJGqllLSKwKaih5VuY+FNEmSlpo
 LWEddgknPDTsEhwZIAV/opTm/GG3SuZBDYPa0VIe2xKz1L4jaZoQqOHKIftG/ZJLDTUgy5SteEWUA
 bpUBzGyA==;
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVuSx-006A0R-Tc
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 11:10:53 +0000
Received: by mail-lf1-x129.google.com with SMTP id n8so20769062lfh.1
 for <linux-riscv@lists.infradead.org>; Mon, 12 Apr 2021 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mb1vA15hZD931RQK7RN8mTEab90zXQ5woZmvbFTBal0=;
 b=FyTz/em9S9+gUf7yz3gCaljICXLtEnUwUnj1RWOn5C5cOgy0rzxH29a618DPtNbiiE
 9dJIHuPVxwjsXyxvZpvr65ePWL57I0wKwctPhwPB5zpJbB4qYowKfOjfTIobxwDuCU/c
 bg9TO6SmtWAmmtvS0IX5fO+UMVs0ceKibwlxGuPKr8yNkiG5EbQPBi8+B9nVv3z/RdeN
 PGbIFGKc96k2Vbw9XvPUAP33pmytMki/NSHwyKw1YJ/DvwS+1ABZyLKAzHyfpJyHnira
 bGCnZ4+RMwi5m5yrBC6gKLehegtC+4zuZUGVamCNtbNgQGkCv34S1gFefY2ksnAbbZe1
 OMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mb1vA15hZD931RQK7RN8mTEab90zXQ5woZmvbFTBal0=;
 b=cY/yK8uomzgPgVemQGS2uBwdXv4gAXxQJNJCkgZ1YLJ5g41t2YhIADKhUC9BEyCcEe
 h02s1lI8SZ3RvsaVL9pX4lmjBTWU3m5Lr7eHdVyct4HSuj5h1j7yhTGJhURy+3pc5Rhz
 TDbgjMF7gZ9UacOamNlqFrIjYoidtxhBVod7ZGZQEOthu9U42mLbnkpP6C1iyBSiL26T
 9DDZjxgQ01wGDzRsN9WXcr9FrpY0cN4LrLgN8+TegBHFSLMKvRYubHVPOQ2BPCWN5rYs
 cqunnZLUtigq1lah7Ag8cLKI5iPtI5+GcCqqGPMPwZhVsik0kGVMcVoQBCnzoNhu5ZCr
 Tilg==
X-Gm-Message-State: AOAM530feGV1UUggiAatI/hOU9M4XnwAot9gnUZ+Vb4N8tHpPKTRqCgc
 teyIP4Zbb7WrDYaHtKIRd0zmyg==
X-Google-Smtp-Source: ABdhPJweMyhKpAMENwV+OzW0NgzeRGbo3hv9/ZtD8n0ZKcHowH7W2MQLT+i6qB9le4OEQEOjAjlvbw==
X-Received: by 2002:a05:6512:10c9:: with SMTP id
 k9mr1940826lfg.416.1618225847746; 
 Mon, 12 Apr 2021 04:10:47 -0700 (PDT)
Received: from toster.int.semihalf.com (host-193.106.246.138.static.3s.pl.
 [193.106.246.138])
 by smtp.gmail.com with ESMTPSA id u25sm2325461lfo.66.2021.04.12.04.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 04:10:47 -0700 (PDT)
From: Stanislaw Kardach <kda@semihalf.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: David Abdurachmanov <david.abdurachmanov@sifive.com>,
 linux-riscv@lists.infradead.org, upstream@semihalf.com,
 Stanislaw Kardach <kda@semihalf.com>
Subject: [PATCH] riscv: enable generic PCI resource mapping
Date: Mon, 12 Apr 2021 13:10:12 +0200
Message-Id: <20210412111012.675957-1-kda@semihalf.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_041052_047180_500337DB 
X-CRM114-Status: UNSURE (   8.45  )
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

Enable the PCI resource mapping on RISC-V using the generic framework.
This allows userspace applications to mmap PCI resources using
/sys/devices/pci*/*/resource* interface.
The mmap has been tested with Intel x520-DA2 NIC card on a HiFive
Unmatched board (SiFive FU740 SoC).

Signed-off-by: Stanislaw Kardach <kda@semihalf.com>
---
 arch/riscv/include/asm/pci.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/pci.h b/arch/riscv/include/asm/pci.h
index 658e112c3ce7..7fd52a30e605 100644
--- a/arch/riscv/include/asm/pci.h
+++ b/arch/riscv/include/asm/pci.h
@@ -18,6 +18,8 @@
 /* RISC-V shim does not initialize PCI bus */
 #define pcibios_assign_all_busses() 1
 
+#define ARCH_GENERIC_PCI_MMAP_RESOURCE 1
+
 extern int isa_dma_bridge_buggy;
 
 #ifdef CONFIG_PCI
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
