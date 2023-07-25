Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26379C001DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 15:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EDtrj0JO3ELrWGhKehOC69zgjZtNt2MLxxSg4yFGFUU=; b=Emy2eqLwK0jaHv
	fGu0E8xxpq8pwndViIkAAPZ24ygjtg4/+AaLY+Geh0v+0kBhz/YauEpy66vVNAaixtblJmBopp5Xk
	jKxHi7Yj4ICdwReBRxVubUcvAg4FHaXaWQZZ1IAYvEMBUk4LpEogZgmiY9fEkTQGUTLYjkGa9w//P
	+E0DHIVb80qkEFtAZvpJG78FSlSXQz+PSkkvkExauj8Uqom163qfw6NhZNYhuPha+4XH5WZH88Ys2
	5ludWDjlQnD9SKF93DBzs82sPQ+UU0LbGHx1h2jDYx/BCf9Vvkn/A7NW25T8O9icFRuQfw88DPq7F
	jAdE+QjXCb9FuttvU4Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOKMb-007xwb-2X;
	Tue, 25 Jul 2023 15:54:17 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOKMY-007xvP-0D
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 15:54:16 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bb84194bf3so19159725ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 08:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690300452; x=1690905252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yPT2stxFChZpMg6h3D81cBqzyJBn0I25fZ2MBYv8irM=;
        b=eD7kANSdAAjiTC37YAfsbtVn214CSpat8MudtF+68viBVkhN/n+RrCvV36qnEGHl6Y
         nPebh5ij0FBewMkONhjPgvJZC1dy3YYTeJj/WbGwNjGt//VUvZZnpFFjuOZ+Jxc7x2/Q
         LLaf3ZHb7stUjV+a5Q2DT8P4+CRldCPKRmMD4L8hmsnPTzdQitjoNc+c2p51Whq66UNz
         M5WVBLSdvJ1IOe1y045VZw1aOsQt+Ql4RV1Y9MEanRKF2Y3PSxcQ/ZlZ028Xp4OYNcqw
         ACrcWe+xfjoNI+FnSZNTcGxVsLK54BAtURKW2yGIqMWSZyMWvupBPMHG9Et+JrFPr/YL
         S1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690300452; x=1690905252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPT2stxFChZpMg6h3D81cBqzyJBn0I25fZ2MBYv8irM=;
        b=YBa36pc0JH6LPQKFhrYNgwokWpW0kaKbf+UAhTWSrU2GjKshPQWtpx1z7RhltgBMtG
         LWVSMqwFkwHyN4Zq52QDVimirk6N6NakYhR3sv/sG0+oLmUNgznz9ZuJhjnjUlFP0dMn
         M9oatcmESa7uEL/1a2RlibXujvnFjw9URWVPeph9P/xrqeLnqsMi0+YKOvkAQLrZAag9
         Z2QMhID0DaQRO65VujfpkHYx5GOwfYbJn4DukcyN3ocTTq0CZEVTVaKQ3hdeyu6xX3sZ
         3TQutIuN1JpiLQz3Kh4asAWfoNm8oCSS5jX8CiyQVnJqcvRcWpnCPJnjc42PqEyEsIvg
         ujVw==
X-Gm-Message-State: ABy/qLbuPcG6cZ4Nd8Cj2B+578oq4a6wKLhtbWfrkWxblPchceSxgtKk
	NilBscwQ8ThkmoFJwZ0p1E0lug==
X-Google-Smtp-Source: APBJJlH+vInGZEOGDW0JESmSk+/b0VDKB7Yl0EonVeDj+0oEV2iQCQjLxobPmSDkYNEnTf2Bdija5g==
X-Received: by 2002:a17:90b:4c51:b0:263:5702:d4c5 with SMTP id np17-20020a17090b4c5100b002635702d4c5mr11605845pjb.19.1690300452577;
        Tue, 25 Jul 2023 08:54:12 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:2cbf:9196:a906:e222])
        by smtp.gmail.com with ESMTPSA id gf4-20020a17090ac7c400b00263d15f0e87sm8225180pjb.42.2023.07.25.08.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 08:54:12 -0700 (PDT)
Date: Tue, 25 Jul 2023 08:54:10 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>
Subject: Re: [PATCH RFC 4/4] mmc: sdhci-of-dwcmshc: Add support for T-Head
 TH1520
Message-ID: <ZL/wIjm4CZh2Ce0N@x1>
References: <20230724-th1520-emmc-v1-0-cca1b2533da2@baylibre.com>
 <20230724-th1520-emmc-v1-4-cca1b2533da2@baylibre.com>
 <ZL/kUPicOEPWz5NP@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZL/kUPicOEPWz5NP@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_085414_295784_B5D566F9 
X-CRM114-Status: GOOD (  21.01  )
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

On Tue, Jul 25, 2023 at 11:03:44PM +0800, Jisheng Zhang wrote:
> On Mon, Jul 24, 2023 at 05:59:18PM -0700, Drew Fustini wrote:
> > Add basic support for the T-Head TH1520 SoC mmc controller. The new
> > compatible "thead,th1520-dwcmshc" enables basic support by:
> 
> Hi Drew,
> 
> > 
> >  - Enabling v4 mode to properly communicate with the mmc device
> >  - Setting quirk to disable ADMA
> >  - Setting flag to disable SDMA and force PIO mode
> >  - Turing .reset op into a no-op as the driver does not yet know how to
> >    configure the phy. Rely on the vendor u-boot to have configured the
> >    phy and do not reset the controller in Linux.
> 
> The last three itmes are not acceptable. The controller supports ADMA
> well, can you plz bring in the phy driver? We can't rely on bootloader to
> configure phy.

Yes, that makes sense that this is not acceptable. The T-Head vendor
kernel seems to contain all the necessary information needed to add the
phy configuration to sdhci-of-dwcmshc.

The shipping kernel for the BeagleV Ahead [1] is based on the T-Head SDK
releases. I looked at changes to drivers/mmc and found that key changes
are from Linux_SDK_V0.9.5 [2] and Linux_SDK_V1.0.2 [3].

That kernel contains drivers/mmc/host/sdhci-of-dwcmshc.h [4] which seems
to define information about the phy registers. The version of
drivers/mmc/host/sdhci-of-dwcmshc.h in that kernel defines several
functions for the phy config and controller reset:

sdhci_phy_1_8v_init_no_pull
sdhci_phy_3_3v_init_no_pull
snps_phy_1_8v_init
snps_phy_3_3v_init
snps_sdhci_set_phy
snps_sdhci_reset

I'll look into adapting that code into the upstream sdhci-of-dwcmshc.

Thanks,
Drew

[1] https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-linux
[2] https://gist.github.com/pdp7/8d85d736dea24957c017eefdeb882668
[3] https://gist.github.com/pdp7/c1d3a18f9b7c25e630573d5953a58c99
[4] https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-linux/-/blob/beaglev-v5.10.113-1.1.2/drivers/mmc/host/sdhci-of-dwcmshc.h
[5] https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-linux/-/blob/beaglev-v5.10.113-1.1.2/drivers/mmc/host/sdhci-of-dwcmshc.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
