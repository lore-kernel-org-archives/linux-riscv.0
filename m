Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B35C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 01:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6xb9EcHcGzgd0ohQ6ZL5drt784IQS41K4LfQHLeQpCs=; b=lexzihgcDHQorT
	HLnC65S/PhjhWFrvp984vFzTn/W9jLLX5BIrKL6HGtzKrV3DdkGGdFDlyBf1M/+8xkr2Wxhauj9E2
	0C/n3McEBEHAhi1YOF9PdCt7/wMcdeS14C8zTQIgHQLVW4E0YddeSDn3Zs3K9nGusLbtZjfH6/Mbh
	7L1gpBA1KuXXZuL7AxaXJP1Hp7aTsZlcdpY5/rfkPg40HsSmYy2dbNcWwHg1f9yS9YxCYO/k4Gkp/
	8lP+IS1qCPVHzTeRfH/ap36lmSQ3sLL3BOJQh/nDYdivTVLK9dcXv2UGBFBA8gcuhwpKBSHwCjzR9
	v+z/qdse35CI3mt6H9vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQHKx-001KOZ-0Q;
	Thu, 18 Jan 2024 01:36:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQHKt-001KNr-1X
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jan 2024 01:36:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F266617B2;
	Thu, 18 Jan 2024 01:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5C5C433C7;
	Thu, 18 Jan 2024 01:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705541777;
	bh=dqmuqll1E/XB+FTIA41WLVNPWxX4UcULZbNBRCEeHms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JMPbQ4QBvedDBnOLYxCVQzJ1uTA8pqMKc1YYjsan+ZqHDrA6wqsOQRJERzOgwpxZK
	 HAqBa/ALWwsudxy1027KtBP9bRDl+jCqEyzQjkcpV6390+adnHyQFHoMPNW6IxXJtW
	 o2qwoVGMxYmeXkGqdFQVowhw9CHyLaA8FYy5Qeo5aJWBbEnfrS/YLqLIoOnkHal5sm
	 D90KmV+52N4L/3xrejKC2gDZR6WnZqixOdKQGZbdU5CO1QUIN7FNDXufpW6H/16LN2
	 cM9E/SdtYFnJBBx57Tedkx8boi1Dr6SX52WF7v56JhlXuYqAHb1IxmbEk+khyJzCP8
	 AT1zzzoTTR2dA==
Date: Thu, 18 Jan 2024 09:23:24 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/2] riscv: sophgo: add pinctrl support for cv1800b
Message-ID: <Zah9jO4Y/+MnFr/c@xhacker>
References: <20231113005702.2467-1-jszhang@kernel.org>
 <MA0P287MB28221065B41ABE67768B98DEFE722@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB28221065B41ABE67768B98DEFE722@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_173652_118837_27174362 
X-CRM114-Status: GOOD (  12.22  )
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

On Wed, Jan 17, 2024 at 05:03:20PM +0800, Chen Wang wrote:
> 
> On 2023/11/13 8:57, Jisheng Zhang wrote:
> > This series adds pinctrl support for cv1800b reusing the
> > pinctrl-single driver.
> > 
> > Jisheng Zhang (2):
> >    riscv: dts: cv1800b: add pinctrl node for cv1800b
> >    riscv: dts: sophgo: set pinctrl for uart0
> > 
> >   arch/riscv/boot/dts/sophgo/cv-pinctrl.h       | 19 +++++++++++++++++++
> >   .../boot/dts/sophgo/cv1800b-milkv-duo.dts     | 11 +++++++++++
> >   arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 10 ++++++++++
> >   3 files changed, 40 insertions(+)
> >   create mode 100644 arch/riscv/boot/dts/sophgo/cv-pinctrl.h
> 
> One question, when we use "pinctrl-single" driver, should we enable
> CONFIG_PINCTRL_SINGLE? Or just leave it to package vendor to configure by

It's better to enable PINCTRL_SINGLE in defconfig. However, per recently
pin related xls from milkv github repo, pinctrl-single isn't suitable.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
