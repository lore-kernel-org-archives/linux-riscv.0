Return-Path: <SRS0=TVEx=RE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1467DC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2019 10:53:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D65DF2087E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2019 10:53:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iYj+yoBS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LsF8PBSa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D65DF2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=PQnKb/ZZBwTDfKZq4ydZxkei6XYdnN66YEg4ZXcDbz0=; b=iYj
	+yoBSy6ZYJwCCfqQCuAc1Kle9wFuMZIO+tVgdsPknWC/UnYX6C2rd7nrMOEIegXut4ciFoHct4n8c
	MhlrLyD6XG/GItLlJuT5esFbw3exXjGBQ/nccmj4JzX4uJNVjl2qME3Uql1807Pqe7aRxuBMWMQ3T
	R3VVwwpC2BgkWcu5uCfxht1cHcspnhkWnu7IBGdQfD+teHIDIRYjWq/N76TtXPFiiMzmZLbP7csOx
	XRGMouRCl1ywcuBi17Dech7lJJcB/oln9jmFUlRrDo3O3lGl3SonrmWFrZqTNG+CdjeiNbSewCb4s
	MAC3rxKYBhhl0eqYyPflLf8h/jgDsjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzfnU-000491-CS; Fri, 01 Mar 2019 10:53:44 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzfnR-00048b-Tz
 for linux-riscv@lists.infradead.org; Fri, 01 Mar 2019 10:53:43 +0000
Received: by mail-pf1-x442.google.com with SMTP id u9so11274850pfn.1
 for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2019 02:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=3fRrDsmK1ByhQ9oou21D3uLddzCzDQbGOSeHbzpJLTI=;
 b=LsF8PBSaxbY+fPYf0z4vnlbsuWkfE2mmWCOSOVevDJlJ7aFhtU5E7yHlG1Yf/o3fCU
 6itZ2jdL3AX7YwJ+5t9Yv8uD2dXYaW7AXJywIyiF3ZkpsaXaLyLjY+jrXoDlfGU8WqbT
 joalnXSOvvdUie6GDgmLK0kRASMTFHf1Un+WUgoaG7is7R10Ppjo45N8OpUJ0rOTBXi/
 Ke87bTRstjOZ+Ory7vk4XjplpUT5+fXAeQBGthqkMbbEy5ZYWuuK+ZI9MiAPLAmTOkT+
 Ez0xT0L6Gb+dcTAzZqB6ZmoXHD1RqyzII3f5kQVuV8UqbE69ZyK8QObuEnJoxwRiK+08
 44gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3fRrDsmK1ByhQ9oou21D3uLddzCzDQbGOSeHbzpJLTI=;
 b=QKgYEZ+9R2vnKg6rKCf0fJOtYbDCPo6RSZxmE+TkEkwwPG2ns1lSPYpWmwg4WlE1wj
 jbbjdnHDevjbyMcIZ2sRZoHu3t11UjhdwS9PchGio3Kl61bIjpe/8/+mfyGBHqilWAUX
 SSO4StwG8jWnoPtRBcI/W1aJ1hBd75UCBqKbfBFyd1ElWC7bYhg2eZQx+EW8LdL9Pyot
 DiUnU0xHKMww1QKn8b5LrxePxJ1oH8DEQo1hsY5Md0CWo3RMkvq+pGMl8Ab7raTQxLUr
 gamEXLFIS4xUeltKv2s2yfYCrGiLiJqD83V4Kiy2YxMBWKkukGoW1zcUYB9mGXzeHBqL
 ZHBQ==
X-Gm-Message-State: APjAAAXddiIa2MJbKjdCsBloQk/nkWS8rrbCfj3W8Af5o+tM6ENmJBnN
 O7tu6rRQYKFh7tDZTyiOQMsQVw==
X-Google-Smtp-Source: APXvYqxmRvaIlL2QRp0LXXjmWsHxks8Okf2Ow661yCdYgpG5PgIopLk8QDFeOFRzLvRs30EGbs5QXg==
X-Received: by 2002:a62:4287:: with SMTP id h7mr5023925pfd.110.1551437620632; 
 Fri, 01 Mar 2019 02:53:40 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 k74sm49239164pfb.172.2019.03.01.02.53.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 01 Mar 2019 02:53:39 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v8 0/2] PWM support for HiFive Unleashed
Date: Fri,  1 Mar 2019 16:23:17 +0530
Message-Id: <1551437599-29509-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_025342_010814_07B9EA5C 
X-CRM114-Status: GOOD (  15.01  )
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
 drivers/pwm/pwm-sifive.c                           | 345 +++++++++++++++++++++
 4 files changed, 390 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
 create mode 100644 drivers/pwm/pwm-sifive.c

-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
