Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910A1CCA473
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 11:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwli0NauNzWwgLk/ubB8WoWJ3q0F066TE6BgAPFE8PU=; b=PevKfXPx50spGB
	+NDz/63IaJu8DoyCxgfAP/2iZGTeNvsJc6Jfh2HJsEFrpAvJ3zLxqJHWmlnR/Poxcb8QbXtr4BtAX
	dbE6jBCRHcohOy+5al5lvhjbMOiaBiqSU7bZyurPCzZMCL6TddmoF17NutdACUDbzwQfjaa9WCAbp
	jp75BFXGy2iTHwz1hD5C/a2DCXG3/M1rQCtHILV8pZcZCUDCl08QfvOc1pWhttbAXbLW7qPxgdoIk
	qloKKlwITkqaJgDs5aYD0cgWZTuAJXMEne/BQ73K9scqcIpKI//TvEDx7UkXkEIPDdBnPUfGhjEQO
	3JpEQOEw+vQo+59i3RqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o93ct-009kPV-FE; Wed, 06 Jul 2022 11:55:27 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o93cq-009kNN-FK
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 11:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1657108524; x=1688644524;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9/V+jeecOKQ9buv2Jjb6PxTGk0efO8S6cyBl2B3zFEA=;
  b=Vi35Nxj+cVlT5+uju417h+YQCNBZCj2vNGTZHo1aPujAt00LpuUncISM
   7QsGBftpoQxtuYuBhCHSTnyF2ReAbfVvtSsGpa89HTTksNbZhKjHGSAto
   HGvsKMh1Lx7q4A1NfjMfHPqhxf9wSVLCFwNJnyOEK3J9e/wTz7LgWVOZx
   jw7OLHuKYKNNpXTct4L7b/+N3TfXjFsEqaJj/mCZIOMLS5nHnZRDIIkIi
   la2vQxnwf85usyvA+Ww0esSys42FYiEcH1QOWMFR7qOkUZr/4G6KjAAD7
   AmVtQ9FXu6PLtivflfPQ3CxcmHN1HzXPoti37+P9sMxbTxCZzDmmVfq9K
   g==;
X-IronPort-AV: E=Sophos;i="5.92,249,1650902400"; 
   d="scan'208";a="203633484"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 06 Jul 2022 19:55:20 +0800
IronPort-SDR: mKL/XSp97sSmqlbVevcR996y3V8JVearrBmOxDTTJsLvJzo85d4sWiav4A8pSgW54GQ2vEbaxO
 QFgW6rBql7EldfDZvioGfF4SLQyvPsyiUT/4+ZX5SKgfZX2J9jMnJUoWZ89UlJT/W8tVAQn1Rp
 lVu4F4ZVIyGSlp/Y/PPFuVyH4mOv19pWE9IFqCXZM1/QmTknfwvIa2NXNE0P8dZVUkiw5N8/Sl
 Uac/Bn1rz/grIzs6SYHPxMHzT7dUKJHHwRR6WKhHarfvKnY1bBQV9gbf4QuFTOd/i5K18s6qeM
 PXrmkshwsb89Y23ie8r8FK/T
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Jul 2022 04:12:35 -0700
IronPort-SDR: /WArLtkXrtfY9CcId0JW747WGlKO/b2McdI0IeqPMik/MAT2ACzrRdtUyFAvktMJ50Tikm3miP
 PP842TDZ4OJ4pGqRrkXbE5vLACI64AgmqWUTFZ8d38mhrNriTKoNx0HdKcqNxxvyEvaL3JviSp
 jRVNt4tIyQnFpxqNEq0MqLqR20vzgIATQ9cGX0lgnDyWd+Ny9UXcG/warHtZlt9/jV9zm/thG3
 sgrnf14uQFubRUES1TD7wcrhI+R1WqP22N7heWq9Rdtwowl7b1CNh5tRapEublRcTKTmlRHJt/
 CoE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Jul 2022 04:55:21 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LdHzX0hgxz1Rwnm
	for <linux-riscv@lists.infradead.org>; Wed,  6 Jul 2022 04:55:20 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1657108519; x=1659700520; bh=9/V+jeecOKQ9buv2Jjb6PxTGk0efO8S6cyB
	l2B3zFEA=; b=NQqp5LElpaPKjMMZjQfdqYiZ5oumHP+P3Xd9GbrdNrgubcqbuFF
	adZTCfmZR2OSi/yQBwGd1r9Fyz9gtX1zz2Edg5JvjbZ5+jAU55bzfaD8vxC0iJxK
	FjmDyQOzpQU2eV1RvmsxAylj+iyL3S0HnnEsdADgICDknHx7sSIwr0GbZvgJaV3n
	PJ1Og/9rjksgt7jbSeDxdiawvaeos+wfkUYIkw3pCwPtPk5D+S/PnvyyeBpIoXg+
	9y3tCzBiOMlQoUtJ3MRp853f+H9VMlDdbTwFDYdYZu9QNWBTBFn9K5BHwTTYfw13
	JQXd2jB5amVQD43Q+484ebY5u5692zA2SIw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id z9kFlr48S9g0 for <linux-riscv@lists.infradead.org>;
	Wed,  6 Jul 2022 04:55:19 -0700 (PDT)
Received: from [10.225.163.110] (unknown [10.225.163.110])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LdHzQ65N7z1RtVk;
	Wed,  6 Jul 2022 04:55:14 -0700 (PDT)
Message-ID: <160267df-2f3f-02f7-4a4d-21baf60c4a44@opensource.wdc.com>
Date: Wed, 6 Jul 2022 20:55:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 00/13] Canaan devicetree fixes
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <mail@conchuod.ie>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Niklas Cassel
 <niklas.cassel@wdc.com>, Dillon Min <dillon.minfei@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dmaengine <dmaengine@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <CAMuHMdVOK+iHeTfRLDeMF1mwZoeH1KH_GHuCY72YnhQibGqhwA@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAMuHMdVOK+iHeTfRLDeMF1mwZoeH1KH_GHuCY72YnhQibGqhwA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_045524_678003_FBE51902 
X-CRM114-Status: GOOD (  25.41  )
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

On 7/6/22 17:03, Geert Uytterhoeven wrote:
> Hi Conor,
> 
> On Tue, Jul 5, 2022 at 11:52 PM Conor Dooley <mail@conchuod.ie> wrote:
>> I *DO NOT* have any Canaan hardware so I have not tested any of this in
>> action. Since I sent v1, I tried to buy some since it's cheap - but could
>> out of the limited stockists none seemed to want to deliver to Ireland :(
>> I based the series on next-20220617.
> 
> Digi-Key does not want to ship to IRL?
> The plain MAiX BiT is out-of-stock, but the kit incl. a display is
> available (97 in stock).

Seedstudio is out of stock on the MAIX bit, but they have maixduino, which
is the same, almost (pin wiring differs, everything else is the same).

https://www.seeedstudio.com/Sipeed-Maixduino-Kit-for-RISC-V-AI-IoT-p-4047.html

And you can still find plenty of MAIX bit on Aliexpress too.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
