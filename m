Return-Path: <SRS0=/Bz6=PT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0566FC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 08:23:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7F1220656
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 11 Jan 2019 08:23:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oI973s0R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="H05KZjJS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7F1220656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=jDIsNdOx0ofnlQHrCXdBr7vNW4N71p8Fnd9H6hMIYfc=; b=oI9
	73s0RTwRv2q3EaXUO3KUF/mZhfJpWXHwOpClT3mZXpXgZVNYvCUr4/eW+UrVInjflUpGgD+CjZLht
	HUjHEGHJsz5LLESQOy01nqSX5d/LWmlKy1Q/x8C/kI8dJR5A6NZ7faZ70DboBoZwt/rPV8j7+ze4B
	Pwl7bjTBvgZ7Xq1vwEizGHKh5Eg4OMOT8JzhvuKvBmbPjtBKBD3FdBLo+/X5U6MLZuoTG/XR3DcTx
	ohlYZpA269ZI13xjGMcDoba4rz5PValxySTZ9taR6k51rUwJQltFasxYf6+8EqJzOC5ocUddk+Bs/
	KwrXShHPylXHPYKhR81bAHasxP8g+zQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghs5l-0003Wf-N0; Fri, 11 Jan 2019 08:23:01 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghs5i-0003Vd-Rq
 for linux-riscv@lists.infradead.org; Fri, 11 Jan 2019 08:23:00 +0000
Received: by mail-pl1-x642.google.com with SMTP id w4so6460886plz.1
 for <linux-riscv@lists.infradead.org>; Fri, 11 Jan 2019 00:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=kDMiPaYUT4VgzHbYInug12qE4tWw9R1XGGt+UK6pUL4=;
 b=H05KZjJSqmLJFac445dWUNEVE7I8+s5Qy5qaceY970OkeYWp5VT6JpHAG8PUGw8W9b
 TDDMs7JI+12Q1KdvA9FD8C1J8LkBbwfOrgWQUvG3fB8Ty/HFrbsySBR90rKwZIt9PC62
 eor0wrC76+dowlSzi9SHZVL2Fe2o8hOhH15x36AbisIevsVKOmVAMJoUYUBotQEavWSg
 3pSTHha21F4qNdYWbtX8naaLtBRg7T2a3ewLr3qRxJQxxMagUqIVfQjoi9PiEe8RYvxW
 TR4tOGh0UBZqFq17ZNydzVwHYbiJhCUh1xnYa1Ki/TUB16fd72Fo5UrxwnjdioCxokbf
 75rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kDMiPaYUT4VgzHbYInug12qE4tWw9R1XGGt+UK6pUL4=;
 b=c/NsAEu9pPR95h+tcoPBOPOZj/0s6PJ5UaL6yMr4JDTFbPH5pd05B6QgJKJQdd+2kF
 gQg5pok9C0GillcsUqQHpL7uTZ5JHPb3ztrjHx4gokcIvZ4GdE6XVakuz9X5NFw6FTnI
 Hv3u/fjFG/txlmOBwQhGnbF8QfHSC7i+YMzdXzu2uAxrscQFYmzoejSBoPIQvlU39poF
 vA8Un+nHmkT/biYog3OFndWvs1c8/eixwedImSJrx3eQunmVBdza+whvTYOoP/lTmb0T
 PAXLDbwyYPoIOQr1fOICfX/O5suHBzpRv3WGcXnBuw/GOaL9Z6TntmXShZGg1zNOfvFe
 IF+Q==
X-Gm-Message-State: AJcUukdk1yf9qClTaSDUfCuH2rhnUJWbjrG7l2N4AKRNpvnqwS1z0+XO
 fFjORA5E2siqHNfN6TBohSOUMg==
X-Google-Smtp-Source: ALg8bN4rf+UxOiY4kwmXaEWVQnTYrsvNpjguETEOBEyF28Uc4I8NoXay1kINgQQ8HI3xI0mdGTM0ow==
X-Received: by 2002:a17:902:be0e:: with SMTP id
 r14mr12915069pls.124.1547194977943; 
 Fri, 11 Jan 2019 00:22:57 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 t87sm248422324pfk.122.2019.01.11.00.22.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 11 Jan 2019 00:22:57 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] PWM support for HiFive Unleashed
Date: Fri, 11 Jan 2019 13:52:42 +0530
Message-Id: <1547194964-16718-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_002258_924061_120ECCFC 
X-CRM114-Status: GOOD (  10.34  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, thierry.reding@gmail.com,
 paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series adds a PWM driver and DT documentation
for HiFive Unleashed board. The patches are mostly based on
Wesley's patch.

Yash Shah (2):
  pwm: sifive: Add DT documentation for SiFive PWM Controller
  pwm: sifive: Add a driver for SiFive SoC PWM

 .../devicetree/bindings/pwm/pwm-sifive.txt         |  37 ++++
 drivers/pwm/Kconfig                                |  10 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-sifive.c                           | 246 +++++++++++++++++++++
 4 files changed, 294 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
 create mode 100644 drivers/pwm/pwm-sifive.c

-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
