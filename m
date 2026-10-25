Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9267606A31A
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Oct 2026 10:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DCW1cfkx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=krVaarOp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J3QYmn2h9tDqq5qtkT7oljonKD9ldKW2ZmNXdf0SIdg=; b=DCW1cfkx7jG7YseluR0JErCv9z
	oz3J98J1SucbzVLwZI4Pik12yBqkz9Xq6qQ+3QmrfXlN/8umez3O8li0LuL3cVtVejI5JuQGkBhcs
	XL4yDgLyuqNt0qettn6pT3gykXzhY2JwzNIvZ82QL0egCrN7Qv5hxWwpYiW8dprxO66GHQL6wVkQ/
	9H2pPISMUYpNW+81E631IjmM7d6X5op4JF6UiWNb1ofgziFfAQY8TbxALA+XhaSGfg978LuRcUNEG
	Sg68oU89BODkr5Nn96Rep8RNItX/ALm2IXJgoMNiYurHPoWM3PDNfsDyZ/iTzsIBAFcC2oCQ+t5/6
	Nhehj5NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKvhS-00000000yim-1a5z;
	Sun, 25 Oct 2026 10:43:38 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKvhQ-00000000yiM-0OXJ
	for linux-riscv@lists.infradead.org;
	Sun, 25 Oct 2026 10:43:37 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so2672678a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 Oct 2026 03:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792925014; cv=none;
        d=google.com; s=arc-20260327;
        b=cv8fiW8HWA3V9M7GTv9roiSvfjoCa77RJoprswnU9t7mnBJr278NbSQ7BMlfI4vdMF
         k1SczbA6sB9oPKzuy7wm91MQo+5kzXTGRQg79zgXW3lJyGISJ73hnaR0fsZD7tRweufQ
         IKdUOyEn87oU+aljecQJQ6F8Mqptn6gj0kBF25+iCkdrHlBHOtbYx97nfIJXVjc2nxJN
         THIUf8lmOl+X7IR/2z1bD3d4NRFh0V8mjY6lJjWhH13ezb8m53fiExog6exTIVT9k/yI
         0OBekfYQCQMJZKGiv2wIxPvd+UJbvBbrvdiW7zfsfWBvvGHpwRysgFu83YjbaT6PgHvp
         5UbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2nhVqeDWML+DyZIbNVrMj09Q/t6YqRPgh+lFp44NdbU=;
        fh=ePLgPPNZhzLfPEFnyPzV0YLa5us9BvjHf7USFhxCuiY=;
        b=UqDr5zVDhwg8kGqnnN5S59Mh/zZ3y1BtxZGRsM9MLpKwvb2ZKr+Tu96aOvLWVmAHhf
         8zzviYjgBVc90TzM9pP4n2cuv+CzmLRn4JVl1SmRAuNNuhsfVrJQP/5mZM+KkWT+WjMe
         VVmP6qfNbpf+ip1c1pTSN0eIkremuVmq60AarhY3PtNXb8OVJlvp1+hjtIvgOQcCeYQY
         2c9v458wZVUDMzh/rGO7Z3HW3oFYukdM05gXTuvEWbnIQxjgjUytY60NF3Oel+pkqr07
         YQYnBTbT+JQF2WMcyVIHiNsrOXUmkxXBAAmq7SevxWVJHJftPD35i2S+zHsScQvc8OnR
         GOpg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792925014; x=1793529814; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nhVqeDWML+DyZIbNVrMj09Q/t6YqRPgh+lFp44NdbU=;
        b=krVaarOpSR5dayOR1rJy3InuaCsc20LPm7IOY3H0LbNvvj+tf7Ap9ft2jLzanuxTUB
         Z3xZP9tFlA/o5P3247EGkewpLzmeqB0cA+VocquudkxTGXkNdgo6LOAi0x8CPcmkRZFq
         v8lrr+vh9LdgA39xwjuPilk5aFH7DZgXe5itA/Y5FYIXVD0uM9vV44T2rjfW4ioxiX/u
         PF1NFlZ9L2SrNSzGyL+EB5ubhgJWmA0GJHTMo8HHLSnuoVluNbXyM2R7M4d0GfH6u+qR
         Cu+ozWhJhoHwFAvHSlPD8HMHfF2dWo8i4HKDNt8IhSWuf6tbT0VPZzVJKKI0NdE0xK09
         /YTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792925014; x=1793529814;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2nhVqeDWML+DyZIbNVrMj09Q/t6YqRPgh+lFp44NdbU=;
        b=1h3Q1MEXAQL24dqYZSQUX2YXKFFPt40zy3NPTRneTSI+uUlgP7Itv023K5UPEn95H7
         x/Q+I+0YPbfnIt3VUXml7/3RFzOgGyY7eBsuP2vXkYQeIK9IjWKR8dVaGksSlc+LrxI1
         y15mxJUYnCfacG3W6AN872JmJWQF0H0EwqrlajxVN8EMNmicMlElfqWSzBwxuWZJbLvt
         W9XsAbmOdFd/j/SK5KoC3Itazu04FU8BjZuAgmmXBUduEJQ1WYpDSdOTyZPSIcMHeemL
         PR4QukFP36Q+3vmNhhE+OdmoREnzv5scIKvGdq/KUoRr//05ARTk6aP4FYAeRBMarpqh
         hdRw==
