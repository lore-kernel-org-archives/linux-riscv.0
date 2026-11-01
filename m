Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A5E606DB4D
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4atqCOv1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cK0nCkLM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zbBsGDl8KDdUzKZzt/llYOIfobIFoxMIdsie/FgS8S0=; b=4atqCOv1BZbM7qcdItlr/eudkJ
	JgU+9GQtadWOC9009C3nswTpzIxmnVUiakqiuHtQIRUcgyMqauM8qfzd0KXY5FPeccqAAFA5nD0NC
	bWPFTb07dydZ5kXjavcMCCijynRmR1NEMkvgWJAjVvoVeYKLeTsVMwNU1TaAgROELeQsHWIR0kv1x
	aAkvrc6Elp/savXuC53PYryjNTP7RLGMhrLrv/tqPz71V8TDkKEZFtI3GDJFqgg57a5pq+nYf8lhk
	DLVH4wh2wpHiZEZq37JekmILdnychKIlKbPgN68iMwFB/jV1lS0spQZR4MgR3H4nbiUimOA9HQlht
	PFtkmBEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqe-0000000EzyP-1BJG;
	Sun, 01 Nov 2026 22:16:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqJ-0000000Ez8U-2KP6
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 30EB4418F1;
	Sun,  1 Nov 2026 22:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF6B1F000C1;
	Sun,  1 Nov 2026 22:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571359;
	bh=vCDTgXmNdZpXo/0XlosOEnTra+3QhReNszYgcwXHnsI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cK0nCkLMsfGPqd+i7ERdVzoSOgNLU7IQkd5eoySBGe8A5to+Hp8KyJpVnD1akztH7
	 w43njKBPU/Q4mVVCU8yqwe52m1EaP0EOhTJsWw6FNX1tDifbzMJAwfjITY52iY4mNb
	 Znj4iOlBjyq3OSfgRRFxB9a5BLWg1WV/5/0Y9kq8XisCQhlo5nluQa0xUC2zJch1Kn
	 Qkf7dkNTp8ffTwCFjIfl1lbCgDDafX2QSekT3rvIkeJr8mCdHB2vBEVLXwvezWFZ5R
	 EBmO8Bjp9c32zUjTXm0wQZ2AZDZ2WiG5m4C6ySvoVQlMxCJOE4fv7giCAGffuE2CpT
	 XxWYnQ1IfDeJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0325138003B8;
	Sun,  1 Nov 2026 22:15:59 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/6] hwmon: (lm63) Add Sensylink CTF2301 support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357135755.2624073.2853911342168711547.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:15:57 +0000
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
In-Reply-To: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux@roeck-us.net, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 spacemit@lists.linux.dev, linux-doc@vger.kernel.org,
 krzysztof.kozlowski@oss.qualcomm.com, jdelvare@suse.de
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

On Mon, 14 Sep 2026 16:03:52 +0800 you wrote:
> Sensylink CTF2301 is a system-level thermal management solution chip.
> 
> The CTF2301 is an I2C/SMBus compatible device featuring:
>   - One local temperature sensor with +/-0.5 degree C accuracy and
>     0.0625 degree C resolution.
>   - One remote temperature sensor for external diode-connected
>     transistors, offering +/-1 degree C accuracy and 0.125 degree C
>     resolution (temperature range: -40 degree C to +125 degree C).
>   - An integrated PWM fan controller capable of operating in two modes:
>       1. Direct-DCY: Open-loop direct duty cycle control.
>       2. Auto-Temp: Closed-loop automatic fan speed control based on
>          measured temperature.
>   - A 1-channel fan speed monitor (TACH input) for RPM measurement.
> 
> [...]

Here is the summary with links:
  - [v5,1/6] dt-bindings: vendor-prefixes: Add Sensylink
    (no matching commit)
  - [v5,2/6] dt-bindings: hwmon: Move LM63 family to a dedicated binding
    (no matching commit)
  - [v5,3/6] dt-bindings: hwmon: Add Sensylink CTF2301
    (no matching commit)
  - [v5,4/6] hwmon: (lm63) Add Sensylink CTF2301 support
    https://git.kernel.org/riscv/c/d7f7e577c837
  - [v5,5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
    https://git.kernel.org/riscv/c/97bd8165a3f7
  - [v5,6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
    https://git.kernel.org/riscv/c/ad17d98848df

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
