Return-Path: <SRS0=rqMp=RP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A31C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 08:11:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D739E214D8
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2019 08:11:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qX4DgVW3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Oxn2sPg8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D739E214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qbaKkDUzmDVCypYwYoIZsWvuMku0r/oC1GRCXhf7BdM=; b=qX4
	DgVW3W2g1/ZDEBd2IAQH1i1OjsyPMBce5I1ksnrEqr3GK8MQ3HnzpGBl9ja8IgOFYLBKwq8mclHCA
	+7a/QkhyYkcGBvBFcWTqfjwjteqG4rtDJv+d6Vhx3cFuDjO9DqRdxzDe534y8ws5jzrXywNoCbRfG
	UutWBzzd6PK4XLLaKg4i15++lwubY4zdQUbyK+9+mFB4ligiOEpldcKVWlGhvIMSq903BvspnxgEm
	5cFidOEoTQooY6Om5Gvj1UJbSzSHP2ypWy5DOjXK4SSNUYTw36TueFKhTeMQlbiJ3twaNDyvHPONQ
	Uo1dko5o7alQEIn6Tub43lxr9NxHLEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3cVp-0004Pi-F5; Tue, 12 Mar 2019 08:11:49 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3cVm-0004P0-VH
 for linux-riscv@lists.infradead.org; Tue, 12 Mar 2019 08:11:48 +0000
Received: by mail-pf1-x441.google.com with SMTP id n74so1243698pfi.9
 for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2019 01:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=uR1gAPnmRxr5NSTo6n1j0Gxqlzn9eYUSnVyB9MH1y1A=;
 b=Oxn2sPg8/a4tvXYzBi6bMt2QtXR9ucK6nQNzoF/tNlGKlwsNvKQ2pH8G3eOCbFWF9p
 /wpGovgX5Kl0WkA5hV9zYprYcj9mJmFcBJn0G7naZZn2uy9QanP0jCVbD4523UqOkodj
 bpsmJuEDftRDsYwoSsfY1xndBoIBt+BOo+wiczbkiTTh8DkNT/UwKqZLI59te0apDi75
 cl5vKNvGHJjharHggTFMxnQg0jb2YbL6Ix5KZq4YOfiPrH0QSPRGoaRCTdmbxNQthmNu
 S8eTH3mXJ6USs6hlUH4+dihHaNrIkdmVwlRJRJnkrB8CtCRxjxICqXbfwMQVB0t2Vbcg
 es6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uR1gAPnmRxr5NSTo6n1j0Gxqlzn9eYUSnVyB9MH1y1A=;
 b=lpccYReo/zNnSajdAC1yjHc41EsPE+4Goepn1AE3LZTICB+f1uJMLpXsJ/mb+6BI77
 Re7qhF4gP3Tz1F79eMPDlfWoJ9OUE/udCd4RCvh7p1cihwQLo+WHKWk1pw9HWz7fXWtx
 NYql0e1Tb4EAfwnqkDyM6bFWQarSrpbcwXcVhVosEZAc2ZvTbovvoKjJW9K7WNTIpl1y
 0iabUydXYTgv9Qy0ttdfupkQ30670OcOq9PxfDwDr/Cn5HybsyXsD3LTApgaL5xxLYxM
 A3kGmsW6ySPO8+3bAhnRSIJ4J4/f7k9B38qUu3daP3ugKLhbA3bK2BGTXGiWeXg17u0B
 SFPw==
X-Gm-Message-State: APjAAAU8mFmJ3iJX7p5JSuqryvr3KqjwPSKmGtl72DxB3MaHD3bkrSui
 TIleW9PBTKue1zRGLfl9mD2BQQ==
X-Google-Smtp-Source: APXvYqy6rLqxE+SeKcyPKJOjSbAmd6+2lAup/y7OEH/09TNmGLAN2LtbEe7ciIOGpGB4At9CtDZLBg==
X-Received: by 2002:a62:560f:: with SMTP id k15mr36896540pfb.231.1552378304495; 
 Tue, 12 Mar 2019 01:11:44 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id o5sm3687795pgc.16.2019.03.12.01.11.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 12 Mar 2019 01:11:43 -0700 (PDT)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-pwm@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v9 0/2] PWM support for HiFive Unleashed
Date: Tue, 12 Mar 2019 13:41:27 +0530
Message-Id: <1552378289-27245-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_011147_070053_3C341E3E 
X-CRM114-Status: GOOD (  14.89  )
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
