Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F21CD98C5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 05:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kEQmj4+l3eeeLtlo6+SPW8Cnoegndm4rExr8m+oHtY=; b=NADVqFXnwN+anT
	3REwUOecIqenAKFQ3H0gTqsEPTV4vLohV1piw+irYRUXMSJPmDjBiuUZWQtz2hOy+n69qhnCOw6Vp
	ksuHuBg0cXLKP8j1JK/IDqy56SPP21thpk/x0aSzu2Tj3ecdZJtApFSwCKQPMIN2vBShcqK4MSG4j
	EZLSZj2fCbbO7lIZUyxX7HYEw9rxm/c0xtVRS/R9CmQR2EnVmPpOteUtj0vTIH4b0dHGyn4doW2OF
	ssAA6zsNeYdnb1yHeEk3Ws1pteIAYeL4La8hFSDtMtHxLoaHNJ97PpUdDLwKe3nuU66zBZc0u/Mlz
	6ON4slDzDMmcDxS5Ci+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzXh-0000000DbJc-312n;
	Mon, 15 Jun 2026 05:07:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzXf-0000000DbJ5-09am
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 05:07:24 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2bf0ddaf50fso16240135ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Jun 2026 22:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781500041; x=1782104841; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/Oj6obfAcAELe8NNKZFmVNeON2ZbUEPKWSKWZaFYsM=;
        b=d0TD3q686iSDsUvOY9cdTgc/IR5DYn+TtAoRR+WkDQv+RNjvMwn3VDJaau+hbfq+k9
         vbTqvI4/K2t+xlX2D8IRLPSU5tlfoSE0b7g7VqkEgOnFAIlb85/orTLqEY+XMlCekClL
         r27bbGhG0uyzVV1llWTl2oQ8QJhDQS9EvAl5pDMoQhuXHcdTgSZ45oMUMB0jXbitUwJ0
         LzMByMAOgoQE8RaCuDpew0puURgg1Ve/SJXeUbMtyuZaQXRGnvZo0mRVsX1Go5MpClbw
         g6kpj5cbjJ8WvY8VTMDWapJUJx0eVl/ZD049e5Q63aovQoyofZlSzpJwdRHZBJIvC4yH
         CTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781500041; x=1782104841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/Oj6obfAcAELe8NNKZFmVNeON2ZbUEPKWSKWZaFYsM=;
        b=N/aPhu3zXsw9wcz40D0Mh01JDMJ64a98Bk/GiklpraW9SxnJ7x0G/DlQyhx/tlVivl
         9qqoH6Ja/1iGqdDg2cfs4M8QLIW/PI5QerU4v8lh16hO32ngFQ2hVIkyYQQcDztnaQBd
         Gv+eQKvZy3XLDpf90pOR2orAN6zZ1+8n8KJj46WRgb6OixLGICmAIBw/NqCZHwT48y65
         SCaUnczbnoXIn2LMmrf9o2VgHw3eRHz0ICKsl7BT88IpAC01Ec8Ci8RPLtqjDFwRuRy2
         0Wbe1U9+9g/p8OSn3rfnIRpBUFSpb7m/byGX+UX6bVfNcroOP5UZkBiJdlBdBv4LCL8A
         bLcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/oH9IZr13x2lbry5vtto0NVWkAC500/6x9vpCFgLyduCHiJpB+yuGHb21KgRX5d+SZZmkDECtBV9XekA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVSqQMTyAa/rYhxrpTCMRqEX89aE6la/gy9Z3MYQXnGYK/vjgg
	23iNPkRP+754VHq8BGWhZEv12+DQBVcYmz1K1pmDRCMwP50GtSdUlGbidgv4ykTtusc=
X-Gm-Gg: Acq92OG/KQRggYo5rBL6e/9IsArjsbyCVnE9XigCx/oLu/+jPJ7an4EWAwG3pWAm/2X
	Vc+J8tuvPiXvaKcNoalheQFpZHme7ag4Yw2VDQ3YmE5ZUxWxCkjlpUfP8Ne5ywsg8nRu2+ax+fa
	ljqLVjss3OJr+i10QFxg2AF99n4/M7MRaJrYfdmwV+jRFFvsZv1vMx7/bT61fKzujwy6ZZTsmaZ
	QF5IYciWQf5aQB4GaHp65nyu58wuOpkKPlCRGZXR/QFrhIf1P7N8IjWgMfwD39YKe3GelGf87aq
	0/qQdTiZGZ9MzRUqB1FLHkVvK0sYyCn8JyfwyvCSH4jO9SYjEgL21NFF6TiRwMm/1Khq9QaRxMz
	Gjtj88G4+K0tkzVRIRLL+JyxM2k5Mr14YPtUaAPc/xe48kaMOcYRSyXvCQtXFvhMyU3OBXHBMR8
	Jv1OhNgRL7n3j/gNQnQA+ffxs=
X-Received: by 2002:a17:903:2c0c:b0:2bd:ba44:6c07 with SMTP id d9443c01a7336-2c66417d194mr100735495ad.16.1781500041150;
        Sun, 14 Jun 2026 22:07:21 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433558449sm89984355ad.78.2026.06.14.22.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 22:07:19 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:37:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] cpufreq: spacemit: Add cpufreq support for K1 SoC
Message-ID: <lt7l6hvia6hahvizr6qwirgnhzjqdfn4edzt7fakqxbhkcmaxr@x6d5h4i55edw>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_220723_109022_F97FC92B 
X-CRM114-Status: UNSURE (   8.66  )
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

On 12-06-26, 17:51, Shuwei Wu wrote:
> Changes in v3:
> - Add a K1-specific cpufreq driver for the shared-rail, dual-clock topology

Why ?

> - Use one shared CPU OPP table and one cpufreq policy for all CPUs
> - Link to v2: https://lore.kernel.org/r/20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
