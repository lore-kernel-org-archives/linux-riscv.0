Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE85C001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTKEgMl4CybgRoyluNYN+gTjCMmpgaFmQIT6V4Gcbj4=; b=gODLH7wElqMJ6Q
	iyJIdejyQUf1K5NBxMl1wOS3elR6s+5iuq8Qe+iOa/KM+00cquRidMjiB+wTbghVRjgQ7plkBxFAe
	VDZB6yWmGFd/ShQJPKtVj0zl3XSjr7jhf9LKriLNTpGjpgrQuthHGbHy0MvnNnHUcf5d68RVjauqG
	d3W7PKHlcq+9aBmahLHr/rcxq++H5pwzeEghunUt4dsSUhfEWkXBWxbpJwnm21r2aHCl9I5LA2YUX
	Elix2kSA6EhDd7UPvzB208aH+TgcCbC9p30AZ0+zPFaz1Ue4yXyQFMiZtsso2SFqbOXdxACfzijho
	d74nc0DCyMb3v7HRet6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNzbJ-0055v0-1g;
	Mon, 24 Jul 2023 17:44:05 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNzbF-0055sx-2H
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 17:44:04 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-267fc04ec74so1354267a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 10:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690220640; x=1690825440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J3N277sEYZfKNrO9MSgzSByOw202Qb6E6AE2Nrgm8Q8=;
        b=pXWrrfQC+xm/I7SrWdFWX2zuH+1E5mrxuTv9MJiXatdV/yBxsIN76aenPgBa6F1asU
         A/pSWCyISxPe0BNdZNGGJd7u6/cJNA9Duz+0dwTktgPT5xRzHn2MVh2x66FaK9mf6lVb
         6m7XgEOUIjvabnqgFVFZCLd8mxChHgDoHZG+EYrmAU84KnVAX+AHf9H6f3SFcM+Hr6aK
         /36tGIqmT/JyKfKWGyqPyxdwJ3zxSZwDvzoP4y42kDPOFDJUVzmSp+fzKHaXjqsqD1lZ
         ewFiHZpAJaJwmVeSVUUgP9D4qB/HsNRv9fBDUUhL0a6Ue8rR5WKuAJHQe20jwcX2J6yL
         kAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690220640; x=1690825440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3N277sEYZfKNrO9MSgzSByOw202Qb6E6AE2Nrgm8Q8=;
        b=Hw9GwoR5NiDI6Pd4JDANx3cLIWEDvWkK5OS9J9fJvTKw1t94t25HkDJFfpySNBCVlJ
         KflJCIoa+Syz1gJiZuvXgDW2MsYN2gUwoCmjsNGuU5b1uaotJ9k50hpIQuLV2v8vaNHR
         9f/khpqpluVPuvtNnaR/7n7LdidOQAzuiNdLj52LtECvSf8rQ4bgB04srpnfQcxMt1vG
         JcjqEPYRDn7CuWTeoGo3X5NexIEwAKG9eQEaNKj5tpF7JDRKHgYc7i2vcHUFf4g1AuGg
         mCtdNRz/P6AJfoHwKsTsoAetenV1Z4l75QOq4fqPsuzzfMWmFm8/4jG97Ybm69kbyTZC
         kFew==
X-Gm-Message-State: ABy/qLYxM6iXwjRe70rUYFzlPCd0xvirIOukWpgDNLno3f6d9Vaskx4h
	1jJRvCK2rGDMn+5hbX+x7F16PA==
X-Google-Smtp-Source: APBJJlHKKAkArEM0A/RRqvmco2eiWB6hUeTVUB1y2iEY5OE1TPkkxSBF9u6UOH+Qo2s/QCm60S/kiA==
X-Received: by 2002:a17:90b:1b0a:b0:263:2335:594e with SMTP id nu10-20020a17090b1b0a00b002632335594emr11297290pjb.38.1690220639962;
        Mon, 24 Jul 2023 10:43:59 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:b55a:eeb0:a3a8:248e])
        by smtp.gmail.com with ESMTPSA id ot15-20020a17090b3b4f00b0025bcdada95asm6815710pjb.38.2023.07.24.10.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 10:43:59 -0700 (PDT)
Date: Mon, 24 Jul 2023 10:43:57 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/3] riscv: Add BeagleV Ahead board support
Message-ID: <ZL64Xe56HUvYwuux@x1>
References: <20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com>
 <20230724-unwatched-left-f38189206b0d@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230724-unwatched-left-f38189206b0d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_104401_743656_1B494AE4 
X-CRM114-Status: GOOD (  14.98  )
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

On Mon, Jul 24, 2023 at 06:36:34PM +0100, Conor Dooley wrote:
> On Mon, Jul 24, 2023 at 10:20:37AM -0700, Drew Fustini wrote:
> > The BeagleV Ahead single board computer [1] features the T-Head TH1520
> > SoC. Similar to the Lichee Pi 4A series from Jisheng [2], this adds a
> > minimal device tree file to support booting to a basic shell [3].
> > 
> > Changes since v1:
> 
> > - Add dual license to dts file as Conor noted this is typical
> 
> I figure the dual licensing of the dtsi & sipeed board will be done
> separately?
> 
> What's here is 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the review.

Yes, I was thinking that would be a different series as a followup
to the original patch series that added th1520 and lpi4a.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
