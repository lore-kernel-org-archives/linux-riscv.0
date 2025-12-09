Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C46D3B7EA
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Dec 2025 10:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/W372T4tfWT/3gRbaVy5KjH6vlceI0bZnh4YvMFqKw=; b=wfYsLkknODRJRF
	zbmk4JzQyM/YhHo9OIrUui/tgItvFEX5ZVlOGDXDOBoBjB4Oj6oVKnbSArigbmAK9GK1plAvGiycW
	fy821UBaku0fbq/c8/7i/gMA4EZ9gU9na7BGlXVKpdFLokGLl/vZ58tdvPSIXmSA0lH+3dC+ED5Fd
	CvOjJNw6xs5llKe21zpldhJhVyZ2493bgTTbeFDhNIZQCkcJbjVH85mGNghTDFJ0KRq/OvAbe32bc
	GktxlVWEuQLaJHBfV1gYdtljewl2Wqfh4GJmhEiB7muJat9EFfn+wxNbSrIDxw18suZ55sMtoWOKG
	djE97t9qEBBHVyagK9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSur5-0000000E6Hy-0HHX;
	Tue, 09 Dec 2025 10:22:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSur2-0000000E6Hd-3cxZ
	for linux-riscv@lists.infradead.org;
	Tue, 09 Dec 2025 10:22:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF2E342AE5;
	Tue,  9 Dec 2025 10:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9C3C4CEF5;
	Tue,  9 Dec 2025 10:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765275719;
	bh=JgYIw3ICBrpjk2agf17x1ioIPfJ402eUxH3SB5S+2xY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WbGKERRNRYy6gW6/W/bFlLsP98T+EQnkqyCCqYlyww81Nmak/e/s+N6QS69RW5Hsy
	 /2RI3XCmMnRCfyL/LcFr8+Z3W85G2ZaOB5LBYcYuDRTQn/gCJNmFIiDpajoU+9O8c+
	 vpYs76S0VU1Ldu5qfwQ2+LTK6eFmolkLLpFTfbBokamUWrcy2g1iap/OKqajHGmBex
	 wQOfGG21Qr0b5qceYqFvuOLCMw5h5sAQrwkA6AZkbBqeGyrC8MmCZRPh3hD/5ElLFS
	 vu0UuYBmhXy+MvmHACkmcOnglPb+Z8KorQlA5NY/YPuftsLoBjHh6vu8NYaIOzdult
	 2UdOXsqsJUh1w==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Alex Elder <elder@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev
In-Reply-To: <20251206133852.1739475-1-javierm@redhat.com>
References: <20251206133852.1739475-1-javierm@redhat.com>
Subject: Re: [PATCH] regulator: spacemit: Align input supply name with the
 DT binding
Message-Id: <176527571370.622933.17720204195171811423.b4-ty@kernel.org>
Date: Tue, 09 Dec 2025 19:21:53 +0900
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-47773
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_022200_928331_0001D804 
X-CRM114-Status: GOOD (  11.12  )
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

On Sat, 06 Dec 2025 14:38:48 +0100, Javier Martinez Canillas wrote:
> The Device Tree binding schema for the SpacemiT P1 PMIC defines the main
> input supply property as "vin-supply", but the driver defines the supply
> name for BUCK and ALDO regulators as "vcc".
> 
> This causes the regulator core to lookup for a non-existent "vcc-supply".
> Rename the supply from "vcc" to "vin", to match the DT binding and ensure
> that the regulators input supplies are correctly resolved.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: spacemit: Align input supply name with the DT binding
      commit: 99f0c3a654c4a762aca4fadc8d9f8636b36d570a

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


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
