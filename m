Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BE7C7EE2A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 16:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FaQvLuvxbeMkxMQ7yZR12ezuUTE4xD0MwiLGDzVMW10=; b=QYLf381zu7S/rE
	Rc1NvYetA3qU9uuu9IzBh46lPwR5Q9kTeZHAzToKFQ4RURWjlYP1gPhN36Vy9ggLW0df7ztgIliRc
	6TgdTQusGvw+vdtGeZJqPu7f2QOl2/PNg/MgqhxQv+riUojnCcSK3GhRvwvCQ1v3AaO6TewrSWSK+
	GHwrloQonWXa6Ab50jbtxuf8546AKrVAtxMu1PXUpg0SalHj9XcZF2l8PR4WhIHJ1g0DQYjYTo1cv
	p3T4DEbNHWVHiZD3beXlxvJ9ggj011FDbiD7s11uLHMpMcfhbnY24DhosbJ4VuTgX3khoJU49R/It
	a9xYbNJhu5QVHWoQ6xqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px9KL-009O62-2L;
	Thu, 11 May 2023 16:39:37 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9KI-009O54-2l;
	Thu, 11 May 2023 16:39:36 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9661047f8b8so1215946466b.0;
        Thu, 11 May 2023 09:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683823173; x=1686415173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1X+KxaJIVgVYeyuNeujb/8uBRFLjXmO+GYF9SJ60beU=;
        b=Ma3S9GWfat9WnqrYyoHgo5dry853rcAt7P66kj6bNzlHIiIB+6Y/+u0gBYDLzcuSdu
         vT1NW6MdOAyowFiuwWrbGQUGRLvowFSEqjZQw76i4sNrDKXSSMTY6DwL5LTHaU0GNNfP
         46M8g1qCVkRdo+8/WCCNVM5ooDFEVCo6Fxjexl3Hzbo1ZY3rKp2tqkTiQRwtVqcnmwCW
         Lo9afas3hvNaSz8vp/KNwWiBK2QlCfuxc7kO9HFgyIJK3hawuFkfV9U9Ugn4Sj/XiMt8
         lKxG3hjb95hmBIakmQqo8CVQcVhnhtqdZyNtn12O5VmFGMAqRgwEcehYILx/HtRJvH5f
         6pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683823173; x=1686415173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1X+KxaJIVgVYeyuNeujb/8uBRFLjXmO+GYF9SJ60beU=;
        b=h8GfJMGFLNXHTg/z6zXUH+F+nvu8r8y+kaIvkDa5gdrx4kO0Ts0ytnOwQdqgYrx8kS
         d1RscuuS0McsYioSlNoYGL2o8r8lqA8NhR+K0E+m0xHaDr+KsMh0vJ5nv+AIzySlcPC0
         2J5XHFgKg8oESGUUiINK4dsbZEvES+AuzMeN2DdKaYzlh96C0P0lvd/p0dggtyzdoOHV
         WzuJFDnCvWIzEBCGgFj9fdjc27dPz+4dlF+kMWhPelHIxiiCRY0NmyeJB0JFlvnHWoXp
         LJulIlKJI0y29NY7q4ZclnHbycirI3VLroRFr807RQHmQ790Wgtm5Re/Yo3wZlw2DoNR
         dXLA==
X-Gm-Message-State: AC+VfDzIiSfBif4+zxxDUfao7QaGo1l0QQZBfxEPJuwFYwquwCAuKalm
	p8fL9u3OSWZl70DNUPei22E=
X-Google-Smtp-Source: ACHHUZ5wFJGKUF0ZD6faiGAglKWn8oRRHvDFWFpErE5pc3yl110oDTNxwsggOt4RFsmN3fJSCYNXQw==
X-Received: by 2002:a17:907:3f25:b0:969:edf8:f73b with SMTP id hq37-20020a1709073f2500b00969edf8f73bmr11308254ejc.60.1683823173131;
        Thu, 11 May 2023 09:39:33 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id t27-20020a170906269b00b0096616aef7e5sm4339459ejc.149.2023.05.11.09.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:39:32 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
 Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Maksim Kiselev <bigunclemax@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 2/5] spi: sun6i: change OF match data to a struct
Date: Thu, 11 May 2023 18:39:30 +0200
Message-ID: <4268659.ejJDZkT8p0@jernej-laptop>
In-Reply-To: <20230510081121.3463710-3-bigunclemax@gmail.com>
References:  <20230510081121.3463710-1-bigunclemax@gmail.com>
 <20230510081121.3463710-3-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_093934_893904_C586D51B 
X-CRM114-Status: UNSURE (   8.74  )
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

Dne sreda, 10. maj 2023 ob 10:11:09 CEST je Maksim Kiselev napisal(a):
> From: Icenowy Zheng <icenowy@aosc.io>
> 
> As we're adding more properties to the OF match data, convert it to a
> struct now.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> Reviewed-by: Samuel Holland <samuel@sholland.org>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
