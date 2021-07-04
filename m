Return-Path: <SRS0=6USs=L4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42683C07E95
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jul 2021 06:42:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD7E7613D0
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jul 2021 06:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD7E7613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NAEXy+n++5xBFKoVg2ZUFSB0JjeEZdWHRMhvuJgiQo8=; b=QW6o2MURfj4bvwqK+b6I7CJyYs
	AfgZFxj7L22n2NiytX/usTuZdutRLK6/x/ovb3Rgzxyvuh+cwt+23uG+dinwIfOZUs6dOV6tKNqqu
	BWxDhIuaW/4HeVeVxJVVKAb7cK1Z+0G8dLbyFuTjSk/Nv1J8Uk6qWKFfAAU2GuXxwLR7IO8VwdgAv
	EOfDRtvHlekhiIOz6BJMf9TucQ+8vx67sevrxWkPj7oL27XwMhjk4QvKT4LXRfQ+aJEF6JYcGqkmE
	czVpgepACh6mGHWeljGIR8xm9Ys0sSDp195xhVAFKELitYV/motYdhiNV0a5lKRKk47qc0jN2Zvc6
	EJz9sHmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzvoo-005q66-7u; Sun, 04 Jul 2021 06:41:30 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzvoe-005q5m-2z
 for linux-riscv@lists.infradead.org; Sun, 04 Jul 2021 06:41:22 +0000
Received: by mail-pg1-x531.google.com with SMTP id e20so14931598pgg.0
 for <linux-riscv@lists.infradead.org>; Sat, 03 Jul 2021 23:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version;
 bh=k4DcP3qeapKa8X3Rl8oVQsXit181p3abThmV+z0PANk=;
 b=kvWShhOwdB2ROnbrvXp0nW2CsM80WNbgYVkpRydWDIN0zN7CmijlknRdIlQx3WyMPv
 6A0MsoiuElyCHJQAV4D7CqpBT++R21FaGt4anlPVfE5kpgxqVrq4yacsTvvqS/z4ZxwF
 xj+1RvTJiQxpD0NPtBPQqi+ZVEztFVPOJ3Fayczd/QX987rTXuLKA9XQ0kYOG4z4RAch
 0CARrGrkoONRVgDtQ3pJibP8SgJadJp0dN+yj2zIg1ErFE6klWBpQM+TnZ4Putjqq2wL
 IXnBd3zdxm5WNC9o7mwapRDMhYIJ2TA5sqSMt415ynIS7JNkzMGzlyCUcAhPAyubYVUP
 n3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version;
 bh=k4DcP3qeapKa8X3Rl8oVQsXit181p3abThmV+z0PANk=;
 b=mqZOsbERyaiMesYRRjG5Atv3S1jLn7yQJ9TVJf5sPStfEjCylhdiJqQDn7lWD+QG0F
 JY85h7CnYiMiyxJhl6QAIyMPgc4OMhbheFe9/wuE3v9RGnYfSzsHZ61cdG7vYeV++tkQ
 G9fPny2onGqCiJ4CcSU0eQXO/jqfnK/xyMGYAy+lKynuu6lGtKZB5SEpCW4wVO2gI3yD
 I7U4pznOGpUBycfRSKtQrRY7RifpPTK/3cxpe71kLc32S2KMVdmzQaWLHA/9BaR9janR
 4oSTc5PZrPOD14ZePbxz6DWjn7BfKC6otARQM76T/XLUSlpfTqinv2YEuIKzCzsXg7Yv
 TfBg==
X-Gm-Message-State: AOAM533/oO2VO3t5vcL6VH9XR3tPNXgBn2V/nqSqYzCuWhxbzRBMoe5D
 Ap+eTsPMiC5R/kq+vdxCp0caSgkVnkw=
X-Google-Smtp-Source: ABdhPJwPtetg3XPKc17F2b5603H2LCG4wut3BPMLKQBRGCXNaDvSv1+usrnna2/Aaj+zYNtAjvMvDw==
X-Received: by 2002:a63:de45:: with SMTP id y5mr2113882pgi.261.1625380878382; 
 Sat, 03 Jul 2021 23:41:18 -0700 (PDT)
