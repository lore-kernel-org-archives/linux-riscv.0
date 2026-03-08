Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4E7F55130
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Mar 2026 05:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Tt9Otf95dESR3geaE/4nMunjjmO9N+fF4rG+dsktbM=; b=djjWBED1thZCB9
	NI63UUy25ZREnJlB8ZjjgtEIR6ng3uYdKWMDGUgE9sEI/6RNDsnMY7+/rQw5sljT0RybWdl1qpUrs
	QyJW/Rj+I7JqA2l65W3M9fDQzJZQ6za23P77o2TDZuAOzZAIFCLEh68nURPm/BGvrKgwyefFJNlNC
	840YwXS16yjPxdoNP6QhzzGbBi1/8yYb6GutaJAkdGjd0Y8laNw3HaUS7zXigDzJdQjkssBt6SAHr
	S7NewHv9Bom3NE60LaNXCokJWTxSF37yFsLcUMpDSslcsUwcAYKI21TNf6yXmMmodq7fsyscogZlM
	wuDCo+PLCCRHpY4hkbiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz6XI-00000005iid-01oY;
	Sun, 08 Mar 2026 05:18:40 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz6XE-00000005ify-15KC
	for linux-riscv@lists.infradead.org;
	Sun, 08 Mar 2026 05:18:38 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fT7hg3FTXz9t0N;
	Sun,  8 Mar 2026 06:18:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772947107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xFoQRbzzGJ6GQLY9ekTrem/KHliTwSgfflqFnYv1J1I=;
	b=W6AGXaD2yCQxWQHhGQx8Lj7x3lvNGWCvnVIGE+n/s0fO58ctJNp8VsWEwHeJdeFq5DhnbY
	mefxHsAX7qTf323TVW/OFmRXA78G7NmRmKyMG8qSlMJfWa0/gNCsDPIkuJfaCeB4v/AAyl
	VGzEzp6sNQFLRmDCMi3GK+eiZevGgXiyI77paevkHup4aY2Pm0dgDHlyYkm5aXoMh4qaws
	cZO4q+FFfAlGXJOJbGMrKGc08IYlLh4iJKkn26vPzwVENzZu3F0nelRsz7EayJN8oLkHN4
	LnEQdUxesNJV6taCTGQGqqYtCAb7Q206/joWsJhnmrdh65P7fSUmrMmrXOoLug==
From: Shuwei Wu <shuwei.wu@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1772947105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xFoQRbzzGJ6GQLY9ekTrem/KHliTwSgfflqFnYv1J1I=;
	b=SfPvJb9OoCcu+7pDQ/6PzK0nnTzfuE+b6AGVMJO5+f4XPpO6eY2Y5Cotmglb3M6l0qZ70g
	WzasThc2w4qN56wg8IhWRlcFCyNqkROMUScDIRuMNvc+H1tjVfcgN8ITQMojUK84dWhzJF
	GEz9Cyo2aSheb3NPz2ABjTkBpk1Zhhr7pBcevbeqMxh5vIEW/zTEYZRtUY+TjGn4I2L4qH
	9aQAWvvr/bQqst97vgKM8nfOPYNEjutEAHWAUKkV74ymgsVDnE7Kkuonq5EeNiRvNFmuip
	SivYiEQUErdcdnrPPCOw6M9y6nZIs0sMIOypI1ImwJo3NTYXfWyAmidswJIBmA==
Date: Sun, 08 Mar 2026 13:17:39 +0800
Subject: [PATCH 1/2] cpufreq: dt-platdev: Add SpacemiT K1 SoC to the
 allowlist
MIME-Version: 1.0
Message-Id: <20260308-shadow-deps-v1-1-0ceb5c7c07eb@mailbox.org>
References: <20260308-shadow-deps-v1-0-0ceb5c7c07eb@mailbox.org>
In-Reply-To: <20260308-shadow-deps-v1-0-0ceb5c7c07eb@mailbox.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Yixun Lan <dlan@gentoo.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 devicetree@vger.kernel.org, Shuwei Wu <shuwei.wu@mailbox.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772947080; l=808;
 i=shuwei.wu@mailbox.org; s=20251125; h=from:subject:message-id;
 bh=6VCLjpSEVcMWlsqnU3sm41GHeCIIDj8fxsmOYwSNfLc=;
 b=YNWJKGrDi++1MHi41bxD8v2brnggQZzBMTXXEScsWmdBco7Lx1xhqOA9txUyDPZ8PD9Kp8QBw
 /MS4ASbQAHmADzG0L8bQSr8hZx4hhPFhgDS3LqzFTO2MgsxZ9Uo4kau
X-Developer-Key: i=shuwei.wu@mailbox.org; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-MBO-RS-ID: 03bc9bd0b2123aa0cdc
X-MBO-RS-META: nabprw15aooh1m1w5pegnzxrmoiopiad
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_211837_135455_BADC5A53 
X-CRM114-Status: UNSURE (   9.45  )
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

The SpacemiT K1 SoC uses standard device tree based CPU frequency
scaling. Add it to the allowlist to instantiate the cpufreq-dt driver.

Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index a1d11ecd1ac8..d22198d33b7d 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -81,6 +81,7 @@ static const struct of_device_id allowlist[] __initconst = {
 		{ .have_governor_per_policy = true, },
 	},
 
+	{ .compatible = "spacemit,k1", },
 	{ .compatible = "st-ericsson,u8500", },
 	{ .compatible = "st-ericsson,u8540", },
 	{ .compatible = "st-ericsson,u9500", },

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
