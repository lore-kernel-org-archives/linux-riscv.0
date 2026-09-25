Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A317C98321
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 14:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0vHrgxTiuD+zNWzGkB6peL1sikpjVzuavNXFQ1+2bCo=; b=V3OOf0CiKltk68
	LFPFIyyKgILRKuGwkZmReTe5bO2CL4Gxg/BlSfzbTmnKYzMTpW9wQ/J4ADNQe37f7Yckhyapo9v0p
	LTWVJso5YmH7BN4+O9GFqJv5E2Fc8MPYNlx+KLbYBNOHPtn0teisejyENnystH6WzbJ6ncLj/uBLN
	cLDySZbdv86HAxfpcjRtVFADZW3AmTUuwaLUFvA99EK8T3JgSLpBusI5oiMenynTFyLJ9UvtTNCQK
	l3fVoJg2TIBKLgLX2YcNQRxBI45r5zem/7iibRsDVZqMYy1eP4B452hnTp+wC5EQDC/XGd7K5RE8z
	SEhwJQcG04M3X8JV4AAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7Nu-0000000DfbL-2RwX;
	Fri, 25 Sep 2026 14:58:46 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7Nq-0000000Dfa1-3z4T
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 14:58:44 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so6004295e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 07:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790348321; x=1790953121; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3mmzkhyErUd9nhmX6bMHHacdtyTPprVFWqekxL7BwQ=;
        b=J2Zi/dQmtz9+FtsWs0ed62F2o2Jx0/7Dct158GcIthKewdPyXsRTiZtyDGucTwDRRQ
         xOKV3j3f+TFIrOQKtxHCUGbi1ySFuBdKf61oaR1chNmmb9v5wczjnYRQTfcreT8h6DYf
         G/8kes8ms8vIKhno6VIX5lXbE3KdsyZgd1F7CTUuP0yKsIutbkQLk4vyMcNH/W2qc5bo
         FlNEhst+i9Oc+c+zK4dLj+KCZ3FEwz1xYZMgugfnw673RbViFO38QUiyea/XOy8ORN0v
         bpxSAURyVFGnRj/Ro8hzWGLU1xSY5luTWKNXwZ30l47u1rvmocnMnOBcQIEVRSz0wxw1
         usag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348321; x=1790953121;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3mmzkhyErUd9nhmX6bMHHacdtyTPprVFWqekxL7BwQ=;
        b=JP30EGKSu606qisXeTX0tfHtd+K2Vjb4Pcw3/tupiansxVARLsTeTGZYgqLn18Cqy5
         rJIJorww8IXb91Dz2T2B4tXT3QmDMJggQf56s5V8YbGjZ4TOyhPxfLdIjZBL1Cj5ie2V
         I3HTfQWKGmiJLhcGCpBKfzZ9xxueXHy6oEyC/+2wS2o2p8dZOwGmC7v/h0/L/8fzsVg/
         rBV85tprfkc8yyUCIyJSvisE967aB+gBLCXMOeuRtNpOU2nVPAyT6ONveP8Dy3XukW6m
         YkM8IJY6+rJXGT8ebTfugVItytJEdWzUYKFf5XqtwekLCi+KvdlBI3OgBmeGMUfzNiyp
         Nbjw==
X-Forwarded-Encrypted: i=1; AKwUvBxEQTr74yislsB+yRG8o7D+aNnsgraWR6T9quaAbRxpEsK3Wkw8j+FsQ8m5+LAo8ps7+TgPZEt0uye5Kg==@lists.infradead.org
X-Gm-Message-State: AFuF++lCoFjgyXX7+Qw3vTBolHsYBPzvR5r6HDhxbzZ7ETuIJN/cXNix
	vHwuv6zH9oZoUyAExolnEPj1+GVtFKXwoXPcdsX7MboX4fsxPPsgK7GAIeX0cnS0EvPOMd0j3ZN
	Nep/nrxc=