Received: from localhost.lan (p1284205-ipngn14601marunouchi.tokyo.ocn.ne.jp.
 [153.205.193.205])
 by smtp.gmail.com with ESMTPSA id cs1sm16510634pjb.56.2021.07.03.23.41.16
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 23:41:17 -0700 (PDT)
Received: from localhost (localhost [IPv6:::1])
 by localhost.lan (Postfix) with ESMTPSA id DEBC19008FA
 for <linux-riscv@lists.infradead.org>; Sun,  4 Jul 2021 06:41:14 +0000 (GMT)
Date: Sun, 4 Jul 2021 06:41:14 +0000
From: Vincent Pelletier <plr.vincent@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: PLIC and interrupts received while no hart enabled
Message-ID: <20210704064058.79237058@vincent>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/U3Ub0XqF8ABd6iSPI9vtwBd"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210703_234120_247767_98207DFE 
X-CRM114-Status: GOOD (  25.09  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--MP_/U3Ub0XqF8ABd6iSPI9vtwBd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I've recently purchased a sifive unmatched board, and have tried to
complete its devicetree using the schematics.

Doing so, I enabled some sub-functions of its PMIC chip (DA9063). Those
which matter for this email are:
- power button, notified by interrupt
- hwmon, based on an ADC which signals conversion completion with an
  interrupt

The PMIC has an interrupt line, active low, connected to line 1 of the
GPIO controller embedded in the board's SoC (fu740).
Internally to the SoC, the GPIO has one interrupt line per GPIO line,
connected to the PLIC.

The issue I originally had was, which I noticed with the ADC but could
equally reproduce with the power button, I could only ever get a single
IRQ to be processed.

Reading the corresponding registers (with the script attached),
enabling IRQ and regmap tracing, I saw the output at the end of this email.

Here is how I read the register states:
- initial state:
  The PMIC interrupt line is in its idle state (high).
  The GPIO controller noticed the high state, and armed the
  corresponding interrupt-pending bit - this an important first piece of
  information.
  As the corresponding interrupt-enable is cleared, no interrupt is
  signalled and the PLIC does not see an interrupt pending. This is all
  good.
- after one button press:
  The PMIC interrupt line is again in its idle state, so the interrupt
  source was cleared. I know it triggered as the power button input
  event does fire as intended.
  This time, the GPIO controller noticed 3 interrupt conditions on this
  line: low, rising edge, and high. This means it was cleared *before*
  the PMIC line went high:
  - if it was cleared after, only "high" should be visible
  - if is was never cleared, all low/rise/high/fall interrupt
    conditions would be present
  As the "low" interrupt is enabled, I believe (but cannot check) that
  it notified the PLIC of the interrupt.
  But like before, the PLIC does not see this interrupt being signalled.

As a result, the hart assigned to this interrupt (here, hart4) does not
get interrupted even after it gets re-assigned to the corresponding
PLIC line, so the GPIO interrupt pending bits are never cleared, and it
cannot signal any further interrupt to the PLIC.
Pressing the key a second time, the only difference is that the GPIO
controller noticed the falling edge interrupt condition, which is
masked so nothing happens.

The kernel/debug/tracing/trace buffer tells a similar story:
- the GPIO regmap clear writes happen first
- later, the PMIC interrupt source register is cleared (the write to
  register 6)

Checking gpio-sifive.c and irq-sifive-plic.c, I see:
- the GPIO propagates irq_mask and irq_unmask to the PLIC
- the PLIC implements irq masking by making the interrupt line handled
  by no hart

Reading the PLIC documentation, I cannot tell if this behaviour of the
PLIC ("losing" an interrupt if there is no hart servicing it) is
intended or not.

If it is intended, then what is the proper way of masking an
interrupt ?
Is it to lower that interrupt priority ? (which I did not try)
Is it to mask it outside the PLIC (so on the GPIO controller here) ?

I did try the latter as a quick hack, and it allows repeated
interrupts, fixing both the power button and the hwmon subsystems.
But I am not sure it is possible to do this while being certain to never
lose an interrupt - but I am very new to interrupt handling in Linux.

Traces:

  # ./unmatched_gpio_irq_debug.py 1
  gpio_pin=1 gpio_mask=0b10 plic_irq=24 plic_mask=0b1000000000000000000000000
  GPIO 1: dir=in  in=1 out=0 irq_en=low irq_pending=high
  PLIC 24: priority=1 irq_en=hart4 irq_pending=False
  hart min prio: 1=0, 2=0, 3=0, 4=0
  # echo 1 > /sys/kernel/debug/tracing/events/regmap/enable; echo 1 > /sys/kernel/debug/tracing/events/irq/enable

  button pressed once here

  # echo 0 > /sys/kernel/debug/tracing/events/regmap/enable; echo 0 > /sys/kernel/debug/tracing/events/irq/enable
  # ./unmatched_gpio_irq_debug.py 1
  gpio_pin=1 gpio_mask=0b10 plic_irq=24 plic_mask=0b1000000000000000000000000
  GPIO 1: dir=in  in=1 out=0 irq_en=low irq_pending=rise,high,low
  PLIC 24: priority=1 irq_en=hart4 irq_pending=False
  hart min prio: 1=0, 2=0, 3=0, 4=0

Trace output with i2c interrupts trimmed for brevity:
          <idle>-0       [000] d.h2   102.707972: irq_handler_entry: irq=53 name=da9063-irq
          <idle>-0       [000] d.h2   102.707976: irq_handler_exit: irq=53 ret=handled
          <idle>-0       [000] d.h4   102.708019: regmap_reg_write: 10060000.gpio reg=1c val=2
          <idle>-0       [000] d.h4   102.708022: regmap_reg_write: 10060000.gpio reg=24 val=2
          <idle>-0       [000] d.h4   102.708024: regmap_reg_write: 10060000.gpio reg=2c val=2
          <idle>-0       [000] d.h4   102.708026: regmap_reg_write: 10060000.gpio reg=34 val=2
 irq/53-da9063-i-140     [002] ...1   102.708072: regmap_hw_read_start: 0-0058 reg=0 count=1
 irq/53-da9063-i-140     [002] d.h2   102.708121: irq_handler_entry: irq=5 name=riscv-timer
 irq/53-da9063-i-140     [002] dnh2   102.708159: irq_handler_exit: irq=5 ret=handled
(snip)
 irq/53-da9063-i-140     [002] ...1   102.709089: regmap_hw_read_done: 0-0058 reg=0 count=1
 irq/53-da9063-i-140     [002] ...1   102.709095: regmap_reg_read: 0-0058 reg=0 val=0
 irq/53-da9063-i-140     [002] ...1   102.709099: regmap_hw_read_start: 0-0058 reg=6 count=4
(snip)
 irq/53-da9063-i-140     [002] ...1   102.709879: regmap_hw_read_done: 0-0058 reg=6 count=4
 irq/53-da9063-i-140     [002] ...1   102.709893: regmap_hw_read_start: 0-0058 reg=0 count=1
(snip)
 irq/53-da9063-i-140     [002] ...1   102.710371: regmap_hw_read_done: 0-0058 reg=0 count=1
 irq/53-da9063-i-140     [002] ...1   102.710374: regmap_reg_read: 0-0058 reg=0 val=0
 irq/53-da9063-i-140     [002] ...1   102.710378: regmap_hw_write_start: 0-0058 reg=6 count=1
(snip)
 irq/53-da9063-i-140     [002] ...1   102.710763: regmap_hw_write_done: 0-0058 reg=6 count=1
 irq/53-da9063-i-140     [002] ...1   102.710767: regmap_reg_write: 0-0058 reg=6 val=1
 irq/53-da9063-i-140     [002] ...1   102.710783: regmap_hw_read_start: 0-0058 reg=0 count=1
(snip)
 irq/53-da9063-i-140     [002] ...1   102.711268: regmap_hw_read_done: 0-0058 reg=0 count=1
 irq/53-da9063-i-140     [002] ...1   102.711271: regmap_reg_read: 0-0058 reg=0 val=0
 irq/53-da9063-i-140     [002] ...1   102.711274: regmap_hw_read_start: 0-0058 reg=1 count=1
(snip)
 irq/53-da9063-i-140     [002] ...1   102.711770: regmap_hw_read_done: 0-0058 reg=1 count=1
 irq/53-da9063-i-140     [002] ...1   102.711773: regmap_reg_read: 0-0058 reg=1 val=0
 irq/53-da9063-i-140     [002] d..3   102.712183: softirq_raise: vec=6 [action=TASKLET]
     ksoftirqd/2-23      [002] ..s1   102.714162: softirq_entry: vec=6 [action=TASKLET]
     ksoftirqd/2-23      [002] ..s1   102.714173: softirq_exit: vec=6 [action=TASKLET]

Regards,
-- 
Vincent Pelletier
GPG fingerprint 983A E8B7 3B91 1598 7A92 3845 CAC9 3691 4257 B0C1

--MP_/U3Ub0XqF8ABd6iSPI9vtwBd
Content-Type: text/x-python
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=unmatched_gpio_irq_debug.py

#!/bin/env python3
import io
import mmap

GPIO_INPUT_VAL      = 0x00 // 4
GPIO_INPUT_EN       = 0x04 // 4
GPIO_OUTPUT_EN      = 0x08 // 4
GPIO_OUTPUT_VAL     = 0x0c // 4
GPIO_PULL_UP_ENABLE = 0x10 // 4
GPIO_DRIVE_STRENGTH = 0x14 // 4
GPIO_RISE_IE        = 0x18 // 4
GPIO_RISE_IP        = 0x1c // 4
GPIO_FALL_IE        = 0x20 // 4
GPIO_FALL_IP        = 0x24 // 4
GPIO_HIGH_IE        = 0x28 // 4
GPIO_HIGH_IP        = 0x2c // 4
GPIO_LOW_IE         = 0x30 // 4
GPIO_LOW_IP         = 0x34 // 4
GPIO_IOF_EN         = 0x38 // 4
GPIO_IOF_SEL        = 0x3c // 4
GPIO_OUT_XOR        = 0x40 // 4

PLIC_SOURCE_PRIORITY_BASE = 0x00_0000 // 4 # + source index, 0-based
PLIC_PENDING_BASE         = 0x00_1000 // 4 # 3-words (12 bytes) bit-field
PLIC_HART1_S_IE_BASE      = 0x00_2100 // 4 # 3-words (12 bytes) bit-field
PLIC_HART2_S_IE_BASE      = 0x00_2200 // 4 # 3-words (12 bytes) bit-field
PLIC_HART3_S_IE_BASE      = 0x00_2300 // 4 # 3-words (12 bytes) bit-field
PLIC_HART4_S_IE_BASE      = 0x00_2400 // 4 # 3-words (12 bytes) bit-field
PLIC_HART1_S_PRIORITY     = 0x20_2000 // 4
PLIC_HART1_S_COMPLETE     = 0x20_2008 // 4
PLIC_HART2_S_PRIORITY     = 0x20_4000 // 4
PLIC_HART2_S_COMPLETE     = 0x20_4008 // 4
PLIC_HART3_S_PRIORITY     = 0x20_6000 // 4
PLIC_HART3_S_COMPLETE     = 0x20_6008 // 4
PLIC_HART4_S_PRIORITY     = 0x20_8000 // 4
PLIC_HART4_S_COMPLETE     = 0x20_8008 // 4

PLIC_IRQ_GPIO_BASE = 23

def get3wBitField(plic, base):
  return (
    (plic[base + 0] <<  0) |
    (plic[base + 1] << 32) |
    (plic[base + 2] << 64)
  )

def uint32le_memoryview(value):
  return memoryview(value).cast('I')

def main(argv):
  gpio_pin = int(argv[1])
  assert 0 <= gpio_pin <= 15
  gpio_mask = 1 << gpio_pin
  plic_irq = PLIC_IRQ_GPIO_BASE + gpio_pin
  plic_mask = 1 << plic_irq
  print('gpio_pin=%i gpio_mask=%s plic_irq=%i plic_mask=%s' % (
    gpio_pin,
    bin(gpio_mask),
    plic_irq,
    bin(plic_mask),
  ))
  # Sanity check: must be on the correct board
  with open('/sys/firmware/devicetree/base/compatible', 'rb') as board_compatible:
    compatible = board_compatible.read().strip()
    assert compatible == b'sifive,hifive-unmatched-a00\x00sifive,fu740-c000\x00sifive,fu740\x00', repr(compatible)
  with io.open('/dev/mem', mode='rb', buffering=0) as dev_mem:
    dev_mem_fileno = dev_mem.fileno()
    with (
      mmap.mmap(dev_mem_fileno, length=0x30_0000, offset=0x0c00_0000, prot=mmap.PROT_READ) as plic,
      mmap.mmap(dev_mem_fileno, length=0x00_0044, offset=0x1006_0000, prot=mmap.PROT_READ) as gpio
    ):
      plic = uint32le_memoryview(plic)
      gpio = uint32le_memoryview(gpio)
      try:
        print('GPIO %i: dir=%s in=%i out=%i irq_en=%s irq_pending=%s' % (
          gpio_pin,
          {
            (False, False): 'off',
            (False,  True): 'out',
            (True,  False): 'in ',
          }[(
            bool(gpio[GPIO_INPUT_EN] & gpio_mask),
            bool(gpio[GPIO_OUTPUT_EN] & gpio_mask),
          )],
          bool(gpio[GPIO_INPUT_VAL] & gpio_mask),
          bool(gpio[GPIO_OUTPUT_VAL] & gpio_mask),
          ','.join(
            x
            for x, y in (
              ('rise', GPIO_RISE_IE),
              ('fall', GPIO_FALL_IE),
              ('high', GPIO_HIGH_IE),
              ('low',  GPIO_LOW_IE),
            )
            if gpio[y] & gpio_mask
          ),
          ','.join(
            x
            for x, y in (
              ('rise', GPIO_RISE_IP),
              ('fall', GPIO_FALL_IP),
              ('high', GPIO_HIGH_IP),
              ('low',  GPIO_LOW_IP),
            )
            if gpio[y] & gpio_mask
          ),
        ))
        print('PLIC %i: priority=%i irq_en=%s irq_pending=%s' % (
          plic_irq,
          plic[PLIC_SOURCE_PRIORITY_BASE + plic_irq],
          ', '.join(
            x
            for x, y in (
              ('hart1', PLIC_HART1_S_IE_BASE),
              ('hart2', PLIC_HART2_S_IE_BASE),
              ('hart3', PLIC_HART3_S_IE_BASE),
              ('hart4', PLIC_HART4_S_IE_BASE),
            )
            if get3wBitField(plic, y) & plic_mask
          ),
          bool(get3wBitField(plic, PLIC_PENDING_BASE) & plic_mask),
        ))
        print('hart min prio: %s' % (
          ', '.join(
            '%i=%s' % (x, plic[y])
            for x, y in enumerate(
              (
                PLIC_HART1_S_PRIORITY,
                PLIC_HART2_S_PRIORITY,
                PLIC_HART3_S_PRIORITY,
                PLIC_HART4_S_PRIORITY,
              ),
              1,
            )
          )
        ))
      finally:
        del gpio, plic

if __name__ == '__main__':
  import sys
  main(sys.argv)

--MP_/U3Ub0XqF8ABd6iSPI9vtwBd
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--MP_/U3Ub0XqF8ABd6iSPI9vtwBd--

