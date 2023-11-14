Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E0EC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 22:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZPLFF/e9WmGyoytXA+bKHOQFXCBYb4kFuM1/2OujIw=; b=U4eHR9BtryQQlD
	pGeIuyDbRVCkqvIfO1i8Rkta83efq/JNs+cy2ozfPecdUjNT6pbpv7YaUyce27Yc7obk6O5EjLj6F
	OSvGBvww++4nX84rrYoMPK4vT3ubuFH5vXGU+dQdhpjct+L+pr/9qgIj4dFMoFfiNP7VePlHPT0ST
	I6xaGoqEAPzfp00MTcXdtKsS0hvJCm1I97Nz/GiS9W0+7cbGuqiE6OHCB1qhWSX/d1CMoQU5SmJRd
	8nveVJ2fbHPI6evmrqm/0M6BUd1+jChFPKuvMbioKU0jYrQA/7sBGJ52tIO8/ZlCrZXid24HDNf4F
	EDuxfVkoY+2MXkNKOmdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r31vX-00GuiM-20;
	Tue, 14 Nov 2023 22:30:35 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r31vU-00Guhj-2O
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 22:30:35 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-421ae930545so31774631cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 14:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700001029; x=1700605829; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4XST0nJe2LTZ4oHvfVDx7eyej+3hWOw1VagBLPa3XUw=;
        b=HA/okh3ezyWtBPtS7ixh+gdiDPGaqHNfh/7VxHF1kITrAcS4K2j4cIHBJ61MZ8vRvR
         MDTD49JA6HyY562QMOA24fAFLTkctSXEu3mv+AYt5doEhzjF1M+Hobj/2HEtZMFHYRMs
         l69SaCsC9yQukE3MRUxFiowgneBhUTjcN4qU+ooBEwNk62fYUHYw7jGN4UfNhHO2LhxU
         m3WN2T4/qqbwqBAS+wModKzndTRLZJ0lOang8HuNHqOMbdFR+6zBRmwrWnD9Fiy8xwjh
         hS2C/AsMr4ZZcVWvSZBJkOvRQAUL3vU50TYZ5lxlw76aP+m3/cKV+DRk4wr4qJjOqkH+
         Fd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700001029; x=1700605829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XST0nJe2LTZ4oHvfVDx7eyej+3hWOw1VagBLPa3XUw=;
        b=f1fVZ+H5YPUV8iZ/7+g1ycJgX4tb+OVWe4OaFjyJGA+2wmKl6zMgghwflUs554MmTP
         F1zIzFhHSSxH0fLkFnXGZgl+ZtGoncW6kftiVzjv28UyN/yNgqe/ws/zEX91qe+vydjr
         FEqYs8WVtbXUwT9tbJOJOrG7qX5pbFntjzBSbCIsaz0uj+p2jxxdQ5agKUmitWHv1n3n
         eAUKc6pq9AY4p8RORfADDIGuq7GO1Gg2MmDqzRUX5uKOiH55/2eG50KajIgP/yj80c+3
         UMbvqlkIHiEin1CNkUwQoXgRAzZhxaKgAJrap2BKpo2ldItuFT5fkcLmSPQyXe+wzMQ9
         glng==
X-Gm-Message-State: AOJu0YzPWFEEGDbogwdOBmL62aQZCz0RznRpocpuQGqCqmmMUffcbRAU
	e+JH6dxT4vRkCheodslSQ44pKA==
X-Google-Smtp-Source: AGHT+IFMKHaDQrXdjPlVZanAMM7n0JSJwglGmnqidJ3M4rjzD/Zj6FS0kt5MVg8MvJG467X+FEDorg==
X-Received: by 2002:a0c:f9cc:0:b0:66d:5dd:26f6 with SMTP id j12-20020a0cf9cc000000b0066d05dd26f6mr4147253qvo.25.1700001029699;
        Tue, 14 Nov 2023 14:30:29 -0800 (PST)
Received: from x1 ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id c14-20020a0cd60e000000b0066cf06339bcsm21546qvj.0.2023.11.14.14.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 14:30:29 -0800 (PST)
Date: Tue, 14 Nov 2023 17:30:26 -0500
From: Drew Fustini <dfustini@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 5/7] riscv: dts: thead: Add TH1520 mmc controllers and
 sdhci clock
Message-ID: <ZVP1AoosripWj3gs@x1>
References: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
 <20231114-th1520-mmc-v6-5-3273c661a571@baylibre.com>
 <20231114-starring-swarm-0e1b641f888c@squawk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231114-starring-swarm-0e1b641f888c@squawk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_143032_803650_3C813E15 
X-CRM114-Status: GOOD (  12.42  )
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

On Tue, Nov 14, 2023 at 09:27:44PM +0000, Conor Dooley wrote:
> On Tue, Nov 14, 2023 at 04:07:59PM -0500, Drew Fustini wrote:
> 
> > +	sdhci_clk: sdhci-clock {
> > +		compatible = "fixed-clock";
> > +		clock-frequency = <198000000>;
> > +		clock-output-names = "sdhci_clk";
> > +		#clock-cells = <0>;
> > +	};
> 
> If only you had a clock driver to provide these...
> 
> Is someone working on a resubmission of the clock driver?

Yangtao Li posted an initial revision back [1] in May but I don't think
there has been any follow up. It is for sure something we need to have
in mainline so I'll take a look at getting that effort going again.

Drew

[1] https://lore.kernel.org/linux-riscv/20230515054402.27633-1-frank.li@vivo.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
