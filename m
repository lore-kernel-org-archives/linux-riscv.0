Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942BDC71130
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 19:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4sL0/FtwCZZTg6+0SYzVTg78D3G+FANm50YThKYLX0k=; b=laLyYf5d183JYU
	URpUqihRC+wQpgvuTVfxfFPdsfMdd0qvQ9toCtrDf6KctntzMalQl9Kmc5po0ZwGqzmxAJp2/v90w
	ZrMCHvG4zSopyaCXN9WGhEn7hakU68iRMrKhEOReLLy+yZ5es5WGZFJdRg+PW3g1FY0T13pp7NF/D
	bfVdozLyDKQ9wyQ2CPoOtmzoyih2xTa+y0IZCxLnD0gjfqfpJqvCCkfKzhWN/kel8USwrrScwCCy1
	d+yuIQhLsAn7QCBXW/H+VP7pflxS5125Fgp4PYvyliNA+j3zbYJ8uB8I0CBBUg6qjBXwzmmLzM5Zj
	fGs38Fdzzs6THUC18khg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP57I-00000007z1v-15K1;
	Tue, 10 Jun 2025 19:58:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1pR-00000007T3J-2CPJ
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 16:28:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D67A9A5149A;
	Tue, 10 Jun 2025 16:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE0DC4CEF0;
	Tue, 10 Jun 2025 16:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572880;
	bh=UQg01saWHZ2SA/EHnfOE/P97kB6OOfXIeFxq0POFGoI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MAhxn2YI78qtGczPWBE83PlISURuIeOL+05W5FjQubzGvSi7EoCrhaQlwPloGgdbt
	 m3KQqdhdZSPuMtJCkDrurouHSKc7fMYa7USoDs9rauIAVc2uignIg/8Sy4NlDhfGUL
	 2ZzDxcXkt6DyW1Xswug8nfZIvyBR7fHBXbB/qj2Q+BTF+MxAdHQhNP7RlMkx5LiytS
	 0l7bPsWJ6V911h0DIdyU6is3Rbv0e5J2y5zKehEDF/xbPd4d4KuIn43rtPPChcq/80
	 O+WjTPhXswU5qYgeGIXQlX75e30BPG+ZBLM9h1aomo0GZSIHELeufuw+BEpU84uYoU
	 HdoxaRU30SbfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C4339D6540;
	Tue, 10 Jun 2025 16:28:32 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 00/12] riscv: Add vendor extensions support for SiFive
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174957291100.2454024.4751197828124838504.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 16:28:31 +0000
References: <20250516030310.16950-1-cyan.yang@sifive.com>
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
To: Cyan Yang <cyan.yang@sifive.com>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 samuel.holland@sifive.com, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_092801_629672_E4B0D242 
X-CRM114-Status: UNSURE (   9.75  )
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

This series was applied to riscv/linux.git (fixes)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Fri, 16 May 2025 11:02:58 +0800 you wrote:
> This patch set adds four vendor-specific ISA extensions from SiFive:
> "xsfvqmaccdod", "xsfvqmaccqoq", "xsfvfnrclipxfqf", and "xsfvfwmaccqqq".
> 
> Additionally, a new hwprobe key, RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0,
> has been added to query which SiFive vendor extensions are supported on
> the current platform.
> 
> [...]

Here is the summary with links:
  - [v2,01/12] dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension description
    https://git.kernel.org/riscv/c/0f733b5be965
  - [v2,02/12] riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
    (no matching commit)
  - [v2,03/12] riscv: hwprobe: Document SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
    https://git.kernel.org/riscv/c/e8fd215ed0eb
  - [v2,04/12] riscv: hwprobe: Add SiFive vendor extension support and probe for xsfqmaccdod and xsfqmaccqoq
    https://git.kernel.org/riscv/c/1a6274f03534
  - [v2,05/12] dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
    https://git.kernel.org/riscv/c/a5a15e07cbb9
  - [v2,06/12] riscv: Add SiFive xsfvfnrclipxfqf vendor extension
    (no matching commit)
  - [v2,07/12] riscv: hwprobe: Document SiFive xsfvfnrclipxfqf vendor extension
    https://git.kernel.org/riscv/c/659d664f7df8
  - [v2,08/12] riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension
    https://git.kernel.org/riscv/c/1d91224394c9
  - [v2,09/12] dt-bindings: riscv: Add xsfvfwmaccqqq ISA extension description
    https://git.kernel.org/riscv/c/d5ca02b25f5d
  - [v2,10/12] riscv: Add SiFive xsfvfwmaccqqq vendor extension
    (no matching commit)
  - [v2,11/12] riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
    https://git.kernel.org/riscv/c/a3ca43dc5271
  - [v2,12/12] riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension
    https://git.kernel.org/riscv/c/d9669e33c8fa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
