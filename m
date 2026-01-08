Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5293BCF6A86
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 08:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W66yAncPcm5k4HhYkRF4fimuj1xuACjX/Zg2CGr0Bvo=; b=OoJlpx4YJhs95g
	WxSUoYQK7KbOZPJraGRHxVsnv4OobkkT9lVoD9yS+jspkGChLKT4W6kWuywhS5JESCc1Q6HD/hPW1
	yclxbA21SasvjOCnwUjiMJeWE513LdimwqVZyeJv4mWKw9haOAMvjNIbbE7L85bV9EXCkcL7DBavC
	wGwEkSxiPV4ARGG9jB12OsA+hRnA8/g8OzMi7ZeJmmxK+n8UtSorS/0S/qrQJRBwlDHA6Y0xlDCeQ
	8A5urFPBOvjlmFSC/1I+9xD08I5FGwKHG3OI4E71ew2UXMaCbK6rjpmPfLrB78tCsDXs0dbtD3i9K
	72zxVWOWgW+1cXQYGNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlqt-0000000GMx0-43Sv;
	Thu, 08 Jan 2026 08:58:43 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlqo-0000000GMun-39XZ
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 08:58:42 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2ae53df0be7so3785940eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 00:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1767862717; x=1768467517; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0YLNYm7sDAJHbYjTNraEzX4Le1VPIWBSAnfsbzRwqAk=;
        b=kY05B2YxoWyvQjOqqMATlR7FV8xTDriuNrFbveupUSx7CFe8FdS/mFVtiJAXBzuSu5
         A364OjW1298yva/B9Dl4a2wqXGmtRbLp10gvoVQVZOEqzHPuz8Lhk/uwdSrgKDd3ECsh
         G1wIHptjHc6gg5BNcdPDsSoeXsAKCYw/4drxxbZKus5wBVhH/A8Sf+4yaIrDvVZpY3KV
         Zfu0LBAau0jtGffne2hixRnc6R2hdudzUJg3uvOCLTAQSQiIrsdkEKxH9mYAeJntMFM7
         4HtdzwQCUY9gpo6g2txoXLY4AQKOayFt/EXRCrsSVZ4asFaq0R7Nh+XD6w73f+yW5blE
         tNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862717; x=1768467517;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YLNYm7sDAJHbYjTNraEzX4Le1VPIWBSAnfsbzRwqAk=;
        b=OdY94lvtRslb7PAxyeKLfaZ5j6c77REKlYE0/57qli/6HipngMj0/yDLpzKwp4cFpY
         ajt1IKZBuO+8EfEWqil058l1G5Ua0vTaAQi/XRJYy8tj4DwnW/+pWrY82HGVSmPox/2S
         8XsnsVqmzOKbUVcJHipKF2uVB/qimtkxPO79pjn6l1l18dzgd1q1XVZd4BLBnINvX1dD
         Q4Wz4rTCCjokZ0OkaRKHlVbu7MX+4CSb3RCyY6hrRCl+1OKrSh125PGG/w1iZJMv00JS
         oiEmmyHkS5cHyBr9RKvEwnn72PQBwfc+lcu46SUwoCb715GAukW0SOjesG+PIJ/oHpph
         NJZw==
X-Forwarded-Encrypted: i=1; AJvYcCXzT7Qu00zrTv/dm84rZx+DoAPHfgYEWmLYIP1fvsjlk++H3gyi+R1WGwxm0tDLBHh8cyv0w4TaDZ8nfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEICexxPPnapO+Ve4H1Oac0FYzI5lxCEv3n97ZToRKjw8sCQpV
	U7usZhzOgrI6ycC21/maYNsjABHtrm8+DLMJQFCOqwWb0TfInDQMxGp0TdRYOeU8OFg=
X-Gm-Gg: AY/fxX4ExNk36D+pk7df8b7RHPQVKds4FqltcQqtK1T8wPVSYSvtdQJFWTAYhfbBGJW
	KCPwLKH8QPU/E5m5FfLPH+DX9UpKcgQYJm3BdXl++1ikmj1Qv5uZrocV5uWOWI0VL9CJXYrKHcD
	dVScq4owTbOb/05XooGF+DUgmAjz0an8gK4JZbfUZMrcMudR7NpLVnthlARooBWN44RB3umEReg
	uCM0Z1tedgkdFZvi6Hdii65r/Cxbiq7mJoAJh0YbinzTk1A+TMFdyVCSrcQeaNW7/c9TUmVlSfP
	muYVd2s3/2JoNDJpQngUjOWXSuoFGNQOCrS4+HNWbBwuNagb4M/opwCyzUJ1gEudUBAHIidt69g
	J78E+asksoprjRDMj8obrdxQbDWphH+17CVotytuZ5dkcCyIyplXfehuJbpseGA9sr/NTz5xzVr
	L9b1HGRjvE/GgzZRn03ohJ8I4=
