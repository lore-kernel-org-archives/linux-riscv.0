Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980C5C5478C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 08:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xebEixLK10NTkzGTJ+/7C+kz062JY9G9+rhZVAg8+w8=; b=43NyRhcveos9zo
	dRekRHVkOs2/IfO2gvEPsyk6Y+u5ci3m2OsBJLXPdKalXx62h2vRpsBxIovBGoGVtbQINhtee66BC
	qEu8NHluFbNG7ihV0p9FHqCb6cvhE6VbgDWF3DNrl5aKDrApGyZbgAFL4PYEfpbnmmGQhDCrV/tBc
	xDnIwAxhvye+1ZCxlA7SMyZTmDbuBQ88wKUNozfgoA7/anEjs26OsYJ6KdfBJBaaq/pyvcPrfBToK
	xpUi2BaShRXY+svs18j3AyzS3wloRrvow62QHKMsLs7m6jBCVpdLIdulDdD1Z3P5Od6qSljbsUhzG
	GdBY/gWIRJVJQsIyYupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdQn9-00000008RXp-2RK0;
	Fri, 23 Feb 2024 08:20:23 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdQn6-00000008RWR-2ZQ7
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 08:20:22 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1dc3b4b9b62so5402045ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Feb 2024 00:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708676419; x=1709281219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sze53a4mLbAZrJRpXbT6ASWNWrGoWY6+1B710NM4C+0=;
        b=Y7rP3nfg46W3M25Z67rb8/FZKuAAC6cvwG2uta6VPfAqqdQBd6p7FA+zb5Qxh94YL+
         JqVLsauZbnb8KH9BjSFT2bcv1FpTbH60XElvKTCAkQnwmZn+hdA1PLw8lY88cFb5DHIj
         AYok1qNfE2nDEKZvJ53xnrGxFhZMgtheiOrrDfevpDt3cJt7D/IqUCX/vZafpF7/fi73
         nyfxHY3HuavpDdWcQaTXU1TdITuuUR5ka4ol1MsXHkBuawTjV4JO21VdK5+0SWvVjo9U
         iTOskMwwfiupRk4omo+PZnGj2LLNoPs/BjIxfNilCYko62CwB3IZbr7dTa+ILrqjP/cS
         gu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708676419; x=1709281219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sze53a4mLbAZrJRpXbT6ASWNWrGoWY6+1B710NM4C+0=;
        b=Zwf39Q+T3Ehpf7062IwZ3ozRkWqqsFNMTUdcwLtR6j764hO4ZfpavmEf99SvUWJVwN
         0zqllEXNcWmfeUSMW9GwQmy/JZXT1eTdpTwqGF4WexGoud2zMdHcLY0sgiIezfzmkVZf
         3ULU2dsFHqMMuLfTOGfb8zPZhGsoTuXFznZ1u//j1PLqF4ixE3UopV7xVROU9dU7a+VQ
         Erbhfb7SdNihxE5jfAp+dmavDVK7NhvhMaiRqCJkykbqxsPgzS4oj8nyTvdEjLNSe4TI
         GcNi2DMKmgdxTEsgPueHyYKCBlc/CzB5MTwGdrDu8NJ3ncJfgYBpKQ22T/2i5RFzM2fL
         opKg==
X-Forwarded-Encrypted: i=1; AJvYcCXAvj+sfDrD96cM6Me/5kCsqX+DaHH9kqU+p79IfDJForV/uVQEdxGnRP5tJ0jM0gvJ9TrdnBX4I9vvVtaQRyemHwf8lpfMpufSvqQ+W6Y4
X-Gm-Message-State: AOJu0Yz7BwNMaDeSCh1NJMY3Y37bxDeXRctxRz7vdq/yyv8YyseXkbgJ
	SyV7rENkQTCs4f+8yLczz3YdiW6FtLLJoxCQenjVTZlFKm2y/Myi
X-Google-Smtp-Source: AGHT+IHN9p03M6aIBHrqTTDGUkW5yhHqo0eDp/G/bUfb2CZSqyCXW4ZWKB5vivJP5QX2Ka3E7QQ6Hg==
X-Received: by 2002:a17:903:605:b0:1db:c649:cff0 with SMTP id kg5-20020a170903060500b001dbc649cff0mr5932075plb.25.1708676418326;
        Fri, 23 Feb 2024 00:20:18 -0800 (PST)
Received: from localhost ([46.3.240.101])
        by smtp.gmail.com with ESMTPSA id v12-20020a170902d08c00b001d9588f0714sm11163439plv.177.2024.02.23.00.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 00:20:18 -0800 (PST)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: u.kleine-koenig@pengutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dlan@gentoo.org,
	inochiama@outlook.com,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: [PATCH v3 0/2] riscv: pwm: sophgo: add pwm support for CV1800
Date: Fri, 23 Feb 2024 16:20:12 +0800
Message-Id: <20240223082014.109385-1-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_002020_694316_987066A0 
X-CRM114-Status: GOOD (  11.94  )
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

The Sophgo CV1800 chip provides a set of four independent
PWM channel outputs.
This series adds PWM controller support for Sophgo cv1800.

Changes since v2:
- use 0x08 instead of macro
- split if statements based on conditions
- in order to round up, first calculate the
  number of high-level cycles, then subtract
  it from the PERIOD to obtain the number of HLPERIOD
- use new pwmchip_alloc() API instead of old style

v2: https://lore.kernel.org/all/20240212121729.1086718-1-qiujingbao.dlmu@gmail.com/

Changes since v1:
- drop full stop from subject
- re-order maintainers and description
- pass checkpatch.pl --strict
- fix naming errors
- add "Limitations" section
- use a driver specific prefix for all defines
- using bool instead u32 in cv1800_pwm_enable
- check and set state->polarity
- use mul_u64_u64_div_u64
- use clk_rate_exclusive_get(), balance with clk_rate_exclusive_put()
- using macro definitions instead of shift operations
- remove shift operation on 0
- use priv replace cv_pwm 
- hardcode npwm
- set atomic to true
- remove MODULE_ALIAS

v1: https://lore.kernel.org/all/20240207055856.672184-1-qiujingbao.dlmu@gmail.com/

Jingbao Qiu (2):
  dt-bindings: pwm: sophgo: add pwm for Sophgo CV1800 series SoC
  pwm: sophgo: add pwm support for Sophgo CV1800 SoC

 .../bindings/pwm/sophgo,cv1800-pwm.yaml       |  45 +++
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-cv1800.c                      | 259 ++++++++++++++++++
 4 files changed, 315 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml
 create mode 100644 drivers/pwm/pwm-cv1800.c


base-commit: 801de0882d8a95aa1b1fe67df1696e037d785656
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
