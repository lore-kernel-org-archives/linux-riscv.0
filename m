Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6ECCC4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 14:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SeqMqgI1fCvYc0XmggjdIP55xRDj3NyvfBTQ5vMcf6I=; b=EUqe40b8b6J8n9
	W99EStaZdjOv4uoVZZR2hSC3lh2dJrezpjyGoDOy+oap2JdXRXRLt9AHuTklztwASxb1/IY8Z/FCZ
	RzlFAr9iF4Ra13LnIq7tvpWJ3hW4Ox7yFzNzuOb1wNjK+JTBckpFm0vFVLWWZ4ZbNimh+Tn1HksIk
	6y7VZIn5gyHAvzcyZnkrDupRJz6iDnT7XEXpyAvvp7LNaKXGCo34encWdifNiRq2MdF51PVGCtQjK
	zqrZC0owX9oy8Hd2EteyKPQh2U9vHQ2QcLrVrSDaIA+boeVG7b1WegWZQZCDB8t2+WWokNqoDnecO
	6VCyrYHN/NKnwpVFwO/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQqGK-005uBX-11;
	Fri, 19 Jan 2024 14:54:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQqG6-005u0j-0X
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 14:54:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705676053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/8hCUVuTDtixWcZu0Bhjq+7RevB6bL41WaDVirnLF4=;
	b=DUa1jz4R6un1Ctdc/LAkgn4xSzRz0U0rEOyEtAfCm1IL5/yM98YE9K6j2wRsUJbJ6BOLxG
	/uv6F7fXgSpcchI7kLFC1rZBSvaqXCBr5WDMZrTCbqL7O8lxVKXC0XZqpFVL8CFL3SyQLN
	QeAjNuLHIbP0fTtRN/gSnjCGCS7+WG4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-D60y9ktTMdCt2oSU5Zg3Og-1; Fri, 19 Jan 2024 09:54:10 -0500
X-MC-Unique: D60y9ktTMdCt2oSU5Zg3Og-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46A7484FA82;
	Fri, 19 Jan 2024 14:54:09 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A02E51D5;
	Fri, 19 Jan 2024 14:54:02 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	akpm@linux-foundation.org,
	ebiederm@xmission.com,
	hbathini@linux.ibm.com,
	piliu@redhat.com,
	viro@zeniv.linux.org.uk,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v2 10/14] sh, crash: wrap crash dumping code into crash related ifdefs
Date: Fri, 19 Jan 2024 22:52:37 +0800
Message-ID: <20240119145241.769622-11-bhe@redhat.com>
In-Reply-To: <20240119145241.769622-1-bhe@redhat.com>
References: <20240119145241.769622-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_065415_142729_F43899B8 
X-CRM114-Status: UNSURE (   9.74  )
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

Now crash codes under kernel/ folder has been split out from kexec
code, crash dumping can be separated from kexec reboot in config
items on SuperH with some adjustments.

Here wrap up crashkernel reservation code inside CONFIG_CRASH_RESERVE
ifdeffery scope.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/sh/kernel/machine_kexec.c | 3 +++
 arch/sh/kernel/setup.c         | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/sh/kernel/machine_kexec.c b/arch/sh/kernel/machine_kexec.c
index fa3a7b36190a..8daa8a6e6fa6 100644
--- a/arch/sh/kernel/machine_kexec.c
+++ b/arch/sh/kernel/machine_kexec.c
@@ -153,6 +153,9 @@ void __init reserve_crashkernel(void)
 	unsigned long long crash_size, crash_base;
 	int ret;
 
+	if (!IS_ENABLED(CONFIG_CRASH_RESERVE))
+		return;
+
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 			&crash_size, &crash_base, NULL, NULL);
 	if (ret == 0 && crash_size > 0) {
diff --git a/arch/sh/kernel/setup.c b/arch/sh/kernel/setup.c
index d3175f09b3aa..620e5cf8ae1e 100644
--- a/arch/sh/kernel/setup.c
+++ b/arch/sh/kernel/setup.c
@@ -220,7 +220,7 @@ void __init __add_active_range(unsigned int nid, unsigned long start_pfn,
 	request_resource(res, &code_resource);
 	request_resource(res, &data_resource);
 	request_resource(res, &bss_resource);
-#ifdef CONFIG_KEXEC_CORE
+#ifdef CONFIG_CRASH_RESERVE
 	request_resource(res, &crashk_res);
 #endif
 
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
