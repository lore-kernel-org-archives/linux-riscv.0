Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB35C77B72
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 09:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x+NOeCumoCJyZdzSJkuIPci1nw9wCeI//jv/o9v3z4c=; b=chK0pJfsjwAM6S
	oGoD2onJSlZktTaDMYPhsAuJxqx8skMTiY0eTKmVo+Pr4wipKTqFsk/kw4E+DXje4mG6SVuQ8Z/fO
	KzfyPJzmBWLqfN69tFtZz5WQ94qEzWGZLBYWHRLeOtrfVG+rUUj2QehKJ8DLP5IRw/Zsvd/UMr8Na
	qqDv/jIP09f+iOfqIy0b0moreZ/FBKSaG8ZhSPeypu/Gajfz+InbvCRekMF5yG+MSg+gAiRfYB4mr
	4kLfS7CmNDkb5kO0HUC7T7zY7tXd9pnWrwRav4vTbFbuSbwbv0neZkIDsTCLhI5VPXnYerAGSHu6r
	ayqngMixjUaxALPAsUxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQh3-007Y18-29;
	Thu, 20 Apr 2023 09:35:09 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQh0-007Y0K-2j
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 09:35:08 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-63b5fca48bcso748675b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 02:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681983304; x=1684575304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=02xaOyihgmHWk8PXEKiM2D9tpDK72+IwxLY1vrHA/24=;
        b=iqhQj+YvmgYUadoSx8Q38GJdBLIgRvHSHPqXOVMYrfAEXM3+fTnPvbPtwbJROMhBFi
         9QdybdFqhOqIbMcRM/76IE7KMIIBWw/qViOquAwi7f5sOo1Tq/rMlZM6cAI3mUt87K1r
         j/WH3J/AqFmBek6kgmo1rJ3yDFpFZDb65D85mPBlgwQJUSNSB5v3eTvYxM2qYvVVON5d
         MHUZxVuxKGaW57X5k6m2yX0+tcz/5TNL1hhY3JbXMVEYGTjGAl/4jdNyZZnbESCqsPzC
         UXMDa6bPAYqLTIKW5AwbFR7qFgkC7MQdcFumLTv9Fk6r3srnRhaBEd5I9eTW221l2w3G
         flWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681983304; x=1684575304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02xaOyihgmHWk8PXEKiM2D9tpDK72+IwxLY1vrHA/24=;
        b=UwC92Dr+0mA9IzR0WXgqI8e/c9IiUrR7qUndWenbVWNI1Ka6wQVjJ+nUIh80zsJUXX
         RqTOZ7otu+Dt50hjRDgZ2YHpbfNUQBCxi7v6ALML0cN0JHSlMe/nndEYSiXm5VukvaoF
         ri9yRlW7eYceuG0AbA9vE+bySututwGNTyWlMyKms/ywMUzRU/fe+L6A3zNL/AKqxONF
         lNcLPkZg5CS6khRb5gy+a1Zrv10TP8Z+loKvm/fCnBx6/ODQobgVr+JBmNzRSBKXv6TZ
         c6x+9mz5yNDJtqNh8kj8+7jWWfr6NfUgpyPTXjQET9ZKljIQWagliX6E2zifi1Gi9M9x
         0AVQ==
X-Gm-Message-State: AAQBX9cTI3xMnErrdWTG+uNN+gCU0tpBH2WmyLJl6t4zLvLkbdhUzgrr
	IhfkfZswRP1MtPWm9ghG1/fuXA==
X-Google-Smtp-Source: AKy350ZtLxzENWOaGa4S3bLhdc+fwFVKBO07vzL/42DsU3U/2Ql2HZ4oAs/YefYgIc+BtMedtJIIfg==
X-Received: by 2002:a05:6a21:1518:b0:ef:53b5:fa01 with SMTP id nq24-20020a056a21151800b000ef53b5fa01mr1066780pzb.49.1681983303722;
        Thu, 20 Apr 2023 02:35:03 -0700 (PDT)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id p5-20020a63c145000000b0051ba9d772f9sm781551pgi.59.2023.04.20.02.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 02:35:03 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: aou@eecs.berkeley.edu,
	conor@kernel.org,
	emil.renner.berthing@canonical.com,
	geert+renesas@glider.be,
	heiko@sntech.de,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: nylon.chen@sifive.com,
	nylon7717@gmail.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com
Subject: [PATCH v3 0/2] Change PWM-controlled LED pin active mode and algorithm
Date: Thu, 20 Apr 2023 17:34:55 +0800
Message-Id: <20230420093457.18936-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_023506_928263_91982BE2 
X-CRM114-Status: UNSURE (   9.09  )
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

According to the circuit diagram of User LEDs - RGB described in the manual hifive-unleashed-a00.pdf[0] and hifive-unmatched-schematics-v3.pdf[1].

The behavior of PWM is acitve-high.

According to the descriptionof PWM for pwmcmp in SiFive FU740-C000 Manual[2].

The pwm algorithm is (PW) pulse active time  = (D) duty * (T) period.
The `frac` variable is pulse "inactive" time so we need to invert it.

So this patchset removes active-low in DTS and adds reverse logic to the driver.

Updated patches: 2
New patches: (none)
Unchanged patches: 1

Links:
- [0]: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf
- [1]: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf
- [2]: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf

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

 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 4 ----
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 4 ----
 drivers/pwm/pwm-sifive.c                            | 9 ++++++---
 3 files changed, 6 insertions(+), 11 deletions(-)

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
