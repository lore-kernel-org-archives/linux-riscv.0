Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABC1C636D4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 08:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRljUKz0PfkUNvJ20nOC+nMdPVxw+zwXZ1Iyzj/UmIk=; b=WUxujgpGsIswm0
	EwPzQD+4u2uCzTd4kJ40COlaVKhSmPRxlBfhmei2vr+XdCd/VHTN9UHirWQBgL3iSforKpt8U2wRZ
	dd3aaF1VcnX1gzBKc3sLNxFF5u/ifJyIQmyFb3UijutzmQZ3WxLV5yNqrUq9QqC8cj3G/S2dU51NN
	yUYmiIRimjW2K7qBgPEDxkRHCw5OiGkYwonHBheEc+PABzA4AGp27BNrb/fwaIYfZTNM5J7HfxcwJ
	jkcGP6Ib7y/IuZ9J1LLbNkymBqDvWR1g/9+QNuoXxHTzzxvvTvIP8zxX3ifd9Lr9EnPWjF36FnuQo
	GPhDCO10v5br4BKFXqhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2Fk-000YDH-4B; Thu, 09 Feb 2023 08:26:00 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2Fa-000Y8Z-Ro
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 08:25:52 +0000
Received: by mail-ej1-x62a.google.com with SMTP id lu11so4070676ejb.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 00:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/bO4j+DLyylB2j1yBXnbUgGYOqqcASTTebqyFZzLo94=;
        b=idKHavRbMjjjPb+RIanWdh0XMTemh77oL+/o2MMQ+7zqp/gkHrp3QD8VTlIeuXj7Yo
         PVLbScyoBNt3RDsIQUJpg8EkDH//COkdTSL5LewF6FpMAUWmwtTv2GLLdTe1hwAJE0WJ
         liBqnvdZN/Ufw2wqKoOXSkIY2cCL+C+iEZfcXMn2tghO184O1s7Pvrm+Wo1YQtT5mTzq
         7OVd21ayIO7hK59HtX93Ip8Ka6cTr88xfnOnRaE+pmKwPOprTnRT2tovbnXqR6EnZXRB
         iIcfBsoZTdS2zjyloy0BCE/tHkQp1gfrO4iTAQkd0PeqjLRBZIDMziGIOvUkxNcxVQvu
         VWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bO4j+DLyylB2j1yBXnbUgGYOqqcASTTebqyFZzLo94=;
        b=1VORT9h5GrqD0dOQcihzib56LU5p8vc0JY+zzIwZvpMzPZsnvFPb0anUh7i78sFdMk
         JqOTt3bO3P6A3fu3+Mf7xfUuKmFbiDFGlOoxSiwSI+SlOoS5G5fixMMeeibfUJdG+rL/
         qLx6ATB7hwwDe4lrn/TZR5p0sWfIgI/MrmFC74/SMln8EOBss8m03kvYq0ANw8ItZkok
         wnRkyskuZ0exE4rV+2hvqH5i4qfigduX/BOvEZBRZkwXAXTm+Cp1BwPj/BbY63qiTaJd
         YbBqLguB4SGWDZcusLs4b4X6qECHHOfF9Mv/kQ4owun1tchcXvCAjuMQ3NpAph5brqKd
         eBow==
X-Gm-Message-State: AO0yUKWcc+O7WVVniGnmAZTMIICZLpxJanl4TjNKiivgNz0wbAYPkMt8
	nZvikqm+FSZ6W0Weqg4txzalggBRN8qaIktR
X-Google-Smtp-Source: AK7set8MvS+Zy+7bdl3fs/gQOS0hATDzzETiqnxAJHoM4rgsnMey8ZXwSeefsKK5PSw8wYO7JSU1mg==
X-Received: by 2002:a17:906:4408:b0:78d:f456:1ed0 with SMTP id x8-20020a170906440800b0078df4561ed0mr7073998ejo.33.1675931147216;
        Thu, 09 Feb 2023 00:25:47 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id g22-20020a170906199600b0087bd629e9e4sm558406ejd.179.2023.02.09.00.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 00:25:46 -0800 (PST)
Date: Thu, 9 Feb 2023 09:25:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@rivosinc.com, conor@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 2/2] RISC-V: improve string-function assembly
Message-ID: <20230209082545.bzqpx5hci6cyq6us@orel>
References: <20230208225328.1636017-1-heiko@sntech.de>
 <20230208225328.1636017-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230208225328.1636017-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_002550_913566_37B7432B 
X-CRM114-Status: GOOD (  12.65  )
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

On Wed, Feb 08, 2023 at 11:53:28PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Adapt the suggestions for the assembly string functions that Andrew
> suggested but that I didn't manage to include into the series that
> got applied.
> 
> This includes improvements to two comments, removal of unneeded labels
> and moving one instruction slightly higher to contradict an
> explanatory comment.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/lib/strcmp.S  |  6 ++++--
>  arch/riscv/lib/strlen.S  | 10 +++++-----
>  arch/riscv/lib/strncmp.S | 16 +++++++---------
>  3 files changed, 16 insertions(+), 16 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
