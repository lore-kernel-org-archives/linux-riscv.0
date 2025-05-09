Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0512CC3ABC9
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 10:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KZXO7cJuhuURm1aEUoni3X/M/0zT8SkJuN5XVIy5BV4=; b=BJE4HjEuDPads0
	w0S5AIb97/J/Z4Lid5NLeZ8KlonMcrwRLrRpW3jcYU6EtCg/NgWWKjH6jguo17Nzu1XbHRYQV3Fap
	B6Hk2Zk/IFp3aShXe+nOUggQ63YwZqubJC8sHHxj6bjrqCCw5Trpp7y3V47tEK7wR4AiVfAEviXag
	qSrdi7evKXPueamQu9tabcYNQ6pGangH/lhu9YPFrUV0I5bYvBMW8NlBKw77XAae+aJiOZMeuGjZm
	fgY97BCMCNH7k8RvCFu5gQTGuHzI4LYC+FM8v+M2yZKXjIEeZnNynZcLSYR/n7sIjCXaFx2jl3WpN
	aihVrMvZz3WxirkyMKtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDL63-00000003IQU-43qQ;
	Fri, 09 May 2025 10:36:51 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKEU-000000038Y9-1ZZG
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 09:41:31 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7415d28381dso1278935b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 02:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1746783689; x=1747388489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0rfbYYFv5okSJ9FP6KBkPZgXmzWmufmKqi5XTuFZ00I=;
        b=FFne1TGZ6LgRZmhOADUnx9hdZ/lDj/XgE/Eg1E7Anb0V4lBbi2ba5MPzDTldoya3an
         qJ9ZKchQXzgW2DTGWnYigE4bMAYF73MQqDJ8NKGGUGKZolWWIsmnR4TNijVUg0seoMhB
         U6PK15uE3yUCe2l2AA1D4GpOA6jVjxqVPw6kRWiH4gkdwSPWd+uEqdI4s8j4PmxWlRKe
         fdrSKiQJCvMsBYoguVYHuzduZMoXH1MPRMctJQjpc8HYFLFXWCicpo5lZvxurTLtNuu1
         BuLBdRIrRc1dTZKT27ZDSYF4T0JJsxHACVhW/wfuBMgU/u8cLaKQ7jf9otmVsq5UtKyN
         lIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746783689; x=1747388489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rfbYYFv5okSJ9FP6KBkPZgXmzWmufmKqi5XTuFZ00I=;
        b=KIGfOQB5kDIjT01Ry5zJgbhNdFmQ9n3I0zqSKZOEJ5TrGLnplzUtnMHEPoY78V/59l
         sg4mxx9xsgdNArEM+lCApXkHpcnYXwgiLmmQipa1hvVatR6fZIHV8cAeWp0vWbxHOveT
         5Xr/1bElW2dJVK6+Zl9guZ3K46yoyNjbPwB05RdWiDj9VZQ0Mieyv5sBl2cgD7O3PNjc
         X42OBjJyNtRwPBdKzQHQmWvzKPawmoCySqNX4coYw66gC2jL9Y7lF0xv0MyC7X50l2/z
         jOQYACGw8lkzeyfZAUmbXgaq3zcJvX6VgNnMxrAPRhNSpQqx5rjOyg9myQeN+esTxX8W
         SblA==
X-Forwarded-Encrypted: i=1; AJvYcCU8pi5/stQ6oCAN1E8HRf4RJX27KVx4KrBFVne3wbwvvvbm8RbQSdgPNxFKTzfJyGxRq9TuSEyS+0K/Eg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMyUP+LjpIu3Zeeh6EHwJrKJyF1vkGQQg89KP8MzKUG1FBhS34
	tsS8jDaqlOmXsNMeabi5PXmg5B3mmvAfSKDezVYIHGuOrLGapFfgmmpXgw9Uhls=
X-Gm-Gg: ASbGncsnvcozkWYrY+AVr+NCUYdscTG1Vak5ipCj+MoxXYZwGcQZFjEMkPsMIOT0iNn
	KL57H+rW1IBmeK7dOW9mvRjC4rjys1z5GND5Fgsxlw66XqtB8epIVAZo3dYz1pGVM6/AyGEoJTZ
	mogNzsb5DpN0huY8LECvdC5okDTTv+fZKU4CUGLLO+qzr4Ky4mYPIJEQbnXgnNHkIBOfDkcO7xM
	gtnq/PAPoy1IWcixP0qhqKR1lpBiiel/6UMCiU5h3H1JQboh0sfQA86AKTUyC2jGnv+7Aq6p8PR
	CZctmUjIq00iESeFazIRaQGjoGTxhNVo2N6ixjcsbtKF6TkY1Gu1md7VQu1p80D8K5ex0CagNmA
	HHA==
X-Google-Smtp-Source: AGHT+IGkkhlM5M+6Ld7nKmAFjVYH2kcGrb2uQx7YXLfMGH1JYPzi/20s2F/+C1+ZB+VEtlEdwAiPyA==
X-Received: by 2002:a17:902:e84d:b0:223:653e:eb09 with SMTP id d9443c01a7336-22fc8b10842mr38716365ad.7.1746783689060;
        Fri, 09 May 2025 02:41:29 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271c38sm13271035ad.119.2025.05.09.02.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 02:41:28 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	samuel.holland@sifive.com,
	Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH v14 0/5] Change PWM-controlled LED pin active mode and algorithm
Date: Fri,  9 May 2025 17:52:29 +0800
Message-Id: <20250509095234.643890-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_024130_435312_3EC4133F 
X-CRM114-Status: GOOD (  13.98  )
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
