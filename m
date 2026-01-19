Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C035CD29C46
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 16:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tYw0kZTk1/cwshfaYIPIZigyDdFSExcgJt8yhAoGANo=; b=Znn/r3WUxGfvgx
	YiDsidnJ1J5ULT9DS45mQnpuA9l47jH8RRCs5awhvv8J1CZRRlUtx9SCvcqioF+u+O7NkGw0+nBfN
	aPyu5xCu4+i4HafrYvjkZo44nl2wnIoCiskod61rkwnKjRPurandddu6ehbeZnf0ORf245j2TG3PK
	x9ZeldWGWF68p1bB5Lh5zpbutuOk/Odm1+g3yYuZW7JnWtAk7vdjZoVTqCl+lXWNVwA4/rcXGPQFr
	3ML0MHB3SlCFsYXTki2y0PktG/4N/uIyFvlag1dLf1FfwR60tKyOuY1b4pLZuCUDsuvNsAmVjsndJ
	JPsqZRwOs+IQzHggXs/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs9Y-00000002V0N-3W9P;
	Mon, 19 Jan 2026 16:30:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs9U-00000002Uvl-1rK4
	for linux-riscv@bombadil.infradead.org;
	Mon, 19 Jan 2026 16:30:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=GtSyZi+GX56dSilIrbysoC6diIgasA8yuyqA3He/cbI=; b=W4RpSrzp8zKQJo8Uk3DBNMpy/S
	Y9FdCzdWJ3ujnTDYPsXC0M6YNldeRFaIYpSyniLeyjWCF2c1aAsZTG0LOW5DNvFQtW/allMpkmsNw
	YD0bx514Dpgt/gz8yWW6hozHnXe74XjEexRRBmv6Jh94++qwtikR52PUrPGLSQeEmdegK8OvImbZk
	B5/xd8PKUtt8YStZtjm3ScqrQpMX3iCWegaidmCPz6wZHoWzzkwkPnKm96Jz/t1H6CF+VJIZ4SJS3
	n4WgRzKEO9aETyQsIEqNTNOouG/R9n0GvfOm9Y8gSlzrdoXFnkEuWkNZfVdZGd5ipsbKJrhgl/Wsd
	FkUsoCsQ==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs9Q-0000000CWaf-3oo8
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 16:30:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47eddddcdcfso21178895e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 08:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768840247; x=1769445047; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GtSyZi+GX56dSilIrbysoC6diIgasA8yuyqA3He/cbI=;
        b=fV1LhF/tll0EdIXGHhZwxp9lMbVlBHpLT/Rur+mdOg+0igG/lth7WourSPJ9lwEkc9
         gdS3R4sBSEIk+SFpl3+Qz1UGOEN5sAh6j0Qn9o0E9duV9sMd7EoLGVws6xc2MI5hrXD4
         ylTLUxfi6lf6vDQUrDViu/msDjl6II9IoBrHFgzCUNZPihbQZXrX1q16HaQ7c80b0Y7T
         Gn45/+nYxNk3Ujz4NgmJJFMpYgVwRt/Z45WiuZJh6SaaJirKnq8Y4naVHAHLAjKA8cwm
         W+IenPg6dwQhJqpecRdbO2tZOSdLL4T1zyPgdB7Iblrz2U20uA/gMKKxJ8Ys3L6nE+Wq
         YNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840247; x=1769445047;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtSyZi+GX56dSilIrbysoC6diIgasA8yuyqA3He/cbI=;
        b=oIcufh8/1DhIdBWs0k7B2IOjc7IbcpaX57G5NgP/918ML+1r65e372HZm7mudkCy8o
         a71vhzzhn32y0xFnLroKx/l8A4Fu4H/VaWWONDqnNMaxQbGWE3bqONmcTQguUOugB79t
         3Jj7UuZWp9XaG05lTyhL4XWWsevWyV7PgqNZcDblGne3m24khmsKRXNJFuMUYiEdvOox
         PWvywBaqIaeadq99IzMbQZHu5kKyBc8OJDfOTcenZL17OIj4+jQ26bMPy8LqYkxBnuoB
         TVwSiZ8fpZ8rdikgPiMKr7QNFbFJnrZbh4Rt6KmcCfVgKr5FBbYH9H392aClHMjr3OtW
         8eaw==
X-Forwarded-Encrypted: i=1; AJvYcCXMJ7lOPYqH8qs60IG4cgmUlYa3D0HjKWi9iSNQPAXS6w2CARsXK3G9j4uAJf89es89w6MbJK1QziUpww==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDSME6UfJ9KG09nsVAXuJTN6IgpYOcAGevuc7u8fRk/jnn5aJV
	8HcHIIkV17lvTEt3CqiEwEiG7JVbRuI+xUWjOUqksD/TD+5IQva3Wixg
