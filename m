Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDF3C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 09:26:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62036222CC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 09:26:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iDTtLAio";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZqUogImA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62036222CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5NX0EOd+cfkDqxF3mPDcbyyMmp8mfWDvbNwzZIkTAfY=; b=iDT
	tLAiowcCQwoKc8javaFXHOTpHnc6NWbq5MkIUZ0jO7KxJD9naqfi4cPTzKczfGxNgXBcPmPckxwnm
	2DTh0mhHhHsZl0DFC8xmAbJnMfk1cZ75KdiSOA19lRYW8aurv3t+sSFCLZUfrpX5/CqXNH97dUrYS
	ztWQntBUMVLYAqjAPp8B6NgApIYEEaF6Pd0J7Pec3UZ2dWxboLk8WxBiLlefL9jZRFJDA/18vkcLl
	Hx4ePqEaRau2GEY3SZXAySnsQ7DiUK5hkKrJBgQrkEUwPRWNIKTjMk6iajgMEylvq4zXFZa3u87/G
	+LqhGOFojyQ+5rUuIPJmID6wRVyl0BA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtqoN-0006S7-Hf; Wed, 13 Feb 2019 09:26:35 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtqoK-0006RQ-Mv
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 09:26:34 +0000
Received: by mail-pg1-x544.google.com with SMTP id g189so875947pgc.5
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 01:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=zUr8SWKldEF6gVUMQuEkEMpWrr/VC2B6XExLDaAwFwU=;
 b=ZqUogImAXCzLKe4cs58noWJkKNaGdzd/69cpyY4r9RHJthIsBQIfouss8IF+Xn3hre
 0hyQnrWP1Tk5imN2x+bZBzjxLaCd1Ut/gkbp/36YkfpJOzklj4rfNhQO5/0yo+Zq65Xo
 77Rt/VCEpj3p8iGGHaM7YqfK5rggn/sSwCz6vNIgBwiaffZ6Kar9djzuIEaN5wWubxda
 df15Iv55eAhvjnFX86zqhWAPg4ZGejEU2T0TuLn3vIZ6qkwuKQQACLPOgXdaAi8i8Wp5
 wOGUtHhFDXFxiMgnr1fonQwt8urdaC7BqNN0RUZ21Jktf/TEwAPA3jzatwW4Z+eo2ViV
 LZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zUr8SWKldEF6gVUMQuEkEMpWrr/VC2B6XExLDaAwFwU=;
 b=GOeKsZjqXetS5nDOxlFIK6cISnEWBc2dNz8N1c8v0VBF9UmHvl+bTlRjiDXn4D0gSW
 Puo1wt+him+hJdlJKlfWIicz9QAhOjtLMD49/fNCfsenIwA5LgRvFClsz6NgF89bciT1
 eA6S9YxY7jVPSt0cayFkVOjOugEvR/xPjM8IsAjTX3aQQhNB76GQ1XkvAhYwEZae4AUX
 t875JmZYk+sAO1FyD3myXMM//1M4QaK8lsFvej5YOieL1bR6AhdoDUAacrhxFn/YeHhl
 irvFsB7keyCmUzPG4syWiob62fO2SximsvE09xzSoctC09BVHPJkdwocbFbA84+dpAld
 PO9A==
X-Gm-Message-State: AHQUAuZaUvPwKTtTafRPfP79/fRloL8YAE3d0eAW61IM7BoBn+BWclhB
 KUJNTz1Mv3ha1ohS/W9Zlumi6KPZO48=
X-Google-Smtp-Source: AHgI3IYtqFQlc45qRacptA2GmN/OvEGXDFwKydbdzUjqhBVbu8YCMriSH9gNJ7NvsLkmLOBDd/IHeA==
X-Received: by 2002:a63:3541:: with SMTP id c62mr8016429pga.191.1550049991254; 
 Wed, 13 Feb 2019 01:26:31 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id v75sm188875pfa.164.2019.02.13.01.26.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 13 Feb 2019 01:26:30 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v6 0/2] PWM support for HiFive Unleashed
Date: Wed, 13 Feb 2019 14:56:16 +0530
Message-Id: <1550049978-20705-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_012632_773290_0571D6DB 
X-CRM114-Status: GOOD (  13.50  )
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

v6
- Remove the global property 'sifive,period-ns'
- Implement free and request callbacks to maintain user counts.
- Add user_count member to struct pwm_sifive_ddata
- Allow period change only if user_count is one
- Add pwm_sifive_enable function to enable/disable PWM
- Change calculation logic of frac (in pwm_sifive_apply)
- Remove state correction
- Remove pwm_sifive_xlate function
- Clock to be enabled only when PWM is enabled
- Other minor fixes

v5
- Correct the order of compatible string properties
- PWM state correction to be done always
- Other minor fixes based upon feedback on v4

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

 .../devicetree/bindings/pwm/pwm-sifive.txt         |  30 ++
 drivers/pwm/Kconfig                                |  11 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-sifive.c                           | 311 +++++++++++++++++++++
 4 files changed, 353 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
 create mode 100644 drivers/pwm/pwm-sifive.c

-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
