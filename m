Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC876C4828F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 05:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fgA/7OGMftqVnEZpW+OlHNbkcpUkxKjQ4hehQJ9V1PQ=; b=TjBdnnbl/n62Yh
	VytJk+exyElx9UdwQFG30w+QsvLlhXnKCgcxcEBFykAxy7Gdfh9IXM4rKiTSx55JwOJ8ZhvPaR44J
	YrN9DhAGDzabcjlrSkRZa95C9Q+D8OQ/4wWWVkh0K0hW0c/vQre0trrU15L+akJNdiYqrDvuNTxs2
	j9vfRlJ2UoRLpYd2iuclGk/4JSTJSe35WCxOHcui99LvMX2X/rs7NOoFQdgk6AzI2BjFj1XJbAtuN
	5MM3bnoAFc7NkJiAf1z8ynei7aMrqRSG9HEgyUG1A90yP1Nb04dNBeIoquYT6dVpi6vYjegMN/wqz
	ZrXBNEhJ+1MKyXu9SSRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXaxc-00000009mea-052B;
	Wed, 07 Feb 2024 05:59:04 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXaxa-00000009mdU-05a9
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 05:59:03 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5d8df2edd29so143688a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 06 Feb 2024 21:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707285540; x=1707890340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GoTOTDguJ93aeizwcDFxhm41O6QP2z7HpzyOJGDVWFs=;
        b=LyRL4/1tgmP2QtbNG+a9n8CZb/GTBoAKIPOSSFNNoS9WMnQ9QmUYKo9ewt4ICpB+iW
         1Ph0Sdzkv3dPa5rc1lDSvejsAhq0aZgLbJzZewObEOoWM4Zyb89/xro8hh5OGjMyNdB7
         bxaC7z37DUGEX/2YOLQTywpTSqxT5dUlURejSqO2PlUbRyOd7QbytqCBPF/UZPngKBJO
         3IimqI5jsEBvqzZ9jr8wGc3uD5uXA8tnlGkNuNHGG5dvxgADzuL3JyLn6+q5XQ348Ke/
         I1PShrxYWfivsyr9464BzFQMVKqYLq1iEbaYTiQy9MBxuWxkPpWzS47cGbdod69vIUC5
         hauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707285540; x=1707890340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoTOTDguJ93aeizwcDFxhm41O6QP2z7HpzyOJGDVWFs=;
        b=iDQ1NOo+FVlR4fguR2DF0/CRDsPIHsuI6uO9RMr6sqpQgTqHyKZWCft3rBYO5QO9Ro
         plYIaqvUB79IubdULLvw2MZET2tvsQG8QIZxqICXDVVp+liobFPSy5QazmNqVgc8r3fo
         v97y3lyVrRe9kQcVZqtkkzl3BTl6Wfmq+QGZJujhdD/ADEEw/vLTEI8DJdEthnolLEC2
         9X9n0oZAcySaMTKSClzVgG+boL+a5TOQzOQjJbxVMDNyTOWdstL1F9cjTji8ceKar5Ts
         ysZniZkhF7MDm2O5FEN9uvD5aFYvLvAW1uK+L+EuPzpTqQeNu3pmVdVACMxaNTj73ZtY
         y6cA==
X-Gm-Message-State: AOJu0Ywhjo1ANThGrbykFxGuODUoc19A36np0Mut3MNLnneTAjDf0/mT
	cEU+TPHpXbnkrU6YhBQZ+ERXkfmXYdHbA7AyhM/PW2YbJeMKSClw
X-Google-Smtp-Source: AGHT+IHouwaipBmRkx+W7KWEdUOgEFQA6s0NO3f9JB/RNKrVn2g/lBwp4jn1iD/vuXVjhqmTUQmVgA==
X-Received: by 2002:a05:6a20:d90e:b0:19e:9c72:90ab with SMTP id jd14-20020a056a20d90e00b0019e9c7290abmr3782447pzb.18.1707285539844;
        Tue, 06 Feb 2024 21:58:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVPI7i3B1PMoZ1+rjTSmjarSOryk9owdORs02dNENYEWKFELT2v2icTKV3yLCHJ4v8NWtNY3IPncbQ40E6T4qmrzmazMDx/6h9QNdXlz//ZysmB/OFLojMCdAm2w+2Y/e0nHjzERO34NTK57LtWPPHpiJ1zUaxbnVts7x15Kv6RO5ljzsouWePpIwRm6EgjsnYrd8AniRDyU4kCbgQVQ9pJ9w1s9iJ01yYaUf0dO7/9n01eZBePLCcDzeOp6p3ZoG4eMol0HT0qEVXMJtFT3NqSR0+BxDEsXMHUZ8+YCcUG3KfjZNLzE83nL36kusfeL+zmmNXGklgE48gS+MtP8MiupY+KdBfEJ6KQHtT3uCMIWTSp3mLInXVBbAPi/+ovVahKwr2HykMrvk5ihR8YT/dE3ZP+ONWhbX0TsMfcIT9/XylYTPlcq3DbdBlrz/Mz4IZriiiOKQ73bBpc+oe
Received: from localhost ([46.3.240.105])
        by smtp.gmail.com with ESMTPSA id kk8-20020a170903070800b001d9a40f50c4sm533777plb.301.2024.02.06.21.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 21:58:59 -0800 (PST)
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
Subject: [PATCH v1 0/2] riscv: pwm: sophgo: add pwm support for CV1800
Date: Wed,  7 Feb 2024 13:58:54 +0800
Message-Id: <20240207055856.672184-1-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_215902_083630_4BCBBC84 
X-CRM114-Status: UNSURE (   8.74  )
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

The Sophgo CV1800 chip provides a set of four independent
PWM channel outputs.
This series adds PWM controller support for Sophgo cv1800.

Jingbao Qiu (2):
  dt-bindings: pwm: sophgo: add pwm for Sophgo CV1800 series SoC.
  pwm: sophgo: add pwm support for Sophgo CV1800 SoC

 .../bindings/pwm/sophgo,cv1800-pwm.yaml       |  45 ++++
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-cv1800.c                      | 218 ++++++++++++++++++
 4 files changed, 274 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml
 create mode 100644 drivers/pwm/pwm-cv1800.c


base-commit: 7afc0e7f681e6efd6b826f003fc14c17b5093643
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
