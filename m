Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA964C25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vhOkIVA+6h4WbnECogZ8HdTalp6eVBN5vMqA59hgxwk=; b=4QNMs9jklJmGhA
	3TeLXcQ0MgEiuNPiEsVpn1JTH2Pxi8IhbKRVaGhwbaxNi88fgh/xjEDHLEgxXWhbomHWgG1y6cSSh
	e1jQWQk2fTaDjWYrcXeZMzvmWZ7aHBRYzVeOnfwR4R70xPqsEqv69dv17xxeYnInEnU/GLHX6eZBs
	0uhw1fsuEppDH4T1D+LAXAJOFX7f96AsP6wDViB+YUGfv+dnI+/lmHUyJxTBXKXLlNnIK6ZdWVk4+
	OeKD09atlX3+vWAGTGU344CVeK4ZN7wvws2cIZRTG2uH1n7tp2EMMlHvIVK0UdIDHYFJf+G0Dg9h2
	L8H9TAeYuXYkEEoOFctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBs2B-0000000HS2l-180F;
	Tue, 28 May 2024 08:18:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBs28-0000000HReu-3UwH;
	Tue, 28 May 2024 08:18:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MfEWqiPiowp1nxWFVOqmObG5hSUllA+ZfcuPMLVDwsA=; b=10dnc6xahQf1TxfTvr7uj+8znz
	iy9kqoqnE0J1LuGy2fJwm8DiGSlcCZ/dKz3EyZVBxLQYZuJvL8mgYXwPV7TRpBMR8m+Rd5rHZGPZT
	YLG61wnlbrzHBWPG6LrxwSZF7sLqm6kU3NqVlb8tfY+ies3laLoLT4zfjhpKtyp6zseQfbhzGkGYw
	cavflUIu4T3bDZkxSOlJC+5aeJGGk+0Mo5O0i5fyDXySARhVvRJVTQ65MbTkyTCrSnMMqOTl/jLc6
	EwSF8Jowza/7huTK5gKR4P/37p/XQ1/4TEmyXEgyuSlD18/7ZHdGscWhObb2F1mX+MIZq7YtE+nWl
	A0JAgQWQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44848 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1sBrzl-0004R8-10;
	Tue, 28 May 2024 09:15:45 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1sBrzn-00E8GK-Ue; Tue, 28 May 2024 09:15:47 +0100
In-Reply-To: <28114882-f8d7-21bf-4536-a186e8d7a22a@w6rz.net>
References: <28114882-f8d7-21bf-4536-a186e8d7a22a@w6rz.net>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	 Ron Economos <re@w6rz.net>,
	 Samuel Holland <samuel.holland@sifive.com>,
	 Guenter Roeck <linux@roeck-us.net>,
	 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	 Dinh Nguyen <dinguyen@kernel.org>,
	 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	 Michael Turquette <mturquette@baylibre.com>,
	 Paul Walmsley <paul.walmsley@sifive.com>,
	 Rob Herring <robh@kernel.org>,
	 Yang Li <yang.lee@linux.alibaba.com>,
	 linux-kernel@vger.kernel.org,
	 linux-riscv@lists.infradead.org,
	 linux-arm-kernel@lists.infradead.org,
	 regressions@lists.linux.dev
Subject: [PATCH] clk: clkdev: don't fail clkdev_alloc() if over-sized
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1sBrzn-00E8GK-Ue@rmk-PC.armlinux.org.uk>
Date: Tue, 28 May 2024 09:15:47 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_011812_896499_F2FD077A 
X-CRM114-Status: GOOD (  12.72  )
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

Don't fail clkdev_alloc() if the strings are over-sized. In this case,
the entry will not match during lookup, so its useless. However, since
code fails if we return NULL leading to boot failure, return a dummy
entry with the connection and device IDs set to "bad".

Leave the warning so these problems can be found, and the useless
wasteful clkdev registrations removed.

Fixes: 8d532528ff6a ("clkdev: report over-sized strings when creating clkdev entries")
Closes: https://lore.kernel.org/linux-clk/7eda7621-0dde-4153-89e4-172e4c095d01@roeck-us.net.
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---

Please try this patch, which should allow the platform to boot, bit will
intentionally issue lots of warnings. There is a separate patch posted
recently that removes the useless registration with clkdev.

 drivers/clk/clkdev.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index 6a77d7e201a9..2f83fb97c6fb 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -204,8 +204,15 @@ vclkdev_alloc(struct clk_hw *hw, const char *con_id, const char *dev_fmt,
 	pr_err("%pV:%s: %s ID is greater than %zu\n",
 	       &vaf, con_id, failure, max_size);
 	va_end(ap_copy);
-	kfree(cla);
-	return NULL;
+
+	/*
+	 * Don't fail in this case, but as the entry won't ever match just
+	 * fill it with something that also won't match.
+	 */
+	strscpy(cla->con_id, "bad", sizeof(cla->con_id));
+	strscpy(cla->dev_id, "bad", sizeof(cla->dev_id));
+
+	return &cla->cl;
 }
 
 static struct clk_lookup *
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
