Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98CED4660F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 19:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WeZNEaM8pQ7SA5ORqRgmUnTBTC26Knv/FKkBfYsQrIc=; b=wg/nGLPZgIB9YO
	PJJwoKtmggBR77c8Iwd2YptFUjDnANRBf6FwU/rNqjBOGDknuX3YokcjUZDMW100qjEJLivR+TZ3N
	swCpOKdoV/PxsrBz06XFOS7Nw9sqYft3EAH0KSdXqGLGL/+IdGF+v1z/CNgxoJTN2xcRsxJc763mU
	euVtYHnYLV7kuOqwGddnY8LMrbjredvFeMOSFC2uVtNNQC+M1ilCegyeTNeQ05Pqfdep7tdalcfc3
	NHYD9PD5xWxRRQnOu86CvNvqpIxgIaDMUPyRqw/X2GpyfTNF9GJzOMcx6SM09i0P5N734IppBzWDU
	rOW2yR5YJyNdOzmsnTgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSr8-0000000D2ZE-02fW;
	Thu, 15 Jan 2026 19:18:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSr5-0000000D2YR-0z67
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 19:18:04 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso8616175e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 11:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504681; x=1769109481; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6awU7mxwuWsmRADvbQlSH8CHRST4+YAD1gEKj5q/Fv8=;
        b=VWtlyffHhaF4ObLK/4Nj5woa6t+Bg3Dx2FkZU6kaRXiU4MGmSTj7qtrqLcV673v8K9
         8zgqHB5GO4XQpGZaDbbyW5xmLcNaBQepP1GUb9LjHxih156w7sQqtwRJueFQkpRqFafD
         8TCYuH7OkBgp1dKUOLXKCB079sDbv0nXXd9AjgBGU1ZTf/ANXMmzVnmfFKrBJfzNjizN
         0ldS6OtokzZxGXw74X/jPAARRTYig6Jo21gwNbPjTraHE7QGOhhRER4TDDH8Vh37CBg1
         cxOLseRo5aOPCeBpVrhNXsUj7zthUtx47XJLNan0cccCkSG6iwC8yMjL5iNd9F/VZ2oA
         Kqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504681; x=1769109481;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6awU7mxwuWsmRADvbQlSH8CHRST4+YAD1gEKj5q/Fv8=;
        b=qJuEJs/if4a/jY6f0xkEZTGlqnZox8ZhvtKkl4tu0X7kK3PUNWs1EUGA6oCICcL3EF
         1BbO9mISRvREE6Vhyei/6IoD+5FcpXC5YsUm3dIPQOx25CkSentwpQR0hYDqHciZDJRg
         VQCy1G1hoOy7rXM1VrTNf4a2cEqPgMkutcISIxCx7PkOIFDJW6EnA5h7zbYeTNWg2zWc
         AajoT1gvbKUep6SRLDLu04UC0FZ+g8HBX1KDYWVaYQtrW+UAcfSQvmEa57S/Nf7r0dj8
         tdMTi907JZ2UqzjfFkNMdV35GumByZ4jLUk1uNNzI4VtNip3v45m8g3aN8dRBhMzdUdq
         BChg==
X-Forwarded-Encrypted: i=1; AJvYcCV9pw+DWXjmYDgjwFZrJVqjA4gzXCeBeTwYa2pu+aeC7zmwp1E8sqUBJ8tq1BbA+pt09WopLpvloh8VuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPzH50cC/9Aw1J8lg79MeuuXp7JQj0vImHmjIl4ERWhNqdai8j
	WlFO5RXi7KFlkFVhIOBktkksp4hMJdpz2uOovE1f1k+hTlhoPHlocR4x
X-Gm-Gg: AY/fxX4onPZ1+A6WRLddX104G4Oj93whEkam1lRSBT/xdaPhUW8yR63qqC2bkicjeWZ
	VaUoblBVdaoiow+wlIgxFRWgVH3zuk+6qLB8KA4nrkM7QLTfRgjqZ5jn5tJHYY0VWeLrcFrdWVv
	9/PW4KiqQ+I9FJwrneC4e62+XzjZ+eCyWOcZPh+H2FKcGgejROp5Ip3SywwcJ8adIJXgp1dm24S
	a++uEq9S/Los+TPwjOy28Q7K+M15h5mZC63wmwKuc5lorXkJhRrgFfobN8bV2bGOkklaym5ZWNI
	otJu5cQkJnW04HPk3525RJXvFJHgMRNe780oxwbVR/cqDtCRpFt/MZ8LCEx+wZ1pDUuopQw1Q22
	Gcvkp3FApxUxdejJk977RzHvQbrhWCFhpKf02sckzHSD/vPZtbgb2Jklxy4TQFzM6NEeg+lqifC
	5Zy93uICwlER83k8wqOJRj0iW025AbieyqesAUV9UGdZvj
