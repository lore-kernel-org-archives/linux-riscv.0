Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64F7C4829B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Feb 2024 12:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z+RDQX0HHNMDDoS7S5u0I8sJyjUhZ/YNNllPwv/tOdM=; b=Fg0bxBPJTGrreD
	pd3XQS0kjziYp4AD8fK437Cxjh/hnOANICmKz9UuvWTms3rbFPGZWB56eLzsGk2NdEw+AoHO1Q6dH
	RanQ6GEhM6qTQLy9OQhBBoR3WFn+dWPgf8jEOSbnHjWMuzBbXAJy3lMNLgN5ICR6rCgGF06R47F2k
	xYRlGONVnpQjmBV2TB0yYmKeQyrKtha3GHHgGKjafKzfQZg5x9/qkOjN2dCht3tA8dGj48NCjvuZK
	hApUJ68jpAa1fRdejiqaA6uSxcXu+6wrzWmn3R7Viin5UJxlsegTSvOhEZwdOrHsp+QWv5qQ4ElGW
	zuneraMAQdl0+M0kzPQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVFj-00000005FAb-3PSn;
	Mon, 12 Feb 2024 12:17:39 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVFg-00000005F9V-0aCY
	for linux-riscv@lists.infradead.org;
	Mon, 12 Feb 2024 12:17:38 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d91397bd22so23300795ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Feb 2024 04:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707740254; x=1708345054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gUo2/Sg64m+gluTfzP+6rjHe5+qPkCNx3G6SYPGm/sI=;
        b=PCProhF4HYLarVHToJ2nPP1HLGcETpS1FZGFhRpppiTE0qYTA/nXdc6n+ZQmsJtTc3
         7zOI4AK5Qs0kucDWEJGfSu/ce28/HW6R9XzH+JwjtgXtGf3Z348szorFwY2ic9rVsZaY
         xFyOJSF/2cGVMK9t3Ic2AVuh2iT0gnnm4a7n+dhrXarZEcrQ9nu1/X4+fVPtOFC2DRWw
         X4grrEvLjmZECYmVZbhCaeoN8pZhhJl6Wd+kls4C3NRcRGABk+MdntjXJ8+Lc6uAVsyx
         PPRZSLfJKA1UTVq/hDREznAYriDrwzrupFZJOkMx3fS6r9ElzGdVBTBBkAYxTsT2/sLI
         7Awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707740254; x=1708345054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUo2/Sg64m+gluTfzP+6rjHe5+qPkCNx3G6SYPGm/sI=;
        b=IqUJMOA+natxMgr8DRtahbOXJVvgJRzng9ZLOK8ySFAJmbLoRE7mgKvSkJUonW8KX+
         OBPWPNGqIFDbA1X7Z8LLsd9eG0CQsiaJKbcVYBMTBJTO7Mihk3YrBourwhAgPRZuD7AU
         otFzhFeBPGcfq+7PsqcI85Aju56EXcB/6TIGj+pFile/41WQf6yi09xT155i4trFQNi3
         JI/xcMneaQli+3uL1f6DvajvqWr1/uEHwmpJyEmvd4ma6EkHlG7yuRakX+9XWb40PCtp
         2OXESGepNejo3QhWR50tHw2H2pT7efIh/RXlTA+yE/fhZsx+ELO4B/XDVXLGWRehibCO
         Z1xw==
X-Gm-Message-State: AOJu0YzHj9bKF54h9qoD5MErNPUt5uubPuMG8IgKM7tx5sKnP/zB0zKw
	oQke4lhX89ISHxAL7fxmoNeYCjvHELZ7nxxDKGZnhOqKlzbYk1UhQKMaTwHyNAatfcVZ
X-Google-Smtp-Source: AGHT+IFzZoWi800XZAi+x/ypG94jLrL9fnPO+EXDCwS1MscQgFPlWVxztSuKLwoHj+sgV2FOfGRUAg==
X-Received: by 2002:a17:902:b696:b0:1d9:5596:ffe8 with SMTP id c22-20020a170902b69600b001d95596ffe8mr5309450pls.66.1707740253393;
        Mon, 12 Feb 2024 04:17:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYA8Xz5X9EaPh/+2SLYWC4a0TJgPvUOO27bVLQYpVaU5SGcwZsmMpHBougkK2XTigazcx1bA8Ak0t8ElLVcBUxwi1zB/8PJOrmrbKJN1FTyHVxMFLmgM4OyReOS/8ruOqxTSGJA4OWO6H4hhwYMLymcwuZoaOh92N3sy/nBfS/dR6iI6tCDs5gzJN/MIGAheQsCNqMO+JcVWBM7nJvk+l0sB+CrfCofsIvkh6NwWhcJVNfgcc8/5vbW8FpVOHdsZZK74eimU9+VKmawl0MhL2TVLc9ei8+aHK4TZClVLQN+MFdxONt/paHePhfZf46wQ0WK9cgEfEtthRrXnW5ZYTQ2a9+fdTXSaQdb5RrbMlno03vroOg1x/a6lrUBa1L1bCvtjYROSslGLWvl3nIqxkHCva8dRK+LpttCOfm/6z4GqbEc/Ig8PFW9o1IqBcdFh06Vu85JkTP50Pkd7DC
Received: from localhost ([46.3.240.101])
        by smtp.gmail.com with ESMTPSA id e21-20020a170902d39500b001d8e5a3be8asm242216pld.259.2024.02.12.04.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 04:17:33 -0800 (PST)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: u.kleine-koenig@pengutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dlan@gentoo.org,
	inochiama@outlook.com,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: [PATCH v2 0/2] riscv: pwm: sophgo: add pwm support for CV1800
Date: Mon, 12 Feb 2024 20:17:27 +0800
Message-Id: <20240212121729.1086718-1-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_041736_198239_A0C6DF45 
X-CRM114-Status: GOOD (  11.27  )
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

The Sophgo CV1800 chip provides a set of four independent
PWM channel outputs.
This series adds PWM controller support for Sophgo cv1800.

Changes since v1:
- drop full stop from subject
- re-order maintainers and description
- pass checkpatch.pl --strict
- fix naming errors
- add "Limitations" section
- use a driver specific prefix for all defines
- using bool instead u32 in cv1800_pwm_enable
- check and set state->polarity
- use mul_u64_u64_div_u64
- use clk_rate_exclusive_get(), balance with clk_rate_exclusive_put()
- using macro definitions instead of shift operations
- remove shift operation on 0
- use priv replace cv_pwm 
- hardcode npwm
- set atomic to true
- remove MODULE_ALIAS

v1: https://lore.kernel.org/all/20240207055856.672184-1-qiujingbao.dlmu@gmail.com/

Jingbao Qiu (2):
  dt-bindings: pwm: sophgo: add pwm for Sophgo CV1800 series SoC
  pwm: sophgo: add pwm support for Sophgo CV1800 SoC

 .../bindings/pwm/sophgo,cv1800-pwm.yaml       |  45 ++++
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-cv1800.c                      | 248 ++++++++++++++++++
 4 files changed, 304 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml
 create mode 100644 drivers/pwm/pwm-cv1800.c


base-commit: 7afc0e7f681e6efd6b826f003fc14c17b5093643
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
