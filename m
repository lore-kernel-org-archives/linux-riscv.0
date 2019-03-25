Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66728C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 10:13:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38E0F20879
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 10:13:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nDWiKXop";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SZrZbABi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38E0F20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=KBOaRiKpuukN05hejky4+OXCcL4Ksz03szeRQgu2JE8=; b=nDW
	iKXopA8drjaaofXkqGKLZejO/5YMdU9lX5/ykO2BnRiZuQTlMFebvXz79pJL6NKGz2zK0uI3qcfkV
	0ThtPq97VooyMjqOXHfX8UEGGpOHRT/chsqh402RVYr1DnHFYB8m28Appg39QMMKS7D+7S0DvtUDm
	LGrCQDZcjgscY9lRjH+TJP6jxQBMiEEwffzAG5b4KF1S4gJ0Tm2T8dsEq2Cm++52LQVIZDeBBbY9M
	DRjeHYhLr7sJfvq0PAYch7lMp48cMcySJcz9XuTgp2Ff5PB7OVojFPlKTf3sMOWak4C/AzcqWdkU+
	tKVhd94WZDb7OYgoB7gB0UnaajGSbEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Mbc-0000Cc-78; Mon, 25 Mar 2019 10:13:24 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MbY-0008UX-U5
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 10:13:23 +0000
Received: by mail-pg1-x541.google.com with SMTP id g8so6223698pgf.2
 for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2019 03:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=GMLtY2GdyWG9nrbKnq835v1bpH/NP2f++yUPdpGeCec=;
 b=SZrZbABiXkdtvhDsRc1WxVg0Hd7jjeXCe/sJEIOcOX6wXZCPDi9gUc2qNy+uTOEazN
 dMGRDVVisIevy3x0SlKbSJeuLfCOrnR7nZLjWBPCOiw/AzCgWLivzJarTdCySUJGz2NI
 Lp3LSNTv+XodtFDCY7KOxLi5JxA7US3/Th08Icr3ScR012zJ37f1yXP6xKL5tXebCa3X
 HPHcDJscpl/yIZKBKds+mAxvVNFKq6oc0medOPY8QSzTzIw7A+/JSxdhM/4DyMIt4TgE
 xfSB/4FhVhvCGSJzwhcy8JwJO17M5OuboYEYUjufsBpYmkrxWxO+CldEyZAgHxu2ZagP
 5FUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GMLtY2GdyWG9nrbKnq835v1bpH/NP2f++yUPdpGeCec=;
 b=UhRGsVQYDfq1f4xhAaCzbY4iJA8uAkuxitKd9i5RaVu16qvyePSOuQV7PIDbChHEjh
 c7+8ZfgTNnPoIE4J7kqAWCeuLyZwuoJp7tPlUOWw4bXGxRkuotHZcRisM5e2MDjt5BwF
 hd45fB/k8qOfWgN735+vp8/lnbXX1wY3L2Isn2BJJCii4ID0hV9o+tQxbEzSHkBGAINO
 EpeE/0j0X7/TwvjtVE2GM7cs8wT8u2n6padF0l3XFsaG4qDKeIjvnY9NS0abYsUBqTGJ
 ETM2Ijcfh1G09dn1ELxd0e8F1Gmntixb+PsA/LACbI8rIvvqRD6NvooZBxp8Q7+LL7uC
 GTBQ==
X-Gm-Message-State: APjAAAUFMMlWYpdjeDE51fCn1X9gprRQCOh5VvnlJ2dMcET54mEQpBgG
 eNXnXRmGwYN+VWBEkMbUrJ/Hog==
X-Google-Smtp-Source: APXvYqzXmUosXuZwyVc1SD/1egp/DQDVX1Y0hJ70xgxB7mbHyy8wqSpOK/TmEuszhmSX5N3OTrPTOA==
X-Received: by 2002:a17:902:be04:: with SMTP id
 r4mr10918931pls.218.1553508797866; 
 Mon, 25 Mar 2019 03:13:17 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 v82sm30151298pfa.170.2019.03.25.03.13.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 03:13:17 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v11 0/2] PWM support for HiFive Unleashed
Date: Mon, 25 Mar 2019 15:42:57 +0530
Message-Id: <1553508779-9685-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_031321_019893_0AA39CD6 
X-CRM114-Status: GOOD (  16.47  )
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

This patchset is based on Linux 5.0-rc1 and tested on HiFive Unleashed board
with additional board related patches needed for testing can be found at
dev/yashs/pwm_5.0-rc1 branch of:
https://github.com/yashshah7/riscv-linux.git
 
v11
- Change naming convention for pwm_device and pwm_sifive_ddata pointers
- Assign of_pwm_xlate_with_flag() to of_xlate func ptr since this driver
  use three pwm-cells (Issue reported by Andreas Schwab <schwab@suse.de>
- Other minor fixes

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
 drivers/pwm/pwm-sifive.c                           | 338 +++++++++++++++++++++
 4 files changed, 383 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
 create mode 100644 drivers/pwm/pwm-sifive.c

-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
