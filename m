Return-Path: <SRS0=UFm3=P5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92B2C2F3A0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Jan 2019 14:10:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A910620861
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 21 Jan 2019 14:10:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GxKDYs4S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A910620861
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QO7eNOr0A7jZG+JrZ9vrGkvXrw43LSBIsleIRUF/mLI=; b=GxKDYs4SXnjp26
	EWI4R6CzXZrwX+LDOcBnt0J+zKTeU8ZKQC+jWSuq4GOBoTB4xmIChD97RXe80PCWQpqCfA+f8vsFW
	NbRa7fTdhgem7drZfnhuFHmNQ6f51U5OBtCEZdhb0pG8/qaf2SMYvcJYNTX/DvYwc7SBsEQ8w2I3h
	kJoSGA8Y/EsESo0azCMJqaGYih8OwWrPdt5p5cnPF1+0XH3ikeU4QI9TkbPMkjl6pemZMHRSYcM5o
	QU5YvDBhsAdUjUcXCOYDp4Tl09QFAzBah5PO+dCWLI97Zn3OiIUgm7/9RrsJl+ACZIpzAHKxGNeQH
	c+8v3uAnviNh9kbopIwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glaHr-0003Dc-L4; Mon, 21 Jan 2019 14:10:51 +0000
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glaHn-0003Cq-Tl
 for linux-riscv@lists.infradead.org; Mon, 21 Jan 2019 14:10:49 +0000
Received: by mail-lj1-f193.google.com with SMTP id k19-v6so17595123lji.11
 for <linux-riscv@lists.infradead.org>; Mon, 21 Jan 2019 06:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8jpIsQBQw8LJ2Rg1bqKD/AdjTLRe3AL1lYfFNor0shs=;
 b=aSeboZM1F/cuS2CFNy+snz/kn9Lw5A6uMmZFJARbyWs0BC0HUCWP1iUwD68Culk/4h
 uYraFCAUpLwZY2mt2cUrri0C/GBGgXuuZW2Zp2lQ4uMLx5DCNSLVYZrTMkJcIgtnvJ5x
 ydZiIIndQdAbemvP1h4yHW3tu5eVIRjgYKC93oK4iIiyf1fPSVUMVvJ5YqFFrdC3vyHt
 dK5Mb7TW9Bp0xFn18gIiN0+YnYFETfM7fT+mRcqkdjlAmSK+RYu6+QC4uu7e/zU+POJN
 U2fn+uELBuVdk1W7gbZVBfurHtPfRxt+mowFj5ieGI96C2ctWbbElraF3NmOpRoy+ROe
 gjDA==
X-Gm-Message-State: AJcUukfkS2lYqFEZ6pZyygXvGAh8Qx+A/z74eKB7AtZrEpphrM7tQlzs
 BRoWg3h+dTbv9NG73jrNJ/zBcmlf
X-Google-Smtp-Source: ALg8bN70hGTRSnrzSBC1jLEvfQyE7Sm582UUirijl92Kc4H35LLCPrw9baZaJXEHY8+7pcPiG83/qA==
X-Received: by 2002:a2e:9849:: with SMTP id e9-v6mr17974492ljj.9.1548079845547; 
 Mon, 21 Jan 2019 06:10:45 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id q10-v6sm2295968ljj.3.2019.01.21.06.10.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Jan 2019 06:10:44 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@kernel.org>)
 id 1glaHg-0001iu-TD; Mon, 21 Jan 2019 15:10:40 +0100
Date: Mon, 21 Jan 2019 15:10:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 5/7] riscv: dts: add initial support for the SiFive
 FU540-C000 SoC
Message-ID: <20190121141040.GM3691@localhost>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
 <20181215052154.24347-6-paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181215052154.24347-6-paul.walmsley@sifive.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_061047_960190_C9409732 
X-CRM114-Status: GOOD (  15.48  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 14, 2018 at 09:21:52PM -0800, Paul Walmsley wrote:
> Add initial support for the SiFive FU540-C000 SoC.  This is a 28nm SoC
> based around the SiFive U54-MC core complex and a TileLink
> interconnect.
> 
> This file is expected to grow considerably as more device drivers are
> added to the kernel.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 182 +++++++++++++++++++++
>  1 file changed, 182 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> 
> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> new file mode 100644
> index 000000000000..0ef314cf17b6
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi

> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		timebase-frequency = <1000000>;
> +		cpu0: cpu@0 {
> +			clock-frequency = <0>;
> +			compatible = "sifive,e51", "sifive,rocket0";

Looks like you forgot the currently required "riscv" compatible here and
below.

But perhaps it's the binding and arch code that should be revised
instead (e.g. as per your discussion with Rob elsewhere in this thread).

Johan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
