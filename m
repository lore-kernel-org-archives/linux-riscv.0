Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E38C36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 21:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlis6JYmnYD2JBjivKD6aSrmvLfHQxvvA6SCxcLJ2jc=; b=B+P2DhtH1eTKr8
	wZ/34EgbJlzlhHqfqbQjSV9UKarA776T9Xv5UrhhaLmZDpRXnBeLBVLCFkTBn34+4EMm0UgMwi8JG
	Mw1nozHPzYpsibeTJjrm0qcGD0BTpUh5K+Sg1DPsY8X25qolWeYryfIYyWoOKgUUuXGcmptKznfLf
	pWVDQylm04ao1xxpHptfI4aNMQSzoOVFK1Kz9h8zlMEfycE/KWprS6L/Tqrorsd2+XuOnNt2XZ3iE
	srn87MsQy6WT+b7ejGD9YMxyacRmywQTDpkcwxt/Bpx1PFGnr3pELQBFoPfrLQtiDOvSgG1kvyh6T
	FhZBsRdlFpq3Y4YCmQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uIq-00000002471-3MDn;
	Mon, 07 Apr 2025 21:46:48 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r64-00000001XFC-1uai
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 18:21:25 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-224171d6826so64586255ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 11:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1744050083; x=1744654883; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y1Xymma/bXOddjzuMPc0uNib0InwbFB+6iU+FgAga1I=;
        b=kJKsvOf+e4vHUbJ0ND2EemeKGX2eA6otwS9R3fKfKcrVx0KoKHLcaX/eborU+egS4t
         ULen0SW4Mwc390sQHVDB5kchZMdb9YyGuoztx2hX9Ma4OS5FGRwV7t2ffKNhw4ZYViQ+
         DJqlumz58S3PBR2HvgzE78QCvJ0H1THcKHlpSmTE3pGPFQ9PvG6Y17uPo3RRMvx8vaBj
         QgZ0NxM3W2+Ui6UOsYXXHMVKMiwLnvriYJA6/bhW39Pi49hulobtMvSNn8R+SRTPr6F4
         LKGH/4W33FcBCOstN1HgXjkJQLl0OBj/UdFNE7lW0jWxBTXe9VhD+GVxEgjQNi8CUvy8
         Zacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744050083; x=1744654883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1Xymma/bXOddjzuMPc0uNib0InwbFB+6iU+FgAga1I=;
        b=vHpabxG5tZ29YZUBDAe0iGjcJ2y/E+bnn395gG4DBp0cvSaVi65g0iy971NeB41pGP
         LA9qdEpX+3pWviUJSkgD6z7BlRAQYc9u158rNKMYcrBgfrpFKG/HQkkYJyQ+jUeYwKOi
         0EiThcRb0jLlqsWJVDItFh+6xm8nFynqGQKuWEAXYzRj7C8n3l0WRR+7Pom/W+BdjAXe
         whn3rboi/h7nowNhbj0NVcw++FqCMME1soyjd9rgzBVVIwcosaeELhUx/F+KB4xACQf5
         mJQN45cyKNVdJ0+83RK/55BlMjX+Ii9OXc1DSryjBaJWntAkSZm52BbmdVQU7qigmEAy
         tTpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq44Td1Kwdifw0fDoPbft8ye7xwa6Zo6ZV5rut0x+ZGsrDCPeS3EDtXYUA13VjD2XrVFNDlSCuqiuiVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOM99tOWz82gPdGI4dERsySjy7LLucLchMCzZODhundHrIU3ZF
	UzdoZh/h0cHYlC2RJ2ivmYNsQlyu2u+nFv/sd89gXQmjM26e74qEUVRfdEmmkh8=
