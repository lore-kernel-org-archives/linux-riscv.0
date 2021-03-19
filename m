Return-Path: <SRS0=wr6O=IR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC01AC433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 21:49:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D48B60232
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Mar 2021 21:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D48B60232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GE5yeU+zzP3I5/zvGSg8+wB4poN7/Cbe0pXVz+CkxNE=; b=P+Eh+Ghnqty/VUsaJGZ0ROb0bx
	t1kHm/Dca5/uyNR3/PoKnK2eGNpCicl1JDtPwNkizKfdIv5IpaNyTLZSDx6I5pNdeUqtW8CNVm915
	EsM9Yna8qvSXDvW93BCaTordOa3AbO/RcoRwffFSUzm8if4jajt6dVKRGj9VcnNOmqOTvlDYYqjy+
	q1dqHPGZrD167PD7yl4mDT0pynSDa9+yPfAnVblL0kNRlxEPfyBztfe5noorPrC96r8dhzVio2CzP
	sOBbCLXHPLTdqVWxU/F8zwsDaZcSNc/3EWyj56mp/4Qz5aVS081rd+BLyp1N7Ekapo38Vcqf8uIEP
	cMgoz6kg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNMzv-008DGM-Jl; Fri, 19 Mar 2021 21:49:35 +0000
Received: from mail-il1-f169.google.com ([209.85.166.169])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNMzj-008DDx-Cg
 for linux-riscv@lists.infradead.org; Fri, 19 Mar 2021 21:49:25 +0000
Received: by mail-il1-f169.google.com with SMTP id v3so9353082ilj.12
 for <linux-riscv@lists.infradead.org>; Fri, 19 Mar 2021 14:49:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=TSxYsh/4QZo74CdzAGCwJNDM12S7BjJC925sJJZcFS4=;
 b=ItfMB3iCaY4+e0Gmbkjb10PGvl1+hUQZiffg3+iydBUx6Bqj7ExI5Dr01TYlwHO1SI
 q3wgsmgCWhJD1dA35eCybRdTS5SC94UfoSsrTRgyyQG/G5SFdCoRw6gVbT8wExSJhyIk
 vZHZQpx51IJIxx1Y5yMWijb9j8ZYoepL9T3KhXtFki4BpUGAggAq0Zxu0rjGTVxCAVf7
 dqrKubgj7hM77Vs30Lr3xBshruq501OZEWtdMZORBA6ND6Lf+FRck4CISLrDpBtj0EAQ
 Inz0HtT6f12C26vJglCp5WNIcaiP71DroEpiZY1dc5zGZKmKKjeV+TysemlS9Zsx+n1w
 b/7A==
X-Gm-Message-State: AOAM5338Gk2XpiA+MAKEiUm6e2viStPjBK+eKgTgQolbRAYq30P01lgE
 g+fCi5X2Q1JLMad1UXiVpA==
X-Google-Smtp-Source: ABdhPJxZEwHBaki7JZj8S9Wfx9Q661XX+EpH7c18EJM7O2uuvyzAg5xLz15/qRWghrDG07cN0A7Ovg==
X-Received: by 2002:a05:6e02:174b:: with SMTP id
 y11mr4340361ill.152.1616190562286; 
 Fri, 19 Mar 2021 14:49:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id j14sm3031599ilu.3.2021.03.19.14.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 14:49:21 -0700 (PDT)
Received: (nullmailer pid 1647634 invoked by uid 1000);
 Fri, 19 Mar 2021 21:49:12 -0000
From: Rob Herring <robh@kernel.org>
To: Greentime Hu <greentime.hu@sifive.com>
Cc: linux-riscv@lists.infradead.org, zong.li@sifive.com, robh+dt@kernel.org,
 linux-clk@vger.kernel.org, hes@sifive.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, jh80.chung@samsung.com, vidyas@nvidia.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, mturquette@baylibre.com,
 p.zabel@pengutronix.de, lorenzo.pieralisi@arm.com, sboyd@kernel.org,
 bhelgaas@google.com, alex.dewar90@gmail.com, erik.danie@sifive.com,
 helgaas@kernel.org, palmer@dabbelt.com, khilman@baylibre.com,
 paul.walmsley@sifive.com, hayashi.kunihiko@socionext.com
In-Reply-To: <8008af6d86737b74020d7d8f9c3fbc9b500e9993.1615954046.git.greentime.hu@sifive.com>
References: <cover.1615954045.git.greentime.hu@sifive.com>
 <8008af6d86737b74020d7d8f9c3fbc9b500e9993.1615954046.git.greentime.hu@sifive.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: PCI: Add SiFive FU740 PCIe host
 controller
Date: Fri, 19 Mar 2021 15:49:12 -0600
Message-Id: <1616190552.561606.1647633.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_214923_577863_05473CBB 
X-CRM114-Status: GOOD (  10.36  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 18 Mar 2021 14:08:11 +0800, Greentime Hu wrote:
> Add PCIe host controller DT bindings of SiFive FU740.
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  .../bindings/pci/sifive,fu740-pcie.yaml       | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/pci/sifive,fu740-pcie.example.dts:45.29-30 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:349: Documentation/devicetree/bindings/pci/sifive,fu740-pcie.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1380: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1455121

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
