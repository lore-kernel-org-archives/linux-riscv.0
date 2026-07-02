Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5A0C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 17:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9rSulcJ4MaWbCYvhwo8jUt6yX2S9Da5Xis0sLEfrLA=; b=YNVBGqYceNPX1Y
	3hJM5j9TbAEkxehiP5kJZjHF+tSSi5rI4JM6BvjRXesx2aPAj2er6zFmvNnPUxUlNP39Tx/4ya/JP
	p1Qn0qu69XRU+GqCMOaP1YPGgzyD3knWG6i1QB855X3cF+6hR/D0zq7sojHWtrHQmimadqtywV3y6
	Ueu5wjWfXPEOcq/0zNY/X3bWMmcIOtSG1EIPNDfMyKTSlugXfcygM70iLFxUqYMqnqJ0UOVwanBZE
	W8aWmxbz+7kkRFFSHyn2Y0lOX5RN7ugDDZHndsu+HY4ADaL/nj3H/ZeaZNNnGtzjR4PbuzI+91K8F
	3UCvgMrhYPKu0gA3TCGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLJW-000000059BS-0SHJ;
	Thu, 02 Jul 2026 17:35:02 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLJU-000000059AL-07TN
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 17:35:01 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-92e50979c71so204450885a.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783013699; x=1783618499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qJKEGc46A6MaBdapnr1AnlxGbrLJznLMC+lsm+gAYE=;
        b=s9IkIJFteQ4XXOC83RzT3yoHK0AE/Mvq9NFEIXUgwi+lQyMdIrJ1fXDgS8FU/FN4j5
         ujgSxdZS/dcJtBNpbLwKIEAgDMrsbGcoD9p6iJc4Nd1dIMqzBO0GwJLZlrkdZUp+7r9G
         5fu3xZLXEbg7mHELZ6qpnjOU2OZjY8JTl9lMFptV8rr6S5hf8K0/4w8bAwRfYl/U6hAc
         4iC4hvbXG0vv7JzyJWmmJN1sGrLUjOL9bL1mNaBk6plUSyItsrrLFM4br2XLN0Hvv8iM
         oM/IAmPPz9dJVLR4CtLdniE3eNsmVqqmURA4Xo3JuoE3kBoWbDK+DW1zsNXflgXwGX21
         Iu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783013699; x=1783618499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7qJKEGc46A6MaBdapnr1AnlxGbrLJznLMC+lsm+gAYE=;
        b=U8Mon+D/r8faJmXe7xwWEG7Jb32kJQEDSYnpPWnFB03eMEVL8R60EWEyUJgLcFpQBf
         OSosAuvcngIjqgrTa22vSrl/Z5JWmeKVnE59RYiBozf4JxujcBcFUT7PV4r/yRWb1lRo
         4RSZGcCTQeIfV+O1ebJafGjVQjh9/0NAe1XGBiuxHLt6HRGUhiw3LHYIJqwRaWfFeEjP
         Cx11bDADWUBYUfNXQDnarkekH2n/gO8/RejsKPS+n8IeYWy4EyLcnpqQWG1EKe1ZKcwl
         xey/eH4vf81FAyW+Su2wT8nbuYfTZMj4uYZS4CTfhWLQ2ewea1iOoSCFuOLxcu/pmvKO
         KuRw==
X-Forwarded-Encrypted: i=1; AFNElJ9fcbJKBcbbPCOl0T5sBQRwKqcQYRE8TYXbC6XC75Y9k9hIARnc1zrCQx3PkStpbh6p04xrUN91ReCQFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCPbeIWCfzprLjyoFmHXfy9eOD6whveBynrraSm2HM0lW+c4KA
	FpkkqgzP2zuY63G3X8GojltRmISXCmozuI76i69mEtownqNUbL6eql+S
