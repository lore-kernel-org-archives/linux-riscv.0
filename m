Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C36C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 06:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uxWn65kdUXoWYJB2xlXKxRYOdk43tJiKoAb2BIi27uk=; b=xsoORMUVrmef3o
	VzTKOTXAjnU3I3JtbCoeZHYd17yAob1j2/pvoJudhXgfriX7ejdoDuxyUCG5ogSzs/X3lHSAORKQd
	q0VWDVnBkgul6olQq4zx+N5yoWOw+TSrFEygXO2ekqEPfTLJ+uAq6bDQFGLJmEi5HlT/dd3eMjwxM
	f3KGiBd/uo5t4ewVe465orB6KH93dyf0eGefDqUreaoe0cWrayOuUTquyMYq9te18O9qytWPYg18f
	PPxUI6e2L5R5b+Ya10rWooBSuLWEEv6FNZMPeQgoLUM+QVI+14iLxvzJ3xnD2l/3U72BHaSW4H/6T
	ZQMZqIXo1xBvW5fYtVZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSA6n-00FEp3-08;
	Tue, 23 Jan 2024 06:18:05 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSA6j-00FElY-2H
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 06:18:03 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d70a98c189so21366105ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 22:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705990675; x=1706595475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W628e97+8K8Qrf9wYfOHFnlYYn9fHGpqJ33Tr5gjMUE=;
        b=DJyN4OzTv1cUH3AY3PIrpDYNUc6NUJXPe72mJmfoGzMO9tRvK2wJr3NNPjlmzxnJKt
         AfhNbEWWAUPqAjelCE9Nrwp4WC1Wd4koeXnFRCL8w32zJS/F1n4W8fu8nVBWB5vI0DPR
         eiSq4Bt87mrIETIuicmtR3DRcNlE7VNc5BWzyTP+1+U9ADzsOrJvYH/4tz+1mf0LFOcS
         BKKTJN9cd7GgYetdWHA+lTPsqkY90LgVL/Bc9Z6BKHdWmqG4Gk5C0HETXBBUGT+Beniq
         oK6sSkiXkZSoaejdQWRKavfu+BHvDmZQ1OOWwHUM6XSJiKF4HA/ljyaUhjXzjEtmQ9E9
         h+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705990675; x=1706595475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W628e97+8K8Qrf9wYfOHFnlYYn9fHGpqJ33Tr5gjMUE=;
        b=fL6Cypj/2/WUApbniG5a9/kffOhXsTkQv8vYfCfi94fImhnjIt9ptPKL9VZf2MU3U1
         v0FPpDwR46enanEnVtpm5GO2+7z9swZ1sCXG8nqqfBbvXWxWyc2aeCDY8FSE+MCOdmUx
         csDCe4oHkFwkS3L002k7mkbRwkWeF9SSdUhc4vSAifeN2CXmkClTULE9CkFf6LNgBkX9
         LUVzhpYSS32URZK8vnJq1nQH6PEe47eD+PHOY3TVR8SVHcdnsaQGW+c1/m3E24R3ENoe
         4OsfPF5gLX2/QM1B/Ly2TdF80C7LKomSTpXfchGnrIdhiFXJE6pdMrNGgmlyKQlXCbtj
         RmfQ==
X-Gm-Message-State: AOJu0YyxOf4Zq1PXNfNrxvocVaHvc5DNVMNtdZqy8Uufdh1ZIwQvhgwc
	+x50smucA1GFDajV1Vv3ivNEgyRPza2II3+yShnLTyVcc3o8VbAYzwjGqagvZSUa2oGfngEBkP0
	l0OMNJX15AoaoIasT9xXjaQqF8HL8foPytt7kQiq3mAgKgG4LdC/Sm8sUG8WJ/7BnH0prWJLZBG
	s6UXomQbn696QPKpD6RsGl0M/XKTiY5Je7qzk7r/IAhlbPyq69tKE=
X-Google-Smtp-Source: AGHT+IG/CajBTbtdN19tZkW57mBY+kgSSzePajq+2Gcg5rqABA3BJV4YYS1ra1GHAIYzkn/TP9yhZw==
X-Received: by 2002:a17:902:c409:b0:1d7:4242:81d5 with SMTP id k9-20020a170902c40900b001d7424281d5mr2337974plk.105.1705990674462;
        Mon, 22 Jan 2024 22:17:54 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id p7-20020a170902b08700b001d733c88646sm4425376plr.216.2024.01.22.22.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 22:17:53 -0800 (PST)
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
	zong.li@sifve.com,
	nylon.chen@sifive.com,
	nylon7717@gmail.com
Subject: [PATCH v7 0/3] Change PWM-controlled LED pin active mode and algorithm
Date: Tue, 23 Jan 2024 14:17:45 +0800
Message-ID: <20240123061748.8844-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_221801_761352_405CF88F 
X-CRM114-Status: GOOD (  11.22  )
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
