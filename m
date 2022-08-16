Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666AEC25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 17:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RvYKDgyUoc0k99FqVCsNA7IUFDTOvFCYugqsh2KuyPg=; b=UWpTHebYycDekL
	SkB5+xhygo7exI13UkeFXKYGMoG/APg9cwC6wDsQzCv2pZym2xaHIvaGJsWFS/2lOCOj+iY1Lv0g1
	CbcX8p+7K/4Q9S/rKHbwUcwJ+DtS64EF01lM9cAhayP5vBfgOCjSYcbBlfhI7LFVjorLUGUYXkH3g
	vmkh2KDqmChAtXycAdZDVVNfsZJHwZI3vpGQWevNvVpACHyyOtmXSpDqLjoKbbHGYZr+l5+esDKRp
	sZpXKttN1lCv7QbEFvHyAzU11YWK+fW4PbQAfGCyEQ/8uJAStKP2FFyrySvTKbuwEyGcxuGE4ATD9
	O17JlGaSM1z2rxeJlCHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO0BZ-005D63-2s; Tue, 16 Aug 2022 17:17:01 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO0BU-005D2g-QV
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 17:16:59 +0000
Received: by mail-io1-f42.google.com with SMTP id b142so5828904iof.10
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 10:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=D6Sgt43wReIJnABbhCpmxjkDmeNfZCDyXj29Wo+CNs8=;
        b=D7I/0MBUwLKXXxHlmwUMB0RgH/WE+jVToMfzzdlSkEbxOcFpVTt4Tqy68794TB4eMg
         hbTp3Dpfdj3s7riVM6Bps+rwqwEIYzee3LBy4Bj4Bc1S5IMZ9KkjmaaHGfOugO326Bt1
         0gTcR9Zn2BChTQd7LzBv6Zr2wLdgKSPQhBGSzoW31YGXb60A+H93AiAFnQMRix/pqyx+
         NsU1rmIux46CQvcTHray19Tto0jKUNZsWbOAC/ajIhFonw84VpM2V9Y8D0yRQIS++V17
         RA2in0poN+WZwmhd7ra0qLjqFkEOncRFdpFDet4wJ1U62L0qef968pWHD79DOLbJ4waf
         NLvw==
X-Gm-Message-State: ACgBeo3PzVbti0aGAaoUYzimPlzQ5mYuCPwteHC7Rkz6BydhK7JQ0/v0
	7Axg7/51rRrcsm3EsbEDWg==
X-Google-Smtp-Source: AA6agR4UoyqZp5rPDlBv+twyXjIBp3pBBc8VUd5rGKNF9vZzXP9/deWo2SFDDC4yGZQAjMi/xA1z6A==
X-Received: by 2002:a05:6638:1450:b0:346:8b01:c980 with SMTP id l16-20020a056638145000b003468b01c980mr4307459jad.286.1660670214577;
        Tue, 16 Aug 2022 10:16:54 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f24-20020a02a118000000b00339df77c491sm4536515jag.114.2022.08.16.10.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 10:16:54 -0700 (PDT)
Received: (nullmailer pid 2399174 invoked by uid 1000);
	Tue, 16 Aug 2022 17:16:52 -0000
Date: Tue, 16 Aug 2022 11:16:52 -0600
From: Rob Herring <robh@kernel.org>
To: Conor.Dooley@microchip.com
Cc: krzysztof.kozlowski@linaro.org, mail@conchuod.ie, Daire.McNamara@microchip.com, bhelgaas@google.com, krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com, greentime.hu@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] dt-bindings: PCI: microchip,pcie-host: fix missing
 address translation property
Message-ID: <20220816171652.GA2390778-robh@kernel.org>
References: <20220811203306.179744-1-mail@conchuod.ie>
 <20220811203306.179744-5-mail@conchuod.ie>
 <edf3da1b-79dc-4e09-8d3e-73aca09e847f@linaro.org>
 <0dd12c70-70f9-1dc1-c5c8-a3ff15be81f6@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0dd12c70-70f9-1dc1-c5c8-a3ff15be81f6@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_101656_896159_423DD5B1 
X-CRM114-Status: GOOD (  29.34  )
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

On Fri, Aug 12, 2022 at 08:20:45AM +0000, Conor.Dooley@microchip.com wrote:
> On 12/08/2022 08:52, Krzysztof Kozlowski wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 11/08/2022 23:33, Conor Dooley wrote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> When the PCI controller node was added to the PolarFire SoC dtsi,
> >> dt-schema was not able to detect the presence of some undocumented
> >> properties due to how it handled unevaluatedProperties. v2022.08
> >> introduces better validation, producing the following error:
> >>
> >> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'microchip,axi-m-atr0' were unexpected)
> >>          From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> >>
> >> Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >> I feel like there's a pretty good chance that this is not the way this
> >> should have been done and the property should be marked as deprecated
> >> but I don't know enough about PCI to answer that.
> > 
> > It seems bindings were added incomplete and now based on DTS (which did
> > not match bindings), we keep adding "missing" properties. I don't think
> > it is good. It creates a precedence where someone might intentionally
> > sneak limited bindings (without controversial property) and later claim
> > "I forgot to include foo,bar".
> 
> Yup, again pretty much the same thoughts as me. I don't think that, even
> if the property is valid, should be either named as it is or only work
> for translation table 0.
> 
> > 
> > Therefore the property should pass review just like it is newly added
> > property.
> 
> SGTM.
> 
> > 
> >> ---
> >>   .../devicetree/bindings/pci/microchip,pcie-host.yaml  | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> >> index 9b123bcd034c..9ac34b33c4b2 100644
> >> --- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> >> +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> >> @@ -71,6 +71,17 @@ properties:
> >>     msi-parent:
> >>       description: MSI controller the device is capable of using.
> >>
> >> +  microchip,axi-m-atr0:
> > 
> > Name is not helping. If it is offset, add such suffix (see
> > brcm,iproc-pcie.yaml).
> > 
> > Unfortunately I don't know PCIe good enough to judge whether the
> > property makes any sense or some other ranges-style should be used.
> 
> Yup, I think it is similar to that. Except we have 4 tables rather
> than one.

Looks to me like dma-ranges is the answer.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
