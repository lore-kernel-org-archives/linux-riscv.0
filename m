Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5908DC9832A
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 20:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IDPc21VQoT2S1QLO4uXdMIooBbp3bSc3xBLXGLZ9ThE=; b=hRV+IdXXkocEPT
	iFjp+w++jjvhusc5UN2hrf3MfWHNrwN6nVWjmTngJZv0U/1/O4blGHcWlkZncwjOxyWBp8QoxUYjZ
	1/H66/FqW5RIfJT+c8K5kPOvzUHvYVzUF6XelFrRAE96GZJkKCux4BuM1LJAS95ELpEnDHL+vUArx
	zj4U/F2ASbuapHjkLYPm8dXzyJZePWwLYyurZXP8mfkJlm/vjfEg9+16GTHk/YCwxXfSquJeJ0pxT
	jKHsb2J/LvkgrtRxK0fo4eYlJReaBgwhnsV7qyTM+LeTPC3PAa6q0KyBdOuUaWn+m+wbniR255SPB
	FjO2W+UEDQ46+Yd6nZ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhCle-0000000FtO3-0p9q;
	Sat, 17 Jan 2026 20:19:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhCla-0000000FtNR-3Kaz
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 20:19:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so28787415e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 17 Jan 2026 12:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768681164; x=1769285964; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XuMp3/hIeMrlP0ISwR7NIwGJWIBA2lBFXolUkLdtvk0=;
        b=e5rzZHy3ocEJ9oQtlDV0pRs3yZfbeHvggajkGlnMG0s1CLHzRye0FAYQR0UWmTmgEM
         6f1e4vAU+0SjGsPPDei1lxuR3F/sZhCaqIFBesj7oRGWBG5T8HQeWSFqWnpDZ3bWKEXm
         FTa7fxbVen1y0rZ0HqYnenrKTF8J2Lrn4wMRtAi4RSqm8ck3eXy8mujrqfWLO7sCp26g
         VnvDgwwZPULbtNlf6MBdna/ltQPpoTPujQJwDPtSnNFElPUxJqJUgrYuEK42zCCYV15g
         kInI2qHtl6iji+/BWjzF1/bshop7fHiUifHH+7SU26xvRv1g3YQOrijaLndKHgOsScdl
         aveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768681164; x=1769285964;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuMp3/hIeMrlP0ISwR7NIwGJWIBA2lBFXolUkLdtvk0=;
        b=HPDNY/JIEF+Zc0WcUuuv8UoJwpGC1BiOcVTp0RW9kZ9gSvkdr+TQ3n6VuMklSyb41a
         GIvVw23XB+x/A4NiPqayx3lBsfiKc52BirBOsLMSqsXtCPYR1hEG32x6itFFk/vVO/Ye
         QoXcp1KjTpunuF0F3/vsHf6AkB4iltLezptAM7XH9/t9sr5QM4reeWsuQGHyk5swE6Zq
         YlKOh8JBKrlFnLpxKgLYeEp9Pnq8tiKjXHrkrb/g0vOSMtzyn9g2Hvch7Ym9GPTesz5H
         j99biDKyhFH7Sy/38Ez4uie+NEO/jQOlD/w1XrFfkwBwfnsmBGw62hYmCFtXNkerB2aS
         vRFA==
X-Forwarded-Encrypted: i=1; AJvYcCVeXiCZZH3E3gq7hV8UepbfgnpnQbpclY8JsebrJ6y5r4Zfd8TFxovP5xZErRLp8LEJ66HphY4gUVhsCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHqlrxBKCute+FYuwb6iOuKagLbdGWgAaT0OpekzNIpyE6YWLU
	upqu+JozOUsVN5wvs3Nsy22j97sGoZv/V5putQIKFB2eDOj+jGiMNAUq
X-Gm-Gg: AY/fxX4VNE9qBnJw7mGdLLO03gXjq6wLZc/MbTBcar3UURzgAorCVwCKMg8OP13zHM+
	XUW3LGwiLYGiTgaXvGX1S7SOqTELGEW0eih7IZGUyzSQLHKB1otoqsVxnzGt759HRLQKtfyVILR
	RYyIC8jzo75wPEi3oDYYcHrytMLZWpFykMPoa/yK9bva59dEwHUjFQcLipRJyTXF98HaJmRco41
	CKAocOQomrILjnqSVjrhCiXbaM/uVXLvuNmSwQpoHf54uoVJflMUUBaplyo0jQTI0V7u4EoM6HU
	gVxK552NLdDAk1j8Sc6wIo2uPKl19fqOsTuYBf9pTAAPGl97m5Z6Ixbbi2CyC9X6jVTpjM+q2Ze
	BUXcItM9FTZAScz9O4qqpjP2c+NqBkvCORvlXIY3KGVi/3KL1gl8UycgNmsW28VV9x05j1DUXLR
	nJBtXoo3aTy8AT0KxookTSaVZIn7yeznSVu1mUUCaYKGHl
