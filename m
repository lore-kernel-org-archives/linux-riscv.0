Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 893B1C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 23:30:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4474B207D1
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 23:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4474B207D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L0W/W/IOcdY0DkDQteOJOGLTKPkwxRsmPYl5Axco3E4=; b=3EiuSVRdyG8i8LwrDP7KqBOmP
	IChgZRaDKOY/rDm3VHqvCr3at+5YHrnCeAM54DH8LD8kpXXb9UxYpVD2pqtEgvadRZgxHb99wfm4u
	Z+O/9SUGqAAIYgFql7hECHeiJA92EmHm2Nw2y6BFCn0rXFfKkc+HDbss6fpvp0IjVkxcJDXWdalUg
	+Z9qCbitC14atB9DDtDPrUWBVO+0NF3bxcBOmM5uwQ2YyVkSjisyBV9h3eHbftakcbRRtRN46wP7Y
	tmEQMmB/3bzSJ81xbyKUONzEMRGoP7kpFcHzSzl7k1YAX02aHykUEE0j7v/3AkKnxLAl8B+iKa+64
	+PSjwpwwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn8uY-0007Ty-JP; Wed, 09 Dec 2020 23:30:18 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn8uV-0007TX-LH
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 23:30:16 +0000
Received: by mail-ot1-f68.google.com with SMTP id h18so3148776otq.12
 for <linux-riscv@lists.infradead.org>; Wed, 09 Dec 2020 15:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B0Asjv3XbyAFTbDKBsljyKhv/NpTZ/vtxsoSKiwLJis=;
 b=j/aN3KZt3rW2MIy5gU6VcBFYSqJglKXQY8Of6X+8BzbnxSjhNVrFgS1/FwIMCXpjNb
 FW1nkG8RpYb3/9i5X4zf71yNacRSuDMgQiLDC0Tv32PhEfFP8d2MlOs147ZW2rL0Byjn
 ZrjbZXOolqEhC1Tw922zgvB51kaUcgELFgkQElmlaYbvShyeS7qTH7YqFLi/URzJIfaQ
 t4P2NQOLTtZv0TebUSKMflz26FE3Mzv7gAT3rWidGCqFU0/Yos9ioQom7C7ogu3W8Csb
 Dy67d2n3HVvEcN4XwUctSdSVnlpSScTXWMJjfKC4VSDEPnEQ2n0zH7/NXJTNKnGLaUY/
 1/fQ==
X-Gm-Message-State: AOAM531UgHRpovoS4aoMCbuIXqLxdsEs5Usx26BjP0IWKd11pyICfD4X
 h9WxVlDjrxNG34Utzff5FQ==
X-Google-Smtp-Source: ABdhPJyebnMDO1idYvlHeSFT8mQf086CjkENt81nzyUnEjEz9CGaSHhlfhM4muLZ79s59u3SrEfCxQ==
X-Received: by 2002:a9d:479a:: with SMTP id b26mr3786121otf.297.1607556614465; 
 Wed, 09 Dec 2020 15:30:14 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t19sm753901otp.36.2020.12.09.15.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 15:30:13 -0800 (PST)
Received: (nullmailer pid 1281044 invoked by uid 1000);
 Wed, 09 Dec 2020 23:30:11 -0000
Date: Wed, 9 Dec 2020 17:30:11 -0600
From: Rob Herring <robh@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: riscv: microchip: Add YAML
 documentation for the PolarFire SoC
Message-ID: <20201209233011.GA1276461@robh.at.kernel.org>
References: <20201204085835.2406541-1-atish.patra@wdc.com>
 <20201204085835.2406541-3-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204085835.2406541-3-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_183015_786428_CD6CFC10 
X-CRM114-Status: GOOD (  14.54  )
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
Cc: devicetree@vger.kernel.org, Conor.Dooley@microchip.com,
 Anup Patel <anup.patel@wdc.com>, Cyril.Jean@microchip.com,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Bin Meng <bin.meng@windriver.com>, linux-kernel@vger.kernel.org,
 Ivan.Griffin@microchip.com, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 04, 2020 at 12:58:32AM -0800, Atish Patra wrote:
> Add YAML DT binding documentation for the Microchip PolarFire SoC.
> It is documented at:
> 
> https://www.microsemi.com/products/fpga-soc/polarfire-soc-icicle-quick-start-guide
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  .../devicetree/bindings/riscv/microchip.yaml  | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/microchip.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
> new file mode 100644
> index 000000000000..66e63c2bf359
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR MIT)

See what checkpatch.pl says.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/microchip.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PolarFire SoC-based boards device tree bindings
> +
> +maintainers:
> +  - Cyril Jean <Cyril.Jean@microchip.com>
> +  - Lewis Hanly <lewis.hanly@microchip.com>
> +
> +description:
> +  Microchip PolarFire SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    items:
> +      - enum:
> +          - microchip,mpfs-icicle-kit
> +      - const: microchip,polarfire-soc
> +      - const: microchip,mpfs

Is this last compatible really useful? Usually better to just have SoC 
and board (or SoM plus baseboard) compatibles.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
