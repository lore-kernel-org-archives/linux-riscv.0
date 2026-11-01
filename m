Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3F2606E53C
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cPQfWCnN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lVS0HPuC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7dJJ87lenGmHn/CjnO9Rr7VI+kDoncp2SoxIfQecTzE=; b=cPQfWCnNsu1IuyngEEcK1qI+pf
	dIzjmgE4hla2OIe1wkSlYW0UkrIReCmhUOgMeK8QX2WXunrM3ifrf/RMrKcFKNBfRZpQcnfCiaswL
	pzS/49dcFbACAamd7Sasj1reZ3LA269GptnsEmlEHLg0QLU+EcoO1ZlO1xZyV+QnG5XcB2P0UAE3s
	wEUnJPzHfsDJwebqMhjku7HVK3U9GevG8mup9GgSC3kZu/eof7IUgnHfPDKxiZA33yIXjo8pN+Jz8
	ZNuQfHSdboGO46lgtbv1lHdP989oKPMh2At8D+V59hUxu36rdrPFan8XYuvERpnSEGjZh/GMosxiM
	KgctLXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqn-0000000F0Nq-0kCs;
	Sun, 01 Nov 2026 22:16:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqT-0000000EzWf-3mk2
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A89CD44044;
	Sun,  1 Nov 2026 22:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AE61F0093A;
	Sun,  1 Nov 2026 22:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571369;
	bh=FrrB0roc1oSA1dp/45kSSfoFg28Ifiyl/SVkMu1uAs8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=lVS0HPuChtOSonktA1xifZwoIv4if9F4XQhhuGT/g4YMUcn+hrR2WWlPxIDRD5LAa
	 3Xax/qmzqJ0HxPHRgNhzpCgYKZvNpoE0u1R/Ea8OEJltF8fUoGN5ov9nYh7Gq5VyJI
	 Zq2e5PL+kio75M2BKkIigt77eWzy/TpjITkkdc3N1ImA9Y9rdNFpgRlVVoVcU9hTc6
	 uGg98+0CjOGI1iuhaWBVd9E4WMHR5sDAoJgBue+Vx585LLkSVSpgQxNwB5mTObGYR6
	 GMLWyll+JB8/ygVe6KBDhjjAVCv6HT80dnGvjBnr9Xp+RCL8K0jQap6yRgCQosYn4w
	 tbOpC9WxvqZ+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D33C38003B8;
	Sun,  1 Nov 2026 22:16:09 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/3] Add RISC-V RPMI device power service support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357136804.2624073.16073798637775674384.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:08 +0000
References: <20260903092347.620060-1-joshua.yeong@starfivetech.com>
In-Reply-To: <20260903092347.620060-1-joshua.yeong@starfivetech.com>
To: Joshua Yeong <Joshua.Yeong@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, rahul@summations.net,
 anup@brainfault.org, lftan.linux@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ulfh@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 joshua.yeong@starfivetech.com, linux-pm@vger.kernel.org,
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
by Ulf Hansson <ulfh@kernel.org>:

On Thu,  3 Sep 2026 17:23:44 +0800 you wrote:
> The RISC-V Platform Management Interface (RPMI) specification defines a
> modular and extensible messaging protocol between the supervisor software
> and a platform microcontroller (PuC). Among the service groups it defines
> is the device power service group (service group ID 0x00009), which allows
> the supervisor to enumerate the power domains of platform devices managed
> by the PuC, query their attributes, and get/set their power state.
> 
> [...]

Here is the summary with links:
  - [v3,1/3] dt-bindings: power: Add RPMI device power service
    https://git.kernel.org/riscv/c/53d17430e0ef
  - [v3,2/3] pmdomain: riscv: Add RPMI device power service
    https://git.kernel.org/riscv/c/f94fe707c5b7
  - [v3,3/3] MAINTAINERS: Add RISC-V RPMI device power driver
    https://git.kernel.org/riscv/c/396a18344d12

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
