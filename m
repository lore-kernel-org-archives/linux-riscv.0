Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AADCC83F13
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 10:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxCJy2MuY7cMPWd8+H4ZdX3+mr3MZyZOu3f+nmnSmbk=; b=cy2EMSLT37DIbT
	gp6wnoi2f5jZdzHeiW/qAR6joNfR1DpZfx7kWhRy13lc7Q7XqPSsRdCSzL1bc7OSNLOArr+FqwiIi
	HPe8aApbykVUBpKWu8TS8iSMYqoIK0L0xdMLJsc9LLUQ8tKsh/9B8U5eExhdpI778iIhrkjdoX8pU
	Flp6adgp97ITaCMbHiXOu8GiZsRlsfnBROWlF+ol6kdqsAdIOl+aQsiZ6F3Lq9VW6iiGxJgVuNp8I
	DPKL6zsGI/YfbZ2yoNlAQAyHxKYfQAAJ5jpBhFhQhc4MuSgZUtVz7/pI/DTW/cDWU5l6jr2wYrU0r
	m3I7m6KhIH9VKzhQOEKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCkT-007oac-2g;
	Sun, 27 Aug 2023 10:12:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCkF-007oMS-2I
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 10:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693131106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tfjMHtwZmYPGJa055635da7tGwR4fHeiGc9iyDU58/U=;
	b=CTzi29rfPNZyOKPWEksM41CbgFFMICpWFW3b8Fu0tEvDnhhDcIa9myFdywPJjKBvQvqWWq
	rZZH5UARODlzpMZr2o/xJIgkj5S+zxbkXw6Dgmlxhmm07RHltPmJN9r5a2kvoafNngYp9a
	2xgn3SsV6x9h7XeR+b+17V5BVMndhKU=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-_F2DW1_AP7-9rph8ZAP7Hw-1; Sun, 27 Aug 2023 06:11:41 -0400
X-MC-Unique: _F2DW1_AP7-9rph8ZAP7Hw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89A72380673A;
	Sun, 27 Aug 2023 10:11:40 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 634522166B25;
	Sun, 27 Aug 2023 10:11:36 +0000 (UTC)
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
Subject: [PATCH 1/8] crash_core.c: remove unnecessary parameter of function
Date: Sun, 27 Aug 2023 18:11:20 +0800
Message-ID: <20230827101128.70931-2-bhe@redhat.com>
In-Reply-To: <20230827101128.70931-1-bhe@redhat.com>
References: <20230827101128.70931-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_031147_878598_C0522097 
X-CRM114-Status: GOOD (  10.71  )
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

In all call sites of __parse_crashkernel(), the parameter 'name' is
hardcoded as "crashkernel=". So remove the unnecessary parameter 'name',
add local varibale 'name' inside __parse_crashkernel() instead.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 kernel/crash_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 90ce1dfd591c..f27b4e45d410 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -241,11 +241,11 @@ static int __init __parse_crashkernel(char *cmdline,
 			     unsigned long long system_ram,
 			     unsigned long long *crash_size,
 			     unsigned long long *crash_base,
-			     const char *name,
 			     const char *suffix)
 {
 	char	*first_colon, *first_space;
 	char	*ck_cmdline;
+	char	*name = "crashkernel=";
 
 	BUG_ON(!crash_size || !crash_base);
 	*crash_size = 0;
@@ -283,7 +283,7 @@ int __init parse_crashkernel(char *cmdline,
 			     unsigned long long *crash_base)
 {
 	return __parse_crashkernel(cmdline, system_ram, crash_size, crash_base,
-					"crashkernel=", NULL);
+				NULL);
 }
 
 int __init parse_crashkernel_high(char *cmdline,
@@ -292,7 +292,7 @@ int __init parse_crashkernel_high(char *cmdline,
 			     unsigned long long *crash_base)
 {
 	return __parse_crashkernel(cmdline, system_ram, crash_size, crash_base,
-				"crashkernel=", suffix_tbl[SUFFIX_HIGH]);
+				suffix_tbl[SUFFIX_HIGH]);
 }
 
 int __init parse_crashkernel_low(char *cmdline,
@@ -301,7 +301,7 @@ int __init parse_crashkernel_low(char *cmdline,
 			     unsigned long long *crash_base)
 {
 	return __parse_crashkernel(cmdline, system_ram, crash_size, crash_base,
-				"crashkernel=", suffix_tbl[SUFFIX_LOW]);
+				suffix_tbl[SUFFIX_LOW]);
 }
 
 /*
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
