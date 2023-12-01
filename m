Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE85C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 06:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IaV8u1j62kprn8gEn8CNx83N3cISbfGxaaREz1rED44=; b=p4gXRxIf/CWG+K
	QXJEyylUKyzMFF7z0ysHfL+2Q3bmyB4lJgoLTA2+PTwlz/PwQzdmUHcc0oMCfyIEAuYO0jQa7HFki
	G0ECAmcddWKmJFdKOEO1uCwXJEusgKe41mxj1H1BwxFzVf2niNqsRe0f9fWx4zjESVAoTcrYNNQx9
	3VnYatoL+sUeochKz1xkpjSjzrvTHraqKokTuzrrNH+3K3vpZ2IwW+MZZ0JRSuDn+k4glbEThzlt8
	i97bMAKEr+OBOrXJCDtB+U+hq33MZWiX2F2C8R+8k/aEN7S9545z0dvhaZ/XyXRpkXFjDSYR3346r
	PLTfFGFRB13ejxiREGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8wyI-00CmlH-1r;
	Fri, 01 Dec 2023 06:25:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8wyE-00Cmiw-37
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 06:25:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701411948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+Zt79wZvYhz4gi4hOOtVo1AQdfO7nRSajk5T4VGHojQ=;
	b=RUiLUZENr5QGR9V3SkFpLuR3FTBvaHwG+btecFM0V2laJY7c2gVHDeRf+7eKLzjWoyLeqS
	nEjr1L8d2Iyib0y73Tsfyj+omN4HqGM4FqVQbjuIRshiOaZ97jmY1yxDSKogTFIb+vFMDp
	Hv3Nmc6gnybfzkO23H5wld8MMD25QdE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-VG3zhdtUPFCBKXDt90IU9w-1; Fri, 01 Dec 2023 01:25:46 -0500
X-MC-Unique: VG3zhdtUPFCBKXDt90IU9w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22309185A780;
	Fri,  1 Dec 2023 06:25:46 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.113.121])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 813FE1C060AE;
	Fri,  1 Dec 2023 06:25:42 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	kexec@lists.infradead.org,
	mick@ics.forth.gr,
	changbin.du@intel.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH] riscv, kexec: fix the ifdeffery for AFLAGS_kexec_relocate.o
Date: Fri,  1 Dec 2023 14:25:38 +0800
Message-ID: <20231201062538.27240-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_222551_080431_F09ACFE0 
X-CRM114-Status: GOOD (  10.09  )
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

This was introduced in commit fba8a8674f68 ("RISC-V: Add kexec
support").

It should work on CONFIG_KEXEC_CORE, but not CONFIG_KEXEC only, since
we could set CONFIG_KEXEC_FILE=y and CONFIG_KEXEC=N, or only set
CONFIG_CRASH_DUMP=y and disable both CONFIG_KEXEC and CONFIG_KEXEC_FILE.
In these cases, the AFLAGS won't take effect with the current ifdeffery
for AFLAGS_kexec_relocate.o.

So fix it now.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/riscv/kernel/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index fee22a3d1b53..82940b6a79a2 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -11,7 +11,7 @@ endif
 CFLAGS_syscall_table.o	+= $(call cc-option,-Wno-override-init,)
 CFLAGS_compat_syscall_table.o += $(call cc-option,-Wno-override-init,)
 
-ifdef CONFIG_KEXEC
+ifdef CONFIG_KEXEC_CORE
 AFLAGS_kexec_relocate.o := -mcmodel=medany $(call cc-option,-mno-relax)
 endif
 
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
