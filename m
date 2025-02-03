Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFFAC02193
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 21:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6PvMa0jK3h7zsWhuhZjydiqcaBeNAtPoSQNdkvHOXyA=; b=nyedpBXRFYI/1X
	gHvSbHsTY/y5Rhk+FWWTkLodLEniGYoQpzwGD+46qC3kXdZySyXRKAK75/mRQsuLUyQJmjL42mdFV
	WQ3P5gGulAO7+UItZgQwHywzKF6uqR2pH+9kHjyn4tbgohY98dYLvdooNyFzzbQm/AB7yL1sR33+v
	NPxhIiFY0B/eXTBNWJzMBPkH0U+5vHj7XNMgxVIS/j8tZYi0cY9Dn22oYmXW+dJMMQrKKseL3VLH+
	1cmEeJ8QgnRhiIy8H+DwKojqJ1WhZ38As1bm2Pla2A70dLhmhRua4bW5/n8iVyiRcSDL6KP46POZh
	kyTTwbiTjcR0TFy0mbiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf4GO-0000000GiH9-05nF;
	Mon, 03 Feb 2025 21:45:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1uu-0000000GQIA-1Aqp
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 19:15:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D34075C6890;
	Mon,  3 Feb 2025 19:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6269DC4CED2;
	Mon,  3 Feb 2025 19:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610131;
	bh=pPs4zpMkrtQEqUvceHWevri/kDXcPrJTmFBrzvXMfaI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a+Rplytu3bGH4EQVZhqiUvFlGD7cPE3wCuaI8qChQCZGzEmAtxRaI3rgrUEPYo9+X
	 RuTJT72Buv8c1RH6oLjWWU5NEeHzfWylJ7FenrNY0MEBbRAlRXE8MciiHv+JZ+7wnH
	 QbCwbHPHDtgH3nI2flmS5Nyzjk34mMAHBmH7Fnh+uaSbAx4l9YwScFrCYoSmg7UUlg
	 9/mIUEIacWfrSxtic8xUIBQb4kZnH89siL2yVhwOVKSWWUc8oqQ6EP6XyhNCVKMfTn
	 7roImGwYbylNozZVOCu+W6sFcQ09y56j9i9bk8iIyq5cJaqxOKoOY7ZpNpTlVPbJ8j
	 AfN2U1Lb+KvwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE055380AA67;
	Mon,  3 Feb 2025 19:15:59 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v6 0/4] Add Microchip IPC mailbox
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861015850.3409359.6457600401627321039.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:58 +0000
References: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
In-Reply-To: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
To: Valentina Fernandez <Valentina.FernandezAlanis@microchip.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, conor.dooley@microchip.com, conor+dt@kernel.org,
 jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 valentina.fernandezalanis@microchip.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111532_375355_738BFFE6 
X-CRM114-Status: GOOD (  10.24  )
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

This series was applied to riscv/linux.git (fixes)
by Jassi Brar <jassisinghbrar@gmail.com>:

On Tue, 17 Dec 2024 11:31:30 +0000 you wrote:
> Hello all,
> 
> This series adds support for the Microchip Inter-Processor Communication
> (IPC) mailbox driver.
> 
> Microchip's family of RISC-V SoCs typically has one or more clusters
> that can be configured to run in Asymmetric Multi-Processing (AMP) mode.
> 
> [...]

Here is the summary with links:
  - [v6,1/4] riscv: sbi: vendorid_list: Add Microchip Technology to the vendor list
    https://git.kernel.org/riscv/c/c1382852330e
  - [v6,2/4] riscv: export __cpuid_to_hartid_map
    https://git.kernel.org/riscv/c/4783ce32b080
  - [v6,3/4] dt-bindings: mailbox: add binding for Microchip IPC mailbox controller
    https://git.kernel.org/riscv/c/af33bd58c244
  - [v6,4/4] mailbox: add Microchip IPC support
    https://git.kernel.org/riscv/c/e4b1d67e7141

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
