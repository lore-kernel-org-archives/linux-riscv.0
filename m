Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F3AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 18:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=J0VgoD4sn8rs8jR57JjgraidBYNOsGq7oucpV337rao=; b=N68Vgt55B9g+Bf2lkJbGC3wbsX
	ahHfGhaDBGE7cIYs3bvr/A1Fv3XFSPGWWbuGh9g+OXsseR8fU7x9H4AGMb8s0CHJ8QptQFmSRjNk6
	C4C8w78OqgPA/O9xWwNebUxsP5tzl4vu7gEoYjdV3nd4Vvz8xv8VksVQfpkIY0INiDggaDQSlvaV5
	Oz1QKMvG4+cxGWgzOmKXSzygtCTC/eCBYXYfZx7i5GfLaVv+XegCPV3eOAU0ErVkHLKTRbpTmsWja
	VS0wqtik7lO/ijQJlc2i4SSA6CkhlZ0Xq+ppc1exPjLgi+00VL2X+sAGdv3CoULysoqX+/JGd1gOX
	FO9PbuOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AXi-000ZqF-C1; Fri, 02 Dec 2022 18:13:46 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AXf-000Zp4-3N
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 18:13:44 +0000
Received: by mail-pl1-x635.google.com with SMTP id 4so5377181pli.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 10:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=td4xci5diB4fq00DG+7VzeBznbBu3BTL2nUPPpTbtak=;
        b=znwv0rWJ35Zi5rd78lBnOWAQjqe71CNHUDvpy9+X6MQkTVdLvFe1vt80DYaX0q60gZ
         tLDjuYOEIZLjchfjdb/gv0Wi3N8fnWmHVp9Lu/u2jyc4xTeTD1ypkp2d+F0FlU4UltgZ
         4HwpCwGKxIELgDtemo5W5GifjlJwAK5wTa3BrRJ2hWdU3YCtDB40axA52e9WNfZHio9T
         ZIW5PXoL1Phr0KeqvXZBONGDEBAi6V2NhLi1JgwoLgWTfloruPYHNHqRGiLUmwVKDUIh
         yxKQzKVD+5KY4WCL/LkdM8K3vPOvro2Edv/AZWQRzYMXsBj0lM4gr220L2f1mQ6cTps4
         OXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=td4xci5diB4fq00DG+7VzeBznbBu3BTL2nUPPpTbtak=;
        b=f/X0wD6cuk60xpWXZ2bggBkfQllO+HYizM5FgD0V6DoosvWF6eGGxZPqUm1s1IXVEd
         +QVRZQxQlcP8uElisZLWpoIbcmWSp75UYu0qvInRBbWqWAWGI/4oSZc9uBYdAEyUJqhk
         WJ7zd6hWrzrCMA0UvMu38PzxGHxO/SIpf01VHsRA1MJLNPzRV6ELzER3oS9Vq2ErDcU5
         CkI06Nlwh1x5pdmWtIHhKTYECaCnkwoesGWRr+CJg+EckD3sf+ugKwgu72VqIxrwuXSK
         eHrLnqTdzHjzMntz12jkEM9YJ1th8qOBmx3yDSCiNCPFC/zxj+Ib+mArKC7OMS+jXxVG
         s5pQ==
X-Gm-Message-State: ANoB5pmFZ1e6N/gGegClLwggy9GP5HPWzq4M5/aSbhIZXcOT2mKEKIjF
	kDPEBaUjg9t26DlgrcdcGyOx5A==
X-Google-Smtp-Source: AA0mqf43J8lPrptpkCkbq/DYOD09yooJAY9HJ+V6haZEp7urNBCX5HoHqSVnhtgTwlX3obMkTG3ztQ==
X-Received: by 2002:a17:902:e3ca:b0:189:a11e:9994 with SMTP id r10-20020a170902e3ca00b00189a11e9994mr17778649ple.54.1670004820918;
        Fri, 02 Dec 2022 10:13:40 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id w80-20020a627b53000000b0056d73ef41fdsm5396669pfc.75.2022.12.02.10.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:13:40 -0800 (PST)
Date: Fri, 02 Dec 2022 10:13:40 -0800 (PST)
X-Google-Original-Date: Fri, 02 Dec 2022 10:13:30 PST (-0800)
Subject: Re: [PATCH v2 8/8] RISC-V: defconfig: Enable CONFIG_SERIAL_8250_DW
In-Reply-To: <Y4o+5ayW0vHcmvo6@spud>
CC: hal.feng@starfivetech.com, linux-riscv@lists.infradead.org,
  devicetree@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, ben.dooks@sifive.com, tglx@linutronix.de,
  Marc Zyngier <maz@kernel.org>, sboyd@kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de,
  linus.walleij@linaro.org, emil.renner.berthing@canonical.com, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-2ff22bb7-a48a-4434-b498-1f928e75cd01@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_101343_160217_90A7BB6E 
X-CRM114-Status: GOOD (  16.70  )
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

On Fri, 02 Dec 2022 10:07:33 PST (-0800), Conor Dooley wrote:
> On Fri, Dec 02, 2022 at 10:00:35AM -0800, Palmer Dabbelt wrote:
>> On Thu, 17 Nov 2022 17:17:14 PST (-0800), hal.feng@starfivetech.com wrote:
>> > Add CONFIG_SERIAL_8250_DW=y, which is a necessary option for
>> > StarFive JH7110 and JH7100 SoCs to boot with serial ports.
>> > 
>> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> > ---
>> >  arch/riscv/configs/defconfig | 1 +
>> >  1 file changed, 1 insertion(+)
>> > 
>> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>> > index 05fd5fcf24f9..a23d022974ad 100644
>> > --- a/arch/riscv/configs/defconfig
>> > +++ b/arch/riscv/configs/defconfig
>> > @@ -122,6 +122,7 @@ CONFIG_MICROSEMI_PHY=y
>> >  CONFIG_INPUT_MOUSEDEV=y
>> >  CONFIG_SERIAL_8250=y
>> >  CONFIG_SERIAL_8250_CONSOLE=y
>> > +CONFIG_SERIAL_8250_DW=y
>> >  CONFIG_SERIAL_OF_PLATFORM=y
>> >  CONFIG_VIRTIO_CONSOLE=y
>> >  CONFIG_HW_RANDOM=y
>> 
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> Hey Palmer, could you take this as v6.2 material instead of Acking it
> please? It applies to the jh7100 stuff that's already in-tree.

Ya, no problem.  Just this patch, or the whole series?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
