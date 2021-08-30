Return-Path: <SRS0=zS8+=NV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF72C432BE
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Aug 2021 15:10:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D27960C3F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Aug 2021 15:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D27960C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jjp7VWaxKu2ZFWW3ASUD6LGtpm6HpkG7TXiM3T1NbM0=; b=j7LabU0j+xcvtx
	SQ0cMYQtpf4HBVUjyEWCWo7VdE5TiQvuKAiUbFfHpkOVLvS+UFCfN9ffi1fUmTXl4B+rxV/0odHXx
	PN3J2WYZY9az2am36piEdu32dU+69I3naXN7k4cFdfQ6vtkbkz4xM9c3KwJPMnlhV+p10TMUM+v8D
	5VwqfnKlf+e5o2Ukz3orFmT2TXcRqS7/sbj/+nU9D9BQUTWfv9NkLLuNxuzuYiiWWFrBJUwg2WnwI
	oqlZ18LVBgmaCtgC6axYy2q1VVrRz3SAg/3PLOiieKUEs02Uz7THUMkD4er97iBrZQ/lYbNql2APJ
	0aPRuLbltmZz+oRBKzXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKiuy-00HVOJ-27; Mon, 30 Aug 2021 15:09:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKiut-00HVNm-AR
 for linux-riscv@lists.infradead.org; Mon, 30 Aug 2021 15:09:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C49A860F5C
 for <linux-riscv@lists.infradead.org>; Mon, 30 Aug 2021 15:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630336182;
 bh=wsc9RNKxQkmls5vCsAO7AtLZpw0ffp68hvKWafxByBE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=e4zlaCA0cxDDd7LNEjQhW9oaIXMt1Rq1/MRUI6P3+IL4hHs48K2mV2/KpVaxIKDyl
 L+d+x3N/ivB9QXcgKliqQzo0yM0RDi76df4LOaKUHU+QI8msERS5s8ydMVn3NaRwty
 TxF3v1OQ8p5SrzbgAH9UsBiDwMcFhJtqBzPzJ/tgC040AYu7nujLA3ExeWtdshzpQF
 wiV2AS5CkUjIydDK0uFsUsnE6mv91t+L7w7uW9rv3RmuM/UXnexT8QOb+hzjlVxVb8
 TY6+U0dObG2m9NNYBT6IO1qhNicEjh8Yz8gTyw2e8fOwH3kMDFjmvv4m/I7og/LGXw
 aYRFzvlGdKBLA==
Received: by mail-ej1-f45.google.com with SMTP id t19so31829013ejr.8
 for <linux-riscv@lists.infradead.org>; Mon, 30 Aug 2021 08:09:42 -0700 (PDT)
X-Gm-Message-State: AOAM532KaI7RNaJ4BDSfdHlve6vFmHaQ0tsxEgCS+lVIrhU5rYU7pKKh
 T4v2HfI+xFO/w6FPnNLBT0LAt+7xkqTf9R9O8Q==
X-Google-Smtp-Source: ABdhPJzl1EsqiJCWv1IXdEPt9qKg22NWFB0gUwARdXlndzryzwnHbKAOddbGyjkT62uyPXgbclcQa3gbHOE5Lt6TpME=
X-Received: by 2002:a17:906:b4d:: with SMTP id
 v13mr26171264ejg.468.1630336181386; 
 Mon, 30 Aug 2021 08:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
 <20210819154436.117798-2-krzysztof.kozlowski@canonical.com>
 <YSUDTSuNlsOmu/G+@robh.at.kernel.org>
 <9423ddab-4635-ea15-7a9d-dbcf1bc215dc@canonical.com>
In-Reply-To: <9423ddab-4635-ea15-7a9d-dbcf1bc215dc@canonical.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Aug 2021 10:09:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKU4opYerjxXTnAuouLc5-GQQKnPX+qZEMBuzYV-inmJw@mail.gmail.com>
Message-ID: <CAL_JsqKU4opYerjxXTnAuouLc5-GQQKnPX+qZEMBuzYV-inmJw@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: mmc: cdns: match MPFS MMC/SDHCI
 controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Atish Patra <atish.patra@wdc.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Yash Shah <yash.shah@sifive.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Piotr Sroka <piotrs@cadence.com>, linux-mmc <linux-mmc@vger.kernel.org>, 
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_080943_422077_137F7CA2 
X-CRM114-Status: GOOD (  13.94  )
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

On Tue, Aug 24, 2021 at 2:02 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 24/08/2021 16:33, Rob Herring wrote:
> > On Thu, Aug 19, 2021 at 05:44:32PM +0200, Krzysztof Kozlowski wrote:
> >> The Microchip MPFS Icicle Kit uses Cadence SD/SDIO/eMMC Host Controller
> >> without any additional vendor compatible:
> >
> > I think the lack of vendor compatible is the error here. Experience has
> > shown that vendor specific compatibles are needed for licensed IP.
> >
>
> In such case this could be:
> 1. a specific "microchip,mpfs250t-sd4hc", which
> seems to be on MPFS Icicle Kit:
> https://www.digikey.co.uk/en/product-highlight/m/microchip-technology/mpfs-icicle-kit-es--polarfire-soc-fpga-icicle-kit
>
> 2. or a generic "microchip,mpfs-sd4hc"
>
> Any hints here?

Best for a Microchip person to answer, but sure there's some existing
compatible strings for other blocks on this chip to follow the same
pattern.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
