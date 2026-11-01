Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFB860A381F
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r7QCRizY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QJmbn/sE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GbIbHCVuJVe75bBZ4pHIj66vAgFSqrcYu7jt9YPfcxE=; b=r7QCRizYYFYJlFq5JbOO/wgTnS
	hPEiYRRqAei8yTxudAfevBO4wQZ/xZYvKkFGBMWJEGrF4VLF1mCMuvN2GUsRMrm4kp5ekDOfPT11k
	B5TFXa+WrGA9CXjQl2dvQj0CscdgRV9rfZpTr+hWOWkWEvl42jqAmLMI0QmOy89uXh4rKA66aeZat
	Vp0hd/Q4uCcBkucCi1rx+/FmJgLejr8JNPE7D+aA4VRCoPgqrdJJ8+0Cs9Z0/U0/+xI1jqnTwX7eK
	bFK2To8wUTLKRc3CEL330mRPHyCigmxLEyZGtnehi76M2Sd5gAci1/rEBlTaCmgAlhr2/drLZcUFS
	/SqsM4Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqB-0000000EysV-0Okr;
	Sun, 01 Nov 2026 22:15:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqA-0000000EyrN-1ia2
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:15:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E6EF4383D;
	Sun,  1 Nov 2026 22:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E26C1F00919;
	Sun,  1 Nov 2026 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571350;
	bh=mV/fldeY7E4VCzvixzPx4jAvmpdj3h5EpC9ZS84v9Yw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QJmbn/sEiCcLIX9npgNt7/hSGB88aohj1izoIrdEv9d5KcCfEpZJUEFxoCnkwIxoh
	 E4rlmq5jt7WSHWppvhokPkWkW5BnE+HuI72cq8zM25olcDxf7GRXPcosfuLOFfhpk1
	 m/w3RRWX1qaYD2K4rhnKGxp98c6iQm/iIYi54O0uJ3Mst7MuzliBFf/k227iPw9YxS
	 acRWLFWWuBi1afvt4ACSLuWYcWv+UjOxjREz6eH7WvcdunRj0GvgQW6XFHSpUWeMcH
	 h8ExEIrC4uk11tzoopjThtSBg4n/p78268HLeBD35YV52cPlbCq/uMqn+l9wP/Tg6b
	 dNP20WYEcLyLA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0312538003B8;
	Sun,  1 Nov 2026 22:15:50 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] riscv: dts: spacemit: Enable USB and PCIe for K3
 CoM260
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357134854.2624073.4474736187144990416.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:15:48 +0000
References: <20260928231807.1757995-1-jberring@redhat.com>
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
To: Jennifer Berringer <jberring@redhat.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, jmorris@namei.org
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
by Yixun Lan <dlan@kernel.org>:

On Mon, 28 Sep 2026 19:18:03 -0400 you wrote:
> This patchset enables USB 2.0, USB 3.0, PCIe, and rfkill for the K3
> CoM260 Dev Kit board. This board has 4x USB 3.0 Type-A ports and three
> M.2 slots which may be used for two NVMe drives, Wi-Fi, and Bluetooth.
> 
> The USB Type-C DRD port is not enabled here because the necessary
> drivers have not yet been posted.
> 
> [...]

Here is the summary with links:
  - [1/4] riscv: dts: spacemit: k3-com260: keep dldo4 enabled
    https://git.kernel.org/riscv/c/f314c98807c1
  - [2/4] riscv: dts: spacemit: k3-com260-ifx: Add USB nodes
    https://git.kernel.org/riscv/c/bd56cb9b84f7
  - [3/4] riscv: dts: spacemit: k3-com260-ifx: Add PCIe nodes
    (no matching commit)
  - [4/4] riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes
    https://git.kernel.org/riscv/c/dad085951db1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
