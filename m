Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DA5E77188
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 09:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1M6WmQANYOU0q9SN/9oPlGFS0m0OMPOhR6/g4OotPaw=; b=NuS0HSZtVIs3iv
	lHE/vajidKJFWBt6e3o04tH9WmL6VCL1iEkgZoKus6u03vm9SeyTI6m6kv32KKNUvBId4vDdsg0+Q
	Qx2XzRRCKA95n+zCA3Xj9zL4UKvBCsv5TbpkTWZu6WO4b65/9dYLykUFG0mB4HBcST+ZZ+3xiBB2d
	4TGyc7zU1+KvI0Y0phW1m15HPdS1IpMrLo4VLYa2mZDU6hwkMZzMBIq6GHA13fEwyGm9VkpXcZRyy
	5iP2HCpWTuvgO51DPrGZLtIJifOXAUyOCdsyowxFznjSwdkDffCPeI5hPFsYtrcaA8RxP4gfXeXGK
	kQjl8sVHPSNNkcp3S5Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1Ct-0000000BaJZ-0F40;
	Tue, 24 Dec 2024 09:28:03 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1Cq-0000000BaIv-1QwR
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 09:28:01 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21649a7bcdcso50430275ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Dec 2024 01:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1735032479; x=1735637279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oLPJJm7xVkKFHYMyvGiaT5Jiz+ZLFC1VkzAq6OtMdxs=;
        b=MoqmaT7HlsvhMgtqZ+Vgc3ZNd0BRt0xHY9aW/irbGVBJxeF9sKjcpEN9tOfTQd/tSW
         b/ECe/Rw6OngFfbEK7W9oVAq2A9QxiHpiNK17OvfrkOu4xKBptknzIKFaXLycvniify3
         ky/mUX9Ma3EaN8m555AQbkkBKiqe4/OhyBv8/nW2gbpkkrYH0IxtZQ4zLeXIVG8aseSP
         PWOJWfI3OpVXm27L1035BudcPkLgLImypN68ggFg9z3Air5yYABdJggK5Ag025OL1jcU
         5wJY6s1t6PqqVfALN3LZNX4pRGQjurObwBZyETKcNUQUXmUFS9oM/oKGjmdkeWUAsG5F
         nyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735032479; x=1735637279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLPJJm7xVkKFHYMyvGiaT5Jiz+ZLFC1VkzAq6OtMdxs=;
        b=Leg511FOpYoxGTFoPJE2wf6aDJzwF3sVmTRpaIRQPaQ5VyHHg4iOzLlV3TOSpn/MvU
         uDqCRpOqlcoQ6xxgnxNHHJw5iC+czpuBpfKbSFuiH4VmOzB4+UUgzA+mlIzoJQ6eoWAy
         yoA8JOSrFoijzOUud8dfEAkByOnotUDy1u6k58dHtI8QK4gvFTRbn97y+Y8wjR/Z5yLE
         UQ37iXVolkYQGXhAOTeqX4cd4PNUn8ojjh/+lqdMYz+f9yyH3c9+bSSExDKnb/zxuoF3
         M1j/P14smD8NA8z0zrGQgFqkpRKBUxlB2jvuKs2XCsIAFe7knFK7fpA558vH0P8rp9Y4
         hRYA==
X-Forwarded-Encrypted: i=1; AJvYcCXIYHxjVJNsvBGWdKmoirD4DmtTXItvKLINcfjWAgYMnsqk41G4p26Obxqibli5IUtNOF2MHq053OfQmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwC+a6TdErrgwTPS4OuLdVU7xN4Iwvj1HcWAv8j43atwFOhC64H
	+zk1hydCReQzQV5k7/ZxKTRz4sWmI8fB7O547BS32QQ9F+uPCPkMFSBWLtn4BRY=
X-Gm-Gg: ASbGnctbB2gN4EHrAMtHEsAKpSdWR9/koE2A/UG5UCe2rZt9RtMqvXMDqJAzBeYLote
	fwyY5x32mdsRxtz/cHSNE2qTfLuETivnGjA+r+CN0hiNFfsHISLTTyC7klz9FWIarlDpv9CRwUt
	RCaHxBFwmz3oElwLZYFIMd6v7Nzwpo9RbkexgQs5ZzTRnmbQuLA+mtlyvcJgRGGrmdx0pI7EKyk
	bMKTUz96N5rzdNcM6QN5o1fC4YvE6O3YrX9+uHLF9KAKCDNSC7aPm32LnCms2Nd6vtQuwF4DkUr
	s8BFsmheaorwtCqVAg==
X-Google-Smtp-Source: AGHT+IH+ikoM6foMB1cnNkvpUi/3NR/XA4SwC00DSiVzFNckaK82lZIWct9AHrEMi4yCGHwTjvIZrA==
X-Received: by 2002:a05:6a21:670b:b0:1e3:e77d:1431 with SMTP id adf61e73a8af0-1e5e04a3035mr26453787637.23.1735032479006;
        Tue, 24 Dec 2024 01:27:59 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72af8dcff60sm516341b3a.152.2024.12.24.01.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 01:27:58 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nylon Chen <nylon.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and algorithm
Date: Tue, 24 Dec 2024 17:38:58 +0800
Message-Id: <20241224093902.1632627-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_012800_404481_1622BD9F 
X-CRM114-Status: GOOD (  12.23  )
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

Updated patches: 1
New patches: 0
Unchanged patches: 2

Links:
- [0]: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf
- [1]: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf
- [2]: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf

Changed in v10:
 - Add 'inactive' variable in apply() to match pwm_sifive_get_state() style
 - Update comment about hardware limitation - it cannot generate 0% duty
   cycle rather than 100% duty cycle

Changed in v9:
 - Fix commit message to adhere to 75 columns rule.
 - Update commit message's subject.
 - Add a variable for inactive logic.

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

Nylon Chen (2):
  pwm: sifive: change the PWM algorithm
  pwm: sifive: Fix the error in the idempotent test within the
    pwm_apply_state_debug function

NylonChen (1):
  riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's
    active-low properties

 .../boot/dts/sifive/hifive-unleashed-a00.dts   | 12 ++++--------
 .../boot/dts/sifive/hifive-unmatched-a00.dts   | 12 ++++--------
 drivers/pwm/pwm-sifive.c                       | 18 ++++++++++--------
 3 files changed, 18 insertions(+), 24 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
