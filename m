Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FE4C77B76
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 21:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PlZ3KU0WKU+H6jJRn2T3X214nZWWFl9mZ4+YsV4/oys=; b=2cnvhatNybz282
	mQ05ykiN3MAu5hoV2Oot4klK0yGgKg2dws0itQ03xdzM+FcIEDgQ8KjiVn32rNNF/BAhzCIF6U+JN
	hFl0NH3Pe0uJVD3VEP2HV9wIVJgI6q98p7QICHO0SzYPJYTnVVVbtvXIQDg4Kbtrdtf1MQ9K2vcjx
	al84ENh2c+iohMZwS1skMtF0lRr6eUZdl9J4+vBq+TPwZkBetRXNEFKOWCRXVISLfSyxSi0f179yZ
	AiiV+Jd9ect31vxyf4Ebx3Pwea9w0HgCjvG5a+iNwsImjtur3RnGoYlk2OG+67ZBJFgxX4FOjwv6R
	7I/muZtXsxr19U90E6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppyEY-00BsIO-1H;
	Fri, 21 Apr 2023 21:23:58 +0000
Received: from mail-oo1-f52.google.com ([209.85.161.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppyEW-00BsHJ-0O;
	Fri, 21 Apr 2023 21:23:57 +0000
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5422726207fso770751eaf.0;
        Fri, 21 Apr 2023 14:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682112235; x=1684704235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbaXCpUXe4iUKhx65n7G15ksj7GhXIVMeVUGx6UoeCY=;
        b=Rl/kqrXYkbooCjv3XZkm+Yxgc9uw1ic/DJ3GYA0K87W34OA9zx4SH0Eul7Egp6wM8U
         K5WdkZVcbu+B5DFpS4agxzN3SiZI8J6KVtnAsbq0IY5zMfvzzu5ugpzeI2O5Tt6C+TQ7
         wIHycYtuLoUKlhBojoQa9N06Tob9PeUj0vckhkCKO+6EyP5akaZcCE9U9RjrMQ6K5FH4
         M/wx9B58+6y04L10WuCBjqG2t4rx6L2oGk0IJjT//e1WTh/Y1h+Hx1pLtzefm8ptO3Nu
         ol5p/T3XHkhhO6zmC534dlEF9VCklcD7Wj/f/hLg7vrJkHB4qGxzvMhqhCBj4bx+f34J
         Evgg==
X-Gm-Message-State: AAQBX9ehPuqJS1VK3LNMm6klQFm7tIK3wqPy0OUz4K6jRzg/2fIcS5NM
	DkkE3O/W1VfOebKUQAXN6Q==
X-Google-Smtp-Source: AKy350bHXXS6OurY5nmMtPS/MaZh5XGH97e5KRD0bzQucEfG8t+AZTkCzTlqn5WIELiRv7gofzvDNA==
X-Received: by 2002:a4a:cb1a:0:b0:547:6879:e9aa with SMTP id r26-20020a4acb1a000000b005476879e9aamr549944ooq.5.1682112234455;
        Fri, 21 Apr 2023 14:23:54 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q123-20020a4a4b81000000b00546daaf33cfsm2156853ooa.14.2023.04.21.14.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 14:23:54 -0700 (PDT)
Received: (nullmailer pid 1785271 invoked by uid 1000);
	Fri, 21 Apr 2023 21:23:53 -0000
Date: Fri, 21 Apr 2023 16:23:53 -0500
From: Rob Herring <robh@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mason Huo <mason.huo@starfivetech.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Roger Quadros <rogerq@kernel.org>, Pawel Laszczak <pawell@cadence.com>, Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org, linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/7] dt-bindings: phy: Add StarFive JH7110 PCIe PHY
Message-ID: <168211223285.1785232.7377797349982243568.robh@kernel.org>
References: <20230420110052.3182-1-minda.chen@starfivetech.com>
 <20230420110052.3182-3-minda.chen@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230420110052.3182-3-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_142356_163918_6E768D5B 
X-CRM114-Status: UNSURE (   8.98  )
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


On Thu, 20 Apr 2023 19:00:47 +0800, Minda Chen wrote:
> Add StarFive JH7110 SoC PCIe 2.0 PHY dt-binding.
> PCIe PHY0 (phy@10210000) can be used as USB 3.0 PHY.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../phy/starfive,jh7110-pcie-phy.yaml         | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-pcie-phy.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
