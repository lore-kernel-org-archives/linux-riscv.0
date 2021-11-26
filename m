Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160EDC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 00:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9BBeiZpH1n4oySsD9Nlm6zonLGfhhAsr64IX8qsjjI=; b=2iKu8hTeiePOtr
	pJV/hfxX495X0n60QmtbszgzF941ZzMRKsvyenYhptmgAxBKEz18hxylUCcSRf6gKvVXvV9DDX4S1
	CNN10tOpb6RNauQGEhI2D5tCg5MthOd7PhpNfxWHVQMNyDqmOZeWcH3A+xI+UmOtX8cwQbm4QZfi4
	B3MlncYKOWTtGcl12emrBhLyokhJZxJkWGIYiLth7l6M7GCb4vsZAYb5BOWrs7IDEo7SRVymHS9xQ
	VlDYuhEDJIF6+U0ctPjN6FdJzg8bFaYOpr6dgWEEM2rEIut1krXFRkc5iBsgMGE9H6N5U4+CXiMpP
	iJI96cXvwpFiOlV2xP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqOgP-008uVr-EJ; Fri, 26 Nov 2021 00:01:41 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqOgM-008uVC-NG
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 00:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1637884899; x=1669420899;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=skXtZu+B08GypQvVSh6izlTUDdUzL+y7dk1LX/ilERQ=;
 b=J1B6O7iKSugIAtdCCG+gbUuaN596+PNDn1JwF3IOQ2yB09uYDVXCUcSF
 8tLir7GHyrbyLVE6Zhq2bpIdUBVYZD7i1JtIkQk/h1fNwa/m3Ht2JUwOi
 J5tPpJoKEILWwQIsdtMRZZ9kJPTQZgWFfD6oV1v3phhDpN54Jkiymaqe0
 6xcm7VEiDdocvsPXe5YIFrWPo0h85fmKS4ZGRMIU/ZD96aOl6uaLZUH6q
 153B5ZPA3luEMRZvEI/BfG42ey1ki/jyFLyDAlRRQEV8hPDZTx/Ef6RyC
 TVoEP0ByujhoRbagiYXk4FpTHy4FiQUjE5B3yvHboQyUjv3q0ejTA+YCE g==;
X-IronPort-AV: E=Sophos;i="5.87,263,1631548800"; d="scan'208";a="187674457"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Nov 2021 08:01:33 +0800
IronPort-SDR: 9XVecdLFVZvLasS1aoDEu0l1g+P0gss7zaO4dk/rEL06EOAzL0Qh1NXzzi7hMDogdw7jPrZnNp
 081/I+oPyVmmiTto4cDrqj31iVjUD+qyOmEU02PH6QTQmvHdWo7DHNnZ3LgndhrfiNYfzKbWar
 J0p/cQUzhHtD7vbSlvR0ZPAnNUez5bychb3o3vd9vdU80sebYkPJN4Q8gZU4rt63Cdm5V6lEUS
 /kRNmrO1itIpj5RtcV0TFTekSlDgIzk0mhCqHyoyURb9qxtpgRk1y7eb9zJrQlmz5Nho4NoNaK
 Cc33Y3MCeXCkOuxvJxSBC97v
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 15:34:51 -0800
IronPort-SDR: LWfx5VEhU7/3yK718citgh0+xjVBSrDjIS05rbE5WYl3V8serhTuAcx8Kz+rV2Fq9iGQ/Beub0
 X/9t4NFSS/Rs9FxTQr0LNfAKvmofvtW0v0/GK3SEMq2C0ppPmauWgOcpztq4Fowas+QHoEnmcx
 LZGlRyNDMv6TmTFuTXLXtGXlserbJ5EyKeo9XdSe3Vs2HMItkarV86/hWDbkp/OlFeL0Pck6UM
 /t3obukF8L1fTNKVWGIqZ/C7lme1f+jYy1bTvmnAHQAe01RbkAs5Z3Y/Xc5dP7ogSEV/gWS20B
 /YA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 16:01:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J0ZfM6sKFz1RtVx
 for <linux-riscv@lists.infradead.org>; Thu, 25 Nov 2021 16:01:31 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1637884891; x=1640476892; bh=skXtZu+B08GypQvVSh6izlTUDdUzL+y7dk1
 LX/ilERQ=; b=qKohmARgvOKxhuc+fRA9gnCOydClERju4jeHU7DxtW3XoNJe0vh
 Fp9Nk/XXZybB4v/3XDQXozphhGS/vm+Aim/yomdqFQXsvkbN7H12AA/qej7mCVRx
 4E3ssNJ8Jw5GGglBIZt18Dpil7L3hgfwlac7BZ9TfwEDFcTDOMzSUEwr3xfCWXje
 yQylstJCrx6LDEIzj0oeEYZyT+GIWauiq3u1s6YyEPzWKJEMnBwZKDtxa6H7Z7OV
 yrr7zesEnqbjd9UNVESivWCh/CHyo8Q1v/CwNyITi0H+EZVFdOTNVvqpjAWpeErq
 qRQWU+YjJpoVzwkg5Ay8ytXCSM2iNyMarog==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id VR9f4RD9A0Tz for <linux-riscv@lists.infradead.org>;
 Thu, 25 Nov 2021 16:01:31 -0800 (PST)
Received: from [10.225.54.48] (unknown [10.225.54.48])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J0ZfK6v4Zz1RtVl;
 Thu, 25 Nov 2021 16:01:29 -0800 (PST)
Message-ID: <28be175a-8e9b-937a-de35-bcc218006fe9@opensource.wdc.com>
Date: Fri, 26 Nov 2021 09:01:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] dt-bindings: dma: snps,dw-axi-dmac: Document optional
 reset
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Heng Sia <jee.heng.sia@intel.com>
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20211125152008.162571-1-geert@linux-m68k.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
In-Reply-To: <20211125152008.162571-1-geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_160138_882639_E85B05CA 
X-CRM114-Status: GOOD (  17.31  )
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

On 2021/11/26 0:20, Geert Uytterhoeven wrote:
> "make dtbs_check":
> 
>     Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>     arch/riscv/boot/dts/canaan/sipeed_maix_bit.dt.yaml: dma-controller@50000000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	    From schema: Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> 
> The Synopsys DesignWare AXI DMA Controller on the Canaan K210 SoC
> exposes its reset signal.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index 90d9274e5464e396..06ddffaada295171 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -53,6 +53,9 @@ properties:
>      minimum: 1
>      maximum: 8
>  
> +  resets:
> +    maxItems: 1
> +
>    snps,dma-masters:
>      description: |
>        Number of AXI masters supported by the hardware.
> 

Looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
