Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5167A606A326
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 08:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RoUoJ/zP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b20YlFjUEPTSN/6tzVYZ9wrFme8pGPSbDQOR9nmlXkA=; b=RoUoJ/zPzFP3FZRfxSsDJJpGO5
	ExH/2q+hKulI3rwrEKBePrUgo64TvGGw5EWM5+byZas5N6YWFkkEabxbRCHxzDstd8XEhhy8smW1w
	P6hyf4QjpgDW5NiWchVxlYyk9V6M4c7wDeYZqr4PNfnqjb4SPTfi1PXLcjXTDMizUyE4xnbd+NRHg
	NscOgN9zYmrF9rv1kOzWNUuLFe7HHTpsFOinCWRt6U7DE4bx9lyj+a9G8RV+QvxeEepJ/TjPpsnhH
	sQ7ZGFl8z+fFiWbR2+1hq5HLEQ+mQ7HExVfwpvyCNceucBmI+t5URanocKncItQjN1pqMO2bWsc0f
	19J0VpjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWOM-00000004i2F-2gnf;
	Wed, 04 Nov 2026 08:30:46 +0000
Received: from mail-vs1-f42.google.com ([209.85.217.42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOWOG-00000004i1C-3s38
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 08:30:42 +0000
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7cc53938a8fso215608137.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 00:30:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781039; x=1794385839;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VTnZ9KxipM57oeI6XdWPJAXVctjy3UG+Ti/EianJRiM=;
        b=sPuQqV9D3KPp2jW+/tHg4X3RQuSv7lJ0F0MVm8XQv3QM8YK98sF79FDaNk7I/ShQBY
         NSA0et5bppucJ1RqKrTKo+Kpfys1cssho4xxEf2vv3kG6dcNzZ/q1cyLotr7hw7jHyR0
         ISeO+TeBPdwRVu4Fhzk4xq4xZxgCSfPdMEeNc0AwXBLN7U/6aNBA2zy3P/d7Tbq2lCG8
         /UCt2BQcYU3sV4Zd9ABw8NUItBrUABAajxVFdzgUyceV3ZdyzJ0aBXiKC5nFg6sYqQwp
         Rx9cr4K7DMjECysmZb+TSQCEuX982mcsJRH9fx6ZOs+KnC0FDkU/ZNhv7pu++neoKtEH
         Kfdw==
X-Forwarded-Encrypted: i=1; AKwUvBzKBLrtC8D1QNkuWExYO1X3Xvhtq1vLTg2yB5VousTRxbYi+xxwCjPRkY8d0i+dX+qlqWHBsE2s7OFSFw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8p553rNZljsX/6shTvbVoY5OdultxUOoEY8ME3tQ3ymPKo+8+r
	cSAvM/6xcf2zOUvlJHDExwOMUoaSDdHGhtuK7Jt2A4/kUgu6824Ip2LY0Mepb7pX
X-Gm-Gg: AYBFou01/OGUh8yz4S1PZVlR/RNhVKA+y9BsIyIkXylpybDbaOAcranr5eU2KmMd8t/
	diTiOR2v1mGnrTLrqtPpLPmyR6GOrUo8Mc50Acd/q+8qnsfV9Ps7sSJGsGhD1qfsS9gLwv3aNff
	I6Z1DO5WBBXUSq27uxVwntYwNOg/1IBgupAs41x5rnDcWfCxOcDTFVhmiTdFSacGZ/Q6xUZ33k2
	xK7WeZBs33AQJkPgFn5nHzCbCtmNvKJ86qhZjNjVP2651YFteof3iOjkFbtUzVNzOv3OPx+sVGZ
	iIcYkWFSxKCoHWC5r2fwG7rYswzeF7j8LAPBze2LYO9b1vrmCoemCQjL4uiIW0wAeFPLiXEtNxa
	5DXsomrgeGhSK6NHyjPIJbdXOMOXf3OXS7dCSxsYgYv3olyXQKBCS5Qg49FZdT28YfKhJuG1XF+
	zNuJ2sUWOWKE0ZZh8q7a7g7Z+D7xCRI2l9TrcjgHeVZzRM6CuFZ8PynC823lCTLNUTl2GnsnGCq
	u4uEC+V4yCrTDdkVX31t+7qhdaMNqGaoYTWZQkF/0zXIZGfaFUQJQq6B8r+NeeHeX78d7y+3oUp
	2F3shIpIY97Cu/g1l/OI/OWeQldLP/3uDkJtCRnzIHb5Os8odkXpX1HBwHGVmAV8+Q==
X-Received: by 2002:a05:6102:5243:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d072cafbdamr6022607137.25.1793781039555;
        Wed, 04 Nov 2026 00:30:39 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d7780fsm1126660e0c.3.2026.11.04.00.30.39
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:30:39 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-998569550adso278526241.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2026 00:30:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzUezsZ4a4QKHp3w2ME3KvnzbpGyspZx2a/JiEQSiLseRlRPKZoH2ApvCETJtS9++hqoHA7zv4K24FI9Q==@lists.infradead.org
X-Received: by 2002:a05:6102:8099:b0:7cc:bc0:b2d0 with SMTP id
 ada2fe7eead31-7d072d59168mr6120354137.33.1793781034293; Wed, 04 Nov 2026
 00:30:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de> <20261103-reset-regmap-test-bits-v1-5-1b33607a76b0@pengutronix.de>
In-Reply-To: <20261103-reset-regmap-test-bits-v1-5-1b33607a76b0@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 09:30:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8-8nEYKOB3Hhbb5DiXHcOgYaMCtJ0do=evQDbYNEMLw@mail.gmail.com>
X-Gm-Features: AclHuK8USmfzs7i7XtJ90bDmKjuz-weCg5Jo9uiJtfA3Xj-kpN0lb8TQTdngXvE
Message-ID: <CAMuHMdX8-8nEYKOB3Hhbb5DiXHcOgYaMCtJ0do=evQDbYNEMLw@mail.gmail.com>
Subject: Re: [PATCH 5/8] reset: mpfs: Use regmap_test_bits in mpfs_status
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_003040_964839_A8035B22 
X-CRM114-Status: GOOD (  14.53  )
X-Spam-Score: -1.6 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 3 Nov 2026 at 15:53, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Simplify mpfs_status() by using regmap_test_bits().
> Now returns 1 if asserted for all bits.

and propagates errors.

>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
