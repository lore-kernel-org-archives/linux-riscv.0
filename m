Return-Path: <SRS0=UFm3=P5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAC4C282DB
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Jan 2019 10:21:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 320BF20879
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Jan 2019 10:21:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TBlhERIY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MvuzBS9f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 320BF20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=HUp7cteG7bpbFEFxwHRyjIstdNwENQiJ4vlqiq/eCAI=; b=TBl
	hERIYXWZ5qZjwURIZjKWqzAmZBJW3gmlaLu0zrs1JIg4oTUc/l0ODeu3SeT5Qu4h4BZXzQk0cr0zr
	eaSUw1KtJJuHlzFjXJ9XYDnwvBdE2UeJE1AgfaYnYX1Yg9wG7yumh+2WG3Qoy9I47cqYInsscpBym
	rgxdCEVxp6Uuq7MjL/uZlSBvpwhIZhj5S1n/W/jq1hKBM9JTRVt6U4vV4HnO+vwRiQb5u38zvSBr7
	7hShqNyAxQYkWbYu+MJyxfSLQI5OxaguAvj4YK6oC0Sw2/jZ2M49mx+tlrTLtjcaJFhRABdQQPPqs
	fHf6wqFy3pRn1Gz+5UQAPvHndbvMlIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glWhY-0005bk-8P; Mon, 21 Jan 2019 10:21:08 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glWhV-0005bO-6N
 for linux-riscv@lists.infradead.org; Mon, 21 Jan 2019 10:21:06 +0000
Received: by mail-pl1-x643.google.com with SMTP id gn14so9612872plb.10
 for <linux-riscv@lists.infradead.org>; Mon, 21 Jan 2019 02:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=ussECRD/mXUu7sFZh4zdG6qGENVe+0LQr/6NdK4aNFs=;
 b=MvuzBS9fsHQhKFhUsIbgcHA0g9NYkwADSoW/GdcjVY3MyuK8ELLT20OkWBbyNsivGW
 sJvbbS/J9mYzYVzgzzpnmrBJNIcu8o/nU1w4OizPlK34cxaeRQGPWIIRlRxidalaVS68
 Aq8WDYTkcXg3xj00KfHtRfF1XgzEXN0ExwG5z8dCqO64Z/6G8Qdg+7kpi47aIce6BHpu
 5APBEgChmmVylj1IqM7FMdSij7tt0nslWtBsaXstZ5yNDxwpjlVEcnYcmulEvrCG1kdC
 xOIpmXO4u0PoO42ZO09QhIRVSHbhXMqqXHOP30Ntx8lI3JW70uyTs8E4MegeL4WbB8Mo
 Biog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ussECRD/mXUu7sFZh4zdG6qGENVe+0LQr/6NdK4aNFs=;
 b=RgDZZpNhGOT8n3QIzar4iVsnZKh2KHElC15fF9GUehVE+OZzWXp+zrC5dOth3w67PM
 6Fyb19Pk7xt3jBwnisrq6WUSo6qxuBYeGdTiTtOCBHvqGv6VcPRyh1weMIIFB9Nd/042
 9O7dlALRRsGd7L9/O575rZuvAa2H3we6METJESeE+9RSqJG0KsrYmVAo8LSc0h2qWDFO
 B/FcObJ0k/iZNIUuHFPUZ/NvFrAit4ccAPCIY+JhsT0QjtJul9SWSPJkMFXivCe8C73Q
 glIUk6lFm9nlG8ioFbiLwN+AjtP3Ee35t/zVh8WZ6iO/KtAZSH5Hl9nFNleuV59Fj/UI
 vDLA==
X-Gm-Message-State: AJcUukdQwtRDmAGPtlWgfqFGg1txacCh21vZco1v7O9DDvah9wsi+ffS
 HzZr5PykrVbkJoPmRoYBl3alAqnxUXo=
X-Google-Smtp-Source: ALg8bN4F8SM0jOq9s8SrKkgl8Cfqe/F6xesVwzUODKS0dHpf7Ue4iUk0mcvIRfAWTM/6ANm+h+a4Gg==
X-Received: by 2002:a17:902:7e44:: with SMTP id
 a4mr29604824pln.338.1548066063955; 
 Mon, 21 Jan 2019 02:21:03 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 m85sm20048874pfj.171.2019.01.21.02.20.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 21 Jan 2019 02:21:03 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v4 0/2] PWM support for HiFive Unleashed
Date: Mon, 21 Jan 2019 15:50:41 +0530
Message-Id: <1548066043-1252-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_022105_263641_7E58B888 
X-CRM114-Status: GOOD (  12.42  )
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

v4
- Rename the property sifive,approx-period-ns to sifive,period-ns
- Rename macros with appropriate names
- Remove unused macros
- Rename struct sifive_pwm_device to struct pwm_sifive_ddata
- Rename function prefix as per driver name
- Set deglitch bit before changing output waveform.
- Other minor fixes based upon feedback on v3

v3
- Add a link to the reference manaul
- Use appropriate apis for division operation
- Add check for polarity
- Enable clk before calling clk_get_rate
- Other minor fixes based upon feedback on v2

V2 changed from V1:
- Remove inclusion of dt-bindings/pwm/pwm.h
- Remove artificial alignments
- Replace ioread32/iowrite32 with readl/writel
- Remove camelcase
- Change dev_info to dev_dbg for unnecessary log
- Correct typo in driver name
- Remove use of of_match_ptr macro
- Update the DT compatible strings and Add reference to a common
  versioning document

Yash Shah (2):
  pwm: sifive: Add DT documentation for SiFive PWM Controller
  pwm: sifive: Add a driver for SiFive SoC PWM

 .../devicetree/bindings/pwm/pwm-sifive.txt         |  37 +++
 drivers/pwm/Kconfig                                |  11 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-sifive.c                           | 262 +++++++++++++++++++++
 4 files changed, 311 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
 create mode 100644 drivers/pwm/pwm-sifive.c

-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
