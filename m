Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D16C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 15:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrdzQBEX2OR6MKw7SEkMjzkPql5b+CpR8n0GASMa2fc=; b=b4c2gbyuACr6JI
	I60EjNsQhcgQr0X18gCQ/fGqpLfiMHXqNuIL3syMuB5pNzOdyMX6wLzBo9mg+tqH3xK7byT8lBsux
	C3Bok8BQhc0rnCtjph2susGDw2u77acf77sCsToHJe1GFzFHQ+vZxrLyqDftrv/CcMmDC6mv/hOJV
	Q3cZTro8gJoPvSEHkHrJNNPE1u5Fhjv1adnQIL9l0YMlHcLlxS3tgs81LhChEgBZIYP8HMzKB7KDU
	3iYZt6A+5ET+uvmUg4AAx+sNYXietG7oT1Ytp3LjewOQSr4jJ8rggC363s6IWrkaw4TWIXvIr01/4
	5s8HRxDoYW8gNYlH+Buw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px8QN-009Es0-0X;
	Thu, 11 May 2023 15:41:47 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px8QL-009Er4-33
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 May 2023 15:41:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YCSKwIYzbu1pkwEd81TZJ4LTNXSEnly6dMUBXhXOwZk=; b=eKKcTZ0dHxW81KiePIJiZJylBs
	s5+gbAWkSeJM4ksFErL9WGY1uRM0f4YbPPki6mm1MrThW85aVlVyqS2FuwW5Uvc81L3pMZ6MJFdKe
	cOMzHnuthAbtwjysvPNkywFf1269lZQOl2aOb/Q0jleNppNEWyO0t7JpIGslmw3p7ontEH94ohUXk
	7gbeJF04hrzH9ncCs0TuEtiE2kgZiC/SstXKTLrrxmrkuRva+ndzZuMF/sLPmKh5TUAKLeM7gypRh
	M3jeXA9thvyi/TPDaOj5rZeM7jkirAP4ZvE5uKrCoT+eyoYtj8zV5gGbsb+4c6QSVJIAJGLXDCrAm
	dcVkHGsw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px8QH-008HZP-26
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 15:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YCSKwIYzbu1pkwEd81TZJ4LTNXSEnly6dMUBXhXOwZk=; b=C/X4refVDazo6iOvpswWYfmKJr
	xxGKA45yPV1b1pGaDv1+YmeyRo1aqAV6NOsaU1nCxW+UXZPmhOW2JsKZpBq92NCYZmZY35c20ajHo
	DdghuIsUAaDIYKNSik2LuduCs8q8zJs6SBJMu/1uC98k1PCVadn7U6nxPiOnbytKO1js=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1px8Pv-00CZXR-4U; Thu, 11 May 2023 17:41:19 +0200
Date: Thu, 11 May 2023 17:41:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Pranavi Somisetty <pranavi.somisetty@amd.com>
Cc: nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, richardcochran@gmail.com, linux@armlinux.org.uk,
	palmer@dabbelt.com, git@amd.com, michal.simek@amd.com,
	harini.katakam@amd.com, radhey.shyam.pandey@amd.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: cdns,macb: Add
 rx-watermark property
Message-ID: <5872254a-7a33-4aa5-afa3-50ad5d8c7002@lunn.ch>
References: <20230511071214.18611-1-pranavi.somisetty@amd.com>
 <20230511071214.18611-2-pranavi.somisetty@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230511071214.18611-2-pranavi.somisetty@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_164141_754594_CA0F91EA 
X-CRM114-Status: GOOD (  12.48  )
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

On Thu, May 11, 2023 at 01:12:13AM -0600, Pranavi Somisetty wrote:
> watermark value is the minimum amount of packet data
> required to activate the forwarding process. The watermark
> implementation and maximum size is dependent on the device
> where Cadence MACB/GEM is used.
> 
> Signed-off-by: Pranavi Somisetty <pranavi.somisetty@amd.com>
> ---
>  Documentation/devicetree/bindings/net/cdns,macb.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/cdns,macb.yaml b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> index bef5e0f895be..779bc25cf005 100644
> --- a/Documentation/devicetree/bindings/net/cdns,macb.yaml
> +++ b/Documentation/devicetree/bindings/net/cdns,macb.yaml
> @@ -109,6 +109,13 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  rx-watermark:
> +    maxItems: 1
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description:
> +      Set watermark value for pbuf_rxcutthru reg and enable
> +      rx partial store and forward.

What are the units? Frames, octets, DMA scatter-gather segments, % of
maximum?

	Andrew

---
pw-bot: cr


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