X-Received: by 2002:a05:600c:6612:b0:47e:dddc:3369 with SMTP id 5b1f17b1804b1-4801e3530b7mr88935485e9.35.1768681163751;
        Sat, 17 Jan 2026 12:19:23 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm112402295e9.4.2026.01.17.12.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:19:23 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH v2 0/7] ASoC: sophgo: add CV1800 I2S controllers support
Date: Sun, 18 Jan 2026 00:18:52 +0400
Message-Id: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKzua2kC/32NTQ6CMBBGr0Jm7Zi2SmlceQ/Doj8DTCKUtKbRE
 O5u5QAu30u+922QKTFluDUbJCqcOS4V1KkBP9llJORQGZRQWkjZoi/SCOGQVcaQuFDC6yA7c9G
 BfKuhDtdEA7+P6KOvPHF+xfQ5Por82b+5IlEgGaeUM21nrLuPs+Xn2ccZ+n3fvw8+qGa0AAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768681160; l=3154;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=RuCJDqbjt4/1OjYPNQx7uliq1cjVd/YITyDYhrLPVMg=;
 b=1sf6uqdI6XFVuR4O9E1Fi/GEDfhDfMyI4KYTNmqVXwV9EUQcZwt+LnKRH31/TxkYLA+qjYA1p
 9fVzB584N/fAAsluT+aHjZKfHFVVdKwhjHXHDQuufchXrgVWf62VfYx
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_121926_870889_36B332B6 
X-CRM114-Status: GOOD (  13.32  )
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

This patch series adds basic audio support for Sophgo CV1800B,
as used on boards such as the Milk-V Duo.
The series introduces the I2S controller driver,
the DAC and ADC codec drivers, corresponding DT bindings,
and DTS updates to wire the components together.

The implementation is based on vendor documentation
and testing on real hardware.  This series relies on
recent fixes in the DesignWare AXI DMA support;
in particular, correct operation depends on
the DMA changes discussed at:
https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/
The current driver implementation supports a fixed audio configuration
of 48 kHz sample rate and only I2S protocol which is used in codecs.
The series has been tested on the Milk-V Duo 256M board using
the Sophgo SG2002 SoC. The implementation is expected to also work on
Milk-V Duo and Milk-V Module boards based on the SG2000 SoC,
as the audio and DMA blocks are closely related.

Known hardware limitation:
On CV1800B / SG2002, the I2S2 output pins cannot be enabled via pinctrl alone.
Due to SoC design constraints, the output path becomes functional only after
additional vendor-specific register programming.
This series makes the limitation explicit and does not attempt to work around
it implicitly via pinctrl or undocumented behavior.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
Changes in v2:
- Updated cover letter.
- codec nodes moved to cv1800x.dtsi with status=disabled
- the commit with dts example for 256M board was removed
- added details in commit messages

- Link to v1: https://lore.kernel.org/r/20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com

---
Anton D. Stavinskii (7):
      dt-bindings: sound: sophgo: add CV1800B I2S/TDM controller binding
      ASoC: sophgo: add CV1800B I2S/TDM controller driver
      dt-bindings: sound: sophgo: add CV1800B internal ADC codec
      ASoC: sophgo: add CV1800B internal ADC codec driver
      dt-bindings: sound: sophgo: add CV1800B internal DAC codec
      ASoC: sophgo: add CV1800B internal DAC codec driver
      riscv: dts: sophgo: dts nodes for i2s tdm modules

 .../bindings/sound/sophgo,cv1800b-i2s.yaml         |  75 +++
 .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   |  43 ++
 .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   |  43 ++
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h         |  57 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  63 ++
 sound/soc/Kconfig                                  |   1 +
 sound/soc/Makefile                                 |   1 +
 sound/soc/sophgo/Kconfig                           |  41 ++
 sound/soc/sophgo/Makefile                          |   5 +
 sound/soc/sophgo/cv1800b-sound-adc.c               | 322 ++++++++++
 sound/soc/sophgo/cv1800b-sound-dac.c               | 204 ++++++
 sound/soc/sophgo/cv1800b-tdm.c                     | 714 +++++++++++++++++++++
 12 files changed, 1569 insertions(+)
---
base-commit: 7a52965b6976c936f413eebeee3f78c6faf09012
change-id: 20260115-cv1800b-i2s-driver-4f17836dec56

Best regards,
-- 
Anton D. Stavinskii <stavinsky@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
