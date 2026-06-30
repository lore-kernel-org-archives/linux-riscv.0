Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40EAC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 07:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RssThLJMS++WJ3ya4XkQgn5gXzXvYeoajNIRNhjU6M=; b=q8BHfy4VPjdB65
	MZ2CjbqTkR+1qjG/A0dJb5f11v8MIdR4kPYcBZ32B+rmQBeqtd7+GZoaqJvbMT7myabQcAwkrw5ij
	qT0Sj4KMnAGxtY5DdjEYU9mxSHOXOan1PBTAFSj7aFVtpc7F9OhSwmRnScP5AE2nWRdQQD/XR/de3
	KnhuxhJiJfQJAPXxjrAutH7brQtsQF8g28PtM1tY7yvMlTqff6cnOod5FVGuxaDr3N6iSbqT7YBmc
	joQky3IPkFqyaHXhTeVgtr5zyFFb+NO4BfJZ6Maa0hKjmsXVyEl9XcjTxEgHzyCcx9QqObOcgLa8R
	gb1W5LLAU3ocsekn/3fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTCI-0000000G9Rq-2jyY;
	Tue, 30 Jun 2026 07:47:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTCF-0000000G9PS-1XJE
	for linux-riscv@bombadil.infradead.org;
	Tue, 30 Jun 2026 07:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VoJbo79rUg5zjWEB3QBIDp68NPxVQaL4/r71+zofbTM=; b=GmX/+I6asoC9Mq6kVsZZp8edSD
	HCY6Nxtt1PnM0sXa7nOuPfAdFQaWONbfeDG0agnUpnUKuJ2Ypk8RJDyisZTDWkDl6iFf4wZg6Ld29
	I/2i8qe1Hes9ogo0pn/GAs2qE+n0Z4r6XNGNW8ndsUSHBYDjMPN1ymIq5hctgsN7CpE/B64MCm8De
	5gG8F2brffD1T6CmFvke50ZKuyCL6LKtfnNxVJyYyFArf2TO0aqDtZkUHXeJU27ATOiMqcB5RQliY
	u1ovTdeXkL1MNaVmTrTDyLCmcv5ToNYUlfbLqodZ9D8I8QeR87fAgooYPIOztNNt0q9GnxjEDr3+V
	d/69Dg3A==;
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weTCB-00000001ciG-2RTY
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 07:47:54 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2c7c61b5292so36994195ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 00:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782805670; x=1783410470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoJbo79rUg5zjWEB3QBIDp68NPxVQaL4/r71+zofbTM=;
        b=exiXf7Vl+YDVzh2Opvq+TtCkeEWiwIFiFMN4ZwrUAmt95ssa1NSHcGYn405e86Y72D
         eLYABWiNZblsb6oBpncKjD2VJRVrrzLleXe9jdJaJYqZu77YO2gQBLRIUUeOw0SepnfC
         1zUgDF+SPXVun2siL7hWlSFEdhyeJrf7URRXcVCUxudIIMV1KBrKgTvopB9eMneQgc7A
         cKe50DaBA3m8q87nT8wHvxiYjQMOkKjZk4vc0W98GnU8MXjW2iotwARPQfpn9deIMUyI
         SMFu+RD14kD0cKIpf3F7yZ7JgKv7T1lmiG9DFtM9ZCeDCzzMFxeC3fx/m2ZI2R5kWqi4
         kMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782805670; x=1783410470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VoJbo79rUg5zjWEB3QBIDp68NPxVQaL4/r71+zofbTM=;
        b=G56jAo9mbhccQSZgdYIdClP/aKXQJHa9jwV/Ry3aySVa3eT93JgsCF+1hvX35B4JlX
         MXlxS1SxnlbvTbR9KgUktiiNtXDfAaa0bqDfR/JzesiDoej1y3Zeu/EpwC5QtDZJnOws
         AimdQ9Ne9BIkAG6gplw0iFPBvvaSUDdlAgATFRQAmlLbikL8YScA351v1HOfE2H+grzs
         HK9i7ByddwvK5kBWMf+uZLhSOcgKxjGCRi0IjW7y8gQpMmVp9C8mzQNCdiO4zA4gGuFI
         MQR6N2JlgWCNGXC/XQ6aOyCNjkEX/84l6vzSSHYH9O5LNAF8PmTWBqPjhJbbaWKT8Xxe
         zg3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Xqf7XYMz5GzDVbovolLkUcG7Sj7O3nJGbN4mc0r6+qiWfNuiU8j3y/SCYzf2gnRl9D4s60GcbDDazg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRpFRgKJpU1X9s+jyGmR0Zk6Lq+GqidXUemC+WKhwLYQh0MegX
	E6kg0eDZEDHPDfdTXvwOeFuUbAz9h/rVvYj+sWxJgpSEIdWgD39lS6Zm
