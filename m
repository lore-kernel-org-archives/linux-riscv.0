Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63537C05027
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9lkWrcAo8tU7ZeLo4pQMQhElQgK25QVhbVTyQkGuZuk=; b=fJRisue++ca4fd
	n2GBZtWI/f7n7Bx5hqJNbo2AwHx8Je+OUd+CItwMb6ZITZcmGZIRFyLBukuFbeuAE2OePv4n1gkIG
	GRpKtH7l1vmAn359lSs1ALplO3ttIvbpgzsFdt9zv97ChDO27jm/Y+1xDACpNPgvFp96iw8/uWShB
	WGe7Cb0DcLqV17qBia7/vivzxu2v/BV0HGkPkL1DXmJ/xC+hMNdmwIPBECD+CINPtWAgLY+xnxMva
	05v/qBJLMhC4UzudLj4elnUKnDGuDHzA+SLUgCyoIJdCXvkCci3VhlUXV9WBIkDeI/1igC3zT16IM
	bu2qOKsVS9Sk+KrQuodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP4A9-009FzO-4E; Mon, 06 Feb 2023 16:16:13 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP45m-009DxV-Jr
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 16:11:43 +0000
Received: by mail-ot1-f47.google.com with SMTP id 70-20020a9d084c000000b0068bccf754f1so3333613oty.7
        for <linux-riscv@lists.infradead.org>; Mon, 06 Feb 2023 08:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZyIIxd0QDJe2eibkr6jP0ZOO/rzo/3V0A75/9lkRTg=;
        b=TjmqigQt7fQKSxZVoRigZksdXAaX50wMD/DJkQJhN6FT86TWZse0Xnxd3llUHfUHNj
         7JlSmER6Hu6ujrrI2Wfr12lJu0OuBlUNaFhY5ZbsMMaYg0GRfhxqcPwyrPsDGyx3glej
         e6/GGznaVnO0kyu5He38/Jn2oxOYB0VHe+6Yn618flyq/hTYg3ap7I1JM63s2cRa4IbS
         9hhNg5jv26obfz7xXZyHrHOmauEwyKqmQzZEczuXC6qPzZe6e5UIy86HPk+TLud+Bm5A
         wkxenZmcbwL83SPrEr77nXRQ/lcGu6BS96py4zoFI0fSawShDLTIbbSePzUZWbcCHi/C
         nc5g==
X-Gm-Message-State: AO0yUKWM6KwJOXlziW83fK1OvdhzuPr6ErWWiMbn+EY1tTlcz1lpTDaz
	METj/QDFJ28r1ywRVjEbNw==
X-Google-Smtp-Source: AK7set+iTHOenGkRMkTkO2+v1ukFLDnWlQnmJQtdoTqg8mRqe/aJlMy1yM4UmY7oA/jZzPvcV1HOPA==
X-Received: by 2002:a9d:4549:0:b0:68d:6a22:396c with SMTP id p9-20020a9d4549000000b0068d6a22396cmr67122oti.3.1675699900416;
        Mon, 06 Feb 2023 08:11:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m14-20020a9d6ace000000b0068bce0cd4e1sm5092762otq.9.2023.02.06.08.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 08:11:40 -0800 (PST)
Received: (nullmailer pid 162328 invoked by uid 1000);
	Mon, 06 Feb 2023 16:11:39 -0000
Date: Mon, 6 Feb 2023 10:11:39 -0600
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, linux-gpio@vger.kernel.org, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jianlong Huang <jianlong.huang@starfivetech.com>, Andreas Schwab <schwab@suse.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: pinctrl: Add StarFive JH7110 aon
 pinctrl
Message-ID: <167569988090.161822.12197118549919509895.robh@kernel.org>
References: <20230203141801.59083-1-hal.feng@starfivetech.com>
 <20230203141801.59083-3-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230203141801.59083-3-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_081142_685064_B8A98C0B 
X-CRM114-Status: UNSURE (   9.71  )
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


On Fri, 03 Feb 2023 22:17:59 +0800, Hal Feng wrote:
> From: Jianlong Huang <jianlong.huang@starfivetech.com>
> 
> Add pinctrl bindings for StarFive JH7110 SoC aon pinctrl controller.
> 
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../pinctrl/starfive,jh7110-aon-pinctrl.yaml  | 123 ++++++++++++++++++
>  .../pinctrl/starfive,jh7110-pinctrl.h         |  22 ++++
>  2 files changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml
> 

With the issue noted fixed:

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
