Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E112FC61DC2
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 08:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3tBZPMRWXR7ivIe+s1QZ0UduCjXbRDcddhnyURwsMUo=; b=xFLdDJ2Wrf1DsY
	RBa4/ez/mbVCFjS3qPVSReSGaGDIqY+l6x26Q3lTPBPe6ReGkWrWvhhoxQxi1fYBfuN7JagiM/qN5
	T8aGeFZHTOktOEA+FuetrsKGRG08GBeXefWsLN0u8e62z4XMfqu6ItR9Owtqqx9sM1yEzKrViJurm
	JCboYr6BsETi/2OJWrfs/iR9fBPSodNl/ogJ8VIH4kS8okRk+cfA+XPPc31gFS1oOYwdWNPJ6mg88
	uzBuFT7cFesXVfjOkEe/yC1n0MwZ2FKFgG3PW7KLrC2g83YCMQzZwk+cFwQmDBKvj6X9HtpeWYPkU
	UZ5oQYFdFRc9iEmRBh0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVVC-00000003dtF-0Dtp;
	Thu, 27 Aug 2026 08:30:26 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVV9-00000003dsV-3P1Y
	for linux-riscv@lists.infradead.org;
	Thu, 27 Aug 2026 08:30:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4956869750eso11959615e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Aug 2026 01:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787819421; x=1788424221; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gv10IZgS+I8/TcY7gcREpSsUvzMsxKqW3sbwG8Jb3QY=;
        b=XODhaJxhGuVf7uHVMIZ9SHm0sCWlpnXeaAO0t9yPrpRd4P1jflUaQR141uGBZPfPFS
         aoGL25Memt4iMqreFko3jhxm3fyKo4tHEn+QU2a2UnoBxGnBZEbrZQb/0/ZxbDDSm1IU
         zb/hrYIwOJgH4z/iSgb7yxG8lfRpOLFM3EVlFnIL0Ld1+TagJ3BtLA9N0jwGoHsD1Jw5
         U5puQkc+mEYMNPfWmAAd4Um3hvsluVzmMvNsAKSlRZgDPTxWH1Ef4+F7+cdks04dOs6+
         zI8fhwKny8kzNGKdlYY/0iliHjmqwPjgUpBfA9JfeAW+c4Av3D04kiXsWjEgSodbYwuK
         shjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819421; x=1788424221;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gv10IZgS+I8/TcY7gcREpSsUvzMsxKqW3sbwG8Jb3QY=;
        b=iTFfxJbkE2CGs5aJmCxtnnRQdTbtUu88hvkwkiBUtcvlT30gkJKYUe8LVdVZAiPl+D
         GEIgMJolcymUNUyNZRa6HkmXE47XKRDzJdf/NqxWQqE8n3ZWZHD47ztZJI0f1OQxXEFy
         mRR02dUWO6wxuqAP5CAtkmVbOUuXFkajqRsuamYDM60pb3h84oH7LhRF/6++yzufIVh0
         f/jHaMTsSSoVmFTr2KnOyYKyWu5txlQSenz2HOwGK05iYh2+dgNtuSS8EpHpEZkmyIZt
         vlTawF73htyYPx/DJkLTbVvgpWBGhsVEeLcRKPNjT2UbQSFYkMbeOAEhj2w4k3ay8fUp
         sT0w==
X-Forwarded-Encrypted: i=1; AHgh+Rqwutw+Ddwq34/KJ3jKB634UX5Gu2NpAB+XY2PQs6HgFxFGiJveAZKie/o9vlFpA5mNM3Wg5/Kx9o98Mw==@lists.infradead.org
X-Gm-Message-State: AFuF++nK2s0fPKyd11iwzdpisA6Sk+UMsKJZtETj8cpoLuf3yJLvQYWQ
	9J9/fswTDRaqCCrW1zMIOfX7vJyOfhVfXHCAORMTj9Uu+DNBS0NCtv1P
