Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC79CCCF9E5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 14:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7jk5FWpLlNZyge3Smz7hR5IFKMnVjdt+3xmtwLqEss=; b=17NcmMyHUfmgL9
	rN49bwV8hpXaMyInJmTClUOTV/0Jkg0hBPF2+xAyvSQxUPFSgZvLyLSKyem+e90jwRz2mBrkBmwlV
	yZqz1Z1gEIzNt/Pb0b9o2D6Y3dJcPcMf8cx7lj7GTGIVU4V0g/H8v1IIhqOQLl2KhSQunf+MLlPRU
	csm7CkQK/NYmmq8JvVxgHb/xFG+VMUUBdw9e0fTUXes0f0oGKcJu4enDNJgy7yTSjXSc71lHvl1tm
	jvOqlcRop6V7y4g/LnINmH/rb+38UL6oFKU2Ad2L+TfRwplXUixPwOi3nyN9s5YKYuB1enDc78zZ3
	ukyvPnuOAXfYKbG+5Amg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1S0-0000000COrw-3nv6;
	Sun, 26 Oct 2025 14:10:28 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1Ry-0000000COqc-3Iqj
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 14:10:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761487825; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SNSTG/WL0hxfvh6+JbR3ZAuSkdWt+cio9bA65lobkpa/qGjFEHCkDUAdILs79iFR9VfDweWvT9W5S4by4ov+WgVYqOsfqsFUJJ3aNXAb8grbvahSASnAubXLhnX2H3VTIyS+sgT4UCkRUJlW1IOHl2WKb6zGP7Da2IoR7IRoHhc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761487825; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PCZLoT7Yms1wkMm2rkwrm4xGwAENwGA6Phuef9shGWE=; 
	b=JRcQjj6Ur20sQw9hANHc0N2uf7qcN2mEu+WV62EehqCK3OSbLl61/IVD0SrurJIOFrpo0N2mi4MrdapWIkpm1uyf/nO9i4+mfJh0jA4JGGtYSytljt9KXP2KNP5FtuvTV0bkIwXyrJwdTsPh6ec92L8GlKJS9SZNwd0hX6IG4A4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761487825;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=PCZLoT7Yms1wkMm2rkwrm4xGwAENwGA6Phuef9shGWE=;
	b=WYv4sFCg6aMqKvNY73a3qSEGWprPERCNyttoQq1tsjlOF+R2FOcLDRAlrYHKbmP4
	SHOwJfvdI3YVXUii+p0GYRNlA2ZT2/qonyRUQxHSRHlQyAPNweQKd0OuQmQ0jyX5nKx
	1vQVWhgivK4vk8h7NiWw4NqlxnGWPb+r3OCEkHhw=
Received: by mx.zohomail.com with SMTPS id 1761487822637611.4557356961272;
	Sun, 26 Oct 2025 07:10:22 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 26 Oct 2025 22:00:46 +0800
Subject: [PATCH v2 6/6] MAINTAINERS: Add entry for Anlogic DR1V90 SoC
 drivers
MIME-Version: 1.0
Message-Id: <20251026-dr1v90-cru-v2-6-43b67acd6ddd@pigmoral.tech>
References: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
In-Reply-To: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761487753; l=759;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=1yhYT2z87P1zTkyAheEnTR4QxDASI6qps88CMucuwTU=;
 b=TdS7HWegtR9pY8oWt0g25hAlBrXuEHWXMGyRZIbKzINBytUo1whGzqPbQgt4Ai8XjJDTY2qqS
 1cI3I+6lA5jB7+96U8vbJS7xxVm84Ij6zpbQSwclTnVNF/nFQeWR9qD
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_071026_884790_C03985D0 
X-CRM114-Status: UNSURE (   6.50  )
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

Add myself as maintainer of Anlogic DR1V90 SoC drivers.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968e4f9260263f1574ee29f5ff0de1c..f20d6e91cbbaf711532fd752ee39d156408f21fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1829,6 +1829,13 @@ M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 S:	Supported
 F:	drivers/rtc/rtc-goldfish.c
 
+ANLOGIC DR1V90 SOC DRIVERS
+M:	Junhui Liu <junhui.liu@pigmoral.tech>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+N:	dr1v90
+K:	dr1v90
+
 AOA (Apple Onboard Audio) ALSA DRIVER
 M:	Johannes Berg <johannes@sipsolutions.net>
 L:	linuxppc-dev@lists.ozlabs.org

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
