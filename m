Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2BAC25B0E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 16:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=sSShL99PTcLm5+kp6rbKy+yWWHdqd4AUuXmcyTSii40=; b=fBe9JtAaZDRXqGC6KTyobd8VV8
	0+ogM719bENgh6XYhnXwflo+7Hi4EzaK0tHc+G9V092wQ8/8oyCCWbgVGJ+5eZa4ha+Omm4VUQNdJ
	x9h6exemD/X5k3dEeQOVu1/3W1MnaKWPSIHziUpPxsuPVMW0/iYUVfNE3hTrXntRQCwI5J9olqqC/
	RnMcIlzul9JXHqjodq6xuD5kqSGpzlW4V8gEZzC4t7M76l0uY41QzgUZbqNPyinNFJYXaKCm/XUt7
	+dwejjhbvrlkW67dRLtuyD/prlGTNuhSVvZmy/ph3Rjt1cRCgai2cLth3h+P24HA3J3jK9CMqNODT
	sEnqlDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXAy-00AbEG-9F; Fri, 12 Aug 2022 16:06:20 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMXAk-00Aarm-JS
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 16:06:12 +0000
Received: by mail-pj1-x102a.google.com with SMTP id t22-20020a17090a449600b001f617f2bf3eso7762252pjg.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 09:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=4OVNFUuImLLig/MGlX7vlR8weBzwek79DqD1BdLgOpk=;
        b=hXdOxhnDhpBegqyCoNLEwbn81PWOhosp82gYxw3LUcdKmADMMMEvM8eJldJcSFhZE1
         Z5dRCKke8PHj6jXb6TPIVae6NpQ54/qQzufcn2nzN6JWSGimbxBPyyA3bGN8+bDHuiuZ
         XeAUdTST31jiYPcDve/nvcp4PlPjwnuX1fRImN+0pZMoqzp8SCqekeFVGnfAmKBcO8QB
         UFLnIEZBmQQb9imQ/6qGNY70F1h+1Af98cCgt6qB3FyZg7H6g15ROmRG4ayeCxXeN5o4
         vsFV5z50xf4BA2JPkDedx2vUoU2OOV0wrXqo2euDhmmMzobdlIeqJdzg6N/L0GOrN72k
         mIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=4OVNFUuImLLig/MGlX7vlR8weBzwek79DqD1BdLgOpk=;
        b=kmEGLGONkN09Ee6+VAU3H45lUuuEpxHMYPPgmTo1hYmaoOwnvB6OLQINPyTZN5WUxP
         gcrsMynxWn945r4AcsMd1fXRB0dld29ZswtfIRT1reh6iwJecwhGC+Hjh1eCbr/4jUG3
         jlPfKmbnkgsuam23qXn30NfFxmByuD49l/WWdSrcOYBEvesuVpWrmVgYFlJ/PoHWddHc
         OS5rdWANhm3aBSATBVaBlDhM9OfEa50jHTworJt8GRzDpnmqmjW/OaktpFsnMbDJYSLW
         e/AMkueQmSHG0cW1GHR9H7UGONlXLMpwDiJLURZCzDfHuVuEgqaCFDWsacdnGYrClSFX
         9dyQ==
X-Gm-Message-State: ACgBeo0Lxe2t3Bsb4mf5SRSrM/MpnBHkGGwCHOE/fCXWNf3jnbbGSpXk
	iVYPPOZxEpYCevlrEr740kEncA==
X-Google-Smtp-Source: AA6agR5/COUTRoAh0UyVgQkf61YCv93x/r8lJgd5f8JFsaDvoPs//RQJEaMQhT8zl7lBJEwuv/cQgQ==
X-Received: by 2002:a17:90b:1e42:b0:1f3:297c:c65c with SMTP id pi2-20020a17090b1e4200b001f3297cc65cmr4993940pjb.208.1660320354716;
        Fri, 12 Aug 2022 09:05:54 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id f6-20020a170902684600b0016d01c133e1sm1885809pln.248.2022.08.12.09.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 09:05:54 -0700 (PDT)
Date: Fri, 12 Aug 2022 09:05:54 -0700 (PDT)
X-Google-Original-Date: Fri, 12 Aug 2022 09:00:14 PDT (-0700)
Subject: Re: [PATCH v4] dt-bindings: gpio: sifive: add gpio-line-names
In-Reply-To: <20220803155539.800766-1-mail@conchuod.ie>
CC: linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  conor.dooley@microchip.com, atulkhare@rivosinc.com, sagar.kadam@sifive.com, linux-gpio@vger.kernel.org,
  devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Rob Herring <robh@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mail@conchuod.ie
Message-ID: <mhng-5813099c-bd9f-4122-aec9-44adb5d280f5@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_090606_660944_FA3F7610 
X-CRM114-Status: GOOD (  17.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 03 Aug 2022 08:55:40 PDT (-0700), mail@conchuod.ie wrote:
> From: Atul Khare <atulkhare@rivosinc.com>
>
> Fix device tree schema validation messages like 'gpio-line-names'
> does not match any of the regexes: 'pinctrl-[0-9]+' From schema: ...
> sifive,gpio.yaml'.
>
> The bindings were missing the gpio-line-names element, which was
> causing the dt-schema checker to trip-up.
>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Atul Khare <atulkhare@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes since v3[0]:
> - Dropped patch 1 & the now unneeded cover letter
> - Added Rob's Ack
> - Changed the patch title to include the subsystem
>
> 0 - https://lore.kernel.org/all/20220726170725.3245278-3-mail@conchuod.ie/
> ---
>  Documentation/devicetree/bindings/gpio/sifive,gpio.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> index 939e31c48081..fc095646adea 100644
> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> @@ -46,6 +46,10 @@ properties:
>      maximum: 32
>      default: 16
>
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 32
> +
>    gpio-controller: true
>
>  required:

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
