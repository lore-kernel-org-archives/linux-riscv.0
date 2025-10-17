Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C742CCCD184
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 05:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGXuM1ZFrKLIOQMp++y2xEVcQpmkZqETSgOvux06mMc=; b=Ouytl6+GPHGOsS
	8rd4+eQLgAdrRHbB0YbyfJJG8cKA+bsXPQjSNuAuQtcK5ijnfmcN+YgO3qqVqySuA+wgh9CcJW6C+
	jrdF2IlAhFxpCRSvsQMWV8FyZwGl7DJJSwANbpte4sZSD1brtVBbKCDtmJcThLoAasyoaYxd3y3lE
	GryMFO5360NX2ewDTidYDcIA2PYM+r9psow4BAbwlh4gHUXtOxdRx7skZaKSmDZp91G2QuaDAcDP1
	ej2Aiqan/pyWMkkDYyLQ8NWTveiQyR1BiiRvMUUkmnjIkLJKiCuhoy9waiw11oNBTpqIJxn/8WXl+
	U8ODcUONZWhpw07vbWKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ciD-00000006aF5-0fC1;
	Fri, 17 Oct 2025 05:09:09 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ciA-00000006aEU-38jy
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 05:09:07 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-782bfd0a977so1220079b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 22:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760677745; x=1761282545; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kQ55DkM8tzaRgU5i+eke6Xg0gqLmGe9Gfxt+VQ9ObUk=;
        b=b8pv8AgsGAEBmb5g9jl2SK6+1vinbkWyGC7dYB15v6n8M2jNdjMzRCBjy3JtJdmN4r
         PPgoifvH5Kp3ERmkf4n6/0jDfnWNgHPTWgcWRRyvb9VJtk2uH/odv1Yz660sAd2x9w6P
         L29i5hMcgyyJ3+JPwGz6gR4/NL8SfqzjWRJeNAa6tW7W5lZqtcEMpaqbmDIgWfwttHwn
         RGCvsJ7FG9LM5NIXQQnwcWRlaQQFJTyh62xdSvWJUyFi2amTMBGhEICs4EaxSTcyEUYP
         IXKurz1xFVL9ASzzJ+iCOuhpFgnrw0mgulaEFcdCuLzjDpqwaHktmY3UCLqzTr1vQoTI
         u2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760677745; x=1761282545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQ55DkM8tzaRgU5i+eke6Xg0gqLmGe9Gfxt+VQ9ObUk=;
        b=NnKKhLskWJl7Y3p5GTufVIE+i1PWVfhZ/9ij8GRvuMZ8f5OgPGmES/HUEGSsagQ1CR
         3FW8PX/nyMPhHdlzRe6ml1MqpazwH4v84f9e5ujT1oVj2Gag5pYUSc2gyOChXUB3bQUD
         3M5ilSsOwlPPNkBZBd+afRs0Tta6o7stZOH1HHocryuPKSzojf6gaL6+Zl1WbBkq+LB5
         0YLYMfaNKzleJtVHg9bGDxlkRRbFnZqWN6x8VdfJjcbf+dD3FtTk/mE1rzTwklKOyL5X
         bdH4NQdZ5rZFwQiiEBKhabLNWFqoLBqOqvdoPzh/dU30ybvm+7dAifvVJqTsIMtdZugT
         YIRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHOPYDht2Vj7HXi7SRJUEo3+5wFMV5bBEYCwb6ZV3T8TP4plze/wkzTbuKNmzwmzZQutlwn47jgIKhfg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzMyPUuB75ey8z/oF4Fo0FUjHyoE7hfA4Jb80Jkkov0+TnVmCl
	zdwMYgEvz6C6P3QnkfqRxkmU57A4DpmXnl/W9VXc17vjBkcM6eWNrpIsakJTwuqJJTU=
X-Gm-Gg: ASbGncshq+lHty7gzHbYfBAlfRZvo1EK2dQucBek51T1e/piDqQ+9GCKeqkzpKbITxB
	Hejqgu7OXB8WouulQwRI6bA0FKlRuG41yshkn9s9of6rgKoqL2ujdM5rjuzuIj7qrRxFZXudEEb
	nPYtcJcgbUQ91vptGQxDv9BPBkYuXmeeeI16d+5Ws5n8iyuiI8xnbwxqNDKD9Rmn+DZ3UqX4SGE
	5QKk9RzTjYfeEBq/Wp1arIv8P+BeTOb3mJNplw5HZpHUB7lsQIKw/x9al5KDYenNIZBPcbx4w+g
	K9us9oWl3VbDXysTvwAPhXVyMv+pcrqgF/AA9KWkiUSXqtGeHVtPpB15ELQi9HJw2nV5+w2BzI+
	cqIFEvnp8FJE3cSNCQNvgGbxx23MH880uD+Pe+NvoNqglg0vksDg94jl09JUW5Gi0+QKNJhphT1
	Se4w==
X-Google-Smtp-Source: AGHT+IGVLyzmj++RqMMVihtjmmGd1jHdy2DiGxYxK8sK9GSZnnLKdl9JAGdP0GHlJpy4pu/1751zZA==
X-Received: by 2002:a05:6a21:99a4:b0:334:a784:304a with SMTP id adf61e73a8af0-334a8609160mr3483247637.33.1760677745414;
        Thu, 16 Oct 2025 22:09:05 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e3f89sm23882072b3a.66.2025.10.16.22.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 22:09:04 -0700 (PDT)
Date: Fri, 17 Oct 2025 10:39:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, E Shattow <e@freeshell.de>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/7] cpufreq: dt-platdev: Add JH7110S SOC to the
 allowlist
Message-ID: <jurnfpufll4twv2hfp2dv6qk6d3gr7gfmek5czigb5bcon636q@opb6hrdb424p>
References: <20251016080054.12484-1-hal.feng@starfivetech.com>
 <20251016080054.12484-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016080054.12484-2-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_220906_809229_95AD239D 
X-CRM114-Status: GOOD (  13.08  )
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

On 16-10-25, 16:00, Hal Feng wrote:
> Add the compatible strings for supporting the generic
> cpufreq driver on the StarFive JH7110S SoC.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index cd1816a12bb9..dc11b62399ad 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -87,6 +87,7 @@ static const struct of_device_id allowlist[] __initconst = {
>  	{ .compatible = "st-ericsson,u9540", },
>  
>  	{ .compatible = "starfive,jh7110", },
> +	{ .compatible = "starfive,jh7110s", },
>  
>  	{ .compatible = "ti,omap2", },
>  	{ .compatible = "ti,omap4", },

Applied. Thanks.

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