X-Gm-Gg: ASbGncv6i8Snj6bDJnRv7kQuMXskg1RDvr52zwI1UKtyAYBoAtgSXAhypghrC2EVPWi
	r/fucPpHpzAkB4wuXURJBUSrNBBXn64DzVyl+XsIl4h6NwWeWmgDr6DgLaN2WKtpu3ZVlMS2YLd
	Xp4QhNvkyfa1tikiJi9OcCSlN4dYNLMh7Rjy8uTcAc5Kc/onWHu2w/P+Ktp+8OGppjwf3U5wSBO
	aPtMIeh4nyVK1jqQENXQBji4r2/hGIcyBs6k/Xe/iNQYaowG9qZHapSxOm0AsjPStLj2dZMwWCV
	ifY4ko90CAQBjPFR8CYku1UK
X-Google-Smtp-Source: AGHT+IH4N8/3oA4wTPg2n7e91UEX+RmIscvqAqA1lYwbrZipQb/yeKPrP5GdySfDb3Kadj7CbVN/Yg==
X-Received: by 2002:a17:902:d4c2:b0:21f:74ec:1ff0 with SMTP id d9443c01a7336-22a8a0a3892mr142523725ad.32.1744050083610;
        Mon, 07 Apr 2025 11:21:23 -0700 (PDT)
Received: from x1 ([97.115.235.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e612sm84407055ad.200.2025.04.07.11.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 11:21:23 -0700 (PDT)
Date: Mon, 7 Apr 2025 11:21:21 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock
 controller
Message-ID: <Z/QXofChW/HeJ7DJ@x1>
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
 <CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com>
 <20250403094425.876981-4-m.wilczynski@samsung.com>
 <Z/BoQIXKEhL3/q50@x1>
 <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_112124_495554_F5C40355 
X-CRM114-Status: GOOD (  30.18  )
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

On Mon, Apr 07, 2025 at 05:30:43PM +0200, Michal Wilczynski wrote:
> 
> 
> On 4/5/25 01:16, Drew Fustini wrote:
> > On Thu, Apr 03, 2025 at 11:44:25AM +0200, Michal Wilczynski wrote:
> >> VO clocks reside in a different address space from the AP clocks on the
> >> T-HEAD SoC. Add the device tree node of a clock-controller to handle
> >> VO address space as well.
> >>
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >> ---
> >>  arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> index 527336417765..d4cba0713cab 100644
> >> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> >> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> @@ -489,6 +489,13 @@ clk: clock-controller@ffef010000 {
> >>  			#clock-cells = <1>;
> >>  		};
> >>  
> >> +		clk_vo: clock-controller@ffef528050 {
> >> +			compatible = "thead,th1520-clk-vo";
> >> +			reg = <0xff 0xef528050 0x0 0xfb0>;
> > 
> > Thanks for your patch. It is great to have more of the clocks supported
> > upstream.
> > 
> > The TH1520 System User Manual shows 0xFF_EF52_8000 for VO_SUBSYS on page
> > 205. Is there a reason you decided to use 0xFF_EF52_8050 as the base?
> > 
> > I see on page 213 that the first register for VO_SUBSYS starts with
> > VOSYS_CLK_GATE at offset 0x50. I figure you did this to have the
> > CCU_GATE macros use offset of 0x0 instead 0x50.
> > 
> > I kind of think the reg property using the actual base address
> > (0xFF_EF52_8000) makes more sense as that's a closer match to the tables
> > in the manual. But I don't have a strong preference if you think think
> > using 0xef528050 makes the CCU_GATE macros easier to read.
> 
> Thank you for your comment.
> 
> This was discussed some time ago. The main issue was that the address
> space was fragmented between clocks and resets. Initially, I proposed
> using syscon as a way to abstract this, but the idea wasn't particularly
> well received.
> 
> So at the start of the 0xFF_EF52_8000 there is a reset register GPU_RST_CFG
> I need for resetting the GPU.
> 
> For reference, here's the earlier discussion: [1]
> 
> [1] - https://lore.kernel.org/all/1b05b11b2a8287c0ff4b6bdd079988c7.sboyd@kernel.org/

Thanks for the explanation.

Reviewed-by: Drew Fustini <drew@pdp7.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
