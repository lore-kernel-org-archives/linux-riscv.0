Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F2AD2628E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 19:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=95UWkl8lblc3rdqFuM9f2ImtVaPjVbe8pBiM53pBqwA=; b=i9ScuwhSsZ4UJf
	Bb0sLk5fb6blqOtLM1GgzthEZbi2Zhcg1xJ+/DfG0lzxRgrjdlaWB9pSSC99eOZml1waDhYnShSGn
	LoJToBydfzSEk9grLiGPRPdrvSUTCCXY15TdZX5+GEOu/MHEt3TMlrZsU55z13wH9/LTVaNJc3f9E
	kmAAxNHHmcotZ1u/KiWaNlME9Yced+/07UsmyImpYoLG/d09+Izc6QCKLL+q3nXRrYl3xlPpPp8xD
	fmLcHdYO7KlKitD+7UfLdrTehI3AaZnbYRNK22xrUv4Pwsfaz/vYWugEnQE1GZtQVIOpa0dkk+4Lk
	eRRGiHtQdzFtuf6/2UsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viH3R-00000004Kqx-2acz;
	Tue, 20 Jan 2026 19:06:17 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viH3O-00000004KqL-1qvp
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 19:06:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4801c1ad878so46141705e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 11:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768935970; x=1769540770; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ef5XZssjPJck2vo2ZHF3UBv8KXbka0JYdX8WDR+tf8=;
        b=U7igecA0p4ryM+ICQh7Saz2iIZaVx4dsp4gYoQqeKoj1EF+qj9867ZzB0o/uVrrPFb
         FLqkOFfjbRvGP/FL+Pwyixu4vy3DWwCWNUBZn2nYetAGor6KGGEAtghphsDRgAQCJ4b0
         yELlM4yOujrg4EmKmIxyPGvXukXx94KvrP23Xcqn5Y1xjDeC5f45Q5QOBtC4EDjkFO2m
         PUMfkWRRGr2P0iOaVUIFAjI/aISAA2afHDvaNroX66Y4AnTeCBzSOzhMjz1yVW2IxsWl
         1ArzLSUpgW4LDbB8+YlIKwCD5nazuyT4rG0kgGK3EvkDiunSNInZqFUZo6rLP+rZuILF
         S8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935970; x=1769540770;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ef5XZssjPJck2vo2ZHF3UBv8KXbka0JYdX8WDR+tf8=;
        b=haFq493WMcCKTgKERXyfxmQvnKzYlsrkG5u8sjzu7MMeApR+vMBtYJas3QjjmykmZR
         Qz02KlHpEpGMNLG4oI0gSIP9uGxo+iIaOEZcDc5tnn6SEoVVhMKWJjkouq2F0O2QcK4E
         9tUZsLnrYZBGoBmQVMn7XEBYY9lLCCvGt3sluVvPka99vKsBw7iAdvJn7QQRVC+sPNlv
         xy82wXZ4D6DzXTZ7TKM5t1743K+Ppy73oojQc9Qre6qIL3Tv+usOarlcZG4rzCrPkyoJ
         GStV6TOzHf0HCiCpxmhcij1IuCrokYgxcKgdTZW7DgvRooiPx9G4oFqF3+19m19EhX9Q
         wr7w==
X-Forwarded-Encrypted: i=1; AJvYcCUatKYq1XZDO/s7aiJuJXikCF8Jf1ZSsSZ0v03ScM2ZNYiN4/CpTEi06PoDcy7PQjDjqD3iGNs8DxWJHw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8YNWPm7afHWlNseQKrec95Kt0HUC1X5DTv95q5ct68rRcNr9s
	Q2D0IqLGcizHyi3nDrQGBezsEVBbihgWqogSq8UWqtkPGCLPO0ZOvKS1
