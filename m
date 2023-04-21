Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2102C7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 07:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LJvnzI6WY3CEDIV1AWMkCMKu6qHghNc35ze18lOFss=; b=Qy06Iep6tB5SLr
	SKudtZGDMieAXF9o+8Ho4PPE989+raeSa3gms+Xj2d+PTVmu4QkimuFlk7SV3I1Jo2l471AlqqJAL
	Sh9tedd0/A7kxW9Bn77+2VNo3Tm2ZWHxTXXxpkToeAO1jYk1262Rs1ayqYzpWs2aVdCEp2fWk3iUL
	YDKXYEfOjB8HbgYQ303A0Xy+0GjByl+yYkkFJ818RJk2jLgGaTcXI1cg91/mKrT3ba9sebXQJ9ax8
	hMMnxxDJMLdONhhmnfOVayAuQpY+CbG7URMe6uIGmO7DHZBEM+Tyu/2mZIOdqCqr8I8ks082TUSOO
	CQUb6QQny/s4OOPOpTsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pplKU-009zDG-2B;
	Fri, 21 Apr 2023 07:37:14 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pplKR-009zBH-2F
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 07:37:12 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-247399d518dso1208826a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 00:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682062629; x=1684654629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ws1r1MXeCEvX69yEkTPurpwAbmpa457Fai+VNzf4DEY=;
        b=ZQI2rEXhdANrf45MNGJf9HILUhJ4Bw6VisyeMQEy8EQAbpmBylMsOd6Cq20ZKh5/LX
         AY134L7OpDWpunRaNAWDWg95F+DV7LAYpzTQz8ELy8TTCeLGqGNK+PhP25hmbTgb0nb0
         jY9hez/PA31l7xfEFsSuLEyYQthFkKph53ing2++kv/VNi+D+ljKu800/rTZXgUEBh+1
         oR729FDKLksqtHXQlpzRn6fHM5atkCIh9xVISU8aopS9HUr4aO/+VHNC6/HRhp34BIbO
         chH3mUJfv8/RMtoDdht5rmhRJXgLWFHqoFzdY4ZUYbWN48ktBXdhz4fO5Ea8FmGx1E/A
         Og5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682062629; x=1684654629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ws1r1MXeCEvX69yEkTPurpwAbmpa457Fai+VNzf4DEY=;
        b=EHMPSzIRPABWaVaoyDQ42gEa9Y/fwK7Bd5TN4lpGkQCSGjerkeHHv6FEuhu7adye85
         d0oiW8kHl7VffPghd4i0aBfJY4F+bcvVUcWGD7lawwTzw0VWia9+qbv4ILJYys2Mde9w
         DmFJ/OcNrUKjX84BZug8Log0opAQU8qlU6NMwjG5Dor1T3bTvWCDfptz03OFaB3qdOhK
         ZXLylxiuiFc/7ScSqB2djwmK025JYiFF9XmsaQDb+haxqgpKr/60sP/LiHFmg55fgdju
         SnM/l5HViwP81iJ2PkD3A2acm6DCqTHtTLZt5Q0sQ6DiU6RbKh0R8hdLsC0YVuz7CbFF
         rS0Q==
X-Gm-Message-State: AAQBX9frxo/2odYG6lKT7eTW1KDjxl4rpvu1+xiLSmwztmGTTNz9AcK/
	65TehDqnXhqWxjz3rXF534ozBw==
X-Google-Smtp-Source: AKy350Y3tjzqUpc2PpA1KHTguoo9hq4vYUDrqdHuUj/CrJexpNdOvtSR6Ua8+SfReOPpPBSjBZl3tg==
X-Received: by 2002:a17:90a:b38c:b0:247:af63:483 with SMTP id e12-20020a17090ab38c00b00247af630483mr4017603pjr.46.1682062629025;
        Fri, 21 Apr 2023 00:37:09 -0700 (PDT)
Received: from localhost ([122.172.85.8])
        by smtp.gmail.com with ESMTPSA id c19-20020a170902c1d300b001a50ede5086sm2200481plc.51.2023.04.21.00.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 00:37:08 -0700 (PDT)
Date: Fri, 21 Apr 2023 13:07:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mason Huo <mason.huo@starfivetech.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shengyu Qu <wiagn233@outlook.com>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] cpufreq: dt-platdev: Add JH7110 SOC to the
 allowlist
Message-ID: <20230421073706.oi65cbuhljcu4upi@vireshk-i7>
References: <20230421031431.23010-1-mason.huo@starfivetech.com>
 <20230421031431.23010-3-mason.huo@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230421031431.23010-3-mason.huo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_003711_741362_8333C8BB 
X-CRM114-Status: GOOD (  14.08  )
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

On 21-04-23, 11:14, Mason Huo wrote:
> Add the compatible strings for supporting the generic
> cpufreq driver on the StarFive JH7110 SoC.
> 
> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index e85703651098..79537d0ed7cf 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -86,6 +86,8 @@ static const struct of_device_id allowlist[] __initconst = {
>  	{ .compatible = "st-ericsson,u9500", },
>  	{ .compatible = "st-ericsson,u9540", },
>  
> +	{ .compatible = "starfive,jh7110", },
> +
>  	{ .compatible = "ti,omap2", },
>  	{ .compatible = "ti,omap4", },
>  	{ .compatible = "ti,omap5", },

Applied. Thanks.

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
