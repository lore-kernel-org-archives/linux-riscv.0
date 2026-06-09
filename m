Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F468CD8C92
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 12:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ikpF6doFBA6kXvRdDBkfavJICITvWcS3Rk/+TOZUE3c=; b=qiIzD0xPAnJIrf
	kf4GeHNOpy/koVUtfXpqo3kh5n0xJs1rorao2FmPJHr2/TLEHouX77Z/oFKsBljex0oDNqo9b38gV
	fv46ZhOgl6d8Xy5k9tR7Cky9UplWFFOVVWOw8f9FF4V/vaaR5GR76NVDUl2qLnE/uK02YMXSQYIQq
	lw3yw3kahlf/4Ru4ivR6BOQDZhMy+N7g/+shPCjGqx8C96BX3OEbSNqB/bLdQrOsz6BzejgycmUT6
	NKhfma3j2HJyR3Z2F53Yc8TxPDnG5opabL/H6ILNwfoIB2Y/xwD+OaPsfGclzz7JUIBGr9VbaI3as
	CwXyXZVwvYL4Gc/S/K0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWv85-00000005Txr-3NM9;
	Tue, 09 Jun 2026 12:00:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWv84-00000005Txi-1t9r
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 12:00:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F63A601D6;
	Tue,  9 Jun 2026 12:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121F51F00893;
	Tue,  9 Jun 2026 12:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006423;
	bh=YqAY2yjF1JOeRihI2p1gxnrbLAfEXGmBDITPkBFPHmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m0/wYDh737gkZwT3FN3edFJLbv3a+bjleGY4f+o86IiNjItI4KQvNxC2tr7kOjGBu
	 uBb09XVxLPonpuIzJ1lnq385pQlNjtZ8xcmRh1i96QCR3Ztojm9TMB581a1kscxSrJ
	 nq8babeMmfgcvX0f6ail4xqZMujdIAlFEEK+a7+8WEsTNumg8ZzAlVrVwABK2BWX4U
	 hSQGO/aoCJPF4V8xJ6Z+vRtWgIR3e4hUHJSsY2QRjK+JrnAbPmOTV/FojO77dKBmQR
	 frCSgy5419vTSJhU0wrYvrI2eeV53fT2nvNC8gSIRwu/4AL6qr+X9EzKctBjB8Ptvy
	 i443ymSJEy8rg==
Date: Tue, 9 Jun 2026 14:00:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V SpacemiT Devicetrees for v7.2
Message-ID: <20260609-pompous-imposing-dragon-fc18cb@quoll>
References: <20260602070257-KYC5031219@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260602070257-KYC5031219@kernel.org>
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

On Tue, Jun 02, 2026 at 07:10:07AM +0000, Yixun Lan wrote:
> Hi SoC Maintainers,
> 
>    Please pull SpacemiT's DeviceTree changes for v7.2
> 
> Yixun Lan
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/spacemit-com/linux spacemit-dt-for-7.2-1

Please switch to kernel.org repo. Github is not really a trusted place
and you have kernel.org account, so not sure why Github is still there.

> 
> for you to fetch changes up to 793cc54475b49b5b558902b5c13e4bfe66530a50:
> 
>   riscv: dts: spacemit: enable PMIC on OrangePi R2S (2026-06-01 06:32:42 +0000)
> 
> ----------------------------------------------------------------
> RISC-V SpacemiT DT changes for 7.2

Thanks, applied

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
