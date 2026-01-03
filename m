Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D817AFC6180
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 15:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jkxZOiX86w6O8k3wVJ9RFvgZIfUMwb96+jgEUaNqH7I=; b=fM1LKMIDuIrt9h
	zN2FdefUvV6Yz4Bt9OAl25tleHUK/QDrrLCyDCAN/kPNNQpX7+2UEeRGKEu+gLDUKeTcGKNrcy9T+
	KVOvRjEiOunAf6GYnN7IsRIHqOJFRa5+Ilpb34O+6cufRJoxqI8Gjg6bX+LlpZqOTE+AK7wB4GfkJ
	X0F5rzGRb9pP593LOLpbAChARSk+hf4EGtqTxL1vHSlT4S2nIIvS7+ch0I3VGM4UM3v/nDvQgIWTL
	ur1RqiIHyNriCI2+k5RREf4Qi83WqJcy0mKIG0r7gOpbE6CfJaoy6BIUpzdsyzGPefEExiDoFOEa/
	16Qly5NpbUlMqKSD6jHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3UU-00000009QtG-3GRF;
	Sat, 03 Jan 2026 15:24:30 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3UQ-00000009Qs2-3fEX
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 15:24:29 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a0d52768ccso159260265ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 07:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767453866; x=1768058666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hicfMUjmbw+QHk3n6PAlOK0aZkOq9/nKehIWGD00WH0=;
        b=IJtg5/NLitGgV3mbLz65V/T5hX3Xhw1FmJYMBDJTdyYRDu3q5GzyZEoCtbzfT52+GN
         HYatzRNHP6lIMLGs51lhQ3JQ7G32pDgo2p3Yf9atnOLhI76jaa5fWWuYr6vAw8iT74zt
         hW9T4FVxZ55EUv8ZEDfE7Q/2Gx3UPT649yOHcAJ3A2fYLY4tgZHKRFkubLc/Sa7Rucg6
         WluWojXaEQbkSPN0PpM5zR0ADDF8zeGu+GBWypb+hLC3NoYcmdLgZ4FjYqImTD32NKU3
         DMR8Iq7quIAq0N57RqXtNhE2DnUrKfu5O4B08iXs8hgjYhPBO5QF/TYGJKXEaLeY6jPD
         puCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767453866; x=1768058666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hicfMUjmbw+QHk3n6PAlOK0aZkOq9/nKehIWGD00WH0=;
        b=ilWqh8RMbkCfFRh1HQjFKX/jusfEU2UgUr1cVxx+hAwggkf1IYlResq24VEQnEMSg4
         N/PIwEPV1Nqrdmt6kB10hXUji3Nxatc4Mh8PqGJkMKDErTnir2VTrcZHnfR2uxe265pu
         Q6Im27qbdV2IAGqoVa1lUU4WKtvvVJsF7PZT3TT0r/8xGGRD7ecUtXHeOjyPR2deSKaP
         ukopp3DlWoGEXIDdnIYtYjSZdumTHhiPadlmgah+npBhh1AN5NMB6Ae8Qg2WaOC5YzDl
         dHdF2u6DjAOskesqQpLAmL8754T2l+ZN8AEgP7q2fTFnQh1P8OD1lQT4s5d+d+zcKfll
         AYRg==
X-Forwarded-Encrypted: i=1; AJvYcCWMAnAawo4xpLqYanrv4NUGRbTqBiQs/c3lOaEYkqsOoAwtJIFndo6esjEversbwDSRDWgcHshgL8O8Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaB78mmp2DlPKvalhoTmQSN7fYPvjHb7rkocCV6OfEqJDe2ZuO
	SrHZyOwbqEF3VsSJf8yZiDHhSBJRdgM9aYc5AZyKuk/QX4JqU1nbo175
