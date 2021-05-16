Return-Path: <SRS0=Jr9t=KL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B76C433ED
	for <linux-riscv@archiver.kernel.org>; Sun, 16 May 2021 12:15:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A40A961155
	for <linux-riscv@archiver.kernel.org>; Sun, 16 May 2021 12:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A40A961155
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1w4AAVCOd78m8xNK2SGDEXqfQgwF/B7DtfbX69lPZAQ=; b=RU/bmcpnOtA8bzXkvhdEEfScWY
	2vg8n0Sbd25HnBodU9MlYKFhadc0hFtE7fz12hMv5taib37+FIVY/wakS/bLtpuwl3Jo0C/+LDntY
	LOWlPBlxHyQo9i5MVcH9ZUiTctKBuwGcWvfJD9nS4lVxJcb8li7U35NKMwM5EMY0zOqumhGFCxqYB
	iM6QgviCN90CEE+aj6C5c44KWD0SHhqg28b55OGRXK8mZkpdf1XRGl6Xo4xmKLRBr9kZplezJJnIg
	UltnbqK87PHAVTnu0j6oT1rx9G1VWy7qnfkyGV7LeW5mypuwLaCuiFdnXA9n7I52pspPgHyrciMmM
	a5zCV/vg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liFgE-00CBh0-Ek; Sun, 16 May 2021 12:15:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liFgC-00CBgk-DX
 for linux-riscv@desiato.infradead.org; Sun, 16 May 2021 12:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=X4pedPYH9wJV2LGdJ/WHZruYTZCGLAeJLk8AuVrE6wM=; b=Qo1uuGxNAqqdRTL095iK6kBs92
 87mpYKSUa5LYC7LkY4rlb0BkPdrSakwB5URzrmEGLCUkbyF/4UKbBCb8mK5BuREZHYV1swYwhNAxa
 KSlDQXskCBWIGQX9W+8ByxLsl99boYceft1Z4tymU3SDWmM9CABumlAkkawENWr7TlRQaTV15kMPQ
 n6SALYNYqUDvbf3U8EhpowhTNWfX5o5SpWc6aIg5B7JZr1FYl4V3Pt5fQHy2uVmi3yRcFzn5k7FvN
 VbNqGJ9G940UMAhmUT8yqj+fGUupxB1N7sxvuiyova6v0GV79LHHzOQ3/bpfJVp9ABWVrldC0AChM
 TXZXloZA==;
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liFg9-00CuGd-S1
 for linux-riscv@lists.infradead.org; Sun, 16 May 2021 12:15:31 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id w3so777575vkb.4
 for <linux-riscv@lists.infradead.org>; Sun, 16 May 2021 05:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X4pedPYH9wJV2LGdJ/WHZruYTZCGLAeJLk8AuVrE6wM=;
 b=H1xrpFKc+AY9fBXJxRYkuFaprE5VHbaXHuVzXQLSfpABlsjbrzG7sxzgNyhM0IX9VN
 0xo0CQACNs2zBPxMa1BUXI4RhzfkjSEgqIz/be5l3S9Un/WeDzlbZCNSdekf5SUKCrOB
 xHW8T0/4m85JyY6GoZFOjTATyYlOMFsY64i4Fi7cDNlKJrmwob+6ESmuHenie7Q1nG4e
 BemAo1X4k5j6J3oEVmh+Cy4eIIocK6ujQ436kRwdOkqbfUtaDG+SMfuqnkRIz3wRee/A
 3+fFA20o8XeW7CjD/Q2WFISuKehHwTPOx9t5uyb0lhGL3Lb/UXGCGdrsiWUKXjkvSEnu
 5jmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X4pedPYH9wJV2LGdJ/WHZruYTZCGLAeJLk8AuVrE6wM=;
 b=HC1VlkYEQkMR6oqtgAIyvrUiMEsM8BUJQ9IV6W9nLP2iNy8l4tXEEbXHuqHcUP7mos
 jS3UePafOKM/Xdr4Y5X/beC93JKSUO2L4mfYrDcDz3njdQ6ICXIqhIh+nthB2KYG8x3h
 KPqbSYQaolPKwj4fR5G2x5zXGvtt1DL3KqKh7qhsVpmgMIwVu+akx6HLSifp8HDOeDfM
 08xKrRbcDGgj7+FEkNgIbt7+SY2aK/+7pjMG5iXpOuiXwhLqZKYOoc47o83iZiaf9AQ+
 i8MwHoTz38aDxMvLhv7gfFlKhnRiyuVQYufcUWg3/SELTwNcQUhbJMEXTBhTgQIU9w/n
 XqYQ==
X-Gm-Message-State: AOAM533d5o4YHt4lDoFlgMUl3mMFHCQHf5Cp20CigG6FmDWzVrYp9fsG
 kSXjgPhgVTQkKD0saMI0nFsusvQ1+fJ1N1NOAl1NbQ==
X-Google-Smtp-Source: ABdhPJy7gzIb4zN6C/b1sAXzjCAqE2dxFSXYIo7XtiupB18Rk1X0UwWueRlpEHFjXyH72NMybkQYvg==
X-Received: by 2002:a1f:2694:: with SMTP id m142mr43259849vkm.25.1621167326793; 
 Sun, 16 May 2021 05:15:26 -0700 (PDT)
Received: from localhost.localdomain ([2604:a880:1:20::1f:7001])
 by smtp.gmail.com with ESMTPSA id l8sm1745636vke.46.2021.05.16.05.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:15:26 -0700 (PDT)
From: Wende Tan <twd2.me@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Wende Tan <twd2.me@gmail.com>
Subject: [PATCH] RISC-V: Fix memblock_free() usages in init_resources()
Date: Sun, 16 May 2021 12:15:19 +0000
Message-Id: <20210516121519.314493-1-twd2.me@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_051529_929378_933ECA63 
X-CRM114-Status: GOOD (  10.32  )
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

`memblock_free()` takes a physical address as its first argument.
Fix the wrong usages in `init_resources()`.

Fixes: ffe0e526126884cf036a6f724220f1f9b4094fd2 ("RISC-V: Improve init_resources()")
Fixes: 797f0375dd2ef5cdc68ac23450cbae9a5c67a74e ("RISC-V: Do not allocate memblock while iterating reserved memblocks")
Signed-off-by: Wende Tan <twd2.me@gmail.com>
---
 arch/riscv/kernel/setup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 03901d3a8b02..9a1b7a0603b2 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -231,13 +231,13 @@ static void __init init_resources(void)
 
 	/* Clean-up any unused pre-allocated resources */
 	mem_res_sz = (num_resources - res_idx + 1) * sizeof(*mem_res);
-	memblock_free((phys_addr_t) mem_res, mem_res_sz);
+	memblock_free(__pa(mem_res), mem_res_sz);
 	return;
 
  error:
 	/* Better an empty resource tree than an inconsistent one */
 	release_child_resources(&iomem_resource);
-	memblock_free((phys_addr_t) mem_res, mem_res_sz);
+	memblock_free(__pa(mem_res), mem_res_sz);
 }
 
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
