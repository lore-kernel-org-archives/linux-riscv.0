Return-Path: <SRS0=tg7M=MD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DC2C07E96
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Jul 2021 15:54:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76D2861164
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Jul 2021 15:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76D2861164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aR4R36CdqmXVCFDJmrq4fCs1dpnyRxIXec5CWxxGFX4=; b=TjYVO4oMeD57w5
	s0tHmk3uUWyauHhtmOHuBVr783f7+vzJAkz29zP6YMfJAbUX0T7vCARTKiyxbjN+BWzLlPV4ut6gX
	AnGWrfwljMnFKleb+q0sRMaRdu/1JGOhbOEPRk6a+lpha7gnsISO4Mj6k9kdikIqF+nP8VElGBhLE
	m5cZsqcUdyeR56Q1kwkIyqIOvxAKi8t60VcnyuFPj7Tx9tI9rIuZUq1LNNb85YIZxSFRxCRN38RAx
	xGRvMVWF9jr42WFELqXYINFTLRjthscS2dsC4IKzVRlHZw2sS2jWSrA1UIvGWZ0EV9Ql3D/xCckvA
	OQABB3XtXkg1HH6m7iRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2bmX-005GJp-4h; Sun, 11 Jul 2021 15:54:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2bmN-005GJ5-S6
 for linux-riscv@lists.infradead.org; Sun, 11 Jul 2021 15:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626018841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y4XJXty4LUu68cNLofIKZg229q+OdYgzd6E1hXM4H2E=;
 b=bqey+Ew1riO97PgmRKawJ9owN29XJJdTUKhbmLX1zEaaLpHWVLD56PGlIjb9cO4sCxNDfw
 tUY/LQWWIENM+qzGMu2VGmxyhRd2JHbXW1ROcWBlHmTxj+LiFcBkX87WlIEOQB4ifdfo9l
 /XsuIvU00TZ5nJMMOc0at3eA/XTOiIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-_jmSSBkxNZu3XsuJjc_BvQ-1; Sun, 11 Jul 2021 11:52:05 -0400
X-MC-Unique: _jmSSBkxNZu3XsuJjc_BvQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9DF61019988;
 Sun, 11 Jul 2021 15:52:04 +0000 (UTC)
Received: from haro.redhat.com (ovpn-113-206.rdu2.redhat.com [10.10.113.206])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B96305D6A8;
 Sun, 11 Jul 2021 15:52:03 +0000 (UTC)
From: William Cohen <wcohen@redhat.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: William Cohen <wcohen@redhat.com>
Subject: [PATCH] riscv: Add HAVE_REGS_AND_STACK_ACCESS_API feature
Date: Sun, 11 Jul 2021 11:51:53 -0400
Message-Id: <20210711155153.1630094-1-wcohen@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wcohen@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_085404_026306_24F38528 
X-CRM114-Status: UNSURE (   9.12  )
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

The Linux kernel already has the functions required for
HAVE_REGS_AND_STACK_ACCESS_API feature for RISC-V.
Make the configuration machinery know about the
available functions so CONFIG_KPROBE_EVENTS can be enabled.

Signed-off-by: William Cohen <wcohen@redhat.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bf5e8de0d0d4..8bf83d4e0846 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -249,6 +249,7 @@ config ARCH_RV64I
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER
+	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
 	select SWIOTLB if MMU
 
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
