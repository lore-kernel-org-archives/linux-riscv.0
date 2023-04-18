Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10069C77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 18:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0+KlEO3zoKcokVZ3KZ9PrGinGA7K3jNWkrIJr3ZSCQ=; b=tssBp8E1hFtnKC
	LJlLzPwt9TtcMIVESElcKvO7ovG17QN2Gt9HtB3wW81H40TeunkBJjjJXEios3Yit8gAUQJdF/FFX
	Mnteb4th71TTCRd/rFOj/j90IObOG7nan0I9IcUh0n8dYAjYMNr1G2VxSsjAdBEUC8iqiMydZWWnn
	atz8z2eMgUvSAlb0mOwprG6vMKZaeZsIYIAGQYimKcjnmRXB7ed0V93Ysa1EZI2QDcv5NO1jiu075
	Kua2KMc3lS/kD/0XH3x+yxlTp+9dp5iEPfJAONXk8NEWkah4OxzDS36SNmTL5PqYg3SRZDkCt3CMw
	TQS3P6DhJEWnwOk/Ja1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poqI0-0036O6-1p;
	Tue, 18 Apr 2023 18:42:52 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poqHx-0036N7-22;
	Tue, 18 Apr 2023 18:42:50 +0000
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6a5f765d5b8so501045a34.3;
        Tue, 18 Apr 2023 11:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681843367; x=1684435367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eX9q8gX+UiR7CnmbV0JhOILFmnfK5QRyHCsxTtqP7h8=;
        b=QcwoGXi9ll4wD3U8iEnhSFiAC8ho+sL8AiUiWlMmQDNKLLapBP8aBVS1dn7DVX+2CD
         K9IlE4i/0ID6oV0q4kjxda433NOwYrlOrBkS40tA55rM8lArAnTi7JJJJQPbzbHUCo5U
         6Av5CVsYnA3ZYj7Klmxvn+tuDWtX5vhbZpbrcn2k80nU8UGhNcTAf6F1vVBOFIC/errz
         hh245a/sR1uTiMcVGMXQKn0sy1RP4exVV6PkQX7M0UhdSj7yL0XH/8fAfTW/lRbOE+Wx
         jBOmbWxb7yCIX58VgC6cXYYxMYzJK6shCPnJ28Qlb4Utqthr+kdN+sezU21oGRn6Pfkx
         6/Lw==
X-Gm-Message-State: AAQBX9cLN0AFsWynKACnDTyLXhHkO6WwVx7GAYypaDj+128x4KysxveW
	oDD+vjJpz/6tP0nlwfSJBA==
X-Google-Smtp-Source: AKy350YkFGdSrcH78VWgdiZeex/IhpEM1/tIWlB0tUde/R1j0VFPBv9n0B3D5YWlYqCkIfq6XkKf9A==
X-Received: by 2002:a9d:7454:0:b0:6a3:2513:c452 with SMTP id p20-20020a9d7454000000b006a32513c452mr1455755otk.23.1681843367361;
        Tue, 18 Apr 2023 11:42:47 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c7-20020a9d6847000000b0069f0794861asm5786365oto.63.2023.04.18.11.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 11:42:46 -0700 (PDT)
Received: (nullmailer pid 2105101 invoked by uid 1000);
	Tue, 18 Apr 2023 18:42:46 -0000
Date: Tue, 18 Apr 2023 13:42:46 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu <jack.zhu@starfivetech.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: Add starfive,jh7110-dphy-rx
Message-ID: <20230418184246.GA2103246-robh@kernel.org>
References: <20230412084540.295411-1-changhuang.liang@starfivetech.com>
 <20230412084540.295411-2-changhuang.liang@starfivetech.com>
 <8dd0dc63-e0df-8764-f756-da032d9d671c@linaro.org>
 <eb47b7c7-bdbb-92d9-ba39-604ce487f297@starfivetech.com>
 <f6a4fb28-d635-4d99-44bb-d929cb41eef2@linaro.org>
 <b34a8d59-34e4-8358-9d2b-367f4707ca7c@starfivetech.com>
 <f0d82428-aaa5-3dd4-bc29-f1057fe749bc@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0d82428-aaa5-3dd4-bc29-f1057fe749bc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_114249_671722_0C107CEC 
X-CRM114-Status: GOOD (  12.85  )
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

On Thu, Apr 13, 2023 at 10:41:23AM +0200, Krzysztof Kozlowski wrote:
> On 13/04/2023 04:34, Changhuang Liang wrote:
> >>>>> +  lane_maps:
> >>>>
> >>>> Why did this appear? Underscores are not allowed. It looks like you
> >>>> re-implement some standard property.
> >>>>
> >>>
> >>> Will change to lane-maps.
> >>> Yes, according to Vinod advice, lane mapping table use device tree
> >>> to parse makes sense.
> >>
> >> Hm, I have a feeling that I saw such property, so you should dig into
> >> existing and in-flight bindings.
> >>
> >> Best regards,
> >> Krzysztof
> >>
> > 
> > A standard property? Like "clocks" or "resets"?
> 
> Like lane-polarities now submitted to one MIPI.
> 

data-lanes perhaps?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
