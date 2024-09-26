Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE78DCDE031
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 18:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wxTQesW62Rc2IvY3oGD8sVQtRDg/mXSKa1sKe5dTswY=; b=Z1FPAdkZ+YuC9R
	D0ZPEwnxK3uUBMU03bKKeE2GrdHlHcsOinQW6lIQhgN/yUsoiG2upgHmKmYWhnci3VhE7onrupWGh
	pIWxNpYCS3F8+utp81BlkjS4xmOjQpFr0gmimLMhfBYWDp+VUJkYLQOJhTcnKuCiDf+t4k4jKnUJO
	uVIT3T4KdB2oD9IyHuifB3tDrAzPJBGz93JdUm4duUfIRvAMTyRc9g67cRutoq1AK7/NzNOJz11B4
	/TWnwoga2UkCLuOsZ5jD9qbzfmT1IiIgJhQiCs93e+j7Wn046m8W5nWoQ3HtJfF/JJrzLlxcba+WB
	lvcVffqfi3MFmqiEhchg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sttNc-00000009915-2hMz;
	Thu, 26 Sep 2024 18:38:20 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sttNa-0000000990J-2uOd
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 18:38:20 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20551e2f1f8so15709065ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Sep 2024 11:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727375898; x=1727980698; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wX3yfYV/mjWNT23soPJLCRyd+y00sgy5yMqJgQHE9o=;
        b=Dzwy3feX88/VabsAlqKH1KMQTF2DTC0uPuxFMFx8IzNNsC4xbGHQTngMBcbbRkm7MW
         mjrE/FGRDs/UA/jzabwckLkDk6Hqe8VC+TZL0IDChbRdGEUqUn3xTZAJgoLXSvXblejE
         ezKACYIGXROevuRO8w6OB6H6l6+NvmTZv9lpGbJdnMIbrljQlsj1neGJKTXNdy9Tr7ep
         IL7vwVQbQO/IN/nCEMr2/ZcYH55RC0+IZQ67Ti4V2wve8hMB56BKgsQEeXjRD/uFhtvi
         CwX3gP47zkQWaGJLjm+oSwyaffbfKACcUASEHWNpICZO04xKcK7DbgaVXOvcPZiFF5fh
         5AGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727375898; x=1727980698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wX3yfYV/mjWNT23soPJLCRyd+y00sgy5yMqJgQHE9o=;
        b=OCehy7S4qYIemNbt6HRBDjI8sQ6iMy1CSjb1gvKOz9LCc9tAJKLeE9Z7rivbMz2qXd
         RUQxBar6z9vdmhroXHQUvCobWtesUEQqL6tUdV3T8DKK7InhZ+eTJp8Lfix1VZNTBuyo
         9FzRYKIRCsLcsaWubljnx44oa6oMEKvg7rBo99Q9xs+QUTkqVmdtbdosV5odlDy6yVkH
         p9WtHCzeczBu/FNZDFgT+jsAuT23cU5nAXhnBdPu9fGo/9+BqKgy18RZpsyjXJTrtPCw
         gQzy68VqOAbASWTe0S7Z4WWP31TyMq9g1cA9TzKesfIuBvn6wWaANxEqlZamlSuOtA24
         HZIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1PWmdBF0Q8fU4/3uyeqrLRX8v6lnyPYuLQnikRYNz+jdsfVG7tJRbt1P2lLkhPfVQbBKMCuktPCPS3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPhSTzVXHsKWdT3Yfnf4nlyPirdtyLWxFzeQtD66Q5ibwhZ6K+
	g1VwLJhvKY6pJa7/WbJj185GaT2S7jnjXWNhRcfptXMskwZhNC5BgCxh8u79IWU=
X-Google-Smtp-Source: AGHT+IEKfxNMgvf/9cfNHDk1L1k3ZzFqoQULZZZyf4LyzYdJuned7eyrWwn9WXqk+pz1avbSzydFmg==
X-Received: by 2002:a17:903:24a:b0:205:8407:6321 with SMTP id d9443c01a7336-20b36cdcc32mr8316565ad.9.1727375897777;
        Thu, 26 Sep 2024 11:38:17 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37da2195sm1594075ad.104.2024.09.26.11.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 11:38:17 -0700 (PDT)
Date: Thu, 26 Sep 2024 11:38:15 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/3] Add the dwmac driver support for T-HEAD TH1520 SoC
Message-ID: <ZvWqF9DU+6i9O1VB@x1>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <5e379911-e3de-478c-b785-61dbcc9627b1@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e379911-e3de-478c-b785-61dbcc9627b1@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_113818_756952_4C1655B3 
X-CRM114-Status: GOOD (  25.49  )
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

On Thu, Sep 26, 2024 at 08:23:12PM +0200, Andrew Lunn wrote:
> > Regarding rx and tx internal delays, that same section in the manual
> > doesn't specify what unit is represented by the delay_ctrl bit field in
> > GMAC_RXCLK_DELAY_CTRL and GMAC_TXCLK_DELAY_CTRL. It is only 5 bits and
> > a max value of 31 seems too small to represent picoseconds. The vendor
> > kernel [2] uses properties named "rx-clk-delay" and "tx-clk-delay" but
> > doesn't indicate any units. I see ti,dp83867.yaml adds vendor specific
> > rx and tx delay properties so that is what I've now done in this series.
> > Note: the hardware default value of 0 for delay_ctrl works okay for the
> > TH1520 hardware that I have.
> 
> I assume you are talking about RGMII delays here?
> 
> Do you have a board which needs to set these delays? In general, linux
> has the PHY provide the 2ns delay. You only need the MAC to add the
> delays if a PHY is being used which cannot add the needed
> delays. Occasionally you need to fine tune the delay, and the MAC
> delays can then be interesting. But since you have no idea what the
> units are, i would prefer to simply hard code it to 0, unless is it
> really needed.
> 
> 	Andrew

Yes, this is for the RGMII delays. None of the TH1520 boards that I have
seem to need this. The hardware reset value is 0 which seems to work
okay.

I'll remove these custom properties in the next revision.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
