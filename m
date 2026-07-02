Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30BBC43327
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 17:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gJfyI5lDpDMWDnzEGvMOMnYSxI0Iz67STTfZe60/Ziw=; b=O+L3apBHip+Nug
	D7Z2VzTWyE9g+ghkFSjQQTPh8er40JxicjRUK4ZOcBefpJ/MiBXh0xefUKdTEx/hvC5vfFnEBjxDH
	oQl8XULSHlxBcX7GnCxeW2SpeznD2/lyX74fT6OmVzMuvH8kpPSPX6n9AJqCXeq0zaQIy781UAu+L
	+K6y1qK70gsYLFkAOCx2LTn4K8j0uCzUpKvuirsnAZXw8rX0DtPtUvoUsFtxZ0psfYI0S+Ko65Ykb
	x3fh368H6EUdz219s3esjUXaX7+QsbTAbWiyQDZYaOECXfR1P6sA4tAXYS83eGeok85Tm3dsPapOI
	1pED8RWPfWzPDBobeArQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKvl-000000055yq-2EVf;
	Thu, 02 Jul 2026 17:10:31 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKvh-000000055xq-0oo5
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 17:10:27 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-664ae993e4bso1673782d50.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783012224; x=1783617024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZACK+Wxf4gf4Bv0H2VF868lUB/6WpdvSpaEj4a+bI0k=;
        b=VHWisjmDrX0mU0ZbMHQB1HuxDXJBYotdCAc3BcOT2YpD0aTc8qBXRduYtK4M1r4rn8
         hnHVW8pXSD/AQWIed2fyQ2/kc+vWmhMtrdrx3m/WoGXj51akiFVgDntu3es5sJS93+ZD
         65i5bru8M4Sk9FWuqSW/8UZQ9J0AD9dFBKF6GG4+n9detnE2Ihkok8aBdvXjOxZj4ewv
         OQRb4l0n7AqdYKgrAgbnF6ZcRt+j9NFb0e9GvaqQBqQ11QMGyunsIiq5ZUSyrpoondE5
         tj9FEGA+sj8yWcSZtzMpA17BUxttknm3h0tIB7YvG41gsap+4I33HqxzxVqO20WKEKrT
         lBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012224; x=1783617024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZACK+Wxf4gf4Bv0H2VF868lUB/6WpdvSpaEj4a+bI0k=;
        b=LA+6+owNmhFVBKcN4h2qzc6er7WIR6Iv8m0NIvWxpyjSn80RFEQUhZ3UKZzCU22QOl
         eqVy+XmbYn2VEWda6ZiZOEBWLCl/PockAH5DzgW6Zq6jk1XHviE7N45P6LF9dmBbbvo/
         5tpmVKNQqpiJ37BkgVJMdzsfDXpQMThdhp/pXWtGz8HYq064poPwwIPW0hVT0rwJMgjq
         fVgazvWV+4w5uthkfNGKusLciFQmnvxMo2GvKeBJCfrnRO3uI8XOypv8YrVJ/KaO4Jd/
         ZpDMpQXaJPo0HY/t4OLuUkdKpKRk8pdNBfc6MAXbU3SCN6KujqRTr6tg8hp9tynDG45+
         W4mg==
X-Forwarded-Encrypted: i=1; AHgh+RpF8w7GvfdksqYCQAta4iAQDtgXFP0+8O0kCcjGvrUQ0hUdcLFm9tFlKMMrj6eG0iUF0OHgyCvNW+teug==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmtOTC3Q7XHoIwFJm79/tF5CdGNpe1OXgeiAxhtL7owbCjNp9v
	TKK46nuXOMt6qFapx9/wpf+LZmsKihGgceDbYzcweVhFQBYKsQ6LNYbd
X-Gm-Gg: AfdE7ckavdJSnRlGWyDbg+b8/fBUXnPe6ShaGeeL6Gtll5uUCdxK14PTL07DmYD18BF
	w0EiWO3mENREwPVT9Q0YofBEr+64cTcJBgA3KjeSXqaKjVZq95kDkBBo3VlpnSDOCnlOcmulouJ
	phxD20VzOk/JNOFBoMF5T8yXIlrXmb7E24nYySQ7gO5w/7jw2yasQ/PpBsuQLLiiUgD6km5zGy6
	j1vpTu/osj5C7viOXeUZDIgKFL7fede8Ec+njYo5BkMbVL++AJ4tFe9u3yGO2A7ypRP4Wwm7QmF
	P8BELhjkSrKJTRiGK395y416ZcurELZXvrpI8ofw7rlbhcIqquado2ANNJAJpNK1eskwne8Y0KD
	ztiCr92OHwEfSBeSnB/pP6HfVF9A+X9CQgVLPKUIHnaXMBA/IZblbXhg+WRbZZLuET238t1BCa9
	ypq283SU4DGziCogAjv5rFNeTNMHfEr4Cp5E06etlQhK+mNWd/11VZZu5Pd60i
X-Received: by 2002:a05:690e:2447:b0:664:f562:1fa5 with SMTP id 956f58d0204a3-66636ba95e5mr448218d50.46.1783012223973;
        Thu, 02 Jul 2026 10:10:23 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1354880d50.11.2026.07.02.10.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:10:23 -0700 (PDT)
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
Subject: Re: [PATCH RFC 4/8] clk: sunxi-ng: a733: Add PLL clocks support
Date: Thu,  2 Jul 2026 13:10:20 -0400
Message-ID: <20260702171020.836546-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-4-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-4-36b4e9b24457@pigmoral.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_101026_112417_017F311A 
X-CRM114-Status: UNSURE (   8.51  )
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

Register check for the PLLs against the public A733 User Manual V0.92:
13 of the 14 PLL control registers match the manual's offsets
(PLL_DDR 0x0020 through PLL_DE 0x02E0, section 4.1.6.1 onwards).

The one exception is pll-ref at 0x0000: the manual's CCU register list
starts at 0x0020 (PLL_DDR), so the PLL_REF control register is not in
the public V0.92 document. It does match the vendor kernel's CCU
(SUN60IW2_PLL_REF_CTRL_REG 0x0000), so a short provenance note near the
definition might help future readers, same as for the other
vendor-sourced entries discussed in this thread. For what it's worth,
on a Radxa Cubie A7S (26 MHz DCXO) we can confirm at runtime that
pll-ref produces the normalized 24 MHz reference with the hosc-side
clocks reading 26 MHz, so the modeling demonstrably works on hardware.

Thanks,
Enzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