X-Gm-Gg: AY/fxX7mCIt8O7y/P1gms+Vbf/Tdy9UvDjs9JEsWGPufL9J5K4pFiCAdQ0s1tn6zNZI
	9eQDI7WFsFZXh4v/M0e0BEFAmBB42DGyVDpdAmns4COOz+GGF2MxRbHn8/TvNgBTkecmlmQYErC
	w8MZqBIW1N+W5fhPnV1j2N3qfkoHwOzXOy29I8wrZj+BcFneyjhxtd161/Aayz5wmYIA/eSC8ci
	G8XFuarTJtJnO/NbsGQGVEPWzk8pK9ap94nFxH+ouIkd0fGCIymrkwGs4/3CqrB2NXLYHY22Uyl
	xt3JqWQDOsOcyHe+rW3aMGpNzFCBZWAt0qF7mJjSxKu2xNlsnSNynFeFQNfA3au8oxxvj2K2kzR
	cQYyFEj22Ef28ItOPCUipQPQQDIVm6+i1n8M/L0VCAmh/hyE+lWkZJ8mCyDvvKIkCHlVqaL8yZ7
	CCMFvtJomOdZyE4ioDiYP+XhUc0+NwiDHBLX9SOZLysFCt
X-Received: by 2002:a05:600c:3b90:b0:477:7991:5d1e with SMTP id 5b1f17b1804b1-4803e7f184amr42521595e9.25.1768935969900;
        Tue, 20 Jan 2026 11:06:09 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804244c6cesm2005735e9.0.2026.01.20.11.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:06:09 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH v4 0/6] ASoC: sophgo: add CV1800 I2S controllers support
Date: Tue, 20 Jan 2026 23:06:02 +0400
Message-Id: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABvSb2kC/33OwQ6CMAyA4VchOzvTDjamJ9/DeGBsgyYiZjOLh
 vDuDk7EEI9/k37txKIL5CI7FxMLLlGk8ZGjOhSs7ZtH5zjZ3EyAUIAoeZtQAxhOInIbKLnAK4+
 1LpV1rVQsLz6D8/Re0estd0/xNYbPeiPhMv3LJeTAnTZCGC1r3ZhLNzR0P7bjwBYuiS2hdwmRC
 YsAUnqVX9O/RLklTrtEmQmoAJSvENHWW2Ke5y/oNJfUOgEAAA==
X-Change-ID: 20260115-cv1800b-i2s-driver-4f17836dec56
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768935966; l=3943;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=/i53vqMAIdZNSQKjWuPjGV+34T+Veokykl4U0XdsoqE=;
 b=ujF7DVpfDFcIqiJ+hFjkIaX7+EUYOaYF0ozWAVYPkNGd1jyRyVhNuGdrz0jshI7mm1Kg9d0Qb
 sJKZFL2jBg6DCRGo2djEfdHrar5RiLYCQUyiZ/fUOmy3va0Uf+jz6cn
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_110614_675528_A27BB12A 
X-CRM114-Status: GOOD (  14.47  )
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
Changes in v4:
- fix issues with i2s bindings
- rename commit for codecs bindings
- make single bindings file for both adc and dac 
- Link to v3: https://lore.kernel.org/r/20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com

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
      ASoC: dt-bindings: sophgo,cv1800b: add ADC/DAC codec
      ASoC: sophgo: add CV1800B internal ADC codec driver
      ASoC: sophgo: add CV1800B internal DAC codec driver
      riscv: dts: sophgo: dts nodes for i2s tdm modules

 .../bindings/sound/sophgo,cv1800b-codecs.yaml      |  46 ++
 .../bindings/sound/sophgo,cv1800b-i2s.yaml         |  67 ++
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h         |  57 ++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi             |  55 ++
 sound/soc/Kconfig                                  |   1 +
 sound/soc/Makefile                                 |   1 +
 sound/soc/sophgo/Kconfig                           |  46 ++
 sound/soc/sophgo/Makefile                          |   5 +
 sound/soc/sophgo/cv1800b-sound-adc.c               | 322 +++++++++
 sound/soc/sophgo/cv1800b-sound-dac.c               | 204 ++++++
 sound/soc/sophgo/cv1800b-tdm.c                     | 716 +++++++++++++++++++++
 11 files changed, 1520 insertions(+)
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
