Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07ACCECAAD4
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 21:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uaiwV/ARbnd18visCuVgjE6Vhzz42WpMZ6LU9HLd4Yo=; b=XyAlXKNmumrqxJ
	L/Lgzcq0TjIrJlzAP6mtDp1VZCpD3CqnuaHMhZNct6PvzSOfV40u7jjKnC/n+CsLtkYJU/e9F5nJU
	5inP/VBWWG1AJoam1CSdE9sqgCnOUrk3CGGQmlbAa3L9I2LxZhp4cgzunRzjELNkSidKrtl7dlSMb
	fzTMhZWepIzU8IJLbBx45x6RbtXp6BYXviVXyLtGrNm58bl5tjS8Y6iGl+1i7fkok7mUYtJcVvGU1
	xlmCEH8OumHGkdIk59ObBqmeLccX8mr7di0AYDja7RMLdSfPv6/kNv56HWa7jr1cQn6aDQBPxN3Re
	NfBLwrmknZ6Ir8SMcjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT9GL-002AX4-RE; Tue, 30 Aug 2022 21:59:13 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT9GJ-002AUG-3a
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 21:59:12 +0000
Received: by mail-ot1-f43.google.com with SMTP id 92-20020a9d0be5000000b0063946111607so9038992oth.10
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 14:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=c/mrE4x9g0huZBo1ugVDt1ad905oGNnLQIQ5LBb4CBI=;
        b=4gQHwaEjdWak8KfbJcMWPeqEXHAhfJMHbRV8u9mUZZtWKe42D2ruDCINsHJalqE1hv
         ggc1S1JTksLQ/7akYGzSDR0vr6gjkCEkoYH1Xlv+2/xh+ivGhrr79rNEO19NOoC8CTVn
         WyWAaKgNrO3V3aMa/1udi85aBvkjd6R1N5wC2TWMb+b8VPBN7a4u9Zf8YiaSEj+S5/R6
         QXwqa1qJAT5PffmNEuVTtaBpZT6SGbXs5AcUeXScWJS2swju63ovD3D4N+Sd6oQrCxC1
         BPX/o+yOYgsrCDT4e342aLDA/takcbq3lkFt9r+XxOap4cFeVHNX1oLo/wmkWJ2YTwVj
         tQnA==
X-Gm-Message-State: ACgBeo0JWqCMnMSOX/SKHoH802H8EQo2E3LDSyiTGQJF4l62jxdw7AbT
	h6TRJkzCjM09thrSkcgJTw==
X-Google-Smtp-Source: AA6agR71tq++21E81nS1qjOGVLtVmMpvSKqybPuf6VKvptEt5YSJ3AZQMb63n+WeA2kCVWWehZ1y8w==
X-Received: by 2002:a05:6830:929:b0:63b:25ba:dfe4 with SMTP id v41-20020a056830092900b0063b25badfe4mr6463836ott.311.1661896743283;
        Tue, 30 Aug 2022 14:59:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z7-20020a056870e30700b0011e4893127bsm8804950oad.38.2022.08.30.14.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 14:59:02 -0700 (PDT)
Received: (nullmailer pid 2162196 invoked by uid 1000);
	Tue, 30 Aug 2022 21:59:00 -0000
Date: Tue, 30 Aug 2022 16:59:00 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Daire McNamara <daire.mcnamara@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Sagar Kadam <sagar.kadam@sifive.com>, Atish Patra <atishp@atishpatra.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH 1/2] dt-bindings: riscv: sifive-l2: add a PolarFire SoC
 compatible
Message-ID: <20220830215900.GA2162133-robh@kernel.org>
References: <20220825180417.1259360-1-mail@conchuod.ie>
 <20220825180417.1259360-2-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220825180417.1259360-2-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_145911_171303_FE0A0F54 
X-CRM114-Status: GOOD (  11.91  )
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

On Thu, 25 Aug 2022 19:04:17 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The l2 cache on PolarFire SoC is cross between that of the fu540 and
> the fu740. It has the extra interrupt from the fu740 but the lower
> number of cache-sets. Add a specific compatible to avoid the likes
> of:
> 
> mpfs-polarberry.dtb: cache-controller@2010000: interrupts: [[1], [3], [4], [2]] is too long
> 
> Fixes: 34fc9cc3aebe ("riscv: dts: microchip: correct L2 cache interrupts")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/riscv/sifive-l2-cache.yaml       | 79 ++++++++++++-------
>  1 file changed, 49 insertions(+), 30 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
