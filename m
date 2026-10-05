Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD03CA5FFC
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 18:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cGKhrUo63L5C1lIQ61+oYGbkP2/tyLSyCIpcIQHaX7E=; b=lI8CVrr9T/8jm+
	Y8qyuyKqkWQ3aBRalTarRTDxOs4cPLG0uIfPYA0NEZqlb3xok1pZFEjiQAejrPH/BuSOAGZkvYat1
	fnUnBO9jaf/82bB9vQGxDSxowrL6QdJ7T29q1czlqAChk/XiE9lpbNGlYCmnTHP5feiwRUFIkKcEO
	OY6gA7JEIZzfwLNzZjjJ6SXkPcAtEMU4tdsN84XALnCQpv+NenF/FNXtHEGI+DDWJTHsc0s3mraYV
	dkDOv5sU3+6kP914PcI4uP5wudWxTcA5EsTTBK2vghn0FDz0EeTT3anvRzS6uwKjycjDKLWuqX7ES
	9aAN8Zm3rgbwoEST3fgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDnT2-0000000GzqQ-3eGx;
	Mon, 05 Oct 2026 18:31:16 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDnSz-0000000GzoF-0thY
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 18:31:15 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3282db206d3so6640902eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 11:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791225072; x=1791829872; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6PuYbZh3CSJx/YeySaraDhA8HTOEwlS5gR3oZ9G0OMs=;
        b=r2F5yelUr2rpRXFxaPeosbxJRHdflpH/GakJwqbwazFaS54KJTWop2lEUDvHvCgI47
         f3yQfUmQmXkXZ1V7BekSHyjD3+mwl8pcIRdXW8UNf8egCeZCH1qFP2f43bdZNkNCl6vB
         m2V2CYJDjrHvDZ8F4BucMRGoD1DgWRZQzAkU7cX5/PDc/K8qTYFpqQsYiH95ohI+88vU
         P0SXGoVTzFQ5QUKXLTYd+mhx3y4SzkkykBMh1jvF3yHLMvThoD6eaIMfFk486KNkcMST
         mFzaAtA6lONHAOJ17XmSgVZaB2dj1sfsrGwjyLnJ1X3bXNtpbWghOtEnjCt/1wHTswyG
         PSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791225072; x=1791829872;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PuYbZh3CSJx/YeySaraDhA8HTOEwlS5gR3oZ9G0OMs=;
        b=iemKg/grF9188ZPaccr8iVT28ZX4eMdgIhzo5GGYYxG8VZPxUwyxUcTIkKOG2Tfbp2
         s/494Tn2tPLqb8gJA5VaCxAB/TZDGWCg7oVGIrLUgnFo919eKjAChaVVNvGc557mPuOr
         XXI7NgHjvICopzTGCdHelr6iPcLIYHpARP9kg3YcYzuFasLYmM5G9j11xtsceA9Ly9eX
         gh/1JmbMkLXz/w1fCPKGhUU2LmUyFiMwsYKylkujZh0ySNOs4/96gXnuCgd0neCTe0nR
         ZcxmIxReLE30LsZyqWTLOg/xI9HgJe6x3yl4UuQ7vSdncm4iG53cmTeCA1RusYigbs26
         WCVA==
X-Forwarded-Encrypted: i=1; AKwUvBy/2WLpRoCcy7rGhYdmZPHiLVwSMTq4pmVw/R4lwrviqjfLUDuHSSrjPFA+sAuK9dA9opMkDGlfxQYWnw==@lists.infradead.org
X-Gm-Message-State: AFuF++kSRUjnhUGA+hrXLGzK7RtJmkvN4/uVlsLKl62UDGlWNklVcquH
	HDqT2KOWMQD7HTC22Y9qWH0KTx8rykofFHhtmrnq1gKgJXzWZ4f8kJiZ
X-Gm-Gg: AYBFou3NxyjAGv26Ykxn3duE9jIMnWAf122Zv2ykQLHErnxRiDppMpHs/U9p2WmB60M
	W73EIniy52dgoT55n593FJQbtXG4PsDUiltC5wc6lPfYi0R6U+mQVhpmO9S1uUPVz28TT1tjjiy
	YDa5xtuaTIWA5uCqyub+QMXIRdC9LBP+fqTvm35rV5GX7wlADKFvh66UWEGc8mu/4r/nHzQ7IP1
	3e7mDBXmcWbMfEBkyTmpY3uheI0hcXQi9AwGROHxrQXjp+xeeklli/Yf8kD1fYsmYD3pjUlQuwU
	qS3TVHKUg/YtKJR7Pe5KrStZB86/djVSLCC2jGUbn63EtOP8DrGTlYLgnCj2WEpkKwy5e4Eua/s
	qLunfApJOGDQ1pUbHG/KnsUy8I/7AIPEPOeLndiGkUTYbs5NdPheJ3/Hw5lTsW5lNtO1AKP92T5
	iol8i/8dqbZtG1Fon1mBfyFnPzOJ2U2XDNEpoB5kEZAIx8uLkKJQ/jf2LdFtzheHahehab6R7rZ
	1Ftdwdtn9H1Xgo9QWV7B++GgyF8zU5WGk8KfwpRQCDdwE0m5unm7QpjqZ2QPpDDjHjQgOxwm1sN
	9G9GjmI=
X-Received: by 2002:a05:7301:f84:b0:34c:1f07:2d5 with SMTP id 5a478bee46e88-3511162fa68mr10914269eec.6.1791225067702;
        Mon, 05 Oct 2026 11:31:07 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac4dc4sm140223eec.23.2026.10.05.11.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 11:31:07 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
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
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v5 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Mon,  5 Oct 2026 15:30:20 -0300
Message-ID: <20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_113113_585743_69B3B10F 
X-CRM114-Status: UNSURE (   8.67  )
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

On Wed Sep 30, 2026 at 1:26 AM CST, Junhui Liu wrote:
> +static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw, 0x17c, BIT(0), 0);

[...]

> +static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.common.hw,
> +			 0x21c, BIT(0), 0);

I'm bringing up mainline on a Radxa Cubie A7Z (PCB V1.11, 1 GiB). With
7.3-rc6, this series and a local common-DT integration, PSCI reboot and
power-off hang once unused clocks are disabled. The boot chain uses
vendor boot0/BL31 and source-built SCP/U-Boot.

Keeping both of these gates enabled fixes reboot; either alone still
hangs. With only these two marked CLK_IS_CRITICAL, reboot returns to
boot0 and power-off drops DCDC1 from 3.3 V to 0.7 V and turns off the
green LED with power still connected. I haven't checked whether each
gate is needed for power-off on its own.

My guess is that BL31 talks to the SCP for these, but I haven't traced
it, and it may be specific to the vendor firmware.

Would it make sense to mark them CLK_IS_CRITICAL, like bus-r-cpucfg
already is? I can test the next revision on this board either way.

Thanks,
Vinicius

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
