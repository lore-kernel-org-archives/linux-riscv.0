Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642DEC54FB3
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 03:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U8Zq9sL3haFc9kpywu028NfNjX5vX0MClR+evgA3nC0=; b=lAwZNmf8LSEOOr
	JMKDDhixzXbmgIhvEwr2qCJTwMkIDXu/gJigJm5v0w0d8zz1Hn7ZKUI2BABxwQua1+gB+yy4x8hvd
	1lM+MKai0rosH3bG77NS/STxZEhZi6vi30gY9FJW6TpOnFOdcgsxkywxSYnNZdGXXqK0oZ154p8fM
	MjxDi24BG6i4Pwhx8natpnODJeyBpljBc0/llJEtBxK3j53G+TyKRT3/NNsAlYUTMG/uaag2I8Zbl
	ueMRQCNmSVF9nnVkb3j0OA4uACe8ddwa/PZSXGwHfFcEg5xgjvFOUXm6S2raVQKGF8hKa8QhFba9E
	oDYAHS+nb3exE75rIR3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKUAe-0000000EpoP-0US8;
	Thu, 29 May 2025 03:43:08 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKUAa-0000000Epnk-2Tb1
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 03:43:05 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2301ac32320so5254125ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 May 2025 20:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1748490183; x=1749094983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+X6gW7XSHlHgq3Y8KWFL+6OXGY/o9qJGU4UY1R8oD6I=;
        b=gtjkUrOSt1M01K7FSj0qxTPOw5AkUUrCn952R0ie30HjdYnHoV42W4TcgtG29s6rzm
         1PCGwtZRPNmV3E/qo/0GAwrZM5U6BQI5cEL9jsqFO27jXPn999fgKrYUExfEFFneGi2f
         Y7hqDR2x56KZl5OJvxhWzf27+HL9lhPSHgWQDPDSOpdX+ffPdIHBHJH9eocAK/7++9ao
         LI+CuPT5MBmMCm2AjXM/v+VXCS8OVVRqSGbYafLk+qzcKdYLZl+jNZ9OyKh11LHnfVKc
         rb9P5Y+VPbqHnoPib7EgbP20tkFq16v8dO+s4mcT959BWEIBW6s80gpRep9GpNxO8rla
         kCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748490183; x=1749094983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+X6gW7XSHlHgq3Y8KWFL+6OXGY/o9qJGU4UY1R8oD6I=;
        b=AJST2I29RI60q/GZc0neUD0j5J3f/tQcjZI+PSycGrlDT34s/DI0mms1jATeJSTuLC
         6/BAQgRvYBHsFPkQ7Gog7HqRZaSyUOvTbQ84JpjXvH0m62FUjYpJczC1YsUGwsVwLf8m
         sg3ORUCQFZvzvTAhxNzhPFoOqrtD+/JGpwFf8f+T/38h14VhghM3V1y/cf7i/Gm449j3
         mS8HSTdxPtUBJd4npB5jGQz5MylocooJFSVw673ThuRgF/tDB11vT/7DHwJi7Wgr9UyC
         qGBr7kGBrP+SC1lkdOnBk9dIMXXAPH+c/9U1tqByaCDj0PYFdQ6UDsyD0s6Wtg9dtpnD
         p8Rg==
X-Gm-Message-State: AOJu0YxfVvJwrmp627Swft0zXBcMGj8/W1YwDJhrTV0R+u0FKIEOv3RN
	P7gdJs/Vq2qWB2UrEIs3DSt09yEwAs49K9NdbZxlstZ13CpDaTKw/P2/gsWiohWrEFI=
X-Gm-Gg: ASbGncu9fPuPS8jDGQI09AVjGKlIjHlooklpWshI/BsZX5mA6kZsGd0wUeku0czAE9K
	CKK/mFZnMKbiovYs7pepnG57TRXJOSNcQqVWjUJJUtthPqS/XENoclDyZYIRV3P8ihvFOw8vhSi
	S9duXw9hA7IFgR0jqXRtxuZSzAq6eEZNR/Sy8sKvWlOtzFH2Lq8/HUieI9x1icbnG0ZbxoJjtaA
	egE3piTdjeBQ49DQPz9iuYgWd3A+EUT7avZ63OB5yC4VhwKOpC1UYfRvPBzkoe9wdqw0uae3KHj
	iSIOwnCRSM8ZN6GL0d6VFhuYQfPSqeQ9WPFb3Pg83lU9iKHYQNZRcUAlUoFp7RKWL/WoFOeNwG2
	43xt4wJTfBGBe
X-Google-Smtp-Source: AGHT+IHA3e/MRESokLCrydvndZOnsgaMOwqENguhDl4BUycTQp0cNyR7aJWgCKVR4frkoE+M51f0yQ==
X-Received: by 2002:a17:903:1c4:b0:234:9374:cfae with SMTP id d9443c01a7336-23507ff8707mr9917715ad.19.1748490183135;
        Wed, 28 May 2025 20:43:03 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd92c7sm3425905ad.62.2025.05.28.20.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 20:43:00 -0700 (PDT)
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
Subject: [PATCH v15 0/5] Change PWM-controlled LED pin active mode and algorithm
Date: Thu, 29 May 2025 11:53:38 +0800
Message-Id: <20250529035341.51736-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_204304_646674_5EE2635B 
X-CRM114-Status: GOOD (  14.72  )
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

Updated patches: 2
New patches: 0
Unchanged patches: 0

Changes in v15:
- Squashed patch 2 and 5 to combine algorithm changes with related comments
- Squashed patch 3 and 4 to unify rounding logic and idempotency fix

Changed in v14:
 - Change `frac` from `u32` to `u64` and cast the constant in `min()` to
   `u64`  so that `do_div(frac, state->period)` no longer triggers type-mismatch

Changed in v13:
 - Fix syntax error: Added missing closing parenthesis in do_div()
   function call.

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
 drivers/pwm/pwm-sifive.c                      | 52 ++++++++++++++-----
 3 files changed, 47 insertions(+), 29 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
