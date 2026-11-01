Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F9E606A334
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BncEUEAx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e7A8Cvgs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CovIwvMD6+3wqN90gmnvgSuOduiBZYsbB+ehG8uMldU=; b=BncEUEAxtVxEgAqvKXxGzPq87/
	jC4If53At0MT73h/EjXAFsWxiSFQuAiWTytK2XfYE1mqgaqnpNpGK+y+8fPUz19HXwILqEZCCSPOZ
	E1Vk5X5vReshJv44leDcG9yw2SVUKmcC6YjAZfbrOx2EK0pEGaHopf51cZCf8f3TC4ueZGGOlEVLJ
	/OcDx+xRawnvPjgCXGgltFAjjB6WGdYQxI+1iNU1Bwo3UjOUfeTc+QkxlbyB45du1xSeUwzl7MtVR
	Edclq7syUuN5nJSLwgPZ8E2qFyk6xVtEBhxfsf1D15IwfoAASdbc6n0xUA3tGajiPOB8XCFRctOIz
	5dPxVO5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdri-0000000F3Rs-3lnt;
	Sun, 01 Nov 2026 22:17:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrC-0000000F1Wq-1N5s
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 980B06060D;
	Sun,  1 Nov 2026 22:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499EC1F00919;
	Sun,  1 Nov 2026 22:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571413;
	bh=R/bKUVygQmmrYTuRm9k4uP1auZgpb0gZfWPM2miQjnw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=e7A8CvgsLR+P85In/cqf5teG1i56/z+xxZn3GQOfofjUdlB2fVQynrtbr2W1/1aqe
	 +4KwOpykFZFbAMOaM2gd0eUFvVGzdZY7aoLUiuVvDUu6K7o5K8USTQ2HqAAFzrsFrr
	 DPtQmC7Yg02AxB2O9kokMig4jAaS+86VYzru+qxDqTWNMOSwJQzaLkdk0YMWA6tKYm
	 ++ViQCAvb7sEJHHdUuce9ru34+IY9z5wFevuJnHNlmu/3GQKuNXnqg1yF8GEE8JRVA
	 MwJYfEpe7fXfDWwyzFoGuRZNcKwUbIW2Xx9lsxy7wL5JanRHWBJckgHxMcV5blV7BQ
	 Y72Cn2H9f5T5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 401C038003B8;
	Sun,  1 Nov 2026 22:16:53 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [RESEND v22 0/3] Add OpenCores PTC PWM support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357141185.2624073.8394896290201314670.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:51 +0000
References: <20260810030714.48100-1-hal.feng@starfivetech.com>
In-Reply-To: <20260810030714.48100-1-hal.feng@starfivetech.com>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, ukleinek@kernel.org,
 p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor@kernel.org, emil.renner.berthing@canonical.com, palmer@dabbelt.com,
 pjw@kernel.org, aou@eecs.berkeley.edu, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
by Conor Dooley <conor.dooley@microchip.com>:

On Mon, 10 Aug 2026 11:07:11 +0800 you wrote:
> Add OpenCores PTC PWM driver which is used in StarFive
> JH7100/JH7110/JHB100 SoC.
> 
> I will maintain this pwm module in place of William.
> 
> Changes since v21:
> - Allow non-zero duty cycles shorter than one clock tick to round down to
>   zero.
> - Drop the .free() callback to preserve the PWM hardware state after
>   pwm_put().
> - Update the comment.
> 
> [...]

Here is the summary with links:
  - [RESEND,v22,1/3] dt-bindings: pwm: opencores: Update compatibles, examples and maintainers
    (no matching commit)
  - [RESEND,v22,2/3] riscv: dts: starfive: Correct pwm nodes
    https://git.kernel.org/riscv/c/2186ec5f59c2
  - [RESEND,v22,3/3] pwm: Add OpenCores PTC PWM driver
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
