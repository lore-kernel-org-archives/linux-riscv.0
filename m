Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148CF606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pl86JdF/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Bn4d3Lca
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u1wXtEE49hkcjlMoGVuvlaINOj9xXy50Xnc9cYypmpA=; b=Pl86JdF/5uDDq0wRjX+V50pFFc
	RAQvo8DYQauYO3j6kuYbq24okeDudqb8/PAYE6slWUm/uczltuDAl3ubqJwB2cpcM54WXaCN4lEYz
	jZ7vdyQCmxNvR39upcbqvWJ8Rk7UBBkppv6rF3xCbgpEsN1vY8IjCNx2sIwPcXpIePeNK1m47SAO1
	Wgq4l2XuI5ZiQO3OFzbXJ3kM1E7iX2uQO4lwCLpiRLKPZh/QTuoHTF/ntNUx9tcJCDA5+j6MmKaXj
	0JQXZV/LOS7uTICNzyInE2zQBR6VdubXeRIqWLKMnQr8Tu0eCs4bQPWLnZEF6lxEy6SuQT8YnNQ73
	KCKxKLEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuSd-000000023q8-2fFO;
	Mon, 16 Nov 2026 11:01:19 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuSY-000000023nx-3MoG
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 11:01:18 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so5506125a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 03:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794826873; x=1795431673; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PO8kzyBm9V5PzLhTMJiyGSgb8yl8oDzcJ3dWIao7QlY=;
        b=Bn4d3LcaDerpCopaUNdtLDDB6CIrwW9nK5rGDouumYbwQtjHbCJnSLyl1rJmlJ4LFZ
         oshDFjGTdKwqcwMKwJDWNyHklRiScMGd4YFg8jA1wFbGNSMsp2Wykb3l8ugRwwg81bGZ
         itoOWCv/v15WpqB1AbVLYzxJZZs3porVgM8FjEycmx83mhHJI2w5nXCVaKNipb889nWP
         fa6sg2OGhFUe8iDwf9jdPic50xLY+LSZcxd1bYPX0BE8gj3mp9yOLq2chrQeSlKC1Zd9
         IVUg1M/BQvPylg5z6THqCLnN2pSLAWiapoZtinP0+8EfITu4SaqZxlzZgFYciHgqToup
         akgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826873; x=1795431673;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PO8kzyBm9V5PzLhTMJiyGSgb8yl8oDzcJ3dWIao7QlY=;
        b=cvckt5eu6q9aoRB9PAaOv9sqyN3JYof+nhSBrCPuSFU9N4Pc5/6bRYVS9C7+09uCkX
         opLNfiubzU5hKkZz18IW7ZR6UUfmDnVtzRa0xq7BSHrNDlzemSnuNIXlWsLGXDVRYAXn
         S2F+b0zMRJ50fZBA7vwKDY99Qd55Ta3NqGnidQ9ULZ5czBGNmbfP/EdaH0WqJfXnRfe/
         hEEgCpQ2iSBJpNVptXuM4je8I507RvOEeBEMOmdwieBvJTw+zZS85uLJgjWMYYqn+QEv
         IXUXXniAJkvJvr0zN4sF5xFN57zXya5qG98tSUgBYPrkMrEZxCpBQMHN4aznmsxeLPPw
         /7sA==
X-Forwarded-Encrypted: i=1; AL+hErGNAOmgFfjcwM5e/nvIT43V8QnqBlyE4Gcz1WGNlT2Gyi4QPCHxThWHwO5eW+ETxB/rwqyaCSfcA8BlbQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/s+PmHjbUM8dlcY4lK1Zh57How1rciytl5cbUFnTasZI1Dikbq
	CpAJcZ+FjoxB2o1fzUMSSx0s0v/kC6cjsKN2YqJiNZds4ogrbbv4PZ3QlqOCzceACh0=
X-Gm-Gg: AYBFou0xF8aqMoGh4U/HCVoOebAjleLphrtprpLZxW54y1j/820ZyyhP/3TQcJX7yWr
	smSQFSCyu5f4QnUocELLi4+KPm0328oEXZqDmsXTnJ7fn2bbcbXUKcV3ucre8HFuMCVpLynkuWB
	7MyeGIlyEt9cNaEOY+SitS7sfq8H0EmYfglwNnNOy5tqfB/3HugxXhgG/IryNp7d6LN2neUIiKM
	V8hYUOxRyy8MUhB8zq9b084TwOh3XAqkc4qAjrBiaFxn8huPhwlJdEYrszeJ7/byIwnJTV1JVai
	2JTQL1LjoUhLtddSOuy5JEz7/Qr7gwUu8DeRsR/J6SgiujFquFDKjXWV06eiXm7jILx4CWKNKy/
	5ZG6e3vCHJc7fg2RJtQyWBQFwc65t0kz6HPEVLr0iccFmCOuwBGwYR0xNTMs1vJF6p9sfcZfuIj
	a0eWknWdFZnzVW88q94qqB5L+vmrSQfCZXZ9eASDih/YLCaUy9w3NbgeeAd1H/JX763CG2pPYtT
	iLAiuYDRRDcPKU/+/78cK5zCqdO0oOIEVCHgP06H4jF6BJ3KeuefCAY8oBYlBrAjaMt4LtngPLk
	VdtYSLu74LL+B3vgvqZOI5lV20TDHtt7p2ToFjmrjtr8XaTh
