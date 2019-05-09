Return-Path: <SRS0=homq=TJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC0DC04AB1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  9 May 2019 11:11:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC6AD20644
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  9 May 2019 11:11:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AZ/K7Z+3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PEP2HOwr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC6AD20644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0//JDm6lIhbTpbDZRdLh0SMscT0jq0CgALZ+T8zbAbU=; b=AZ/K7Z+3oBHSKnAUIqbTGkch0r
	Qqo++Kn3whwGA9x0MPTR8Dh0ridOrDc8Ta9p0Yc9qf0Wyjs+VJC7Y9P2xPfOPKin+arjf83l3WPVa
	vtlV+ZJ9jHJzPL799vh8XS2IvuBkSO6pyVteDT710B/v2S16aN0CbjK3qhNEkVc2fH2U9SxewRAIK
	gmGBSbdAAHNIaG07ozzFNS83GCcnucmQZ6chcM1AU0lAtrlVswez4aVJ5C/RvqDcrBA/e4a6EHvq6
	qJXoHeU5M5CqzRiNAeXZBXUSJ4uf3FaIUQrz0Xf7Kr2gsjb5qNrURIbB5vrA/flm+DVwpW8W7hygA
	Cq1vYIVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOgxh-0008Le-Us; Thu, 09 May 2019 11:11:41 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOgxY-0008D7-WE
 for linux-riscv@lists.infradead.org; Thu, 09 May 2019 11:11:34 +0000
Received: by mail-wm1-x343.google.com with SMTP id o189so2766218wmb.1
 for <linux-riscv@lists.infradead.org>; Thu, 09 May 2019 04:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=b6Iva+4zZfXyJB7DwiHORWnnmSZxQ4pOGmjZY+dIVDQ=;
 b=PEP2HOwr8dTpKTODv67FCdAAeaMvo1GbBsvxZpvan9VHumzGIEVdNmEI/4KPNTV9F+
 i8WZY67DFmzBQD8mteV3ZcgNP8wbELue3o5z+BTWPS+dia1PvYOQ0pxQBN2jZUwnguzV
 NNaohDH6j58oyGx/i9QS7ZlFuY7P5frzcx8xWMKIIcT19+mqLHldvo6OXxTpNojki+Jj
 9VjC897nYoFTMl9I8Lf08Fw7F59MXsB+kWKLIHzTqbrPOB9NB3hpSEirz+FTR1ZPQEbG
 PC+/m7SYv2EeOY6QpUMjpAnzHZ83kyYGvx/+1iVvRIzZfJZzCvSfBbJRKeoqKANyxm78
 uIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=b6Iva+4zZfXyJB7DwiHORWnnmSZxQ4pOGmjZY+dIVDQ=;
 b=akaaecj/JjNl/hyoTc+JsZzvb3vcgDou7oeyPHtaVmpSzhtZlqOj6AVAh5fqRMRc9l
 PorFQKvGHhnIPe7bXzTmUqUhmT8V/OItSGVwplstnlS87jfaX7GirA3mxZeZKZg19tS/
 zeHe6pufjNM1GUHlM1/Mpw6CKXVqbzce8H/WYuDCdG8/AIS5NcftysY2v/9cHKvsmhJW
 hDKzUblKYhDrkFT6b5psyX+kS0gTJ7pVLxv62j+IbmpkknPJvHn8w6bbWhM2pcctLgAq
 1e1XpPcWxl55sRNHbPpCjwd1BM+6wiEE0xzsAPlbbHpBC3XvRKJoPSSvzo9TdzXgVvRP
 wq5Q==
X-Gm-Message-State: APjAAAVpgxRiuuoasIaxL4QSRIqxdlXxvblFSSAINMW9XaYTBHRFx0da
 R49M0gSXX9hUvBAj8QmoOSrtOg==
X-Google-Smtp-Source: APXvYqwUjrA5GwivQYe5DoVtouOCccNByFOr5x2N6wy3cB+tdL4j1tDBHoNVzOXcIWE7M55nD4qIZQ==
X-Received: by 2002:a05:600c:40f:: with SMTP id
 q15mr2487200wmb.92.1557400289207; 
 Thu, 09 May 2019 04:11:29 -0700 (PDT)
Received: from mai.irit.fr ([141.115.39.235])
 by smtp.gmail.com with ESMTPSA id z7sm2299778wme.26.2019.05.09.04.11.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 04:11:28 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: tglx@linutronix.de
Subject: [PATCH 02/15] clocksource/drivers/sp804: Add COMPILE_TEST to
 CONFIG_ARM_TIMER_SP804
Date: Thu,  9 May 2019 13:10:35 +0200
Message-Id: <20190509111048.11151-2-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190509111048.11151-1-daniel.lezcano@linaro.org>
References: <7e786ba3-a664-8fd9-dd17-6a5be996a712@linaro.org>
 <20190509111048.11151-1-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_041133_066939_25703201 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: David Abdurachmanov <david.abdurachmanov@gmail.com>

This is only used on arm and arm64 platforms. Add COMPILE_TEST option.

Tested with 5.1-rc3+ on Fedora/RISCV. CONFIG_ARM_TIMER_SP804 no more shows
up in riscv config.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 171502a356aa..ede5d20299b9 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -379,7 +379,7 @@ config ARM_GLOBAL_TIMER
 	  This options enables support for the ARM global timer unit
 
 config ARM_TIMER_SP804
-	bool "Support for Dual Timer SP804 module"
+	bool "Support for Dual Timer SP804 module" if COMPILE_TEST
 	depends on GENERIC_SCHED_CLOCK && CLKDEV_LOOKUP
 	select CLKSRC_MMIO
 	select TIMER_OF if OF
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
