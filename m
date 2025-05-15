Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E41C2D0CD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 17:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4BVkjaNvwpBLFCaKS8QTmdfiGm81xRWUfHxsDEQRhwY=; b=JsZbxZQ+47Fmi88RldsM96smpe
	iNA+gO7w9C85AKwmYjGsqUFy4eyJ1TReYHOT74yBHWIx4UOmyfbtxV9kDa+cWl0igqurghUCTQQ4a
	N5AAW56p25E83tMnF8mZB83QORO2//PgUUrUUfnyOE1WhSxahkukA8nCetG5iJnxIo6Z+mWia69ui
	RwE6dTVu2hcTBSUGN5AozIfH7VTUGp5OvFaoWEzmS5e5HG2ET1Agc/gqZ+zaFNo96KjmlLQql5kmm
	lpFTDDrWKkMvBn5T6FmX5VzWXu8E4ZeFc8UCS7pXFpXu9LDW7Na61yQq8ZBUvSvGh3+mZZA1/bxVZ
	oVdAhuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFc73-00000001NVl-1CTI;
	Thu, 15 May 2025 17:11:17 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFc6z-00000001NTi-0qRW
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 17:11:16 +0000
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D94F6497A1
	for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 17:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1747329071;
	bh=JtByJyVo62jw0XHnA95uqk/ce1yHYsp6TEnfnoc5j1w=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=r/JoAS2Jb1wPrMmLcs69AI2+fuaDClffG3bFK6tg8psKkcDe+T5zdYBFLP/mv/y//
	 MitmvYbZr8BXqljB3ZQ5WrpwgQThfi7yx9iCT0JPPCcvAHpQNCGI+fCHApq93djaZS
	 s6Cuf/XbFSEqli2kwOid8vMAL8iU6WyCDhMmZPkZJ9DmAukMJLDamk6ihOlzUQ96/i
	 ajZBFSzxTNpgHcfk3hHZMn5wuOGs3JwqsI7w7RmQgiDMZUCxeE6cj0zNit9ht2gYVG
	 boz/mL/oTpX4ya6qXNJF96ziW3KaLs7AfbWi3EaKafR8Uo5tgyeUTLqgii7EqXHs4F
	 bJWGZEATyhj1Q==
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f544cf3f6dso26414046d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 10:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747329071; x=1747933871;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JtByJyVo62jw0XHnA95uqk/ce1yHYsp6TEnfnoc5j1w=;
        b=QGaPjTQBDAc6uQ3LON/Sky1PilDvXj7mQJU5Na6xWCC+L8uMjJoKRp1QH5G8E2Vy7A
         6WQWoBNj/GzjWX0eTKPTwY473GzCdv0jTdJDMzZBGTPaD78K+OFr1zYJF3tmPTurOy76
         H8hFjDxmetYbd2oYBVZSq1u3bTyETRPldzlfowuAhmq+DUTqx2MaQKKzJTk6p9+tfGIY
         hvqDSUO7C4v46Mct088OK3B8J5PtR0pd2TvhPNTktzZK66E0A7IKW13k0NR7ogx7yqdA
         cJz6y39KE4QrpnOXOCwhPsPAnarwT/lL0aZXv41f6QXuhCXFzAVLNw+xcU2nJUeePH58
         fKEA==
X-Forwarded-Encrypted: i=1; AJvYcCWCn8zZUaJ0rHYKFUKqNpAC3T09z4GgY7OQTScmobDwqXHEjJM+Fi4jFehkDD7dQdTEbrePTyI9jD08cA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxvlAc7vLW1+4zE31F0qO+l5p1b/JqIXNw29wJ2KiOOSF2guZS
	KEGb6BVAg8d4+0LLMxacnkobiuuVQEohjAZObPQhY00fbs8XL+DZwR/rf4QOi5NmQGKhrqPX+HS
	vypHz8fR6KZg5YLIYc/IMc92DUhSpGGNnFXkkKFwUuqXTs8kMeTo33gq3knS0Z7NrXTkT8qADG4
	nv98fF41eWy+djUmecip2mHSzI8qqXxR+7mVHWNTBrhxnueMvtK3AJJXHyAmovhNUuKOonl7pF7
	xVA
X-Gm-Gg: ASbGnctvWvDRJ8q39IiZflOhpvRWj3YCiP+SzOO7gspM0ekBPB5s0Tk7HQCLO1NRIoq
	mGToBOymrtro21EwYA9YOZEV6hfP+4z4xfZ+9IpsvE2J/yyySxyinLvwbVnV9ODcscJG34w==
