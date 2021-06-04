Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD29C48BC2
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 19:42:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FDA76135D
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 19:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FDA76135D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XM34UdbONP1dKlOKdAojhwR4phQJpJhwgcouykLYf9Q=; b=mWMiiMn6Ba9VLp
	WEpZTCXxSlaLDDaPtT4jpB384d3olAMRqIZjQ5Q3r/R8kZzXZxAic01FzExz2AOWTRzu7zadx1Y6s
	NgfJUDUdxXzfwCVG8NeLOcijobycPnuNyvAGktvy8HAR6VE3+MZrXDQWq4oAkBmt5hmA+1VaZ6Yrs
	d6sOyN2uRSoBUpGqNYPZVDnyDfDuBymBHRbLNwcd6wUw/tfrllCMheVfIHPigrkb9lV9m0WiFLZ+9
	EaoPyrKWFkzWAyp74Zh9tJSHiuJGBiOZyZroc48VyB6yMzPvGDTiCU0HcHqxc99Ry5Ok1tnvHMVdP
	xdh0dTq4F4koHexDeaKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpFhm-00F1If-TY; Fri, 04 Jun 2021 19:42:06 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpFhk-00F1I2-Vu
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 19:42:06 +0000
Received: by mail-oi1-f181.google.com with SMTP id t140so5586674oih.0
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jun 2021 12:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Iwpzyxd5CbOxhvxW+jNhnkZOEathw49CJTutBIFswjg=;
 b=GrDKaIi5z9V4zgx5K5WWZdu2agMwhcUNxMnvnQD3fqi70NTE4NBfsip75Iy+xIV8zl
 iwFKwo66FeTf/0GNgpSvYZuFQSwx7WwYXTYgFgmYHEsgmGX1WCyMS4iCP7+yXErjyTLS
 VHhXFPOmT9c32GElAvbzlO4S0OVYy9znkteD5l1x1Nhn0+xcr3Lp/JmpuA+6k41JthA8
 XO1Px/b14btv6b4y593B9c/prjc8J1PaoZTOAjJyolH+o/LTuEUXqBMh+R6wnK0ICmU8
 lf/N3hU5rleHwsq/kqz0d8gAw+7uN+nnUijhWQboBXS6cmFWspkLVQYquZqktupbeRKJ
 +Ubw==
X-Gm-Message-State: AOAM532npNXDppdlVzRIbKaHS8XYYeWbUimRVIu5el/UC6+MrR5c9OYD
 tflGdU8gkO6Uo07TDON+Pg==
X-Google-Smtp-Source: ABdhPJxk36X+Us47SDRHve7A3Vu/JYp33N4YfM8CDgQaSY5bZK2wPJxk6oKzTRt618XcHomnaEhQRQ==
X-Received: by 2002:a05:6808:3a7:: with SMTP id
 n7mr11938789oie.140.1622835721393; 
 Fri, 04 Jun 2021 12:42:01 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t15sm661221oie.14.2021.06.04.12.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 12:42:00 -0700 (PDT)
Received: (nullmailer pid 3786315 invoked by uid 1000);
 Fri, 04 Jun 2021 19:41:59 -0000
Date: Fri, 4 Jun 2021 14:41:59 -0500
From: Rob Herring <robh@kernel.org>
To: Yanan Wang <wangyanan55@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, wanghaibin.wang@huawei.com
Subject: Re: [PATCH] Documentation: dt-bindings: Fix incorrect statement
Message-ID: <20210604194159.GA3781429@robh.at.kernel.org>
References: <20210521095720.5592-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210521095720.5592-1-wangyanan55@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_124205_052566_4A2B3134 
X-CRM114-Status: GOOD (  23.17  )
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

On Fri, May 21, 2021 at 05:57:20PM +0800, Yanan Wang wrote:
> It's found when reading the Doc.

Please improve the subject so we have some clue as to what the change is 
and what it applies to.
 
> In a SMP system, the hierarchy of CPUs now can be defined through
> four not three entities (socket/cluster/core/thread), so correct
> the statement to avoid possible confusion.
> 
> Since we are already there, also drop an extra space and tweak
> the title alignment. No real context change at all.

Since already here, converting to schema would be preferred over trivial 
fixes.

> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  Documentation/devicetree/bindings/cpu/cpu-topology.txt | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpu/cpu-topology.txt b/Documentation/devicetree/bindings/cpu/cpu-topology.txt
> index 9bd530a35d14..8b23a98c283c 100644
> --- a/Documentation/devicetree/bindings/cpu/cpu-topology.txt
> +++ b/Documentation/devicetree/bindings/cpu/cpu-topology.txt
> @@ -6,7 +6,7 @@ CPU topology binding description
>  1 - Introduction
>  ===========================================
>  
> -In a SMP system, the hierarchy of CPUs is defined through three entities that
> +In a SMP system, the hierarchy of CPUs is defined through four entities that
>  are used to describe the layout of physical CPUs in the system:
>  
>  - socket
> @@ -75,7 +75,7 @@ whose bindings are described in paragraph 3.
>  
>  The nodes describing the CPU topology (socket/cluster/core/thread) can
>  only be defined within the cpu-map node and every core/thread in the
> -system must be defined within the topology.  Any other configuration is
> +system must be defined within the topology. Any other configuration is
>  invalid and therefore must be ignored.
>  
>  ===========================================
> @@ -91,9 +91,9 @@ cpu-map child nodes which do not share a common parent node can have the same
>  name (ie same number N as other cpu-map child nodes at different device tree
>  levels) since name uniqueness will be guaranteed by the device tree hierarchy.
>  
> -===========================================
> +============================================
>  3 - socket/cluster/core/thread node bindings
> -===========================================
> +============================================
>  
>  Bindings for socket/cluster/cpu/thread nodes are defined as follows:
>  
> -- 
> 2.19.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
