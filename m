Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4555C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 23:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2zDcAnlCsByfc8JYPkpZnQVtctw1GpnKCnS3Wz3SFM=; b=iSFQv8HA1ECI5D
	MMGHxW3gmVOIUPEAeLExIXYuw5eBwlykV5uEucRHPRMU+kYrClBy+kchen5LOW+7zV4xus3VDTzaw
	koEDPAczLuXLZADjoEnZkpn8y7fxV708YjfWFSD772rieiuA7HHCjlIkistxibzOuT2ivhDkaP9/i
	/X/FzAcvZRM4zNH1PlOyVyBIRsUEfpd5s+U5qWxlCL54GeeFEGrUVk+VBjJ9t54APFwRmbGtiPGpf
	+rc/34EaLcWag5Mrxs2amRNrH0cNJpZRs3e6hF4bH/SGFg1mzIjPtXuZ2yf9IdR8JPbYiOV59+LcN
	ElUbfilXgreUOZAgMa4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5xyd-003Efa-7C; Mon, 27 Jun 2022 23:17:07 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5xya-003Een-M5
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 23:17:05 +0000
Received: by mail-io1-f44.google.com with SMTP id p128so11248471iof.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 16:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ch0+XgUThIc/l8CQOuy5NljTuESRwdl/Mc/QQ/GRHwY=;
        b=CsSZaLlxLoofz19kZgx+S3blBjKpKj887dv0CdBOiuv9i9LBdYbPdByyhDdli2E/Ls
         58Pl6V4LvnvFBwmAx2cyVBBZ+bFWA0uMFWQTkG5n1tTiYdcQUsT2cXwG2s+ov5+Yiotf
         i7DA7TzHmLg1fIMSA7llJjKaBZtCuyVDWIw+Jcbjd5oduBg9gRvWGFF1yoF5l3Vrht3K
         ZMYtEgIIqCuSOp6xrtHHXMs4rYYZX10/fkvyU7kE+sj0riCwO7zdpqa+SSopfhBOrKbw
         O7ne5uwmmSzhzaILdO6ddDD1cxfvgitAJAb1slxTtYINDZbIXFRAwwVhihtOEUuGiSgY
         Tpsg==
X-Gm-Message-State: AJIora8d937Hm1i43q6xwmpIZ9P1emCEo3wix7PuK+AEuemMUXsjmTBV
	m1WO9mx8964EvicLtKSLbA==
X-Google-Smtp-Source: AGRyM1sQjARQFnKoj25XCNLdCib4jTOupm0g5QOmkXXsBc0eHF5rPc9gxrBwiTwvftgDQ3k5Qq4cZA==
X-Received: by 2002:a05:6638:190f:b0:339:bc9b:4d90 with SMTP id p15-20020a056638190f00b00339bc9b4d90mr9292586jal.153.1656371822830;
        Mon, 27 Jun 2022 16:17:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id p16-20020a92d690000000b002daa70b6a83sm630571iln.20.2022.06.27.16.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 16:17:02 -0700 (PDT)
Received: (nullmailer pid 3150543 invoked by uid 1000);
	Mon, 27 Jun 2022 23:17:00 -0000
Date: Mon, 27 Jun 2022 17:17:00 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Niklas Cassel <niklas.cassel@wdc.com>, 
	Dillon Min <dillon.minfei@gmail.com>, Heng Sia <jee.heng.sia@intel.com>, 
	Jose Abreu <joabreu@synopsys.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dmaengine@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-spi@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 02/14] dt-bindings: display: panel: allow ilitek,ili9341
 in isolation
Message-ID: <20220627231700.GA3144115-robh@kernel.org>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-3-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220618123035.563070-3-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_161704_758700_DEA71F88 
X-CRM114-Status: GOOD (  12.89  )
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

On Sat, Jun 18, 2022 at 01:30:24PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The dt-binding for the ilitek,ili9341 does not allow it to be used as a
> compatible in isolation. This generates a warning for the Canaan kd233
> devicetree:
> arch/riscv/boot/dts/canaan/canaan_kd233.dtb: panel@0: compatible:0: 'ilitek,ili9341' is not one of ['st,sf-tc240t-9370-t']
>         From schema: Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> arch/riscv/boot/dts/canaan/canaan_kd233.dtb: panel@0: compatible: ['ilitek,ili9341'] is too short
>         From schema: Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> Allow ilitek,ili9341 to be selected in isolation.

Just because you get a warning doesn't mean it is right. ili9341 is a 
panel driver IC, not a complete panel. It needs a more specific 
compatible.

Rob


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
