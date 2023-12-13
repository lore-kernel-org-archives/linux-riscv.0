Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1794C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vX9YsMrQHKy0PkfJjVmwpvajEJJRsrcbSBkc7qkSKRE=; b=1FXgyzvuQh0Mnv4IVmzTegf3xK
	zOdzcjkyWpDASte8tlsXXESZRCV1rcs/WY6bM10ay0bVyhQ2/d8fCWBWl/VpftL+dQxtUIAI9yMvF
	ncIRC8CTqdxkO/5IdY/LiG2EsQSI3Uo4lfqMO5pYYyzgMebX+kpffxSZerk4LhpUQGkC6NNeZVr9g
	PB7InkJDjQkCLj8FrOiD33bsO0pUaVMvFhvWjwBK34Uq/kkqghF3eT0Yx5O0chbkqFDTN+LsaRIOv
	37NEUYreSXy0+dg3ZtLHupbjlyD4WqRMBUzMcBR0Hlal0eBSBHQgZRQt0LMKhzIRLIoaX6PCKRuAv
	2l+S4NdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOWG-00EcIb-1e;
	Wed, 13 Dec 2023 12:39:20 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOWB-00EcHD-2T
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 12:39:19 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AD7A93F28B
	for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 12:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702471153;
	bh=RVX7Hkci1GalSOV+ggHHM2J9QrW4mGKi5xvBhDtdXC4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=f9szzBr3ADMAHhCsWCszBvUGzG1Hfw/V+cX8IlK8N3Jlj07oGhVS1/OWHUrvr/Rst
	 uBca6wkaw635mfxDExVlne3g2O4KPvLqyFufAdnSWb3mneSVCSnTBvvU5MZRsIy5EM
	 MVUiMFWCiUtdycsEFj18WtPVLnfe3hlMI4zUZebnU2nqjlw7BAYK9C12wSPzIKdi9Z
	 G3imHwl+NYcxa1hCVOUV8TreIC6mM6RGwV8K0XwzvEZkaEFzWRv/yu7Ixho9RiZDmN
	 cBGoeHF03hF7m0lgt6jdpFugAFzvdicfrNMS+uHjR2MQ1ZLlt1hddeMYpQCmgTK4RS
	 /NIUKjD4zUIjg==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-425d5915c69so37028181cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 04:39:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702471152; x=1703075952;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RVX7Hkci1GalSOV+ggHHM2J9QrW4mGKi5xvBhDtdXC4=;
        b=T/0i4KSsnDT1WXYSw4Hy5Oxdne7Jhk/1YVL4WB/htDx/I443FWtQnMZWAKSv3XMXoA
         Q18mk/UGaCUpD7FLrcd8lIyX8ZkZmEMfWLmhpHIkodv0+UR7t8GcVvM86kJv7Gt9r852
         DIg1rOGJRh9AkIzUZGty+0wDIDjYpPTQX1U1P8sjvhPhRnPaIHSZc802Ks7b5tIAYUyq
         UoAlHNDjZiImDfxUD6O9cKvPqpmUarXUuOO7rjrcimU1jjm8yzbxIytai+EOysaz6MmQ
         8G32fbom8GDaJobAqZUbfrHfJ2va0tFRJbEpcttgGxkrnhZ8h+8bL2mQWUzrzl2b7s+l
         Hl2g==
X-Gm-Message-State: AOJu0Yy69N8hGPTj021QgFjzYHmDANO1D/ZyNIqssMgErm4JcBSIOGCn
	kh0O0Qw519k3Hr9I6mrJGx4Ku2LvyhAvivO1aS0rCfeDRKsSjNcAs9eEdAOENj53aaK5Q1feaBt
	Si2fhFEC0095hJnWpaUualJ/oBeAuNDnvxBNVKc3Ot42y0BTP+qj0QGQvZ09+rw==
X-Received: by 2002:a05:622a:28f:b0:425:4043:96c5 with SMTP id z15-20020a05622a028f00b00425404396c5mr12063926qtw.82.1702471152385;
        Wed, 13 Dec 2023 04:39:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIeVXeXX7w4KcjeNOZNUYxmPvYFuILxSBmeeP5KBI6qOM2DYJi1AyFB9Hnx/wH7nuTyyjZHzceB4Cl8ASZSCc=
X-Received: by 2002:a05:622a:28f:b0:425:4043:96c5 with SMTP id
 z15-20020a05622a028f00b00425404396c5mr12063906qtw.82.1702471152113; Wed, 13
 Dec 2023 04:39:12 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 13 Dec 2023 04:39:11 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CAJM55Z831ucY4QqPTR_0zJVB05UUT4W-3M0CGzvtyPo=AMD=Vw@mail.gmail.com>
References: <20231201121410.95298-1-jeeheng.sia@starfivetech.com>
 <20231201121410.95298-7-jeeheng.sia@starfivetech.com> <CAJM55Z831ucY4QqPTR_0zJVB05UUT4W-3M0CGzvtyPo=AMD=Vw@mail.gmail.com>
Mime-Version: 1.0
Date: Wed, 13 Dec 2023 04:39:11 -0800
Message-ID: <CAJM55Z-BJMi=rbe8op5EQ-efwo-9AbmavVE1BVJ9_xuHQzMhLQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] riscv: dts: starfive: Add initial StarFive JH8100
 device tree
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, kernel@esmil.dk, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, krzk@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	daniel.lezcano@linaro.org, tglx@linutronix.de, conor@kernel.org, 
	anup@brainfault.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	michal.simek@amd.com, michael.zhu@starfivetech.com, drew@beagleboard.org
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, leyfoon.tan@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_043916_194238_9BA24DA9 
X-CRM114-Status: UNSURE (   6.35  )
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

Emil Renner Berthing wrote:
> Sia Jee Heng wrote:
> > Add initial device tree for the StarFive JH8100 RISC-V SoC.
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
>
> Looks good to me, thanks.
>
> Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

I just learned that this JH8100 is not actually a real SoC yet but just an FPGA
implementation, and no indication that that's actually a product that will be
mass produced. Hence a lot of details may change before it becomes a real
SoC/product people can buy, so let's not add this device tree yet before
everything is set in silicon.

Please consider my Acked-by abeve revoked.

Sia Jee Heng: With that said I still think it's super awesome that you're
beginning upstreaming support for your new SoCs early. I wish more SoC vendors
would follow your example.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
