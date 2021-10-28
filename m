Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC694C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 20:49:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A826B60F21
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 20:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A826B60F21
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BPHIdIH4/IpyIgoHAI8Ax5Ha0m4CyLU68xHbim3EgrU=; b=GQo3CxlFy2/7+a
	c3lm1LZA2O8rdCoaHXoOqt5PV9Qb8yiwcgMRrpGo3BYV14+LOUOl1Qgf/JDK/dvtBP5hBamvkUL9+
	9d7v/pqruk8+Hqrozcy8jWNUEcTMtsoP8eNKdmf+bbcLvoQ1d/gOdIxMAc7lxUvd8beD50mbWa8P5
	f+ouLWgCNMiJP1slzCeUAF181P3AWIrso6kcKBOD5V82+Eh9a3gqTx1wuKmy23I9NpVkkRM5Cui45
	mcSlLsy63n0AISX65CDwBrGk4eD2eHDdqt4NxymfbLFBqIyAS/Whmj2+jUFEc16kzTDPYNA9UCyEb
	WlfG4R3up5wWSG81vs6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgCKf-0094KQ-BU; Thu, 28 Oct 2021 20:49:05 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgCKd-0094Jp-IA
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 20:49:04 +0000
Received: by mail-wr1-x42a.google.com with SMTP id k7so12315370wrd.13
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 13:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3IvTfylI/s5zjCUTJoTbfVOltBPWwJQSWlH2bF2QUuk=;
 b=oDbwPY9FhMa5+lI34zwqKLXaGGEJP1uhqTbtRsJgcXK9YE2LdLZaiUk6cnSS0e/z7B
 NGrVlsXfrFTsjnJAwwqdqoPbDLCN13n0CUMg2Hnu9Bl0kC3Ynqw3gDSy7EFkY5hOaWsV
 cF0zEMmnNLEFqZq5usfApABvoY2RR5EkszAaoSGt/8bvwq4noNBArvxJqCHhkqxyKzRr
 TCdGfdedDm8XQDbRwnJRXjlusfgnqW9aWPfo1myOMwH/pLlZhbQeP8c90RfxBdZBXhPs
 3Z9fNnvvkFYCsQbWi5xjsw9AsZDY36nun2WGqIOWEjNfzCfRof3UPiUFd7N2JMgiPi4q
 l/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3IvTfylI/s5zjCUTJoTbfVOltBPWwJQSWlH2bF2QUuk=;
 b=mGRXofJbTeKJ4HX+b+o8H052B7E+vwpMS7RgdDobNpe1eUkEUW7UBIvhLfDXpLxbMS
 hYOvviLtg5nLuvVpJrJzvB3amXDRQavUqfOo16SQ5tBFKb0IVY+BfZOaeWrftuvldujh
 SQfcry2Or9ehI3uanSEANJBkwlR0+4ZUDlJnbRopSs0Cnmjc9cl4a/We0pC94ymXtK4J
 6rigUMcVgFWbpT/At31pa3OZnFXNiOteb+720MHtZmX2qkJgcQq82zK26XfNiu7vOrKj
 FzHSDgLrJwE8Lfdc0BCtOPhH2HDM9vEl0NQcQ/vtzigRI6AkLxG4w5ErZUfEGkrwrhX8
 L/KA==
X-Gm-Message-State: AOAM5315SpQsuw/el5CZdW1XZaVzoPoPR8E1ObfvnaETLQ3n+iOHpypo
 U98MXZCxMjRSZj0QiFgum7GoRCCcgXmWDx/J
X-Google-Smtp-Source: ABdhPJz5CVcMhbABFkm8qYpPeC8ZX0TX4ML2WSs+7463nI9XPEFL1WLEfTk4g3/yjS9ylWLJZoLIFw==
X-Received: by 2002:adf:a78a:: with SMTP id j10mr8764668wrc.231.1635454142409; 
 Thu, 28 Oct 2021 13:49:02 -0700 (PDT)
Received: from Jessicas-MacBook-Pro.local (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id m34sm2584987wms.25.2021.10.28.13.49.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Oct 2021 13:49:02 -0700 (PDT)
Received: by Jessicas-MacBook-Pro.local (Postfix, from userid 501)
 id 6C870927B2D0; Thu, 28 Oct 2021 21:48:54 +0100 (BST)
Date: Thu, 28 Oct 2021 21:48:54 +0100
From: Jessica Clarke <jrtc27@jrtc27.com>
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 devicetree@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [v4 10/11] riscv: dts: fu740: Add pmu node
Message-ID: <YXsMtrmuavGAHk8S@Jessicas-MacBook-Pro.local>
References: <20211025195350.242914-1-atish.patra@wdc.com>
 <20211025195350.242914-11-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211025195350.242914-11-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_134903_627730_C91DCAFA 
X-CRM114-Status: GOOD (  17.89  )
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

On Mon, Oct 25, 2021 at 12:53:49PM -0700, Atish Patra wrote:
> HiFive unmatched supports HPMCounters but does not implement mcountinhibit
> or sscof extension. Thus, perf monitoring can be used on the unmatched
> board without sampling.
> 
> Add the PMU node with compatible string so that Linux perf driver can
> utilize this to enable PMU.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> index abbb960f90a0..b35b96b58820 100644
> --- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> +++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> @@ -140,6 +140,9 @@ soc {
>  		#size-cells = <2>;
>  		compatible = "simple-bus";
>  		ranges;
> +		pmu {
> +			compatible = "riscv,pmu";
> +		};

This is a property of the user-replaceable firmware, not a property of
the hardware, so having this in the device tree under /soc, let alone
hard-coded in Linux, is utterly wrong. Why can this not just be probed
like any other SBI interface? The "Probe SBI extension" interface is
precisely for this kind of thing.

Jess

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
