Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6563AC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 05:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ww7RPHcheDiHKqFr8hHxAubRodarJEBSgQW2lxPloHk=; b=RKPW48+KfFdAmSimtujepXF3hg
	IG6PzyQQMtMFEr58WYEpwlRCV3GqS3XON8YPNb5eV/ZVy6TrW4by+n4CEGCULGIJPNv9Z8NVhM2lV
	eF3bLE1OlmxpY6XBqo367KPC6YjxwIGnG8Ys5e8MS0+GodUpWFpeiexgv6SawgDvC28/WWq98tjyE
	gr7iBDEFz/z3qZSfzsf+BxrZRLOoqaL8QGWWi6NGpGsy0SNbgL7Qy03VPUmszjZ2H+/+bTlXKuusK
	rmgqgr3UYZebTJ2cuOus1UHg1oiiJXMhv0NsVnGISDDkEjeWr26I+LmdjEIrirIsOCZ+kGmEu80gh
	BcvRC2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCE7u-006TYN-P1; Tue, 25 Jan 2022 05:12:18 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCE7r-006TXo-VR
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 05:12:17 +0000
Received: by mail-lj1-x234.google.com with SMTP id t14so13519215ljh.8
 for <linux-riscv@lists.infradead.org>; Mon, 24 Jan 2022 21:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=ZGyzBA+XlQ6F5GTLHJupOokjX96+atE9oKu+PQxFbIs=;
 b=GOQ1PbZ6xR8OFtGgBNirZAyrAVd14xJIvA3zYrAEIMlLFI92uPKYur4reEE1aXVUmW
 +iAvRfdKWGz8dWT9+y75NKFANHV6mIwCS3QX+0T3g9WTFoA0JYWRNpSkk6qF0rXmUVNs
 nB/y2p1v0ZrynSKoXJVPeWg6Oa/TYYOO347mGPntmYroCeU4Ca/HEJ79eSRNWUtEU9nl
 SlZSHcBkyemr/mxlBnScqNw4sa44WkIOKKWWYbo45h4RE41Dmw7qVK/jMWtPYCzgg8UY
 v7N2yHTPTxJgTj1/iaCyRTjQEeAcFgLzWm1OUT1zG1c2jk7xTlohKK5WUMT6AGVzPWGQ
 XGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ZGyzBA+XlQ6F5GTLHJupOokjX96+atE9oKu+PQxFbIs=;
 b=AnWEhx7YmWmN5DQ+3Gw1WyBOFVmxc+IT7ueeaHRExgyU7CpZTjsGBq2LfOl0yyb50d
 BcQJqoDXb7g85Xi7uHPxKgVndRPtRXlZnDT16gyA7RZJuI0aD4mOkUt/GZ76YIsHrP5j
 4LhwC3XBCX/ttp10Cv53LNWOHw5/ggo1E1iYcogCswCSOBoIMHFMZjacnjdCNhqURiZk
 AIkkqTeGY7vXnwalzZwAQxhDzeKILp2pfDv5q2srKXpBSM9bbw9Z5xkNH8PBilSxel17
 Rlm+lNpnhT6TkrPKYvYs7AaqzIee18q72m7pKLE6kaweWYxY9kwOp8p3P9CW+w/Lq/wd
 Yrig==
X-Gm-Message-State: AOAM5337v1qN0Aqx07ZNxGM9T+Z2vXDsCSE/xX8GpLFGcZS+9AdJJ8dA
 cFEYmIpvOR74Pzv/7dFOcN01PvrQ4FVGzeebGzj7ZQ==
X-Google-Smtp-Source: ABdhPJwmDQASZqc5TLdz6lkxcncn+MPxfVSubqIKKHVUHrZ6012DuApiU3/H0PMOW5hQghP6qVQ/BCf/TGbi83Nlgjk=
X-Received: by 2002:a2e:8707:: with SMTP id m7mr2935760lji.516.1643087534046; 
 Mon, 24 Jan 2022 21:12:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1642582832.git.zong.li@sifive.com>
In-Reply-To: <cover.1642582832.git.zong.li@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 25 Jan 2022 13:12:02 +0800
Message-ID: <CANXhq0rzTAOrLBShX9AHoNdOy5HPcXj-ZqpND4R_PP-1J-vDag@mail.gmail.com>
Subject: Re: [PATCH 0/4] Refactor the PRCI driver to reduce the complexity
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_211216_035623_C7DA86F4 
X-CRM114-Status: GOOD (  20.47  )
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

On Wed, Jan 19, 2022 at 5:28 PM Zong Li <zong.li@sifive.com> wrote:
>
> This patch set tries to improve the PRCI driver to reduce the
> complexity, we remove the SoCs C files by putting putting all stuff in
> each SoCs header file, and include these SoCs-specific header files in
> core of PRCI. It can also avoid the W=1 kernel build warnings about
> variable defined but not used [-Wunused-const-variable=], like 'commit
> 487dc7bb6a0c ("clk: sifive:fu540-prci: Declare static const variable
> 'prci_clk_fu540' where it's used")' does.
>
> This patch set also contains the dt-bindings and dts change, because
> we change the macro name for fu540 and fu740 by adding the prefix
> respectively.
>
> Thanks all for your review and suggestions.
>
> Zong Li (4):
>   dt-bindings: change the macro name of prci in header files and example
>   riscv: dts: Change the macro name of prci in each device node
>   clk: sifive: Add SoCs prefix in each SoCs-dependent data
>   clk: sifive: Move all stuff into SoCs header files from C files
>
>  .../devicetree/bindings/gpio/sifive,gpio.yaml |   2 +-
>  .../bindings/pci/sifive,fu740-pcie.yaml       |   2 +-
>  .../bindings/serial/sifive-serial.yaml        |   2 +-
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  22 +--
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi    |  26 ++--
>  drivers/clk/sifive/Makefile                   |   2 +-
>  drivers/clk/sifive/fu540-prci.c               |  89 ------------
>  drivers/clk/sifive/fu540-prci.h               |  91 +++++++++++-
>  drivers/clk/sifive/fu740-prci.c               | 134 ------------------
>  drivers/clk/sifive/fu740-prci.h               | 130 ++++++++++++++++-
>  drivers/clk/sifive/sifive-prci.c              |   5 -
>  include/dt-bindings/clock/sifive-fu540-prci.h |   8 +-
>  include/dt-bindings/clock/sifive-fu740-prci.h |  18 +--
>  13 files changed, 254 insertions(+), 277 deletions(-)
>  delete mode 100644 drivers/clk/sifive/fu540-prci.c
>  delete mode 100644 drivers/clk/sifive/fu740-prci.c
>
> --
> 2.31.1
>

Hi all, thanks for your review, I'd like to know if anything else can
be improved in this patch, or it might be good enough to be picked up.
Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
