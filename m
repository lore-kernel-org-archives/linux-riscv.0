Return-Path: <SRS0=eaTI=Q4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D449C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 09:12:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47EF620842
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Feb 2019 09:12:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OolA6r1V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ioBwx6qo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47EF620842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=C6lgNtkErLqUn/lPstBY3Hd9gTSrqbgexEFzoyx/aQE=; b=Ool
	A6r1Vg6AS4NTL3oaCWLIfsNUXMf0k8E4aBrCD2YqSnvWbJEug3wWDyKH/FdNTzOVDh2eA4acmqmgZ
	UaSKLNndUno9jGQz3HDd4ZSGv/xLNAfoA8FizmPJDIbZ1s1MmV4ZqqGo6SemfpeoNcOLrlwnP32f6
	YkiJfCGOzlUkKkjtVhOqeqNxPgeferJB647DM3HJjFP2rC/m+6t85mSGyMee/hEMl3Euxb+QMgCHB
	/imnTkDlikkKt7G5SD5FMuIi5SMYd+I9Y7FlpYJSDughfGy3kYbdHkBT4A5h3zhntYpRW7Q5uuh2c
	X62jLYrTZhu4PiYUZWSRb3PC9hbNKgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwkOn-0008LL-3A; Thu, 21 Feb 2019 09:12:09 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwkOk-0008Ks-NK
 for linux-riscv@lists.infradead.org; Thu, 21 Feb 2019 09:12:08 +0000
Received: by mail-pf1-x444.google.com with SMTP id g6so13432076pfh.13
 for <linux-riscv@lists.infradead.org>; Thu, 21 Feb 2019 01:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=Uz/zMpOi+KkAAuCzdy49uLhPPZ/Zw1nBx+ZgW775X5M=;
 b=ioBwx6qoiBtDvumbkahZu2HaZr24NCNmA8kAJj5Krt6RipwoeihHaPTgifgCc/qqI7
 gSSSW71USiWQDMilHKHY5kg5y0vOhjypMueYnTYwY83VhYW36faMKRlL7MclhYKQj2t6
 ng4FcLn8BZySFVX6zIJpC53cYY0KSuirjedZcsYyNLZgNhS/S7O3zp8NK7CkJ2fYB2IX
 yHp5iZJLSjdPXBhha8XpYUna9Ne4qSgFbcAm7IEZH/aWXFUkGfwJ0emdh/xl1r0uB+y+
 WmfzR9lW47Xegz+C6yQvYpp07Wcixs3NfQIxu97tj9WNBh3XYh8E24zi4t7r4W0LHflP
 uC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Uz/zMpOi+KkAAuCzdy49uLhPPZ/Zw1nBx+ZgW775X5M=;
 b=a0wKaLyqVmGhzA7yZ6vXLVaKum7ygRjo1KnfMiZIBxeWndK2uywFtAJdr2odZrPC2I
 MJfe9BGORU2Mq0/GcABz/QjlVDI+cN2xkVwcr9hHtHYCqkXqEPtJrghoHg+Gkk6f4e8S
 OtlkGeyPOXETyrj7gWohlpQCFgWlXVZSxePlYuvXXuAxJC+Gx45w+a73rU1gVvzhf2T0
 wZ/eq9mZrjVeA5TW1RvmZxu+sa6VGFjAjfjv7jOSHAIS2vlFU50IFFg/k562HZ0UqI1C
 9DMDI0H2E8lFf4Q6bKG9DREoa+5t++yDfEwWbmfbRMKT5SIbTONBsQRiLkzNYjyyWke5
 joZA==
X-Gm-Message-State: AHQUAuaP0m9Kf2LvqESUIbd9cOcJcsmMLM+NIiJTIcrqEK45OKO2DF3a
 U3vNavhD4SQsjTuXAEn+6SZGsA==
X-Google-Smtp-Source: AHgI3Ibth07YChFAPs3/OUxV3NfBarIcpy8ocqn1pHmPjyOajfzlDiCNLHCvksjnCp1RM+WhqDwDGg==
X-Received: by 2002:a62:3047:: with SMTP id w68mr25754046pfw.17.1550740325670; 
 Thu, 21 Feb 2019 01:12:05 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 i71sm66145208pfi.170.2019.02.21.01.12.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 21 Feb 2019 01:12:04 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v7 0/2] PWM support for HiFive Unleashed
Date: Thu, 21 Feb 2019 14:41:39 +0530
Message-Id: <1550740301-10097-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_011206_768284_47678919 
X-CRM114-Status: GOOD (  15.03  )
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
 drivers/pwm/pwm-sifive.c                           | 346 +++++++++++++++++++++
 4 files changed, 391 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
 create mode 100644 drivers/pwm/pwm-sifive.c

-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
