Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AA1C10DC1
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 22:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/ka+Y/kb7QW1YYz8ioTy/Nv5fEqA+MnSED61C9bN/C4=; b=C1tPCrghoj7qwPk6D9MFRc24N/
	apma46LoN8qBgVDaWWREqrTHfhHJBxDtnQY4c0XJGc/G86tgG7lZ1WpDN+yxrxIob7RZfnCZDpCU1
	GkBH9RPsYGlvau6wg3asey1lbW4inO73jWbeaS7jhoKAU/7dNJMVQXFP3VfPgLsYkFkYq8uWOw9lY
	D3uPi0SC+DOtVseo4ObiU00MyAH0Mnd39NFFYDgBLIm/zZqQaymmOEd38pQbN7yhg5kuzYpmiAQQF
	oa+X/1slfJZUtAmSI3YQ9K7yYH1XCILdmoV85jj9rqTdAxVnpFtgVCvjzuGB77T7xDsDUPJtO5KBg
	GZHGBNlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9Y9a-00G9HT-06;
	Sat, 02 Dec 2023 22:08:02 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9Y9U-00G9G7-2G
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 22:07:58 +0000
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A49EA402D4
	for <linux-riscv@lists.infradead.org>; Sat,  2 Dec 2023 22:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701554872;
	bh=VhuiHjzGmesIrY/hSc2y05bK2i7Am6FUImDyu0cEMgU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=DyHa6fTFxrMFdfW1mld8lFQEIwtgft806aM7Gp7qnP/CXyLGYLMm5DCkb8KAzxIqo
	 7shdaaZODXsjTqNkkfRy3HBsCWhIwKN08OcVr0U6neOPpsXQZz0U7MJ/eXmQWjUYgM
	 XwbnyWVqFWzjju1tZj0iWxvd5aOjd7Uj0pr+FUCAwhFuLQgBeOvVp5foN3jvTCv1c6
	 Z5GYMS7hOPXDpTDHLMSRH5IyH5apPLVLYofDZ8Wofab1m7k/Qvzf6HLVbNtQKZtx6A
	 Y/CYjALKLDxc/ak38EIV8hoXWcG6Y7A/roQkx42pGTJfgU9Pto4G+XQAL8duCDZDs2
	 jPmMDDKY8Y5Og==
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6d646a0d9bfso2404953a34.3
        for <linux-riscv@lists.infradead.org>; Sat, 02 Dec 2023 14:07:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701554871; x=1702159671;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VhuiHjzGmesIrY/hSc2y05bK2i7Am6FUImDyu0cEMgU=;
        b=JswOB3OaPglfgvAvvo7NZXZaPqp48h8WuvHZJu0+lnF+sInTeg8MkxZBY0yXWePpCi
         SzCj4E704RUNxDYmMe5Z+1e6D3kGx3VF6Vg/f4XRsQH1KiFNaOsSXfnhEIQUkmXoBMjo
         DnIY5cptqTascg4r6CFgGQ+zMmns2F24xCg+syiDThXn/p44uTpiQetgDHCZV1+YH+do
         SY1bDoqhsNaCm/2Dq/glOV6YdWzxLj+xUTBqYJX2bS9d9ppoYGz+7EaADm2jMAI42W3n
         x606MrKOeIXv/FRpTR25GSSlrEW8rNHR91PdcMpjOyp3R94YvrSSZLbjk/pIMG4lc3Gh
         0sMw==
X-Gm-Message-State: AOJu0YxtTIXSP8xRpML5tiCybveZkT6y7vdSKVjZWHvC0JwUs44qZlUq
	Mj11p2FBl5bDQcK8b1ZaA+3js/WtHfMyoSapVPy4+NjidqjQZCBF3xtg2/Yt3VRU+EB/yPJJ9z+
	K0WbbEKDqxDXs/1XyYBLPuIRDP314NYWJUW/w1MV9QAcWXA/k0/UzZuHT51sipg==
X-Received: by 2002:a05:6358:4e:b0:170:17eb:7c67 with SMTP id 14-20020a056358004e00b0017017eb7c67mr1396016rwx.58.1701554871286;
        Sat, 02 Dec 2023 14:07:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGDgcC7p1ZVM37WrYOl9g6KwCFC9ba5aGWjLgxDGJ2WolVrkOMQ2nYCO3RuaqPRlAtCZA3dv3QColkp70DC18E=
X-Received: by 2002:a05:6358:4e:b0:170:17eb:7c67 with SMTP id
 14-20020a056358004e00b0017017eb7c67mr1396010rwx.58.1701554870917; Sat, 02 Dec
 2023 14:07:50 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 2 Dec 2023 14:07:50 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231202153353.635-1-jszhang@kernel.org>
References: <20231202153353.635-1-jszhang@kernel.org>
Mime-Version: 1.0
Date: Sat, 2 Dec 2023 14:07:50 -0800
Message-ID: <CAJM55Z-9Y=QitvAX+z=XTTMM0CGRzGMD5z0H_Bzv=Q85b49rpQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] riscv: dts: starfive: add Milkv Mars board device tree
To: Jisheng Zhang <jszhang@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_140757_016516_39D03E7F 
X-CRM114-Status: GOOD (  15.33  )
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

Jisheng Zhang wrote:
> The Milkv Mars is a development board based on the Starfive JH7110 SoC.
> The board features:
>
> - JH7110 SoC
> - 1/2/4/8 GiB LPDDR4 DRAM
> - AXP15060 PMIC
> - 40 pin GPIO header
> - 3x USB 3.0 host port
> - 1x USB 2.0 host port
> - 1x M.2 E-Key
> - 1x eMMC slot
> - 1x MicroSD slot
> - 1x QSPI Flash
> - 1x 1Gbps Ethernet port
> - 1x HDMI port
> - 1x 2-lane DSI and 1x 4-lane DSI
> - 1x 2-lane CSI
>
> patch1 adds 'cpus' label
> patch2 adds "milkv,mars" board dt-binding
> patch3 adds the devicetree file describing the currently supported
> features:
> Namely PMIC, UART, I2C, GPIO, SD card, QSPI Flash, eMMC and Ethernet.
>
> Since v1:
>  - add two new patches which add "cpus" label and board dt-binding
>  - adopt Krzysztof's suggestions, thanks
>
> Hi Conor,
>
> I see you have sent a patch which moves the timebase-frequency property
> to soc dtsi, but this series doesn't rebase on that. I can update it
> once your patch is merged.

Hi Jisheng,

Thanks for working on this! On the JH7110 the mtime derives almost directly
from the external oscillator like this:

osc (24MHz) -> rtc_toggle (div 6) -> mtime (4MHz)

So to me it makes sense to define the timebase-frequency in the same file as
the frequency of the external oscillator.

In general it looks good, but if you do

  diff -Naur jh7110-{starfive-visionfive-2.dtsi,milkv-mars.dts}

you'll see that those two files are almost identical. Even external clock
speeds and all the pin configuration are the same. I'd strongly prefer to have
all that factored out in a common .dtsi so fixes don't get out of sync.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