X-Gm-Gg: AY/fxX5DYFhyfCaJB02MhidVF2iy09MbzfqWbxsmG7ITY13aYGQKI/hp51Bfe1cDOOs
	nnHwnupHjBdSqvGSlO5Ifeuzn+RSW9ghlHl3AY5cOFnfFTFAF/OdyjTrjfY9m/IQ33ZhVqSbh4U
	6Qss4igT8m4q8AtQyw9bgIhdPz1uOjAGTXsND+LJ6TevCmCfgLTTkLsakRq5XwkcFowmfaSW+99
	cO+fZ6Psr3hFBrfvp4Mtgz1fvtcVeb4g3sg0TUhmaslOtEbOXph/nkeMxr+rVHj56f4R24QUCD9
	wD8QBT9OT5ceS0ToUFvIoNCmiwZCiNBp49/lazPhrjcbm/eIyznL8e+IXy2zrY/YCjL92nKoY/U
	dScJB5vrqS4n5ilMY3fQplcLXtYgzG+t5xFCjiS2KfgQ9HeKNZbnh9DnpkXzrwgl0fKBYR4giua
	4DuDSnO7S9CvYrg7uc9JLB29Mq92cBpASkbAjULo+WmK6b
X-Received: by 2002:a05:600c:45d1:b0:480:1d16:2538 with SMTP id 5b1f17b1804b1-4801eb03358mr124106305e9.23.1768840246435;
        Mon, 19 Jan 2026 08:30:46 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879537sm201666795e9.5.2026.01.19.08.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:30:46 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH v3 0/6] ASoC: sophgo: add CV1800 I2S controllers support
Date: Mon, 19 Jan 2026 20:30:41 +0400
Message-Id: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADFcbmkC/33OwQ6CMAyA4VchPVuzDTcWT76H8cC2Ak1EzGYWD
 eHdHZw4GI9/k37tDIkiU4JzNUOkzImnR4n6UIEf2kdPyKE0KKGMkFKjz9IK4ZBVwhA5U8RTJxt
 bm0BeGyiLz0gdvzf0eis9cHpN8bPdyHKd/uWyRIFknVLO6sa27tKPLd+Pfhph5bLaE/YnoQoRp
 BBad6a8ZvfEsixfTkjD0/cAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768840243; l=3774;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=tBbE5TYMjz9mJOg2pvzbDmpHsdxVsvsn/pV6RG/8C5s=;
 b=c7AvbXcGS/K0MvQfsJ0WarJIF9MHxYCqS987eHude15MFk9VyB7dvqMcJ62U/gdDyr2v5fdPj
 9cMqyVReILEAWoLVhniDDo5ozEq/st1lncODwK4F0UyH6XhPKHsV2km
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_163049_057086_6DA7D43B 
X-CRM114-Status: GOOD (  13.93  )
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
On CV1800B / SG2002, the I2S2 output pins cannot be enabled via 
pinctrl alone.  Due to SoC design constraints, the output path becomes 
functional only after additional vendor-specific register programming.
This series makes the limitation explicit and does not attempt 
to work around it implicitly via pinctrl or undocumented behavior.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
Changes in v3:
- Kconfig: add SPDX.
- sound/soc/sophgo/cv1800b-tdm.c: add const to cv1800b_i2s_dai_template
- sound/soc/sophgo/cv1800b-tdm.c: drop unneeded debug message 
- sophgo,cv1800b-i2s.yaml: removed address-cells
- sophgo,cv1800b-i2s.yaml: reword for commit message and header
- sophgo,cv1800b-i2s.yaml: fixed dma-names node
- sophgo,cv1800b-i2s.yaml: clocks min-items fixed 
- codecs bindings: squash
- codecs bindings: unevaluatedProperties: false, dropped redundant
  description 
- fixed build error revealed by test_bot 
- cv180x.dtsi: removed address-cells in i2s nodes
- Link to v2: https://lore.kernel.org/r/20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com

Changes in v2:
- Updated cover letter.
- codec nodes moved to cv1800x.dtsi with status=disabled
- the commit with dts example for 256M board was removed
- added details in commit messages

- Link to v1: https://lore.kernel.org/r/20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com

---
Anton D. Stavinskii (6):
      ASoC: dt-bindings: sophgo,cv1800b: add I2S/TDM controller
      ASoC: sophgo: add CV1800B I2S/TDM controller driver
      dt-bindings: codecs: sophgo,cv1800b: codecs: add ADC/DAC
      ASoC: sophgo: add CV1800B internal ADC codec driver
      ASoC: sophgo: add CV1800B internal DAC codec driver
      riscv: dts: sophgo: dts nodes for i2s tdm modules

 .../bindings/sound/sophgo,cv1800b-i2s.yaml         |  67 ++
 .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   |  43 ++
 .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   |  43 ++
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h         |  57 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  55 ++
 sound/soc/Kconfig                                  |   1 +
 sound/soc/Makefile                                 |   1 +
 sound/soc/sophgo/Kconfig                           |  46 ++
 sound/soc/sophgo/Makefile                          |   5 +
 sound/soc/sophgo/cv1800b-sound-adc.c               | 322 +++++++++
 sound/soc/sophgo/cv1800b-sound-dac.c               | 204 ++++++
 sound/soc/sophgo/cv1800b-tdm.c                     | 716 +++++++++++++++++++++
 12 files changed, 1560 insertions(+)
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