X-Received: by 2002:a05:6402:4024:b0:6b6:4dcd:968c with SMTP id 4fb4d7f45d1cf-6b7c0997f8fmr7094170a12.16.1794826872584;
        Mon, 16 Nov 2026 03:01:12 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm21221288f8f.12.2026.11.16.03.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:01:10 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, Hal Feng <hal.feng@starfivetech.com>
Subject: Re: [PATCH v1 2/6] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
In-Reply-To: <ZQ4PR01MB1202C1DD9DE098DB4674A940F27C2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-3-changhuang.liang@starfivetech.com>
 <179475230833.3873592.13070196353304136001.b4-review@b4>
 <ZQ4PR01MB1202C1DD9DE098DB4674A940F27C2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Date: Mon, 16 Nov 2026 12:01:09 +0100
Message-ID: <1jqzgl2g7e.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_030116_975601_3BE56336 
X-CRM114-Status: GOOD (  28.92  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On lun. 16 nov. 2026 at 08:01, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:

> Hi, Jerome
>
>> > jh7110_reset_controller_register() is only tied to the JH7110 system
>> > clock driver by its location. Its logic is generic: hand the CRG
>> > register base to the reset driver through an auxiliary device.
>> >
>> > Move it to clk-starfive-jh71x0.c as jh71x0_reset_controller_register()
>> > so that the clock drivers of other StarFive SoCs can reuse it, and
>> > make
>> > CLK_STARFIVE_JH71X0 select AUXILIARY_BUS accordingly.
>> >
>> > While at it, replace the open-coded auxiliary device allocation, init,
>> > add and release handling with devm_auxiliary_device_create(), which
>> > already implements all of it. The register base is now passed to the
>> > reset driver as platform data of the auxiliary device, so struct
>> > jh71x0_reset_adev and the embedded auxiliary device go away.
>> >
>> > The auxiliary device ID is dropped: every CRG already uses a distinct
>> > auxiliary device name, so the ID is not needed to keep the device
>> > names unique, and it is always 0 now.
>> >
>> > Since the helper now lives in clk-starfive-jh71x0.c, the auxiliary
>> > device names are prefixed with "clk_starfive_jh71x0" instead of
>> > "clk_starfive_jh7110_sys". Update the auxiliary_device_id table of the
>> > JH7110 reset driver in the same patch to keep the tree bisectable.
>> >
>> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
>> > ---
>> >  drivers/clk/starfive/Kconfig                  |  2 +-
>> >  .../clk/starfive/clk-starfive-jh7110-aon.c    |  2 +-
>> >  .../clk/starfive/clk-starfive-jh7110-isp.c    |  2 +-
>> >  .../clk/starfive/clk-starfive-jh7110-stg.c    |  2 +-
>> >  .../clk/starfive/clk-starfive-jh7110-sys.c    | 59 +------------------
>> >  .../clk/starfive/clk-starfive-jh7110-vout.c   |  2 +-
>> >  drivers/clk/starfive/clk-starfive-jh7110.h    |  4 --
>> >  drivers/clk/starfive/clk-starfive-jh71x0.c    | 24 ++++++++
>> >  drivers/clk/starfive/clk-starfive-jh71x0.h    |  2 +
>> >  .../reset/starfive/reset-starfive-jh7110.c    | 19 +++---
>> >  include/soc/starfive/reset-starfive-jh71x0.h  | 10 ++--
>> >  11 files changed, 45 insertions(+), 83 deletions(-)
>> >
>> > diff --git a/drivers/clk/starfive/Kconfig
>> > b/drivers/clk/starfive/Kconfig index bd29358ffeec..51716655554f 100644
>> > --- a/drivers/clk/starfive/Kconfig
>> > +++ b/drivers/clk/starfive/Kconfig
>> > @@ -2,6 +2,7 @@
>> >
>> >  config CLK_STARFIVE_JH71X0
>> >  	bool
>> > +	select AUXILIARY_BUS
>> >
>> >  config CLK_STARFIVE_JH7100
>> >  	bool "StarFive JH7100 clock support"
>> > @@ -32,7 +33,6 @@ config CLK_STARFIVE_JH7110_PLL  config
>> > CLK_STARFIVE_JH7110_SYS
>> >  	bool "StarFive JH7110 system clock support"
>> >  	depends on ARCH_STARFIVE || COMPILE_TEST
>> > -	select AUXILIARY_BUS
>> >  	select CLK_STARFIVE_JH71X0
>> >  	select RESET_STARFIVE_JH7110 if RESET_CONTROLLER
>> 
>> You've switched to imply for the new controller you are introducing later in
>> this series.
>> You should probably be consistent and align this one too. Not in this change
>> though, it would be unrelated.
>
> I'm not going to put this suggestion into the current series for now. I plan to send it 
> as a separate patch later. Do you think that's okay?

Ok

>
>> 
>> This change otherwise looks good to me. It requires Philipp's opinion as it is
>> touching reset too.
>> 
>> --
>> Jerome
>
> Best Regards,
> Changhuang
>

-- 
Jerome

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
