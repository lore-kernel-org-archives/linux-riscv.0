Return-Path: <SRS0=yw/l=N4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFDCC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Nov 2018 16:33:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FA61206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Nov 2018 16:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JDgxPtd/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UtJvOtPy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FA61206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=psdoXYdKdKGT//kyz5X/1EXiE28fW8moSk3Py/ldqY8=; b=JDgxPtd/YTKfGs
	gS6fM7VIBaEuQCu0a0HVkNhYeGl1zmUUW+h+T4nbDMDw2Ke5crH0cIeVfEsapmT0+DqIGPP7NEPkC
	yYWKANRoLaOLaHhfMvF3POSpAlUjDhNlXKpT46M/8Y4lNHziBWFszekP521+OHaATqoeWlxA5s2V4
	VwyeisUXQbNwhVmirj4pjusaKTnSKDfZz22I6UxWT8syvg5ZCLkZ0Zx3pd45PAGHsRyUL+wpN/q/Y
	xAyR6JgfBBTJYLJonIDWLhcEXPdxOp0xbQrko5T0mwi+5Mr4Mdp45ZA3ts3oe7i4eVkhbL1A1sVU+
	GzQH+mPskIN/KfN8QTFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gO3Wx-0006Wj-JY; Sat, 17 Nov 2018 16:33:11 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gO3Ww-0006UG-Ej; Sat, 17 Nov 2018 16:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gMTz2EOiWaaOWYD5m3C66XRZowoKjupcKf4X9kojdWo=; b=UtJvOtPypmLjHLhou/fkJ4nUi
 EOpWNGnUNVdJMBfjpxhAmdQ8yNZaWZLOtM3lLD/tSv6GDkRETumiH2sKF1th17Hv1avmj/tNucnMC
 gdp6ZLcIXQIf2OrLibSY4wysNNGG+ejRC4EfrOwMBa7WGUdO+gpJ8adYBKOSyXPWeUmrWwtIDJIeO
 wKzY6QS33wkFkooLd2OIQQLgyi6zn9Uj3+1D3XA8XjmWP+6aSZm/E+8aQpjgLzLBr0KcopH1wV0Ab
 yDdWQ7wc2dkQ9VJR7ZVg+mwGhIdw1J/w3VTfiHbaxb0yLJJHj1EZiWkSZpuxWK7b4aTAQ02N++kli
 G0pBYNChA==;
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gO3Wt-0005M6-Q6; Sat, 17 Nov 2018 16:33:08 +0000
Received: by mail-ot1-f65.google.com with SMTP id 81so24148088otj.2;
 Sat, 17 Nov 2018 08:32:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gMTz2EOiWaaOWYD5m3C66XRZowoKjupcKf4X9kojdWo=;
 b=h3Nmgtm+Z9H9sRLEoaE8/6UBwQ9ZsQfa3IvmYuxH51Aw+gd5yOM8qPkbu363dqMFE+
 6Sgp68Ny+BpsM6AodjDZ5FPr5mpT/WQ0OCRWMkEVTyTGBpBHBcv5y7UuUvv3O8HbbrpT
 dZnl7M5puzp8TNj0Xfd3+ugI1G0P6ZwWGoXu8aUgEMWxqb2Pc0xyyz4ydp4nx/3J6Bse
 au19hbBm2PWgNbyUZSzx8mQ9rxZlRQkiLn0fL8PAuUQTtM8XZUtKuIuvbqD1rPspVFCt
 7wLZObkHGAYtyZzX4HrcUmo97hw6ReBXFJTDJA9SQblp/xmG8AgAFFvVWQcPFtC2rKGX
 YpuA==
X-Gm-Message-State: AGRZ1gL3lsI6NfRGZ3ks0X2XGvHDx6S3JRnhUDqTeDz7P3+RSaB23gLC
 1tjrsflcmFCo7Jl0WIvwsKkvO1I=
X-Google-Smtp-Source: AJdET5f50tIWITJCu9CME4nt+6IW49ZLepvBIXL2dKXkmvIkoLagQ71IUNZumYBa7aoXHP4B5PoYFQ==
X-Received: by 2002:a9d:192a:: with SMTP id j42mr8709218ota.36.1542472376119; 
 Sat, 17 Nov 2018 08:32:56 -0800 (PST)
Received: from localhost ([166.137.105.180])
 by smtp.gmail.com with ESMTPSA id c58sm29202087otd.34.2018.11.17.08.32.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 17 Nov 2018 08:32:55 -0800 (PST)
Date: Sat, 17 Nov 2018 10:32:53 -0600
From: Rob Herring <robh@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC 1/3] dt-binding: cpu-topology: Move cpu-map to a common
 binding.
Message-ID: <20181117163253.GA6713@bogus>
References: <1541728209-3224-1-git-send-email-atish.patra@wdc.com>
 <1541728209-3224-2-git-send-email-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1541728209-3224-2-git-send-email-atish.patra@wdc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181117_113307_908210_2F197353 
X-CRM114-Status: GOOD (  12.61  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 juri.lelli@arm.com, anup@brainfault.org, palmer@sifive.com,
 linux-kernel@vger.kernel.org, jeremy.linton@arm.com, sudeep.holla@arm.com,
 mick@ics.forth.gr, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181117163253.lhBqUyRl_bMc7CRhN1jtYh_Hfs1tw5WHMVGtAJhp23s@z>

On Thu, Nov 08, 2018 at 05:50:07PM -0800, Atish Patra wrote:
> cpu-map binding can be used to described cpu topology for both
> RISC-V & ARM. It makes more sense to move the binding to document
> to a common place.
> 
> The relevant discussion can be found here.
> https://lkml.org/lkml/2018/11/6/19
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  Documentation/devicetree/bindings/arm/topology.txt | 475 -------------------
>  .../devicetree/bindings/cpu/cpu-topology.txt       | 526 +++++++++++++++++++++
>  2 files changed, 526 insertions(+), 475 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/topology.txt
>  create mode 100644 Documentation/devicetree/bindings/cpu/cpu-topology.txt

Please send this with '-M' option so we just get the real changes.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
