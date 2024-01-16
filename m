Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913B8C47077
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 04:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q/6cPA14eRf1WVGGt0F7G8GaHDBjQ4IAnbNrqN30EPA=; b=y+7zTs/DdC6PIr
	S6K/vH727P9okV2S8w81eNBpGjSxZxUB8rpK1q4w6XVU6tLRz1gJ3bjEAZFU5Dg4vhIM7DKYd+oR8
	uLUWGMc+GY3NxAElsirIS1MvayKqfhEAYuhDtHhc6dRGJyK3GA1WqDXW33rL/MJU9/daLsYVvTA7f
	I+jXgzoud7EW+gjBoKR44GYrC+sOVxg+A56UriNdmqxQhhbozeT6RjgsqhWWdGZIBxdPtab0h6to4
	3ZBNpP/eLEsvDs1bxAZPaPaoRbTkDrGy/by/6o8r2OmeY6yUlQ+EjgOXLpk8TzmIWkXUUtFHg7ohx
	Ak6CzJdqFIHMbIIZUFtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPao8-00Athd-2L;
	Tue, 16 Jan 2024 04:12:12 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPao0-00Atdc-2g
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 04:12:07 +0000
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3bd562d17dcso3205203b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 20:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705378262; x=1705983062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CWChxn/etZA7mSQDyr9oFtgmtnkj4VOXoiVZv/wz84A=;
        b=fgH6BKMYw4iMHp9sE6ivSWZ8qIqvIneJ+sJZy5okZ0nWj9LQTAPfr9B8EHBjcC6G3i
         j9gYu35+Gw2Sh2/+ME6GM46Ask7WTk6MGjglvKeT+ozJzsgzgTEltyX9zGk2ni86L7fj
         yqLMXynWan3vI+hVOKNz+62fkqh7ZhJhSO7y+DV5D94dQNnYM+IsbgUy9aA+fDMTE9N8
         dJZS1yaTc5ECFFTJYjb6PQlTLrX0cYGD3B5lJOFFKO+WfEffik+3gnCaob7y5VbRjxvM
         4vcN/YvB1OKSqEhhKSFhSH/kl8AgEHHEZ0qQ7O1tWKySNyGsh6bQppLNmElKD+pLwaKo
         qI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705378262; x=1705983062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWChxn/etZA7mSQDyr9oFtgmtnkj4VOXoiVZv/wz84A=;
        b=binVzntUMKilA7e+OOvLOKD700EBFJ5UeFc1Vu37UA3f7ELYgvY8uAIAjvZX6NsxXZ
         LBLdpFgDEl8WhkOLuBKHV1cjilZQNM9HsL0GUfkNEJfsGwAoBLsjd44KxuDWVHZEA5Ec
         DmRFlMD+cUfoe341INJy145lHTxA55b3QOE97NnhtNBGc+HLgJb1NfxL3q/c1+smeFV3
         GqMozIIjGc/ZpputI0HiBikNY11DMWiyn2eCmxF9o5YWLyFL20TW6i3ekXkvUfgS7evg
         aikTVVXAQ5vF3tz+VPoJwDjWrDA5i/mZh/lOrVb6xdB6j3jN367vKfLMmQ9MFmHUU6R9
         2Q/A==
X-Gm-Message-State: AOJu0YxE6qVia6VHQhMvoOgWOAVOlvYc+itXL0mHaIB3WjsfPgp9+QYq
	+0Ws9w0li76OsG/Yligs0wxaUK+NmveL3w==
X-Google-Smtp-Source: AGHT+IEfWmKba6ELkIwXAP6st2nVX8PTgS7saJtspXT16S/FqI+k9e3xGVVjwrIlscveCrb7r7KkdQ==
X-Received: by 2002:a05:6808:21a7:b0:3bc:29c2:2b97 with SMTP id be39-20020a05680821a700b003bc29c22b97mr9492923oib.88.1705378262660;
        Mon, 15 Jan 2024 20:11:02 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id e3-20020a056a0000c300b006da14f68ac1sm8348585pfj.198.2024.01.15.20.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 20:11:02 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	u.kleine-koenig@pengutronix.de,
	thierry.reding@gmail.com,
	aou@eecs.berkeley.edu
Cc: zong.li@sifve.com,
	vincent.chen@sifive.com,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	nylon7717@gmail.com,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [v6 0/3] Change PWM-controlled LED pin active mode and algorithm
Date: Tue, 16 Jan 2024 12:10:51 +0800
Message-ID: <20240116041054.11641-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_201204_867417_B415F9AE 
X-CRM114-Status: GOOD (  11.12  )
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
New patches: 1
Unchanged patches: 1

Links:
- [0]: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf
- [1]: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf
- [2]: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf

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

 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  8 ++++----
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++--------
 drivers/pwm/pwm-sifive.c                            |  9 +++++----
 3 files changed, 13 insertions(+), 16 deletions(-)

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
