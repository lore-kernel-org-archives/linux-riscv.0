From: atish.patra@wdc.com (Atish Patra)
Date: Tue,  9 Oct 2018 11:51:21 -0700
Subject: [RFC 0/4] GPIO & PWM support for HiFive Unleashed 
Message-ID: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

This patch series adds GPIO & PWM drivers and DT documentation
for HiFive Unleashed board. The patches are mostly based on
Wesley's patch.

Wesley W. Terpstra (4):
  pwm: sifive: Add DT documentation for SiFive PWM Controller.
  pwm: sifive: Add a driver for SiFive SoC PWM
  gpio: sifive: Add DT documentation for SiFive GPIO.
  gpio: sifive: Add GPIO driver for SiFive SoCs

 .../devicetree/bindings/gpio/gpio-sifive.txt       |  28 ++
 .../devicetree/bindings/pwm/pwm-sifive.txt         |  32 ++
 drivers/gpio/Kconfig                               |   7 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-sifive.c                         | 326 +++++++++++++++++++++
 drivers/pwm/Kconfig                                |  10 +
 drivers/pwm/Makefile                               |   1 +
 drivers/pwm/pwm-sifive.c                           | 240 +++++++++++++++
 8 files changed, 645 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-sifive.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
 create mode 100644 drivers/gpio/gpio-sifive.c
 create mode 100644 drivers/pwm/pwm-sifive.c

-- 
2.7.4
