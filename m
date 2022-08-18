Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F315C00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9Uwwo5SP4MCdSyjW1MGsIs+rlhB1N2dPCODQxR38tk=; b=ZVDV1crAy0eAnN
	HZc9Xc6DOwj3ngEEDBUXZ5e6naAMlzXRLpRq6/p0JUCxXwTTmiRyY1/wr/s/6RQ2QTgSCX+4c9etR
	1iYHNVGXU5ZAnejqtvN2wMlXQkQEug05NnoqFJ69N8yGzviysEshMq0TtCiXsK2cz35/4ghzJJNKf
	wHM9gGA/8lh9nQQ2G+n8+cLk29VoMLiY9v319OItbhCEIje0kK/Nq7jDOFhaDNNb/mifmCrGFzzVB
	j0FLd5kn2n2QGwJgFr3ezYu7UVOh3YIqk6jGEwdvm2Zn+BLvoGVwkSxGzl5feaUFOpd8L6F7kKb8c
	wiG4kFWTAQCk1pAQq5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOioS-007JVZ-AO; Thu, 18 Aug 2022 16:56:08 +0000
Received: from mail-il1-f179.google.com ([209.85.166.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOiVV-007AC6-Pm
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 16:36:39 +0000
Received: by mail-il1-f179.google.com with SMTP id l15so1076373ilf.4
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 09:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=M8whQnh20c5DrO/g1DklkK8u4I+Jzv+7yqvteJMRnk4=;
        b=QSoIJXeF7OeVXr8OxJ7h2RUjejbM4BBuW1ZSQqmHT3r9T23nxd6KGC6ggGpPKbAWPF
         hIXnFa613WcvTQz0fsPCxcrhnX1TR4somPAT8GlEPXzN8GYMc3sCcHaQ4no3C+qsHHYE
         r4980tITEdftV86KUUvug109YD7G51zoQ75dirKqM9jJFdtS9r5EhPk7jPDxOlVsgdZ8
         6jXjwf2W/CKBrcT8GX55RDPRnZvB/OeK/+0hnzigkthTdw0HirNeFYHtwbfruGYJBILr
         uS/FpAs//8zOCR13/3xgtXINXnPHeqhyS4/cWRndt0kHASedWFKyzi/0UpKehTyWxREM
         uvHA==
X-Gm-Message-State: ACgBeo055OZ2NVPkA+1SNcNZZihtUa7/uk/n3Uv1XAWzHYOU5FLtX64H
	sO6O4aIcthdTk0EeYf2VHQ==
X-Google-Smtp-Source: AA6agR6BO8dOlPsFEFWhj5EUY+W39h9E7U+aGdI6szZ6ee6PCPM3WFIUVT1ZpBVnS1ZlkaHZq6Da7g==
X-Received: by 2002:a05:6e02:de2:b0:2e6:691f:eda5 with SMTP id m2-20020a056e020de200b002e6691feda5mr1785399ilj.279.1660840592441;
        Thu, 18 Aug 2022 09:36:32 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:647:4ff2:3529:f8cd:d6cd:ac54])
        by smtp.gmail.com with ESMTPSA id x10-20020a056e021bca00b002e9256ab3f6sm177238ilv.31.2022.08.18.09.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 09:36:31 -0700 (PDT)
Received: (nullmailer pid 1996122 invoked by uid 1000);
	Thu, 18 Aug 2022 16:36:26 -0000
Date: Thu, 18 Aug 2022 10:36:26 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <anup@brainfault.org>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, Andrew Jones <ajones@ventanamicro.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 1/4] dt-bindings: timer: sifive,clint: add legacy
 riscv compatible
Message-ID: <20220818163626.GC1978870-robh@kernel.org>
References: <20220817201212.990712-1-mail@conchuod.ie>
 <20220817201212.990712-2-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220817201212.990712-2-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_093633_886679_6999125F 
X-CRM114-Status: GOOD (  11.80  )
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

On Wed, Aug 17, 2022 at 09:12:10PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> While "real" hardware might not use the compatible string "riscv,clint0"
> it is present in the driver & QEMU uses it for automatically generated
> virt machine dtbs. To avoid dt-validate problems with QEMU produced
> dtbs, such as the following, add it to the binding.
> 
> riscv-virt.dtb: clint@2000000: compatible:0: 'sifive,clint0' is not one of ['sifive,fu540-c000-clint', 'starfive,jh7100-clint', 'canaan,k210-clint']
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/timer/sifive,clint.yaml           | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
