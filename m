Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4799DC4451B
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jul 2026 14:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C6REoY1xJpS+Kkj6OFIlPC50sd2aCnSoy9GumbYQTS0=; b=xIBlY3TGhTL1WH
	x/vnXyczKESpOyiUulqkhwEriZWcyw0djfKtL7x8yV0kT/FKL5rcKdxlZLJtVt7p/0gN5pqmGDjZv
	qFQLsHQYmp8NtAggPBlzU2IVEo7LQGZLrq1khppeL0FwovXBqj5Gd/+uRPWR4WyE0MngORPYtWheh
	9NwbLjyjWoVN4wGUuD7vzAaverOybtNsDoUEX32UFsb8SCO99ZgN8gobaKkW06IwlAEeNYi03SeNT
	24rmhKoigJgZxq9IkydEgnwljNQtR23xqEFHYaQwpJ7oZMRk6ntKQSEtcFEiDHRp9bu094w+tWQlG
	EqHoIM6uNgqemfXJYtcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl6J3-00000004BGQ-2JeQ;
	Sat, 18 Jul 2026 14:46:21 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl6J1-00000004BDk-2Vlw
	for linux-riscv@lists.infradead.org;
	Sat, 18 Jul 2026 14:46:20 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-92e5d6f35c1so744264385a.0
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jul 2026 07:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784385975; x=1784990775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VapJVpk7Upuq/4IsumhznTZhjSgCFeW/dRXr+/nOOSk=;
        b=aT0n/KqE9tldr4M6QCQsYhN8SYoBCO03fcVuUAHkeKlLRJeQtvG3FYEIWpV/B3A8dB
         58Cya7X1YqxXCw2HOFrgTFpNwEBaAgLvsC07GgrywO/6OaXIVghnO7rf9/50KzL8IAVN
         aukiCFPNIhYyaF45pwg3GCnzntBhzS0ZFC1hsm/jRKiqohuZXstyoA7lsPA2PIM47DLC
         DnTjnwG6TJU2X+/l9J2erTR1rOU377PLnsJGBR0mEVQ++HLX7vqf5NMv23yOjSIAfZ+g
         d9jbxLmf4ig68pMBNGxGd2x/+2QdXHBiS9pqXHxT01YDINv5N48AcmFQogkdsgBBVGJN
         lR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784385975; x=1784990775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VapJVpk7Upuq/4IsumhznTZhjSgCFeW/dRXr+/nOOSk=;
        b=RvR6HUyo+OpWYQg1Z6qQF8UWTSqVxLuyZWn1N2pVYB7kpTOz7O4nBPFMwtuO8QDlmw
         ZhTtEzTH+oxtyY6N3lNg5z41aHK1Yg7lDfDZpkXyftjciFTwmbjzR5guh+vcIcZKQ2TW
         ZAp3w6ECKGzOXp7Vo4x7otmGNLlWccwJwtcEpmSWynVcBYFK6Ls5jDcR2o+4LoyvCq79
         hdTYjMPRJSU/QAPWlR8Ormf23tL1gk4Xp+4UjxRXfbhkKMrqHw5ydIuNS7BINHBQvfvz
         iCgKLruXE1ifc6uevT7CSRFxzT2BABsbQ93v0u/3WvgnQkXqeou51gKuedW1KFfGfLg4
         w1tg==
X-Forwarded-Encrypted: i=1; AHgh+RrdI4ah6T0268Rn9zcr6Dd+ntJ7+RhQHu4Py+W1+OPSrHLTX4aWjlYXZ1OmdeXM9K41BdcXsCuXyjJZRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmgQhLtIfflrwbGQGmrdN5afQmztkw92BEEuZJLUlwmWa1uAtG
	JMykP51V7OihxWulHX5WP9FX5c3fY9+KhF5lEYHx+Wct8bFsgNlBz1fM
X-Gm-Gg: AfdE7ckqkmMDzHFTVboUyVguLrj96c2mITnIcmlwTRrb/XPm5IH0jISGXtqmFgbou0P
	lYLgzu1MuibcbViP9WFGqoce5LjTc6rgRmWGixKWQUDmrVX7ZAgLKZTgwxucRf6LuXorbIsM7jG
	bJR8e/ll2V0Zsk4BZtCDGJcc9wMErSQiDpFbMogowZvYT2M1WrPgOsKUtln7cvMiO/1EfaGkIpM
	JyXUenuZb2wOLWNFEMHpJkG/+rW/968G2zjpMXxFDLq7c2dhJBkgFQvhJGzUTorZND6Yscxu8l5
	C/sXcbkxNXbpDNqfl0V62JmyGPUdgMWDZpctm6JREw78VL8Z5f6t1X0w2qUmY4LkoEqEGu6c8Fz
	NeJ7+8yE42XhSPy9nJHZLUB7q8NTeKup/hQ7TDJPsZfi99MQLYy+afpAZ36SCFU3zOaH5jG5KjY
	qkPs14IrnR5n9kTK7/X9P8Se7D3lPTQVrg40iMZ3R0yy9a6w0NuG18AA==
X-Received: by 2002:a05:620a:400a:b0:92e:e252:bb43 with SMTP id af79cd13be357-930b4381a6dmr700628485a.77.1784385975182;
        Sat, 18 Jul 2026 07:46:15 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545ec44sm418682185a.34.2026.07.18.07.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 07:46:14 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Sat, 18 Jul 2026 10:46:11 -0400
Message-ID: <20260718144611.1523567-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711-a733-clk-v2-3-974d188cbe0c@pigmoral.tech>
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech> <20260711-a733-clk-v2-3-974d188cbe0c@pigmoral.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_074619_649666_E5116924 
X-CRM114-Status: UNSURE (   6.78  )
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

Hi Junhui,

I re-reviewed patch 3 in v2 after Andre pointed out that my RFC reply lacked
a formal tag.

I compared the RFC and v2 PRCM drivers and rechecked v2 against the Allwinner
A733 User Manual V0.92, chapter 4.2.5. I checked all 11 programmable clock
definitions (register offsets and divider/mux/gate fields), all 18 bus-gate
definitions, and all 13 reset-map entries. They match the manual.

The RFC-to-v2 changes do not invalidate that check: the four R timer clocks
move from the MP helper with no M field to the P-only helper while keeping
their offsets and P/mux/gate fields unchanged, and the R PWM identifiers are
renamed while keeping their offset/mux/gate fields unchanged. I also checked
the gate-only BGRs for R-TWD, R-PPU, R-TZMA, and R-CPU-BIST; the manual defines
gate bit 0 but no reset bit for those registers, matching v2.

Reviewed-by: Enzo Adriano <enzo.adriano.code@gmail.com>

This analysis was done with AI assistance and each finding was checked against
the cited sources.

Thanks,
Enzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
