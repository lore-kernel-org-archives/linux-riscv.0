Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9058ACD4F3C
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 01:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+uQDns9Pg/xOipG6FW46xK5mGRDUYSYdbvJbtipMhOQ=; b=14i2rxBFn8K0VS
	+KOnvzXzkXTkxLq18d45+eTBaNAk2dqsVxomDaMhfxO/BSufbXj5JOHPWxtw8BASSHYPSGpYXmKIJ
	KMRtspQP6CMpUVaRjQ2gTQ2yHwPd3nVu4hfMbOZENbvv0YFxU2QJ11KEYT7ewUZ2aXE7lGn6nn0a6
	RUpxbVLNQrTdK0xXac0D86fIr8UfsAf6BqwB7BEEutyKvBV/7iFeVM4BIjHZwz6q+SDxjZVsWxC95
	kX6xifJBYY/qc8NG138naVdrOvzoY4Ut85uNd1zXSrJ/jEistldX4eBQuy6h/GNz33JcXSMR6aHgd
	S/zWKoDQBQO/Yulxr3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOmdA-0000000Dobd-2874;
	Mon, 18 May 2026 01:18:52 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOmd7-0000000Dob2-379J
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 01:18:50 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-838d0b7c950so1163959b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 17 May 2026 18:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779067128; x=1779671928; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vrkXl/tb+VJX1ZNHX4vVsA7L7lm6KoE09cNj85XuTpU=;
        b=UL9RHz0aO2nGOyEAP6zJzpmSXU2o1ZAGsqjwmjIHvQVKnhq2cKS2+SDaoYUOX5gelf
         cE38gHOa/ICgbZw8x/oRoOMHzt11ASjJFe9aiQJ+0HO6LJUuTOCf4cCzO2mdWi9b5Zv1
         a2yOmqvbQN4UDDnucaQpF23mNfpjNzZ19H+eBMlSEOTFBNpiU/WlTZZfCwB0xX9Pa/r2
         NqXfVOR3H3sQCNQ3ZsLWxSo//k8rJnmIKWwc2JFre/vht+sHtl170Q+HLrhqszNU7JRH
         32NuRICW5P3zcL/6PcXJ1aYF8IoTZJM0MX+OAjZJ0NJNgiMydjX0DixFPqIwjt5aLZHT
         ByhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779067128; x=1779671928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrkXl/tb+VJX1ZNHX4vVsA7L7lm6KoE09cNj85XuTpU=;
        b=RzrXMJJbWzGbsYRFAfLlTwyEnLLsZEYxJaQlVTsel4SD22PQMuV7l7FXOiFOpwkcRY
         AW+uxaS3STZOHkHiZRD2GmHwq/fiqFoOhEx9RNeh7nlHBot2IrWH/Qw2znwHSrOEee0Q
         6HNmCbOHyhtdjZbd6Dvkk2SfsNx/OJSxBLQoq6dJ3thSTEo7eyDmKHCUTnAjY1t/1EEQ
         BkLV9BKB3h+ziZEtD5z7iNi8JlBOtr5nwJpyRVEZ6giq8npCDaTVZBk5fWsoOlmBTrsE
         kgqoFkiCH/IWhxwT/Iqe4uxCLzzbBWr517MrDnbhauoq/AxtGw039laQrxvHrYyzJao1
         /bGA==
X-Forwarded-Encrypted: i=1; AFNElJ/qALohU9Kugw0JGP+oYvZYJ8ghTXrOXfFtj/yCTn3oXMdxvWofLU1mA381HF9Uq+6ZAYJQpHfzaVnaog==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfJlNe/22khhRbQfDfHQ5ihrDHupxD51Sz0MQlMGptgMnE3HHs
	jtdlPp+X++FNebcjrmIR0aZiG+3SbR/3/JHHImhcTzCqFfMuaMTCsXnZ
X-Gm-Gg: Acq92OEGSq1qlYohwBd+3EdQDufP/uUzp2K9Iiffo/wHlHS73+uI+LicfkfemCXuTwL
	xSDagJp646vdVNM7y/RxSwuVI4TFJhVUQdDEJa5zX8kXKBe+b1JaJg6DGmBPk3Hox8lTOwxmf3T
	EqcCCT8ySlPN56mK+dztxUudDdp+gbIvNZ7udzgou6Rr4xtkit8SrZHXIdAaWt5rCybXg31FqSq
	lHdZgxGKlB4mIWLMG8Dyma9cR/yZMeBCgHaUMzjAKV+qaSilsfEIe2ZBNp9vmxN60TxZsTyh56k
	6hqywrm0TbT3Uugz0ECemlxb0p/4uJRylz6JZWePcAXQL7SdazAxR9sPTcv5mpnz3mnTHhQYVr2
	1D/4WzCLxEdxVT7/CLD2lhvz6GM6IyUja+341+8baMkhMW+ACce1UZ6rLghr3UlleQyiB1GOlMx
	RUkN9RafuYwJXmJyLYaKefAgs=
X-Received: by 2002:a05:6a00:2908:b0:82a:6461:6d15 with SMTP id d2e1a72fcca58-83f33f166f9mr13591304b3a.46.1779067127790;
        Sun, 17 May 2026 18:18:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19778c87sm11922977b3a.19.2026.05.17.18.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 18:18:47 -0700 (PDT)
Date: Mon, 18 May 2026 09:18:13 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Bruel <christian.bruel@foss.st.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Senchuan Zhang <zhangsenchuan@eswincomputing.com>, 
	Alex Elder <elder@riscstar.com>, Nam Cao <namcao@linutronix.de>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Randolph Lin <randolph@andestech.com>, 
	Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 2/5] PCI: spacemit-k1: Add multiple PHY handles support
Message-ID: <agpogZp46N_1B0ps@inochi.infowork>
References: <20260517014841.254085-1-inochiama@gmail.com>
 <20260517014841.254085-3-inochiama@gmail.com>
 <agl3TJrvJMtEpHyl@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <agl3TJrvJMtEpHyl@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_181849_787499_5D14E6CF 
X-CRM114-Status: GOOD (  15.00  )
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

On Sun, May 17, 2026 at 11:07:40AM +0300, Andy Shevchenko wrote:
> On Sun, May 17, 2026 at 09:48:37AM +0800, Inochi Amaoto wrote:
> > The PCIe controller on Spacemit K3 may use multiple PHYs at the
> > same time. The feature is not support by the current driver.
> > So extend the PHY definition to support multiple PHY handles.
> 
> ...
> 
> > +	k1->phy = devm_kmalloc_array(dev, 1, sizeof(*k1->phy), GFP_KERNEL);
> 
> Hmm... What's the point in having _array(1) ? devm_kmalloc() should suffice.
> 


Yes, you are right, I forgot it is "struct phy *", so the devm_kmalloc()
is enough, will fix in the next version.

Regards,
Inochi

> > +	if (!k1->phy)
> > +		return -ENOMEM;
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
