Return-Path: <SRS0=0BIX=N5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3930FC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Sep 2021 00:29:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC56610A3
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Sep 2021 00:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBC56610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QDjaOdPVTXYn1Yt+wRmH4nzJ17EVMYV9EYoXrGJ7puM=; b=SNd9Zael7dWQxQ
	uIqmf45z3AVEu5fzSbsKWwh1enJe5XNgbaEBC5EuY97p/ddI0J0RRyzulFxRqaBuBOlpNkO/EWiFD
	xn4l1GN5R+JXWyS+KJD6vXmHuIgjrNpmbC/LPIfH5zqnaUdjBU12iDgOg8Ohmc0bC/wPBRy0w7YQI
	WtrpEQrL/ey5bSZdIvr3C+zD5JP44yqUZGxcHRiHK7BJC/PqJpC0ugw1KiYPWSn7Tnp+CeuCYjG/v
	7zqeFkDtdgNAS8v+O6shq24KmddiBxPXpEqTYW1sAZlpk2YdiVKLZdEh6KEE1r9lIV2ojzlLOjo3F
	NXy+lrOGdlN3ASxwUepQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNOzP-0029Rr-1j; Tue, 07 Sep 2021 00:29:27 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNOzL-0029R6-Ux
 for linux-riscv@lists.infradead.org; Tue, 07 Sep 2021 00:29:25 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 70E8F4077D
 for <linux-riscv@lists.infradead.org>; Tue,  7 Sep 2021 00:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630974555;
 bh=vwY0GyREwDxUyu6PmgoJJAbASD5dqYVwYvhZbAA80bQ=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=L6p/QLlYOOavPpe9akzgo06jGYjqUBMdBvzsP0/RMTu59+LG77cjJaPv5wHV2tAy9
 jgGOGgPL17LQsqAC4nfwTgtuGNt3Rj0DTrz0sqdjJvvq5acjzRFJkOsyiahMmWQwvC
 VR763VhLfFfhPOMFhJ68OyfICo7fa4zHRlFmpZfSsz55b2tk5C+3IKKnPHiutMoKki
 dWupeIpu4NwcRq7zWa7b8UzoaZc3qPyseUqX+XYV5hiPO/DIy2law22wz6dinOtLqw
 cT/tHerxKECQMOqCLLsLZpoLrRYPqo77IZAywlZ8/RgmQSHTaGw0adDXt/5qeamoyE
 PKB2gh5rLcixw==
Received: by mail-wr1-f72.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so1526199wrl.0
 for <linux-riscv@lists.infradead.org>; Mon, 06 Sep 2021 17:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vwY0GyREwDxUyu6PmgoJJAbASD5dqYVwYvhZbAA80bQ=;
 b=SwqEgEzafdPrNtXgJCWUMlJgpbSu8SFPLTyTT+lssshqYU/X9AsJFb6LSFI/MoocRO
 6VQQehallZ9ATK6wie27Phb5JVkf9PtF8b+of6Nqy78si7ldbZ/ZVeDVULVzX1yEgxy3
 ros0x0S3Slh9boFVbz3AbNT1oTFdPuGCJK8BrAeMOq2ec9iWUSwRQ3182Ck2tF6W8Njv
 mi2hcSbVK7R/Jq/wR4nucmTvIkzV48kuWPehf5UgOMv1DQZ9/r3gsB0gXgUZkKSXgaeA
 wH1LrLv8H0eH9KBopwzifxjDOfTyoO0SZYzo4oCPUCJvRL5RgzNAXIDNWPNMmaxRSpKU
 42nA==
X-Gm-Message-State: AOAM530MCU6G5b/vc5lScHzgV7PMlr3fFXWYZd6FBJkZQlnyxof3CI2e
 +y+J7rNx2NPrxZnNREjtrMBDdVFMshzdQkEbBK8egqmMqqlKe8SGRKTpQQ3REBu5+PSuNP9QwAm
 7WJYOvvZ8G5HAPsRdat9JXgDsckyB6TfQgOQ8AXQRzYe+8w==
X-Received: by 2002:a1c:7f83:: with SMTP id a125mr560908wmd.166.1630974554681; 
 Mon, 06 Sep 2021 17:29:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxw5ZhSl97K++iKhqoc8ciIYj2y61O9Fo1Y5YxRxVUXw37B3lEDFeDmUZMsTDBbABmB+MmryA==
X-Received: by 2002:a1c:7f83:: with SMTP id a125mr560899wmd.166.1630974554402; 
 Mon, 06 Sep 2021 17:29:14 -0700 (PDT)
Received: from localhost ([2a01:4b00:85fd:d700:3349:7876:92a0:e08a])
 by smtp.gmail.com with ESMTPSA id l16sm6878608wrh.44.2021.09.06.17.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 17:29:13 -0700 (PDT)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: set default pm_power_off to NULL
Date: Tue,  7 Sep 2021 01:28:47 +0100
Message-Id: <20210907002847.111633-1-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_172924_168991_14C387D3 
X-CRM114-Status: GOOD (  12.56  )
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

Set pm_power_off to NULL like on all other architectures, check if it
is set in machine_halt() and machine_power_off() and fallback to
default_power_off if no other power driver got registered.

This brings riscv architecture inline with all other architectures,
and allows to reuse exiting power drivers unmodified.

Kernels without legacy SBI v0.1 extensions (CONFIG_RISCV_SBI_V01 is
not set), do not set pm_power_off to sbi_shutdown(). There is no
support for SBI v0.3 system reset extension either. This prevents
using gpio_poweroff on SiFive HiFive Unmatched.

Tested on SiFive HiFive unmatched, with a dtb specifying gpio-poweroff
node and kernel complied without CONFIG_RISCV_SBI_V01.

BugLink: https://bugs.launchpad.net/bugs/1942806
Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 arch/riscv/kernel/reset.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index ee5878d968..9c842c4168 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -12,7 +12,7 @@ static void default_power_off(void)
 		wait_for_interrupt();
 }
 
-void (*pm_power_off)(void) = default_power_off;
+void (*pm_power_off)(void) = NULL;
 EXPORT_SYMBOL(pm_power_off);
 
 void machine_restart(char *cmd)
@@ -23,10 +23,16 @@ void machine_restart(char *cmd)
 
 void machine_halt(void)
 {
-	pm_power_off();
+	if (pm_power_off != NULL)
+		pm_power_off();
+	else
+		default_power_off();
 }
 
 void machine_power_off(void)
 {
-	pm_power_off();
+	if (pm_power_off != NULL)
+		pm_power_off();
+	else
+		default_power_off();
 }
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
