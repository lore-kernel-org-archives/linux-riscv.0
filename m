Return-Path: <SRS0=kxho=ND=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53421C46475
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Oct 2018 07:34:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2526720652
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 23 Oct 2018 07:34:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DDD0rTAi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2526720652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9fb6QpYzwpq62sZfEkHCNdNOaSrs1gtob6s+zNdDabk=; b=DDD0rTAizQ6RMn
	EXfC7FEsiti5fihFbU5lVxE3amHxGTOzSqJUs7WJqmLTp/Cd+kbcs6Atgj22q6LfBFhNly/cs8fe/
	MFyRIXvs0l58YI1DHQmIoLgD3JdCOypSbhoH7cRF37zsuVkI3ns0DqdZLVk5tEO1lK4VeknLXMFAl
	dEHm9Gk9WwbF3lJmXxuboK7SvoAoOUxHHOqziNfdWSJGlvqEHmY4SMDAHImtgBo83VTvIhxDRZl8g
	otZJUBJ0elXrmJ2X8ArXsvymM5OMREDbtpY5nfeAfi9W4ZZMoYnpqAsfYgQ/mrtN1XQHqV3RB0SPO
	DGtrEIyAOaTIBkcTltJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gErCW-0006TY-BF; Tue, 23 Oct 2018 07:34:04 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gErCT-0006SG-Fd
 for linux-riscv@lists.infradead.org; Tue, 23 Oct 2018 07:34:03 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DCD68AC24
 for <linux-riscv@lists.infradead.org>; Tue, 23 Oct 2018 07:33:47 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: properly determine hardware caps
X-Yow: BEEP-BEEP!!  I'm a '49 STUDEBAKER!!
Date: Tue, 23 Oct 2018 09:33:47 +0200
Message-ID: <mvmftwxruas.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181023_003401_672528_634D7C2E 
X-CRM114-Status: GOOD (  10.16  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181023073347.IvcSC0FkO_-n1vtPPySvsG--rwDh7iZxXdvE0C4B5CE@z>

On the Hifive-U platform, cpu 0 is a masked cpu with less capabilities
than the other cpus.  Ignore it for the purpose of determining the
hardware capabilities of the system.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/kernel/cpufeature.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 5493f32287..0339087aa6 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -28,7 +28,7 @@ bool has_fpu __read_mostly;
 
 void riscv_fill_hwcap(void)
 {
-	struct device_node *node;
+	struct device_node *node = NULL;
 	const char *isa;
 	size_t i;
 	static unsigned long isa2hwcap[256] = {0};
@@ -44,9 +44,11 @@ void riscv_fill_hwcap(void)
 
 	/*
 	 * We don't support running Linux on hertergenous ISA systems.  For
-	 * now, we just check the ISA of the first processor.
+	 * now, we just check the ISA of the first "okay" processor.
 	 */
-	node = of_find_node_by_type(NULL, "cpu");
+	while ((node = of_find_node_by_type(node, "cpu")))
+		if (riscv_of_processor_hartid(node) >= 0)
+			break;
 	if (!node) {
 		pr_warning("Unable to find \"cpu\" devicetree entry");
 		return;
-- 
2.19.1


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
