Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6A6C3DA6F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 19:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+ogY9ozZNGW4vAMm13jkKj72miVYqBOuTmSAzli9PI=; b=PEW0bh453ENR9L
	DYEDG+UZbyin1U1j9p8ydUBrsz5y5LSz+kX9SRN9qiMWQAVycruF5qa7JS/ANLOEzyqVbL7mBKROb
	8QJa0qnihUdaY598UmSvf6ZxzNr7SmsSE50IJ8LMhcgTBZq/UX/Psa7wdBR6dRD+eYurxy2sbQNH7
	BXRrKMzEzOvQ8bVLhHutnS1yJxYeVOPkHTeRLwF7sPeQW1Ovt+Ves/ALfeUMkyaE5QuUlWc32dEK1
	l6N0YqVhKE/T5DKY0rGmRGyW1CbrKtWCAuOazDvIsdWDqpuCVlSqpCY5B++KDRv/fU8iKs92Iz5lW
	IYn9yZC5jhI2i770aO6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtIO-001ONt-2E;
	Wed, 23 Aug 2023 19:13:36 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtIK-001ONL-2b;
	Wed, 23 Aug 2023 19:13:34 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-52889bc61b6so7830961a12.0;
        Wed, 23 Aug 2023 12:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692818009; x=1693422809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hz1MWgS0Kw3RPDsoSM7UTlfMpiCfEWz8Ysbb2j2r7zU=;
        b=iYOtG89DcaJ2oYuras6JdFxgyWbjWTDl6iCy00FQZuYYSkMrPWGYdh8/0Eoz52w3tp
         OlgAYZl9hOhFGBCyZVF9ztE0xv8gyc6lvkhY66XL0qtzjDDa4EFZYAA0VsTBmIDzdpvG
         K/gWYBimeN/JqequfpfcIDmeFJA/mn4KZC1J5tNE5LdOayY6abO3DFr8XZ7YgF8psJeV
         XkPJV6azBARhDF0xMsFUU4eeeNwyCvp5qlhQTi2IWv9hpGAv36DIkClgFe8M4H3mCI3H
         dAOBJsG87kS0syhEbeqQTFdT+ZuBzgssfysfRoAIthqSd3uuk+43Y8eioENQQLlfE/oc
         iLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692818009; x=1693422809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hz1MWgS0Kw3RPDsoSM7UTlfMpiCfEWz8Ysbb2j2r7zU=;
        b=HtUIBKADhqb6zB7pY3KTpQUyXXVGt3wKDsqlpxVGn31BVKS8TXGnlrz47nRbiJpqQf
         0o2GpsBT697emAEo3v+DorUjf4wQYjNqGfcf8iWwXqiB+Pt6ITXiOBAMQxSJuFJeZExR
         5AIvxX7GtKBbkDq75lP8Kk8llp+LXZbjBMT6zKnERV6kMzD31cN+Dxjf/fLXbZiAHTcr
         3XcqUKnGDIKNNe7dEDiPBwtO6SiA3cFGIm8+qG25lJN5j5tXaq2IERInG5remB497XtE
         FwKsd7UfOdrdQgV2wTAD5/MKa7J2QfTvIpnTa+P1HkheH0HDbmTyNpjaPWaHnayc5ooG
         J9aA==
X-Gm-Message-State: AOJu0YxkeNRU9tPFipHf53ugtLPu+DBBDeqkIER3oG5rMmBgT4ePDFIW
	DiG+KJbDLD8HOUueduiYkrQ=
X-Google-Smtp-Source: AGHT+IHXMjvf6adPcZ9gmpwfh9HOCLDdJBiBRaFNq3a3Fk/UHRRT1kW86IkVgWl04VKAvfYXtqyQTA==
X-Received: by 2002:a05:6402:34b:b0:524:9564:4fee with SMTP id r11-20020a056402034b00b0052495644feemr10480270edw.10.1692818008843;
        Wed, 23 Aug 2023 12:13:28 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id k11-20020a05640212cb00b005233f2635fbsm9563660edx.21.2023.08.23.12.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 12:13:28 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] riscv: dts: use capital "OR" for multiple licenses in SPDX
Date: Wed, 23 Aug 2023 21:13:27 +0200
Message-ID: <5962565.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20230823085238.113642-1-krzysztof.kozlowski@linaro.org>
References: <20230823085238.113642-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_121332_863404_28A25A73 
X-CRM114-Status: UNSURE (   9.88  )
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

Dne sreda, 23. avgust 2023 ob 10:52:38 CEST je Krzysztof Kozlowski napisal(a):
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Rebased on next-20230822, so might not apply cleanly.  What does not
> apply, can be skipped and I will fix it after next RC.
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-common-regulators.dtsi     | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dts  | 2 +-
>  .../boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dts    | 2 +-
>  .../boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dts    | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel.dtsi | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dts      | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dts           | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts      | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dts               | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi                    | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dts         | 2 +-
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi                   | 2 +-
>  arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi                | 2 +-
>  arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi               | 2 +-

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

sunxi DT changes are already closed for 6.5. I can take it after -rc1 for 6.6.

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
