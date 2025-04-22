Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F093BC369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 09:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WF+DAd9ncxKgeDu2tZLEq90KwBKg7yAXHalE+EzVkoE=; b=R8qcECJy3+lSOS
	VU6egaQDuj2ta3m3vaawXf1A29CItmXQjtbcLMB065RFD+CV5oYwc8raM+urpEePJgTfQe0V/K4oB
	B48twmOFPBRu8lyicwQSvpekOuRsdkl45U+ISlGpjUbtRCRh2wuYCPd0yVnQgKN+KH+PiZdvDM01r
	N8x4IifA14Fm/gGQCBwPQbMLJRBEwNral0Yr5z56INLz2CMxddbwX5EA1ADW7BIgBvcJnSDiZuOhn
	YwZQut6EQchaSEtY5MPQNBTTtLS09sNJdmYOphK2xv6N0CwQyLJ+KB8aZw2ooS+Ihp82k/v7zGXdy
	EuPLbKLyQhNFNgrvAxeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ACS-00000006bin-1M02;
	Tue, 22 Apr 2025 09:45:56 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79CN-00000006ORN-34q7
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 08:41:49 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2264aefc45dso78119035ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 01:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745311307; x=1745916107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGVHUzQ7HsHW4QPhu/ISOoKLCvthpJGLbl2UU7uWwpM=;
        b=TkfNyC5fq9fq2zunjzfJRok7t8NxEsQJO3yAI7p3j7gf0WZcFm4YvYhwy1j9kSoWcv
         wCekyFPd0th4MwqXQvTuzk+glLTWkb+O2xdhZmqotQlx7J7a1i8Wyh2yi+Ik/DQW+JDv
         KKU7VyQQlt6NgctXd1OgOyLQHm5yScfDxBG5cx71SuIQCpNW/XaB9gxCsPqQqfBHoqJv
         LEe4jVbxQ4paAyMWUuQYdysYTfK9RJwzaWhBagdlGSiEbLEiJAJ/fw5vLhfXCARzcmym
         lX9WdsJYWeAhRrHKldyDERKVzajnRhbA93aGb+ALFShODAD55ndYn1W7X4LILw2q+2RU
         AEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745311307; x=1745916107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGVHUzQ7HsHW4QPhu/ISOoKLCvthpJGLbl2UU7uWwpM=;
        b=RRGjgzFL8IqDzxWNbsfLbIWmSyLZBJZ1XHF9dYo5dY7my+oENVXmNC/zYRi5FZ/RbT
         NSYyrJUhwv70HbUisJVN8xEHVBkAZmNHy/RavJ1hmNT/eXoIWSEu6ppDUO0vE3Vyj9uW
         xHVoszsJgjsfeUNXficDbtXwnsCEo+bpjGgybe2dkF7c6NhM31pOv9xPl0ke71Qz4Nld
         nPG4C6fK9V5qsP03dNzMKUZ2At90rXUbl0zBvFXaumtfdwgDCVW13qWftiYlV3m7uA+h
         K14g5HVPzsNES6XpPbtA5BtxsksPNXGYpY/clrVRebC+uCyjp2YEgug9WVInrVoQfckp
         KO/Q==
X-Gm-Message-State: AOJu0YxRZvPoFOSfAqGVwPhsMurahq7c+1J+iXWhQGTtUo1dg763Y1vX
	AoDfnQm9FtVEaQgPSQFGj8J1xzfvfY/TvGUY+jxbLp+3oynQ0lzzxoV2A3enGDY=
X-Gm-Gg: ASbGncvCkT2HS2kYgNSTvFeXjm/8F+0v5937y3N0/QkxKf3susZ3qcYMHBGUaD1wiaj
	ulhT+a55QtFv/pHJjsqYebra0myb5kFZg4ycgZd1YAxZU2ywwTuOIyiuMdjt2DRagEM/tZqpWNU
	xij3NmOFAU/9Ty6ZqWK847s6R+eJLkd9HlOPSmuOQIbYcZrRmIUgv5+MHTI75PC210SlmKP9oFp
	M3DuxeFKWo5LAah9EDhmSaG/KQlgFTC0pQTdh3NnXuPolFaeDWXDLR82PwvuBcL3saokA99NYCn
	hnujP+EK+m6Xun9+7QFCA1gWuXtz4HkiJeM/oL8HvAM5MD0QsHjIikm3GAJ2ZILiMZuD2hlrjsR
	FWw==
X-Google-Smtp-Source: AGHT+IEPYWCuq8ruBT0tEw0x1V09UvVpIABZBC9119Nj8u+ntZXYEwKEy+rCGtoMMmbWNOj8GNY4og==
X-Received: by 2002:a17:902:e5c6:b0:224:f12:3734 with SMTP id d9443c01a7336-22c535adfb7mr204374005ad.30.1745311306710;
        Tue, 22 Apr 2025 01:41:46 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90d7f7sm8038343b3a.82.2025.04.22.01.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:41:46 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH v12 0/5] Change PWM-controlled LED pin active mode and algorithm
Date: Tue, 22 Apr 2025 16:53:07 +0800
Message-Id: <20250422085312.812877-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_014147_795503_1FE21ADC 
X-CRM114-Status: GOOD (  13.63  )
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

Links:
- [0]: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf
- [1]: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf
- [2]: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf

Updated patches: 1
New patches: 0
Unchanged patches: 4

Changed in v12:
 - Replace division with do_div() to fix __udivdi3 modpost error.

Changed in v11:
 - Fix rounding consistency in apply() and get_state()
 - Add code comments to help clarify Reference Manual errors.

Changed in v10:
 - Add 'inactive' variable in apply() to match pwm_sifive_get_state()
   style
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

Nylon Chen (5):
  riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's
    active-low properties
  pwm: sifive: change the PWM algorithm
  pwm: sifive: Fix the error in the idempotent test within the
    pwm_apply_state_debug function
  pwm: sifive: Fix rounding issues in apply and get_state functions
  pwm: sifive: clarify inverted compare logic in comments

 .../boot/dts/sifive/hifive-unleashed-a00.dts  | 12 ++---
 .../boot/dts/sifive/hifive-unmatched-a00.dts  | 12 ++---
 drivers/pwm/pwm-sifive.c                      | 47 ++++++++++++++-----
 3 files changed, 43 insertions(+), 28 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
