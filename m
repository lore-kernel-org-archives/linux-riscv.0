Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45D5C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKUtaby5RTek7yuHSPeAndJscLJto5Q11qkDsjH/qOI=; b=dT0zwS1QpXgm/p
	XJSdLlWxcrP0xPh20YA5nzLH2p2BOH2oNqsfmCjz6Hmyh7i7/58qVVAGbcWTC5xVkSZC//4nHBSQQ
	W1SJk42rFQPKX6XAtKdcqNE4xxkE8w6n3mNjs9U0r3lZEzrE5MDKaoLdSch/c4kwVzLsWZogyJ1Gp
	J2FYddh+CHNZJCyKHAJBIBh6yxXm86i344vrKShUzTB8+Q/qxgrYQSYqRluo9DUp+VqFT6wQh83dB
	WYa8bPg6FzjzuZLPlg+hIzYQirSCDGoLM1uwxvqj2JF3mWWc3zpukzylKNYUmHnX/qsUE32jJ8ZNl
	k0PPG2Hisr9JOKrq4wWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKrb-000000055b2-0EPM;
	Thu, 02 Jul 2026 17:06:11 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKrY-000000055aQ-1tfV
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 17:06:09 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-737de525d2eso1231094137.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 10:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783011967; x=1783616767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrCrvjHFqhQoi7ugBP7i0ix99Rxl2YLAyjImpsg79vM=;
        b=koM6t7VVyoDzKzdrVBvYMSv9OKYmiRWb1gDBh9ywNoN2263TRiOtEJ3oUujwBWTJxx
         adNwm6lualYtrKhaBVMoQ2eOVlbFDmARNF9XnhnzTp9lXnwSma1rccdQtCarnQksNiqS
         C2xrsFHHrDOhhXzXaiKRJMSWyemtv9VSeAyEIU1ZYmx8VM9m4KU1mNqdr99nHTKMSH4p
         QACCTjFtGUm5i8bag7lVBoKKMkdb2pPoBBxZNaWGNWVVvb0p+vMpNrDhBxQDVhFWV287
         2/59yN2S2YPHmBPPswsOeGlKw5slRxHKcMqtpZYts91ELf6v0ijI6F2gxB65Xutf+cjQ
         GTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783011967; x=1783616767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrCrvjHFqhQoi7ugBP7i0ix99Rxl2YLAyjImpsg79vM=;
        b=PLzeR1/WPtbH36YUQMzp28HNctuqd7CbtAObZn0bEtXDsJ0pf2YdangCpIRU2XP5//
         i1pe0axT+jiAgO6X5wjbIXLO2gzvGpBA5Dezh+pZZGmXGFm+aYSNYx8j+mKbYf2aG79W
         HQP6oNN8DYepMPV6vpZL5v+3ePZmsfG5SXM1pJFTh0cUeph5CsUMERH9RFRK8l+zmSoW
         txhnHsW1CWS9qVG5vFtxKSLakZZm8SgpiG1pOSJAw8O+GxiWIvezw0CVPCvOI2UBVYXz
         yEUlNATUhUWzicVmm1QQ7UhHlAfUBuKj9flBhd4xuzJohEAazlB6HbPfk96HPOnJXzWP
         hTUg==
X-Forwarded-Encrypted: i=1; AHgh+RrdD0cOPEJqOteJluAZSQnZbIJJECE6KRFKw5psKvb2uLozzHDVo3zievxKx+QHM3VvlXJDijP3r+DKlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4F188Ph5NbJqTBYfI44s2XACBJxfgGeK8oa72R7w7Akp4lqtO
	m1C02SiSnhiHxcgVDilKfo+2036v/EGMbziBE8U9SMlaBrI1p0oAwXSXuLQaef/Eg30=
X-Gm-Gg: AfdE7cmK/1m38l8OI7LaqYR2hcmp2QvcTYIPs0c7zcfsDJvH2uZqh4DeZLacspudI4J
	2zoZ5vGtZv37RQ4tZdhkx8OhHUBrolu0mzii/Y68SMVuLZ/zakY/4auER5Q1Ck1upTF66RXC9vx
	lFt84Tm8+zYj0rpeBwYysQX2hvHFVWdK8bzoOvPaHfr5wSx0gNU7GsovCeB9Qmzqs1M8CxAU2pN
	dik7+P5FzAwm+hfsiype9TLsiJTm65n5FPVLiOPDs7KwwWbi0Tkx3pnO/0FQFQmZcaf2WC9eThe
	N+xOiPL1n8R1C6pD5rELjeW2nb0Hl0qvhTJWfEsKTYcQH3xM2I9fUQN2Un5YV0eh6HvGID2/ELz
	QaRFbJX80ZOCy4SuaePY/jiNRrN9+ki2UUKO1IGC8NW7GeS/OFQ8U05sAoFvy3XtgzN60N0eB6N
	4bBsbf1M7XvWOMqu/sKw8H5DDE7+XMCzbCmqyAkFfU3KZ1dLubC7VZRSIvxHG5
X-Received: by 2002:a05:6214:2d46:b0:8f2:8b5e:3b98 with SMTP id 6a1803df08f44-8f3c63d68e9mr104833466d6.9.1783011625104;
        Thu, 02 Jul 2026 10:00:25 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46f30b94fsm30106746d6.21.2026.07.02.10.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:00:24 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Thu,  2 Jul 2026 12:59:44 -0400
Message-ID: <20260702165944.828550-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-3-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-3-36b4e9b24457@pigmoral.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_100608_514012_8840DD1F 
X-CRM114-Status: UNSURE (   7.23  )
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

Register check for the PRCM driver against the public A733 User Manual
V0.92, chapter 4.2.5: all 41 entries I could extract (13 reset-map
entries, 18 bus gates, 10 mod/mux clocks) match the manual's register
offsets and bit positions. No discrepancies found in this patch.

For what it's worth, we have also exercised the R-domain at runtime on a
Radxa Cubie A7S (r-ahb/r-apb0 rates with live consumers on r-pinctrl,
r-rtc and the PPU, bus-r-cpucfg via its critical flag), with no
misbehavior attributable to the PRCM model.

Thanks,
Enzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
