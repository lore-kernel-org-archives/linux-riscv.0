Return-Path: <SRS0=WRFO=IO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F62C43381
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 01:55:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EE3564F89
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 01:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EE3564F89
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jiuyang.me
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tmxOrciFXZROZMvxqpWdGueU2601jXarjE8HhjZXn8o=; b=kN/7rk+pTdpl7HiEe9MP/Tygk
	11RJsv6YITzHIIYGk2HgAfXvDUInK1WEbyqouI6Qpcw00KuOKgQ2X6wGCHbcUD1ERPC66drf1ZjkR
	oQAb/CyT59fbfwsgkWIWzdMsHPQFL3r5KlIWT0dgQNOnSiwmo8cLWDErkgBf/g5eImO9pWGLLARLV
	UZC3dttwaHR9BcX9gIJrNLHuogOwNVTF3gZgtqP/YgHOantoBjn0LFHt2cctl589G7iMJlocuIH+c
	n0GNdHt4O8xqQmVewuHP+9+BZURPUb8pZkbRyE0mpyP8RAr2G95LQp2QhPJpcob68zxeQAIFwo+ZU
	LoePGUqug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLyvO-00HCwa-7i; Tue, 16 Mar 2021 01:55:10 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLyvJ-00HCvq-Rt
 for linux-riscv@lists.infradead.org; Tue, 16 Mar 2021 01:55:08 +0000
Received: by mail-pf1-x42f.google.com with SMTP id y13so7789038pfr.0
 for <linux-riscv@lists.infradead.org>; Mon, 15 Mar 2021 18:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jiuyang-me.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5q/FUsghTIcsJ8LEI0rH+7iHgVJefL/qNsLbH3bIMyE=;
 b=DZn7Td2xbVs8NZjEwSGxuiKun0khhEHJLByCFwgBrC582ZQ9KrrdSYCJ/+9C+7Oecx
 AbbWxLiut0bGD3Dzwg25jQAb2gBCbt91q84fKL9Bqza7Ma+uXuyBSq11/zCPR7MDMJb4
 otUSpsaGolGGcBJPqvtxYEvSwBS6xpOfRjZ8T50HP1cO+EXJcDd+1pV1yQWANINMAssm
 hmTciRg3y6HssOmgIedl5hpKeaZoY8OB8pfnIutck/idiqOpx22iQqI3xGc0u0tY5pPO
 wg9u2cauXGiWuoP7/aBROyxW2LOG6DGIITXwSv1hiKidX5d1gvre+H8cZeNUdN8zHqyR
 Nokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5q/FUsghTIcsJ8LEI0rH+7iHgVJefL/qNsLbH3bIMyE=;
 b=OmwMfUvRLhTD2bnlXQInIHIqroYfstUOz+lsqpXQpEykIP3zyoOm/zZENvTUjoMpHS
 loQ8PEN37IcXqHKAtkFzJhh4GszWjTbOJUKd2APF5uai6XawAI+5wlM4SWIQbVhp+M0m
 d/pQyuVSAe/1XGp34mNlU9hq8Cj7EVu1pjcBQl9D6OX2ofCayJ+8SN+l4L10uJVwbyYj
 wPmUl32wB71VONAwUBE4DglDJFydDxYVMbpO08pWRczxbeFsitMZOW3vwMvUTc8q7mz/
 HRAx8uAMqVRe2P0EAnmlJgHcLmD4VykrgKl33NRZBFAYhNBOLwoiVpR1tzPuOM4dXb2f
 31YQ==
X-Gm-Message-State: AOAM531+JPgHP9gPpEbMKpM+2oJ9swd2Vavx9h8vXdcEemLwOUJPnNJ8
 RgshXiLVmneivxPrRdt/9+kYcQ==
X-Google-Smtp-Source: ABdhPJwIqVw4yhW+idQ908m9N/zKI/xk+pVeWaj6BxEcrOYB6QD8dBl3skulZ7CbQFh2JIUVGij92A==
X-Received: by 2002:a63:fa02:: with SMTP id y2mr1672518pgh.412.1615859702050; 
 Mon, 15 Mar 2021 18:55:02 -0700 (PDT)
Received: from localhost.localdomain ([193.110.201.196])
 by smtp.gmail.com with ESMTPSA id y17sm865180pju.50.2021.03.15.18.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 18:55:01 -0700 (PDT)
From: Jiuyang Liu <liu@jiuyang.me>
To: 
Cc: Andrew Waterman <waterman@eecs.berkeley.edu>, Jiuyang Liu <liu@jiuyang.me>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>, Anup Patel <anup.patel@wdc.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Mike Rapoport <rppt@kernel.org>,
 Greentime Hu <greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Bug Fix for last patch
Date: Tue, 16 Mar 2021 01:53:25 +0000
Message-Id: <20210316015328.13516-1-liu@jiuyang.me>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210310062250.74583-1-liu@jiuyang.me>
References: <20210310062250.74583-1-liu@jiuyang.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_015506_261301_91247775 
X-CRM114-Status: GOOD (  11.36  )
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

Sorry for the noise, Andrew gave me feedbacks, and pointed two bugs in
last patch.
1. asid should be thread safe, which is not the intent.
2. asid extracting logic was wrong.

This patch fixes these bugs.

Signed-off-by: Jiuyang Liu <liu@jiuyang.me>
---
 arch/riscv/include/asm/tlbflush.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 4b25f51f163d..1f9b62b3670b 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -22,10 +22,14 @@ static inline void local_flush_tlb_page(unsigned long addr)
 	__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
 }
 
-static unsigned long asid;
+static inline unsigned long get_current_asid(void)
+{
+	return (csr_read(CSR_SATP) >> SATP_ASID_SHIFT) & SATP_ASID_MASK;
+}
+
 static inline void local_flush_tlb_asid(void)
 {
-	asid = csr_read(CSR_SATP) | (SATP_ASID_MASK << SATP_ASID_SHIFT);
+	unsigned long asid = get_current_asid();
 	__asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (asid) : "memory");
 }
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
