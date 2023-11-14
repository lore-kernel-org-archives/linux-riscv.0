Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBA9C4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 09:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Chwuw8ali95qioGbfjm4/nXCd5GrJf4cDHkQfJG4MJQ=; b=o+JjPqvqAP3d5N
	MlnveY1wntgw38nbg/OFsFPgUltfVtf29YvJY/m8Z9PQxfq+DurQp40+CexeroWTL1SMWEA6dG5Y6
	GCyRNW7ScxkNprnGSXsHxurtUBQBzehIwLPN4Eg+8HSxzx420admB/45DPXpRQO062g60zBZILWKD
	jQKxgplaHiK2TdkT2XUy8VTzkLkZ9CAF2omkSo4e2PmySryIZ2w+XC3FCEqPZbd/YjNHjopUEd8z1
	p5gfwxw74LlmPBB178FEExxFjRsRbX4areiBwfCpp+UefTO8GQBXxKk8l/Cxtzq9iTorQz6Jq8Yqs
	JGxr2H/UvfIDZI79iUOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2pXr-00FU8g-0Z;
	Tue, 14 Nov 2023 09:17:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2pXo-00FU6T-0r
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 09:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699953432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Fpb4buOo5I36YwmyhVRRBioZPTsvySAZR5lDiiIpxI=;
	b=L9ihp8gZS4AKMufJJAiVXLK4RD4kVDwFmlRX6p/9sDhws0dplJ/e2L+8HfQtaFBOPGDPGp
	RW5iKyE3dRnOKEEzf/f+4wVqPjPKBwEjBkXnL6MWc4OwDCp2DkbfLrbZMQJvggVnzkRpnJ
	wIOnr8b76NQTsGtHDfdnr1fsrBbg14A=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-5-PljBhzhMNE6KZtfoQgWXVg-1; Tue,
 14 Nov 2023 04:17:10 -0500
X-MC-Unique: PljBhzhMNE6KZtfoQgWXVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 505471C05149;
	Tue, 14 Nov 2023 09:17:10 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.231])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4199D2166B26;
	Tue, 14 Nov 2023 09:17:05 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org,
	x86@kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	akpm@linux-foundation.org,
	ebiederm@xmission.com,
	takahiro.akashi@linaro.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 1/2] resource: add walk_system_ram_res_rev()
Date: Tue, 14 Nov 2023 17:16:57 +0800
Message-ID: <20231114091658.228030-2-bhe@redhat.com>
In-Reply-To: <20231114091658.228030-1-bhe@redhat.com>
References: <20231114091658.228030-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_011716_374974_0332F836 
X-CRM114-Status: GOOD (  15.11  )
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

This function, being a variant of walk_system_ram_res() introduced in
commit 8c86e70acead ("resource: provide new functions to walk through
resources"), walks through a list of all the resources of System RAM
in reversed order, i.e., from higher to lower.

It will be used in kexec_file code to load kernel, initrd etc when
preparing kexec reboot.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Baoquan He <bhe@redhat.com>
---
 include/linux/ioport.h |  3 +++
 kernel/resource.c      | 61 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 14f5cfabbbc8..db7fe25f3370 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -331,6 +331,9 @@ extern int
 walk_system_ram_res(u64 start, u64 end, void *arg,
 		    int (*func)(struct resource *, void *));
 extern int
+walk_system_ram_res_rev(u64 start, u64 end, void *arg,
+			int (*func)(struct resource *, void *));
+extern int
 walk_iomem_res_desc(unsigned long desc, unsigned long flags, u64 start, u64 end,
 		    void *arg, int (*func)(struct resource *, void *));
 
diff --git a/kernel/resource.c b/kernel/resource.c
index 866ef3663a0b..12bce44a2c08 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -27,6 +27,8 @@
 #include <linux/mount.h>
 #include <linux/resource_ext.h>
 #include <uapi/linux/magic.h>
+#include <linux/string.h>
+#include <linux/vmalloc.h>
 #include <asm/io.h>
 
 
@@ -429,6 +431,65 @@ int walk_system_ram_res(u64 start, u64 end, void *arg,
 				     func);
 }
 
+/*
+ * This function, being a variant of walk_system_ram_res(), calls the @func
+ * callback against all memory ranges of type System RAM which are marked as
+ * IORESOURCE_SYSTEM_RAM and IORESOUCE_BUSY in reversed order, i.e., from
+ * higher to lower.
+ */
+int walk_system_ram_res_rev(u64 start, u64 end, void *arg,
+				int (*func)(struct resource *, void *))
+{
+	struct resource res, *rams;
+	int rams_size = 16, i;
+	unsigned long flags;
+	int ret = -1;
+
+	/* create a list */
+	rams = kvcalloc(rams_size, sizeof(struct resource), GFP_KERNEL);
+	if (!rams)
+		return ret;
+
+	flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+	i = 0;
+	while ((start < end) &&
+		(!find_next_iomem_res(start, end, flags, IORES_DESC_NONE, &res))) {
+		if (i >= rams_size) {
+			/* re-alloc */
+			struct resource *rams_new;
+			int rams_new_size;
+
+			rams_new_size = rams_size + 16;
+			rams_new = kvcalloc(rams_new_size, sizeof(struct resource),
+					    GFP_KERNEL);
+			if (!rams_new)
+				goto out;
+
+			memcpy(rams_new, rams,
+					sizeof(struct resource) * rams_size);
+			kvfree(rams);
+			rams = rams_new;
+			rams_size = rams_new_size;
+		}
+
+		rams[i].start = res.start;
+		rams[i++].end = res.end;
+
+		start = res.end + 1;
+	}
+
+	/* go reverse */
+	for (i--; i >= 0; i--) {
+		ret = (*func)(&rams[i], arg);
+		if (ret)
+			break;
+	}
+
+out:
+	kvfree(rams);
+	return ret;
+}
+
 /*
  * This function calls the @func callback against all memory ranges, which
  * are ranges marked as IORESOURCE_MEM and IORESOUCE_BUSY.
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
