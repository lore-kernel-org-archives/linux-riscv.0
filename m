Return-Path: <SRS0=eKgb=H4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EE6C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 20:27:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14AAD64EF0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Feb 2021 20:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14AAD64EF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O2ReQBUiAb5eV17j6Ii8Up7dBqc45CysVJvSk3AEs28=; b=3YcOD7sh70jOgTQTNVVsDFz3xI
	VcWcx6QBQ/5+7QMgqWD3PRfo+B/hv470uIC0xEuaUbV/R1+VXWnL+z+0aAFM5nJdNoPAvJwhQ/sDs
	7/vUy5nxsBsa4F64s2SarbUPDap9gOWSoZi5kYWqy5LXFrNq3bjbkozqVHdoCqNdJN5nDJ5RSMstw
	PxJs7rj8/zOtZcjhv4a1UO1AarzuXBsImYPJBxyy33kS9GBjZpVdVzGXyU5IgqcIEfFAOVr/3GGYL
	qpcEpt0IsCkQPP+C65/Ng2vxgRej51X3iYwiygLG4hIRxpNcupF4Lqao7oQTPe0MrYeJsVtPOKDVC
	YYN71sjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFjhG-00059J-Qb; Fri, 26 Feb 2021 20:26:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFjhD-00058I-U5
 for linux-riscv@lists.infradead.org; Fri, 26 Feb 2021 20:26:45 +0000
Received: by mail-pl1-x636.google.com with SMTP id e9so5900289plh.3
 for <linux-riscv@lists.infradead.org>; Fri, 26 Feb 2021 12:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=guVHHoMFBPvp3OxDd+0aUouYbsfZ7/NT4oJJzvE5m3I=;
 b=tmsnCi2SAI9vkwFeBe40zYshNyCWCZE7X8sGuYNqxij1IEt1YnWoTUFFUkj/c/g32i
 8V4XS2Guu5UkPjW8hCSjPKVihbVlPM5WjHZI0QBO3VLpli+WVIf0ype0AOd2Ta1U5rud
 OndTiVmTBNUyTSNDmfRJPC3d8wcbesqtyKTda15dGJ+be6pwN0/pnixlyBoc2tKO6y1A
 zDTgfTJYPQdw9Cj6KbV4HidpmXkyygLejbILc9+TElN5Si8xUGFBn4affgQjxMrCOZe/
 o+Zz3YgTO5UtDG+/oKZKACWaYgee+zd3QmSr0lMuPNSnlXuMhaRSn1alAeLMP2RCqF/c
 xm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=guVHHoMFBPvp3OxDd+0aUouYbsfZ7/NT4oJJzvE5m3I=;
 b=Qqa0kL4VXSdheI3oEqSJEVPPGXzrKJoAyNuc0JALkyAic7PRhv1CMJooxzQifHZTwA
 /8aVa6NmD5FFjB4DKJKePrWMdkZzAi/62zj6GGKIsgB+qooAg94BdeNPbcKDQ4bcPSKC
 vjV16vQq3u/GMNjDh4Kjkf9NWGqw4LhEAYZQyGoG7N0vkHmEjGt8fe4IhqxKH/J+4IK9
 nHUFtsP1qDUtw19jbZTA9GYQkoA9J5qJQDgZwtWek+Qv5gKOr8lJ9PTBqI+FfmFmdcSq
 86+WjVyvhB5AvFamoj+3ORqgLqM7QDQDnFi+2XMOfZ36g/fBEkNlOP7et/NtULpR1JTY
 cxNw==
X-Gm-Message-State: AOAM530NVPL0BoS3anatMrC3/3PUddLJFp+Pb8SpdTGT1BCSb30UZseW
 8t4GhoAv06769Ui3CtiIkYJnAA==
X-Google-Smtp-Source: ABdhPJx6qgv10L36CmoL36zIpvtjDdnUKZd9v2cpy5GzwjbwW1kOzDHzIgLTxXrHfFTL+LqSOnBx5w==
X-Received: by 2002:a17:902:e781:b029:e4:3bd3:3b00 with SMTP id
 cp1-20020a170902e781b02900e43bd33b00mr4850293plb.70.1614371189701; 
 Fri, 26 Feb 2021 12:26:29 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a15sm95297pju.34.2021.02.26.12.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 12:26:29 -0800 (PST)
Subject: [PATCH] RISC-V: Make NUMA depend on SMP
Date: Fri, 26 Feb 2021 12:25:51 -0800
Message-Id: <20210226202550.512012-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: akpm@linux-foundation.org, atishp@atishpatra.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_152644_076574_23A12143 
X-CRM114-Status: GOOD (  12.49  )
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
Cc: aou@eecs.berkeley.edu, Palmer Dabbelt <palmerdabbelt@google.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmerdabbelt@google.com>

In theory these are orthogonal, but in practice all NUMA systems are
SMP.  NUMA && !SMP doesn't build, everyone else is coupling them, and I
don't really see any value in supporting that configuration.

Fixes: 4f0e8eef772e ("riscv: Add numa support for riscv64 platform")
Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Atish Patra <atishp@atishpatra.org>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
This is on fixes.
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a998babc1237..85d626b8ce5e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -314,6 +314,7 @@ endchoice
 # Common NUMA Features
 config NUMA
 	bool "NUMA Memory Allocation and Scheduler Support"
+	depends on SMP
 	select GENERIC_ARCH_NUMA
 	select OF_NUMA
 	select ARCH_SUPPORTS_NUMA_BALANCING
-- 
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
