Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33D2C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Feb 2022 18:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NtN21fkCw9/4zAfT9tIf5tngHU7o87AgpDrU5cY9RS0=; b=3ezTzY6xZ8TabJAtI1B+WmuqYd
	ySwtMVABXXcRRzyIIv0rlrh9GPTVnuTB6x1osP5WTfm0ktTsYxnRPL/mGgyIhhY+orgp5ww6mV7hK
	Sgk53h/isDmuTRhBlgnRx5nX3EmBJgFvEiNPguT15cxZMej3TIUfHxhp+d6dMtj68++kQxRhyYKux
	M5QaDB46mc/fhsNi+tZjf8ruiaO2SQZDlW9FBiGoymE34UiEMyXhipfqehRnTL506cWhoi53GqQ5+
	jYLctMQunMTkOh5mR0+3byoYSHHN2pUYVpfJnGFXpOPTPUUR2Kr9+CfPRZ+aDUFJtDnxlOv8FE7cQ
	X2a/p5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG3ky-005FRx-EO; Fri, 04 Feb 2022 18:56:28 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG3ku-005FQ7-33
 for linux-riscv@lists.infradead.org; Fri, 04 Feb 2022 18:56:25 +0000
Received: by mail-pl1-x631.google.com with SMTP id x3so5936821pll.3
 for <linux-riscv@lists.infradead.org>; Fri, 04 Feb 2022 10:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Jg17IORQiX50k9hzchIY/5BxWqpFAaTYJl32S7Q4Sbg=;
 b=uPCBA5viYD0QY7M/Rk2spN+UqATL+2sZOvKQcSrR4zPjEW8JpEMsNra2IDMdJN9IFZ
 BYaxujrLvUFl/sMTSX2rkGMLjT0+NSDY734GgVVQ4Dsg43Nj2oFOjdRafThSkGAgFH5l
 mpNkDd2Qa/R25MLGEYLjum9O3COWIlqByeP0h4mvo66JhYflXvWEKPZTxfXDEiCk6KUs
 9DeKMHJf9vbBqzFVxLRVLBrhtBN3QkkZuEGOzyBDmJDtXWT+0xGI9XxlrhvI1K9dtGfd
 VU0yIxCI82FBO6Abcczrit4gG0k1Wvvu8R2S5E6dddfzHuv+eaMnjGDAfSxDh1eDN8GN
 468A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Jg17IORQiX50k9hzchIY/5BxWqpFAaTYJl32S7Q4Sbg=;
 b=eOkuOUK5H8Ka2lZRFtSO5kjWzKPyM5563HXTo5pRq41krRycrGU4OpR8WIp1EtfXTU
 Nasmw4OKWmq14YA1wJ9+BDwqUQcg6rCyk5Bk1IffJDM95iJxJTjbKTV7pVaH/pDpQitd
 83UFRB1//vVYooUdk5qP2Z8zaGZhpAHB/Y88hi5EIwKVQ4sw5qBkuoLOUZglv+qmpKDc
 2dAnUzBPcXYN+mbVYM5w0JSmfCf63tSZoOC3wAjCSTD/LY0ebx+PY+8/IlSe3BJ34BAJ
 LrMCBBIsP5XyRE3jSy+9I/jcsA+fTjvxQaoiIKus1X9IvzeAX7eb6zXCabFVvBC3P/at
 oETg==
X-Gm-Message-State: AOAM5303ij01bgt8FnEkB7Ny2QfAdq2M1xghZfAJpnx6v8O8LX3KfU6M
 BNn0HFETnGdWFkNdouLJL68npw==
X-Google-Smtp-Source: ABdhPJzT7RTMUBVz+1BYpBITNrUEw6VSIBcSnFJFo16PdfPLdPCpcPdkajv5i36AHs82/DM/7IfWOg==
X-Received: by 2002:a17:90a:d144:: with SMTP id
 t4mr4663574pjw.18.1644000982761; 
 Fri, 04 Feb 2022 10:56:22 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id h3sm3069688pfo.66.2022.02.04.10.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 10:56:21 -0800 (PST)
Date: Fri, 04 Feb 2022 10:56:21 -0800 (PST)
X-Google-Original-Date: Fri, 04 Feb 2022 10:46:13 PST (-0800)
Subject: Re: [PATCH 0/4] Refactor the PRCI driver to reduce the complexity
In-Reply-To: <cover.1642582832.git.zong.li@sifive.com>
CC: mturquette@baylibre.com, sboyd@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, zong.li@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-ffd770d4-8f8a-417a-a589-f14d09f55282@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_105624_176601_24CC94BD 
X-CRM114-Status: GOOD (  23.87  )
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

On Wed, 19 Jan 2022 01:28:37 PST (-0800), zong.li@sifive.com wrote:
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

IIUC these there aren't bisectable: the bindings change will break 
builds of the DTs and drivers.  I'm not sure what's generally the way to 
go with these, but I always try to avoid broken builds in the middle of 
patch sets.

Aside from that this generally looks good to me, but the DT and clock 
folks are probably a better bet for a proper review here.  Happy to take 
this through the RISC-V tree, but IMO it's a better candidate for the 
clock tree so

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # aside from breaking bisect

Thanks!

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
