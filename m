Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60F9C47422
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jan 2024 07:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AhRsbizDDNtV2sCWW8z+ivrUWBYCzDspPk2QVmeUOzg=; b=pi3JL+usiRSjUX
	dE2fmr94n6FYCVAoBO2BqvjgMfsQojf1jwBw3LZb5+GR0DaEILDKraGUPolswiqepvvVLjcxVFzjQ
	U+imMGoB8JBvbp2maTaW8Ym+MfEistT/rAW/UO+FK75CJh2A3FNOtojpuHSUP8FcwtD7lK7th9IjG
	VwYPU8/kHQGpgbCfGlj2TPMcxtw+wPmmZLJFK1izAvqs8xWavsoQASFQmmMIDOvECpfHKgJoQkqrV
	QbmSDZ3FURVDCbYIgRR6CcsHkC6TBrvmM269UUPhJ7vl2scSoQMeDNorZ/XhSiKITYYop4CUtU5Om
	pqJtsk13XD+LXqpbidcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTGpd-00000003NOp-3hBF;
	Fri, 26 Jan 2024 07:40:57 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTGpb-00000003NOQ-0h7e
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jan 2024 07:40:56 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-53fa455cd94so36530a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jan 2024 23:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1706254853; x=1706859653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xx1YP8E0gDhv13e5xrfsDSvsYylKfZXINIzQWoz/9aM=;
        b=Ic2wqkeSAmTqVXUJV5BKDqqbT+Oc+kiDCFo0jdxT3mwOgfT6kPiHcyKxFsJXLMKP+B
         PyMR0Y5dQxNA/vsXcffIKeLfKQAt1hIo8FhAVf/zQBzeZaAbrgj9ooxZzK93CKdn/VTU
         QjkPfz/8tnBe1c9d3dRqj1G588Bd+ZzH+WmPPa+3C8oA0XOmBLoJEGqwVezE3AM+qafV
         k1OjcjF5qrUFaQ0pnBJ17GcU1U5E2IZm9GeQoJAxEPiEM76S3vRIx0/qZyEkTDIy/W3o
         YB3AKvi8KBDUL6olo6TouoE46cTQDfKDMDDio4yG8QCf2t66nuPdLLTeGCeJQrV3x+fw
         whhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706254853; x=1706859653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xx1YP8E0gDhv13e5xrfsDSvsYylKfZXINIzQWoz/9aM=;
        b=BJRPMAX0K40iEzDp8hvbNEpCSV86kW0XyYvtf0krT5Kl13DsgTpZbvyqYpZz96Q0IU
         2+hvaFgWoHaXKKXNJRirwhC1GU9P3qZuw8NJ6s4T+IAk10u0WmfXBIcl1ISVy+3XaM9c
         nzv3iaBfJmQfaKVL4MVFTsy/cXgBcNyhubhevzuZUHuKnjoThrOojxlM8s/umNfQ3Y4a
         aeM8+G1VQbWiTIz8m2CzqIrMnDb6S9FDUYahTlEjR6L74VXjZKPbyrF96khCQEMSdge5
         DsEItGO9WqaIM93UsluaUjPHHy1DMsPFNuCLMbGJoGtAlUlkpffyKwApsEIOrlZ0blTf
         uHDA==
X-Gm-Message-State: AOJu0YxAxi+Ywtw9Q+ixHJoXtiBjVcrTXENsEkYyFj06cItBz34J6Az8
	mE/iXT9Q+6XxlGTMqcOnpGY7ZqlnLGu1Jc0yVVT1aCI9Es38A8kyh+9Laq6PeSzvgJZHeBalDyp
	G04ohE/H6aevaoh4Rs6q8wrUPWtaKtqOsNKqgK6xWD3NN57yS+qsVIKc+qpCUSWuMJ503Y+V/+F
	sEJIyjPagOfSYs+yKDQEUsqCUFlSGGKxZS0LJk9AoJ9+glrNgZ/Ow=
X-Google-Smtp-Source: AGHT+IHP5PFE9yGmJvScZYLZjep7uFpEEjPgLkYQvtNEeX3TGPGSglkGBAttrdjpcX/oTgscOsZZKQ==
X-Received: by 2002:a17:902:e809:b0:1d7:51b5:1f76 with SMTP id u9-20020a170902e80900b001d751b51f76mr1414966plg.95.1706254852369;
        Thu, 25 Jan 2024 23:40:52 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001d4816958c2sm521066plf.166.2024.01.25.23.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 23:40:51 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	conor@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de
Cc: vincent.chen@sifive.com,
	zong.li@sifive.com,
	nylon.chen@sifive.com,
	nylon7717@gmail.com
Subject: [PATCH v8 0/3] Change PWM-controlled LED pin active mode and algorithm
Date: Fri, 26 Jan 2024 15:40:42 +0800
Message-ID: <20240126074045.20159-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_234055_248403_3495D9BB 
X-CRM114-Status: GOOD (  11.15  )
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

According to the circuit diagram of User LEDs - RGB described in the
manual hifive-unleashed-a00.pdf[0] and hifive-unmatched-schematics-v3.pdf[1].

The behavior of PWM is acitve-high.

According to the descriptionof PWM for pwmcmp in SiFive FU740-C000 Manual[2].

The pwm algorithm is (PW) pulse active time  = (D) duty * (T) period.
The `frac` variable is pulse "inactive" time so we need to invert it.

So this patchset removes active-low in DTS and adds reverse logic to the driver.

Updated patches: 3
New patches: 0
Unchanged patches: 0

Links:
- [0]: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf
- [1]: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf
- [2]: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf

Changed in v8:
 - Fix Signed-off-by and Co-developed-by typo.

Changed in v7:
 - Remove active-low strings from hifive-unleashed-a00.dts file.

Changed in v6:
 - Separate the idempotent test bug fixes into a new patch.
 - Move the reversing the duty before the line checking
   state->enabled.
 - Fix the algorithm and change it to take the minimum value first and
   then reverse it.

Changed in v5:
 - Add the updates to the PWM algorithm based on version 2 back in.
 - Replace div64_ul with DIV_ROUND_UP_ULL to correct the error in the
   period value of the idempotent test in pwm_apply_state_debug.

Changed in v4:
 - Remove previous updates to the PWM algorithm.

Changed in v3:
 - Convert the reference link to standard link.
 - Move the inverted function before taking the minimum value.
 - Change polarity check condition(high and low).
 - Pick the biggest period length possible that is not bigger than the
   requested period.

Changed in v2:
 - Convert the reference link to standard link.
 - Fix typo: s/sifive unmatched:/sifive: unmatched:/.
 - Remove active-low from hifive-unleashed-a00.dts.
 - Include this reference link in the dts and pwm commit messages.

Nylon Chen (3):
  riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's
    active-low properties
  pwm: sifive: change the PWM controlled LED algorithm
  pwm: sifive: Fix the error in the idempotent test within the
    pwm_apply_state_debug function

 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 12 ++++--------
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++--------
 drivers/pwm/pwm-sifive.c                            |  9 +++++----
 3 files changed, 13 insertions(+), 20 deletions(-)

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
