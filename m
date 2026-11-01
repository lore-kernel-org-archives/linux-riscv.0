Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A006075743
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SSQ4BBNy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HQucWQ4l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qVLvQyS3qSqKODTso8ZElGmf7srI1/kt7mGBflzfwsI=; b=SSQ4BBNyBo+fkAGMEU4eFEZbEm
	7FGNsXGRbln6GjOCo7f6Uyxya8pNuY13qwkcG9LzJULNXLtjJd9721gHOUWV558kSvNVPytu4qL4A
	Co2KmgsqxGCt3F5zHCywB+eMj9i3pWK/pqJMEoCybJp9pfW5So/F7Q4lYHVsw9xZURCI+R+rnABOa
	BonsNHLEBEMOQyJS7RdFaRseAa1YFCN4D/UoEL409uoW41Tui2LflB7fMRb9G13TGZFTJrOPtT5CO
	kAo+PFdVfe2kXSgroQvBogE26wBJD4yKCV4UlKMhvsAsgSDrQeVGbLDsoXysZ6cDvQl2Es3HEZy8V
	lchvH3Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrI-0000000F1vz-3pM9;
	Sun, 01 Nov 2026 22:17:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqv-0000000F0jw-2g8a
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E222A41F9A;
	Sun,  1 Nov 2026 22:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C27321F000C1;
	Sun,  1 Nov 2026 22:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571396;
	bh=4/be1ZrHaJFMLso5b5pIRzsIB4FCGWBb23W7/vuRdXI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=HQucWQ4ltkOJetKmKDw0fBX4T/NcSVy2UOVZe7RE1BwoXyWPf4E+/+gI+fAAt/JJ8
	 XvnAvlkVpHmaZwe2CkSSxrjlpxUMcvBv82b05B78RIRAqfrqqyr9ppNrPQ/3LQXQ3p
	 65OBUP/u9uuvV7XCxzRlSspAaNxGpU0Q0sHJ735yBY4yibdr1EqLZBrkPMGiiT4tgL
	 SxFqb33KkpO0owBrNtnC9lQHkQN3H4JPArw5MdGK09LdsxcosEr3bUHemz2nulD/43
	 jdW4qdmRNg1G1OIpVGTw1S0sfdK80uKuz5GLwlTQJ7dSi4uTaPjf58zu8xJVzFs5Lw
	 Z8SscnFcSUaiw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA42C38003B8;
	Sun,  1 Nov 2026 22:16:36 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: set ETH MAC from eeprom for
 OrangePi
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357139529.2624073.3641099794462777978.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:35 +0000
References: <20261006100000.548264-1-amadeus@jmu.edu.cn>
In-Reply-To: <20261006100000.548264-1-amadeus@jmu.edu.cn>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-riscv@lists.infradead.org, dlan@kernel.org, robh@kernel.org,
 pjw@kernel.org, aou@eecs.berkeley.edu, alex@ghiti.fr, palmer@dabbelt.com,
 conor+dt@kernel.org, krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to riscv/linux.git (fixes)
by Yixun Lan <dlan@kernel.org>:

On Tue,  6 Oct 2026 18:00:00 +0800 you wrote:
> The EEPROM on the OrangePi R2S and RV2 stores the MAC address.
> Assign it to Ethernet, with ethernet1 having a MAC offset of 1.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
> Changes in v2:
>   Remove Ethernet alias changes.
> 
> [...]

Here is the summary with links:
  - [v2,1/1] riscv: dts: spacemit: set ETH MAC from eeprom for OrangePi
    https://git.kernel.org/riscv/c/d05c62364960

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
