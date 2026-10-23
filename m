Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734F2606A319
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 04:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oNwoYPBg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=wk2IsIMM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:From:To:Subject:Cc:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Unsubscribe-Post:List-Owner;
	bh=0bt9Il4jihZcIF3zgogTEUuWa2ZrQ3z/fwrrGww1xis=; b=oNwoYPBgBqvyKqSnKYbLW8uBHI
	9mifkzrXrGgWgdHGwX09RbIxIDYr+TawN5uTbmYF5Z8ou5iCR6cpjxazo5nIBm4Aer4xhlxZE04UM
	pkrv3oa2nGcQaJpicAuuu1ObX8IjBLtyDOjpC8JuwFXwmeq5Qb8WaGwOfIka2+vphG43B5w0Lpdrg
	hCaddTSZ9b/GK9C+oj6mBNrhefT63W2fE3/rgMXvy+l9RWuGdqUWTCUGhaV4ARgOW5hlWEgXigOtL
	H99+u7sCphksbYkmF+XQDO/oRM8Aj98bguA3z76KuJvmK8y3BbPEDluJinhvB3YyX6k+EKEaGZQyk
	Ox3p7Y+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6d3-0000000FToW-2wW2;
	Fri, 23 Oct 2026 04:11:41 +0000
Received: from va-2-28.ptr.blmpb.com ([209.127.231.28])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6d0-0000000FTo7-2E23
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 04:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1792728690; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=sSBU3xK2Ij3rZocO6L3/7j8rVVMv4LqkqRjKfDYfDmY=;
 b=wk2IsIMMssIxbKIQqY3JgOGI+qXD2W6OyMLebSTOyEIyah/et7Yfp3EGUtfBLTyL3FfHJx
 H1LWcNPGJEO5VVAihYUfac23qv4EtPn9+AibseRXR8zkuhuw42yGdoCVvX0K6pYaRFij4e
 7qIgRoxF3+z2ivdIUMNSwic9QBnZKESAsMYrOTklgq6TBPM8vUFeN0p8kUl8C8KJTlGVWA
 0LDIhXHZOeqpVktEx/j3WXPqH/RvA8tE1k1WaKcOLfTQisfqfs7ycpvdmRvaT332IEBWge
 Bv5QOjY/3rDZoyktmx8aijnlM+mOW0Hzj00gr5jXFKMXHMmENcDOydJw0SfL7w==
Date: Fri, 23 Oct 2026 12:11:15 +0800
Message-Id: <20261023041115.65939-1-yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([58.250.106.101]) by smtp.feishu.cn with ESMTPS; Fri, 23 Oct 2026 12:11:27 +0800
X-Mailer: git-send-email 2.54.0
X-Lms-Return-Path: <lba+26adade70+082d6e+lists.infradead.org+yang.yicong@picoheart.com>
Cc: <anup@brainfault.org>, <alex@ghiti.fr>, <geshijian@picoheart.com>, 
	<yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Subject: [PATCH] riscv-v: Decouple the NR_CPUS from RISCV_SBI_V01
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
From: "Yicong Yang" <yang.yicong@picoheart.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_211138_799132_02EB89F9 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently the NR_CPUS configuration is highly coupled with
RISCV_SBI_V01 as SBI v0.1 has a limitation on the maximum
support hartid. This doesn't make sense as enable
RISCV_SBI_V01 only enable the build of related functions
but the platform could use a higher SBI version which
doesn't even have v0.1 function, or have v0.1 functions
that doesn't use hartid e.g. SBI console. Add this doesn't
solve the problem for out-of-range hartid as NR_CPUS only
restrict the maximum CPU number kernel can support but
not the maximum hartid, see __sbi_v01_cpumask_to_hartmask().

Disable RISCV_SBI_V01 for larger NR_CPUS is not reasonable
as platform may choose to use certain v0.1 function e.g.
SBI console, but not others.

Break the tie between NR_CPUS and RISCV_SBI_V01 to allow
>64 NR_CPUS along with SBI v0.1 build for high end server.

Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 arch/riscv/Kconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5874ca30f4f6..d02b70ffde48 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -453,10 +453,8 @@ config SMP
 config NR_CPUS
 	int "Maximum number of CPUs (2-512)"
 	depends on SMP
-	range 2 512 if !RISCV_SBI_V01 && 64BIT
-	range 2 128 if !RISCV_SBI_V01 && 32BIT
-	range 2 64 if RISCV_SBI_V01 && 64BIT
-	range 2 32 if RISCV_SBI_V01 && 32BIT
+	range 2 512 if 64BIT
+	range 2 128 if 32BIT
 	default "32" if 32BIT
 	default "64" if RISCV_SBI_V01 && 64BIT
 	default "256" if !RISCV_SBI_V01 && 64BIT
-- 
2.54.0 (Apple Git-157)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
