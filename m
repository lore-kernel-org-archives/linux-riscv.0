Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FA7ECE587
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 19:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jmZuLKurYliqf4zuhy9MsBY4ha61pEdi2GkW5GSRiA=; b=giX9ckav3XKZFP
	oeKBU4CThv4qN0idyiiV+tGUFAIvAAGttTmvgPEVegAcAqN0vNnzxW8INxNvqR9pQRnzrE7dkUCSD
	7q4A1Zu+n5TflFQeYduYd//iVqVq520pNjYz4MlaeIJnG5i2eQRRNaS3K6DCIyV+DWOK6pfDSAwbX
	8eX/0cm8GzJAQMast+67SzqRAM9H2+OnhNXk2dohp52BgEmNU0o2gkyFFkpPBTYH3311MKhYOwSsp
	oMcbDGU9oUbJYLz9OEOJ9av2VGCG/ZSelEeyheAZFzBjfZXvGJE+CKEXi3PaCVJM3kVJtvMYwDPGh
	phHtxck22BIpYFvhAqMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snk0D-000000034aK-2ckG;
	Mon, 09 Sep 2024 19:24:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snjzA-000000034Of-1gBz;
	Mon, 09 Sep 2024 19:23:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EDBF106F;
	Mon,  9 Sep 2024 12:24:02 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71BF83F73B;
	Mon,  9 Sep 2024 12:23:29 -0700 (PDT)
Date: Mon, 9 Sep 2024 20:23:26 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Sam Edwards <cfsworks@gmail.com>
Subject: Re: [PATCH v6 3/3] riscv: dts: allwinner: d1: Add thermal sensor
Message-ID: <20240909202326.59927766@minigeek.lan>
In-Reply-To: <08466bb0-4306-4941-97e1-e62ba07d8ea2@gmail.com>
References: <20231217210629.131486-4-bigunclemax@gmail.com>
	<08466bb0-4306-4941-97e1-e62ba07d8ea2@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_122340_515706_71CF1106 
X-CRM114-Status: GOOD (  11.95  )
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
Cc: rafael@kernel.org, tiny.windzz@gmail.com, contact@jookia.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, samuel@sholland.org, daniel.lezcano@linaro.org, jernej.skrabec@gmail.com, anarsoul@gmail.com, wens@csie.org, rui.zhang@intel.com, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, linux-pm@vger.kernel.org, robh+dt@kernel.org, mkl@pengutronix.de, paul.walmsley@sifive.com, bigunclemax@gmail.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com, lukasz.luba@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 9 Sep 2024 10:16:56 -0700
Sam Edwards <cfsworks@gmail.com> wrote:

Hi,

> Hi Maksim,
> 
> Apologies if I have failed to find a v7 of this patch in my searching, 
> but I'm seeing that patch #3 here was never applied, so Linux still does 
> not enable the thermal sensor in these chips. I just thought I'd give 
> you a heads-up in case you weren't aware. :)

There is an unaddressed comment on this patch: to remove the "disabled"
status line. Sam, feel free to fix this and send the patch again,
unless Maksim beats you to it.

Cheers,
Andre

> 
> Thanks for all your hard work,
> Sam
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
