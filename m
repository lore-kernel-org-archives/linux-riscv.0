Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCFBC07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 10:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M7f+1Umye2OVTOGS+l0pvYdtysWcBqjRqk1rE0Fbejs=; b=vSZztSn4Jurxn8
	FcByn3qG/s8Mj5SIpx3Ss6VywDDM76DrUg7M8BNrByvlvflyci82Oykh76sPAbUojVMeISWrttamq
	bgehnuRmnPqB4wCJzD5styA/a9DeiivBH+TdSJnTv4dOcNKGlYxjMxlP6MPV0TQRuPNYnSCjC9sJy
	QFbcb1XTRvbspvZkBPRsoyvN/H6CkuNg/c82BQCYgcMOwbAxj6YluunhTdtcrMcBRUv3RWy6JY9HB
	kId/QV1Grw4+qOD+uMWUBgXxAxS5rEpT+iZah7rNaJmYmRrVcxKhYAk/VDmD59eH9TT7RyBSgsG/d
	JnBuov6CA2N7Z1Tf49qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvEVG-009QYv-0B;
	Tue, 24 Oct 2023 10:19:14 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvEVD-009QWF-1i
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 10:19:13 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6b1d1099a84so4090918b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 03:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698142749; x=1698747549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqO6g6+dHIfm5WicwZoijQGJjSQbfYTG3kfOYZFggB8=;
        b=WBB1TXDugNUc1XezhWUeDI3Y9UbweZJHmw7hb4FmSBcNM36hCTEiD9q2Q4lZIxTzQ3
         SqIpwnU6At/EbcH7AYJyvPc12NPWpwmObnT/biCCbzrqmzzNY8YcFZl/xzPC0nFlfwCB
         prrVq2sVkI7EnnUqOCghEEUlgf3dB4eABdfI/8taJ27Gc0QOhXou6fUPQEThxIeTigJt
         CLJ3CbaldrGtElUeJXZKeuujkMCIw7VOHoF/9y1IyZTu789cepQgSOQYj5S0nd/pGNyC
         UkeV1i4QIu1r7MlnUl5jAXVKDW5HmsQHSU4J2hqLrtN3ohFIcHC39I90VrALXma/NXAs
         TDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698142749; x=1698747549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqO6g6+dHIfm5WicwZoijQGJjSQbfYTG3kfOYZFggB8=;
        b=Tgvw6yYcY/EJ9b/8bneV6drFnSRek5CBDbfk2L/n0jQm+W7SBeB4y2IIk469Pp8+QO
         NDbgTljdLiygLKybBqrRsqeyN8Qp0SVr2+wjTzyWhv6/4Vfa7AFlGKDADsZ9rXEg5hnW
         QfOXdoSHTDHU/abyMjgOa0D7W0Ed3qKtoLRYXQ/2Jz0/YfiqtN9THimgBQLOb7TnRsBb
         pKkuq6EvYUG8COC8DTuTi0wKFpHroG7XPQkBOYTEKxgX1tVBp/LTzBN3KwzQ1frPJdv2
         4J597VqsbMcRbRORhh5KOyu1M02JTF7nEFZvlHIk0ihYIfOOqnFo0c5YPGVbdo2TA6dz
         yOUA==
X-Gm-Message-State: AOJu0YxyNq4x5IvqUGwPDNL7oBPaLA1Q5NlHZvINUisxz5YLDeH4bivB
	kc7Ojdsk7GmTZRj7FzNY5Z0lWA==
X-Google-Smtp-Source: AGHT+IF0r5iIQe3b6PKgM/nbB6MiSvY8q/dd3Mr2AyfJDcmwP7NF+cbaTDwX8FZQiIbRRRIVtwjwTw==
X-Received: by 2002:a05:6a20:96d5:b0:17e:4f56:f5be with SMTP id hq21-20020a056a2096d500b0017e4f56f5bemr1810110pzc.22.1698142749323;
        Tue, 24 Oct 2023 03:19:09 -0700 (PDT)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id u202-20020a6279d3000000b006b3dc56c944sm7708372pfc.133.2023.10.24.03.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 03:19:08 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	emil.renner.berthing@canonical.com,
	vincent.chen@sifive.com
Cc: nylon.chen@sifive.com,
	greentime.hu@sifive.com,
	zong.li@sifive.com,
	nylon7717@gmail.com
Subject: [v5 0/2] Change PWM-controlled LED pin active mode and algorithm
Date: Tue, 24 Oct 2023 18:19:00 +0800
Message-ID: <20231024101902.6689-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_031911_575674_97FAA43F 
X-CRM114-Status: UNSURE (   9.06  )
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

Changed in v5:
 - Add the updates to the PWM algorithm based on version 2 back in.
 - Replace div64_ul with DIV_ROUND_UP_ULL to correct the error in the period value of the idempotent test in pwm_apply_state_debug.

Changed in v4:
 - Remove previous updates to the PWM algorithm.

Changed in v3:
 - Convert the reference link to standard link.
 - Move the inverted function before taking the minimum value.
 - Change polarity check condition(high and low).
 - Pick the biggest period length possible that is not bigger than the requested period.

Changed in v2:
 - Convert the reference link to standard link.
 - Fix typo: s/sifive unmatched:/sifive: unmatched:/.
 - Remove active-low from hifive-unleashed-a00.dts.
 - Include this reference link in the dts and pwm commit messages.

Nylon Chen (2):
  riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's
    active-low properties
  pwm: sifive: change the PWM controlled LED algorithm

 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  8 ++++----
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++--------
 drivers/pwm/pwm-sifive.c                            | 10 ++++++----
 3 files changed, 14 insertions(+), 16 deletions(-)

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
