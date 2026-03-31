Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC9C109B471
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 14:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAYeU6DlDWJ8Dj/tpvKLbPX3oz/mXKSgkXk+uO90Apc=; b=tMmwb++hEJoUlH
	cZfwNC2mhgsuuaZyVXDpakmrElVVk6eWkqKUOcTFY237Xe/fxfOLMghVT54QZTHwh6dcVyHdTrry0
	O8F2IHzM32ZRb1cqM3vqZA6jdw2kQ3nrlroZu0yOX1KwH2lhmliKkqmvalA4SubWBgrOV8GFqnBgm
	4n6t0DGuTI+BQ9TWfvIX5xHea//Faljl9bLeoO3O4dIJBgpJX3cKFXcA9bKPTeRNmk2+jg3DrSjlL
	y/rvb0Hn+wQmJHtne5wmkpPxft268u1wU3GZk3zFEyEsY58mvLk9YnAIbKOJT5NQKBNMvK/QtBpdm
	z3qAd0I5dYiKq4SSGjdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ztl-0000000D45y-2XPD;
	Tue, 31 Mar 2026 14:16:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ztj-0000000D45d-2853
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 14:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774966610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+cvItjsGlgO+YKuRpumctJ3y5xeOoIq89E46KdlSIjg=;
	b=FTceALrHvIEof/lTSWWQX8R8F7vQaRsGho8BggIXYPMSZCDRCjoJBtZPgzgJsSeEyT2/wk
	PNdhwu1VGYPS6BneC6jL1JJTd0DgTyOdUFP0nslqj3OVbyUnUlBLTvovmvJ0jdHiOQ91rG
	IUiRE9+rXJf7VxvM3utCEm7Zg68yqas=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-fUZDGmrLO7WCZalvK7zTdg-1; Tue, 31 Mar 2026 10:16:45 -0400
X-MC-Unique: fUZDGmrLO7WCZalvK7zTdg-1
X-Mimecast-MFC-AGG-ID: fUZDGmrLO7WCZalvK7zTdg_1774966604
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50911c94db1so140273151cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 07:16:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774966604; x=1775571404;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+cvItjsGlgO+YKuRpumctJ3y5xeOoIq89E46KdlSIjg=;
        b=VeAdatLpcqfdHDlEEHu78s94Dd8qRolHRJlf+ksQ0JHMPlNT4JBItN6ipB/o0KEbbC
         tKYN027/k2wbbKqQm6I15v6tAYQMzUj5uGTeYaQHRB24O0T6LW5DVJf2V9TiAgz22v0u
         ltN1z0Kd9Gw3a4DGMIV4g63C+KzXz2MMXoibHryKCE2jNEneqeMaVIalYxTIg8c+aFjO
         dfG9jFpsP0XPsTuASqjodpdBXmedugGHW2YwCM44vzkDjA4FxtVKL5nN5GMxP8IaxHf9
         gSib2CLc5MimX3fUH6PyoQO/ep0cvqwKEZaBJtdTS9WFXewyBnJq08XeVkKXRToTwqzc
         ylRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSTAFER15elJ6jo7A/qJ7Tu689Jkc724fTRoNZ64cGLuz6YYbI3lzHY8N9I9grsmbcKm7PEoDJKGHH5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmaKrS9hAo8nBS66PAJrGTTAtrMBYR1GR0umKhThGJNytgzw3M
	sMvSCXA8+bc4FipzSUaehpH5bYiGlpeNj9THrR2fldxuqYq4L8+FpckEXUtBYPhYEEXcW+JGyTn
	+vd8CuJ4F75SvwYSZUWar7lrGVjD7Zl8YhlpuBrwE2MAXqOWSTcQYZhXeDOfzsG+LEqGrTA==
X-Gm-Gg: ATEYQzyKSgtWdYdlY38mPo3xvFFuN+719Ry2DPse2nH/hInHrmETjv7dBlf6c0mkNfX
	+JryOUe31SwEUD9CVF795pemgF8Zq80L8U/oFnZPjXFO/HbykNhKs7HljD2KNpicGFgOc05+PeX
	k/htrsNySZTY4SsFG4XRH3sRuEv9hsQoCew5FP/dU5BjNPt8/707p5LVHMyigNdX7m41KYrhwUx
	HKnVAqryeT2vqDLdejV2H/F22InJ+3VG/MSUO88ygYO1S3StbHk65OIOhqUTA1dP16sqarYwY2Z
	bIdSlDBpRWdV0r2+21HFKjR4rHkZfgEp5+6plHUUNTWQwseF4xb6ZidqKiH8eD/Y18RNW94dgsl
	NDLudn39JjwQJ51Km
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr227957611cf.17.1774966604498;
        Tue, 31 Mar 2026 07:16:44 -0700 (PDT)
X-Received: by 2002:a05:622a:5e16:b0:50b:51a0:f744 with SMTP id d75a77b69052e-50ba3816a05mr227957191cf.17.1774966603971;
        Tue, 31 Mar 2026 07:16:43 -0700 (PDT)
Received: from redhat.com ([96.66.166.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c67fefsm86643111cf.4.2026.03.31.07.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:16:43 -0700 (PDT)
Date: Tue, 31 Mar 2026 10:16:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Guodong Xu <guodong@riscstar.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 4/5] clk: spacemit: k3: mark top_dclk as
 CLK_IS_CRITICAL
Message-ID: <acvXSXNWIEcDUpQ3@redhat.com>
References: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
 <20260331-k3-pdma-v3-4-a4e60dd8b4b3@linux.spacemit.com>
MIME-Version: 1.0
In-Reply-To: <20260331-k3-pdma-v3-4-a4e60dd8b4b3@linux.spacemit.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0m8NnaFruevur5XsJ8UaLjpQ1YSigYMhN7YjuPaEcQQ_1774966604
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_071651_620473_FE61BA21 
X-CRM114-Status: UNSURE (   9.17  )
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

On Tue, Mar 31, 2026 at 04:27:07PM +0800, Troy Mitchell wrote:
> top_dclk is the DDR bus clock. If it is gated by clk_disable_unused,
> all memory-mapped bus transactions cease to function, causing DMA
> engines to hang and general system instability.
> 
> Mark it CLK_IS_CRITICAL so the CCF never gates it during the
> unused clock sweep.
> 
> Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
