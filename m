Return-Path: <SRS0=rW/4=OB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4FCC43610
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Nov 2018 19:54:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E601220865
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Nov 2018 19:54:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r+qb0TTM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rijGVNO5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E601220865
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1i+IGxDCOF0+uaSWSkR9e/NdV1GdllVY40vfSjcdAp4=; b=r+qb0TTMYpMk/Lmsa5Yej+6zms
	UlvIXlgxxB6Rf4sXGGC/4Of4l3Hi23o/E0MvTeh2Lgwf7mKLlXApsJh4VETalrVD2cRZYYoBOnUN6
	8Xre0P3+gbskzFGvaNfCa+X3rm78VqxWLikQIIU0igr+LV7S7B68PLCs1ZzP5fz3QuTXBORMkaLrU
	4voM1KZCJkvNXBevIPo/pfnw/iNcl1cA2ptndwF11Fygu1tpG7z4b7Vg13kIf5MsZN6xnnnvP8Jvq
	kAJR9jL2iZdPmTAHhX3Jdaj0seViz/piGow5OrK5wSOeHjaZWxW+icuGJIKfKsBiSR9wl4ZvrCFWD
	UvEgE9Sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPv3O-0002i6-Bw; Thu, 22 Nov 2018 19:54:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPv3L-0002g3-4b
 for linux-riscv@lists.infradead.org; Thu, 22 Nov 2018 19:54:20 +0000
Received: from sasha-vm.mshome.net (unknown [37.142.5.207])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DCC920865;
 Thu, 22 Nov 2018 19:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1542916448;
 bh=jbzllQEYNymsMfX2vnIAR7wuaoxJBbiPJJ9RJ4u4SXA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rijGVNO52pvD2fWHh4mIzN4Cu5b8UvNSjG2f3BZlsGPU1FMXbjCXogbjZKC3cuXRD
 ci9VA03OJMUpx5g2VSVPhY72QnPM7y8wYEBpiZk7NwyhLBnwsN9Bdn7OT7U90sl5NZ
 hIzf3lRKc4GEOrg8vWOitGCoirTZCqOgbbqysMNA=
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 26/36] riscv: add missing vdso_install target
Date: Thu, 22 Nov 2018 14:52:30 -0500
Message-Id: <20181122195240.13123-26-sashal@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122195240.13123-1-sashal@kernel.org>
References: <20181122195240.13123-1-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181122_115419_195394_9D523A36 
X-CRM114-Status: UNSURE (   6.71  )
X-CRM114-Notice: Please train this message.
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
Cc: Sasha Levin <sashal@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181122195230.fPRub53HblFZc3Y0eT9v2aWh7UD5bJCie5fwQvKsj0s@z>

From: David Abdurachmanov <david.abdurachmanov@gmail.com>

[ Upstream commit f157d411a9eb170d2ee6b766da7a381962017cc9 ]

Building kernel 4.20 for Fedora as RPM fails, because riscv is missing
vdso_install target in arch/riscv/Makefile.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 61ec42405ec9..110be14e6122 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -82,4 +82,8 @@ core-y += arch/riscv/kernel/ arch/riscv/mm/
 
 libs-y += arch/riscv/lib/
 
+PHONY += vdso_install
+vdso_install:
+	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
+
 all: vmlinux
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
