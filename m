Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8B0C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 15:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=at0lJIw2b6GiuEuMR8d8AdSTp+s5MKuwn0ibpOhcqiQ=; b=iLXwoYuLt9/snn
	0FoDSrGw1mboIwuOAL/kfB3QejYaWa2r/mQIyYZqIsy+0cNu4h6Iehe30HvpDiEsvr8UV2xfSKsnS
	VFRpm5spb1+WTnIoiLP+tdjza1tKmdXqZ3Y1i9zD6rTt+5Dv96JrXVYfD0ovOyGnlLEMo3MrDOUBV
	cUiE8Zsh7TbaRtpgywHZda40oTIgMoV+pO00+11aVwAvbqXYi1WVKF63ekjWEM+UVQsDZlJ0CoBN8
	HxmRNJG02LLYunw7jf8Ti0veTdWGknD76bY33E9QrXTGSIQ4p+GvSLY6VHCv+XUHgRQKgxSCeKIES
	yPxYVPdiH79NPL/x0CWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rChpq-005H4k-2v;
	Mon, 11 Dec 2023 15:04:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rChpj-005Gvu-03
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 15:04:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E1A961295;
	Mon, 11 Dec 2023 15:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A26C433CB;
	Mon, 11 Dec 2023 15:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702307070;
	bh=oEHEZ/BZD3hXy5YrgjxCeoF/SHNeUm8EOWEDSzWiTPw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CzHE3pyszj6WWL+ZhVIdIgiSQij6QaNCh3+YllWQ2kPXJSo8xUW1cNXgsIT1P+8el
	 0FwDa6R+b60xYAnMCGtYzcYOK6GWtwMjRA7hcsqXlM08EO8cXMu+SHVPB7pYk/n0Td
	 W2Vzuui6baPjBs9uGVYV+afhld7R/j8W8MTLcQ9CUvva9CrWp1kLJ3tfcx15FPeIOc
	 hi6+2/7rmZw+xq0y8GK2gVxyJx5gbL1gC8wNEpSG/MVLNq/AnNkQnmXgK/0jlGkgDU
	 otBkLixKURTxZNcC7YNmsZgNTATKvgX3/1CW8dyXS0Gu0CDyMnGDrZ/MD6cqJwxko0
	 xlpuTEnN/B9ng==
From: Vinod Koul <vkoul@kernel.org>
To: green.wan@sifive.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
 paul.walmsley@sifive.com, conor+dt@kernel.org, 
 shravan chippa <shravan.chippa@microchip.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 nagasuresh.relli@microchip.com, praveen.kumar@microchip.com
In-Reply-To: <20231208103856.3732998-1-shravan.chippa@microchip.com>
References: <20231208103856.3732998-1-shravan.chippa@microchip.com>
Subject: Re: (subset) [PATCH v5 0/4] dma: sf-pdma: various sf-pdma updates
 for the mpfs platform
Message-Id: <170230706622.319997.1279433550352049584.b4-ty@kernel.org>
Date: Mon, 11 Dec 2023 20:34:26 +0530
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_070435_146437_975E4B74 
X-CRM114-Status: UNSURE (   4.42  )
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


On Fri, 08 Dec 2023 16:08:52 +0530, shravan chippa wrote:
> Changes from V4 -> V5:
> 
> Modified commit msg
> Replaced the sf_pdma_of_xlate() function with
> of_dma_xlate_by_chan_id()
> 
> Changes from V3 -> V4:
> 
> [...]

Applied, thanks!

[1/4] dmaengine: sf-pdma: Support of_dma_controller_register()
      commit: 8e578b47e6d92d5e43982ddc54045973dd4a7de5
[2/4] dt-bindings: dma: sf-pdma: add new compatible name
      commit: 72b22006ba78c2e3bf39b486a7b8155dc9020133
[3/4] dmaengine: sf-pdma: add mpfs-pdma compatible name
      commit: 58eea79a1cf285a62af886851b1a91ed5aceb401

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
