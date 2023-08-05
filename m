Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E65C001DE
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 17:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1oahsMweSRe+4wGuTBIWmNG57EBCY6TyAUmm/Vax0I=; b=XQ7myrm92TgfbH
	wVnOVY36nwaUemnar3/lUIlyXdbRuthZNtiG1wd468dsB4H+gBFl/Kd2uFAn0NOZrIN3tiuUCcOf9
	ZjOtNy4k8jpeUkB9iYbET8OU0MDNpGjhPyPVM5ROnmrrJj+On7qg/xYcTD48846F7tuU/eQgaczjz
	+mS3yT1W7UZgtqGDPF+Jiz0s+H7dUYyfqZ24AJGo5T0I3UJVQ7N2nTvjSDCH2K3IVVNYUgmt2ydMa
	LNqqXM2oMm7K8+LvrIM1bFkNQWQtIG13r/xi8rIKh6YMgS+mt6hDqC6Cl7yGVGmkkne7zitxJpUJI
	N9oY4kqWWsHw5XBMNnNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLPc-00EPwM-0L;
	Sat, 05 Aug 2023 17:50:00 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLPZ-00EPvq-2R;
	Sat, 05 Aug 2023 17:49:58 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99bcd6c0282so450153766b.1;
        Sat, 05 Aug 2023 10:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691257793; x=1691862593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYJH/1P//NwsKipiDkgfl/z4aZz2q+xkqCsqTOu5Bf0=;
        b=j/mPVWvYXvbo/U83l1AGEhWBbnbL5ajrpLlTTSCXbdaJLSvpWA8XqfqCvpKRezoFL4
         GDCsmSuw4dObYIn1NQHIrtO7ZljDdV247wdhWW9+Cpfz688iwYU7cQKJu8T7/HeszQsu
         +gOMBaXAsF7foZDrq8HVld7TYkXDQW+G3tzwyD91WjNo33t6Kge2uh7vGnl85cJX+P2T
         V62JC9p/sXMehHtY70AFIe2oLRP5xx/e6aaK28Uh53j+ytu8bBbd8/iOo+q7pwuDOAcS
         7egsQyG0sDLHfjw1HKaoZ1wV0CIE8QTdpfWHlZNK7w4Krg8Mxi8EMbY2Url/mmGqVuOu
         4Rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257793; x=1691862593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYJH/1P//NwsKipiDkgfl/z4aZz2q+xkqCsqTOu5Bf0=;
        b=eB7fOZo3T+Ml3BAlTp77qYBjJISuZakuNoxUovOsivyRxWT1lBn9qjPhSKR/VOvfZq
         NsjNN6E0Bd6dflJEVUEm8K/1zQfkIfAmzb9mMjFnw0x91BWXcNbridarkK5jdWltjiJS
         Qn6rUvohgtS9NF569gT81+oc5jAhb0tvJwAr7COubFLExePQq4QKDpv2LVRvACsgvj+x
         gfqmcqV37Tfc/AlUzVWpNglNzHWh9oFzIGSGF6u586tY3EpS3VmuD2pnMt2noW3rhjoM
         Sxf3PeySqXBhResDfS9/MGdPYuEZZi0dgVOknMxcI6KH+E4xQdCWRNMfxdTeNC1zqgJl
         Adew==
X-Gm-Message-State: AOJu0Yy3nqu7gN71vP2Zgi/a7hwM0LgyzW7vUCk16ERWW7hLFxnCM3tc
	ux/8eP+8umLSSd6Vbv4GFNw=
X-Google-Smtp-Source: AGHT+IEj+JsLAYsRvKq5tljy3+gyroq6CmwWB5RDT+QP3IP4h/PpnBkxNteaPS5GTU473Jm9OxjtOg==
X-Received: by 2002:a17:906:14:b0:98e:1156:1a35 with SMTP id 20-20020a170906001400b0098e11561a35mr3934964eja.74.1691257793309;
        Sat, 05 Aug 2023 10:49:53 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id f8-20020a170906138800b00992ae4cf3c1sm2938044ejc.186.2023.08.05.10.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:49:52 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maksim Kiselev <bigunclemax@gmail.com>, John Watts <contact@jookia.org>
Cc: aou@eecs.berkeley.edu, conor+dt@kernel.org, davem@davemloft.net,
 devicetree@vger.kernel.org, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, mkl@pengutronix.de, netdev@vger.kernel.org,
 pabeni@redhat.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh+dt@kernel.org, samuel@sholland.org, wens@csie.org, wg@grandegger.com
Subject: Re: [PATCH v2 2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
Date: Sat, 05 Aug 2023 19:49:51 +0200
Message-ID: <2690764.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <ZM5-Ke-59o0R5AtY@titan>
References: <20230721221552.1973203-4-contact@jookia.org>
 <20230805164052.669184-1-bigunclemax@gmail.com> <ZM5-Ke-59o0R5AtY@titan>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_104957_815228_F668678F 
X-CRM114-Status: GOOD (  13.01  )
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

Dne sobota, 05. avgust 2023 ob 18:51:53 CEST je John Watts napisal(a):
> On Sat, Aug 05, 2023 at 07:40:52PM +0300, Maksim Kiselev wrote:
> > Hi John, Jernej
> > Should we also keep a pinctrl nodes itself in alphabetical order?
> > I mean placing a CAN nodes before `clk_pg11_pin` node?
> > Looks like the other nodes sorted in this way...
> 
> Good catch. Now that you mention it, the device tree nodes are sorted
> by memory order too! These should be after i2c3.
> 
> It looks like I might need to do a patch to re-order those too.

It would be better if DT patches are dropped from netdev tree and then post 
new versions.

Best regards,
Jernej

> 
> > Cheers,
> > Maksim
> 
> John.





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
