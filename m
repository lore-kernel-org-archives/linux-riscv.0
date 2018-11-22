Return-Path: <SRS0=rW/4=OB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C810C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Nov 2018 01:33:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DBBD2075B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 22 Nov 2018 01:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qYXeIe5m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Dn7RsuIm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DBBD2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RKRQZArk3HVmLtpDYL+V6VKUZCXgipfExzdcjUU68Ts=; b=qYXeIe5mIy3hd0Xn2V9ehr7Ln
	iSaCdZmiAgBxxu9c0D3OzRuE0zUQnkBYw1AHf6weidHCEYNcE3bW3T3Zwme0XYxotDHspNkSc1G3z
	eBMlpVvgAgAHLH4BhoR2U/qeB6SnXYTuAlOzeuk51SRFvS1PwWJNrqWJkqR4IgEy/ZBQA0u6YcTEg
	VSvARcFuCpSzAoEA8AjPbE+kvRNgcORFWcsAtZP3euujVbh4pAn2Zy/y0ZnkBkgw/ZV5b6DGHL5rX
	/iaAuGcKtzLC1wvRLkAxQjXrNtS+YDX1ifZ8rcEmoUpi/UNIX+CmIIl95tgfYXrXe6xtyvMkSgOFy
	6dqP0Ruew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPdru-0006e2-Jo; Thu, 22 Nov 2018 01:33:22 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPdrr-0006cf-B7
 for linux-riscv@lists.infradead.org; Thu, 22 Nov 2018 01:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1542850400; x=1574386400;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=oLQT0GYVT35cr6JKZjSsUjHwzJHgOxZfW3U3a4fVL8I=;
 b=Dn7RsuImGjNAooQNMilx8xMV9HxK4DDhQQz5apIRyhOMfZKm9rCNsP58
 s9O0WRfHTYerKFlbAaC4Rx7KSk7pdtJMYb+EuI5YQQCpSn0VbE9s9GGUR
 ELjeexOfOq7fSnEpteLd5MaIXZ8i7MgU06NHqCvZXqaqv4k7c0QG2eKaq
 SPA1QPafOcxfQT6FZbXs4iq/Ec/GMegCAe7Rl0K498w2Aj8JvD+yxShal
 KQfurQ7C19E4CTN71NNpT+BspAprgd9v8ov8IzhhKYk4kt6vOzsmLGO66
 25tmYnnEtCer2wetrrl+OSD5SMMsVRpqtJCnTh45+Ksjl0NZ2TjotTV4I g==;
X-IronPort-AV: E=Sophos;i="5.56,263,1539619200"; d="scan'208";a="96573397"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Nov 2018 09:33:05 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 21 Nov 2018 17:16:16 -0800
Received: from usa005005.ad.shared (HELO [10.86.56.42]) ([10.86.56.42])
 by uls-op-cesaip02.wdc.com with ESMTP; 21 Nov 2018 17:33:03 -0800
Subject: Re: [PATCH] dt-bindings: sifive: describe sifive-blocks versioning
To: Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring
 <robh+dt@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
References: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <eda63b4a-4371-7d34-38a0-d7136dfc417f@wdc.com>
Date: Wed, 21 Nov 2018 17:33:02 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.9999.1811211704520.16271@viisi.sifive.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181121_173319_418126_F6D60CC1 
X-CRM114-Status: GOOD (  26.11  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "paul@pwsan.com" <paul@pwsan.com>,
 Megan Wachs <megan@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Wesley Terpstra <wesley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181122013302.2E3-tHrf_jRZpLrTFDQjkVCLLBTTHeaX3XUweIbQad8@z>

On 11/21/18 5:07 PM, Paul Walmsley wrote:
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
> 
>   .../sifive/sifive-blocks-ip-versioning.txt    | 38 +++++++++++++++++++
>   1 file changed, 38 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> 
> diff --git a/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt b/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> new file mode 100644
> index 000000000000..b899e5c6e00c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt

It should be be under 
Documentation/devicetree/bindings/riscv/sifive/sifive-blocks-ip-versioning.txt 
?

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
> +
> +An example is "sifive,uart0" from:
> +
> +https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/uart/UART.scala#L43
> +
> +Until these IP blocks (or IP integration) support version
> +autodiscovery, the maintainers of these IP blocks intend to increment

/s/autodiscovery/auto discovery

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
> 

Just for the sake of completion, should this document also specify what 
should be the style of any possible closed IP as well?

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