X-Received: by 2002:ad4:5cca:0:b0:6f2:d45c:4a35 with SMTP id 6a1803df08f44-6f8b08eb5fbmr10140476d6.37.1747329068751;
        Thu, 15 May 2025 10:11:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcaUH2N5muwkVDiIxEHWItA30nxiMYoNCDf2Wv2idVAmWCRr+uin/5sa1AilKtPRZiwiaH2QNVjHO7L9k7ddY=
X-Received: by 2002:a05:6820:1841:b0:608:3ee9:13a4 with SMTP id
 006d021491bc7-609f37a4c25mr127767eaf.5.1747329055811; Thu, 15 May 2025
 10:10:55 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:10:55 -0700
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 May 2025 10:10:55 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250502103101.957016-1-e@freeshell.de>
References: <20250502103101.957016-1-e@freeshell.de>
Mime-Version: 1.0
Date: Thu, 15 May 2025 10:10:55 -0700
X-Gm-Features: AX0GCFsMRCnrUVPh4GyhcmqGXz7TGDQn2DvhmQZjDAp9e_FqEd74NBSnaFQLito
Message-ID: <CAJM55Z_ebHvpf=G9fMGctkPbAtVd6yco6joRNVbzcAtiEzD=ag@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] riscv: dts: starfive: jh7110-common: Sync
 downstream U-Boot changes
To: E Shattow <e@freeshell.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_101113_369750_9AA87B3B 
X-CRM114-Status: GOOD (  13.48  )
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
> U-Boot boot loader has adopted using the Linux dt-rebasing tree for dts
> with StarFive VisionFive2 board target (and related JH7110 common boards).
> Sync the minimum changes from jh7110-common.dtsi needed for boot so these
> can be dropped from U-Boot.
>
> Changes since v2:
>
> - 1/5 -> 1/4: Do not replace assigned CPU core or PLL0 clock when adding new
>   assignments. Adjust patch name and commit message accordingly.
> - 2/5 -> 2/4: Detail reason for qspi setting changes in commit message
> - 3/5 -> Drop uart0 clock-frequency patch
> - 4/5 -> 3/4: Add reviewed by tag (no change)
> - 5/5 -> 4/4: Follow dts coding style sort order. Add bootph-pre-ram hint
>   for mmc interfaces
>
> Note: mmc boot source modes of JH7110 loader on mask ROM are deprecated as
> of StarFive JH7110 User Guide 1.2 revision. The loader expects data within
> range of LBA 0 and LBA 1 in conflict with GUID Partition Table.
>
> SD Card and eMMC boot media are prepared as follows:
>
> # GPT partition SD Card or eMMC as
> # 1: Secondary Program Loader @ 0x200000
> # 2: Main payload area for use by SPL
> # 3: EFI System Partition
> sgdisk --clear \
>   --new=1:2M:+2M --typecode=1:2E54B353-1271-4842-806F-E436D6AF6985 \
>   --new=2:4M:+4M --typecode=2:5B193300-FC78-40CD-8002-E86C45580B47 \
>   --new=3:8M:+100M --typecode=3:EF00 /dev/sdX
>
> # Write offset value in bytes of loader 'backup section' SPL as part1 @ 2M
> python3 <<-EOF
> with open("/dev/sdX", "r+b") as f:
>   f.seek(0x0004)
>   f.write((0x200000).to_bytes(4, "little"))
> EOF
>
> # Write invalid CRC to trigger 'Main section boot fail,use backup section'
> python3 <<-EOF
> with open("/dev/sdX", "r+b") as f:
>   f.seek(0x0290)
>   f.write((0x5A5A5A5A).to_bytes(4, "little"))
> EOF

This series looks good to me now. Thank you.

/Emil

>
> E Shattow (4):
>   riscv: dts: starfive: jh7110-common: add CPU BUS PERH QSPI clocks to
>     syscrg
>   riscv: dts: starfive: jh7110-common: qspi flash setting read-delay 2
>     cycles max 100MHz
>   riscv: dts: starfive: jh7110-common: add eeprom node to i2c5
>   riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by
>     boot loader
>
>  .../boot/dts/starfive/jh7110-common.dtsi      | 31 ++++++++++++++++---
>  1 file changed, 27 insertions(+), 4 deletions(-)
>
>
> base-commit: ebd297a2affadb6f6f4d2e5d975c1eda18ac762d
> --
> 2.49.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
