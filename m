Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA1CD0EE12
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 16:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7UfKC/CRpPGTB1KdNPnVoLS4K3LNWR+zj/ViqXAKgI=; b=fULcY/ZKqPznhI
	uds/WikkDQmjA31m5SQDBBkHXTqoYOB1VlEYwCkgWk7RlYEvUOqJzkcDnTuV/tKFLrqc/1kuBpPE4
	fqdcu5MbCWLeOIzXWj7LE8S+EBnaJCGbcGfQn2fWxQKwr9hc+A76o762sO0OnkYTyd9Q9riWfDyL5
	dfBf+pT88jC5tPpsThzsAoXvCjnbPpTcdtffHjQB/5cfITgpHG8o/01eRjmdrPF3lyjBtn51yOFKe
	zNGBvwy/2lg4B6p/oDGVre9GKKsE2RDNxheAuL04VbPHMEm12hIx5OcVZlQwNCkmPg83dSr/HUYg9
	LQSDqaW+3UKiseosp+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szIIF-0000000GwTb-3ehq;
	Fri, 11 Oct 2024 16:15:07 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szIIC-0000000GwSe-3jUp
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 16:15:06 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71e053cf1f3so2033335b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 09:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728663303; x=1729268103; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9wXNrkmIi/YQObyo/IyUy/irrJHMOY3CT8kXuXephfo=;
        b=Uq4p8tTRJbKCsVmlWFS0urxXXqk0A7DFk4lqt442fG/KbNPgAYiR1hwbI7w7BPoYVJ
         Z8gycuSfe9E3FksxTqfAPBm+7S8LAmtpgX2B43/TlbVemL35FwuDiPHfu91c8Wq+RsMy
         lgpVUqKZ4Nhj30VsICXsRuTVpKulgrQW1GcxB48+TLJSZZEuYF7FJKjWMKztaa28LOrm
         v5uni4L/2Xz3WbRNgkwR8vHo/C0yXgxYjJD29pcHZNgtJGFUY8ZAnqhq+A6DpOHV1iTG
         5YB27xANl1A0ykNBk9Dgbf5Z5IQ7mT0JNqIPLptCgdyr2Exvd1XftFHmtFyaluQwSH6H
         D7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728663303; x=1729268103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wXNrkmIi/YQObyo/IyUy/irrJHMOY3CT8kXuXephfo=;
        b=a/aT40XPJXex17eeL7LOv6Zyw8tuD+CxEsJpA2hXaE/opQUTWeyXb9/+/EkWAR9ZMb
         LO8+dL4jnuhhdT4oINIWPNXNtfojd3YN3Qz71SGWMGm/+A0QJZ26fOk1yIWMpsdPutox
         VY1Yj6S6L7JzbNMRj/qqvi8SVCodt5I6uxUpPklsF5NXXNPEY92+WegqgO2GLS9g5YBG
         94ckmErvCrxDLeS7xDMdPZdVTxZ6jM1kkhj2zO0I5asmQ3B53LbGSoa0xm994UhqfLEr
         ztAfwKqVDd9R9YIpA4Fq9YphqsYc71I5gq1jwNV6wb0ROAYSr44EkIff1D+eC7eJNAFa
         wdow==
X-Forwarded-Encrypted: i=1; AJvYcCV7T5azVEKiAGdB1R7HwftqbK9ehCQlS+Y9ApklJPsKX+zn/yu3lAjbS9GO9a/jlf7PSGh+kik2vdbrVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyR1k1oqRDE+vG6U9M3ZciHET0RI41SogWGYJYjcE2o/Q1oEMOj
	ZDJq7mChAUKPmu8lypGNOL4RqR/hVxSaSfQ1KflQq1kS0DDBNCwLeaa9OEJLVNo=
X-Google-Smtp-Source: AGHT+IGvkNkvub3vSjul9cHLNp86zogPqdkI+zsKo8/knPvD0t1400lP6okGXqYs+UwbCewenEv0oQ==
X-Received: by 2002:a05:6a00:10c5:b0:71e:4bfb:a1f9 with SMTP id d2e1a72fcca58-71e4bfba31bmr136932b3a.22.1728663303614;
        Fri, 11 Oct 2024 09:15:03 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2a9f5403sm2739854b3a.58.2024.10.11.09.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 09:15:03 -0700 (PDT)
Date: Fri, 11 Oct 2024 09:15:01 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: Re: [PATCH v1 0/3] pinctrl: th1520: Unbreak the driver
Message-ID: <ZwlPBXfCyPxxYGkR@x1>
References: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241011144826.381104-1-emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_091504_957367_C86150CB 
X-CRM114-Status: GOOD (  13.95  )
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

On Fri, Oct 11, 2024 at 04:48:22PM +0200, Emil Renner Berthing wrote:
> Hi,
> 
> Here are 2 important fixes and a code improvement to the T-Head TH1520
> pinctrl driver that was either introduced or missed when Drew took over
> upstreaming it.
> 
> It is based on Linus' pinctrl/for-next:
> 
>   6dbd1577b7dc ("Merge branch 'devel' into for-next")
> 
> Emil Renner Berthing (3):
>   pinctrl: th1520: Fix pinconf return values
>   pinctrl: th1520: Update pinmux tables
>   pinctrl: th1520: Factor out casts
> 
>  drivers/pinctrl/pinctrl-th1520.c | 52 ++++++++++++++++++++------------
>  1 file changed, 32 insertions(+), 20 deletions(-)
> 
> -- 
> 2.43.0

Emil informed me that the out-of-tree USB driver is broken when trying
to use the pinctrl-th1520 driver that I submitted. This is because I
had changed -ENOTSUPP to -EOPNOTSUPP to silence a checkpatch warning
without realizing the implication. I've just been working on the
dwmac etherenet series [1] on top of mainline and I didn't realize there
was a problem with gpio.

I've just rebuilt and booted okay on lpi4a and beaglev ahead with this
series. For the whole series:

Tested-by: Drew Fustini <dfustini@tenstorrent.com>

[1] https://lore.kernel.org/linux-riscv/20240930-th1520-dwmac-v3-0-ae3e03c225ab@tenstorrent.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
