Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329DECD4F21
	for <linux-riscv@archiver.kernel.org>; Sat, 16 May 2026 12:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXpmsVbA4G25C7BEyLQ0IAea46DsLtN5t0yxlz+Dmr4=; b=XEj4PTunL/AHi2
	LlZS5D7k6rTavKdiyYPzcq3XtfKXg08rrlAuWNqhddMzhkCKI+AaY3dfDXprDexAv12cPAvAIf79k
	zywm1WMkDxrdZ9zFLMDhrEfwtuFpixO7oi+liumW35oV3PHme9SNGVWIyndhNVAIYQ3ElmU5Z0dzC
	CtO0jmovGBQip+f8IGj6Ze6jZxqbpT2fbLmHmVVFZMUqsRhQstIRn7d3ApfPfIR64sxl2w2VWUHDN
	Rm+vE+9yG5hmhtX2BcvLGfFA36MlvwH8CiuUVAYXZP/wPV9DQthQp4JM/zdQ7k7hIFBNQ6+eJR9TF
	GocAgTbOqWYPCTjNX7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOEbg-0000000AktZ-1cEL;
	Sat, 16 May 2026 12:59:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOEbd-0000000Akt5-1B6N
	for linux-riscv@lists.infradead.org;
	Sat, 16 May 2026 12:59:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0670B442B0;
	Sat, 16 May 2026 12:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E3DC19425;
	Sat, 16 May 2026 12:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778936338;
	bh=auVXU6SCazJsqPBgoZ/g7XMs9Wwj4hhVn8V8pqTAqQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5p+HVJn/aTu56kytW3VJ9sXmWzC1C8w1+ewInqyB19oUvc7Fb/TkgI0oH6WjcdZx
	 DeGtrq4Lpo3wPnO3f8j+Chs1kHWxyARYy1o/nLHSAFpRQwJ+Hc3j7HSmvhUZj0wkj/
	 wc6D3I+RTXYofcMiqnRNODLFBTCdYNljyUF972DfMjo0Hub1clpXBTAXC9uJqVH5xG
	 EX8z8A7e+sw4l0q0u//JTHGd2K9Y1pw2M2Vex0sDaa/6o9xjOzdX49onaiWyxGdgGh
	 CvzNBAEdSuCt6TM1Vr1tFw7GrwDhwa22hnA8DkyyvCd2Y3iAtw1VxNKIrTRNO17bYd
	 ZQQiooy5V5vAA==
Date: Sat, 16 May 2026 12:58:56 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable QSPI for OrangePi RV2
Message-ID: <20260516125856-GKB3675990@kernel.org>
References: <20260516080030.1736836-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260516080030.1736836-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_055901_342040_5103F690 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

Hi Chukun,

On 16:00 Sat 16 May     , Chukun Pan wrote:
> Enable the QSPI controller and the XM25QU128C SPI NOR flash on the
> OrangePi RV2 board. Add a flash partition layout from vendor UBoot.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
LGTM

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
