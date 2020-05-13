Return-Path: <SRS0=NEFo=63=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41130C2D0FC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 May 2020 12:11:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F7B12176D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 May 2020 12:11:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HN3bADq5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NIpeH8JI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F7B12176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Subject:
	References:In-Reply-To:To:From:Date:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c+lL7Zs+m6ICVK85mT+F30KpKAUiq6RawDRriDx1irE=; b=HN3bADq5M3iFspNwQL0YD4dL4
	HcbLZJJG9atm8QJgUfHOgjU6M+4pQ76xWnIMe/HI+VttwJ8EEYear9RwU9Yk895P+5V1xW/JL9ln3
	xfg8jNVFlmfpVOlbEflR/gdXUfv9Zko4OwSUi6nUGxAA3gAgXm2Sy2MvxXjGWBfgxNvo5jx7bQMhQ
	dnW/5hLMXsYNLcjosCIoCw1qRomIoL6MEDaq7CaQn5JPXzDr5KoZGRVtYOIIp+o3FSer6+4rQNb7T
	Izb/ctXyratb48s2Gaq3/pVBok4V0jgh09IVN1ekV++xmXbOUeNyP6ojNb/eIOZNinmw/0aOHosGu
	ueDJXzohQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYqDz-000535-ID; Wed, 13 May 2020 12:10:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYqDu-00052E-KU
 for linux-riscv@lists.infradead.org; Wed, 13 May 2020 12:10:57 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5DA2A2176D;
 Wed, 13 May 2020 12:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589371853;
 bh=ItqlsvjtJFlnpbgopffGeZnbekcgqwy053JRaa7MfkY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=NIpeH8JINQ83+XQx9u9ruU//bUY+9ccuGn8MDn4Ge5JtUs7gMSahuq9UWWaAGjNaC
 nqWoVT7zmFuV5QFv6xYwkd5bsuu+uk2tDO2Wm2cOJ5kKJRUvXQvYLLbmwM+RImUte2
 8S529gVB5KTREkcygKx584jliyf6ifC7M6GHpctM=
Date: Wed, 13 May 2020 13:10:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20200512204543.22090-1-robh@kernel.org>
References: <20200512204543.22090-1-robh@kernel.org>
Subject: Re: [PATCH 1/5] spi: dt-bindings: sifive: Add missing 2nd register
 region
Message-Id: <158937185132.39109.17103954100758193517.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_051056_573544_7EB5FA56 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 12 May 2020 15:45:39 -0500, Rob Herring wrote:
> The 'reg' description and example have a 2nd register region for memory
> mapped flash, but the schema says there is only 1 region. Fix this.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.8

Thanks!

[1/1] spi: dt-bindings: sifive: Add missing 2nd register region
      commit: b265b5a0ba15b6e00abce9bf162926e84b4323b4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

