Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD49C64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 00:01:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68B8020882
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 00:01:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QY4JjbSE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68B8020882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SEI+YVZl+uDIRns0XQCJMuNxThVzkzGVx9PT4sTl69w=; b=QY4JjbSEsKY0UJ
	/t0X7eo3s4j5D0KzSKNw03wzZ3vnaxbTzK79OJOUXeP4ISaDDWA6NwCUrgmzcw+ORP66NWHPBgQoH
	a/oKkqH04MAm//sdOqdHRjpQcaKvRrocy30lv5DhGa9I+6bN8B/XidqWIrcs1qjumGL20UvcvDdbC
	H+uMSq0qp2qa55w8DRSTuZOXAJiSJG7kR385V8UMY9kWDClq2DFNAnO/ZIKtt78oejkmP9AO/9te9
	7zgC2IySoOivk3z7owGU9f65uMoAQa+Ei5Jii8d/6QQRmdNQjHuqx3muX0l3MUpDxxlYtTPcuE9Uf
	TSyyjS2up+tQ1HZs31bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gV3a5-0001iD-Vl; Fri, 07 Dec 2018 00:01:21 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gV3a0-0001hK-Ed
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 00:01:20 +0000
Received: by mail-oi1-f195.google.com with SMTP id w13so1996417oiw.9
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 16:01:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LwzlsoSLS1LyoW+7m+QbMfUGASe8IlJLO+Uqy7FOS14=;
 b=IjMNuwcA6CAoJ/YKiTIBS3hchjSZ6eAQGUFgtZHiM6NGstVL0tOLDWIZQ6zS+mB8Re
 k+rQYrAv+OvWgYtaD1xJr4QvXFV5ep3AFrkjN8nMkd0ac5LPl/L3S32CVD4p4c/n8PHH
 IBL735Ap/w9h20eq07A4DLiLBvC8yafpeZRc4bvfAzYNVyCZzKUpbOuomRXS+F9m9oE+
 ICIMUkaFuLOBI3mVeUWVSScGMxXJ034vtnC8zAnigT5fIiMcRRkILLhqiTM8FD62jK2L
 Rfue3ubhOJlvRLAzljML+ePy5Mfik+qYuVHRsVep39U5KKJXAnOxxV50X8tTf1ij5+R2
 BImw==
X-Gm-Message-State: AA+aEWafT0AdqmGlwv2x+LBtm0+GDyTdvpeJDnUR5R5WKOKhms4y+YiY
 NyPDCza+GHY37siGmjCbXw==
X-Google-Smtp-Source: AFSGD/VdUsbOgINvbHC8AQaZ3lh1/pErRPfWUHp2SebyuvhnHsvaKhyq2BJmke6R4Bd0QL9tI/9ZQw==
X-Received: by 2002:aca:5c87:: with SMTP id
 q129mr19498529oib.189.1544140865662; 
 Thu, 06 Dec 2018 16:01:05 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z18sm672778otp.41.2018.12.06.16.01.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 16:01:04 -0800 (PST)
Date: Thu, 6 Dec 2018 18:01:04 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH] dt-bindings: sifive: describe sifive-blocks versioning
Message-ID: <20181207000104.GA10814@bogus>
References: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_160116_493963_47277803 
X-CRM114-Status: GOOD (  22.88  )
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
 paul@pwsan.com, Wesley Terpstra <wesley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Megan Wachs <megan@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 21, 2018 at 05:06:56PM -0800, Paul Walmsley wrote:
> 
> For IP blocks that are generated from the public, open-source
> sifive-blocks repository, describe the version numbering policy
> that its maintainers intend to use, upon request from Rob
> Herring <robh@kernel.org>.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Megan Wachs <megan@sifive.com>
> Cc: Wesley Terpstra <wesley@sifive.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> ---
> 
> Hi Rob, please let me know if this document works with your
> requirements, or if some changes are needed.  - Paul

Looks pretty good to me.

>  .../sifive/sifive-blocks-ip-versioning.txt    | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt

Use the path that was suggested.

> diff --git a/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt b/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> new file mode 100644
> index 000000000000..b899e5c6e00c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> @@ -0,0 +1,38 @@
> +DT compatible string versioning for SiFive open-source IP blocks
> +
> +This document describes the version specification for DT "compatible"
> +strings for open-source SiFive IP blocks.  HDL for these IP blocks
> +can be found in this public repository:
> +
> +https://github.com/sifive/sifive-blocks
> +
> +IP block-specific DT compatible strings are contained within the HDL,
> +in the form "sifive,<ip-block-name><integer version number>".

Really, my preference would be to add a '-v' in this:

sifive,<ip-block-name>-v<integer version number>

But given this ship has already sailed, I guess it is fine as is.

> +
> +An example is "sifive,uart0" from:
> +
> +https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/uart/UART.scala#L43

That's nice, but will be out of date as soon as someone adds or removes 
a line above it. Can you point to a tagged version?

> +
> +Until these IP blocks (or IP integration) support version
> +autodiscovery, the maintainers of these IP blocks intend to increment
> +the suffixed number in the compatible string whenever the software
> +interface to these IP blocks changes, or when the functionality of the
> +underlying IP blocks changes in a way that software should be aware of.
> +
> +Driver developers can use compatible string "match" values such as
> +"sifive,uart0" to indicate that their driver is compatible with the
> +register interface and functionality associated with the relevant
> +upstream sifive-blocks commits.  It is expected that most drivers will
> +match on these IP block-specific compatible strings.
> +
> +DT data authors, when writing data for a particular SoC, should
> +continue to specify an SoC-specific compatible string value, such as
> +"sifive,fu540-c000-uart".  This way, if SoC-specific
> +integration-specific bug fixes or workarounds are needed, the kernel
> +or other system software can match on this string to apply them.  The
> +IP block-specific compatible string (such as "sifive,uart0") should
> +then be specified as a subsequent value.
> +
> +An example of this style:
> +
> +    compatible = "sifive,fu540-c000-uart", "sifive,uart0";
> -- 
> 2.19.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
