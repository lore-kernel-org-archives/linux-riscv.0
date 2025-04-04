Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4A3C36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 20:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VeBxa0m/dyqvj5HSTJjFEsQ5djsTedoX2nMkCICP5qw=; b=RBnMKZazMZcJKR
	MAHGQ/xV7dGE8UtW4/KN0GNdjjRQVUVl8nOer7F1MuRQ8WcZ//i/4Z/7CrJl7gxdB70/J0tTItRE0
	rWx5fhn7olCPmd6f6CCkuRAdKPIsMnWhMVUVa8x0sFAn4ls189PBZKuGKObRuhWLHvKci1atoyJXU
	p3zOJs4gaDA/jmQNu8Nctg/7SvbPrfjMvKb+2I3CEi298PqikvmUYBTb4wa49Cr5rQKgklkOrfFvy
	DDR5ZXv/BD29i8anGU6zAI9T6BhMym+7hUpYht8Gzv6G+XkW/OEdXxAlYdkeyOyNOqchCFRjuSC2j
	ZtVdlCVY+7aEkq03AlfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nqf-0000000CoPU-2XEp;
	Fri, 04 Apr 2025 20:41:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0nqc-0000000CoOS-49XM
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 20:41:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E9E1EA47A7A;
	Fri,  4 Apr 2025 20:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2BBC4CEEA;
	Fri,  4 Apr 2025 20:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743799265;
	bh=KwI9SWDH6Mf2uYcqQRnlcOfauFdXKQ8QN83mzWhe3Qo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=s31J6os7RRJRMW4wsy19QVLOAAxcwc1HDVpjnZQYK+rE7YraCkWnWxCwz3JDp0l0H
	 RGVaklLEytF1No+Zsutvkm4WcsQaAUZ3O8MAt1KCCCwl8/Vt6jMh7btQxyancy/VjH
	 sJHxo8KD8qeF+eK4HALqAjB5XR+y873CYfVM/CYKTWK272T/tgqOaBNRkqZjD/rumD
	 om5lS1V8dfzyOVWyBki2S1YmX/aoMVU53dXuBkXveinYWgbusVuWqiZ0nausS1pZnE
	 QVxhHEtfJeN0txPbhBrkuBs+D73MkL43anF/reDPbBNk6ltk+NaBa2f/acOsZEXeP0
	 ZrAxhcWx6Hqhg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD0C3822D19;
	Fri,  4 Apr 2025 20:41:43 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] dt-bindings: timer: Add SiFive CLINT2
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174379930251.3383526.17363830947494293444.git-patchwork-notify@kernel.org>
Date: Fri, 04 Apr 2025 20:41:42 +0000
References: <20250321083507.25298-1-nick.hu@sifive.com>
In-Reply-To: <20250321083507.25298-1-nick.hu@sifive.com>
To: Nick Hu <nick.hu@sifive.com>
Cc: linux-riscv@lists.infradead.org, daniel.lezcano@linaro.org,
 tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, samuel.holland@sifive.com, palmer@dabbelt.com,
 anup@brainfault.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_134107_090513_740E201C 
X-CRM114-Status: UNSURE (   6.87  )
X-CRM114-Notice: Please train this message.
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Daniel Lezcano <daniel.lezcano@linaro.org>:

On Fri, 21 Mar 2025 16:35:06 +0800 you wrote:
> Add compatible string and property for the SiFive CLINT v2. The SiFive
> CLINT v2 is incompatible with the SiFive CLINT v0 due to differences
> in their control methods.
> 
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> 
> [...]

Here is the summary with links:
  - [v3] dt-bindings: timer: Add SiFive CLINT2
    https://git.kernel.org/riscv/c/0f920690a82c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
