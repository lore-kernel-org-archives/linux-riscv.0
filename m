Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919CBC74A5B
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 21:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+gV4dVO7WoZToAQSbuIHSG1y2whHPolFLVDoAbyQhk=; b=xBQRK5YUTqCrg4
	du4FQKI8zcGTNMf0u+bT2gOloq2MPKdVw+J3o9n89fJftiGGdq4eN7hLMg06Q+u8QRpClvUBq6AhD
	ntsRqSKDIOD2NPn6J0VhfJtv1kkyjTSMEnsXE79T62JWOTRn9qVV37/1EWhIa/9tAfHMYQFyB8dIj
	vGjqgBCVN6J7T7+vZFNRmNvbU4DXYveDpzOOeN1w56AN2VT5//GwJCcOBLyOApoQVoEcVXd+7ghBE
	KNB49NeZIMrYzi6jUHIEyMn7LKu2toG8U2sxbWgiXsqyaLDoJKILcvMC+Jt7ThUhobxDyz1OExhN1
	C5wCHb7yzbq4zIM8l93g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfSN3-0030Iq-06;
	Thu, 23 Mar 2023 21:21:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfSMy-0030I5-2n;
	Thu, 23 Mar 2023 21:21:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id u1so27150wmn.5;
        Thu, 23 Mar 2023 14:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679606470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVc7Of+Ix0ryK/+RAH7Z4FzYtXWWON2rs5eqRA4tiWA=;
        b=XEapRCAfRjQ3Vvhm/kfmQ20knSNfS4nyJ/DeNjhfKvWH2mP0mTbIUKHMGqzD4Cny7L
         pnHGYrLZhiQ3qpg0UnAKWYhtQZymabZ89gHgA1UyPiUr4X7/ZucB76UM7P0gfnMvc6+w
         N5ju5ShkPJ2UoqBR347f7Sp37dTkbdMKiUc9AA7vOWH0vKbb1W/v4qj5vn/YMqyPRi1U
         lXEjFYiMa/v/g6AvU66r1/KY0L+P0QKdJTvenLQcUmsEoGVjxZlcqUlAN8BPK9i3oDcF
         Xpqr43xWIu9Ae7F5+NEs5ALgrRlDuC7Rws/EFSWvlJeAFI8XZV9HC8BQB7pdZxSqO4ew
         JX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679606470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVc7Of+Ix0ryK/+RAH7Z4FzYtXWWON2rs5eqRA4tiWA=;
        b=jC304beW+YaGEZnA9HrcVxtZkJi3p1ltPJ5TGJmBkmdE8//MOmTRFf8ALhLH280aml
         +a9aXf63pfuf6s+9gg1+o+UzkrVZKJe75Pc8R4JYFqUNQ7gwNXEV23bsNPnkj0VPP3FD
         W7zd9sbsl5xj1itio1wBVf14JOkUfT5ZcjiIthQY8jqLAsHxhFDf4X+roux2W2H8Vaf7
         ATVZPTcju7ZbciPV0eJI7aUR2Ao5fcBrmTJUPSztbf8FraH/F+pJjZoHJjk8nYv/oXCs
         0CCZNsXQCD9AM57Uzsk2EhoUlqj9yfTCz+KMA45hFzg11gw/nsJrBP4vVs+O9bpd9N6u
         /Rjw==
X-Gm-Message-State: AO0yUKWtrmkO+I2nKlCE3D8hZhlXqM6vz/h8xzEHTMSFQupeXZ6NV1MH
	RXWzjzazuGUzEh9DuagVvpA=
X-Google-Smtp-Source: AK7set+7XkMQw//QRP6U0zw01ONMG6SisHKvyle8hz7Ra/I8s94s0O0zFWuYYD6E3TY5EKsJLVrbaA==
X-Received: by 2002:a7b:cd10:0:b0:3ee:672d:caa4 with SMTP id f16-20020a7bcd10000000b003ee672dcaa4mr686528wmj.17.1679606470461;
        Thu, 23 Mar 2023 14:21:10 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id t7-20020a05600c450700b003edddae1068sm3135457wmo.9.2023.03.23.14.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 14:21:10 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: sunxi: add MangoPi MQ-R-T113 board
Date: Thu, 23 Mar 2023 22:21:08 +0100
Message-ID: <3225657.44csPzL39Z@jernej-laptop>
In-Reply-To: <20230320005249.13403-5-andre.przywara@arm.com>
References:  <20230320005249.13403-1-andre.przywara@arm.com>
 <20230320005249.13403-5-andre.przywara@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_142112_909211_BEAE87B0 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, =?ISO-8859-1?Q?Andr=E1s_Szemz=F6?= <szemzo.andras@gmail.com>, Belisko Marek <marek.belisko@gmail.com>, Fabien Poussin <fabien.poussin@gmail.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Dne ponedeljek, 20. marec 2023 ob 01:52:49 CET je Andre Przywara napisal(a):
> The MangoPi MQ-R-T113 is a small SBC with the Allwinner T113-s3 SoC.
> The SoC features two Arm Cortex-A7 cores and 128 MB of co-packaged DDR3
> DRAM. The board adds mostly connectors and the required regulators, plus
> a Realtek RTL8189FTV WiFi chip.
> Power comes in via a USB-C connector wired as a peripheral, and there is
> a second USB-C connector usable as a host port.
> 
> Add a .dtsi file describing most of the board's peripherals, and include
> that from the actual board .dts file. This allows to re-use the .dtsi
> for the MQ-R-F113 RISC-V variant of that board.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