X-Gm-Gg: AR+sD11Y3bml6FQQw7xApxVVixQqNnLx3+jKcfrBsfFEXep5Pb+0FzDAD7fa5pfWaVE
	IGuKJ3RM+M92lfCFjh0xa9JQan97bFwtItINtouAE7/vhEF/PLwIqbLa99m1QTXJrmmauPs1Z7X
	5r3GBwEOcm9Ykoz8jKC6GaBUfVg85Vp3/AEC4M9U46aZlQ+YX7Hd6VyvsFcYlXcd9JmlxFnvv6x
	3X2ljd9FUcHBokPTuWcYP+LAW26AGAp+fiO2hXVsZxoiB8TeZLezQCD5Q6yOczYblYt7VwEVqYv
	LJjPJVfqJcUiVbhStH/TDHNgWD4XsHT4W7pEoCwSyGCKOREulbMnmRPq92dQKIHfKOwCMFlSp4h
	8E0Mr0YVbrwkDqaF/8YR6IWukWicsu1PR2i3nXxAqzYnatC6ICIUvCIu2fburrcr2QvxK43Ppw5
	+b5VbDIiDNJK+SELsTr1LaDedIx3tiM5vM4a9ggIQh18hhLPa3Kzhosm+TgRokEv8wBCtxw/+O5
	Ne/dKpQMQmc2v4ruO7hJWp4EP6WBVEX8ipgzVJHZhKbVU1vhMdEbqjoMKYHBTSCO5B8GE8YMPLT
	stZnSL7zilbcDlBo35TibbZB1IIXCKFF6Ssx5Rv0XlH94YBPN8N9A0jgzvLF3/nAW5MTJyeG/nu
	ZFHvqhz5S1hotWdLOHzcILwF2ySd4vupf1S5OGpfWwPO1Ihf6BAfLRm0jMAMTFGEs1QrwBl48+v
	Ft9CZY
X-Received: by 2002:a05:600c:a0d:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-499dc6e9b00mr152209385e9.3.1787819421205;
        Thu, 27 Aug 2026 01:30:21 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56826bsm53438315e9.4.2026.08.27.01.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:30:20 -0700 (PDT)
Date: Thu, 27 Aug 2026 10:30:19 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Jonathan
 Corbet" <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mark
 Brown <broonie@kernel.org>, Marius Cristea <marius.cristea@microchip.com>,
 "Marcus Folkesson" <marcus.folkesson@gmail.com>, Kent Gustavsson
 <kent@minoris.se>, Conor Dooley <conor.dooley@microchip.com>, Daire
 McNamara <daire.mcnamara@microchip.com>, Paul Walmsley <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, Janani Sunil <jan.sun97@gmail.com>,
 <linux-spi@vger.kernel.org>, Kent Gustavsson <nedo80@gmail.com>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v10 3/3] iio: dac: Add AD5529R DAC driver support
Message-ID: <20260827103019.00002663@gmail.com>
In-Reply-To: <20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
References: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
	<20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_013023_871939_8AFB5459 
X-CRM114-Status: GOOD (  11.65  )
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

On Thu, 27 Aug 2026 09:34:48 +0200
Janani Sunil <janani.sunil@analog.com> wrote:

> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/iio/iio.h>

IIO specific headers should go after the generic <linux/*> headers,
it's just convention.

> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/spi/spi.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +

...

> +static int ad5529r_write_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int val, int val2, long mask)
> +{
> +	struct ad5529r_state *st = iio_priv(indio_dev);
> +	unsigned int reg_addr;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		if (val < 0 || val > GENMASK(st->model_data->resolution - 1, 0))

There is a function for this - in_range(), in linux/minmax.h.

> +			return -EINVAL;
> +
> +		reg_addr = AD5529R_REG_DAC_INPUT_A(chan->channel);
> +
> +		return regmap_write(st->regmap_16bit, reg_addr, val);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +

-- 
Kind regards,
Joshua Crofts

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