X-Gm-Gg: AfdE7cngTg+9iXdpZT9o7OujJ23k5Z5yj3LVCNHVavmAPb7agh6O3j0aa8CuSlIGbGQ
	5a3NQ28BtjS1fUC+GV1/OJelFEF+OPvUSunNMjFszt/MsieJoCLk25b4inb5gJ7QKeXkklKrlEf
	POE/IjlQfABGKY1ESYHHIZ4CtGCJNn+QM1tpWYygKZgCatYYGKvs1Od8N5oPAy8faJozTlX+SrA
	3oJALz6nDfkqn9KvpOlOmJPUXFmGuR06TJup3Jv45g9XwA35AkFcujMNAfBhM+LXqWibwTwuVLt
	EuLlReLhm2vWXYkkas1WWY40MGen5qQ5GD0WyuT8JFP3YX6t+EBdItd9hfZ2jfL8tMgiXFpdG35
	DdRdaUNTfTy0x3UHBXosS3r6pwz9FQ/9XjdSCzDMLBnhS4xWJCsmJZNrhElYquWluYcNXoE2Clj
	AyVLsKeg+/eX+sgvDx6FWoizdmffXYGS9Isoi6SKr1BfditfHLHsA/SDz0O+0c
X-Received: by 2002:a05:620a:468e:b0:923:8612:f15 with SMTP id af79cd13be357-92e7823fc78mr907524385a.18.1783013698575;
        Thu, 02 Jul 2026 10:34:58 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80162220sm268889985a.25.2026.07.02.10.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:34:58 -0700 (PDT)
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
Subject: Re: [PATCH RFC 7/8] clk: sunxi-ng: a733: Add bus clock gates
Date: Thu,  2 Jul 2026 13:34:54 -0400
Message-ID: <20260702173454.855897-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-7-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-7-36b4e9b24457@pigmoral.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_103500_078740_C89EC5D9 
X-CRM114-Status: GOOD (  10.51  )
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

Following Andre's suggestion I went through the bus gates in this patch
and compared every register offset and bit position against the public
A733 User Manual V0.92. Findings below; everything not listed matched
the manual (122 of the 135 gate entries verified clean).

1) UART1-UART6 gate bits look wrong:

> +static SUNXI_CCU_GATE_HWS(bus_uart1_clk, "bus-uart1", apb_uart_hws, 0xe04, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart2_clk, "bus-uart2", apb_uart_hws, 0xe08, BIT(2), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart3_clk, "bus-uart3", apb_uart_hws, 0xe0c, BIT(3), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart4_clk, "bus-uart4", apb_uart_hws, 0xe10, BIT(4), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart5_clk, "bus-uart5", apb_uart_hws, 0xe14, BIT(5), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart6_clk, "bus-uart6", apb_uart_hws, 0xe18, BIT(6), 0);

Each UART has its own BGR register, and in every one of them the
gating bit is bit 0. Manual section 4.1.6.141 (0x0E04 UART1 Bus Gating
Reset Register): bit 16 "UART1_RST", bits 15:1 reserved ("/"), bit 0
"UART1_GATING - Gating Clock for UART1, 0: Mask, 1: Pass". Sections
4.1.6.142-4.1.6.146 have the same layout for UART2-UART6. So these six
entries should all use BIT(0); as written, enabling any of bus-uart1..6
sets a reserved bit and the UART clock stays gated. (bus-uart0 at 0xe00
BIT(0) and the uartN resets at bit 16 all match the manual.)

2) SYSDAP gate offset looks wrong:

> +static SUNXI_CCU_GATE_HWS(bus_sysdap_clk, "bus-sysdap", apb1_hws,
> +			  0x88c, BIT(0), 0);

Manual section 4.1.6.92 puts SYSDAP_BGR_REG at 0x07AC (bit 16
"SYSDAP_RST", bit 0 "SYSDAP_GATING"), and patch 8/8's reset map already
uses { 0x7ac, BIT(16) } for RST_BUS_SYSDAP, so the gate here presumably
wants 0x7ac as well. There is no CCU register at 0x88C in the manual.

3) Gates without a register in the public manual (V0.92) - these could
use a short provenance note near the entry, as discussed for other IDs:

  - bus-spi4   (0x0F2C)
  - bus-sgpio  (0x1064)
  - bus-lpc    (0x1084)
  - bus-gmac1  (0x142C)  [same question as the GMAC1 clock IDs]
  - bus-tcon-lcd2 (0x1514, and the tcon-lcd2 mod clock at 0x1510) - the
    manual documents only VO0_TCONLCD0 (0x1500/0x1504) and VO0_TCONLCD1
    (0x1508/0x150C)
  - mbus-gmac1 (0x05E4 bit 12) - bit 12 is not described in the MBUS
    Gate Enable Register section

The remaining bus/mbus gate entries in this patch all match the manual's
offsets and bit positions.

Thanks,
Enzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
