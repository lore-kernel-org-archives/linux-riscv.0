Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0630C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 22:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lKuf8nYUyiXpHn/dX5yl6dkUnDqO5BDdOIPYnPTGwNY=; b=mTWifWuZ76ZEsFWfjHSnLgY7AL
	y6dIKuz/tq6FPoTelHWxXNtsnFvS5ixQ/XBm6hF8mtNuDPQTreKNqgllpLoy9ml/GjIOD80rzYr4g
	lVcsPUSw0Ljt+oiS9703Hu4erp/1rfYhziYT/5yrlDFphXnPiT6idpytb4k0n/ejdLGLViV/EIMxf
	q+sRw1rp3LclciZL83/f3hkeEO5JnMIjFQ04k3buPlVJnRhoQ3WlsQAjIwlOPzSb+Jx6pIYFAPcMz
	Fr5G4Yj9YNE3K85txPnhapD0+QhQPPiSu+6qpsVd31R4YAaOSpDFReGWnscH2X642DCqJr2i7KQs9
	K9pinblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxwMb-000000076DB-3Uwm;
	Fri, 19 Apr 2024 22:05:45 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxwMZ-000000076CJ-0yo1
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 22:05:44 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 957BF40AAF
	for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 22:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713564341;
	bh=iwngIHVe/4WMng29YbmuBW3l10hwsKwRmw0uFrHNG3g=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=gcbcIqn46I9Ifp2C20JlLfkg9yD1agLD2qFYOfjgOWbYFabCUkr+BJth/xJyMTzRQ
	 QBMapU23t3ScyTTKfGCAveM1bj1r9B1HxZwuyTB7r53PmcQKTDxryh8l6URZpgPl7l
	 ey2Q5ign10t6RdzsBNa5jnWmIhocFSMtKBCeHpD+wESgATH4XzgeGrmIBTnMyHuBK4
	 sjDWzXnRHzr3H8aGlrauvUJZOCwcYztnqCSRCBQ7Omq0g3sAd2M4zp0U7AO6cW1arD
	 wEXkqo3WofDfZqPERR+5FEAiMwONg8TNUruf5W2mSccyuG02htFE5pGxhzlbqRP+1a
	 abjbvplhUhHeA==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4365ab4c663so27642741cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 15:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713564340; x=1714169140;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iwngIHVe/4WMng29YbmuBW3l10hwsKwRmw0uFrHNG3g=;
        b=nQ4KM6Qpm+oEMU+yHE++WIjyVmWaiOFYEabDYyOmVusNi4frEFcPmbA9BE9mrYuGxQ
         +ZfXOGBhWVrx1Fv3GHP9H3NnyDOUZiGaTpPwxOIupLb1HV6xfz7j9wvmBvXiI07tXM4V
         fa83EWzde+27ozTOfkkODQvTJ7V/oGShyAxJhsyGPUc/mqoLBm/eSmFy9hbbkCbVMOHj
         68RpIgtwx2169goghn3gCeVAjFTC5qQuCMRbCRXmAprQ5k+sweXhoASKz3Mhxcaum4Y3
         n2Ax0QmPiRpH/siKAXtnt0ThBMwGrkM8fsAmO1myrwP7xt1F/NYNbHfpT6ihb2SMdlNQ
         8b4Q==
X-Gm-Message-State: AOJu0YxotZVwILB1+HRhcuwg56kr6t6/2Zsxf1TX9s5eL39ed4PlSVAT
	WkX7fjKmObrYX3S+zR9Fg6oHQhso0fYSV1D+k0Q8r9nuGuUJLebuSh8igCqiwlK9k8Hc4vGYhV0
	KPGUWngyoe8KU3h4uLKQNaByezCFU9NhS8G1In/tyUVU/X3PziIlIvrCtetqU5ybJCfqURk8R1P
	68Et2VSXiusgtkkVCRoPxQ4PIKqxnGOmiFwKC0GF4Bx1q2ahNvT2SGMXNd
X-Received: by 2002:ac8:7f49:0:b0:437:9bd0:238d with SMTP id g9-20020ac87f49000000b004379bd0238dmr4129610qtk.22.1713564340574;
        Fri, 19 Apr 2024 15:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmEg+HVg+ogQjxyJhDeGsv+9YsDoiouQKoYCIz1StpTBZ3JL+7PlHMw1o8Asrj+tWGcBMAdZHSHh3NcsI9BuU=
X-Received: by 2002:ac8:7f49:0:b0:437:9bd0:238d with SMTP id
 g9-20020ac87f49000000b004379bd0238dmr4129599qtk.22.1713564340345; Fri, 19 Apr
 2024 15:05:40 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Apr 2024 15:05:40 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240131132600.4067-5-jszhang@kernel.org>
References: <20240131132600.4067-1-jszhang@kernel.org> <20240131132600.4067-5-jszhang@kernel.org>
Mime-Version: 1.0
Date: Fri, 19 Apr 2024 15:05:40 -0700
Message-ID: <CAJM55Z96TnvHNwN5JPKLYywO7eiRh54dJSaFD6Avsy3nmM0bjA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] riscv: dts: starfive: visionfive 2: use cpus label
 for timebase freq
To: Jisheng Zhang <jszhang@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_150543_422873_EBCC3287 
X-CRM114-Status: UNSURE (   3.72  )
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

Jisheng Zhang wrote:
> As pointed out by Krzysztof "Board should not bring new CPU nodes.
> Override by label instead."
>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
