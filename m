Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F67C8303A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 10:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03cJvf9J+UqzeC7IJfMa8z5Ca1v8n8KiHD7DwjH2Lmk=; b=AcE4vJuux74ui+
	d9OL1u7rQ/3jNo3cItMu+kk4xEQwBLQ5Y8MgYdiAleH+mDmNL2AXku6rUfUL7Cd2O5tU+nrv2Pttm
	AfrSUbyTWNbFWpzIzlcG3+gsK9b5lEfFf4SntBgr+PbcZYc3mVVusaoFI31vatGB6OgsalOkgqfGm
	PsUiPMrfaUYv5kCKUQ9bbRQjjUJcBBmHC8BrCpCN1L3DegIdBOt0QklBii7AIdTOz3imyoDFzY/E4
	Js5eGepJCYBuEy2cd6It1Mgi3klVtbYvohQt0qbHVkujJ9Szb4GqijTWf4jt8yIEjqHrWrwlx8C+H
	/SpxlUuAUCvhwW429qQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXtz-00000004hYz-19pt;
	Tue, 01 Jul 2025 10:07:47 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXr2-00000004gID-21pl
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 10:04:45 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-747c2cc3419so5157352b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 03:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751364284; x=1751969084; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=71QusJ5AouGsm2mgHkr3YzuD0h0jCWeTyt1AC4+RDvs=;
        b=Pk2mwppusev8eOqfeFsDmZzFpwk8GugCRUD28UEtDXpY7l4QAhpgQpmBvp+cY2FB9J
         TjQC8osp/+VkgXhMb9aBGYaovnDbsP89Yxc5Ws2roW3N97cpHoIMcTv+aqIPq2s/vjgn
         DQHBi01JIIygiaqaClQqTCrpZTTol5Ng1N3pNECHUMlOKqDublLV65lAejbk+lCBg2Xr
         0rLFeqsr1hfNcq07aMbM5TVufs9Mu3l6npPddhwoyn0GGxHHU9p0rnpIKgZVWG36cnUl
         GM16iXOVI8d3S9UTyf2a79ICyarcLeLwsAk8kAIXDMsdUeyK/V2y4V3Sdg/q10lQog0l
         45nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364284; x=1751969084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71QusJ5AouGsm2mgHkr3YzuD0h0jCWeTyt1AC4+RDvs=;
        b=T2hqJGdNYVhFOVGDAcfvm+gbAbeEEeVlz99QOF3P1wEAULLNGu5ozE8b2TFNXckvLg
         DvjEWL3Mh5D0cIFfpXE++DHfT2VsjZhubSE9jkYIIMAnFUsPYJAbZH5s2CpSrVoe6xYS
         wbkAUoa+tZ9nd0UbDosMir0UTZw1wR02MVQJ+fcbbhV4BOORF2ijL2l/u/5+DvqPI9Ft
         dyoqloeO8NjL/t0BDD7gxAbyBYwcxP61VgBw+EEYLVr+he/+Dif9xMLfMqsZkXdZJV+X
         iGnO7tpVMIjtLr2nGYU6SNthfB0ELgFww2pR+4UGjqhMAxMDYl1Pv2ldKjd4Vm9U9m5Y
         zgeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCjREzmaYDtoV7Ef5d1ntt+qV1yaGpsMTFe5r3V05rcVO/bPLl4bqHlYMLZ4QNadAHQv+JQpG+KNdvjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOz37kxI+PJg2+pKlESFCn5iCm/rQVsNcWUcenE2HnqXCfI2pa
	gt+nURwn2HXGOwfsyVob9+ed4iLkFkWQLwvbaA+qHdfF3jC10vO5IhK2uscbB0uzz/s=
X-Gm-Gg: ASbGncuWrgTEoQr7vHQvX2KC/PPCpWs46MbHXw2uCRolFC03qFWY8nUSCIiQLTfO3bG
	pUdPPZxqtVmodzsi6qdxXY7yhGHFEUoY4CGPmgrypkRmtOc5Qh1d4gKW1/reJaA9t1clKkm8721
	HfPODWLwq7wmEz37rQmnjNpoLvkx+/kLzyNcCd0sPgTMcfeeHM5v+46vnZZXxPHKRk8H+vony8S
	YIWZCj3GiSb9+DTIYQYXjdpaoECH8n6D9VFvRyDZ1xEI7gFB911RZmfl1HrfPPuojVn61JrB/GP
	kA9XfO8OVlnEnrWbVLrjm7h11joBUXGVgwqD9FAzXK4PbMsPtKEGSYxhCTMOzA==
