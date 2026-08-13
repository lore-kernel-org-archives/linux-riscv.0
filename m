Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE83C5CFDB
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 07:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9l8NeiZsm2bYs/+MrSUIkQXX63sMkbqpd3hvvkBIBLk=; b=BvqSrsrsHo5qcm
	Q1tNHRGSbEmIPVTS8yiJrfykWJ93s3BUx56XoQbRCQsBOU85FaL8VXxZVr+Tq101c/l8LDoQ8ltkD
	k+eDcg26dqWn04fHQfe6RZcrYSdFE2XxVwA0Je5GCeZFLlpX57AVkhuE4t6G1FN3MpigwrAWGcaAC
	kwZjJBXuBIIDdm8emtWo0psx9SysBWkJX3EFlfnm1/YNZE1uT0/xrYIvJsFfkWwxkopIbs/5ynZH6
	v5YoSkmOBk+jonUSZt37WBjHOnfMg8cbKt2gNxC2El6qX6YETgUX4sf40/iNS+koHCTuqmicz6sbR
	PczEX3f9q2nKFlMRcMrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQFi-000000003Wa-19jf;
	Thu, 13 Aug 2026 07:53:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQFf-000000003Vz-1J8i
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 07:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786607602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y6pxUhHWKW2XA72SzK1YWEsEcU5+kupBKwLLr8AET8E=;
	b=P6IQPvw6H76oDqzH1l8qROrTJaGWplX8s2dmxQSOh3Qe0+/OWNHrt3tkCNyzaqY9Y5TvWX
	XL7V7MsmYgG8EVCobTJP5Nj8RqWgBdFIBTud+nESRwdFTIumHGu+74RsMqblqsH9RGJDWj
	uoTj7xZ0ZWDgSXg1AxAp2wLfmWztT+8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-9-QZAkCEzDNv2G84GlJwbu8g-1; Thu,
 13 Aug 2026 03:53:14 -0400
X-MC-Unique: QZAkCEzDNv2G84GlJwbu8g-1
X-Mimecast-MFC-AGG-ID: QZAkCEzDNv2G84GlJwbu8g_1786607592
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DD0861955BD0;
	Thu, 13 Aug 2026 07:53:11 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 92CD91977033;
	Thu, 13 Aug 2026 07:53:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] kselftest/riscv: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Thu, 13 Aug 2026 09:53:04 +0200
Message-ID: <20260813075304.75988-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: uKBVykh7F45YWWiq8PqGrbrWjwLaJK2ryfiJMZn03K0_1786607592
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_005323_426832_16647B5A 
X-CRM114-Status: GOOD (  10.84  )
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

From: Thomas Huth <thuth@redhat.com>

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tools/testing/selftests/riscv/cfi/cfi_rv_test.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/cfi/cfi_rv_test.h b/tools/testing/selftests/riscv/cfi/cfi_rv_test.h
index 1c8043f2b778b..184df6903d01c 100644
--- a/tools/testing/selftests/riscv/cfi/cfi_rv_test.h
+++ b/tools/testing/selftests/riscv/cfi/cfi_rv_test.h
@@ -56,7 +56,7 @@
 
 #define CSR_SSP 0x011
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 #define __ASM_STR(x)    x
 #else
 #define __ASM_STR(x)    #x
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