X-Google-Smtp-Source: AGHT+IE8UPhQsz/7Gn8i+wwXqoBhoOITsJ3Hs7nIToFk4RFrh69fxx3eoriotXBWNMydajNNbAyQiQ==
X-Received: by 2002:a05:7301:fd8b:b0:2ae:5b24:1cf6 with SMTP id 5a478bee46e88-2b17d30f886mr3883489eec.32.1767862717072;
        Thu, 08 Jan 2026 00:58:37 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm8833634eec.2.2026.01.08.00.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:58:36 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Subject: [PATCH v4 0/3] Add SiFive power provider driver
Date: Thu, 08 Jan 2026 00:58:23 -0800
Message-Id: <20260108-sifive-pd-drivers-v4-0-2a523d7d51a0@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK9xX2kC/z3MQQrCMBCF4auUWTsliSatrryHuKjJxAzStEy0C
 KV3Nyi4e9/i/SsUEqYCp2YFoYULT7nisGvApyHfCTlUg1HGaqM6LBx5IZwDBqlDCjoXyFmt+pv
 2UH+zUOT3t3m5VkeZRnwmoeFfUp0y6qjN3rXW9Bo1ZvaPNr3Ov3zrpxG27QPlXR2fngAAAA==
X-Change-ID: 20251207-sifive-pd-drivers-66de65108b1c
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Samuel Holland <samuel.holland@sifive.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Cyan Yang <cyan.yang@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_005841_164215_6E123248 
X-CRM114-Status: GOOD (  12.71  )
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

This patchset introduces the SiFive power provider driver, which sets up a
generic power domain (genpd) provider to coordinate with the RISC-V SBI
CPU idle driver.

To enable this coordination, split the power domain initialization out
of the RISC-V SBI CPU idle driver. This allows coordination between
power domain management and CPU idle states on SiFive platforms.

Changes in v4:
- Split the power domain initialization out of the RISC-V SBI CPU idle
  driver in PATCH 1
- Refine the commit messages of PATCH 1 and PATCH 3
- Rename cpuidle-sifive-dmc-pd.c to cpuidle-sifive-dmc-domain.c
- Rename SIFIVE_DMC_PD_CPUIDLE to CONFIG_SIFIVE_DMC_CPUIDLE_DOMAIN

Changes in v3:
- Update the explanation for the absence of the SoC-specific compatible
  string.
- Drop the smc3/tmc3/cmc3 bindings.
- Separate the genpd init and the idle driver init. The genpd remains
  functional even when the idle state is absent.
- Address the warning from the kernel test robot

Changes in v2:
- Add the driver for SiFive TMC, CMC and SMC
- Drop the `sifive,feature-level` property

Nick Hu (3):
  dt-bindings: power: Add SiFive Domain Management controllers
  cpuidle: riscv-sbi: Work with the external pmdomain driver
  cpuidle: Add SiFive power provider

 .../devicetree/bindings/power/sifive,tmc.yaml |  58 ++++++++++
 drivers/cpuidle/Kconfig.riscv                 |  11 ++
 drivers/cpuidle/Makefile                      |   1 +
 drivers/cpuidle/cpuidle-riscv-sbi.c           |  46 ++++----
 drivers/cpuidle/cpuidle-riscv-sbi.h           |  20 ++++
 drivers/cpuidle/cpuidle-sifive-dmc-pd.c       | 102 ++++++++++++++++++
 6 files changed, 220 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/sifive,tmc.yaml
 create mode 100644 drivers/cpuidle/cpuidle-riscv-sbi.h
 create mode 100644 drivers/cpuidle/cpuidle-sifive-dmc-pd.c

--
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

---
Nick Hu (3):
      cpuidle: riscv-sbi: Split PM domain init out of the cpuidle driver
      dt-bindings: power: Add SiFive Domain Management controllers
      cpuidle: Add SiFive power provider driver

 .../devicetree/bindings/power/sifive,tmc.yaml      |  58 +++++++
 MAINTAINERS                                        |   2 +
 drivers/cpuidle/Kconfig.riscv                      |  25 ++-
 drivers/cpuidle/Makefile                           |   2 +
 drivers/cpuidle/cpuidle-riscv-sbi-domain.c         | 176 ++++++++++++++++++++
 drivers/cpuidle/cpuidle-riscv-sbi.c                | 178 ++-------------------
 drivers/cpuidle/cpuidle-riscv-sbi.h                |  29 ++++
 drivers/cpuidle/cpuidle-sifive-dmc-domain.c        | 124 ++++++++++++++
 8 files changed, 423 insertions(+), 171 deletions(-)
---
base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
change-id: 20251207-sifive-pd-drivers-66de65108b1c

Best regards,
-- 
Nick Hu <nick.hu@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
