Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977F6C3ABC3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 08:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dU5u6Jm5dk1VBDU7PWkl3er5U2yoe0YUewdDp8S1nlU=; b=tG+mpb4u1l6MRD
	qDW6D3kXSNjzeewH5kjxc1K9WkCYQ2PnBkhnZyOTkK+MzZR/Ceq6im8phye4rdr/s1R5e4WDtr/kf
	81VXM7TFuXiIXoSt33TjuG/S/g4t94K3tLLK96hbSayjzQ6nsZu3sDOcBVyYtd6oIalgDvmD9GjZW
	I1Yv8QNsWdhSU+quzHsoNvgMqS74IZ9QXIuEDuZyPn99M5eb4vopXGvcBrkrZBJgop7fWq27bMdM6
	v2gZBfjOBxLGTdKaJ0Hv9uzgRCA/PMu4BRx5EaF7hkF9RHNt7fZvfMKcCd+oIUWVh4ZyFJVdBVShZ
	zucysXE+Htlfz4PssjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOn0-00000008oOT-0mWA;
	Mon, 12 May 2025 08:45:34 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOkI-00000008nQ2-3VmQ
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 08:42:49 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so3451086a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 01:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747039366; x=1747644166; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X+5YGsytKao/1xj60NvbEzUS05YJXuIqDnMKPWIykv4=;
        b=l473VVyDCh6TLj7sYQpo9nzhbf4BSh9nbikRNQZGpfynrRb6eDZeUq36aW+GztqApO
         jWv8Pj6qHrc/kBwmtqj6J5lXb+H5aXi2q5O6cMWizOZWHCkI6iVRF4sOu3B0afvfQ9rY
         hpwJkoK2tKJnahb+SWNoASsKOwXEWRMyO7d6/1zdkxl9fBJk1Js2T+x0fxKBZAC/MMjO
         swk0wzikU0KqHfIkVCc7sJoL3GZHBSvcbiN1tlO7mCp09agTfdUd+D4vSAs1a/X7sp3V
         V54NKGCmuQjjN4g4t7qe0KnuLVcVGiQCJ3Z/zsTKrY8636cjAJUlpQriz5wFRSR7nh+w
         9Gsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039366; x=1747644166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+5YGsytKao/1xj60NvbEzUS05YJXuIqDnMKPWIykv4=;
        b=AGeCQ2wBtSNvO/u+lo6mKQ/VU+cM2a8NVwgS9jE3yRuJtW6oKhN2foR+mrzYxcg/Td
         kXFOqH4GEdepK5scnLiAf/is6bBtqcUkBdCYwIu/uppblPKrH0yOfM9ccvV9ZWYotffq
         T7GgaDGO62ONruETeThlAx3t4ywUcJ8Cunm3zoUw4JpKLqqPGKxSRYByGkSWPzDtOxXn
         LNvbJzhL/jvPSH4/UxKX7UK18GFyfPFj/eS2jbY+0R2Sz4I6WsW9AmRaha0TQxlw5lRH
         z7M1aYwIuQ1BvbafqDV+1ALSR2VeqIkE1Iwq16gt5CUdPIXXHRcrmIUDRnP7bJheh4el
         QHKA==
X-Forwarded-Encrypted: i=1; AJvYcCVxbtgbBRld9ET6rxI5GA0+e1dagyhRTWJEuEnrqQwMHx9Uj1hjt/cNdfmgfh3Ud0tv2+2LhOMggJ4VxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUa1t24gTbNjk57AmS8+9Ra/QuSgzPGo3TiOjaFAltMqDH/G8R
	D4JqRe8/+krc7nKiJysernIICuSymL3Ilyt/jmwDGPrGKpeKGX0vFjcD8ml4kFY=
X-Gm-Gg: ASbGncuSkl2T5uOyMfE0bkbLVOu0bYBcYQxWDRgGhiolH+lamBLdFSNrz1CA17sL8+F
	+dzTM95U8vr/UdetldJD1hBJea3UDde1Qs1WShk2YFlqENGfX0CppWplUoHB4pb+mheInwT9jtb
	+Ciw1IomvEvRAPnY8oDzVF7X0nk/Fe2j0dRMzFBqCXgJphXZQhL6C8RYSqTEDRCt54AhvYnEFMj
	Omlg8uoQMN1M6X6llR2bVtVKVYDVVuFCe9QN9UxlD6VJ5fOfGEq6PrzhAANUjyP1L6nd7VBt2Qu
	bYHPC+RFNtalJ6h+xYanB9vGh7W87mW9zuQDEsZQjcfZq5P7hPO2Kkn4GFtv5bk+S1GzTw==
X-Google-Smtp-Source: AGHT+IEz7Q7VathijLmBODr/a+xLNbkuuG9lsRlC6Htr1xO5LtaIVMh8ToMMpvZPxZ7MXgvORUvBzQ==
X-Received: by 2002:a17:903:166b:b0:224:c47:b6c3 with SMTP id d9443c01a7336-22fc8b0fa27mr146195415ad.6.1747039365955;
        Mon, 12 May 2025 01:42:45 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7546aefsm58573605ad.37.2025.05.12.01.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:42:45 -0700 (PDT)
Date: Mon, 12 May 2025 14:12:31 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Message-ID: <aCG0d3Lh9KwS5a9N@sunil-laptop>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-22-apatel@ventanamicro.com>
 <aCGkdqcLhPVXSSLq@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aCGkdqcLhPVXSSLq@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_014246_883814_26FA5514 
X-CRM114-Status: GOOD (  16.73  )
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

On Mon, May 12, 2025 at 10:34:14AM +0300, Andy Shevchenko wrote:
> On Sun, May 11, 2025 at 07:09:37PM +0530, Anup Patel wrote:
> > 
> > Add ACPI support for the RISC-V RPMI system MSI based irqchip driver.
> 
> ...
> 
> 	struct fwnode_handle *fwnode;
> 	...
> 	fwnode = dev_fwnode(dev);
> 
> > +	if (is_acpi_node(dev_fwnode(dev))) {
> > +		u32 nr_irqs;
> > +
> > +		rc = riscv_acpi_get_gsi_info(dev_fwnode(dev), &priv->gsi_base, &id,
> > +					     &nr_irqs, NULL);
> 
> 		...(fwnode, ...)
> 
> ...and so on...
> 
Sure.

> > +		if (rc) {
> > +			dev_err(dev, "failed to find GSI mapping\n");
> > +			return rc;
> > +		}
> > +
> > +		/* Update with actual GSI range */
> > +		if (nr_irqs != priv->nr_irqs)
> > +			riscv_acpi_update_gsi_range(priv->gsi_base, priv->nr_irqs);
> > +	}
> 
> > -		if (is_of_node(dev_fwnode(dev)))
> > +		if (is_of_node(dev_fwnode(dev))) {
> >  			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
> > +		} else {
> 
> 		} else if (is_acpi_..._node(...)) {
> 
Okay.

> > +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> > +							      DOMAIN_BUS_PLATFORM_MSI);
> > +			dev_set_msi_domain(dev, msi_domain);
> > +		}
> 
> ...
> 
> > +#ifdef CONFIG_ACPI
> > +	if (!acpi_disabled)
> 
> Why?
> 
Same code as in the other patch. I will update this in the next version
in case any change required.

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
