Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B2B6071879
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZczKihyB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hq7DLy2T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gYn8zMbVSl6JpFh3LMRMgoVzStjAnirzMW3EDqJqLoY=; b=ZczKihyBCDIUtwzZbQwdcugE/C
	cspEYCIk0C00JI1rmFiUvC42HE0o3lTxwR1tHht5zalND3fYNE8j5U1YUSnYPQdCnXObWTsZ5PgJg
	UcqBMJpoIBWPeT726oW7sKoOj4u6nXk9pPHIYyeI1sD5w+gz83SMKeSBCqRd2492jZu0lb7kGKvHA
	JbcBQ7qZTAgl+QGBO+tE3T8OyCkVr3GvZ65kRvcKXg5LcmcadQK5eCA1fqVJc5+H1KH1+Jcq5juIZ
	N/xXnLdbB3fn/5IwGz+t6ELH6xypqklnj5/QS08XlS0rTeytRuBLVngHqRWC2AJthsfwG7VAEwPBS
	oPVMnOmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdr0-0000000F0ys-2JIv;
	Sun, 01 Nov 2026 22:16:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqk-0000000F0FL-1VB1;
	Sun, 01 Nov 2026 22:16:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6317433B9;
	Sun,  1 Nov 2026 22:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51A31F00A26;
	Sun,  1 Nov 2026 22:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571385;
	bh=gxnzr9CHNsaian4NJ4Y2SZ//tSxSvWjL6cChQq4Rrpg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Hq7DLy2TQoJ0Ctl5IHF974aTyizAE09VgM/lIznCEBIAPBAzCRF6N0R6vMGfDQh88
	 ZzPnuzDoBeE59eORO+BV0CP3mKm6caXiWgsMajU+RMHLYEpNy7F7IvqZtfGtSzb29K
	 OvLauvqUW3TWoZ+1XhQsjBL7O2SJwFzOsE3jOwNF2NV2w3SXAkwTTeblh91ABtpkcm
	 rRZbhpvWSbslYoDRFymzfG2rD+hEI3xAYDyP9byGoARdlKLPfvjqA5rrocNCwSJghT
	 3KtfqLzX2TYvpSyLxOW10IX8GiNIaZkm7iWKzry57L096cm4ZRvK26YWCxg4MWsMK5
	 sEA5Ul+BEotnA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA2C638003B8;
	Sun,  1 Nov 2026 22:16:25 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip: Use named initializers for acpi_device_id
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357138429.2624073.5733369311209292789.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:24 +0000
References: <20261014-acpi-irqchip-v1-1-821917378de3@thegoodpenguin.co.uk>
In-Reply-To: <20261014-acpi-irqchip-v1-1-821917378de3@thegoodpenguin.co.uk>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: linux-riscv@lists.infradead.org, maz@kernel.org, lpieralisi@kernel.org,
 tglx@kernel.org, radu@rendec.net, anup@brainfault.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 rahul@summations.net, samuel.holland@sifive.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
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

This patch was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@kernel.org>:

On Wed, 14 Oct 2026 12:00:43 +0100 you wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
> 
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
> 
> [...]

Here is the summary with links:
  - irqchip: Use named initializers for acpi_device_id
    https://git.kernel.org/riscv/c/5919f587ea37

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
