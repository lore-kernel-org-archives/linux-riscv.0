Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BDBC77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 13:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgCQqq0FVvnFnVtdsH2R/GmzRA6V6xkEvyN3lMK8/oA=; b=IALN67mok4u7PO
	3hxUkSQpF22KvlBamJJU39LKoNksiGOsdbQxtHDT5zc6Fx3e4ZdH9TOwwDmy/+G01yZtlBQckcuuN
	p+7KdWaVHcPaU6pQdXTS0QH42N1SX2lQnj/HeIJC76JqjOCAefFNxf/kdx5GuB5incen5yIy0WIan
	LuayMHBanVucfJthkbeCeqVVYIvHRdt+DbwKQs+5b88HonwPbKSe6XgVf0YCyXAjd4cKO1CddGsMf
	w/BzHcq/lcLhETPo26TNSzRZVHAqwS1g/bp1dJHpaBo58QMy5VhGjQH8W+B7qUJlEF9s7uZMvaV8R
	AsWj54N7zWGlp/DY3aqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q00c8-00GR1F-1H;
	Fri, 19 May 2023 13:57:48 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q00c5-00GQzf-25
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 13:57:47 +0000
Received: by verein.lst.de (Postfix, from userid 2005)
	id B229168C7B; Fri, 19 May 2023 15:57:33 +0200 (CEST)
Date: Fri, 19 May 2023 15:57:33 +0200
From: Torsten Duwe <duwe@lst.de>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	yanhong.wang@starfivetech.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: Add StarFive JH7110 PLL
 clock generator
Message-ID: <20230519135733.GA10188@lst.de>
References: <20230512022036.97987-1-xingyu.wu@starfivetech.com> <20230512022036.97987-2-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512022036.97987-2-xingyu.wu@starfivetech.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_065745_852418_887D8E41 
X-CRM114-Status: UNSURE (   9.57  )
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

On Fri, May 12, 2023 at 10:20:30AM +0800, Xingyu Wu wrote:
[...]
>  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>  #define __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
>  
> +/* PLL clocks */
> +#define JH7110_CLK_PLL0_OUT			0
> +#define JH7110_CLK_PLL1_OUT			1
> +#define JH7110_CLK_PLL2_OUT			2

In U-Boot commit 58c9c60b Yanhong Wang added:

+
+#define JH7110_SYSCLK_PLL0_OUT                       190
+#define JH7110_SYSCLK_PLL1_OUT                       191
+#define JH7110_SYSCLK_PLL2_OUT                       192
+
+#define JH7110_SYSCLK_END                    193

in that respective file.

> +#define JH7110_PLLCLK_END			3
> +
>  /* SYSCRG clocks */
>  #define JH7110_SYSCLK_CPU_ROOT			0

If the symbolic names referred to the same items, would it be possible
to keep the two files in sync somehow?

	Torsten

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
