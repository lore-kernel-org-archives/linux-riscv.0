Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7D0C77B76
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 20:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nlVIAwBIr6BtHG1IqyhIBrd1vFLlG+S3fG6/j+6CwM=; b=kQ240K/gJQzYO0
	tgNSlbjh2F7k3DE1BaWc3ZT/uD8O62lrKxP6V1Q15hAby43iLeUuJqjE7Yf/+RKsWgg+B23UrFJI9
	waGcS+RMOL4tTwec6Sst62IbuZL293+RaLxeCAcVoeozkoGpqkXY0VqTay0fCxA/HFbWHrHjaRv8T
	XX49k+N1HABo7t+k5B1iTuyylLUf4SZwhhg01Ul7ju7CL9YKsewt13wSpgvR1YTErQ8CC1pwPx/ow
	dna0D5iWt6IrxSDBubUTDOyMrXAh91dhW/j/9/m/6MD8s+7UNQz0mqC3ZY6Ywfo5p0lS95B1WzfIG
	oO+uv9Z/zPoSGtLbt8JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poVbH-00HYBE-1B;
	Mon, 17 Apr 2023 20:37:23 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poVbE-00HYA9-1U
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 20:37:21 +0000
Received: by mail-ot1-f52.google.com with SMTP id k21-20020a9d4b95000000b006a5f3eeb94aso995069otf.10
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 13:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681763838; x=1684355838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7K6w8N+4yFsxz5r0OgTNWCI92V9EYta831Qdn5G1Wk=;
        b=XjCQu0iuPdiHlI8TAEYt5bBIDRhXDo+qAnBzWyr95mhoj6Glxkn2o6XtwgcFaZ3Oy7
         Jxam4ExmzaR3LewvVyEElyvXAX9Pl8P9xnZMJy0DJMSvX63na3m2lvqmP25aTR7Cxeia
         wBpRUlhBWo7KKbXkY1H3B9xHRAYS2wOu3PBxLbGIWP1GFYhDiLVQJD3UZYm6YBVsCXvU
         Eonwt4o+KsOMFbR7g8uy6HR1mN3APsI11Yievi8ErN/Nl1yLAPrPlxLrHfF19H0kJUsh
         073Lz2kppWJL8CJltozu9JZmP+m86iiM5Y5xQ8luQSst7PtmP4orqXEmGHxy21ALEHtz
         XzkQ==
X-Gm-Message-State: AAQBX9f7cDZzMOH29emei2DFITBXuWbWrzAbXONq+JDudkMw585Ez9n3
	e6fhyNlNFaEzVr2lYVfXsQ==
X-Google-Smtp-Source: AKy350ZSHvCTM5I55QfWpHLncSSzBNmF/jwP8c/i+62gJguXKk4sRPO02ecUbtNpycoowLqEuS/oiw==
X-Received: by 2002:a9d:5614:0:b0:6a5:ee4e:e3fa with SMTP id e20-20020a9d5614000000b006a5ee4ee3famr1619791oti.15.1681763837629;
        Mon, 17 Apr 2023 13:37:17 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h24-20020a9d6418000000b006a44338c8efsm1985727otl.44.2023.04.17.13.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 13:37:17 -0700 (PDT)
Received: (nullmailer pid 3328454 invoked by uid 1000);
	Mon, 17 Apr 2023 20:37:16 -0000
Date: Mon, 17 Apr 2023 15:37:16 -0500
From: Rob Herring <robh@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, William Qiu <william.qiu@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH v3 5/7] dt-bindings: soc: starfive: Add StarFive syscon
 module
Message-ID: <168176383573.3328400.3537476032397551479.robh@kernel.org>
References: <20230414024157.53203-1-xingyu.wu@starfivetech.com>
 <20230414024157.53203-6-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230414024157.53203-6-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_133720_496794_04A3BA02 
X-CRM114-Status: UNSURE (   9.28  )
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


On Fri, 14 Apr 2023 10:41:55 +0800, Xingyu Wu wrote:
> From: William Qiu <william.qiu@starfivetech.com>
> 
> Add documentation to describe StarFive System Controller Registers.
> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jh7110-syscon.yaml  | 58 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
