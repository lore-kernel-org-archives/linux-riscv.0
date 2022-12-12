Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB006C4708E
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 17:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQJak4pCuKJb085yCpmtnqXeJXB46PII5RPjTJyb3I4=; b=BfcGSobJnSDwYc
	C9ss8egigTzSFPLLTyez/rkt9OEqJ75pkBkB7kcTf/lA6zeE18nWtdB+8T9xkX8+zmr/MvsELn/Se
	tpx35Yaje01wbZXoiyfDBkVglquIuY7WxqSLMc4YL1xeBDLmbJeTQce9XeDZ/h8bfxXc7ouJyVRAl
	ndnPT1kAhEkihhdss5Gog4+6qXz60fWc/L6l+LeNo6PRUF3pS+geMNTkiyQ1MHCJQxA/O/35tDmSu
	jA4Fwvzw4uSfX9t8w+KLIokHCrY1e4nCc5dDjYrn+G84PRenFNWOZo1Nxp1Jmj0riMKNm1EndsbNi
	h3GFGLjZmFYavhfG9tJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4mbO-002kEt-6L; Mon, 12 Dec 2022 17:28:30 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4mbL-002k9A-4s
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 17:28:28 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1433ef3b61fso9208126fac.10
        for <linux-riscv@lists.infradead.org>; Mon, 12 Dec 2022 09:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIZU7lLd7LTeyCvnIo5M5LnCfVrp3nfTga9aSk80knY=;
        b=CCgMMftqeuBcaKm0iiGXR5fKwWcGs5g+KW64rxNLAFrG9OLZFMUBFEkFCvdAfKLcbK
         aw5rvmzqfu3SfB6rN9oeAYuhFef7D4WDCaXTYDeA6NCN1W0LpPuPvNgXDirKB3jzTGR/
         3n+9LFLIVXo3QxxU1ZrpRRTaLymEX2DnNIg6sI2NAFgobmCQJX5FoZ9cn/+H3L0q7T0t
         lxLYV1XvnIUCCAQqaU0n4vPB/e4Iy9Hi85+1/e261iEuc850i+LUspI26GitGVk3tyO/
         6k8tGOvEfro621Qjq0Y2mEfUqOfsk5ZDwORo5VfftQ7JTRxwbu560MHBjZCuHumxY234
         rxvA==
X-Gm-Message-State: ANoB5pkQ3ZjNHixQ3ZF3mrXu9SkClnahDmA2KwzVub/5+UeiqBv2Fviu
	sXtDwrRPVrqbvhJSTp2EGQPLEcL9xw==
X-Google-Smtp-Source: AA0mqf5osDHOzY5qrYDmnlHr4QDPnXNRcjhNYUoh8aFQJ3z+OABKLxdD1DQ1N/bzxBYuK3TqgsdPug==
X-Received: by 2002:a05:6870:a79d:b0:13d:9fdd:dc0f with SMTP id x29-20020a056870a79d00b0013d9fdddc0fmr9495469oao.7.1670866104139;
        Mon, 12 Dec 2022 09:28:24 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r7-20020a056870e8c700b0014435b51ef7sm163994oan.30.2022.12.12.09.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 09:28:23 -0800 (PST)
Received: (nullmailer pid 1167733 invoked by uid 1000);
	Mon, 12 Dec 2022 17:28:22 -0000
Date: Mon, 12 Dec 2022 11:28:22 -0600
From: Rob Herring <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, linux-renesas-soc@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: cache: r9a07g043f-l2-cache: Add DT
 binding documentation for L2 cache controller
Message-ID: <167086610192.1167675.3784027898209853936.robh@kernel.org>
References: <20221212115505.36770-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221212115505.36770-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221212115505.36770-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_092827_209694_446A6B53 
X-CRM114-Status: GOOD (  12.54  )
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


On Mon, 12 Dec 2022 11:55:04 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add DT binding documentation for L2 cache controller found on RZ/Five SoC.
> 
> The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> Single) from Andes. The AX45MP core has an L2 cache controller, this patch
> describes the L2 cache block.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4 -> v5
> * Dropped L2 cache configuration properties
> * Dropped PMA configuration properties
> * Ordered the required list to match the properties list
> 
> RFC v3 -> v4
> * Dropped l2 cache configuration parameters
> * s/larger/large
> * Added minItems/maxItems for andestech,pma-regions
> ---
>  .../cache/andestech,ax45mp-cache.yaml         | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
