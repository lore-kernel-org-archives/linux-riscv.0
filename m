Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FACCA0EEA
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 14:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PO0xaeQt5FsxCw+tfEc2OFpiUWx7sdAciZYEJRIkCNs=; b=LVrm0IWmatOjv4
	Ypie8VrQUl4naDpsJzjFr9UcD3PGhMIJkHsWqxoUPJESxTDT/Tvf7He8lhpZ9naKAi74b0HWrwaPd
	eVuLeuFWpIz+oycr0l+2zhZ5oYk7obxwXpj9DUSZ4+MLmcYMuVpCx7uATStnSGPyvIDdeavJQfGLX
	yYr6PS81XxMhZ9iDD0GSIQFMZXc8ftN2unIwA0+MBDU0AGzk+QrTEyphFfAJ3m28ccHl80G/vX8V9
	l735tAVvluJOOwr4LjXF68FR+8RLJMZRQTi59fUMes1T3FqyUEYONGryn3F8NucUmVUxjmbrirIwV
	6p4KLNSIVDB/3uU3tvdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCMJ-0000000DtWO-3t8d;
	Wed, 13 Aug 2025 14:21:43 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBcQ-0000000DmNd-0yDy
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 13:34:20 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3b78a034f17so5055642f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 06:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1755092056; x=1755696856; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fNSC8w8HU0S89hQRnFJWFWREK6fXZjS72GfrRn4HArw=;
        b=2aI39EeoRYA7hE4duePDs06RXDuMhE2kp6Tw3X971/aRnyZ+1pI3SM4lf8/mOzWw1l
         g/BxMNqEutpYapkb4dXqBtHEB48sg+spVt9NqdSQghR/MAU1aobgQnRG5ug/deesESWk
         8kamSevL4ZyC8d8S3Cvu6yiGFOcITdDHIPVJrq2jq+tYaqCQ3iY9A6c50no32yX6PCJ+
         /TMcvTIDz1yxMYE7QJUVM3lNGcuPy6PcvZb4WZ3NFmNUXRfuzm9E/ZFgpg3unw/yYesT
         2aE3RSH24CVuKAJ8CGXqZpSJNtrSKbZKTfAjpTm+Ylf7F718A8ovy8rm9bFopZfhTgI3
         uCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755092056; x=1755696856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNSC8w8HU0S89hQRnFJWFWREK6fXZjS72GfrRn4HArw=;
        b=WREX1X5TOeY2uyw0+E7iRVjfQazNNN2j0y1LC/0XycY8Kq3ioXbxy9XXXgCI2dCTMU
         fwqskX6hT5pQvy4PeSGaKPZMd7FtQy0FlIACzv6a2t1lv/0yXp0VBWH3diD1KTre2W/0
         XjFFoV8sLY4phdMss3V4AZ2ndEuwRhAn4pv6X/vd1v/VlxTx1pkSSL75u85BfEJkm6SR
         UnlTHmE+YGCb6ubF3mFYuW6+EjK9Bun8tnsnjxCxiKTv6Ucj2llscQfoMUWtZDdM6xsT
         Td8vvH10ybHXy5nz9Qa7aJh0CzWxASDFGVEjNCZjP4T50KmkZhhkaUtEhKeQzfGaAeIK
         dZUA==
X-Forwarded-Encrypted: i=1; AJvYcCUkB4Bw41VSSqoN10OR5/UElXohJTq+xFExKD3OMS9coqHBRvElujtgWbCn2hk8c3eKrQR654aTSCbraA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6LfWubyTXArxSFyWUsLKnCB5soNT1U0Am89kondS0CupPqtN8
	/23xG/U/r8GRvO+CoEEOQZ6Sw8oeHfPPuNVnXC3R6ySyXbAhTI3aCdvRCHwDFa7ix2A=
X-Gm-Gg: ASbGncsisAjLjzcExC1dVvSqxSCnvE8cDO+X6+Ro/S8jVcDP0atSh13fo/EvBBwQJf3
	XyXXMrJM4tucobdIoHeaEIfTd2n1jCk6u00veeQkxSFIR84aApatJ/gVuvDBJ4PiENabBmokEKR
	GQvRZ//646dqzU+GXkBwU6NdnDQeHkLEtlVbT9Bqbpf5PNt9YJJEtdlKaSt4KPPm331+yLcjjlE
	C0a7kez8HwdblxAEVtYePJFLBLbiifraRNCO+toZcgur9fgcXhn/fXIsymTPSLyJbYQuyK2nZpn
	uFCDVuLAI0FuTqoEAp3Plhz/2IF9Lm+Zk3DkLTmIrypaoS84d411XI0o6lidBym/03VBskM+br1
	nN16WqHOEndhkT/4bftB/22qZuVQlI2VDxEh+XyBnuN3pv9zR4/F/ANQYKviGIwSnv4zMXG33dF
	9kGlr/w61YCO3hWvyUL7jc
X-Google-Smtp-Source: AGHT+IGyWBRLcYyjmPdaFJ7RJMvGFJChrNnUkFexYqA+15BorH+hR4bUKBZZRC1EER2gmnrpcLdyVA==
X-Received: by 2002:a05:6000:26c9:b0:3b8:ff3b:6437 with SMTP id ffacd0b85a97d-3b917c85890mr2243633f8f.0.1755092055765;
        Wed, 13 Aug 2025 06:34:15 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:388a:2f48:ed4:7e0e? ([2a02:1807:2a00:3400:388a:2f48:ed4:7e0e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0846777sm37944948f8f.48.2025.08.13.06.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 06:34:15 -0700 (PDT)
Message-ID: <463dcfa3-152e-4a48-9821-debdc29c89b2@hammernet.be>
Date: Wed, 13 Aug 2025 15:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 4/5] riscv: dts: spacemit: Add Ethernet
 support for BPI-F3
To: Vivian Wang <wangruikang@iscas.ac.cn>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Horman <horms@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250812-net-k1-emac-v5-0-dd17c4905f49@iscas.ac.cn>
 <20250812-net-k1-emac-v5-4-dd17c4905f49@iscas.ac.cn>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250812-net-k1-emac-v5-4-dd17c4905f49@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_063418_508779_F591A13C 
X-CRM114-Status: UNSURE (   6.02  )
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



On 8/12/25 04:02, Vivian Wang wrote:
> Banana Pi BPI-F3 uses an RGMII PHY for each port and uses GPIO for PHY
> reset.
>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>
Tested on Banana Pi BPI-F3 and Orange Pi RV2. Verified SSH shell over eth0
and eth1 interfaces, and basic UDP connectivity using iperf3. Thank you!

Tested-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>

Kind regards,
Hendrik

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
