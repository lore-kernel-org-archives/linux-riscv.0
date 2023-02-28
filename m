Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9DFC64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 14:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCHmlSDgMuuvCAnOHXeHLb1zgDgPEFpLa04EdmS5CZg=; b=MdI65xve+IAd6/
	y9u3F7c5NJFY6K7aH7kYNzP5xQwcMlBPkjgMDoy+vPscqcm2U8FTungR2n+MGjUzgWYONv60e/O/f
	FdoJVs0NEBE0HaxVqV2wLr8GuGxjlwMCfYdYGLwu5qWsW8LumbnlOC1uS6ugz62W6OSoKTYRIHezU
	28v2KF1DyPymQyhNOImi8WDGIXZQenhPhb6PzQgZOFCreajwRrV3D7cHjOipLYEd9RxjtQ3P+bazB
	jgrUg+rxWv9y0582H81tyD+RRV9c3cUhn8WCxa/h3AMBVBsw9n7AgNEhXHw9vq9Mi/+g5B4WK08vY
	miqSJI6tHrQZr52gdlJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX1Pn-00DZWg-OC; Tue, 28 Feb 2023 14:57:15 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX1Pk-00DZUn-Us
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 14:57:14 +0000
Received: by mail-oi1-f179.google.com with SMTP id s41so7428500oiw.13
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 06:57:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jz13ePRsdvAV4VQWspwggO2nF1bgHhH78z9EfhScQfo=;
        b=odnUD/EgUBODKdm2Yju0jBPB7DV202Ckxn7+XoJmxVNjxeQxF4WYre6VBPqSpNav1e
         sPgt+C948LAmZr/gqaqEiVrwjAhPMlaRIPLnQVLOW4IlI5hJuHZ8EUQn/ndo5cANVMB4
         UFGpVaXlgLt04ZArv3uM3FRMYxFrTvLFmGE7ud6u2O5hfLJhCeJ1kZQq9FqGtLBPt0/3
         Gz9wM1DXrHTENx4RYLostJu5kmLo7kpEa5w/4fiM+TWQi0r/n4r4tFI1J5zFJl1C926+
         xqOsqqscpwPuY2o/+1lleYOJjMs0K03vkE23IsSYw5iMoV7m+z5i5+phncDc41aBirXc
         oM4w==
X-Gm-Message-State: AO0yUKUPsWDNUFQruTI1L/bfCZuDOAk/reVnvuacidswHCssWQF/d9F4
	4Rw6fYQMRNs74/Z7+ETfzg==
X-Google-Smtp-Source: AK7set94DR+xwEQYa8X8GkWyWk88A0B84qdhXg17GydthqLk+zGWGRTBG3KHBfgVM1ahYSFwmLQceQ==
X-Received: by 2002:a54:470e:0:b0:383:ee1d:f4b2 with SMTP id k14-20020a54470e000000b00383ee1df4b2mr1658344oik.15.1677596230861;
        Tue, 28 Feb 2023 06:57:10 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bk15-20020a0568081a0f00b003845000eca7sm635702oib.1.2023.02.28.06.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 06:57:10 -0800 (PST)
Received: (nullmailer pid 3232983 invoked by uid 1000);
	Tue, 28 Feb 2023 14:57:09 -0000
Date: Tue, 28 Feb 2023 08:57:09 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, heiko@sntech.de, slewis@rivosinc.com, vineetg@rivosinc.com, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 4/7] dt-bindings: Add RISC-V misaligned access
 performance
Message-ID: <20230228145709.GA3198794-robh@kernel.org>
References: <20230221190858.3159617-1-evan@rivosinc.com>
 <20230221190858.3159617-5-evan@rivosinc.com>
 <Y/01c7sZ9ri5i8ao@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y/01c7sZ9ri5i8ao@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_065713_011722_17600C5F 
X-CRM114-Status: GOOD (  12.89  )
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

On Mon, Feb 27, 2023 at 10:57:55PM +0000, Conor Dooley wrote:
> Hey Evan,
> 
> On Tue, Feb 21, 2023 at 11:08:55AM -0800, Evan Green wrote:
> > From: Palmer Dabbelt <palmer@rivosinc.com>
> > 
> > This key allows device trees to specify the performance of misaligned
> > accesses to main memory regions from each CPU in the system.
> 
> Could you fold some of Palmer's explanation for why this must be in the
> devicetree? Think this is where he explained it:
> https://lore.kernel.org/all/mhng-8736b349-e27a-4372-81ca-3a25d2ec1e94@palmer-ri-x1c9/

I still don't think this belongs in DT and replied on the above thread.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