X-Google-Smtp-Source: AGHT+IHie6mqvlaJorzA6xUxii2gAFC0YaJ/JvpPEZQX9X8fCXiwrRfXuXkWDPVsvQUlpXtMG94W6A==
X-Received: by 2002:a05:6a00:2195:b0:748:f80c:b398 with SMTP id d2e1a72fcca58-74af6f08c99mr21158524b3a.15.1751364283601;
        Tue, 01 Jul 2025 03:04:43 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af57f467bsm11309945b3a.170.2025.07.01.03.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 03:04:43 -0700 (PDT)
Date: Tue, 1 Jul 2025 18:04:24 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yixun Lan <dlan@gentoo.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next RFC v4 0/4] riscv: dts: sophgo: Add ethernet
 support for cv18xx
Message-ID: <gkyq4gakaji6ddx5btmd6fzehfu5mzfhdy5pch32idoio3jf7g@7zlwkf2bvhac>
References: <20250701011730.136002-1-inochiama@gmail.com>
 <vxnvovuetfd6rzgaenwplpkhxm62fhw6t3vi4wkyigul7p4bkx@pwlprna4pyul>
 <a5107266-853e-4658-ba90-d6a08882d2a8@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5107266-853e-4658-ba90-d6a08882d2a8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_030444_525790_930F53B3 
X-CRM114-Status: GOOD (  26.52  )
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

On Tue, Jul 01, 2025 at 08:26:31AM +0200, Krzysztof Kozlowski wrote:
> On 01/07/2025 03:23, Inochi Amaoto wrote:
> > On Tue, Jul 01, 2025 at 09:17:25AM +0800, Inochi Amaoto wrote:
> >> Add device binding and dts for CV18XX series SoC, this dts change series
> >> required the reset patch [1] for the dts, which is already taken.
> >>
> >> [1] https://lore.kernel.org/all/20250617070144.1149926-1-inochiama@gmail.com
> >>
> >> The patch is marked as RFC as it require reset dts.
> >>
> >> Change from RFC v3:
> >> - https://lore.kernel.org/all/20250626080056.325496-1-inochiama@gmail.com
> >> 1. patch 3: change internal phy id from 0 to 1
> >>
> >> Change from RFC v2:
> >> - https://lore.kernel.org/all/20250623003049.574821-1-inochiama@gmail.com
> >> 1. patch 1: fix wrong binding title
> >> 2. patch 3: fix unmatched mdio bus number
> >> 3. patch 4: remove setting phy-mode and phy-handle in board dts and move
> >> 	    them into patch 3.
> >>
> >> Change from RFC v1:
> >> - https://lore.kernel.org/all/20250611080709.1182183-1-inochiama@gmail.com
> >> 1. patch 3: switch to mdio-mux-mmioreg
> >> 2. patch 4: add configuration for Huashan Pi
> >>
> >> Inochi Amaoto (4):
> >>   dt-bindings: net: Add support for Sophgo CV1800 dwmac
> >>   riscv: dts: sophgo: Add ethernet device for cv18xx
> >>   riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
> >>   riscv: dts: sophgo: Enable ethernet device for Huashan Pi
> >>
> >>  .../bindings/net/sophgo,cv1800b-dwmac.yaml    | 113 ++++++++++++++++++
> >>  arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  73 +++++++++++
> >>  .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |   8 ++
> >>  3 files changed, 194 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
> >>
> >> --
> >> 2.50.0
> >>
> > 
> > As this is mark as RFC due to the reset dependency, now it is OK
> > to merge it as the reset patch is taken and this patch is a minor
> > change . I hopeif anyone can take the binding patch so I can take
> > the devicetree patches.
> 
> I don't understand why you target net-next with your DTS patches.

I just want to make them all get reviewed, as the dts patch is
related to the binding.
 
> The subject prefix is here not correct and probably this should be
> split. Anyway, bindings have issues, so no, it cannot be merged.
> 

Thanks, I will separate the binding patch and fix the issue.

Regards,
Inochi



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
