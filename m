Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E58CCFA13
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 19:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=otmHY2RbI6mVEffokKrQ/cS2Io+b6M2+465Jv/HczsE=; b=cqO3CPixUAUDi/
	2fN2IPBFTD+pkwCIp98R3RTa74BvcByUKD3i/+HpKlaA0eq5z3fLCMP7bhu2GtVwPhBNMqGyqQpxh
	Zr2L158Ti5ud5IE+RZPZ8sJtidwEzDuKhXF5JVdhMZ5DZm4ywMa0pVeiq8XXkk43ZXK1G9ckNE7sD
	zbz68jUBr+4EFuXaKwYcaahrQy9jhy+H1xcEU17Fh18nM/XvGvFpkO8srItQToQcuNyy5eLZ5yhn2
	7qaJWzZuNq0q/uEcFMjMhLPo1lkGiKD13tvnTuVD3DUUFqsZJYjNB7eXmvRJfPu+Ky9ridzzunfhk
	r7IKMH1wkC5Iy6o7K6vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAEn-000000047Ww-0V1o;
	Wed, 29 Apr 2026 19:06:21 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIAEg-000000047W3-2yKB
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 19:06:20 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7dcdd23fcdfso81362a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Apr 2026 12:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1777489573; x=1778094373; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tLp77h37TVQdWoQsotndHzDBo5bpvvkPFhWBJBsBzYc=;
        b=RMwZViKx43BVjJX77tzcqBcnvkoF824VjQ2StzUY16mIo3oNZ1+OuoIV7N1tY1dQ4v
         AhpEsIq4niMc84tTyVVIeVLgs0pJM3QiZ/juIP6ew2uDnSHMxF5ZvWHo49DrLmvV8z3E
         VBxbxstApJpsAR2GRMXtcyLlo4cQColLf3a/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777489573; x=1778094373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLp77h37TVQdWoQsotndHzDBo5bpvvkPFhWBJBsBzYc=;
        b=oOnE5wH5e7LPJ+jg588UW8dhiJ5Y5k5ByCgHdL04PLVZYIwsvCScPCU+tl7SWe6PaX
         4MgQ5t1i2gq+DzVeRYjX/raVXyxdk9dsk0GcHLpihToLtwJ3LnGsQ4CSWItDzKvpMPTS
         nbCcWPiJy25tT8FqTF4phGNYa7b/r9Wu4zlJMPyA6Vw9GbyQrlmkGY62DlhY/9p4waVy
         Fv8eVvamIsSL9qa3wuhc48lztxYP0pUN3V5E6vXBvd2wC9w3G22V20x8VtfjNgR8yRam
         Eq9tQDrHZkVa+K9eY1twdf7TfbRxkgs0c6Z8CkhIllvhL9A34ksSf5GbQPpH0udwzPve
         WY8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8bkbRkHGOrTyNDdWzNiUdZBJaiYwkCf2bVaPl/Cl2O8PUn/B2G9XV4YGm27O/NW5LlH5A0MI+pOkdwBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmPkowe8MNBsPmtzmsgpfjURLTi8B0YVi0pHdJeCcEmINb9aOL
	EIWw4sDd06f2ApBBsuuMBSWrb142r9Ca8SZtHW3z+9zPfHbig4yUBUqbOsWIsRcD1Q==
X-Gm-Gg: AeBDieuaYXWAnLvGg1VMpw1cz63oLzq8ymQYxQXiH+WVUABDZIKCf3NQopfLhvrHcYp
	OnfKOOUifkmZLeiUjQpL8kts6crotTpK9d799QUTytJfuDuGOhcrY2GnRhmPMc7lQD7ro6yKYSR
	5NKhgBeOwZikbPqWrdYK/3nNorE84f3MJ84Xmiu8y9MsuOcbTjcfXBdDrvazy6M5s32Sh3jYJwI
	bebAzrMIOhG4PAAaonQ/O6QjR4wHy3PzGIWtu8l8uQ1egV0TR/jFa6bcnZ5OO2KSNk+iw8OUcU9
	PQoDbqirc3vZwgW0q9wz/JgGN8Jmz2PqNz2jxCSDT6JzHXJH8sp9U86ujhic9Bwagcv14fboeml
	no/TK86Ov3Mh8gyGUtgNjiCaelYmKL0nSl6nqEfM6SJ/yw2dDhi7wtBgu8aa/4a22eI2RTsuTFN
	aFi3XPARtKRcmhP8I0RSoPoJoQ8EcVA9pbGNDcTiLHPjsjEN9ZeY6Wn+8gTj1GD3RL9P5L31jk+
	kFjuAw=
