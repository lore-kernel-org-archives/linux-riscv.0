Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F58C4708E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 21:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDJi7shlXiR7wtLnjiifUAKoh9Dz0mUkMlSD7hExzGQ=; b=MUIkN/uUg65Dv8
	bcOStMCMAsTDHhzdFv2UQoB0xmRMilxXFhsYGb1xwUhbJGhHN0m6Rd9yvj1hCWjBG/LwEVRMSx6Ac
	J1By618kPdnFbf8MYsOUJR7r/0FBR/m0lRGM7D5OLCG7dHR5bnRqAW6D+0Jv8er5Gw2WtIlc4wJ/X
	VKnRsE2uuuv6YEFYWfTkxnqk7220WuQEywgZtVOsWQuW7FK0ZKE3RIRDHJMIYqNXGcDgDp5gkNbYz
	q1phfo7R5KiNAtD15k5KxvTmRim3iCyylz8x0QJpwRpALFLn7wdHVo8ZkpkOPJUYbrBLMvd7KZ8d6
	qNkCFTQq8twvZQ3sp7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYEX-00FLHD-5t; Thu, 05 Jan 2023 21:57:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDV68-00DgqI-4y; Thu, 05 Jan 2023 18:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Qg9Z/ezQ2VP1OzBT9xNik8ur6PBM8ZeCnIkxjvkNCdA=; b=Z40cXr6huxOVVqXRYbz1yI4s5E
	EsphLsSWeF2EPPnKs/H/Az4nQ7IyuLFyhM+NlsULRpXskStGKXkpSZAnXD8uDdm+4ethA9bwQGgLE
	jQQuxpQDTNPxmPGE+XKwJb1yLQPKqIzgC26uNpaana3fzy67a6Rj4m4V5bsIzP7VHeTYrjsKWM8g2
	DENuRNMJMM/WCh6jGadWpb8KpYKs9RG1Gu2BrY9UNh44SRZHhj52FsvCfcWDIl9eLHOaBAK0nuFQr
	uOsMXvzVpbB6pqxqWdRgLVpA7DBHlPI/RfRFGRRrJP4fXit4AckD2nVKf4XEuQPk1yA2dT+QYIWBb
	isQEdhfQ==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDSwL-001Tk3-0m;
	Thu, 05 Jan 2023 16:18:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso1675148wmb.3;
        Thu, 05 Jan 2023 08:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qg9Z/ezQ2VP1OzBT9xNik8ur6PBM8ZeCnIkxjvkNCdA=;
        b=ZVjIz5m0hX8PlIXMGahJ6x/Csgadc5GJ9Zd+rVumUwtBq99GX7dkkYFL7AZQF1oj9T
         y5ICbFMI9cC6zeXuhiqA9Sacw3BcWcoDBtJ5ON/+Eo5Jq9Vsl4zsRz3qwg3CmjEW2e4w
         W0+bhDkAhXoq22eOKduRjSnsct8jj+IZuszeti+y2cFQnnrmg1tG82ezdd2P0oKcxWXJ
         vFQ6FOezDrkrdLRGk/ZHZLkFZad+7zFnZjbvNVriYgMzTBayde0OMF0UDmoCzDMHrLsc
         O5SkLRr5FLGl+wYpoCxFP5t2txoq+xnRzk4UCXCmxvGjpr4IF7kSWqsFGv4VRXabVJqt
         poBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qg9Z/ezQ2VP1OzBT9xNik8ur6PBM8ZeCnIkxjvkNCdA=;
        b=UbXVgul8uBF5A9jSvaBbddJqcq+L6kp+w14Wihi/w/jZN/3GE5EcwCZH+8QV+t6OjH
         0G2dcWwIn2sqQdDDcrdlzNQ/BegfFOKm0HwZk7SeZ84yE0P2Nncial1be4jYCUCr8Yij
         MZ2lLl7kbXfdlvMt1eHtNeNtELHNsQTlxCkqoFaYQBBQpBwzyqRkB8E/sIvKxpjhYlBK
         Cb+NajataAAq7oVumj4UmEJK9kAR6RWAQR67dNKDZf6bas8zTy8PHJq6JhWmAC7EKeo8
         KVr5bJxhmD32be+AmCfybcZx3bDV7QpraSKrq3dYAgU/kLnwl7ObMvXUW/xVP+KEiAY1
         wn3w==
X-Gm-Message-State: AFqh2krJCiu4IjA78XQKszSsPd09nVcJhHAFfInqvnUBtsUSFxJ9jpiU
	fqwijqNb4FHP5tu9O7N0YUo=
X-Google-Smtp-Source: AMrXdXvGqO38SjpeDx+nQ5mO3gltv5DwVHr3T+e4+/rn3MECG1cCKPkwM5HXIKyWHVlh4HQG9zupiA==
X-Received: by 2002:a05:600c:4e13:b0:3c6:e63d:fcfc with SMTP id b19-20020a05600c4e1300b003c6e63dfcfcmr36682966wmq.35.1672935484869;
        Thu, 05 Jan 2023 08:18:04 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id he11-20020a05600c540b00b003d359aa353csm2779923wmb.45.2023.01.05.08.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:18:04 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
Subject:  Re: [PATCH 1/4] media: dt-bindings: cedrus: Allow power domain references
Date: Thu, 05 Jan 2023 17:18:02 +0100
Message-ID: <5891785.lOV4Wx5bFT@jernej-laptop>
In-Reply-To: <20221231164628.19688-2-samuel@sholland.org>
References:  <20221231164628.19688-1-samuel@sholland.org>
 <20221231164628.19688-2-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_161801_507651_5E88E8F5 
X-CRM114-Status: GOOD (  14.36  )
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

Dne sobota, 31. december 2022 ob 17:46:24 CET je Samuel Holland napisal(a):
> The Allwinner D1 SoC contains a separate power domain for its video
> engine, controlled via the "PPU" power controller. Allow the
> power-domains property so this can be represented in the devicetree.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  .../bindings/media/allwinner,sun4i-a10-video-engine.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.
> yaml
> b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.
> yaml index 541325f900a1..d5be7f604e8c 100644
> ---
> a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.
> yaml +++
> b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.
> yaml @@ -63,6 +63,9 @@ properties:
>        CMA pool to use for buffers allocation instead of the default
>        CMA pool.
> 
> +  power-domains:
> +    maxItems: 1

Please add check if it's needed based on compatible. This yaml is one of the 
few for sunxi platform which doesn't have strict checks. Same goes for sram 
property.

Best regards,
Jernej

> +
>  required:
>    - compatible
>    - reg





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