X-Gm-Gg: AYBFou1DkDMzlAg0FWm1v830noVknZ2X8Lr4vrYeje9cn+RzGdDx2IToMKzHE8TQFFZ
	Ra1ySm78TKEA6Vwu2fvhieifYr6lPbcqQ1wfm+ZJJD20ixAvFYjSuIhXTbku2HNR84k1037XcKe
	Q0Ac+l6ew/sI9IZMIxafm96SMmGLEYYb01srmk5+ZQi544EslchyZFx/vm0be3raej1t8EP7+mQ
	g5xKK1Ukn/BXubFYuXOWkazpdW4MG/Wc9MN+2cHB893WB9L827lk4+H88OZ1gQ7mPsDergyd5q2
	264iGcDkWTwgHtw+vnVvURhJaIZrOIvwrPIaUr9zAh7asCIFuGH2SQHJ8QpnsCZkUWwEOnr/78i
	/tUCurnmQAor/gWgHrARF9ny73Un05YX1X5Hu0L6zG0K5qZV6EQGoFqqsFRA0MDf+3nP/kl+BeF
	SjcGLfrTQnoWVbQPJFt1C81STR46sgJA1OY1IKXHAuR6voPsqtGYZ7BqtUl5nr0eJ1SLcoF6Gix
	pV2yvDWgQkivjv7Ew==
X-Received: by 2002:a05:600c:154b:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49fe66c863cmr109626585e9.6.1790348321076;
        Fri, 25 Sep 2026 07:58:41 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff13b3c58sm27350435e9.0.2026.09.25.07.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:58:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Yixun Lan <dlan@kernel.org>, Alex Elder
 <elder@riscstar.com>, Inochi Amaoto <inochiama@outlook.com>, Haylen Chu
 <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 0/5] clk: spacemit: preserve and safely synchronize
 firmware PLLs
In-Reply-To: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
References: <20260909-spacemit-pll-init-v1-0-b3065ad5a4ac@linux.spacemit.com>
Date: Fri, 25 Sep 2026 16:58:38 +0200
Message-ID: <1jtsnd74yp.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_075843_030062_FBB545A7 
X-CRM114-Status: GOOD (  15.14  )
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

On mer. 09 sept. 2026 at 22:07, Troy Mitchell <troy.mitchell@linux.spacemit.com> wrote:

> Firmware may leave PLLs running with valid settings absent from Linux's
> rate tables. Replacing those settings during clock registration can
> stop CPUs that depend on them.

A provider should not act on the clock on its own. 

>
> This series removes the init fallback to the first rate-table entry,
> decodes hardware rates directly and preserves unlisted rates. Opt-in
> synchronization applies only to differing parameters for the same
> decoded rate.

Don't think the provider should be responsible for that

> It temporarily moves mapped CPU consumers to validated
> PLL1 branches and restores their parents after the reprogrammed PLL
> locks.

This is typically a use case or policy choice that belong in whatever
consumes the clock. Your DVFS driver maybe ?

> PLL1 itself is not synchronized, and enabled outputs outside the
> managed CPU paths prevent synchronization.
>
> The series also corrects CPU divider and shared-parent modeling and
> makes MIX rate selection agree with programming. Runtime PLL rate
> changes still require a stopped PLL; automatic DVFS switching and new
> rate-table entries are outside this series.
>
> ---
> Troy Mitchell (5):
>       clk: spacemit: derive PLL rates from hardware
>       clk: spacemit: make MIX rate selection consistent
>       clk: spacemit: describe CPU clock dividers and shared PLL muxes
>       clk: spacemit: reject rate changes to running firmware PLLs
>       clk: spacemit: safely synchronize PLL parameters during init
>
>  drivers/clk/spacemit/ccu-k1.c     |  60 +++--
>  drivers/clk/spacemit/ccu-k3.c     | 137 +++++++---
>  drivers/clk/spacemit/ccu_common.c |  12 +
>  drivers/clk/spacemit/ccu_common.h |   2 +
>  drivers/clk/spacemit/ccu_mix.c    |  35 ++-
>  drivers/clk/spacemit/ccu_mix.h    |  18 ++
>  drivers/clk/spacemit/ccu_pll.c    | 535 +++++++++++++++++++++++++++++++-------
>  drivers/clk/spacemit/ccu_pll.h    |  43 ++-
>  8 files changed, 689 insertions(+), 153 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260907-spacemit-pll-init-c942bb249244
>
> Best regards,
> --  
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
>

-- 
Jerome

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
