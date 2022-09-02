Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD14FECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84nAFAZc5BBNyJzTYIZAW1jNj82lzIbgYP34DZrCoJg=; b=yS8kDH33ifouzv
	o6CUeCB4g/vASMF8p/NcSk4WSlHWF2yDhsCSThOfD/PdUd+ezi9Sqqkgd19R63v5cfJLpINNbGFye
	iJTwSSTPf9nKOHmqbvbowHz0CTnUrd3GSuDgZzwiiSlHsSZFxiCqgyf1qdOXj46LK3rItQM5+3JQ4
	jAPyhXUCojPBN4kPmU21zGnciMKUYwMSYDe4kiVTmwg4BfBoN/paIpBkfdAIcJFy5JNgLuSB+hL31
	cnNf/cqtFG2oFEHkO9HS9Gu+E7Hbz4+VDxVZbvuTkAt1+BtD4zeW4OkuJJAU03evL4hEgv+1/1cRf
	V+ug4owmHBGZoUsNHasw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3JJ-002x7p-CL; Fri, 02 Sep 2022 09:50:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU3JG-002x0w-7e
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 09:49:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id ay39-20020a05600c1e2700b003a5503a80cfso1090092wmb.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 02:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=5jgqKei2zXKIzWLNZrfShPq80y4Jd5xdvtwvka6rR5g=;
        b=gT4EYfkdJm6NNpuDd4QvJP+nWZB5+2rUmtLF8NrqqGX362cCUM0dUYepuvZ4IBt1YY
         KLYKIhjg1nlbX/LI2CsJbapnfqaRK+k3Cm4saCElj/cmisJhs6/ahVX6sDWTEDJYideI
         7uuFSY4Z4X+RDwuhkIzZ/t56PKjWrie0B+w13SyjHi57HZcuLSu/YPbQdAuOFtRVZNDt
         pPxdLJ8gQV8S2z2TgSyc2yzzxjvxbmSxuBM43tAW24Q2Wezr9S1FQ6Mt73S/mCQyiHWO
         kCfuydMlfsjg6/pBsiUO7VCszMaSnD2aU+9n1GMK7XcCvpD5B0aQYgk+BaKc/MsA0Wr/
         viFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=5jgqKei2zXKIzWLNZrfShPq80y4Jd5xdvtwvka6rR5g=;
        b=E5MQKbxqV/y+Ixqpdlw5S2cigewZ3HDACogvuPHUe/xX1AZXJrK1s11Ajy7SAindNW
         dcT25Th0iAVZUtgzEx7XGQAlj+TjuSQE/KOxvBLOIb98MGxYwYuNv9BkOE5LHEvMiNui
         O6CL4ylyotPYm+gq55HyuDAlzjpzQZdu1iAm1MN99dF3qijJ+HEESy4xO7Ntoeg7nT9N
         lXXYydrTJ3DiL5Wr/kXs7dtHsaKY9UiGy9SYNSpVFoCPqAcrkzx9nQiF8KnyzRj3LueX
         riviULyjp3HNnQWDjdUluO4lndtbj3zOKW4YOaLqdcRyfINvtfG8wNl0KAiUhLM27qC6
         ygUw==
X-Gm-Message-State: ACgBeo2XcxNSVX3vaMS6Du+v8Ha2YF3xFYeg4f4UQu1mJWKeoU0YzVab
	rIh3w0Hv26PbFFyjIi5TQrWIZg==
X-Google-Smtp-Source: AA6agR43cZGDFm+PQO3dwQr4fi68wE9MYBX9MebvlYdc9RdgxwtO1X/wxn+rVFo3orUQpfZifHJ3FQ==
X-Received: by 2002:a05:600c:4f10:b0:3a5:f8c8:a5b5 with SMTP id l16-20020a05600c4f1000b003a5f8c8a5b5mr2235058wmq.34.1662112195250;
        Fri, 02 Sep 2022 02:49:55 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id e2-20020a056000120200b0022529d3e911sm1066172wrx.109.2022.09.02.02.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:49:55 -0700 (PDT)
Date: Fri, 2 Sep 2022 11:49:54 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	conor.dooley@microchip.com, guoren@kernel.org,
	apatel@ventanamicro.com, atishp@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] riscv: drop some idefs from CMO initialization
Message-ID: <20220902094954.xu4y6kradqrtd2jz@kamzik>
References: <20220901222744.2210215-1-heiko@sntech.de>
 <20220901222744.2210215-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220901222744.2210215-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_024958_299833_4BF4F4A8 
X-CRM114-Status: GOOD (  13.18  )
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

On Fri, Sep 02, 2022 at 12:27:42AM +0200, Heiko Stuebner wrote:
> Wrapping things in #ifdefs makes the code harder to read
> while we also have IS_ENABLED() macros to do this in regular code
> and the extension detection is not _that_ runtime critical.
> 
> So define a stub for riscv_noncoherent_supported() in the
> non-CONFIG_RISCV_DMA_NONCOHERENT case and move the code to
> us IS_ENABLED.
> 
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/errata/thead/errata.c    |  7 +++----
>  arch/riscv/include/asm/cacheflush.h |  2 ++
>  arch/riscv/kernel/cpufeature.c      | 22 +++++++++-------------
>  3 files changed, 14 insertions(+), 17 deletions(-)
>


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
