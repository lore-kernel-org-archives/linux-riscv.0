Return-Path: <SRS0=4jtk=PI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2A1C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 18:48:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EF026103D
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Oct 2021 18:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EF026103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aSl4sXbuq3xzuXSxZLE/Sa6BLt8rlzNWI/Uj59N+A/Q=; b=QTbBYtvgoteRrs
	PHX+SKrNuyjSs3BCmmbcnMvaixV9LBxLJwZrvOR3iI4yXk24FaWHMiLw9xfKmuieOWu+62FMZkpDx
	R1cMHjBEVAsAHL6CZpRYJ1F+DTJ+Vt3OqGHz1CqtM1sKdW6j5CreX1AeWwzfViiQn/SUmZZwWl20U
	6LhuJ/gPG2+GAu9fT0Br1A1tJcLskmWIVT51VTavSI7PfV0U97VaTw7wokMm2uHDZnpC2s5riqGYb
	d36AAH5CcqRvQ1FUDHOwZDPNmunIWHpjdfJ7ALYqW7vJMmS+t9ZDWz4JpDJT8HZwi8B4t4Vvd7mDc
	cEEE0pdfmqYtH8hIseRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdGdM-005VQP-60; Wed, 20 Oct 2021 18:48:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdGd9-005VNp-G6; Wed, 20 Oct 2021 18:48:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C52D61038;
 Wed, 20 Oct 2021 18:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634755683;
 bh=n8VrOe4I2yKWKENo2xOz+GrW26l+tosuZNQ1rYD5gKE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X8tKojH7Z8fdPyVTk4z+AoVAS3a9h5oYDEVDa7uI3b3vQWDC0RDkopnsSuFW09wMx
 S5ymoCHlxw+BZDcfi8a/SbXyaru92R/D/4JVacWcGVpk2lCHkMZKGKNpRCcpV4amQE
 0SC95mBmBf+xrbZsPKYOZ3Tw+i6Awvb4CDoD4fADso7xeFCGtNQbQjFeERWiYt5J4a
 XviC1MWcQkWkyhnJbBbb7MhB9KdUgixAetlN+ZjGulMI+TYlz6yOX8pi/IJu8QIrAm
 DPTPSRiUO2vc4Q2/LyUL9rJoQfRdVbdcu/SicgghaP/nLNsd5aIhVOahGYlBk3gw4h
 jokZEwKpwMQ/g==
Received: by mail-ed1-f47.google.com with SMTP id t16so276606eds.9;
 Wed, 20 Oct 2021 11:48:03 -0700 (PDT)
X-Gm-Message-State: AOAM532z4p26pRQHpJgW/DYpUto2rwOOACz7Imc/dbWIRzxSXWLpys4D
 B2g915QLXeuBdN8UJmCJf+Bev2B0uMsvSjpy5Q==
X-Google-Smtp-Source: ABdhPJyDkQcU37hcsbyKe6namKZuEksRA+CPb1y/N+dx0XKOp77yba3905ZumF5lcfjyaXaZElnjUUGJ+2NqhJwXc9g=
X-Received: by 2002:aa7:cd0a:: with SMTP id b10mr942298edw.164.1634755670808; 
 Wed, 20 Oct 2021 11:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211006164332.1981454-1-robh@kernel.org>
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 20 Oct 2021 13:47:39 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLg1=T52MqhsGgmAcRueC_nJdivGg4h+M2Bd8W3fyHCmg@mail.gmail.com>
Message-ID: <CAL_JsqLg1=T52MqhsGgmAcRueC_nJdivGg4h+M2Bd8W3fyHCmg@mail.gmail.com>
Subject: Re: [PATCH 00/12] DT: CPU h/w id parsing clean-ups and cacheinfo id
 support
To: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 X86 ML <x86@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Openrisc <openrisc@lists.librecores.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 SH-Linux <linux-sh@vger.kernel.org>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_114803_586536_1C72BD80 
X-CRM114-Status: GOOD (  16.11  )
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

On Wed, Oct 6, 2021 at 11:43 AM Rob Herring <robh@kernel.org> wrote:
>
> The first 10 patches add a new function, of_get_cpu_hwid(), which parses
> CPU DT node 'reg' property, and then use it to replace all the open
> coded versions of parsing CPU node 'reg' properties.
>
> The last 2 patches add support for populating the cacheinfo 'id' on DT
> platforms. The minimum associated CPU hwid is used for the id. The id is
> optional, but necessary for resctrl which is being adapted for Arm MPAM.
>
> Tested on arm64. Compile tested on arm, x86 and powerpc.
>
> Rob
>
> Rob Herring (12):
>   of: Add of_get_cpu_hwid() to read hardware ID from CPU nodes
>   ARM: Use of_get_cpu_hwid()
>   ARM: broadcom: Use of_get_cpu_hwid()
>   arm64: Use of_get_cpu_hwid()
>   csky: Use of_get_cpu_hwid()
>   openrisc: Use of_get_cpu_hwid()
>   powerpc: Use of_get_cpu_hwid()
>   riscv: Use of_get_cpu_hwid()
>   sh: Use of_get_cpu_hwid()
>   x86: dt: Use of_get_cpu_hwid()
>   cacheinfo: Allow for >32-bit cache 'id'
>   cacheinfo: Set cache 'id' based on DT data

I've fixed up the openrisc error and applied 1-10 to the DT tree.

The cacheinfo part is going to need some more work. I've found I will
need the cache affinity (of possible cpus) as well, so I plan to also
store the affinity instead of looping thru caches and cpus again.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