X-Gm-Gg: AY/fxX6Ml4G0ZneXxuWmIguMepdIbXXJywCiLXZH0Q3wyysBfDzdDQ0rRzwXM2pISX0
	zf/IkZ+zHqaASwqLMDu3VemTpsTUI2NwluyeAfghYYW0YA36IT4MMoT1H0XD6+87u5UQMCrQGWw
	Ktn3PlGbx5B5PJ9oF0u5AldmXDTUdAaUcAfV9l/QwLE8nqfCLUwGji/uw9h6yU/NP20GV9zRbc7
	AUXjygeRGumRulD4LZfzZcsj1tAHh5kyG6z0VSG5PEOpy9x9qsDiDrEbL4nPgXFm+QbdNeCeVLQ
	RW2pxrCJjquvBBcAyOpt8/DweKHx+ntU/fYLV98ihEjPRkxgE3hxCuw8idHbcLsimzk3W/F+Llt
	BBQaY9zydR8rUfPOsJ/dRpLhhJb+sj0qWWPeqIp8aDsZBWGb6w6Y1+2wAQ3xlX4juQKgZBWJMz4
	cp0dEE/J5ZCVt9joEN9vanisXh9fYX8ZMuoKdTvx5JFMVYEE/V64Gp/UG7LIGqM7mJ5iT3/XVSA
	GI=
X-Google-Smtp-Source: AGHT+IHkJssiBmursdyzh3wg8jKWzXxaoy5QZmOvyZosTsH6bVwm8hrvSg0Syw3FUSaNH48MoyKl+Q==
X-Received: by 2002:a17:902:e785:b0:2a0:b467:a7cf with SMTP id d9443c01a7336-2a2f1f71a56mr408784195ad.0.1767453865690;
        Sat, 03 Jan 2026 07:24:25 -0800 (PST)
Received: from localhost.localdomain (123-48-16-240.area55c.commufa.jp. [123.48.16.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f4770a256sm2107802a91.12.2026.01.03.07.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 07:24:25 -0800 (PST)
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	nick.hu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Naohiko Shimizu <naohiko.shimizu@gmail.com>
Subject: [PATCH v2 0/3] riscv: Fix potential spurious timer interrupts on RV32
Date: Sun,  4 Jan 2026 00:23:57 +0900
Message-Id: <20260103152400.552-1-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_072427_001943_8C170725 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

This patch series addresses a potential race condition when updating 64-bit timer comparison registers (stimecmp/vstimecmp) on RV32 systems.

According to the RISC-V Privileged Specification (specifically section 3.2.1 for mtimecmp, which applies logically to stimcmp as well), updating a 64-bit comparison register via two 32-bit writes can cause a spurious interrupt if the intermediate state is evaluated by the hardware.

Currently, the Linux kernel (including v6.12) often writes the LSB first or does not use the recommended 3-step sequence (setting LSB to 0xFFFFFFFF first) on RV32. This can lead to a transient state where Time >= Compare is incorrectly true, triggering a "ghost" pending interrupt.

Changes:

1. Fix suspend_restore_csrs to use the 3-step sequence for stimecmp.
2. Fix KVM vcpu timer updates to prevent vstimecmp hazards.
3. Fix riscv_clock_next_event in the clocksource driver.

Although this hazard is difficult to observe in QEMU due to its instruction-boundary interrupt polling, it is a critical correctness issue for physical RV32 hardware implementations with asynchronous comparators.

---
Changes in v2:
- Added detailed architectural background in commit descriptions as requested by Anup.
- Cited RISC-V Privileged Specification regarding 64-bit timer updates on RV32.

Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>

Naohiko Shimizu (3):
  riscv: clocksource: Fix stimecmp update hazard on RV32
  riscv: kvm: Fix vstimecmp update hazard on RV32
  riscv: suspend: Fix stimecmp update hazard on RV32

 arch/riscv/kernel/suspend.c       | 3 ++-
 arch/riscv/kvm/vcpu_timer.c       | 6 ++++--
 drivers/clocksource/timer-riscv.c | 3 ++-
 3 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
