Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AC6C48BEB
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 08:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=re427FYBnT3iq31caRltQm629+8UwR981GXamHSmSww=; b=gFWQcgnDzViuZB
	fN0uGh34GMZgxMjIoTEUqkgtpJosOPNFSQLtNm9UeZjAaBGDYAMrtuzAQvj+WXampcIup8vAUXeiE
	B6BQxOjrtFwZ6uUUhavc8puY6VBy7imU6Z3LCyNDslrg6DyB5TUZIxVwXjOJ9mRG4tyE5zAQzG27X
	nlPi8EnUQnii1ARzKj/X0IoxbbwE0Zi+GvIK7G5po0dB1DEIv7kMfxoNHvT+Zo0K2Ve9iqgT774Aj
	XtEHaycExhL9VxuLENAqIzokmsi9+pT6yrie3uWgtc829z1cbxG7eVqkZSjqFq/B1BUGBT6bMTZu5
	v5QNVXCuJjHs5mWeMehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4CB-00000003wx7-0bV5;
	Thu, 22 Feb 2024 08:12:43 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4C8-00000003wwa-2ZLb
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 08:12:42 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5ce07cf1e5dso5924155a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 00:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708589559; x=1709194359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=srJ7CIKPfZgDl9Um7d4eDADM8otcquGOUbdJDDVwdH0=;
        b=NRzxLolbQSETKhaUthepCcr+iJDfI2g+yCWLXkygv8ZQolCGdRD8meZDnMu4yTmtxQ
         XfE2s5m1jpjXeSmqbwBi5TpJ3NeWNZqa1G/grg7hskG3B6lzAKc8iOeIGZJgQu2w2kQB
         Wu4kIyewSKBgrfZbOFf/4y8aBktAqjaVajYoRrdGSK75AUwazBT3LLegTDX427I1/djV
         PGuAgo4WKSO1tYKOTu1DNNAHEjzHRP10AVI4Z31VXkchQ+JVvlht5LBGw17veoz+nKF3
         8PwIXj2uP7j1zownwf2tP2T3vEuAuN0Pdyu43fO8w4caS4T7sSYx+yKXP6aLxMfbptgI
         3L0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708589559; x=1709194359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srJ7CIKPfZgDl9Um7d4eDADM8otcquGOUbdJDDVwdH0=;
        b=fs260dt8bMAqUEZaZQ+xq9fICcDsyNRFM8/WwYweBUUoNa+MVXX0Ruo8ekg4YbaqC2
         1YDv4r5m47tbcuIgIcvIOwd4tHTRsaZ2zCuTd4pDogrC2m01UzEIAmRpMOztPBPXvCiS
         faPJ6i4mqDArN1oczu/GKnHkI7k2FQE8n1oAHQjPa919rAgvt04gASIJ/nq3O2k4qz53
         7CDwEkesex8LIu+Xsp7AJL5HDnTpBHCuYHZKi+f+tDDHWVE32aMmttylCW8lpwy8NnuQ
         Lvn3rUjejXM2Bai8ZhBI0j+P5z9voBl533u91bnSN85vn4D4wOAPNcI4iBTe395HMJID
         BQPg==
X-Gm-Message-State: AOJu0YwR17c0NFBz8j2spLe0Mhp0VjGyvl4C8v/1tIr6iC9o2bXbdL5h
	qHDrcTQtAUQIS6phj6Psi7GoeNT0gmOSgmrN9Cvj+aY9Jc1Yk53UYNYxaYYg83gCcMmO8Yxi2P7
	aL9v6bWWgNkwz6GQ6oCjSXJs5Wu4FMgdFCWx6K8EZYRB6QieD4rteQNB7I8MGQDDqTp6olIpnqz
	F6Xky5X/X4qH+7VLWPGbY4MT+BYLhznI0Ejhzw6RnvLAQRm2//AWc=
X-Google-Smtp-Source: AGHT+IH1M21xaAm9IWGe9uyygy5ZFYZAnDH5YlVy5Z+XKY/q4Ud1AAgANQ7ADpjUjZtqZ4J+0WXtEQ==
X-Received: by 2002:a05:6a21:31c8:b0:1a0:8a46:c3bf with SMTP id zb8-20020a056a2131c800b001a08a46c3bfmr15856784pzb.21.1708589558614;
        Thu, 22 Feb 2024 00:12:38 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id lf8-20020a170902fb4800b001db5ea825b2sm9412796plb.123.2024.02.22.00.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 00:12:38 -0800 (PST)
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
Subject: [PATCH v9 0/3] Change PWM-controlled LED pin active mode and algorithm
Date: Thu, 22 Feb 2024 16:12:28 +0800
Message-ID: <20240222081231.213406-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_001240_696945_EDF93B2B 
X-CRM114-Status: GOOD (  11.80  )
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

Nylon Chen (3):
  riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's
    active-low properties
  pwm: sifive: change the PWM controlled LED algorithm
  pwm: sifive: Fix the error in the idempotent test within the
    pwm_apply_state_debug function

 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 12 ++++--------
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++--------
 drivers/pwm/pwm-sifive.c                            | 12 +++++++-----
 3 files changed, 15 insertions(+), 21 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
