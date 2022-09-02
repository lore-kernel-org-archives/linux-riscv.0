Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2044FC38145
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 09:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMCIYIf253o9cqPh01nTQAtZ/9OBQEq7zhY1Xb1s/ZA=; b=Vu/Utrj5bnNpiV
	8EOoMtWq1YSrkDF928r9pM+pAK7WTAWGkrnW1n3A9W+vPliN00NaNwzL7ww5wkdtrPVn2zAEjul1U
	O0RQ8BZ79pXjBFt15wmLS24I1m/YhAVmgkO80OzUlW9xewklWEiSvbRa1QvatyVwlkreuni83chch
	KygyTqRx9USTTSTOXPr4XsChChg+lwtoNe1pcVQXiIrVV8DbloZ8NRi/MTG4hkOngIvkk43ZNkZim
	E4MAkKMoMG80Aq6B6YxJ8889FjTRh93Pl0kM9spIbrTCJmIZn8Wx0fKfM3b6/yIgOC6teeLA36VjU
	6nM2KZBaWMhWy7uLUeeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3Jc-002xZD-OK; Fri, 02 Sep 2022 09:50:20 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3Ja-002x0w-61
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 09:50:19 +0000
Received: by mail-wm1-x32a.google.com with SMTP id ay39-20020a05600c1e2700b003a5503a80cfso1090681wmb.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 02:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=p4BB5HEEv1U/G1XcV5dDRUGXUnKJI96ERgbfE9BkLC4=;
        b=CId7laYpem0t29xNQrxbDN5uajUvv7J674hYRhjHIwRot2NzlduoZrqIn4bGMjRLt4
         NCaB736C61TkkRqP9Z7EaqQiLBmIoyLxqTsJUyMlYzwGuqhg1ePaFAf9vG4IZTKLaoX2
         IjlalDqUjpjXElJ3dgiyMyHuPGC2VvtEcIBzy658aV0fSXbiImi45F+dQdNc7KOhJfgf
         89dvPtQOnTE96qMrm6wM9AtcrqGhEAyb1T93vGuSf1YbSkoNkhN1weAEHK00sSU77IZr
         77GT7gDAe3lkkrEm7xxsHZBdsIjoNJyhM6Jetufw0NuXWgwx0L4jWpukn9wQ8d4DcObc
         wl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=p4BB5HEEv1U/G1XcV5dDRUGXUnKJI96ERgbfE9BkLC4=;
        b=kdwzYMwWOv3QV7VcQPZoaauteljhc/69/K1TwcxG9Y39qWe/pGOhh/oGkazwvHjFId
         2WfsaWrzxgjfgt7Cw4AfchIlQtYDyhSnoOrbO+VioaaxGsr63k3hW25GeXKXW9IX2Vm3
         VYlI8GOf8DdNFxb4gfexDAiDtEqQhbsbV/wg/MAA6piSK64dl4EwoZSKoZTrgekrUyrH
         MHv+m+sD+TvFDFZxk3dWDQntXz1nHXqCvQBUyEa+yaKL+JV2wJ+o77aCwQRUjC2Twm+o
         dfvXTSRS7NtMU2fwSUFEcG4t0KISq+skXwBmkm9uV2Ov0q8l7Ij4vkukIdLhoReeD9qi
         KMbg==
X-Gm-Message-State: ACgBeo1CxYLUXltilux9Rs01UTgLk70rUBwGEUPxy9x6w3btOMIMUBBj
	OXcHpFdu8awlVXoewnSP5NME7w==
X-Google-Smtp-Source: AA6agR79dK0AEa2dNrnkz8lWXzy9RsmAgPjIkQXqiyvCeJhhfv9nSqdpJe62GAkWG+pv2SwTvVQSgg==
X-Received: by 2002:a05:600c:4f89:b0:3a6:243d:3bbe with SMTP id n9-20020a05600c4f8900b003a6243d3bbemr2231447wmq.16.1662112217766;
        Fri, 02 Sep 2022 02:50:17 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id d6-20020a5d6446000000b00224f5bfa890sm1067036wrw.97.2022.09.02.02.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:50:17 -0700 (PDT)
Date: Fri, 2 Sep 2022 11:50:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, guoren@kernel.org,
	apatel@ventanamicro.com, atishp@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] riscv: check for kernel config option in t-head
 memory types errata
Message-ID: <20220902095016.bc3bttpdnla6swsk@kamzik>
References: <20220901222744.2210215-1-heiko@sntech.de>
 <20220901222744.2210215-4-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901222744.2210215-4-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_025018_243234_94C0B717 
X-CRM114-Status: GOOD (  16.78  )
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

On Fri, Sep 02, 2022 at 12:27:44AM +0200, Heiko Stuebner wrote:
> The t-head variant of page-based memory types should also check first
> for the enabled kernel config option.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/errata/thead/errata.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
> index a6f4bd8ccf3f..902e12452821 100644
> --- a/arch/riscv/errata/thead/errata.c
> +++ b/arch/riscv/errata/thead/errata.c
> @@ -17,6 +17,9 @@
>  static bool errata_probe_pbmt(unsigned int stage,
>  			      unsigned long arch_id, unsigned long impid)
>  {
> +	if (!IS_ENABLED(CONFIG_ERRATA_THEAD_PBMT))
> +		return false;
> +
>  	if (arch_id != 0 || impid != 0)
>  		return false;
>  
> -- 
> 2.35.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
