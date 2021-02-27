Return-Path: <SRS0=iQdh=H5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56C68C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 22:48:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A664464DA1
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Feb 2021 22:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A664464DA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QgRJ+Ut3nhw3Pl12ksusWY7RKVq9NqPptJPajDngW2c=; b=AWDo1VSrGgGNhqkvfDiWjKwJre
	ykl3rvrM0UMnzpNHQcQ8fp6aiTBbhIweAjlBTNxWKT99T8pbc41K928dbypW+UaWLElDn1anOn2Qk
	KsYYAN3xUhKjB/3F0PFrNtC622UCRguENIyJpDjUb/6KElT+eBzf5tBKk4scRebbnqnCu3SZ/ryyh
	gXS/Bma+CCmPe7h1egjd1EjATeLPIihQYidJ08m+coLV9GGeo0qJKKYYJAlwSnvhT4R/L3RaswAkl
	kPeMvPBFNVRAiePaHybHQQhpDSYwSLhQLrwoUON8Qjrng3mwRId58rmqiVrjGElvzT9IkAVoxHBuq
	EGxCNAhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lG8Nl-00022m-Hx; Sat, 27 Feb 2021 22:48:17 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lG8Ni-000229-K9
 for linux-riscv@lists.infradead.org; Sat, 27 Feb 2021 22:48:15 +0000
Received: by mail-qv1-xf32.google.com with SMTP id k5so6395848qvu.2
 for <linux-riscv@lists.infradead.org>; Sat, 27 Feb 2021 14:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d6/qElfee7snrzWB+lR+ixXZDbPaoKETn/jyu2proSc=;
 b=lGdrG2Z1j6J0Q1L1R+R1beLd2f0kgx/spfBgEU+y9eNM1YG94C6C8crhvT2mpNdgrR
 z7rOplS4sTWnpV3AeNKkbP8IgfLtskrP6U6gg6AK/ja3IPKgEQvAnd41VjLtSGZxvmcf
 N2shdPl1YM1fW70Apy7waCHC/M9VHXYB7xUpUQRZoNfzIWHCXuX5SewxgY0XHpijm6Aa
 PT3bMciGPFkuIUGvIcK4i41lLA1x00CKBIeJLznVfCPR1uE4H0aFWepMumcLoDk06AZT
 p7X5HvspJ7dbbw4RHOUBoHxQSyQEyC/ZcFTr6p2OGLl+ghktxR+yygKRygIf2tHflMlx
 DKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d6/qElfee7snrzWB+lR+ixXZDbPaoKETn/jyu2proSc=;
 b=fWAdMgi4j0TN2I7eJDCxcPnxgouijbAMOT1dv0z6FWd1gGfYiBpQTs5yUDjLEoS6AH
 Ej9GFxrDgArQuFf5rQiUsPwJpL/FjCRoohZByWkM9piYA0C7NG04RmOxogS/SHXjiefl
 /FdmJeWall0V48g4pW6U9KzFhefvcqQ5tZWwISyArW1iui4Xvyaly5eginn9zTF+ogZ8
 z/hVpUZODnhWj7cx2hPvqrYk7D5A0GjAyAxvmoeVmt6U69E+uNBvaspQNAgOo73z+zUz
 s19wEVmNEcd+lCUVzR9nJalAPcGR7sSKIA9vIgwa/v9VmxyvO+EjzXAhHTbUBa2mRBdc
 bZSg==
X-Gm-Message-State: AOAM532zWVu7QtyL3lAied/c549Fbwnpc6UhpPp4UU5yPWvQ9SOMLYXq
 T7qlhRHGl5QS7sZcq2Fx2ZM=
X-Google-Smtp-Source: ABdhPJwxW/1jcHve2lmu7M5izDf0F4gFYVLPQOltLMoARLNLqUy9R90byk5fORh/U0/9jGdNSXjc7g==
X-Received: by 2002:a05:6214:1c47:: with SMTP id
 if7mr8940357qvb.50.1614466091328; 
 Sat, 27 Feb 2021 14:48:11 -0800 (PST)
Received: from localhost.localdomain ([138.199.10.27])
 by smtp.gmail.com with ESMTPSA id x15sm9442310qka.53.2021.02.27.14.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Feb 2021 14:48:10 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: w@1wt.eu, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH] tools: include: nolibc: Fix a typo occured to occurred in the
 file nolibc.h
Date: Sun, 28 Feb 2021 04:14:35 +0530
Message-Id: <20210227224435.21315-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210227_174814_700364_1DA80D27 
X-CRM114-Status: GOOD (  12.88  )
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
Cc: colin.king@canonical.com, rdunlap@infradead.org,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


s/occured/occurred/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Stolen result from Colin's finding and share from the other places. :)

 tools/include/nolibc/nolibc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
index e61d36cd4e50..fc998c359607 100644
--- a/tools/include/nolibc/nolibc.h
+++ b/tools/include/nolibc/nolibc.h
@@ -1054,7 +1054,7 @@ struct sys_stat_struct {
  *     scall32-o32.S in the kernel sources.
  *   - the system call is performed by calling "syscall"
  *   - syscall return comes in v0, and register a3 needs to be checked to know
- *     if an error occured, in which case errno is in v0.
+ *     if an error occurred, in which case errno is in v0.
  *   - the arguments are cast to long and assigned into the target registers
  *     which are then simply passed as registers to the asm code, so that we
  *     don't have to experience issues with register constraints.
--
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