X-Forwarded-Encrypted: i=1; AKwUvBx43FJrjQi8jIzeh5jYwetJmTK9SLO5w6CRA/RTtnaW/Ug5WfwvwxCkGzpm2Pz0iNAx2Bp8wrxipaiATA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIVX8Qyp8FDRLAC+XJ7plcWNFhK8U4lksEfaaVZ7Pu7/kospyxW
	9I/GWOSgokkQNlliiNNsQwDUJV0tAENs6Pzbz45siRcOBUqLbo/FB70F4RGrEKRynXAlMsUvy5S
	yc5+IThEw5YBtbf+Q9puSMr0cYibgDug=
X-Gm-Gg: AYBFou3NeNbcza0nzC5fZAeWSG7stboYACzyb0N8nS1L0eDIP2l4Zm5HNeIJA4OZBrJ
	Yu/tIaPT5dGfTqRSd4tRDyEOx+MAshxQp6t1DJZrIi5UjMtD4SDzqNPemHfvAtaiszrMieOkF98
	R4AcbF/NQomvNGZmPrXjG6sIcWH4Tn1pRNlY4iJuMTeUjhqKK5Es8JW3nK++ZlrrnmmTw9+k8qD
	rJbPSgYMNiPoiXjR1iNr0tRbCkXrmYl1gmh+oD81n+XM1SCjAabpOt0uFbOEorWqGsGYabCvNXD
	bDtVY3fpGdxpB1pRj2dUIi/A5hs6oP7jnL6w/rJ/YBZPWpmRDPixf6TrbicIu0hPCRiDpxozugh
	sN6FLbwQbfkzFyToc7s3Fer8XNj08S6HNQiw=
X-Received: by 2002:a05:6402:270c:b0:6b2:20b:aed4 with SMTP id
 4fb4d7f45d1cf-6b4430199aamr5305867a12.38.1792925013523; Sun, 25 Oct 2026
 03:43:33 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com> <20261024092558.143621-2-alan.tseng.cs@gmail.com>
In-Reply-To: <20261024092558.143621-2-alan.tseng.cs@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 25 Oct 2026 16:13:16 +0530
X-Gm-Features: AclHuK-kOeWVKlgsWorJqSjEZdHZLjS8gQzZJLPBLsv2jCYHjrUYgUabSVC5ZyA
Message-ID: <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC
 nodes bootph-pre-ram
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, E Shattow <e@freeshell.de>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_034336_154176_CBD03133 
X-CRM114-Status: GOOD (  14.03  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Hung-Chun,

On Sat, 24 Oct 2026 at 14:57, Hung-Chun Tseng <alan.tseng.cs@gmail.com> wrote:
>
> The K1 BootROM loads the next boot stage from SD, eMMC or SPI NOR into
> SRAM, and that stage brings up DRAM. To do so it needs the fixed clocks,
> the clock and reset controllers, the console UART, the boot media
> controllers (sdhci0, eMMC and QSPI), and two I2C buses that every K1
> board wires the same way: i2c2 to the EEPROM that holds the DRAM
> configuration, and i2c8 to the PMIC that supplies the SoC.
>
> Mark these nodes bootph-pre-ram, the phase that sets up SDRAM.
>
> Reviewed-by: E Shattow <e@freeshell.de>
> Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>

Thanks for these changes. It helped me a lot.

Could you update the pinctrl and GPIO configurations, including all
necessary pin
assignments, to bring up the SD card, PCIe, and Ethernet nodes?

Please ensure that the required bootph-pre-ram properties are applied
to the relevant
pinctrl, GPIO, and other dependent nodes wherever necessary for SD card boot and
SPL initialization.

Additionally, could you update the regulator-name properties for
vdd_core, vdd_1v8,
and vdd_1v8_mmc?  On all the boards, the SPL code requires these regulator names
to locate and enable the corresponding regulators during early boot.

I am verifying the changes against the existing U-Boot board device
tree and configuration to ensure
that SD card, eMMC, PCIe, and Ethernet initialization work correctly.

Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
