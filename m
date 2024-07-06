Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93ADC2BD09
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 16:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7sbNOUoBT382u2leWckEyuhdipNrdJrmnIJZBpTQyM=; b=UCbzZmeH/qQ9hg
	HJyf2v8bk0gj0btE0hYcB756m3EHDi1mevHWY4jVexzFkIKP9jFdSsq8n0wGRi9SdcLGKcr4NxqP+
	WH+crYxm3MxNNehsMIMsgwlyk5YHAnbMfuMlHEuVEtfdMoZhKaMixT6WbKwIgbbBMF76UBNLvg43h
	yU9DTM5BMwMpHRUlvy3HqxCle0CUDtgNejJujBjsZq3jyI7+qbvBsdYqm0RpTyr3B3jZhh5BFa0CX
	Oa71WdhmZkbv5U1Yrk333y7mITg/7Xbgr7WQA1fg+zQN8r3NhnHk1ord2kKTyPljYQPjdMpCS4guw
	5t20euITMDT40rSoU/hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ8au-00000000VBm-3ocL;
	Sat, 06 Jul 2024 16:49:04 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ8ar-00000000VBK-2p6q
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 16:49:03 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fb64d627b0so2328405ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 06 Jul 2024 09:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720284541; x=1720889341; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7pPLymTdWA31lQrXZwdfEII/TYIYPSXMJ6wqAirrqs4=;
        b=GKJ86G95CFVvWRELgmaTDIGOmbEwr3+XNrwwvtgxQqr7Q7T8zcrRGBLh0tLg1eJI4x
         VRdkWcK5mQPtmW7jiDiU1Y7DtE1nh5o4nsSZQKhT4abxaAG98uxRJWQm5TFKTl+dAlRW
         WaaE4zBtlnVo7iOPWhg6XudupMc9FaTBlVbH22/Daq8x7UGa9dQm3AxH1F1t50rb1ZUE
         JZVVyWpldP8Mq0IoI9h6HQjibxjFk5fPUSD1tjuFfKntkgvt2lWWK4RyiEtfwvEWKVW4
         s6Y5bYA2CZxFFHi4agVEY52UBg6vDVvzSvUgBCGU2q466d0bPyiLl/uXHos+chBkGgY8
         r+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720284541; x=1720889341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pPLymTdWA31lQrXZwdfEII/TYIYPSXMJ6wqAirrqs4=;
        b=TEaPnhal8sejv777GntULD5QAZFK+tqG5pv/Ul6NSKpQn7dzt4VPzqXGlTKhGwWEab
         jyRWxZUEau5C0RjI/E7Dbix+GAEkNECFvxcLQGOLIalYnkS3LKum8Ipc0v1ZgctjBF+L
         R91k9TVNlDtd4Tgf522N2F/1ZXx+RmLUPk92oZP2JJCtGvXCjRvYpiLwc+h+mvs457nN
         wHiO9Xt0Ziprc6DcYAmdSg3d/YbVT5a8nIIPDLIc30hLPRpeukAlsfJ/xsvEOLyiEqht
         hTBzaCkq+tAHuFgWLSQ4BSqQ4kdbOIs0j4kAfhHbUhlC9ufXaf4Gego0BAboa2nLxNle
         Gy7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuHPoVd6Wf0LlYTk61J6RcFbLyifGp8QhJTLkzPVEHErOl2IQt65ZmrmNLHNtOmvkwD6K9sUK4a4c7172jcQIL0u9ys0pqZhUn7NCXicge
X-Gm-Message-State: AOJu0YzViVVIl0IlNaKdkxFVLQGeVU63jP4Knr3jnhOal2byVoR3e3M5
	nLa5u02vrIerTO066lhOntSYsVvncyyO8mzVLlISeEkL6j9Y6trn
X-Google-Smtp-Source: AGHT+IENJeiU7Mi8p64xH7HmJ8ROz4UbZ9E6gDDBcfa1jvirP9W3uzmIUxJcyVS/Lt1WZqvP42h/qQ==
X-Received: by 2002:a17:902:f541:b0:1fb:29d1:501b with SMTP id d9443c01a7336-1fb33dfc2f8mr53062975ad.5.1720284540933;
        Sat, 06 Jul 2024 09:49:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb3419e297sm50786015ad.70.2024.07.06.09.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 09:48:59 -0700 (PDT)
Date: Sat, 6 Jul 2024 09:48:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: Add Sophgo SG2042 external
 hardware monitor support
Message-ID: <5a2e23f4-d54a-45ae-a09d-e557b110e017@roeck-us.net>
References: <IA1PR20MB4953967EA6AF3A6EFAE6AB10BBDD2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953F58B631D836F3863115ABBDD2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953F58B631D836F3863115ABBDD2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_094901_734172_5B07D1BE 
X-CRM114-Status: GOOD (  17.01  )
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

On Wed, Jul 03, 2024 at 10:30:43AM +0800, Inochi Amaoto wrote:
> Due to the design, Sophgo SG2042 use an external MCU to provide
> hardware information, thermal information and reset control.
> 
> Add bindings for this monitor device.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../hwmon/sophgo,sg2042-hwmon-mcu.yaml        | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> 
> --
> 2.45.2
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> new file mode 100644
> index 000000000000..f0667ac41d75
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/sophgo,sg2042-hwmon-mcu.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/sophgo,sg2042-hwmon-mcu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 onboard MCU support
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2042-hwmon-mcu

According to the other patch, this actually covers four
distinct models/devices.

static const struct sg2042_mcu_board_data sg2042_boards_data[] = {
> +	{
> +		.id = 0x80,
> +		.name = "SG2042 evb x8",
> +	},
> +	{
> +		.id = 0x81,
> +		.name = "SG2042R evb",
> +	},
> +	{
> +		.id = 0x83,
> +		.name = "SG2042 evb x4",
> +	},
> +	{
> +		.id = 0x90,
> +		.name = "Milk-V Pioneer",
> +	},
> +};
> +

Is it really appropriate to use a single compatible property for all of those ?

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
