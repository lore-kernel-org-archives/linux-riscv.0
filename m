Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FA0EB64DB
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 17:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufSvk95a1Gwl2cYnd1G5Zzkdi50b1l6NjZ1xam1qv+s=; b=0iF9SKNR40UZ7s
	MEg6xwNzi38u8VlCyy4kkMymlJtDu6FTlgOwFBnRuz4HSdGAnOWowZgklD4CNpyw6H35welsS1B2z
	jb055KH0R9PcTdSXQbw0krJSrEdBgVHqqgq5tYXA9oloe3yIqaZigf0Ga0PNydDedIbnEwtwQQTbJ
	Fz7dfpPpxviwPDw8v2JyQPSfF74ENYYkzMv624KTU0Ie7Ek6EelUaJhPViywe1pqJQD7EfMCIwKgX
	KD7c18oFk43bQeHhvkoqH4n8dPP0e+0KpiOozR3VqLhPiph394sciPuvBNFToa0HdP3MeVccDTOZu
	RVhvregGMU9qpg5/vEag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9r4Q-00FeOT-0O;
	Thu, 15 Jun 2023 17:47:42 +0000
Received: from mail-il1-f175.google.com ([209.85.166.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9r4N-00FeMh-0i
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 17:47:40 +0000
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-340bba768acso7666835ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jun 2023 10:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686851256; x=1689443256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXUuU+bjTRUlDh30kMbjfqbr6PEXiONI6qJ0Ou76ZMM=;
        b=cTTpP/xy02d5S5XPAK9a49I6cDOw7cRdkERDhhqXlEs3ipsLrflRuX2xu63YLbnmW7
         hIMEzN/lHCC43soUdWhynEpAJRLXFmnjPDfjbVOhLhEdKWFx9LUgC2Ae5jrG91O+FS6J
         UvNqoDx1rJ1OzQDMFZNT/rttNPdOCZcPYJ65VyNPKFIOenoTcQUcpcgrb1Ts+62J0SBP
         IA1V6assSbHyM9INZuvtq2VWp6UyxXLYyh3UekxYwznk+sYP4MMdIRP+6safF9GNu6BO
         2dsND98XToI+ilpbk5Q399NaeKsM6tP1Ux5dR77mpXAdGBVh6/mX3Shihb7AcJJOsme1
         TzVA==
X-Gm-Message-State: AC+VfDwYoysotQM4QtkQrQQCFDZ/bqcsapeoH36RHza8s2nbNTnH1Z/y
	AnpLxxDbDq0XUTmPGdlkDbqsobSiDg==
X-Google-Smtp-Source: ACHHUZ4rcf0f5VD09/y2OdnlU6rJyVmdPxbV3gdxcOg2VFvtQm13Yr7CRD75ZN4ywJL3AJeDxmxjbA==
X-Received: by 2002:a92:ce08:0:b0:340:5928:e048 with SMTP id b8-20020a92ce08000000b003405928e048mr171435ilo.11.1686851256291;
        Thu, 15 Jun 2023 10:47:36 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id o8-20020a92d388000000b00341c0710169sm609236ilo.46.2023.06.15.10.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 10:47:35 -0700 (PDT)
Received: (nullmailer pid 1252912 invoked by uid 1000);
	Thu, 15 Jun 2023 17:47:34 -0000
Date: Thu, 15 Jun 2023 11:47:34 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: palmer@dabbelt.com, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/6] dt-bindings: riscv: cpus: switch to
 unevaluatedProperties: false
Message-ID: <20230615174734.GA1240678-robh@kernel.org>
References: <20230610-snaking-version-81ae5abb7573@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230610-snaking-version-81ae5abb7573@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_104739_265622_3E0A0E61 
X-CRM114-Status: GOOD (  14.45  )
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

On Sat, Jun 10, 2023 at 06:24:47PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Do the various bits needed to drop the additionalProperties: true that
> we currently have in riscv/cpu.yaml, to permit actually enforcing what
> people put in cpus nodes.

Arm needs pretty much all the same properties. I started on adding them 
to cpu.yaml a while back. Let me finish that up.

> 
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> 
> Conor Dooley (6):
>   dt-bindings: riscv: cpus: add a ref the common cpu schema
>   dt-bindings: riscv: cpus: allow clocks property

I just have 'clocks: true', so if you want to keep this setting it to 1 
clock that's fine. But I imagine that it's just a matter of time until 
someone wants more clocks.

>   dt-bindings: riscv: cpus: add a ref to thermal-cooling-cells
>   dt-bindings: riscv: cpus: permit operating-points-v2
>   dt-bindings: riscv: cpus: document cpu-supply
>   dt-bindings: riscv: cpus: switch to unevaluatedProperties: false
> 
>  .../devicetree/bindings/riscv/cpus.yaml         | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> -- 
> 2.39.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
