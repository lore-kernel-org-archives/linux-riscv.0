Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25329C3601A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0tHcdbb8KJHMQQLUBd/pwyjU1J3hgxbr/+N06Ll9dc=; b=TT2V3cX3meJ005
	rczw/L+VHZPVGA/dIP7ADykigXT5D9HvIc0mI3nA/riC6QWMMWB4htUxYOfM1sfK3cAXWg1OlD9ab
	NH6AnA4c8psx8HRP+YtjXW+pR0CjYc6CptKVmpfoNsAFVEmY7g0Yn9uOqJ5p3ZOxCR/aJhAisRc3o
	Q32jcXQYnVDADpAO2lUcyI85q+OfjQxXz/LrPXUdO3AQXQxJzj5ezd7bonToKCzQvTN0RRBzqRP5O
	gv8roJ5kyWaGtXQumbi88bNa5NJRFj3KpNG4Zrd8tOL7zi00UMt14ZTqHU0RaRpXBQ8TmAmfqNm4+
	Gw0Te0EWFijkBSXqJ4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NIN-00000009LA7-2Vu4;
	Thu, 03 Apr 2025 16:19:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0NIL-00000009L9z-3rrh
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 16:19:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BF9361364;
	Thu,  3 Apr 2025 16:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCBADC4CEE3;
	Thu,  3 Apr 2025 16:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743697196;
	bh=CaqBqUereHqZXhHwwqd9yvDXNCjIzmhZi6Y/BlkYcLA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=E8ML1qZZkz7sYG9w06ltotzKs7rn/Y3wwWhnJKwhTYaAVMAQaOBYlCxNNQLHmeUo3
	 ChlnLA2zT30/HAuhaquUDw+YLK3EE9K85Xu3FtXPGPdAyHEDI8/ENQwO0WSQhgBz8w
	 IyW38hVyHraWNK7J+KObjtlC+7gtqSnI1Zg107yfItdo1gUmKy2uOw8yGAHIBwpUCG
	 SjpnfHVUypc6/wt5+uyTNToW+dlar/lGducTyzbOxZX8DTNdEobA4Q0/Jj400OVrRG
	 jssocABKTYr5cFDzQejuVCNRlV8rIZ2t8kN8fXOzXCkYeFsweXlctIQpqNLhTh8+wk
	 EY9R9/PkbRzZA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE53380664C;
	Thu,  3 Apr 2025 16:20:34 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/6] Add some validation for vector,
 vector crypto and fp stuff
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174369723376.2563936.10648565099662367295.git-patchwork-notify@kernel.org>
Date: Thu, 03 Apr 2025 16:20:33 +0000
References: <20250312-abide-pancreas-3576b8c44d2c@spud>
In-Reply-To: <20250312-abide-pancreas-3576b8c44d2c@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, conor.dooley@microchip.com,
 ebiggers@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, cleger@rivosinc.com,
 andybnac@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
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
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Wed, 12 Mar 2025 13:11:43 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Yo,
> 
> This series is partly leveraging Clement's work adding a validate
> callback in the extension detection code so that things like checking
> for whether a vector crypto extension is usable can be done like:
> 	has_extension(<vector crypto>)
> rather than
> 	has_vector() && has_extension(<vector crypto>)
> which Eric pointed out was a poor design some months ago.
> 
> [...]

Here is the summary with links:
  - [v4,1/6] RISC-V: add vector extension validation checks
    https://git.kernel.org/riscv/c/9324571e9eea
  - [v4,2/6] RISC-V: add vector crypto extension validation checks
    https://git.kernel.org/riscv/c/38077ec8fc11
  - [v4,3/6] RISC-V: add f & d extension validation checks
    https://git.kernel.org/riscv/c/12e7fbb6a84e
  - [v4,4/6] dt-bindings: riscv: d requires f
    https://git.kernel.org/riscv/c/534d813a0620
  - [v4,5/6] dt-bindings: riscv: add vector sub-extension dependencies
    https://git.kernel.org/riscv/c/e9f1d61a5e18
  - [v4,6/6] dt-bindings: riscv: document vector crypto requirements
    https://git.kernel.org/riscv/c/a0d857205756

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
