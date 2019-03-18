Return-Path: <SRS0=/XvO=RV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06917C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2019 11:47:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEF5320854
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2019 11:47:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lqXUpAL/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SAbwpz8r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEF5320854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=p66Mxub+AkwrLP9e/+XfRjwxaxFH2AvA1dRE/w+IR9o=; b=lqX
	UpAL/9cYufYeGF4JUFN0IE5J1T1v6/a1AUGMn5ZXo5LiwwpHvqiYWANFq6zmymonI8xuDblujBKwB
	kUXuqVpdoVqWwgb+09QWJTDaLbHuZLzaawJ5Tfkyk63C59hsl28zmiAz3EfKG1zDBfCBNStJX0JR2
	eEDcp0caO+OztNsfoCs60l2yXMhjtoqY97Kjm7ushua0ZqRw0cD0dqcfXqqVmMEzib5e+o/r/kYMQ
	cmrh5QN+0+2/bU56LLj2a0vN/dR9EaujQKa8+wzdsaVwzJL3Wd8W5Hcbv6DUo/Diye5TvC3NE4+6O
	SPon2Fj1KKQXgWSI69vY99D6LaVTclw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5qk2-0004He-Oz; Mon, 18 Mar 2019 11:47:42 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5qjy-0004EX-Pi
 for linux-riscv@lists.infradead.org; Mon, 18 Mar 2019 11:47:40 +0000
Received: by mail-pf1-x442.google.com with SMTP id 8so7671353pfr.4
 for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2019 04:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=3IvVN6bHe9Zm36t3Y+tbmGkwIFb1zRc7DMqJgbAOWIQ=;
 b=SAbwpz8rOcLIu5bx6r3dCXj/pOctJyfExLq1swAZVP0Gg/afhCsdwFBEC68cHHfws3
 4gIlpQR+y7D0Cj+Z19yZyBeeu5UOdVi+MpCGr8jqYVea4uGUvHtU6Ya/vhodAhrUUD1g
 yt3spZlW/oYCRxNbSeMrxWbbFSOfpj/SeT/mBhepvVERzQY3cRoj5asKQzHZ2/o+YqGD
 RGMNNWmNZxFxcL4GWUMCyw5BVC28A94swCZsKo1Q14k5Mgu7XPN5rbYl9wk+1MuZHh22
 UfVIjtUi7HiNvdqFHr+AC6ae/nwHrsfmODM51aEkAdN/nvmqaqakLh8Fmnv+dNSLX8Z0
 2/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3IvVN6bHe9Zm36t3Y+tbmGkwIFb1zRc7DMqJgbAOWIQ=;
 b=QcvGY6WGcHRQXHAxXFotfBkcaN2bjDt2XjIgcWGQ5WhhoHu6ePVluCOqol0+pvP9OO
 sE1q7rz4bGSgaiIhaExltQOk8IoCA8PCFiYYXCebVKy+IBzrmZ/GqQu29FTOa4NsXZui
 Pzl3XW3gM3IDIoJIdQKaZn78TuPNIu+S4LcQ4HP1Q8g/juzOysrhpIwgVP52Qgm59byH
 1pzVve4EqA60dh/HzoKM57Bc8NUujxDrc5e2pFw9duqzhW8Erqmy40D0BlOJFzfklYnA
 ptqucorAmP+SR8Zv0kEmvB5cOMHw38lGoTDbCSSQ7BOd8lETNokrn4mAOG7G1NlYZStM
 b9Iw==
X-Gm-Message-State: APjAAAVxxeSihxF1nZfLaTJw0zh2/Zn1fg7zREWvpooog4ZX3Xl+N4Zl
 PE1NPSG6FlNE49wVfKCkFZ6ake/HIKQ=
X-Google-Smtp-Source: APXvYqwQoKz34wHhI/asX2cwSEGbZL6lTCuSL0ONgq7n8XuOeOQKjEhc92X46BFGGs+3RtTdr/cCpg==
X-Received: by 2002:a63:7843:: with SMTP id t64mr17366051pgc.178.1552909657742; 
 Mon, 18 Mar 2019 04:47:37 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id p5sm14403911pfn.154.2019.03.18.04.47.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 04:47:36 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v10 0/2] PWM support for HiFive Unleashed
Date: Mon, 18 Mar 2019 17:17:12 +0530
Message-Id: <1552909634-18757-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_044738_872567_D42A61D6 
X-CRM114-Status: GOOD (  14.99  )
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

v10
- Use DIV_ROUND_CLOSEST_ULL instead of div_u64_round
- Change 'num' defination to u64 bit (in pwm_sifive_apply).
- Remove the usage of pwm_get_state()

v9
- Use appropriate bitfield macros
- Add approx_period in pwm_sifive_ddata struct and related changes
- Correct the eqn for calculation of frac (in pwm_sifive_apply)
- Other minor fixes

v8
- Typo corrections
- Remove active_user and related code
- Do not clear PWM_SIFIVE_PWMCFG_EN_ALWAYS
- Other minor fixes

v7
- Modify description of compatible property in DT documentation
- Use mutex locks at appropriate places
- Fix all bad line breaks
- Allow enabling/disabling PWM only when the user is the only active user
- Remove Deglitch logic
- Other minor fixes

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
- Rename macros with appropriate names
- Remove unused macros
- Rename struct sifive_pwm_device to struct pwm_sifive_ddata
- Rename function prefix as per driver name
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

 .../devicetree/bindings/pwm/pwm-sifive.txt         |  33 ++
 drivers/pwm/Kconfig                                |  11 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-sifive.c                           | 334 +++++++++++++++++++++
 4 files changed, 379 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
 create mode 100644 drivers/pwm/pwm-sifive.c

-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
