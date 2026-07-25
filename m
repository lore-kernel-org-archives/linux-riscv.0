Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8B1C531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 01:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q73Oobc79tb0lQ9XF7fYF7YFhjlGrLjUQwEhKFkkG38=; b=x/S5w2w5xip6VE
	6sT5wHJwsT2xHJzCcI6LqBuSkmDA6D35KLVsW8TwZH2xXQNXq0rq46tcwIjX1dllyh24xZWtSkIMe
	y2EpaCFBw7HwGmoGGpOpOVG9pl6oAb/K6erOI0acNINeyQ6R8/pek9Ay7ojKSoKVb3yn0cdIOjyGR
	/q2+aL+gud1qbSU3sC1rMq8a8GAJfHUVeoVON40/Q9OsOJzUEKhdQE1KHh7cPtCxrpE1+kf06lm4B
	LTkVTYD5M9SkK1rqi8I1yXfsVJsGtAp/0Bb9iSGGjo76XcJhheZr0L1+w9Rnw6R4Mvf/DQKjseE6V
	xIcfLrX273+7b1ve30+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQll-0000000HQs4-1To6;
	Sat, 25 Jul 2026 01:01:37 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnQlj-0000000HQri-1EtD
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 01:01:36 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38511175ad3so626438a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 18:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784941294; x=1785546094; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eL0z5oMGThYMtVLCeXNbkW2YxtHOpeXLeMPRqOdxPNo=;
        b=nmXYwLKYNBjn0zuDfaizG31lKZgVvGMWVKpyCTEeTT9IC0EiGgwOoiLd27KzVyHRYG
         7iMdO6W53NJ6hO/kmYonha+PcAK90U9iS7ym858JEGPqQ0BjeihOgR8ZIQNgInmahFTR
         N3I3O1EKzbiMYEanliqdY7TN3+7AOLhs6T7YsMRUliZgcxVdcRjPyikIBUf95KiZ9lOx
         KSb+/nvZXDpYGZ5ciQrZpj2Lh9RnOxa+0dEF8SzY9iDWqy5IafexinxwSCZx2ggj3KF0
         vYc0cGGXYoU2KQ0udz54YIatTEbKb2cItI7CkZn4M7kYhObvvKEAUBqLjG7inTqklyLI
         OUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784941294; x=1785546094;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eL0z5oMGThYMtVLCeXNbkW2YxtHOpeXLeMPRqOdxPNo=;
        b=haSPJNHwRFj6Ya97OpSJqjH265/2LU1OlwbgtGGL6Ljm4UCb0IuqHV9/7/pVTuK5m0
         P7Zc1jHkyKkI9UUfwFq2uydhEGZRT1rJX/Lhwt8jo4gMTmY7ldB02UZ3eAt3YxfpYfmX
         bRyLj0C3fJF4KAa9NFCgOf475zjSa42Sfh2IbL1ZmZHmceSSvcb4bqXrPhURcxLwOpr1
         OF0/UYv6RC3yIbEBwLgr/FfL9FUZzmaBp7JPVT7TaJfdZyMShuzXWvihgOFQhPHWrdDx
         VhIKweDI9PoV+fYEKMjwb8A/yBBJ3OanL4lz3POI2VggeobRcyxxbMB2EL0wBSZZAJVb
         JUbg==
X-Forwarded-Encrypted: i=1; AHgh+RooWkA0y4kGUMijJYzVW3+OcpnBmDTbrhiETDngMj2XsdE1jl33ebOwhRwGHal3HYwEsTxcU5F3s5rpdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyW/EoxKa0yvkKP0y04/Ew+PHZHUQFEbdg4SuycIgVQYHNAExJD
	1HCS3HZJ9rWCRVtOJuq+G2Ukc8wr/YyAy8u3oe+ZhR0i1OfduhiiFcOv
X-Gm-Gg: AR+sD132WU0w4l8V2V/B9bf0MNmNGSTjAhl5Huy31dgjKnNH7Dn7RlyJlQAlGcYS5pV
	NdUWoYgcB5RylihU7AXiBBVzD6+ckf7eRVFgAzLAB5M2GejlnIqiL0z6nrk48M+tQrhFdD3MEJl
	ZtDdgAbOUevd8tBMUeVHKBTD5SWKMAQ9B1QrcmmiBHLyfxniGrexp93nCdejqHlvHLMhzGtYtfc
	K+z764/WgnLzZCje7LYi9SOLiqWWMnDVv8LJqDzyaKjz7/aphoDbrxxlS+eAqmsW5MIcimPxOPQ
	Dgw6+k/1XeIsSMgvdeJREemxDq8P+diPDsIXdnlhF/88NO03HJOWENpWx+b1K963CDH/fdMbFHo
	DWMFaB0BXU6DxiR1848nNdz7xoGGidkTIe5aiOzPBKd6PJU3D3i0RHcuvtMh2iQ==
X-Received: by 2002:a17:90b:3bce:b0:38e:e0b:320d with SMTP id 98e67ed59e1d1-38f297812c8mr631281a91.41.1784941294392;
        Fri, 24 Jul 2026 18:01:34 -0700 (PDT)
Received: from localhost ([2001:da8:7001:2000::1:5491])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03adb224sm2297589a91.2.2026.07.24.18.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 18:01:32 -0700 (PDT)
Date: Sat, 25 Jul 2026 09:01:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add enough deassert time for
 the PHY on PICO ITX
Message-ID: <amQKpgD7NKlR8qEE@inochi.infowork>
References: <20260710063314.1030249-1-inochiama@gmail.com>
 <20260710223804-GKB106000@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260710223804-GKB106000@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_180135_363662_C15294A1 
X-CRM114-Status: GOOD (  20.07  )
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

On Fri, Jul 10, 2026 at 10:38:04PM +0000, Yixun Lan wrote:
> Hi Inochi,
> 
> On 14:33 Fri 10 Jul     , Inochi Amaoto wrote:
> > RTL8211F require at least 50ms deassert to guarantee the register
> > access, 10ms is only enough for the PHY reset.
> > 
> IMO, it's kind of too trivial to split into two separate patches,
> while duplicating the commit message
> 

For backport, I suggest keeping two patches, so it can be backported
in a more clear way

Regards,
Inochi

> > Fixes: 74657a376960 ("riscv: dts: spacemit: Add ethernet device for K3")
> If you agree to squash the patches, then should be fine to put both Fixes here
> also suggest to adjust title to be more simple and explict
> riscv: dts: spacemit: Increase deassert time for PHY RTL8211F
> 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> the fix looks good to me, so
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> 
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > index 1eb5abbc61f9..b2a7d2d0d3a8 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -200,7 +200,7 @@ phy0: phy@1 {
> >  			reg = <1>;
> >  			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
> >  			reset-assert-us = <10000>;
> > -			reset-deassert-us = <10000>;
> > +			reset-deassert-us = <50000>;
> >  		};
> >  	};
> >  };
> > -- 
> > 2.55.0
> > 
> > 
> 
> -- 
> Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
