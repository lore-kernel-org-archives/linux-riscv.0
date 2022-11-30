Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A33C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 15:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAcOoC1OXricBaR0bRNlM0AvxwjiNI6Zw0shBQi5ijs=; b=RoMff47jcjYkWj
	39er8xwKnD+g6pHcDHZaKi3sd69oxN78K2K1IH+An7SFoYt/sueQAud900H6VVtGHj2lxGQBX5ABY
	J09SbFRT4k6cnRc+pmLJ5VNH0GBW1QhSAnlmsVCuhIsQ+rCGoygvl10Lh6iyE2qdhVvNykicgQTtn
	4G+Lpc32BqSEmgUbK2BaSUjKA7pmeXt5jcubdQsshpxJtYSs9ZYalJCz5iJwQCWCom8Ua0MUFIYRR
	o//az9SyICJGd27BJHlzuzY5dC2XetVgTQVXA0BJ5QBX0sXjUg4wIJgRCZafTnq/70ntw+AlqSIXj
	M+ClPOfETRqPhpvCITZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Oz2-00HPjc-I6; Wed, 30 Nov 2022 15:26:48 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OxG-00HOHG-9t
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 15:25:04 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-13bd2aea61bso21431999fac.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 07:24:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlACntbArX7b3kCKVV+bhldppIYRKiicqjQCNfxe6xc=;
        b=KCYYvoXXI+nMmDCWtSazjlBmK5v73JuWLhpt17kYbB/hTnvRAcnNlJl1AdGqkSnJ6B
         13s67A0e3Fh4WouGrKQ5hZRW+wbJNiJxOML+SlBzqDqfdnACIwX60BXIA3s7+KTpOfST
         o+Ib93msqfMq1jHQiXnSD7Qta4quhlcVn8ipKwjjvHrm5y/3ggVLGgO5USyCwD7mc+ro
         ebUovW1nrOgmo6DJl1LGh1vKPuvyI9Z98CgqsTL8eCD3xZAu0oW/q6IFrvDY8OL9bNGG
         1Wn++7RTiaHf0zSV2bFb1cwNXPqpjbMzTQMU1WgX6YWqzdRn4EQbumj8ZUJ9xoMka6w1
         0dDg==
X-Gm-Message-State: ANoB5pnpH/13ssQjxrP99xMDvECxjIRcjQ/E9O6JlzM2Cv/Mb7ap6PXO
	dP13dEA0f5AABLVks+ubmQ==
X-Google-Smtp-Source: AA0mqf5x+OdF/baS7qLHAVmukK6f4ncA4i+9mLv9a6t8OILL4W5A/PqjSnmH4cu4Ow0KVyie+oLneA==
X-Received: by 2002:a05:6870:f592:b0:144:543:c801 with SMTP id eh18-20020a056870f59200b001440543c801mr1399989oab.201.1669821892698;
        Wed, 30 Nov 2022 07:24:52 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r127-20020aca4485000000b0034d9042758fsm727106oia.24.2022.11.30.07.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 07:24:52 -0800 (PST)
Received: (nullmailer pid 2194178 invoked by uid 1000);
	Wed, 30 Nov 2022 15:24:51 -0000
Date: Wed, 30 Nov 2022 09:24:51 -0600
From: Rob Herring <robh@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] dt-bindings: power: Add starfive,jh71xx-power
 bindings
Message-ID: <20221130152451.GA2192004-robh@kernel.org>
References: <20221118133216.17037-1-walker.chen@starfivetech.com>
 <20221118133216.17037-3-walker.chen@starfivetech.com>
 <99302e53-c0c9-cfe8-4e6a-c70e8428d9c3@linaro.org>
 <f21b0aa9-2ac8-ae28-755a-d530171f930a@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f21b0aa9-2ac8-ae28-755a-d530171f930a@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_072458_418508_BB71E1C9 
X-CRM114-Status: GOOD (  19.02  )
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

On Tue, Nov 22, 2022 at 09:22:03PM +0800, Walker Chen wrote:
> On 2022/11/21 18:13, Krzysztof Kozlowski wrote:
> > On 18/11/2022 14:32, Walker Chen wrote:
> >> Add bindings for the power domain controller on the StarFive JH71XX SoC.
> >> 
> > 
> > Subject: drop second, redundant "bindings".
> 
> Will fix.
> 
> > 
> >> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> >> ---
> >>  .../bindings/power/starfive,jh71xx-power.yaml | 46 +++++++++++++++++++
> > 
> > 1st patch should be squashed here. Headers are part of bindings file.
> 
> Will be done in the next version of patch.
> 
> > 
> >>  1 file changed, 46 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml
> >> 
> >> diff --git a/Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml b/Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml
> >> new file mode 100644
> >> index 000000000000..2537303b4829
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/power/starfive,jh71xx-power.yaml
> > 
> > Filename like compatible.
> 
> As mentioned in the previous email, the compatible in the driver should be changed to "starfive,jh7110-power".

Is the h/w block called 'power' or 'pmu'? Call it what the h/w is 
called.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