X-Gm-Gg: AfdE7ckNMWjxVCPn4ebfP+3E7FR/11dso+8eEd4oiqoIsLAVES4cTm7e4RFAVOqKj1W
	myXIvrF0pq3+QVP23o3clE0TKWq2JrgYsU0i91MB6tyxw2nTvBukE5nzu+v4OLDDiaaaqPmrdNs
	I9UkAsiDtZjrNQhF8xccfmYOllY3cu77qFLOKVxlPqm7j6AtmAvgCDPnUapxUVMoBz61J1RjGKz
	7WPNTXdI4PJsdOuDSDKxYrjcewOiUIqoykn5M6xzfo6T8UsCitLEohSIDAyD5jadc9MIysJNFkO
	dQswIRAjnXm51aIJU2fR2eiuEJLzOzoJQEyh/JbXvWqJnO1diZh8Oxwt64eD9a1uqsE5WEC4Qso
	EKwhKpc4eYM963K6PZoVn1aItTDL0eISc5AnAEORduXosTkpImv5SLeicp59j5OJU9G1J4cztwk
	GqnYXq4aG/25ZF1S4nRo5IV2Awgw==
X-Received: by 2002:a17:903:41d1:b0:2c9:97a9:209b with SMTP id d9443c01a7336-2ca2ed32417mr20077795ad.47.1782805669781;
        Tue, 30 Jun 2026 00:47:49 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a2d3dsm7821045ad.55.2026.06.30.00.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:47:49 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	bhe@redhat.com,
	rppt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	alex@ghiti.fr,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH v4 02/10] of: reserved_mem: dedup and relocate reserved-memory messages
Date: Tue, 30 Jun 2026 15:47:06 +0800
Message-ID: <20260630074715.4126796-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630074715.4126796-1-chenwandun1@gmail.com>
References: <20260630074715.4126796-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_084752_060844_0F61F931 
X-CRM114-Status: GOOD (  11.14  )
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

From: Wandun Chen <chenwandun@lixiang.com>

In both fdt_scan_reserved_mem and fdt_scan_reserved_mem_late, there
are identical check-related print messages. Consolidate these messages
by moving them all into the fdt_scan_reserved_mem function.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 82222bd45ac6..42649dc3613f 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -270,19 +270,15 @@ void __init fdt_scan_reserved_mem_late(void)
 		return;
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
-	if (node < 0) {
-		pr_info("Reserved memory: No reserved-memory node in the DT\n");
+	if (node < 0)
 		return;
-	}
 
 	/* Attempt dynamic allocation of a new reserved_mem array */
 	if (alloc_reserved_mem_array())
 		return;
 
-	if (__reserved_mem_check_root(node)) {
-		pr_err("Reserved memory: unsupported node format, ignoring\n");
+	if (__reserved_mem_check_root(node))
 		return;
-	}
 
 	fdt_for_each_subnode(child, fdt, node) {
 		const __be32 *prop;
@@ -337,6 +333,7 @@ int __init fdt_scan_reserved_mem(void)
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
 	if (node < 0) {
+		pr_info("Reserved memory: No reserved-memory node in the DT\n");
 		total_reserved_mem_cnt = 0;
 		return -ENODEV;
 	}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
