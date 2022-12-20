Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0522CC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 20:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uzo20c6x8+Ku/GezPZNwqdSo2X0IalekDAo4O6KHQxU=; b=LgJDb3/5w/k7iu
	7ks49iA69mDAjoE2NggVO5LmyZzHR8avedazXb8zuko4Hf+E0QsyoDW0GxyZSeQH4x7FKkWkhqDi6
	Vdo16WxO/GEJsf22PFWqHmdp5IlSGbFho57boHaDdqh9MtJn8x9Vu1bO2PvJ4qxcO4gyMP23XE1hG
	yJ49u+Sc8XGlynudF1qPDXAtacLM76yClVrUqiLF7ZJmD9Xoz9dCA9mlPVVRUlwJZcpHNSNles+qR
	YZWsGGmYabc6lzqM/HaXgzGfNr8zKD5Or/8cppI5/Iri3iH7qYSSgLTlXE7LAxC++26pr5H/ZH+Z5
	qzTday2SQytzkTf8gT2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7j5v-003nfO-Rh; Tue, 20 Dec 2022 20:20:11 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7j5s-003nbv-4H
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 20:20:09 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-144bd860fdbso16879409fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Dec 2022 12:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPeYdzc9FvSjQnwQpKOSlb+cwbou8KwWYdDez3Iw/jk=;
        b=mVPNNOloG4ml/GeJfJybsbUIBxRYguAZSxBtiD1psLh/JQaULGj9dbntZkNec8diOj
         92N9k+7uNL8K44NvaVAyepSo4WYLiBZDHeTwo9NwBHRj31o96KR/YKQeVLTYoHvdYO/P
         8hdCe9LdOo6/fHE11geG5BdupcL8nbmAshgAkj5jVvhiRXqVjMiCUeEc0zuF2bEoLght
         AkYC77AoiH+GIJY/J2BQziNwGHewrjUteCq2JrOtKifZjmexDp7t0g1Xk41fVSf+HmwL
         +opJEmPfUB3azO/zdsuPkmRsXNG5+K/rkBxpWGHyzKUsCyhxyLPfljLAM7GjaARZqO6r
         VLlA==
X-Gm-Message-State: ANoB5plAfeH22QCPm6zKBSHV3ElJMGoFemMJIjJ7KGTGQVDgXMV+IRLU
	QuxysJPWgfbXKoVLyIKbsw==
X-Google-Smtp-Source: AA0mqf70kKieJ1VKljXtxAEVcFW7fnn2oFjoL/Mkx7cKi1a3tjrtimxtAdfm1Np75u++KaA0pF37FA==
X-Received: by 2002:a05:6870:9a16:b0:13b:a4fc:cd0 with SMTP id fo22-20020a0568709a1600b0013ba4fc0cd0mr23505636oab.19.1671567605661;
        Tue, 20 Dec 2022 12:20:05 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id kw8-20020a056870ac0800b001431bf4e5a0sm6442102oab.38.2022.12.20.12.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 12:20:05 -0800 (PST)
Received: (nullmailer pid 1019613 invoked by uid 1000);
	Tue, 20 Dec 2022 20:20:03 -0000
Date: Tue, 20 Dec 2022 14:20:03 -0600
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Jianlong Huang <jianlong.huang@starfivetech.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: pinctrl: Add StarFive JH7110 aon
 pinctrl
Message-ID: <20221220202003.GA1018798-robh@kernel.org>
References: <20221220005529.34744-1-hal.feng@starfivetech.com>
 <20221220005529.34744-4-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221220005529.34744-4-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_122008_233080_17A1F213 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

On Tue, Dec 20, 2022 at 08:55:27AM +0800, Hal Feng wrote:
> From: Jianlong Huang <jianlong.huang@starfivetech.com>
> 
> Add pinctrl bindings for StarFive JH7110 SoC aon pinctrl controller.
> 
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../pinctrl/starfive,jh7110-aon-pinctrl.yaml  | 126 ++++++++++++++++++
>  .../pinctrl/starfive,jh7110-pinctrl.h         |  22 +++
>  2 files changed, 148 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml

Same comments in this one.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
