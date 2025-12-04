Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FADD1CDCE
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 04:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpFzcFZyyn+FLwgWbOmr9EVcx/DB4W6Iz6ytGqQhqnQ=; b=v8NepACLpyVNi1
	oFqAnIHPpjvuKjrZmdelrF3f5a5cDTxdLC3IioufkhwYeCeSXaYDyZ5QfR0DCsJs3sZR45IICN9ga
	gFccSLqSuTDLGCVVuQ0OruBRFPe1SCJ54fFj67CVGjKCdcFSl2saTusaxkn+25lRR9XhJuaW12Qex
	q5F3qgjXOV++kSuQ62jhnEiirJ8gHwe0d5Wg6EKyCAsX/8X+C0xygkc9j+TiXFWf3U7mzsDqj4kUf
	E8XoKPDZGghkO4CsoAX6CXLgCHuVD0APXO+rEfcVcYRsYg1YcBTwm3Q6267TXHTr6+nxUg+eRlXpY
	VcfKJsW163oEcSLX3EEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR0h0-00000007RNy-1l4F;
	Thu, 04 Dec 2025 04:11:46 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR0gx-00000007RMR-0afp
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 04:11:45 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7a9fb70f7a9so78233b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 20:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764821502; x=1765426302; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwCMuSM6O1Pbdf5nbt7dtIgWGi7Ix46jqsOFjxab/n8=;
        b=CCRkLtLoUBRJj5jx0wDyYgU82In5tV9IAqNhGF8kekpWCXygFyp4xC4DbaGbx5Nc/B
         ynsoywW/QyAzSp+86RrFq3E/6Bwnqj/lYiHrIRLhdNUdpE4FSbf3cTzaVdDJymVlS3s1
         3XW28SfBXsgc43utL9w8dj47HA4oNKFrM+r0NJmzNSm/hTsk5TABhWF12WsNM9szJbOm
         ah1h3RrDTie9SDnoUZ9l1glwrYvUX0GCelhppKM/D6V9spjQ0QwRfnVHghaHzYo2W1xQ
         w8bmIvyCFHAMT6z8dnoONGXCbUaAd55wTTPPcYT2FWQyQavHgo81cfV8v805p65nnsJw
         aMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764821502; x=1765426302;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rwCMuSM6O1Pbdf5nbt7dtIgWGi7Ix46jqsOFjxab/n8=;
        b=lxLPzFfumJPMB9LAKoprHjEqCPUGVZC80mQR38jx5DRczKiwM7RCqtK4Yf7KWMfhjB
         hA40MMuhfmWRTvMmrGnEaY3iufjmBvCDpXdIgAnXU5UMxcyz/O+09Wfjn8aoozvLREB6
         pqFzebkXvXDZCEKn5kNVXNRI0DicFnfi4+YQ6pjD+K+Ga6Bg+iIX0Mj+8RhqXLO5ewE9
         6JSBdwzZZUYdxd2W/8ddXMMwcDCbIRQ3KaYPlkh+R7SA6GyLsVNiGaS7IG53iz4Rg02d
         tUCrb+DFks3IExPUcgk3kERuq/zv1yk0tUYPrr8yKuT2LBnVWCcHP/hdQTqeLfnuVP9C
         +y9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRFBLo9izn6EWpS8e+yDeJkt5g/v9zdKBJImgKbrKn3D7T1vUe97kp5KjsI2thd/ZL2PvjUz+iRzW5vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwY756LpvzgikWvQ51IVDXSU6J2YOhvaV0tOGdZlNMkQh87Cw9t
	UmYD4Ub1cgSIYByldpTxE0+ko1JYkQIQSlLG6AhNasVo+Zg3ENl0WXJG1WVKd90nLhU=
X-Gm-Gg: ASbGnct9FQO90c0fhBNPtYONY/pWNizTLMeeqXCnC5+YddaTZz8uYhLraC8PNSAhkOv
	gLnfjcQGFegnKTIGeDS+rEp7Mi6HfCITVrgzieczbQO3kwkss92oF1mK7qrO35W8vbGqoWwZ1xH
	TE2w4AsvKdEVunNtXNQSv5SWj3rxWETSK6VU2JsMSqbECM66z3L3Map0iD3iGz0gr0EFqdUrftX
	61MfoByFBuJ9H9SoITjcXJsmPFRCVqIi9b8y0hfw+lIslZabkPzLBIIWLXBP7p5fkzWHIhIgVWV
	td/ZA5JMx/blioI9eId4tT/N087Y0zIoi0uezlhlnZqXU3bqKJJmUwx8qgx/aWGEo/RMSDndXIR
	dsYAOZdh/6Swp0N98OVCNc5Dvbt0xxEhlt3sPakx8ud6seby4bMEiTBW5QB3EStlZdmkKq4v4WE
	MBe11rMW5QDrTA
X-Google-Smtp-Source: AGHT+IExUrj3ZMYLrqnhp0b5tWbY5kZoXk6/8iF/NzWQ82V6ZiAxlOcI//cw3FR+veQCCjS2CkA6wg==
X-Received: by 2002:a17:90b:1a8d:b0:340:73a2:bac9 with SMTP id 98e67ed59e1d1-34921118c1emr2376175a91.5.1764821502264;
        Wed, 03 Dec 2025 20:11:42 -0800 (PST)
Received: from localhost ([1.232.169.190])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-349128c00efsm2000469a91.0.2025.12.03.20.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:11:41 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 04 Dec 2025 13:11:39 +0900
Message-Id: <DEP50CD8K22E.1JW7GL6WLK44W@ventanamicro.com>
Cc: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Yunhui Cui" <cuiyunhui@bytedance.com>, <conor@kernel.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <luxu.kernel@bytedance.com>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <jassisinghbrar@gmail.com>, <conor.dooley@microchip.com>,
 <valentina.fernandezalanis@microchip.com>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <maz@kernel.org>, <timothy.hayes@arm.com>,
 <lpieralisi@kernel.org>, <arnd@arndb.de>, <kees@kernel.org>,
 <tglx@linutronix.de>, <viresh.kumar@linaro.org>, <boqun.feng@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <cleger@rivosinc.com>,
 <atishp@rivosinc.com>, <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v3 8/8] drivers: firmware: riscv: add unknown nmi
 support
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-9-cuiyunhui@bytedance.com>
In-Reply-To: <20251127125305.89961-9-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_201143_173184_DE742629 
X-CRM114-Status: UNSURE (   4.61  )
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

2025-11-27T20:53:05+08:00, Yunhui Cui <cuiyunhui@bytedance.com>:
> Register unknown_nmi_handler() as the handler for the UNKNOWN_NMI
> event. When the system becomes unresponsive, unknown_nmi_handler()
> can be manually triggered, which in turn invokes nmi_panic() to
> collect vmcore for root cause analysis.

Is UNKNOWN_NMI what we expect the watchdog to send?

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
