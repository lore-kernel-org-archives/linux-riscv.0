Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2809BCA1002
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 10:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=snLvWbfqPc/NaLoOs07XAHrqNekGWuh1ZviYIwEmYOc=; b=xsD85WWy1S7XsjC3wk+bto8QGY
	aGC05qqIQMKLi6urPSuHQ0FowpNfb4ZnJ6wfSdmWP/ietA52ztR7aXal39MbkApjRMIdfs137cVnH
	Fdm3v6zEEbZTJV9sbskrBUJpFVpyZtKb/I8MYOYzibCTCHYzcBYbc74ZNo3jhq6zEf/j4WrzceaUn
	kNaK0KjkWJ1D8naF0MeeoDyDZL70+5FKacOuvNWByO3UfRvTJqF9LY2eIq/z0IYqeQnVlJRN0Vx+L
	uDsWrvWOrDBO/+zLTjFST29eVtdUryALKyXfvyPLw/EWoIJTbBUJC3RzbyMmVWbbYNlhbOf3gy+BI
	17qA7kaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu71t-0000000ApKb-10Zh;
	Thu, 04 Sep 2025 10:17:21 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu5rR-0000000AQTE-2n2C
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 09:02:31 +0000
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0A3083F6A9
	for <linux-riscv@lists.infradead.org>; Thu,  4 Sep 2025 09:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1756976545;
	bh=W5tXZLE9U8ZLxM4XnYQFYNA7WVcvzE7u2s5SMaMyKfs=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=k50We7Xuom84tD6AoaIJjVxCwfgxmanRSqjOuPwfjO2Bkl7XVE/01msqMhSGhepN6
	 ot1uE5UWvoe+LFkzz0RbggtKVw82o+NnlOfps4EL/loEf4ttglJ0wOWQ2jpCpFkjX7
	 bAYTfdd52yHJdUf8KkxmIzNVN1ulHcOVXlefpUkEI8ex5T+MAWpHkBcURVZmSxSbGd
	 ORUHbHnehYG2lZ9Ke4cK7HDoJ4S3pQHdKjayN/oFGAW4QMbvGLVM8y2uo9eefYGkqh
	 C30jjKMHFrlQg7H0MUxveRoyfrI8pzx/uaRwoOChZSv4ron7SLCoCUOOFKa0TcVQ+7
	 fHxy7S0KY11tA==
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-53040f4a9f0so235156137.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Sep 2025 02:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756976544; x=1757581344;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5tXZLE9U8ZLxM4XnYQFYNA7WVcvzE7u2s5SMaMyKfs=;
        b=XnvG+oFY6LmkjPtWJI8FEQEVI3lT6vDN8KCumZmvK+QDoCtQNnG9CrHio0IhcH3w72
         OUaEF43FQ6FO+oZxn/zmQoSLgRGR3zyJDkigOEvoXkt15YB2bFagJbzALCpaY3BtuIW6
         vn45Z5DUbUWUoRwDb/aOhoHrVhPL8j9HBlzpiG+l51rJcKdLBF6J+WI+ah0yvW0D7tpm
         xmsfoQemVB2OHqqhYDZ2BNQ7MzIE7q1VgBGBvYiLzvUcXyMwu/0gRWtVhpYPn+8r4S9I
         zopIEzIk/arwYU/taNbyR56g2EpoKsduJAknAaiqi5p2LrqwUwgiiXncSs/Vq+YdYjN0
         gW0A==
X-Gm-Message-State: AOJu0Yxh/5jXs0UGrHjtBMl7DyHX1Gkby/pCSuzeYIXAFafNv/Rk9IFi
	wyee1nm/Krwf0k1nMJQA0+fqo3PhZJCbmj1xFqhlldD8txQwZblpinnZwzW6BKXPHRdAo5J/KlO
	at8VIDRWd0k+t3UeFJEVNCVrkpCSmIvEcwnI6mPvlfy4kOMxv21tzM3w99BFe5yLyixD5WQTDAR
	Qr060hm2TpieenZH7bECF4eknumFP2WAuGknzj1woCrx8GYaikiuNKSonmf5NX
X-Gm-Gg: ASbGncu5cGg4RAyivChTYVQ+AB+VUXf2KcJ5oqCU5QTJ/7KuuPXODidtf7IJkyKY0qx
	hI8TbHLh7EfR8TsXicHjdctTioObW4jr4P9TOdBLVdxk8HA+fpsAH9zPmuAKosYtD/ytjW2P+Rw
	yAMd6zR5iZbMo6xVynwNY=
X-Received: by 2002:a05:6102:549f:b0:51a:4906:f195 with SMTP id ada2fe7eead31-52b1bc21699mr6330766137.29.1756976544059;
        Thu, 04 Sep 2025 02:02:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfwrOh3ZXQWUEYw7cNtkkSuMIylybKSVsj1rE0ILOBF18eeNxhb8j1NXutX/Bv0RybyaBlTDCviu/T9BrHNss=
X-Received: by 2002:a05:6102:549f:b0:51a:4906:f195 with SMTP id
 ada2fe7eead31-52b1bc21699mr6330758137.29.1756976543690; Thu, 04 Sep 2025
 02:02:23 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Sep 2025 02:02:22 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Sep 2025 02:02:22 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250823100159.203925-1-e@freeshell.de>
References: <20250823100159.203925-1-e@freeshell.de>
Mime-Version: 1.0
Date: Thu, 4 Sep 2025 02:02:22 -0700
X-Gm-Features: Ac12FXx9BokiA1zWTAcPCh_5RS6LljOLjGyyWFJoP9qUWJdcuwYzY8X--Neq5V0
Message-ID: <CAJM55Z9KJNPOp1ngDqKz0BDpxWu-_cqOMALSE_Jou9FU2TPK9g@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 0/3] riscv: dts: starfive: jh7110: More U-Boot
 downstream changes for JH7110
To: E Shattow <e@freeshell.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>, 
	Minda Chen <minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_020230_088979_C0AD9CC7 
X-CRM114-Status: UNSURE (   9.97  )
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

E Shattow wrote:
> Bring in additional downstream U-Boot boot loader changes for StarFive
> VisionFive2 board target (and related JH7110 common boards). Create a
> basic dt-binding (and not any Linux driver) in support of the
> memory-controller dts node used in mainline U-Boot. Also add
> bootph-pre-ram hinting to jh7110.dtsi needed at SPL boot phase.
>
> Changes since v2:
>
> - patch 1/3 "add StarFive JH7110 SoC DMC": wrap at 80 col, clock-names
>   const is 'pll'.
>
> - patch 2/3 "add memory controller node": memory-controller node follows
>   sorting style by reg address, between watchdog and crypto nodes. Update
>   clock-names to 'pll'.
>
> - patch 3/3 "bootph-pre-ram hinting needed by boot loader": add missing
>   hints for syscrg dependencies 'gmac1_rgmii_rxin', 'gmac1_rmii_refin',
>   and 'pllclk'.
>
> E Shattow (3):
>   dt-bindings: memory-controllers: add StarFive JH7110 SoC DMC
>   riscv: dts: starfive: jh7110: add DMC memory controller
>   riscv: dts: starfive: jh7110: bootph-pre-ram hinting needed by boot
>     loader
>
>  .../starfive,jh7110-dmc.yaml                  | 74 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 24 ++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/starfive,jh7110-dmc.yaml

Thank you!

For the whole series:

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
