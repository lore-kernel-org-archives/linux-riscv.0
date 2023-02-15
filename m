Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A92DC636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 12:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cl+5PDx8og2QQaCYeUlDlkJOLWFFAUvFnljCzDkXrG0=; b=Lf7TGctU8/+w7g
	iE3A0MMGi63gUjLdk73fNHkVK21vTJvCwNHxaQScBVl1ur4NeggPVqIbVuZarHsa2VS43AQQRJ0YV
	Bis10CL8jdXZd8tsQvH+Q931sRa2D50KGBChuVPGnXC2Cf19DjeyYrouVx035ZDRAfW5il2gGgXEV
	9mHPQkBn7N6Yu2R2GvGcXAbsSMPavClIXx89SKn0GPahFJjiwK1AZImkn9bwF0WCtbZsoG5cU1o9h
	5uxg1Kl+I6Rrz7oQN7VPh/fZEPwAxkcYah8tWYEemAOzhZA6QKQIt/wspFwihmoROiRFoCULiU4Te
	i3qrI8/fqXIDp1YChMHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSH3a-005nse-W5; Wed, 15 Feb 2023 12:38:43 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSH3F-005ngP-3S
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 12:38:23 +0000
Received: by mail-pj1-x102a.google.com with SMTP id oa11-20020a17090b1bcb00b002341a2656e5so1778813pjb.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 04:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h2yv6r/tkJhh1AQWXNmS332xczLIXC4hXyJsLrF/F0U=;
        b=OIBjB/DieDnrOnlkZX38SIz0J8fusd5SUL3z7LhO03UDu0zSc2bF0zd/csrTgGS51A
         Tc9DGgBQyDaF+JnP7kwGKpKNrF8i+hc/SESRdMOHJMsIZqEwIzJjyh8N5qFIcVP3GXqQ
         pRnNRrtx+2lM8vcpWvBxcz+U6NDkMG/qapwgr7qXZOKAUzGfrvnU3vzxjXtm5YIaUaYS
         pWgDHxuYgb6/3pg1/Cvb+73LAb0dUWJJryZp1DV0CmZJ9wFHzYYFbW0ox0eXDBkt6eEa
         u82VXVydJaF9Jco30Qs4Yj76S1SesscsMggEHVtUP9qBWVXxfLSWx7StkNtu4tNL0m0I
         q7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h2yv6r/tkJhh1AQWXNmS332xczLIXC4hXyJsLrF/F0U=;
        b=z3bZfi3Ke20aFxwSl3BUykGfxP5BVppEbEEduchQLP8e1RyDqK4Y7tBQNl0q/G5l2g
         CwDyAYlhodQhTO2U+3JmKMiXzARMWOpFfvSAHdLGcbz/euCU6DPxbtYTpT/pPUtgwvPT
         Y6SIPPFaht45z4AR7sO4fv0SFINajYhWbzrbM1ZomsK4MPypsL9hEnWHKNJVOZEZucN5
         JRfCQOn+lUDJGdfS2rY752/uhji0s20IJWfJIh5FSWv/fn96JP9qudSFeWYIzWZLDfKy
         RuCG05PsXa966PWrCV40cv9r1V8+eO4HQKAwe8cywnKKrgqDB64vNX1VkKtV8Vw+wCiZ
         PmcA==
X-Gm-Message-State: AO0yUKXbLfRkuws8FiIEmvKzQ2jkJd90aG3oe7KL7mSXNh8kToF4B+SU
	DsMHd+SeZwPz+wnOi5eZMqdHSLzeyimFJBjXkNOo6A==
X-Google-Smtp-Source: AK7set/BkYD3N5v5x2nC92Owv4rtr6MfxWS5CNY0wa/3//92Ay6+kA+EpQho3FnMO/ZQjPpKMjAhyuKwp3cmSKz9wXc=
X-Received: by 2002:a17:90a:2dcf:b0:230:ae51:1cdc with SMTP id
 q15-20020a17090a2dcf00b00230ae511cdcmr459554pjm.120.1676464697285; Wed, 15
 Feb 2023 04:38:17 -0800 (PST)
MIME-Version: 1.0
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
In-Reply-To: <20230215113249.47727-1-william.qiu@starfivetech.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 15 Feb 2023 13:37:40 +0100
Message-ID: <CAPDyKFqJxrLh+pgQ-u_Lwxv4_TsH--rga049GBTqKAa_M14_yw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] StarFive's SDIO/eMMC driver support
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_043821_218595_971295DC 
X-CRM114-Status: GOOD (  19.42  )
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

On Wed, 15 Feb 2023 at 12:32, William Qiu <william.qiu@starfivetech.com> wrote:
>
> Hi,
>
> This patchset adds initial rudimentary support for the StarFive
> designware mobile storage host controller driver. And this driver will
> be used in StarFive's VisionFive 2 board. The main purpose of adding
> this driver is to accommodate the ultra-high speed mode of eMMC.
>
> The last patch should be applied after the patchset [1]:
> [1] https://lore.kernel.org/all/20221220011247.35560-1-hal.feng@starfivetech.com/
>
> Changes v3->v4:
> - Added documentation to describe StarFive System Controller Registers.
> - Added aon_syscon and stg_syscon node.
> - Fixed some checkpatch errors/warnings.
>
> Changes v2->v3:
> - Wraped commit message according to Linux coding style.
> - Rephrased the description of the patches.
> - Changed the description of syscon regsiter.
> - Dropped redundant properties.
>
> Changes v1->v2:
> - Renamed the dt-binding 'starfive,jh7110-sdio.yaml' to 'starfive,jh7110-mmc.yaml'.
> - Changed the type of 'starfive,syscon' and modify its description.
> - Deleted unused head files like '#include <linux/gpio.h>'.
> - Added comment for the 'rise_point' and 'fall_point'.
> - Changed the API 'num_caps' to 'common_caps'.
> - Changed the node name 'sys_syscon' to 'syscon'.
> - Changed the node name 'sdio' to 'mmc'.
>
> The patch series is based on v6.1.
>
> William Qiu (4):
>   dt-bindings: mmc: Add StarFive MMC module
>   mmc: starfive: Add sdio/emmc driver support
>   riscv: dts: starfive: Add mmc node
>   dt-bindings: syscon: Add StarFive syscon doc
>
>  .../bindings/mmc/starfive,jh7110-mmc.yaml     |  77 ++++++++
>  .../bindings/soc/starfive/jh7110-syscon.yaml  |  51 +++++
>  MAINTAINERS                                   |  11 ++
>  .../jh7110-starfive-visionfive-2.dtsi         |  23 +++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  47 +++++
>  drivers/mmc/host/Kconfig                      |  10 +
>  drivers/mmc/host/Makefile                     |   1 +
>  drivers/mmc/host/dw_mmc-starfive.c            | 186 ++++++++++++++++++
>  8 files changed, 406 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
>  create mode 100644 drivers/mmc/host/dw_mmc-starfive.c
>

I have dropped the v3 patches and applied patch1 and patch2 from the
v4 series instead, for my next branch, thanks!

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
