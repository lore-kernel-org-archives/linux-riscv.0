Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A40CCDB482
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 13:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mm/8l1pgbP8FUz96TgNMIljdU9E+5EHUz24dWV2+Cl0=; b=CyUfXqyVyAIfQJ
	bx+ve8UDBBQzxPHWfkDsQecl67GYs9VNHBRvtGgX2v1N4h69Vd4CenqZdcwSBABJ3CCq8JotvBjDC
	Uq2Ok1MmcGImvGjWieMt4eI337DS/zZow2HKbY0niv+Bj5SGC+iRqtsYwE15lcozZqjuI0H0pWgTz
	9XK+n5pnItysGKIDBiLtfIJi9gYBz/NnODSC08LNm/Ju4W3C/KJdG3nLrDjkm1KlOYM1D08e3gW/I
	5NkfVPGA7uauQ8SqnsVtbArmfrH6GTAAppzrLMYOZzW4aixvT1IaLiJI56pVWHgXqKDAuumVvagZf
	8rlrYqDCOnRdWlLtoXgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvoA-0015Wu-27;
	Thu, 12 Oct 2023 13:32:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvo6-0015VS-34
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 13:32:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1012861E4C;
	Thu, 12 Oct 2023 13:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C02BC433C9;
	Thu, 12 Oct 2023 13:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697117572;
	bh=ZZYhdnpgiENRM1+gW/Pd8plnr1hpMAWBo2o0iSfliZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GGOqHIgl+91RccrdW0Y93H+f5sYZ8tcCRAPCTsHHW9bgTNrGYg3T1er9zlL2i8IfF
	 6/NARE2th7RDtUnbbhG1ZR2UvXeLiQDg4uN2arw79A5nGZIIiDz2r/3OrQRft2W1oC
	 nU31cfkA0uqF4i1fYi91JPpE/5MA0DfT+nsS2JJf2d6LneifjHdFajva647tg50uyQ
	 csFDl7evGenFjdYh+JlPxXMtxmOgRiiMhPywHi2AGj8RyN5jzz9u493MjkqrjXhJWO
	 Y9iIUCYKF3+DL5hqoBWekq6jFNMiohkPyt2JpzHOwFjxGrLXI8L6e+H8ksuMpUSOk3
	 gqO6IXUjH1NHw==
Date: Thu, 12 Oct 2023 21:20:41 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/7] Add Huashan Pi board support
Message-ID: <ZSfyqaWsNh3mR26I@xhacker>
References: <IA1PR20MB49531C1C34C3E972DBBA4151BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB49531C1C34C3E972DBBA4151BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_063255_125935_17A70B4E 
X-CRM114-Status: GOOD (  12.92  )
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

On Mon, Oct 09, 2023 at 07:25:14PM +0800, Inochi Amaoto wrote:
> Huashan Pi board is an embedded development platform based on the
> CV1812H chip. Add minimal device tree files for this board.
> Currently, it can boot to a basic shell.
> 
> NOTE: this series is based on the Jisheng's Milk-V Duo patch.
> 
> Link: https://en.sophgo.com/product/introduce/huashan.html
> Link: https://en.sophgo.com/product/introduce/cv181xH.html
> 
> Changed from v1:
> 1. split the patch into several patch and refactor them.
> 
> Inochi Amaoto (7):
>   dt-bindings: interrupt-controller: Add SOPHGO CV1812H plic
>   dt-bindings: timer: Add SOPHGO CV1812H clint
>   dt-bindings: riscv: Add SOPHGO Huashan Pi board compatibles
>   riscv: dts: sophgo: Separate common devices from cv1800b soc
>   riscv: dts: sophgo: cv180x: Add gpio devices
>   riscv: dts: sophgo: add initial CV1812H SoC device tree
>   riscv: dts: sophgo: add Huashan Pi board device tree

For the patch series:
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> 
>  .../sifive,plic-1.0.0.yaml                    |  1 +
>  .../devicetree/bindings/riscv/sophgo.yaml     |  4 +
>  .../bindings/timer/sifive,clint.yaml          |  1 +
>  arch/riscv/boot/dts/sophgo/Makefile           |  1 +
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 95 +------------------
>  .../dts/sophgo/{cv1800b.dtsi => cv180x.dtsi}  | 91 ++++++++++++++----
>  .../boot/dts/sophgo/cv1812h-huashan-pi.dts    | 48 ++++++++++
>  arch/riscv/boot/dts/sophgo/cv1812h.dtsi       | 36 +++++++
>  8 files changed, 165 insertions(+), 112 deletions(-)
>  copy arch/riscv/boot/dts/sophgo/{cv1800b.dtsi => cv180x.dtsi} (58%)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> 
> --
> 2.42.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
