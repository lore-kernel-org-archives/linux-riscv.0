Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5124C3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 20:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CHepHEQZX9JreYDFvMJXqs6bGBZj4qeF7qXqAx8TkqA=; b=dH4Fb0lOKrUjIm
	yDjbhUxczoohAgnljPhBwTOnBUqAHkGL3heFtseie3xef0hcO5RKT9eHKgWT6wfVfqf7fR5Ti0lr5
	+ncZm8ocLStjqHCICAwijeRTg0HczXNSV72HhdNeCL4Nd9gtdqwXb8+qOaVbyUOsfYaAAntO5dgCu
	VlupUMEBLb/nGzKR8aQBX5hD2mDakAxQ/Ma+KiM7udZu4FIWWRFlKzr8EM0GlP7n1D+ccX0kNsse8
	/w0V59nnNwpHBqppGMTpvfpZE1Zilf+AveT69H7jLOLSDWml9jPoHSEjHqN0fJw9xEcP130Zo2E3p
	yAitiOYGrq7wivhDY2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUI9-00000004nEb-0reZ;
	Fri, 09 May 2025 20:25:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRXp-00000004RKb-2nh2
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 17:29:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 763C0A4CC2F;
	Fri,  9 May 2025 17:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB59C4CEE4;
	Fri,  9 May 2025 17:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746811796;
	bh=qkjoxm3bbJP62+wBHa3WTMwFdpJNYs1tNupsrehi5/4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=m2P1BPXCDIbjZYVWk50NZRZNQWKvevBWYdk4hBZedF120Xv/aG5bKbwKRZuURLNK7
	 a3cwGZ1YIwnVuK/wscgOd/NnvkUaIt4A7vMqEiQOi/IXJkvFPITCYfa9rZRgIwbMqe
	 +zruay/MsLPZ2EEhqXVRv08+871Ex/5chti0jGjU6x/L9JnxHi4x1HxltOPFVqLDw2
	 22gTjrv1UxOVqw1rVYSAhxbTnOVE2y7k07LTIegJ0hzLqlpyMx9HmLuBoaDnfTLB6E
	 /p5cmYXz+2nIGXzgxG/PkSkCKB/BS6/61lw3YMnx5fJDeXsUbv5RRMYd+C1cDopRo5
	 J6hJw4zWW4Y2w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE1BE380DBCB;
	Fri,  9 May 2025 17:30:35 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 00/12] riscv: Add vendor extensions support for SiFive
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174681183450.3697320.4232905271465493663.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 17:30:34 +0000
References: <20250418053239.4351-1-cyan.yang@sifive.com>
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
To: Cyan Yang <cyan.yang@sifive.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 samuel.holland@sifive.com, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_102957_771178_3F6A1FA4 
X-CRM114-Status: UNSURE (   9.95  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 18 Apr 2025 13:32:27 +0800 you wrote:
> This patch set adds four vendor-specific ISA extensions from SiFive:
> "xsfvqmaccdod", "xsfvqmaccqoq", "xsfvfnrclipxfqf", and "xsfvfwmaccqqq".
> 
> Additionally, a new hwprobe key, RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0,
> has been added to query which SiFive vendor extensions are supported on
> the current platform.
> 
> [...]

Here is the summary with links:
  - [01/12] dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension description
    https://git.kernel.org/riscv/c/0f733b5be965
  - [02/12] riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
    https://git.kernel.org/riscv/c/2d147d77ae6e
  - [03/12] riscv: hwprobe: Document SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
    https://git.kernel.org/riscv/c/e8fd215ed0eb
  - [04/12] riscv: hwprobe: Add SiFive vendor extension support and probe for xsfqmaccdod and xsfqmaccqoq
    https://git.kernel.org/riscv/c/1a6274f03534
  - [05/12] dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
    https://git.kernel.org/riscv/c/a5a15e07cbb9
  - [06/12] riscv: Add SiFive xsfvfnrclipxfqf vendor extension
    https://git.kernel.org/riscv/c/e84fffe21b74
  - [07/12] riscv: hwprobe: Document SiFive xsfvfnrclipxfqf vendor extension
    https://git.kernel.org/riscv/c/659d664f7df8
  - [08/12] riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension
    https://git.kernel.org/riscv/c/1d91224394c9
  - [09/12] dt-bindings: riscv: Add xsfvfwmaccqqq ISA extension description
    https://git.kernel.org/riscv/c/d5ca02b25f5d
  - [10/12] riscv: Add SiFive xsfvfwmaccqqq vendor extension
    https://git.kernel.org/riscv/c/34e9b16b4b88
  - [11/12] riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
    https://git.kernel.org/riscv/c/a3ca43dc5271
  - [12/12] riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension
    https://git.kernel.org/riscv/c/d9669e33c8fa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
