Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EC5C001DF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 08:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PV7ltsw/snQj1ERnS63SgT5Y9zsq7Iaw8z47HWN0qSg=; b=RttNCYEjdxohMs
	fL29Z3OEJWUzyawHVdgOduqK3UleC1LyFCPxzxxiNLbcerZHrfoAo27eLjG7l6J07KrQdyf1yCx9o
	KDlqKIVjhHgkXG6avewkCx7REkElCpDJVrTEtqF1OcZSbPQcKs+ZAbVGbJ8fEOAtH32dTDd1LjMW4
	0pdSltaG/hVT5VEPQftHftA7ibugi4ass7vkeau+VCs4AM869Itdq/IhbeP62nsuhRzGmOp8IpkNM
	rEuOcAevnME2u4o24wBW7w0u8+RcwGYema11Kv1QFX34tAOyDDsTA+Mw081W5lyezlB6hpUXhDVR7
	oBqpdo6SYRX7tuVDH2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRU9T-0075fR-1M;
	Thu, 03 Aug 2023 08:57:47 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRU9Q-0075eV-2H
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 08:57:46 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-563f752774fso348753a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 01:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691053061; x=1691657861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yLuMaVJQRwFXzrj2KAyjh6dQRHn4ylta+xeHAhU0hZc=;
        b=Bu0D3tGjQV9Pc4NF3RI5B5EiGg4B5cv6DLumG8NB9wnCVaSTXNEZzxw48JRUczYBZg
         zia2PWyNqRQVA1lY1qZBnJ95b8Kr3cIHSKrJ+uLCY5rcKIWSx6IDWM8IryDShuLSGoE5
         pn9BtS0M7KZ4IzyfSh0JZ0j6l5cXaQojDx7yqnjlwtlmOnpvMJnlEs6kfTLnZCkEqAiU
         D14t5UbsxeVCvzkkUSbJhYQ8kVoIOwIZDDmcEvkSF3lTBYlUBm0nnfSfKvF+pX3pa0gD
         Dl1uFzTOlCW3eVyT7CNUSofcEAwnHXRh5EUHt9kC4E0DQEhfSNDOz8JZAG2r6AqJmufg
         +xHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691053061; x=1691657861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLuMaVJQRwFXzrj2KAyjh6dQRHn4ylta+xeHAhU0hZc=;
        b=jpDO0IZnXpamU622a1OSYIu4Ttw1KKk0xq0/jZrLzBXkHHTiedkM+sscG0zVOo8qu3
         JIkZNt3JbXF7ri8NyerfducJOY9QaAb+kv1XTy94PJlh3oCWde0+XIn9jrgtxjN0AwF2
         6b6SQ/KJYJRBgHCrHirCA572pu9SMFh3Jlaad7sjQvcBP1upDFTEtqy7r9uBH86x6nyo
         EXPFVIBkLCudl3VE2cAN6ofIWRdfbl9diWKQUo0JJiyt5bC2fx03X1TpOgmBHN8XWHm+
         7KMOrxfJL4RTU5ZmmAcBy4KxgzDzGtILl+z///ldHcOD0aKtCd8StCv/VIa3HV3mTyoe
         mFfQ==
X-Gm-Message-State: ABy/qLbHWKxcIo1+GYdXOu8emcZH0tKnXS85T+xsL4ede4qU08h/xRjP
	BOFaw5/0xGWrKcEHJMorYCiSYQ==
X-Google-Smtp-Source: APBJJlGnnPb//8k65nNPvHDIdInt/WndMpdPrnE5Y80vvoLgTBTdyYd4KLPnCWV1uD6o2WUos8NKPg==
X-Received: by 2002:a17:90a:a592:b0:268:daa4:3a70 with SMTP id b18-20020a17090aa59200b00268daa43a70mr8066701pjq.32.1691053061337;
        Thu, 03 Aug 2023 01:57:41 -0700 (PDT)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id i6-20020a633c46000000b0056334a7b9b2sm12941735pgn.33.2023.08.03.01.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 01:57:40 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	geert+renesas@glider.be,
	pavel@ucw.cz,
	vincent.chen@sifive.com,
	nylon.chen@sifive.com,
	emil.renner.berthing@canonical.com,
	aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	conor@kernel.org,
	zong.li@sifive.com
Subject: [PATCH v4 0/1] Change PWM-controlled LED pin active mode and algorithm
Date: Thu,  3 Aug 2023 16:57:33 +0800
Message-Id: <20230803085734.340-1-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_015744_811018_94B973DF 
X-CRM114-Status: UNSURE (   8.68  )
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

According to the circuit diagram of User LEDs - RGB described in themanual hifive-unleashed-a00.pdf[0] and hifive-unmatched-schematics-v3.pdf[1].

The behavior of PWM is acitve-high.

Removed patches: 1
New patches: (none)

Links:
- [0]:  https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf
- [1]:  https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf
- [2]:  https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf

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


Nylon Chen (1):
  riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's
    active-low properties

 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 4 ----
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 4 ----
 2 files changed, 8 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
