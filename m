Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92F4CE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 14:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wnePjEWV2/tNEdgWKk876cKmwOknu6mPo51SQD1fUhI=; b=JyOj00fu9RnDub
	YELNfgG+HjMa/SAxw1h5FsGjEpHpxC6E+z7ECPfcNy68O+VCRjqvShXkCfzkvSxeUpDuOXTVPJbSU
	7vTI7PIiaQz74cdkm1Ze0T//k83SWbwfk8npiYem9nCz96jTP7sXu95k+qyhKR4oQ9Pb8KuUgh/Y0
	HYo0kFhk+568fuUSziMp3rTFJEbh4cLcdZy5Z6UhaCM4OPygVDA6rgKpz05yaS7yEzxc5jsghzej5
	nKsCSonmBCJ5FbMiPun8erzqPBsGtCc9aLF7njl0kHs7oYEDy415RhuqdboY4bDQV9QKGx1k4Xvhk
	QZwFeT+FhdCPmTIKemwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmmP-00ESEg-2K;
	Mon, 25 Sep 2023 14:41:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmmM-00ESEC-1A
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 14:41:44 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-405417465aaso53873275e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 07:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695652899; x=1696257699; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnQkb6b5eXRZq2LrytU5CtIWVTHEXBAeVcMvdSE/Rjs=;
        b=1ZI00MC0b05YDZ6WmryWLPNBRJxtwyvIPXE1u3hgdAuaRJuuGR9NFCYmkCfuoDdenq
         MeatOn+1a+vSIvdbHR8hRN5jd70ZmmtLXLnwoLf/WswSEjNrVvIAhfP/luzWqn2F1SPS
         E8OzILZHTA+KfACepqoTcUfIMn2Qx0fSfDP4ogFj/a8ZAI3izJmK2goEqjD8HykjiYWi
         zRvNUDQKaaiWvO32hcRjNqpbAtHqrKWLSjjLKUnRHeo6CCyTFyEy5WsCNL4HedPTtojW
         Da+lZmrsjrfetGgs25Fj4jZwDfDRhOXkRNS3wmedjuX5xwWvsvupDlh8f4Q9Q2TuOVoP
         ExIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695652899; x=1696257699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnQkb6b5eXRZq2LrytU5CtIWVTHEXBAeVcMvdSE/Rjs=;
        b=Ddq3CkVHlgnzgGgT5+YV5knRIzWsZcIleJELHzLg2MFi91ew9SsYmE8gld9wMBlPC9
         tHKtISnjFqZreuODoNrs7hfV9/1Sp1VeoHN5Lu+xzxzxHy8VDbGOS3hd/rkL9Tg0EKTE
         msN615c/HZtrnk7xLxG71X/ysj9MlAkucMp5g7oX0O891MWHUwuJm69U2I1riomFy8vs
         BNJ73/R73CHdDj6njqIi+kQGNhujXejymjamfrPuYRgKH5WdpSsok3labY6OKgs5KMns
         J7KUH+Ww38RxXjUzgUXeAr2VQGOF82vSuk62sCgCswt3EorXZUApppYd6r8Ly1xLgQon
         0Urg==
X-Gm-Message-State: AOJu0YzeSORDLBSvdfjotBpg/8GFF0TEmDP+w5Sjqr7X3ajGb+HjE5sY
	xPN4Fqxz5+0ClIJsJ37rBrU6xQ==
X-Google-Smtp-Source: AGHT+IHPb8vKchvFnY0s05TsviFcSJxnsXgmrDWlqO7Le6/fH+Zwot+4Ces80LRgrG4M+d5CjIT0Lw==
X-Received: by 2002:adf:f205:0:b0:31f:8a6d:e527 with SMTP id p5-20020adff205000000b0031f8a6de527mr6030302wro.45.1695652898924;
        Mon, 25 Sep 2023 07:41:38 -0700 (PDT)
Received: from x1 ([193.52.24.5])
        by smtp.gmail.com with ESMTPSA id bt14-20020a056000080e00b003200c918c81sm5683354wrb.112.2023.09.25.07.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:41:38 -0700 (PDT)
Date: Mon, 25 Sep 2023 16:41:30 +0200
From: Drew Fustini <dfustini@baylibre.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH 2/6] mmc: sdhci: add __sdhci_execute_tuning() to header
Message-ID: <ZRGcGnl8N80yblkw@x1>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <20230921-th1520-mmc-v1-2-49f76c274fb3@baylibre.com>
 <4ef60ffd-3661-4bca-91a3-b49d6189c71b@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ef60ffd-3661-4bca-91a3-b49d6189c71b@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_074142_424381_6F1A6600 
X-CRM114-Status: GOOD (  19.72  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, Robert Nelson <robertcnelson@beagleboard.org>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Xi Ruoyao <xry111@xry111.site>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 25, 2023 at 01:21:05PM +0300, Adrian Hunter wrote:
> On 22/09/23 04:49, Drew Fustini wrote:
> > Expose __sdhci_execute_tuning() so that it can be called from the
> > mmc host controller drivers.
> > 
> > In the sdhci-of-dwcmshc driver, sdhci_dwcmshc_th1520_ops sets
> > platform_execute_tuning to th1520_execute_tuning(). That function has
> > to manipulate phy registers before tuning can be performed. To avoid
> > copying the code verbatim from __sdhci_execute_tuning() into
> > th1520_execute_tuning(), make it possible for __sdhci_execute_tuning()
> > to be called from sdhci-of-dwcmshc.
> > 
> > Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> > ---
> >  drivers/mmc/host/sdhci.c | 2 +-
> >  drivers/mmc/host/sdhci.h | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> > index ff41aa56564e..fd607058d176 100644
> > --- a/drivers/mmc/host/sdhci.c
> > +++ b/drivers/mmc/host/sdhci.c
> > @@ -2841,7 +2841,7 @@ void sdhci_send_tuning(struct sdhci_host *host, u32 opcode)
> >  }
> >  EXPORT_SYMBOL_GPL(sdhci_send_tuning);
> >  
> > -static int __sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
> > +int __sdhci_execute_tuning(struct sdhci_host *host, u32 opcode)
> 
> Also need
> 	EXPORT_SYMBOL_GPL(__sdhci_execute_tuning);

Thank, I will add that.

I wasn't sure if making __sdhci_execute_tuning() available outside of
sdhci.c was going to be seen as an acceptable solution.

Do you think my apporach is acceptable (once I add EXPORT_SYMBOL_GPL)?

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
