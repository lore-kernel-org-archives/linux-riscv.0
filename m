Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A3F606A320
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 02:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b+n2vNMf;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tpad2UdQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=INe5am2CydBz/hB/8dUykgB2UVMQ69RTeNjW+1ywHTo=; b=b+n2vNMfTpSBwQ8ZJB8zJ2qN0b
	iaI5APBd0RqJeojVd1wHm9k9YtZXYAz7S9I+Byx2FQsEltnNXx3T4tyf+xVVkFa9NmC3zUgucfA99
	jSRilDVZ0FGaQ6r4MrAC/uMN897r6q404ET/SnRoQqs3to9DjkXvqR4/ooJyKRF1A4lR97CQhYkbE
	wnzr98Tqya5n1eBKQatHEm8NJFC17Uy1Q1aFH3xSCJPHS5O88eSLuxepIxtuIPsujNJJVbwWpPd7r
	boOXibbwDb9ZrMrmrIu6rcI3YuVWfSJHZpE7HAit9a/wdjeJ10/YNwM4knifYFDYaGgMplhFCddF5
	Tv/LDcFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxdA-00000005P1O-2f1B;
	Wed, 11 Nov 2026 02:00:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQxd9-00000005P1G-2oA5
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 02:00:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 128AA401DF;
	Wed, 11 Nov 2026 02:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FB11F0089F;
	Wed, 11 Nov 2026 02:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794362406;
	bh=knlC16tb0fmhvOu+uBq5yXSRa3dChQFTwNgKUBOfny0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Tpad2UdQeAgh+2njzB98sP2gOZQTlt2hzRsLShsmj6TGSv2IbgN6GhgoeKl4QoBSG
	 xQYl8ELxaTMDEej9ta9SrAxXKSK8/378qOIHSkPdc/I1k1yuLz5+CC54++DBb+7QKG
	 6mum//6kjU+OE2W4AgwGvEKpbSsaff6sbDHDYRXLMftegnKJplYruKKfvLp8KA2356
	 gWdUave4dwrGSkPIMSL4FjAUkVOzKKIMyRI08BTcgTvw7QjvrgVCa7ydPUgexVsker
	 +eJJYlcfffg6O6fN/puNDmVC+bo/A3OEbcouUhOo3umrc992+3wU4LDZ1A5F5yiJ6b
	 RTsW484tp9Prw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D8202380CFE6;
	Wed, 11 Nov 2026 02:00:06 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: pci: allow write-combining mmap of PCI BARs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179436240542.644035.285193769766011336.git-patchwork-notify@kernel.org>
Date: Wed, 11 Nov 2026 02:00:05 +0000
References: <20261110-riscv-pci-mmap-wc-v1-1-1d16fb8c74b4@kernel.org>
In-Reply-To: <20261110-riscv-pci-mmap-wc-v1-1-1d16fb8c74b4@kernel.org>
To: Troy Mitchell <troy@kernel.org>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, bhelgaas@google.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
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
by Paul Walmsley <pjw@kernel.org>:

On Tue, 10 Nov 2026 15:04:49 +0000 you wrote:
> Define arch_can_pci_mmap_wc() for RISC-V, so that the PCI core can
> create resourceN_wc in sysfs for prefetchable BARs. Without it, the only
> sysfs mapping of such a BAR is resourceN, which uses pgprot_device():
> with Svpbmt or XTheadMae that is the IO memory type, where every access
> is strongly ordered and nothing is merged.
> 
> resourceN_wc is mapped with pgprot_writecombine(), which selects the NC
> memory type when the kernel uses Svpbmt or XTheadMae. Without either,
> _PAGE_NOCACHE is 0 and pgprot_writecombine() changes nothing, so
> resourceN_wc would get the same PMA-defined attributes as resourceN and
> no write-combining at all. Make arch_can_pci_mmap_wc() true only when
> _PAGE_NOCACHE is non-zero. On 64-bit this is a runtime check, as
> _PAGE_NOCACHE is chosen at boot from the CPU extensions; on 32-bit it is
> always 0, so nothing changes there.
> 
> [...]

Here is the summary with links:
  - riscv: pci: allow write-combining mmap of PCI BARs
    https://git.kernel.org/riscv/c/79fc9d9467a1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