X-Received: by 2002:a5d:64e6:0:b0:431:307:2200 with SMTP id ffacd0b85a97d-43569979c5dmr533542f8f.9.1768504680718;
        Thu, 15 Jan 2026 11:18:00 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm692734f8f.9.2026.01.15.11.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:18:00 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH 0/8] ASoC: sophgo: add CV1800 AIAO mux and I2S support
Date: Thu, 15 Jan 2026 23:17:37 +0400
Message-Id: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFE9aWkC/x3MMQqAMAxA0atIZgNN1SpeRRy0jZpFJYUiFO9uc
 XzD/xkiq3CEscqgnCTKdRZQXYE/lnNnlFAM1lhniDr0iQZjVhQbMagkVmw36ofGBfadgxLeyps
 8/3Sa3/cDpTyugmQAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768504677; l=3006;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=jS4s4+CeEp3p8wbUjI2uvC+K83JDVMWMsUADgn9dTsE=;
 b=KoUoMJjnND33ukztFTj5DwgkDIFIQgsCTyq59umMHCLOC7ss9JO8beohsaIR97SJgVvS0ET3o
 I/MuwDTqc1pCTNweLsYrs6LgSKQwHGsgTIgoam1u2NAaRavYctncy8V
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_111803_308737_FA4D1AD0 
X-CRM114-Status: GOOD (  12.27  )
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
The series introduces an AIAO audio mux driver, 
an I2S controller driver, corresponding DT bindings, 
and DTS updates to wire the components together.

The implementation is based on vendor documentation 
and testing on real hardware.  This series relies on 
recent fixes in the DesignWare AXI DMA support; 
in particular, correct operation depends on 
the DMA changes discussed at:
https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/ 
The current driver implementation supports a fixed audio configuration 
of 48 kHz sample rate.  The series has been tested on the 
Milk-V Duo 256M board using the Sophgo SG2002 SoC. 
The implementation is expected to also work on Milk-V Duo and Milk-V Module 
boards based on the SG2000 SoC, as the audio 
and DMA blocks are closely related.

Known hardware limitation:
On CV1800B / SG2002, the I2S2 output pins cannot be enabled via pinctrl alone.
Due to SoC design constraints, the output path becomes functional only after 
additional vendor-specific register programming. 
This series makes the limitation explicit and does not attempt to work around 
it implicitly via pinctrl or undocumented behavior.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
Anton D. Stavinskii (8):
      dt-bindings: sound: sophgo: add CV1800B I2S/TDM controller binding
      ASoC: sophgo: add CV1800B I2S/TDM controller driver
      dt-bindings: sound: sophgo: add CV1800B internal ADC codec
      ASoC: sophgo: add CV1800B internal ADC codec driver
      dt-bindings: sound: sophgo: add CV1800B internal DAC codec
      ASoC: sophgo: add CV1800B internal DAC codec driver
      riscv: dts: sophgo: dts nodes for i2s tdm modules
      riscv: dts: sophgo: add Milk-V Duo 256M board dts

 .../bindings/sound/sophgo,cv1800b-i2s.yaml         |  75 +++
 .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   |  43 ++
 .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   |  43 ++
 arch/riscv/boot/dts/sophgo/Makefile                |   1 +
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h         |  57 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  49 ++
 .../boot/dts/sophgo/sg2002-milkv-duo-256m.dts      | 231 +++++++
 sound/soc/Kconfig                                  |   1 +
 sound/soc/Makefile                                 |   1 +
 sound/soc/sophgo/Kconfig                           |  41 ++
 sound/soc/sophgo/Makefile                          |   5 +
 sound/soc/sophgo/cv1800b-sound-adc.c               | 322 ++++++++++
 sound/soc/sophgo/cv1800b-sound-dac.c               | 204 ++++++
 sound/soc/sophgo/cv1800b-tdm.c                     | 714 +++++++++++++++++++++
 14 files changed, 1787 insertions(+)
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
