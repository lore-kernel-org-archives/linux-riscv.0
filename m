Return-Path: <SRS0=nlXr=W3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08240C3A59B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2019 02:53:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF28921874
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 31 Aug 2019 02:53:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DzUzeCli";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WEFXcU/D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF28921874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nghDBzceOI6+hmbeBVK71+WJD38K8m+7UNAQZcJ1gZU=; b=DzUzeCliFnMh6O
	+o6IjTZcWbTihxogZClJ478u6nvnxWZfpDo/XgC9aaonW42mizbLBWsG7oyTueocoffZ5gpoo6uVs
	fPsTNGFFF/m7SAHiTiUFDAka17Y+nHPKmLT02SvJp9GJPDEGppX6UuxotYFtUtsnzQZ2832douJHO
	MWhNIgE7PX1Rv0uetWiz2b8fiYpE9JWwB9+WrPV4DlylWqAI3ldCOrTLKnBmBrW7NSq3yjofG1wke
	7fWUnk3vi3vaYevYJ0B7D7Tq7ayDKnyLNq58OmUIpebwgPR5bAK4nUGBOwBDiDnnBaYFSXUCbjNCI
	LHe0zNojhaHa8BshcvjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3tVy-0001Jv-Rj; Sat, 31 Aug 2019 02:53:22 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3tVv-0001Jb-8V
 for linux-riscv@lists.infradead.org; Sat, 31 Aug 2019 02:53:20 +0000
Received: by mail-pg1-x543.google.com with SMTP id w10so4432762pgj.7
 for <linux-riscv@lists.infradead.org>; Fri, 30 Aug 2019 19:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=TcyKIVZa6jDNzUj3tYKEQq2VBZtAcn28A/dAzDMcqB4=;
 b=WEFXcU/DVe/kv1NFGIue1kkWHjHKcmCywg9nrpJGCiS7ca6W4bHcBM3Cu27gMuR5HW
 uhB/dZVPFbIXfClOL8SnPxO1gxt/kSe123AhkS9dlpnzRIMB4xFdN+j28LPYPlpOf5jH
 Il+lak+vk4acWsOuL/1cgRkKDJq33XxaVya9p5gWcDnqX2DIQJeMkuIbFUoZOvlsIyPA
 WekqyeJle+vtM2rP11vXmJyE90jKsJibWyumscs5dCxyITX7yX5+QdYEE90HUGq6gM7q
 brauFe3CBWQQDuP2LHOGJVQ6f8jCdUzeLVHBFc9BikofxJ6rqOWsnm2GhHiPKZALGh3o
 EQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=TcyKIVZa6jDNzUj3tYKEQq2VBZtAcn28A/dAzDMcqB4=;
 b=puiwBSL0jiX7LnpBi+/c04w7+/8+fWGW82RDDRKx6JhsuPr42UCodQs24hLDrkoXqU
 mlP87LcPErc6wD5Kchs3HgoQsn2sARoPDJA9TJ45E1ip5hDyshr+0AOTPGfB4TiNs/bM
 NHKIR+hYvVoUPMcqa6SSnOj6WW8UJm8Mp/uQjSl1M5EW/DNv4I732RENqZfBgSCJng9r
 JZVC2sIKeU5GjpwWVlmYch0V8lJQSMpCRxAFkbRFlkrUbLMoQXjv3gVM81ujYZXPC+v1
 IZwNNJVH/GjWPxAvHFjvkkQF5iHK3Q+a5owKViBqwDiqissfnzC7/HVUYawQX5sk2f2a
 ND0Q==
X-Gm-Message-State: APjAAAXEJVFpuDa3onWtr6Z1VwYfcG+vp01SfgaHZZTCff1INHPC1DPB
 I1R8Sb1HfZ0ka82JiB3KgZzABA==
X-Google-Smtp-Source: APXvYqxfFVxDzm4BjpO5NkLMuM3Xv0D2H4t0n+BOM+Ax/QLKeOjyc8MmEjXrNdn3uuElKoxhoMgpaA==
X-Received: by 2002:a63:316:: with SMTP id 22mr4527823pgd.242.1567219998821;
 Fri, 30 Aug 2019 19:53:18 -0700 (PDT)
Received: from localhost ([216.9.110.10])
 by smtp.gmail.com with ESMTPSA id i14sm4289933pfo.158.2019.08.30.19.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2019 19:53:18 -0700 (PDT)
Date: Fri, 30 Aug 2019 19:53:17 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH] riscv: move sifive_l2_cache.c to drivers/soc
In-Reply-To: <20190822062635.00f6e507@coco.lan>
Message-ID: <alpine.DEB.2.21.9999.1908301951080.16731@viisi.sifive.com>
References: <20190818082935.14869-1-hch@lst.de>
 <20190819060904.GA4841@zn.tnic> <20190819062619.GA20211@lst.de>
 <20190822062635.00f6e507@coco.lan>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_195319_306152_37803C48 
X-CRM114-Status: GOOD (  10.06  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: palmer@sifive.com, linux-kernel@vger.kernel.org,
 Yash Shah <yash.shah@sifive.com>, Borislav Petkov <bp@alien8.de>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Mauro,

On Thu, 22 Aug 2019, Mauro Carvalho Chehab wrote:

> I'm wandering if we should at least add an entry for this one at
> MAINTAINERS, pointing it to the EDAC mailing list. Something like:
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7dfe381c8b43..1c3bc5aa3af0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5906,6 +5906,7 @@ M:	Yash Shah <yash.shah@sifive.com>
>  L:	linux-edac@vger.kernel.org
>  S:	Supported
>  F:	drivers/edac/sifive_edac.c
> +F:	drivers/soc/sifive/
>  
>  EDAC-SKYLAKE
>  M:	Tony Luck <tony.luck@intel.com>

There's already a MAINTAINERS entry that should cover drivers/soc/sifive.  
Probably it's not needed to add another one here.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
