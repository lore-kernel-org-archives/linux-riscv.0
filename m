Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CC8C83F10
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 10:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8j81ve1Td9aIEeci72fj2bQbK7QlrtacSi1UzEJJoz4=; b=hsjoHntG5WexPf
	D+w1LwfbOBztqN/BGTPtOpqCP/Vhp6Kp4yT/G45hQZgNf6KImr3wefv1rA5ti1KasbC2jpgPzphv2
	ITbaUeiPBzSMFJLaermwsjTjy9rFB5UbqYss4GAG+A7rPVOplkdVnbMvFnGio7pmmdfVWKqVEyvjQ
	xaC8jBrVFyrrWnq/3yDd6Ty0VMQkIt/VlqrSOZbS/KyP63428k2C7gZMfBLGZD4z71BCUccK+hdfd
	8cU/XXb3DV06rQ91bKnb+T4FhS3/2GQhcgXIZV0mnFqUuwNrTVvGpooGwxsX8Vi2A5INJ0bju+mt6
	1kquAt8ZW4Ba4/tLju4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaClC-007pTO-2w;
	Sun, 27 Aug 2023 10:12:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCkn-007ox8-2o
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 10:12:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693131140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zIWsXjq9P0Tg5W/bc8NeaPZWq15ad3a2KkR2r2xHm0Q=;
	b=ZGXvZHTmIlUm3bYxeFSJAFCtlnPyWdVei4Z37lKDLs0K1s9zSdufkqRkdrXmgQtsR/gjHN
	pi3tvqu3oYhhpnoYTR09EjJEdVa2IFlzLwjPYf8QzO7GppS8yXM/IsOPs5z2askiscAWQe
	ibTWh8GPugRvow1OVdioPyWBRhrKzEo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-SMQtJMjNORyfOcC9gDFngQ-1; Sun, 27 Aug 2023 06:12:15 -0400
X-MC-Unique: SMQtJMjNORyfOcC9gDFngQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86E0B185A78B;
	Sun, 27 Aug 2023 10:12:14 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6169D2166B25;
	Sun, 27 Aug 2023 10:12:10 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	thunder.leizhen@huawei.com,
	dyoung@redhat.com,
	prudo@redhat.com,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 8/8] crash_core.c: remove unneeded functions
Date: Sun, 27 Aug 2023 18:11:27 +0800
Message-ID: <20230827101128.70931-9-bhe@redhat.com>
In-Reply-To: <20230827101128.70931-1-bhe@redhat.com>
References: <20230827101128.70931-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_031222_100713_300CEA2E 
X-CRM114-Status: UNSURE (   9.17  )
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

So far, nobody calls functions parse_crashkernel_high() and
parse_crashkernel_high(), remove both of them.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 include/linux/crash_core.h |  4 ----
 kernel/crash_core.c        | 18 ------------------
 2 files changed, 22 deletions(-)

diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index 2f732493e922..0c512a80a768 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -80,10 +80,6 @@ void final_note(Elf_Word *buf);
 int __init parse_crashkernel(char *cmdline, unsigned long long system_ram,
 		unsigned long long *crash_size, unsigned long long *crash_base,
 		unsigned long long *low_size, bool *high);
-int parse_crashkernel_high(char *cmdline, unsigned long long system_ram,
-		unsigned long long *crash_size, unsigned long long *crash_base);
-int parse_crashkernel_low(char *cmdline, unsigned long long system_ram,
-		unsigned long long *crash_size, unsigned long long *crash_base);
 
 #ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
 #ifndef DEFAULT_CRASH_KERNEL_LOW_SIZE
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 6bc00cc390b5..61a8ea3b23a2 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -323,24 +323,6 @@ int __init parse_crashkernel(char *cmdline,
 	return 0;
 }
 
-int __init parse_crashkernel_high(char *cmdline,
-			     unsigned long long system_ram,
-			     unsigned long long *crash_size,
-			     unsigned long long *crash_base)
-{
-	return __parse_crashkernel(cmdline, system_ram, crash_size, crash_base,
-				suffix_tbl[SUFFIX_HIGH]);
-}
-
-int __init parse_crashkernel_low(char *cmdline,
-			     unsigned long long system_ram,
-			     unsigned long long *crash_size,
-			     unsigned long long *crash_base)
-{
-	return __parse_crashkernel(cmdline, system_ram, crash_size, crash_base,
-				suffix_tbl[SUFFIX_LOW]);
-}
-
 /*
  * Add a dummy early_param handler to mark crashkernel= as a known command line
  * parameter and suppress incorrect warnings in init/main.c.
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
