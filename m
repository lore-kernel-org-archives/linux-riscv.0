Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB04C77B7E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 01:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OYq7VWwzqwNXzV7Km5nuXebJz4DBbNN152HGqQjjatU=; b=Q3eFh3QbkAfIOj
	blmgABxIAaxL67wLKJCfHK8jAPfjms/aLJQMTHUebkgaoUjNVcw3jBaP70QyvzIQhB/DXGrZTyxe6
	nTh5TfBf2urBywcAbG2yrkysXBDlM/dOc4EfM9jLQ/Fi5otxJPh3mqb7tVyO03pZrt4xWBxXNVvQp
	KkOCako/0QPRNHGXjAWKkKxoDJckTZZpjYwUt1zADeeusX0JeJqSL1A1Vb/BXN3hL4Lmd1lVgiaG9
	YQsOyXtbYNPGgZPDfyob3YTwpz9j2bsoU/9uGFF/VZ+tZ6prVMh2GbCaRMZLnwpc452XE08NuOXno
	88Pm0AlcseWWu6Eks0cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4tgo-005R97-0b;
	Fri, 02 Jun 2023 01:34:50 +0000
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4tgl-005R57-0F
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 01:34:48 +0000
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id a4e8b064-00e5-11ee-a9de-005056bdf889;
	Fri, 02 Jun 2023 04:34:41 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Fri, 2 Jun 2023 04:34:40 +0300
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, palmer@dabbelt.com,
	paul.walmsley@sifive.com, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sifive: Add missing check for platform_get_irq
Message-ID: <ZHlHMFRdTdpAhqf1@surfacebook>
References: <20230601082440.30110-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230601082440.30110-1-jiasheng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_183447_291680_99FED538 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
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

Thu, Jun 01, 2023 at 04:24:40PM +0800, Jiasheng Jiang kirjoitti:
> Add missing check for platform_get_irq and return error

Also refer to the functions as func(), like platform_get_irq().

> if it fails.

...

> +	for (i = 0; i < ngpio; i++) {
>  		chip->irq_number[i] = platform_get_irq(pdev, i);
> +		if (chip->irq_number[i] < 0)
> +			return -ENODEV;

Same as per the other email, why has the error code to be shadow?

> +	}

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
