Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CA1C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 01:50:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7C4361039
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 01:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7C4361039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJrMtL90Cdjvv5qM+7Pyxc8IYVpXSomkfErVZTJrlIU=; b=d2KoApsry+2SIC
	gI/hg8wrpFpJhfv79dI+W0FdKGnhF7D0Z922Jww1kj9hBaq3XF6t3/XWUNoysHjBuXqvDQYTw1EHT
	jhtP/iXNFpJ6+hDKqpSrxpaVIucB6TEHtG0zza0Bd1nIQNPcOVm8lUNWKkqlIAnAvronBQmTmCHGz
	uVCISc1/ST7Rn9StmABfHAMEfb0iQ2ZZMdol2dVFaL/BRu6vmLKjbQPZb3xCICLfZ1gIbxJbK180K
	UrAxfno99YqzTRTfvlWHry8iRDeXy2ZkJGk3vrFe2ChfGiBcY+f4oXsqvPFlb2JZqKEBsJXZ6vPrQ
	7nbKx2pUk6h1scQbrWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgH2P-009Ukh-SE; Fri, 29 Oct 2021 01:50:33 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgH2N-009UjS-9B
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 01:50:32 +0000
Received: by mail-oi1-f176.google.com with SMTP id y207so11091476oia.11
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 18:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eT3ChWaMOp5kyHbGSPNQZqiJesN+wKA5EP84+9fXwG4=;
 b=DmWDBpiSOdzUuu2O2UG6yHVAXLOoLTufr4xkwEAbrg/aw8SdX678SFO0PcISQovUAa
 ixEsNMBbpEnkpyH+Y3AsNYpn2jaHCmik0CAzN+l96Yi9PP7WICUbrQMsU7WdCUIWRoli
 Dm5uEbGmgPRl8ZM6m9+I98UxXScdw8Wfj24iz+JmJ5MXr7c4aWq/wPGGCi1aecjPpiP+
 QUfWWbwkwS/jIEg07AjcdYStKdPo0nOSoBoj35Wowkge5htbujW9Kikb7/rvtuF2VyCc
 Wil6XspapQ79VAV4odEG9onF/2agRhnzK9dn67+OOZcl2N0RiDXmnTAyGfIdIB0sExit
 6qOQ==
X-Gm-Message-State: AOAM531Kqswm760BuZLSaZG3YATNPtnG1SbP1zi39Q5kqnv6bIDPU+5u
 u17CC/ifxZCj1q/B2s3Wvw==
X-Google-Smtp-Source: ABdhPJxAP9sJ1yu3Kht4JaNms+QFgt8gIGs8br4REvzieGCwOwjZwdh3OyK5GmRJ0zW8Xwq1UGGXgw==
X-Received: by 2002:aca:ad16:: with SMTP id w22mr11487871oie.109.1635472230382; 
 Thu, 28 Oct 2021 18:50:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id k22sm1582548otn.44.2021.10.28.18.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 18:50:29 -0700 (PDT)
Received: (nullmailer pid 987933 invoked by uid 1000);
 Fri, 29 Oct 2021 01:50:28 -0000
Date: Thu, 28 Oct 2021 20:50:28 -0500
From: Rob Herring <robh@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, 
 Michael Zhu <michael.zhu@starfivetech.com>, Stephen Boyd <sboyd@kernel.org>, 
 linux-gpio@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, 
 Fu Wei <tekkamanninja@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>, 
 Sagar Kadam <sagar.kadam@sifive.com>, linux-serial@vger.kernel.org, 
 linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-kernel@vger.kernel.org, Maximilian Luz <luzmaximilian@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Anup Patel <anup.patel@wdc.com>, 
 Jiri Slaby <jirislaby@kernel.org>, Drew Fustini <drew@beagleboard.org>, 
 Matteo Croce <mcroce@microsoft.com>
Subject: Re: [PATCH v2 13/16] dt-bindings: serial: snps-dw-apb-uart: Add
 JH7100 uarts
Message-ID: <YXtTZCRUTUB88w/a@robh.at.kernel.org>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-14-kernel@esmil.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021174223.43310-14-kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_185031_343096_73128216 
X-CRM114-Status: UNSURE (   9.26  )
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

On Thu, 21 Oct 2021 19:42:20 +0200, Emil Renner Berthing wrote:
> Add compatibles for the StarFive JH7100 uarts.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
