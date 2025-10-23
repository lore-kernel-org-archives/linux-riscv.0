Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29870CCF9E2
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 14:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2XYB87F7T9ILYbAUPtjITQ5xn7UZIyu12PWMcoDdnQc=; b=a/4RTqZpCGjaVZ
	15bgR1fY3xOLO3r1cMMA8WsKppZtF63AfFeIVeau0Xx92XbZ7TlQl5ksWdF8KBLu9LVl1apE3jIQ6
	WqohRCWGYU8S89t/9Cj7TpYKoxbBtz6BIFwcKp6nDVQyzSJxQCneEBvJi6wlp+RDtX+XopiqLxgzH
	Mp1YwMS+H12WZmrjlcoFENVC7vNoO8M4RkVXM3l9Y9jyw2C4yLS5tFV6dFLYaZ1l2hqcTLDYyXeYe
	vRvlr1/nBtJenPPrcoVzGtRLNJskgbtD9jr8ZLCfZU3Qb7kXjzYH5XbAqyhRKT58X/h3IaXV5bZSv
	7JNYoYjwi9/KMjLyvxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwWQ-00000006d8Y-2grQ;
	Thu, 23 Oct 2025 14:42:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwWN-00000006d6z-3g7h
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 14:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761230549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IFicMu98gfAcT9m3j73eRKJRP9V5+Hez4KBiO4yt0/Q=;
	b=S5PXgpVwbNZoqR+HzzsVzaj4dcI1OoOof+wBM9vz7quhJrYtYBeD19JTZ8jdjJ79XnK78z
	y3tcYJtMRljtpPyj8C4zJ8ClEQUM2BgvBi9kCOfLOTSh28qvwzqbdi5K8OisCN4T0vjXpz
	+l4cXC3yxBYEXexgzpCuATbqCigrUs4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-5bbT2wYZMlizb6aC0XXIaQ-1; Thu, 23 Oct 2025 10:42:28 -0400
X-MC-Unique: 5bbT2wYZMlizb6aC0XXIaQ-1
X-Mimecast-MFC-AGG-ID: 5bbT2wYZMlizb6aC0XXIaQ_1761230547
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78f28554393so19961316d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 07:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761230547; x=1761835347;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFicMu98gfAcT9m3j73eRKJRP9V5+Hez4KBiO4yt0/Q=;
        b=mN+MrgcfD4JSKKz9IY3f6Xprn/fZOxR/I6ytdL8dGZNX+sC2kofyCnvj5t6SmOlEa1
         zS8XQfRSksIgqs43fcT5ec4vTNbZDEMt6MQfXIQx7KurlbSUkr/U9lDSm6oPwA3dbES6
         N3SKbZv4c16tPcDeR+FbuOYMqlzGdFeqHb7ojMnnHXiWA5hul+/AecPaM/bFIOA9Repi
         eEfzPNIfKrBlQTCmWz1OvWFPOHlr/680yE8PUdOkpaoWIenwwVdnsBcjaslziVObrMhk
         m782OD6/P5Mgpkv0+eIMGDjVRlncPfIbXQkqzeGPGETTrTOy8pt3xADRLsuYmq2W0Tgd
         uPwA==
X-Forwarded-Encrypted: i=1; AJvYcCWY2S6rDfOw3GmKUETLYVSWte4HtqHFXmgECk/sHA3ZG4YDOQFV25oXf5wW5GGNOzZrbwZJJ7Y6Izxmkw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9eBiPRM2nY4h4APTE3EMMCDU8kq/Atez5dXExjO2A+awIJLz6
	UiA7L6s4DSBLFfqT08KZP3eWyRefPir4igK+BohFvp7Om4+CCejtE0dABcgjCfEFqqOSR2Jmdx9
	SOrmW+eMoVkL1aeO73BK9Gk8Sq+5XMxiZgKIdHiYvvy7rdGog7jAwiHNjzBu8y4+YWHsEfg==
X-Gm-Gg: ASbGncs0pPM7Px2lvejdPbMEBxMiBsG68vflrppNLNCmfTKnxzn6bMJb65mFQntHnsk
	Zmk3HRADUiuY7F3P8ap6RK5dgA273WFwxI4X17FRXhTuLc48JWrxXzWb8hZof/YxJaSvSMAQnG5
	F/FNoGzobNsPbFqObcJpHzlAXg72naEP9YIIABe1+s4jvcGwpLp5oDGiZWCBQEvfJunP1Z1labu
	ucjhr/cSlOYMK/tckhakMti0MSj9DoI+SR6X8PBRpJ0rXVb9gVQqtKtzYbi5K/8rC+oTkoPu8ai
	3sWK0KW38FEEKkijFZvkiS3VEDNeFvlY6ER8YEN46EDoS+7zyBvM0sdJR4S5B6gaHjw7dTH53md
	EyWGkFVde+0lqVmZWFLbyLau5wSveDjxd9Bg9AkbvfKG4SYDPX3zTy7Bld0yqhcTIFA==
X-Received: by 2002:a05:6214:5289:b0:797:1a0d:cdd3 with SMTP id 6a1803df08f44-87c2057312dmr353179216d6.19.1761230547690;
        Thu, 23 Oct 2025 07:42:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHoA7a6YUkbzjRlWZlCvM1CpjEdcBUEk6K50Ddg8gNV5roej8uXfTpBfwhxN8OmaIZYnha0A==
X-Received: by 2002:a05:6214:5289:b0:797:1a0d:cdd3 with SMTP id 6a1803df08f44-87c2057312dmr353178766d6.19.1761230547171;
        Thu, 23 Oct 2025 07:42:27 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87f9e824cc2sm16169526d6.61.2025.10.23.07.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:42:25 -0700 (PDT)
Date: Thu, 23 Oct 2025 10:42:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/9] clk: microchip: mpfs: use regmap for clocks
Message-ID: <aPo-z9QOIqd9kxS7@redhat.com>
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
 <20251013-undercook-flatfoot-70dca974cd19@spud>
 <ab443375-524d-4e6c-a640-7e580c2d0c64@tuxon.dev>
MIME-Version: 1.0
In-Reply-To: <ab443375-524d-4e6c-a640-7e580c2d0c64@tuxon.dev>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EuhRnCo-5TUhNAbAiGCkeTCEmaLYOoGWdvdHh85M0wA_1761230547
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_074231_980556_71CEFCAD 
X-CRM114-Status: GOOD (  12.18  )
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

On Thu, Oct 23, 2025 at 07:06:01AM +0300, Claudiu Beznea wrote:
> On 10/13/25 20:45, Conor Dooley wrote:
> > +static const struct clk_ops mpfs_clk_cfg_ops = {
> > +	.recalc_rate = mpfs_cfg_clk_recalc_rate,
> > +	.round_rate = mpfs_cfg_clk_round_rate,
> .round_rate is now considered deprecated. Brian (added to cc) tried to
> remove all its users.
> 
> .determine_rate() should be used now.

Thanks for referencing that. I'm still waiting for a few remaining
patches outside of drivers/clk to be merged. Hopefully I'm able to get
these merged for v6.19. Then I'll be able to post the patches to
actually remove round_rate from the clk core for v6.20.

Brian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
