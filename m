Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE24BCD128A
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 06:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5op4Zn4PIHqrMjL0BEHhU1l92yU+ZabxoRS8/YyXy5Y=; b=uAnSqfQtFAwJz9
	RYcurD0WdjztXHNSNWW9vGCx+LTS9/tdSVpVY6LmJ0HsELca5pL2y7IVmOnRDdoKu7utKAmhc90/r
	Nlxv+39NmUbrMxn/XBRsrgDIBqfKKeMcgD/ef3d8j0zungUXJVvJLWkE3dg4Jx5VALGvBR444x+Q1
	Iv46uW4NpBJD/vNywsA0FqfaoM8c8rEYSKjSEIX6xei9eTQy9SBNDW1i8X5p3iueaW3CQg35uZogn
	aytsHmU6GaQPij9MxBR8GbRwLAVG7X0CSYYjq1zOpBAeff2vWG+0iwlOXQLVhMgJ88wCwN9E9SVBm
	tTDlbE26cosDuWjk6CBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rszdO-00000009oHT-2bhu;
	Sat, 06 Apr 2024 06:34:38 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rszdK-00000009oF2-2FB3
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 06:34:36 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5c66b093b86so3003002a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 23:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712385270; x=1712990070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HXg1HzMY1ws0HrUT2NKFnF8qZY/gmV174Rp18+QBW4Y=;
        b=kGTgb7Kg96onvWJ4ktov1KoKH2KQraPeN6Ilkcq+qDOGRilZ6MnD8NPIrI/KIPsILp
         afoP6xgf0SMsAF4KI/Qx2cJUqfm1CfpEA669ehPw2YfqdF8lQ6jEfkvjL3vbNUrZSCpO
         DVtGk8xC/rRJCAyLOnft8ZUwTxeS4MQQhP9w7MpWktZYS0hvD/SCucvC5vr7UyxMuScH
         Ycnm/TUL6ZNnmPy5pGpYqgHsH12VRoD8/Hy4WgEKQkrezyWotsSzgYXF4Hlwk+Ml7QoP
         V+XSAX7TtRoL6Ab54Fs/aO212/hp8oPQyn2AeOrrkz+WaheDgVIlzq0vmv1HHDQ0wqEQ
         0INQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712385270; x=1712990070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXg1HzMY1ws0HrUT2NKFnF8qZY/gmV174Rp18+QBW4Y=;
        b=KEu3kvtLfMnfEvrO1imtjjUr6MRufWAkR1813HO6wDesg/PoE10CXgZ1Vx8/8hM3Tc
         jKmSSKipUceUxlICgyOAe9U/n+Ud6IYyGVvnS1a85DDkS1wGKyqbZx2E+rmci3RMfTnR
         3yXn0PUxClMqCE1z6zzpzjUhmJgASkKD4nVQMuCob463VIZNYdbc6u0/VpekRXTNgmY8
         TbxJS/xbU9Z/ey1SyDng17z12B9MoBeoTXWisjYQ8eqLLfhqb2o57KPa8WEZHgocUFSj
         NtUviJX5bW7OOfePKc0waobcSCuvSkajPFdMmSz7aOmhQFiyclrU1VwYRTvaY1ddT5+Y
         fSgw==
X-Forwarded-Encrypted: i=1; AJvYcCUKnuzrw8e+QHpiwHs8KEBhxHFaZMzuaovchrpfR4zkk0EH6sVR+srpmbEQKcpVGRJrgHoOUjyvaDDTKGC4KskJYmsI75W4qkgOSCIrQd0V
X-Gm-Message-State: AOJu0YxKqdMoy2J3u3kbPdP/UOhKcTckSPoKGrk9uEk9ddSpAN9+SavY
	h+Yq+qRSctp6wC/BXLVeGJXFJfMptMXWQds+F1gW3xtIsP0ENPWj
X-Google-Smtp-Source: AGHT+IGDyqBgNFFll4mE4oRSotvuKucjZDNVPTEEuoznkPGqJXeFtlRNdg2zCa20QKWjdZdYJc5HcA==
X-Received: by 2002:a17:90a:c293:b0:2a2:fec9:1bbd with SMTP id f19-20020a17090ac29300b002a2fec91bbdmr6076126pjt.17.1712385269834;
        Fri, 05 Apr 2024 23:34:29 -0700 (PDT)
Received: from localhost ([46.3.240.101])
        by smtp.gmail.com with ESMTPSA id ei24-20020a17090ae55800b002a386a4d6b0sm2367991pjb.6.2024.04.05.23.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 23:34:29 -0700 (PDT)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: u.kleine-koenig@pengutronix.de,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: [PATCH v6 0/2] riscv: pwm: sophgo: add pwm support for CV1800
Date: Sat,  6 Apr 2024 14:34:11 +0800
Message-Id: <20240406063413.3334639-1-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_233434_690689_079D58C4 
X-CRM114-Status: GOOD (  13.69  )
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

Changes since v5:
- delete the OE function because we plan to use the counter subsystem
  instead of capture, so there is no need to reuse this code.
- fix set polarity reverse error.

v5: https://lore.kernel.org/all/20240314100131.323540-1-qiujingbao.dlmu@gmail.com/

Changes since v4:
- drop filename
- fix macro
- optimize cv1800_pwm_set_polarity()
- optimize cv1800_pwm_set_oe()
- add comment for cv1800_pwm_set_oe()
- use ticks replace tem
- fix duty_cycle larger than period_val
- use devm_clk_rate_exclusive_get() replace
  clk_rate_exclusive_get()
- map linux polarity to register polarity 

v4: https://lore.kernel.org/all/20240304085933.1246964-1-qiujingbao.dlmu@gmail.com/

datasheet Link: https://github.com/milkv-duo/duo-files/blob/main/duo/datasheet/CV1800B-CV1801B-Preliminary-Datasheet-full-en.pdf
page 614

Changes since v3:
- use macro instead of npwm number
- add support for polarity feature
- add support for Output-Enable/OE feature

v3: https://lore.kernel.org/all/20240223082014.109385-1-qiujingbao.dlmu@gmail.com/

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
 drivers/pwm/pwm-cv1800.c                      | 296 ++++++++++++++++++
 4 files changed, 352 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml
 create mode 100644 drivers/pwm/pwm-cv1800.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
