Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F71C88E50
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 08:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GL+ISx5LGbzj9MwLCLQjLywGauD69H9tf7TdYPSuiP8=; b=10Gt/DuPLSvZb3
	JVRmr7cVxzw1X/uGbSPiYy/uLI9yzguWn5wqw6E+ioajPw15KWK2LtM1yDZA9SSrN7rH87zoP1nhK
	W4xUSn655QZboA470FtGpWzzFAlMkmXlmmlNm9aBBHGCBbxbLI3XEmZtk8tr8fHFLPFYFT7WLkcif
	DAg22fwH1I5dk1a7y3b6M4SboV9UbPVItZ697T+zg8nDT9DjFv01N3jyD3/A2d/yLW58o7CfzZTQF
	ncsJR8aBvUl6wzsNOVVHE1tiD3z7twvSKTURcz7SNjpo+JTf06JyXUi5CKdAgYR3jTfZPIXBU2dSn
	Dm0ct6Z56mrbJGrpxMCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61fs-00000002eN1-429C;
	Mon, 14 Sep 2026 08:04:24 +0000
Received: from out-15.mta0.migadu.com ([2001:41d0:1004:224b::f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61fo-00000002eMF-2Gfb
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 08:04:23 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=t0co+EMESSDhgYhaPg3OwtEoMvGBbLYnHGWIN7TKjs8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789373056; v=1; x=1789977856;
 b=xUjvYGJun8dPXgG+ijOrwQQvhGTi8OG07C9b8z7PrVOSn+NevhZzLoix2G6oNxZecVgDsHCS
 5dTUdFHQ3Et3kcjgXC+6unN8QLALBg6gx549mk6AgwdZqQmZq/j/o2E9eNaS66pljkLf3FvaIPR
 2FYe9S8dGcJa6afreENsDgGY=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id 1f50532f36ddc758;
	Mon, 14 Sep 2026 08:04:16 +0000
X-Mizu-Trace-ID: 1f50532f36ddc758
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Subject: [PATCH v5 0/6] hwmon: (lm63) Add Sensylink CTF2301 support
Date: Mon, 14 Sep 2026 16:03:52 +0800
Message-Id: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XNTQqDMBCG4atI1rVMJolJu+o9ShfmrwZEi9pgE
 e/eKBTFLr8hz5uJ9K4LrifXbCKdi6EPbZOGOGXEVGXzdHmwaRMEFHChRW6GGhnQHDgtNEhmUAF
 Jr1+d82FcS/dH2lXoh7b7rOFIl+t/I6ZMfpFOGsU9Gi5vdWje49m6SJZGxJ8rQCLdHCbnvPCac
 VQSy6Njm1MgNseS85Zr5b0WGuzR8Z1ju/94cpoxYQWWICTs3TzPX7YwifxGAQAA
X-Change-ID: 20250916-ctl2301-0416b073c280
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Jean Delvare <jdelvare@suse.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6878;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=t0co+EMESSDhgYhaPg3OwtEoMvGBbLYnHGWIN7TKjs8=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnLV+UWvH/67Jfwdq/9ZTNb43Jr62fObnDTfLbFcPrSh
 WfqE6K8OkpZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACaStYeRYepVvlbxxrmFk8+x
 LDZgVdlhcM+tLdp9+TuVf0J25/t/n2dkeM3YKMghXmvtu/Itk/4eXfUooYofp7+z7jRuf8+w+PF
 kVgA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_010421_030944_1A1A0FF7 
X-CRM114-Status: GOOD (  18.56  )
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

Sensylink CTF2301 is a system-level thermal management solution chip.

The CTF2301 is an I2C/SMBus compatible device featuring:
  - One local temperature sensor with +/-0.5 degree C accuracy and
    0.0625 degree C resolution.
  - One remote temperature sensor for external diode-connected
    transistors, offering +/-1 degree C accuracy and 0.125 degree C
    resolution (temperature range: -40 degree C to +125 degree C).
  - An integrated PWM fan controller capable of operating in two modes:
      1. Direct-DCY: Open-loop direct duty cycle control.
      2. Auto-Temp: Closed-loop automatic fan speed control based on
         measured temperature.
  - A 1-channel fan speed monitor (TACH input) for RPM measurement.

As Guenter pointed out on v1, the CTF2301 register map is a near match
for the LM63/LM96163 family (local and remote temperature, tachometer and
PWM fan control), so this version drops the standalone ctf2301 driver
and instead adds CTF2301 as a new chip type in the existing lm63 driver.
This reuses the shared temperature, limit, alarm and PWM handling instead
of duplicating it.

The CTF2301-specific differences are handled on top of lm63: 12-bit local
temperature input and high-limit values, nine conversion rates, 12
fan-control lookup table entries, and optional 22.5 kHz high-resolution
PWM. When no IRQ is described, the shared ALERT/TACH pin is configured as
a tachometer input. The LM63 family can also register as a thermal cooling
device when the device tree provides the #cooling-cells property.

Tested on a SpacemiT K3 CoM260 by booting an initramfs and verifying the
CTF2301 probe. Temperature, tachometer, PWM, and conversion-rate behavior
were checked against direct I2C register accesses and the datasheet.

Datasheet:
https://www.sensylink.com/upload/1/net.sensylink.portal/1689557281035.pdf

Register description:
https://github.com/TroyMitchell911/ctf2301-datasheet

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
Changes in v5:
- Quantize CTF2301 12-bit local-temperature limit writes to the
  0.0625 degree C hardware resolution before updating the cache, so
  immediate reads remain consistent after a hardware refresh.
- Link to v4: https://patch.msgid.link/20260831-ctl2301-v4-0-b335d52a0570@linux.dev

Changes in v4:
- Rebase onto v7.3-rc1, which includes the SpacemiT I2C timing
  prerequisite, and remove the obsolete dependency note.
- Do not add the SENSORS_LM63 THERMAL dependency suggested on v3 because
  CONFIG_THERMAL is boolean and v7.3-rc1 removes such tautological
  expressions.
- Preserve the upstream five-bit PWM frequency multiplier mask in the
  LM63 initialization error-handling path.
- Sort the chip type enum and remove redundant CTF2301 8-bit local
  temperature cache updates.
- Serialize CTF2301 12-bit local temperature cache reads.
- Keep PWM configuration caches synchronized after partial I2C write
  failures.
- Override the CoM260 I2C6 pin configuration through &i2c6_1_cfg,
  as suggested by Yixun.
- Add Krzysztof's Acked-by and Reviewed-by tags.
- Link to v3: https://patch.msgid.link/20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev

Changes in v3:
- Add the Sensylink website link to the vendor-prefix commit.
- Preserve the optional interrupt from the trivial-devices binding.
- Explain in the commit message of patch 3/6 why CTF2301 cannot use
  national,lm63 as a fallback compatible.
- Check both bytes of CTF2301 local temperature values before caching them.
- Use the schema-valid 25 mA drive strength for the K3 I2C6 pins.
- Link to v2: https://patch.msgid.link/20260721-ctl2301-v2-0-ef5fb342872a@linux.dev

Changes in v2:
- Replace the standalone CTF2301 driver with a new lm63 chip type, as
  suggested by Guenter, reusing the existing temperature, limit, alarm,
  tachometer, PWM, and automatic fan-control paths.
- Add the temperature thresholds, alarms, and automatic fan-control lookup
  table support which were missing from the v1 driver.
- Handle CTF2301-specific 12-bit local temperature values, nine conversion
  rates, 12 lookup table entries, shared ALERT/TACH pin, and optional
  22.5 kHz high-resolution PWM.
- Propagate SMBus failures from lm63 initialization and write paths.
- Add optional thermal cooling-device support for the LM63 family using
  the existing manual PWM control path.
- Move the National LM63-family compatibles from trivial-devices.yaml to a
  dedicated binding which permits #cooling-cells.
- Add CTF2301 to the LM63-family binding instead of keeping the standalone
  schema from v1. Do not declare #cooling-cells on K3 CoM260 yet because
  the board has no thermal consumer.
- Fix the binding errors reported by Rob by using a plain compatible string
  and wrapping the description.
- Document CTF2301 support in the lm63 hwmon documentation and provide the
  detailed register description used for review.
- Add the K3 CoM260 I2C6 pinctrl state and CTF2301 device node for hardware
  testing.
- Link to v1: https://lore.kernel.org/r/20250916-ctl2301-v1-0-97e7c84f2c47@linux.dev

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Yixun Lan <dlan@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Cc: linux-doc@vger.kernel.org

---
Troy Mitchell (6):
      dt-bindings: vendor-prefixes: Add Sensylink
      dt-bindings: hwmon: Move LM63 family to a dedicated binding
      dt-bindings: hwmon: Add Sensylink CTF2301
      hwmon: (lm63) Add Sensylink CTF2301 support
      riscv: dts: spacemit: Add K3 I2C6 pinctrl state
      riscv: dts: spacemit: Add CTF2301 on K3 CoM260

 .../devicetree/bindings/hwmon/national,lm63.yaml   |  55 +++
 .../devicetree/bindings/trivial-devices.yaml       |   6 -
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/hwmon/lm63.rst                       |  22 ++
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi        |  17 +
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       |  11 +
 drivers/hwmon/Kconfig                              |   8 +-
 drivers/hwmon/lm63.c                               | 426 +++++++++++++++++----
 8 files changed, 462 insertions(+), 85 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20250916-ctl2301-0416b073c280

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
