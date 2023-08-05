Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FFDC0015E
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 16:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=au/7WJMrbG39WNkV8dVkZPPKzMk+W4mvz0tK8VfxHPA=; b=mZfEoYvKA8t9Af
	15Mbtln7cOfZf4cmKD62jcww9AQBuaSEXSdFen1bdcHn/Wx6bCoe8/dHm07/I6/xtsU8g0XZ7fpT8
	kYsyC81IJ80RUQmNGLXQz7AZcLSfnl8rlaMa+261elua7zMk3N4blI1SEHG2tkttYSsx/yIYqXqva
	eA/HPmKaoBMJENfHRtkiJTnCiIwJsK/4bmyuG7v4BVQ8vSzto6dsGXK4MW0tv3oh2wlELgfmcsFQY
	vB4rN7mg0KZ9y+Y4Ks5GBoOXBXMdpSGHZWlj7ZkjvuvXfwZtUg6j0x4l6HkZwkeLwYd+1e1OKPJSG
	rL2e8iNsL93BLOTkPl6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSKKt-00ELvs-0r;
	Sat, 05 Aug 2023 16:41:03 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSKKq-00ELvD-1O;
	Sat, 05 Aug 2023 16:41:01 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9bb097c1bso48272831fa.0;
        Sat, 05 Aug 2023 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691253656; x=1691858456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbgbFpQ5CS8b/Xg24dFI86ayyuiWeSuGucCXchMse2g=;
        b=c+FKwgy+65CRVJA5AJKwke6ZlNOixLM+hZxnft7Tzni9BU8by5Ye/LJcjR2gGI6vVK
         AHGnHGrb5hekJ/uzdt0KNvCkW/nIvxG5CKbhjdSLRSnJfPPZcg7Yo7wyY2feKGSRzDcF
         4vHsPI8W3cK+xasc0WDwMnBcjIdQWfaKbJ+P7/tlZl3XxnNKDbo+hXD/v4ydPa0ICFX1
         0FMnzqNmLlT79FGtHkN+D4l6mViOFIgdZ+4QKFHsmxsQF3tkVS6grXUNICMJ0GjnW5VS
         S9YsACtc/SdqXBxoQAZuGqoO+iF88NgFGMZgX3YP4lLXqyoT1vurhqKpHsEYSEBlrp8C
         IAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691253656; x=1691858456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbgbFpQ5CS8b/Xg24dFI86ayyuiWeSuGucCXchMse2g=;
        b=U9K22OgjACyiOAzZsPyaxgTGQrmnjv/OLO2tdBR5TZrtM6NL5GinyddmggKS7UsCPL
         d4eF9Uihv/bSATB8PtrM7YH3FQ5bwFum32UkI2tuthesu3y/7CeE5O5LxAuY7b9ZpPE6
         QypYasaGY9xlkoDOmdUfFVTGrV9sDmXL67Udq9LC+fP6s5fTEkzDdHPDrgOL2lk+H3TI
         yCKK4OCpoLbNxBJwDo3a8yMZ6pjDqz6iPFYAx7yTm0fkkhoJtstC05Bsly2lyfw7WFrX
         OZKkmkeYnUgs2c1692BqAUCEEPac9I5Yjy/nkXw0V0o2EYN22VfifEFa9AMzHqvjouug
         DRSA==
X-Gm-Message-State: AOJu0Yx0dRlPLVOZrP/ZBYkK/gArUyBwEOVyfevFR3BuynTjDw9n3zLG
	RfUbC5J4nqgvZO5rj3xm0Nw=
X-Google-Smtp-Source: AGHT+IGAyWnZC1HC2zk0RuQ75eTsYcDjPBSvhuYz3lE2Z9xqqgVdLPS76IkbuMZuD9syyfUlKS6iew==
X-Received: by 2002:a2e:9c9a:0:b0:2b9:ecab:d921 with SMTP id x26-20020a2e9c9a000000b002b9ecabd921mr3847745lji.18.1691253656345;
        Sat, 05 Aug 2023 09:40:56 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id v3-20020a05600c214300b003fe407ca05bsm6762335wml.37.2023.08.05.09.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 09:40:55 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: contact@jookia.org
Cc: aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	edumazet@google.com,
	jernej.skrabec@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	mkl@pengutronix.de,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	samuel@sholland.org,
	wens@csie.org,
	wg@grandegger.com
Subject: Re: [PATCH v2 2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
Date: Sat,  5 Aug 2023 19:40:52 +0300
Message-Id: <20230805164052.669184-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230721221552.1973203-4-contact@jookia.org>
References: <20230721221552.1973203-4-contact@jookia.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_094100_492215_2A02DD51 
X-CRM114-Status: UNSURE (   8.47  )
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

Hi John, Jernej

On Sat, Jul 22, 2023 at 08:15:51AM +1000, John Watts wrote:
> ...
> @@ -131,6 +131,18 @@ uart3_pb_pins: uart3-pb-pins {
> 				pins = "PB6", "PB7";
> 				function = "uart3";
> 			};
> +
> +			/omit-if-no-ref/
> +			can0_pins: can0-pins {
> +				pins = "PB2", "PB3";
> +				function = "can0";
> +			};
> +
> +			/omit-if-no-ref/
> +			can1_pins: can1-pins {
> +				pins = "PB4", "PB5";
> +				function = "can1";
> +			};
> ...

Should we also keep a pinctrl nodes itself in alphabetical order?
I mean placing a CAN nodes before `clk_pg11_pin` node?
Looks like the other nodes sorted in this way...

Cheers,
Maksim

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
