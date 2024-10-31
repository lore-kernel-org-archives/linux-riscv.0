Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8444E68955
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 11:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUneqoQ750vSjNudCbkeRUijwfEGA6gvUQr3InspOqw=; b=Xjw4rZVITeGBRm
	r2NtyGz0vJ+fbM/OLdE1JTlbTGKNHqnGJnA4PoZx64DUkcMUjvolHhxAp674jkDSTtXv37yLLJ2il
	qDfBgbNP5QLFl9ngoiVDj2jusv7LecC8tqHM+CLVV659t/6WXmf3tb+xBZjr8kUGKd+AXfLeaa+uW
	r4K24s5b6oQFHFHeCzwJE21rJm+Cny72TjKEluOrxmhXxvmvX5gdvui3UeBIXpDP9A1vYhsmRwiFk
	Yh/fiB0YZVddEMj7PupNc47EKVA/C/h7zhM5ypQq6MO+ZYyh47JKk3WweUD0WXYrwg/mIeK9yF8jH
	CWRmsFKi3weCQNadDFtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TaE-00000003Qaw-11DF;
	Thu, 31 Oct 2024 11:43:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TaB-00000003QZn-26cL
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 11:43:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99C98A440FF;
	Thu, 31 Oct 2024 11:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC339C4CED0;
	Thu, 31 Oct 2024 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730374998;
	bh=RMovIEGpTKgmSrH7hPWEOJRKPhKfHSl2HvWl/56Ae0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M93cdLz9+3NrhL8an7HQzBtA/qjMAzQQL1afNnMbp5qfNcNSVUoXORGdc+pBn4xUB
	 oZHm+NL3IxgpKoIAArQuuwJ3TnolMQT+qmn+RRMnaGHxwyC+UH4QBolVXFn3uqWG64
	 lGnt3TM5I+LKYubbu1cZgGv1/ensI+bERysq7BPDXk61ZOApR3x6eEehOTec+KlU+u
	 Fg18mhY6MbgoBdLspraoW9aP6usXWQpK4rV80rFeCTTJ2nhZ527it1uHiiT24B+JB7
	 C/a+rCMxyXZkRXsZfCiw5ofuHtykRICzgVpPM5NKpopFDk1PniRqinJ/w0hLU98YbB
	 Ix7QvJ1NTYuFQ==
Date: Thu, 31 Oct 2024 12:43:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/2] riscv: spacemit: add i2c support to K1 SoC
Message-ID: <stpzkggfwseaqy6kbppiog4xfbpq4r2jwix2nvredbmmjqzbsi@wkllt4jlingv>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241028053220.346283-1-TroyMitchell988@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_044319_625533_F194FD72 
X-CRM114-Status: GOOD (  14.22  )
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

Hi Tony,

On Mon, Oct 28, 2024 at 01:32:18PM +0800, Troy Mitchell wrote:
> Hi all,
> 
> This patch implements I2C driver for the SpacemiT K1 SoC,
> providing basic support for I2C read/write communication which
> compatible with standard I2C bus specifications.
> 
> In this version, the driver defaults to use fast-speed-mode and
> interrupts for transmission, and does not support DMA, high-speed mode, or FIFO.
> 
> The docs of I2C can be found here, in chapter 16.1 I2C [1]
> 
> Link: https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#part5 [1]
> 
> Troy Mitchell (2):
>   dt-bindings: i2c: spacemit: add support for K1 SoC
>   i2c: spacemit: add support for SpacemiT K1 SoC

As Krzysztof has asked, please do provide the changelog, it's
important to track the progress of your series.

Thanks,
Andi

>  .../bindings/i2c/spacemit,k1-i2c.yaml         |  51 ++
>  drivers/i2c/busses/Kconfig                    |  18 +
>  drivers/i2c/busses/Makefile                   |   1 +
>  drivers/i2c/busses/i2c-k1.c                   | 658 ++++++++++++++++++
>  4 files changed, 728 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>  create mode 100644 drivers/i2c/busses/i2c-k1.c
> 
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
