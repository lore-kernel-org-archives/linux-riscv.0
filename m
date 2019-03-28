Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D3CC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 13:17:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 743422173C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 13:17:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eUtrCsfD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 743422173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p38847PTQNwv1SUgWv6pZdhZa9K+KiRVTPkb57d7IxQ=; b=eUtrCsfDVMr2FW
	s4IAKmXtmK+EZg38kwMNefj3oigXzKq+VNKBgaMqbnkXMxExjklBAz7MHZRZocO+X6kSNuugz1eqp
	Qq22kxFWT6RK8RG6B8OAeF/LYMBpmIG21pKY5ymHSZDZdnx39qN8FavxGMDCqY51DjCqqoWVo9IZV
	WL0satb4/Nl5oPTvMtXzt78qt7TaVNxy8V+HA24wpbDMXPQ7JqRV2OdaT1NZX7/54wGwDzXCyDn5m
	oaJ4FHYPegQabli+yZbNCqV+srsYPfqp9c2/B512l/KP+CU37LWhiMh3BisjNESVI4saAGZCmojC1
	8hTQphQ10ef4IxEkRBKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9Uu2-0001Qr-Lq; Thu, 28 Mar 2019 13:17:06 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9Utw-0001Pc-14
 for linux-riscv@lists.infradead.org; Thu, 28 Mar 2019 13:17:05 +0000
Received: by mail-oi1-f194.google.com with SMTP id w137so15718328oiw.5
 for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2019 06:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Pn3Ppnj79eCRo8oEYSf27YTL8dBpbQan26H5ouo+6fk=;
 b=TPHdZVp4GM6/E5fZqMhj0N3gh1YFA+tE2z2luntacIYFnSN3yHtsVe4SqVm1Wd7JON
 ves2vzj1aEg+Ug0sTE6YhcWAy9WNII2+fSmIzxgV3rJUCbaPRNwFTABOD4mNv+6lZyHt
 /yFmhuLwVXvreZtu5EyYzTKRHa0A7iFm+cfaEKDe9gdjb2OE4a3yirhWXJgSFp6yVdGL
 jW7abWeEl1aoQK30i+vuyvwsKZf+Y/P8nifyE82eBgFQLm+OJRL5OpT3gmNRlejlq02W
 2rNjlghbzJaAxZBNRWLgyt1pf+vIsq0ZpK/tv2c0p4+4anzLSDyZKbRLYh7KEcgeNsWP
 fCfA==
X-Gm-Message-State: APjAAAVs/E28ziqfx2q4vCoZFMzmNHfkxC+m8+nJpqpCXeozG15bKB7F
 Mu3ZzJMJGylqlTUf0Ll8HQ==
X-Google-Smtp-Source: APXvYqzz402a4nMNaEgT6CIkteO4kbA6vgSKjCTdCz2dYVkON/TRQtLZcTpMrZY5tqHmMbyuJdR2Hg==
X-Received: by 2002:aca:c687:: with SMTP id
 w129mr22553037oif.134.1553779018613; 
 Thu, 28 Mar 2019 06:16:58 -0700 (PDT)
Received: from localhost ([70.231.7.113])
 by smtp.gmail.com with ESMTPSA id k23sm10397135otr.6.2019.03.28.06.16.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Mar 2019 06:16:57 -0700 (PDT)
Date: Thu, 28 Mar 2019 08:16:57 -0500
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 1/2] edac: sifive: Add DT documentation for SiFive L2
 cache Controller
Message-ID: <20190328131657.GA9056@bogus>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1552382461-13051-2-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_061700_259940_8BB7BCAF 
X-CRM114-Status: GOOD (  16.18  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org, bp@alien8.de,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 12, 2019 at 02:51:00PM +0530, Yash Shah wrote:
> DT documentation for L2 cache controller added.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/edac/sifive-edac-l2.txt    | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
> 
> diff --git a/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
> new file mode 100644
> index 0000000..abce09f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/edac/sifive-edac-l2.txt
> @@ -0,0 +1,31 @@
> +SiFive L2 Cache EDAC driver device tree bindings
> +-------------------------------------------------
> +This driver uses the EDAC framework to report L2 cache controller ECC errors.

Bindings are for h/w blocks, not drivers. (And Boris may want a single 
driver, but bindings should reflect the h/w, not what Linux (currently) 
wants.

Are the only controls for ECC? Are all the cache attributes discoverable 
(size, ways, line size, level, etc.)? 

> +
> +- compatible: Should be "sifive,<chip>-ccache" and "sifive,ccache<version>".
> +  Supported compatible strings are:
> +  "sifive,fu540-c000-ccache" for the SiFive cache controller v0 as integrated
> +  onto the SiFive FU540 chip, and "sifive,ccache0" for the SiFive
> +  cache controller v0 IP block with no chip integration tweaks.
> +  Please refer to sifive-blocks-ip-versioning.txt for details
> +
> +- interrupts: Must contain 3 entries for FU540 (DirError, DataError, and
> +  DataFail signals) or 4 entries for other chips (DirError, DirFail, DataError,
> +  and DataFail signals)

3 or 4, but you only have 1 chip compatible defined?

> +
> +- interrupt-parent: Must be core interrupt controller

This is implied and could be in a parent node.

> +
> +- reg: Physical base address and size of L2 cache controller registers map
> +  A second range can indicate L2 Loosely Integrated Memory
> +
> +- reg-names: Names for the cells of reg, must contain "control" and "sideband"
> +
> +Example:
> +
> +cache-controller@2010000 {
> +	compatible = "sifive,fu540-c000-ccache", "sifive,ccache0";
> +	interrupt-parent = <&plic>;
> +	interrupts = <1 2 3>;
> +	reg = <0x0 0x2010000 0x0 0x1000 0x0 0x8000000 0x0 0x2000000>;
> +	reg-names = "control", "sideband";
> +};
> -- 
> 1.9.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