X-Received: by 2002:a05:6830:6008:b0:7de:44a5:51ea with SMTP id 46e09a7af769-7deba07072emr31818a34.6.1777489573064;
        Wed, 29 Apr 2026 12:06:13 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7deab9d5b9asm1822657a34.21.2026.04.29.12.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 12:06:12 -0700 (PDT)
Message-ID: <856f4e8d-ff7c-4744-9624-e838c758f009@ieee.org>
Date: Wed, 29 Apr 2026 14:06:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
To: Mark Brown <broonie@kernel.org>, Guodong Xu <guodong@riscstar.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Alex Elder <elder@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Alex Elder <elder@riscstar.com>
References: <20260427-spi-spacemit-k1-v9-0-ff753b551302@riscstar.com>
 <20260427-spi-spacemit-k1-v9-2-ff753b551302@riscstar.com>
 <ae_8n0I_ORDLib1y@sirena.co.uk>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <ae_8n0I_ORDLib1y@sirena.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_120614_899855_EF90E465 
X-CRM114-Status: GOOD (  17.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/27/26 7:17 PM, Mark Brown wrote:
> On Mon, Apr 27, 2026 at 10:01:28PM -0400, Guodong Xu wrote:
> 
>> +static int k1_spi_transfer_one(struct spi_controller *host,
>> +			       struct spi_device *spi,
>> +			       struct spi_transfer *transfer)
>> +{
> 
>> +	/* Record how many words the len bytes represent */
>> +	count = transfer->len / drv_data->bytes;
>> +	drv_data->rx_resid = count;
>> +	drv_data->tx_resid = count;
> 
> This is setting up _resid with a number of words.

Guodong, see below, but I think the above should be:

	drv_data->rx_resid = transfer->len;
	drv_data->tx_resid = transfer->len;

>> +static void k1_spi_write_word(struct k1_spi_driver_data *drv_data)
>> +{
>> +	struct spi_transfer *transfer = drv_data->transfer;
>> +	u32 bytes = drv_data->bytes;
>> +	u32 val;
>> +
>> +	if (transfer->tx_buf) {
>> +		const void *buf;
>> +
>> +		buf = transfer->tx_buf + (transfer->len - drv_data->tx_resid);
> 
> This is using _resid as a byte count.  It'll be fine for 8 bits per word
> (which is by far the most common thing).

You're right, this is a really great observation.

The best thing is probably to just have the *_resid symbols
represent bytes.  (Their definitions in the structure say
that as well.)

k1_spi_write_word() decrements tx_resid by the number of
bytes transferred, so that's OK.

But the FIFO handles words, and k1_spi_write() limits the number
of *words* transferred, so the "count" calculation there needs to
take the word size into account.  Something like:

/**/	unsigned int resid_words;
	unsigned int count;

	/* Get the number of open slots in the FIFO; zero means all */
	count = FIELD_GET(SSP_STATUS_TFL, val) ? : K1_SPI_FIFO_SIZE;

	/*	
	 * Limit how much we try to send at a time, to reduce the
	 * chance the other side can overrun our RX FIFO.
	 */
/**/	resid_words = drv_data->tx_resid / drv_data->bytes;
/**/	count = min3(count, K1_SPI_THRESH, resid_words);
	do
		k1_spi_write_word(drv_data);
	while (--count);

	return !drv_data->tx_resid;

And we have the same problem in k1_spi_read().  There you can
probably change this:
     count = min(count, drv_data->rx_resid);
to this
     count = min(count, drv_data->rx_resid / drv_data->bytes);

You'll want to review and test yourself, but scanning through the
code this is what I see.

					-Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
