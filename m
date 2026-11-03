Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC18606A324
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 01:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zKXz9s91;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wORArVyx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qKCcNvCSx8Oms3zB2KNvUuqrsyoPfp1gXXWkpPftv7Y=; b=zKXz9s916x8rlOpseBfNqB6GyT
	iaE4BxEpwi9jcAe3pDSmAXYLTMwCHMnI7J4r13oKMzIqu6JoGG5oPH6/v+jWCotS9ZvRyRRV5l6gy
	pJK29OQ4HOmi6G5HmLDN3jn7vAAG+FPXxxrjZ8cXpy3iweHFEaHN5UWlqaT+QYDxLTEupwlUv3uRw
	o9V6swv4jZmXxM6khJsOy4xv3zX73pHSW5ZkUzpDnim1i7u5N6TYLNy6pis9zdOkKqzfNkF4R/JnC
	Y8hdz/oEIPUS/cvx/Wqh87wNDUgshNMa/rcWSIMixDKUZ6q6jOhBq3/1SR1+mZBh4vgWIJinpDbYf
	qHVpnseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3Oy-00000000o3q-18uf;
	Tue, 03 Nov 2026 01:33:28 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3Ot-00000000o2r-3HJP
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 01:33:25 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-536c8f958d7so27547021cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Nov 2026 17:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793669602; x=1794274402; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=;
        b=wORArVyxmMLrdXsV62Be/4wIHcVpYkZGPEN5Tba3TxafElw/aRry3/DYys6FtB5+IN
         LUUW3o67qrncBgyhfPQRqIQf3dzaDWkb11omkVVW7/5YSMjDCGGMm20RIlgrqGSY6Yj1
         ZP1TTppJOgvEqAb6OgWYtP19bGYAHOXraCiqSSNHYEb4cTiubfxD2rQEdSBp8LNHgpcj
         IrKb7WduyBOP7D6ob87+7e3K/SkchCn9MxpBGKlGPmpsWpy8tYj0Gp8hTIqlNjMcOrSz
         aH8W0SWEU6NwkBcthVhx5yXLKSRVQu37pr4EugFwpENgvcAbTgkf0P3v2gFLqv5qEiEU
         4tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793669602; x=1794274402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tRIaiK1TzgUV/taZKqe0e877QKWP8p0z+ea1Mbb1W0=;
        b=0xoLC1+CGckFyblhrDzUK38Kc7ZMyQLzKoQXzYpjjYJnVAYzPCxbHMb+S8NaNWA636
         szvHx6g6Xc7bY5YAR0+pQyQX1g4MYfjejHqdFwQkvXdh3KqD9XekiZSUTTLr3DCMUFXs
         emqj/9VqLcq0UUbw2LABf4A5hbW2+fXiAfngYatvNAnMmYGN3rzwoYIZfewjpvE/0ozY
         ErIYl+SqiE8xDID9mwSsmKhtHIdYoao18CSlzp2bO/hHoptAbOoBvBANhtJl5/jY5JV6
         0JZJ7VUBXDMyxMYJTMMDtznb3kzC3vZGSDCpKXMeeXaN3a1wNh838IkMx3vE3RKR4NvZ
         u9ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSw6wlt+azX/6HyHSwjZyBfteJ2Sz9APEJonBIoCzmux6JSV27Eqo+iYjiFwqZ/GnAZA8bK+ThGNezOg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKlR8mwAkQJos9NpsuZpwT5NzAjdjP0sRd1fwtFpoFYFRJ+GpI6
	+xn+I9QGNaf4CjXq0aLjgloc4RbUE1QJp9kNLeIhVM+TLTdFuCFo/ayu6sqJShXd
X-Gm-Gg: AYBFou0kzBlxdaFmEjrNaR+rLnQRM2QMp3dCtz1zDESQ8jJPgk/+66AHNsjvBWUc3te
	9Wg8+gWyfJMCdq9VSGU9cOgl2btTuuLD6zOEXm0uoSyB9CqhLS+eap7tFy9maQwJo5CzqX9QDNi
	PNsHfXSzS0I0YanqFT11jXb+ya/8JElvGKdSS5A1nPt8hdfJgq+vhlhRtfssW+h956g7rQRMKzR
	14iUr2uw2FEJ8QfrBovB0Ha/IW/kgfA/mJXwZPwddJuG6CTxLQ8BM+xB42XrZcDKhP2n7FRA3+Q
	tlkQQFFU8DIgLWhqWQbMsC4LBKixzsdcTMhvl3KqBGjqHZQVCAln2lkIHcb51l8YjhKr6hMjj1d
	bMbhRg+OQQVbtkQzI1ZEjqCItFi0szbFQKgeaozIUP6vU3TEHFGrj8qAkbNxerJ4QPPQykIibFh
	kSOks7yjR+7+uWF7CoEQW73dwA052hKSPSSkFtVuv6WFfryl1TczmvcRD9QBJK3b7OnmVvPXJzk
	bQl0bKbdqS8ZPMz2DfVjlurZk3uGTsR+qjmjKAfeTITDsWbJyWeCRNUuR35wiTmnyh7IaGjH8AG
	qCr8RcND6kmWQvRp2iF1ieuq+wmXyQMPqy9U3MegUzp18ehEfAc+R591O/HmVfYStlYOsI00WkL
	d1IB2uEw1TWBwOpXVOzT4hLlGkQ==
X-Received: by 2002:a05:622a:3c7:b0:535:5fa:ca6e with SMTP id d75a77b69052e-542b75236b4mr201626151cf.51.1793669602205;
        Mon, 02 Nov 2026 17:33:22 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498cb5b520sm12746021cf.26.2026.11.02.17.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:33:21 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
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
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Norman Herms <dockseed@proton.me>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH v6 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Mon,  2 Nov 2026 20:33:19 -0500
Message-ID: <20261103-a733-ccu-v6-fw-clocks@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261009-a733-clk-v6-3-ae8178fce7e8@pigmoral.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_173323_839352_1A7DE3E0 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Junhui,

On Fri, Oct 09, 2026 at 11:52:08PM +0800, Junhui Liu wrote:
> +static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0", r_apb_parents, 0x100,
> +				      1, 3,	/* P */
> +				      4, 3,	/* mux */
> +				      BIT(0),	/* gate */
> +				      0);

On a Cubie A7S with vendor boot firmware, v6 reaches a Linux shell but
stalls at warm reboot. The system-controller firmware uses the R-domain
timer and mailboxes without Linux clock consumers, so disabling these
clocks as unused can leave its services unavailable.

Could you consider marking r-timer0, bus-r-timer, bus-r-riscv and
bus-r-msgbox here, and bus-msgbox0 in 7/8, CLK_IS_CRITICAL in the next
revision? My standalone patch has the diff, firmware references and
board results:
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com

With those five flags, two RAM boots of my A7S integration completed
warm reboots without clk_ignore_unused, and all five clocks reported
enabled. That is one board on vendor firmware. Vinicius reported native
PSCI reboot working on an A7Z without local critical flags on
bus-r-riscv and bus-r-msgbox, with TF-A and U-Boot built from source, so
the boot chain may matter. I haven't tested suspend, or shown that each
of the five flags is needed on its own.

Thanks,
Enzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
