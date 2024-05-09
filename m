Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AAEC25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 06:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNchAyc9wQDanW+/kuXeUU2CyPbiy8RdGyBh4nPj9ZM=; b=VXjzTCHsyqMY1L
	cJATr+AN4p7cc95y6cXKfdAOGp5pHVi9VjL6NHdDDixIS7bFgqAJ3z7BY5L9freUqlBHL6BYU5hri
	CcVccdDllcK3rlmghNiYs01v+0Dva8XNg1TasbgtGyrz0dYKpo9zx4YE6QC66x4AM8eVNCw14sUnw
	EjNVWgIKXVd0+YVj7DqHqCvcFcs4LgnyPBVaj0itaLJIoXj4//YaxKUQSL8ccYLokXsUxeozt6FQT
	hwk34UvDlv8sdm4cQMDtThArEHjlqx5OpWSO+qCCWKipvfUBBSBij9W/v5P3goTC+MeKi4+oKiV3r
	0+ZwESmrr33Kykcrcl8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4xjX-00000000dDS-3nx5;
	Thu, 09 May 2024 06:58:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4xjV-00000000dCV-2cI7
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 06:58:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CF9361CCC;
	Thu,  9 May 2024 06:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38F5C116B1;
	Thu,  9 May 2024 06:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715237902;
	bh=C8cKKt5VjyDPU/4tJ4LGGEHXehXVj0txwNTwTy5tqJ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qt3alTsQqjfc4ZiNpmkyX9spvyrbc9OwGmaYH/F7Y1gYza4J8CVv+f7HhOyh6r/hH
	 Ai6g2pOLy5RSnXoV4qYx8A6JMf/MkmlO6HEJ/dl1x5ackgegNrsW/GV9owbLuebXug
	 iJNcIhyHh7cyaeEaAhmpwhc3uQYLdMlcfDnrOcc6DYwPENRam6TznI/1FGIvYcuo7R
	 iq6VGQRRZPBQa0wbW8F53SOem7YJtJGc5fq6Ohj7UW7Wd2IpTv0OuWoBUE1GzOkzhS
	 on/PeB2Rk1FgseXSzgHFpzP/Xhb9gT/EQuav08MwWEtTTqw5eG0h9uVZ7ml04Qk7VG
	 +QtHM0dTon3JQ==
Message-ID: <6d8ec78f-e138-4798-ba7d-4cf6ac08e8a7@kernel.org>
Date: Thu, 9 May 2024 15:58:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: canaan: Disable I/O devices unless used
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
References: <cover.1715163174.git.geert+renesas@glider.be>
 <f85d460efd7ad85ec59c9253c989b10a07f2ff24.1715163174.git.geert+renesas@glider.be>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <f85d460efd7ad85ec59c9253c989b10a07f2ff24.1715163174.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_235825_752993_2F37BFF5 
X-CRM114-Status: UNSURE (   9.99  )
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

On 5/8/24 7:20 PM, Geert Uytterhoeven wrote:
> It is considered good practice to disable on-SoC devices providing
> external I/O in the SoC-specific .dtsi, and enable them explicitly in
> the board-specific DTS files when actually wired-up and used.
> 
> Hence:
>   - Set the status of I/O devices in k210.dtsi to "disabled",
>   - Override the status of used I/O devices in board-specific DTS files
>     to "okay",
>   - Drop unneeded status overrides in board DTS-specific files for the
>     always-enabled pin controller.
> 
> On e.g. MAiXBiT, this gets rid of an error message when probing the
> unused slave-only spi2 controller:
> 
>     dw_spi_mmio 50240000.spi: error -22: problem registering spi host
>     dw_spi_mmio 50240000.spi: probe with driver dw_spi_mmio failed with error -22
> 
> which is seen since commit 98d75b9ef282f6b9 ("spi: dw: Drop default
> number of CS setting").
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
