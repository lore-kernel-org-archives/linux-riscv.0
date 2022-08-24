Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6DBC32796
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Aug 2022 13:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31N23mABFxSQcweM9t4Hq5j9GXFYfQUcU8bXR1rJ2zc=; b=t0tELVzeY3mUvI
	5IOuZtURTcoelmTiNPyb4R22nPT7RVvMLzHwl+ft3pyWQaPRHmbp5AYdeJbJVkQYpCbaID4tUKyFv
	mPH2zsKM6NcAwJfdvk0htoPYvogNL4Ckyc937htrakNvDlRe86zRD/qmzRzKDgnYrOOrKCu7+vVLX
	5qU8zSK3NqKFuBZp3Y80ACfYrUcVgk8XKcNoX835lPye5VFYhq5voqjKQcayM58PASBJGT4Irog1L
	o/qKYg7n0d/Zn+wVkEVs2dmE04mM2AI5W2pEcblSacOua6v0DBfLDEi8nH8FSKUwweWaj3keFa5Nq
	h0pgmrzzIhRea8tGNYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQqPR-00DEh0-Af; Wed, 24 Aug 2022 13:27:05 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQqPO-00DEdz-LY
	for linux-riscv@lists.infradead.org; Wed, 24 Aug 2022 13:27:04 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-11dca1c9c01so3708113fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Aug 2022 06:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=viWueFiZ5OfydC+pO3bw0kvTAFJjoYrGSGQ4/iAQQVY=;
        b=woM40ZV02g7xCYKmnYONhmIvJVO70Sqj5G9jZjYlKvBsW6Scqu7Ia7HeMeo2ScRBoL
         61rYnwwixWKbDW2PKKCxJptOhmPgoLrwLTgUzXF3Vnh07gl2B7IL6jzFsSAA/9hR16ex
         qib6iReEgvB8WTSSECP5R1T2CTdaAQc5cnTanQ1xXOiYkHo5qn+PStVOLcezynOIQeqX
         vJothWfLPI+SPPLd0iedYvwizFUHzK7S/DsoUTn38ftsEBY1eqiG8vDTXYpgCY68cMDi
         QxOIZ4/n/MFiYrgUXZxr+ob6ap7bS6muSUTCgivALo2eGt6kVZG00cnvhmEO37eR9bwV
         bWUQ==
X-Gm-Message-State: ACgBeo1n5A/q8sbgX4vXOpD/KYeWVm67SwI4W3P3aB62iKlOY73gkKzJ
	xgsn+r5cvdt8O/eOnly1fw==
X-Google-Smtp-Source: AA6agR4hiwTnYcZXZZDgaAHHGMgSYNVWUIkbngaylk2cV1PJhQLLoL7hjMUUg3zhPzICm+SbbABfWg==
X-Received: by 2002:a05:6870:b384:b0:11c:e692:699a with SMTP id w4-20020a056870b38400b0011ce692699amr3644688oap.213.1661347618286;
        Wed, 24 Aug 2022 06:26:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f7-20020a9d2c07000000b0061c3753c30dsm4501465otb.17.2022.08.24.06.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 06:26:57 -0700 (PDT)
Received: (nullmailer pid 2098939 invoked by uid 1000);
	Wed, 24 Aug 2022 13:26:57 -0000
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, Sagar Kadam <sagar.kadam@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Marc Zyngier <maz@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Jessica Clarke <jrtc27@jrtc27.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>
In-Reply-To: <20220823183319.3314940-5-mail@conchuod.ie>
References: <20220823183319.3314940-1-mail@conchuod.ie> <20220823183319.3314940-5-mail@conchuod.ie>
Subject: Re: [PATCH v4 4/4] dt-bindings: riscv: isa string bonus content
Date: Wed, 24 Aug 2022 08:26:57 -0500
Message-Id: <1661347617.007635.2098938.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_062702_728423_2A7B7EFB 
X-CRM114-Status: GOOD (  16.10  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 23 Aug 2022 19:33:20 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> **NOT FOR CONSIDERATION**
> 
> I figured, sure why not add the strings for version number validation,
> just in case we need them in the future. The commented out string is
> considered by dt-schema to be "not a regex", but regex101 thinks it
> is... Maybe dt-schema does not support named match groups, but they
> are the only way that I could trivially find to make this somewhat
> manageable. Either way, it is permissive so it allows combinations
> of "M", "MpM" & no number.
> 
> Not-signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/riscv/cpus.yaml:87:111: [warning] line too long (297 > 110 characters) (line-length)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
