Return-Path: <SRS0=Xxsn=ZN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E20C33CA1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Nov 2019 03:21:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB6B3214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Nov 2019 03:21:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FNf7H2Mh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wkTTcG/L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB6B3214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=6gUKhwkFuDvg/kaBJkn8WWNxjyL3feDPm9EUsFg3QBs=; b=FNf
	7H2MhffrEkjcb5msbDpFoKPx4AVBGrUKBl4b6KfGBdYceqGnRJtZ8rYVC+VSuLedhLSYtBuUrLmR6
	e+o8PQ+ViY7bFBc0Ijx3IxfhI0JNaQQpcWh+DpeOi96kr7SHtjhDi7t37O85+eWbysn3vKucsWDSx
	vza7++CLhFmVkjx8x46q4Dl0MSpJKAmY2DE+SVm0+y4eXPD21uxcXhKrvUA8iWDR73pDwmYxIeKAO
	m3p+mC0TQfYvAY+y7ffkPbS8gqno8MtJj8O9xCjIWyhpDD2Uhl24qtiuttjsk8qAbJrcag+TlzkH6
	sAjMud7nFw/18a2zeOxXtYXoAG0c5qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXd2D-0005iU-Qy; Thu, 21 Nov 2019 03:21:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXd1h-0005BU-Kw
 for linux-riscv@lists.infradead.org; Thu, 21 Nov 2019 03:21:05 +0000
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA8AA208CE;
 Thu, 21 Nov 2019 03:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574306461;
 bh=BqQct8MurXEaQBIdn4W/JxxMj+Cw1+0kP+2a1H36etY=;
 h=From:To:Cc:Subject:Date:From;
 b=wkTTcG/LeOpnQx+o0eJ95hmXusT7EtPXbJmXmcWOSzLxoD8b5QuXmh3ozlkv6gdM0
 siTTLCQ1N0XcKG+HqCit0fOPuz0Yn63XPj5QikxODO3Q9mOfxJ7CB7BKkk5FTLOiEJ
 f+ouWsVKT2xqhbUcmsi+aETAPi9pioz+/o3pJV0I=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: Fix Kconfig indentation
Date: Thu, 21 Nov 2019 04:20:57 +0100
Message-Id: <1574306457-6251-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_192101_823567_41F2AE9E 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Fix also 7-space and tab+1 space indentation issues.
---
 arch/riscv/Kconfig.socs | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 536c0ef4aee8..f89b73281737 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -1,13 +1,13 @@
 menu "SoC selection"
 
 config SOC_SIFIVE
-       bool "SiFive SoCs"
-       select SERIAL_SIFIVE
-       select SERIAL_SIFIVE_CONSOLE
-       select CLK_SIFIVE
-       select CLK_SIFIVE_FU540_PRCI
-       select SIFIVE_PLIC
-       help
-         This enables support for SiFive SoC platform hardware.
+	bool "SiFive SoCs"
+	select SERIAL_SIFIVE
+	select SERIAL_SIFIVE_CONSOLE
+	select CLK_SIFIVE
+	select CLK_SIFIVE_FU540_PRCI
+	select SIFIVE_PLIC
+	help
+	 This enables support for SiFive SoC platform hardware.
 
 endmenu
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
