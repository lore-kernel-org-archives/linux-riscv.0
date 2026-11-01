Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1C0606DB4E
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YFLmqNCF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FAAdBT7L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t/qQkvoVUG9v0pxMjo5AnOKVux3QqVgQbBCK8wkznNg=; b=YFLmqNCFJieeKkI7TRhCmVZwy2
	qM1mDYjYZryIFYvOtVGxzSxfkh1xAJ+NGAUlwl9sb7E7k4S9Iw9ciBViRmXxFElWP8FzpVVcGfoQI
	Zje8YFVdVUVSjEP45or9669pfc/QiLYmgll7HmLxd9qnKQhhViBP+a2nfHUt9YDefuR1eXV1vbIYZ
	ARJDF1QfU0wPRUHfbN81tshqZ8af1fNAGr4cGtQeffWOrRVx94XbbfGJG0ogOqtE+OBg5vU28/tlj
	eaM50o/HBFSZm8cDbSSOqrn1MRkQkONGxkXgbFDiqxAy72ZoJKCF4rWJgqJVl6w5vFFBaF1PU/4Ki
	yqMrqDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqe-0000000Ezzt-3lXI;
	Sun, 01 Nov 2026 22:16:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqL-0000000EzC3-0ApG
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A8C3243F81;
	Sun,  1 Nov 2026 22:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8696C1F00A1C;
	Sun,  1 Nov 2026 22:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571360;
	bh=HaiWGXBSErIs4k623zp/ao2jxpqugtsdrB7YWP808LA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FAAdBT7LZWiow3HSB73F5Qhg5zJ4bgGnyl5I+sKWixLnuLEnazBGZUb7DEaISTEla
	 qe/iCgNu3IWYoqR8SbhcXtxfwtEdmS1g7OEnNehNWyv1HwaIunuanbKSKU9I2D9804
	 BHEX5zq0gvX9Aecn4T2zogxgL85S9U4X2WFfZlfs9/IgihuioIbqltE86ZToOaByPM
	 obMmIepdSuAjBbB1svcQhSFrU6dJ0xWCWSpw2aWHF21z+Xi43M/wSTWwLMNYpMkGaE
	 hduuGgX4/nKfy4nKPmB8nxGmWLraXzAoYd/KgSDQw51qZ6nF7OQ2QyIE2PTUMOfUXD
	 Cw7cwVyQPSv8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D2E438003B8;
	Sun,  1 Nov 2026 22:16:00 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] riscv: dts: sophgo: Milk-V Duo 256M ethernet
 support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357135904.2624073.18131553531055071528.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:15:59 +0000
References: <20261005093749.645014-1-chenyou910331@gmail.com>
In-Reply-To: <20261005093749.645014-1-chenyou910331@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, chen.wang@linux.dev, inochiama@gmail.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 hfranco@baylibre.com, looong.bin@gmail.com, stavinsky@gmail.com,
 josh.milas@gmail.com, devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to riscv/linux.git (fixes)
by Inochi Amaoto <inochiama@gmail.com>:

On Mon,  5 Oct 2026 17:37:47 +0800 you wrote:
> The Milk-V Duo 256M has no Ethernet connector of its own; the SG2002's
> internal PHY is only usable through the optional USB & Ethernet IO
> board. This series adds an overlay for that board and fixes the name of
> the internal PHY node it exposes.
> 
> Changes in v3:
>  - Rename the PHY node to ethernet-phy@1, as the commit message already
>    said; v2 only changed the unit address (sashiko-bot). dtbs_check now
>    validates the node against ethernet-phy.yaml, with no new warnings.
>  - Drop the blank line in the trailer block of 2/2 (Hiago)
>  - Collect Hiago's Reviewed-by
>  - Keep Inochi's Reviewed-by on 2/2, since the only change is the node
>    name
> 
> [...]

Here is the summary with links:
  - [v3,1/2] riscv: dts: sophgo: add Milk-V Duo 256M ethernet support overlay
    https://git.kernel.org/riscv/c/627e4e43e555
  - [v3,2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
    https://git.kernel.org/riscv/c/673f8e66d5ed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
