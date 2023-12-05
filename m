Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9088EC4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 13:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oBMXVn2yk5GEAm90ezEQpMldb2li/eFfAnMmJYrwD1s=; b=lygvGALC4TQGJbpX+AELOx9R1c
	dLqi1d1yFe64UxO41dqCrf2odLesspUBBy0uPGBzYfw2u/yvtaASfgRBVUHy420JgHsDII7JCtuV+
	R26KuATAKgwZuH/2LstMKH/+ZkHUArCQ4Nj1VcApqboK9RWvFK7UPPGfB6syX3SzDYJ9N4Iwhdxl0
	wfIKeAxqULnFlGW9GbF6w93FRgZQhLppjdp9npazkmX2qQviXnU2qOLhpqn8pGdQxdT3gGKijegiF
	MmtO1CGeUoPzDTFzK5z+XAwpvvOSNc5L/cJvOIhTuWlCv4rDbvd7tJQO8vXh/r4wjxn6mbMlnpJ6l
	58vVl3Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAV9t-007T7P-1C;
	Tue, 05 Dec 2023 13:08:17 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAV9p-007T6Z-26
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 13:08:15 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D0CFC40822
	for <linux-riscv@lists.infradead.org>; Tue,  5 Dec 2023 13:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701781685;
	bh=ipAJlSSYX/mAZm4xcMYzeaea4jWciG9PaIDcpgo9ae8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=j41Z+6MsayA4SuWADLsm6SDFjxagvqVWmPvXhzwpd+Cx58ZFb/JFEInbWsna5OOF8
	 mI/0NiYoCI0W5yAKdwLvDYJ0Ron/euvmdWnUzUdfaR4G8xtFq6/jE/l38nPjhckaZO
	 hawZoRp/kMRZb0h73YJtWSFOozpTZ/KkvAKr8sNkL5rTcRvEBppqBkLOgmkermXDdH
	 6PnuB1UZXV+YoBS1m8nCOmQu+MH81ni5b4VFE3I02ILtWbnuxLwP/QJdrkfoXygeic
	 zZJg2cTAmyucgsxfM3NIBD1e86PaastxxJWC5ZJi70zP+EQwpUj5vcCORtZt4NP7eJ
	 CgAOMpYGRoAFg==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-423e480037cso75879711cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 05:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701781685; x=1702386485;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ipAJlSSYX/mAZm4xcMYzeaea4jWciG9PaIDcpgo9ae8=;
        b=YNPsjmMRRh8ZxFGJ9OiHYKXdWq379ByZFylOq31jWao4Vudw4bNou+42m7Qz8PBuRu
         4WlfSm9PUJGiMFAGJEacCars96gTSEgeG3rrFlk3V2NMzCJMirVssRoMINuJfzR7+mAc
         ErxlcXKT5RegBVb6oTSLDOR0iji6nnYkOq7WQflR1tLdANk9FXUEo4fXlzMcaBnbH79q
         0NHGi5myK9w9KmUIVHPDqebQLSwAq8E/zWKVpaCF1IuwectmFNlfn1dPlh9JA/yGMr0j
         DAFcoHXmWBXo4eziqoe+9/lJ8pKC4Qy1Muh9i/QoswODqUrQdh54VFQrPHrwiqTsfGUp
         Yl8g==
X-Gm-Message-State: AOJu0YxTSCyHRYBhrEWAXGdR3xNKvkB01WYovbB71Cwa+JH3BNh10BMi
	h0o4fqQEh9RKy9sylwQL+2q5BCHIDY8BBDdGYqbZHZxiV2RxkkFcyO8j/5eo6r8Ju6eoOkkqQU7
	n5KmBiZ/A8G4NVrNuxrP6tBiqcaJksfjaZCX8+CIIXdpPhoHKQMA5ZSD1Qtil6A==
X-Received: by 2002:a05:622a:11d6:b0:425:4043:18ac with SMTP id n22-20020a05622a11d600b00425404318acmr1492014qtk.95.1701781684733;
        Tue, 05 Dec 2023 05:08:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlXRys+uhq05wTQp5gTIQeRVXtcocRfoOG2IGdr/XS7LnceeqhmOJyi1TFF74GFlFi520WeeSjrG5WeOdwcd4=
X-Received: by 2002:a05:622a:11d6:b0:425:4043:18ac with SMTP id
 n22-20020a05622a11d600b00425404318acmr1491997qtk.95.1701781684479; Tue, 05
 Dec 2023 05:08:04 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Dec 2023 05:08:03 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <IA1PR20MB49532E1A3D8BA71FDBB444BCBB85A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49532E1A3D8BA71FDBB444BCBB85A@IA1PR20MB4953.namprd20.prod.outlook.com>
Mime-Version: 1.0
Date: Tue, 5 Dec 2023 05:08:03 -0800
Message-ID: <CAJM55Z9WO+0Yb-at6CAR6=UP9j60iQz=s7MK-3qiT=w-8N6+Zw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: sophgo: add clock support for Sophgo CV1800 SoCs
To: Inochi Amaoto <inochiama@outlook.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chao Wei <chao.wei@sophgo.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>, qiujingbao.dlmu@gmail.com, dlan@gentoo.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_050813_839644_CF13C15F 
X-CRM114-Status: UNSURE (   8.95  )
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

Inochi Amaoto wrote:
> Add clock controller support for the Sophgo CV1800B and CV1812H.
>
> This patch follow this patch series:
> https://lore.kernel.org/all/IA1PR20MB495399CAF2EEECC206ADA7ABBBD5A@IA1PR20MB4953.namprd20.prod.outlook.com/
>
> Changed from v1:
> 1. fix license issues.
>
> Inochi Amaoto (4):
>   dt-bindings: clock: sophgo: Add clock controller of CV1800 series SoC
>   clk: sophgo: Add CV1800 series clock controller driver
>   riscv: dts: sophgo: add clock generator for Sophgo CV1800 series SoC
>   riscv: dts: sophgo: add uart clock for Sophgo CV1800 series SoC

Hi Inochi,

This series seems to be missing patch 1 and 2. If you did send them, but just
omitted linux-riscv from those patches, please don't do that. Having the whole
series makes it a lot easier to review without having to hunt down all the
missing parts on lore.kernel.org.

scripts/get_maintainer.pl does support muliple patches as input

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
