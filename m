Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90BBC00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 15:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Byet+n4T4FDfpkRXgW6T2/oCfR75dIvuR4z8HfIRiA=; b=v+p77zFZYuPyWn
	i9MydL2vF6Z/ePHmj5rSPD6Eq5fsHWGcmXN8NrVlEM2JRnz0ZA81Yp7FkgendHqgpoT+8FRUyhLzP
	XV97CZHWM8H+6fIWrgrYhclppjiC9J3kVjX6BX7BlPaBs+QpFJ2cdACQ2b+arnitfD//g0E5GyTie
	ER69fb65sm3dWkcj7VekYg7guWCbMAe2A2ygiAmCphHSL4UqMjwrcHGBapQsWrdq6989tZWOrjb9C
	wKLKR+2NqtZ9FJqjZVxU6QodQHSvO78IA7WbmGd4c/cYJdqiFK/4NyK6zTzEZm9eW2UikInwQEHlT
	SKw6QbzsHgKz+0iLz+xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMWfK-00A8Ec-7T; Fri, 12 Aug 2022 15:33:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMWfI-00A8BI-7H
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 15:33:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 61369B82447
	for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 15:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6CDC4347C
	for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 15:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660318409;
	bh=YymeiL+WDfDKCoj1tmnKtG9kNBYdc1gBFHeYC0V+36Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K8V0UPAN+767lxx0acYoJqE+0nqYT8S/28FkXA+2dhyHIkj0cmlwGFdW8HOgKhZ/3
	 rZn4L6q/ry3Ncn0qo8FCf2hP5BF6D+MltiC7F19CTg5CyaNh028dy2xo2oJDKWBm6t
	 u9IseS5Ausd5jty8iasPLw3M+mioKnPZuwZNxVPC3kDAwCBRF+ekMlq+EhEBBDxvbV
	 mjUofxNQbWe55E/Sqhy4zODtvgRORcTxT67pdRInsW6xv1Avj206NzxxbjgwQ2f2Zy
	 WoLm4Toj83jjA8zGklaTvQldMELaB1a9x7wgukXXag6lTGCj6yUeTiauHia38asQjC
	 qvBn07Y1iUrUQ==
Received: by mail-ua1-f47.google.com with SMTP id f10so444897uap.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 08:33:29 -0700 (PDT)
X-Gm-Message-State: ACgBeo2fJaBAuXExPQB+jcq7yvDPfMFCkeGe6mdeLLvExh2lsmEtW+2h
	S/PVxsuJ+s2rSezhZ0OEbvOtoUjZfiifg1Lzcw==
X-Google-Smtp-Source: AA6agR66vMv23MxHlhU/il+hwIYBXtv92JhHAY7m+89EGlZ5dlwcJwMP0buqMazwUiLaB7y24s6RjJRmgxBq8ONC6fs=
X-Received: by 2002:ab0:2505:0:b0:384:cc62:9a75 with SMTP id
 j5-20020ab02505000000b00384cc629a75mr2089792uan.36.1660318408105; Fri, 12 Aug
 2022 08:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220811203151.179258-1-mail@conchuod.ie>
In-Reply-To: <20220811203151.179258-1-mail@conchuod.ie>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 12 Aug 2022 09:33:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLOGLZD6vrNPqDUqYypkz8xoCPJ4DA4JF-BrG=WHWPurw@mail.gmail.com>
Message-ID: <CAL_JsqLOGLZD6vrNPqDUqYypkz8xoCPJ4DA4JF-BrG=WHWPurw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: cdns: add card-detect-delay property
To: Conor Dooley <mail@conchuod.ie>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Piotr Sroka <piotrs@cadence.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_083336_430525_C42939A9 
X-CRM114-Status: GOOD (  12.02  )
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

On Thu, Aug 11, 2022 at 2:32 PM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Upgrading dt-schema to v2022.08 brings with it better handling of
> unevaluatedProperties, exposing a previously undetected missing
> property in the cadence sdhci dt-binding:
> arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: mmc@20008000: Unevaluated properties are not allowed ('card-detect-delay' was unexpected)
>         From schema: Documentation/devicetree/bindings/mmc/cdns,sdhci.yaml
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Should this have a fixes tag? If anything, it'd be
> Fixes: 84723eec251d ("dt-bindings: mmc: cdns: document Microchip MPFS MMC/SDHCI controller")
> but idk.

No, the common property 'cd-debounce-delay-ms' should be used instead.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
