Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BACD60A5BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 19:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kjDLNgOu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hJPq/ZFh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BaNVNpyv3sMZTKn1PWmGUBVEqBx4DEwEMgXIGrKsxdo=; b=kjDLNgOuP6AZhCcLmjwLx/COLs
	PIcZSkDcBKa1mCqDj3v01PzIYtdduV0GGngMbNm5qq6mkroEH0B8flieRJlyYmA0U91HAfP2APcTK
	1ud6t0EKTg8Rl9viXVv4UZr6/1HgdW8oKqTlFD8GhG4p1YPjj7M3QCMb4KBXupbeb2EqgrK2IFJLx
	Zer7337Lo/XQhZbDB8Ny88Jy8mdgpOAeMDSy+kDq672yLYtBg5scpccFbiIi2jZ8Wuv0z8BAHJDRb
	iDKeAjtzBnKu62+WFcAET9NcKfMB569D2CFM/myomorQP6YmZNA72Wq1nfH8+PXPAQOL1Ytqj/Mjg
	Bokb6pRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBC-00000007XTb-3hR1;
	Wed, 11 Nov 2026 19:40:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREBB-00000007XTV-1guH
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 19:40:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C6E474325C;
	Wed, 11 Nov 2026 19:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63E01F00A05;
	Wed, 11 Nov 2026 19:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426020;
	bh=6HWQUpM3PjW8+BhL116w3GjQjvGNhoMy2Dx/tVTVrDk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=hJPq/ZFhM5A2mQhaliriYcks2OFyKkFI3KDY17+DL4ys/X3o6mEx8JuSxcsg8g/VB
	 FxnoAIUWchI9BGiaChl89VpQTW/NXpTOxkUIwu4LSZ/THK46BTxbjDfwSVVnrpMDYR
	 rGzLqMS2jgjJWzGfU48dbeSp/O1CgXkzNHOGaxX9Uv6g7QYnyq7q6W5siHEBzOoPiw
	 /XliB9j5i+3fTwujeLL8CLlfXZ3EOUEHB2kBVCIdTpVszdz1Qg6HY7KMot3UO/lCzS
	 tDOTI8iuTL2eZwHpTCmdZlKPxx7CLfkfH/DeknfbR1d/GiQRJzi/+wIZeGdLyUTo5B
	 U4Io/xBcrKAFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9B26838003BF;
	Wed, 11 Nov 2026 19:40:20 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/2] Bluetooth for the RTL8852BS on BPI-F3
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <179442601916.1604530.1705197925952408060.git-patchwork-notify@kernel.org>
Date: Wed, 11 Nov 2026 19:40:19 +0000
References: <20261111094557.443481-1-frederic.mahe@cirad.fr>
In-Reply-To: <20261111094557.443481-1-frederic.mahe@cirad.fr>
To: =?utf-8?b?RnLDqWTDqXJpYyBNYWjDqSA8ZnJlZGVyaWMubWFoZUBjaXJhZC5mcj4=?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@kernel.org, anarsoul@gmail.com,
 alistair@alistair23.me, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, troy.mitchell@linux.spacemit.com,
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
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

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Wed, 11 Nov 2026 10:45:55 +0100 you wrote:
> The BPI-F3 (SpacemiT K1) carries an RTL8852BS Wi-Fi + Bluetooth module.
> Wi-Fi (SDIO) has no upstream driver, but Bluetooth on UART works with
> the existing hci_h5/btrtl code and linux-firmware's rtl8852bs files.
> 
> Patch 1 documents the compatible, with rtl8822cs-bt as fallback, so no
> driver change is needed. Patch 2 enables it on the BPI-F3.
> 
> [...]

Here is the summary with links:
  - [v2,1/2] dt-bindings: net: bluetooth: realtek: Add RTL8852BS
    https://git.kernel.org/bluetooth/bluetooth-next/c/c21f8cff7503
  - [v2,2/2] riscv: dts: spacemit: enable Bluetooth on BPI-F3
    https://git.kernel.org/bluetooth/bluetooth-next/c/df348a0d065c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
