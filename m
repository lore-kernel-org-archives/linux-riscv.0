Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ED6CDE009
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 20:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GF92D5qEz+DkHabU0ZFEPK0sEAJcgZe1Oer6H3lEqZE=; b=aOlqdrh0BWeX5v
	2S6DD1oyYP/nWav6zWoz6As+ROPetZhmeQ52by9MYKrmBMSRlBLdSWD53cMUKk7jN5xuyRq/AC+nW
	oDMeEHQUnbVdQG3us2h0/FzmUZOouK1DXnf6/clYBVf6/kEsETbOw6bsmfLDLtRVLEP/L7VKDhuSo
	gNh6BcUVv/itNp7dSSpnWB3kNm8GCcBjoyRg+0PAl/sba7c/TVjdigRmXWcP47O59UZ/E4neC9ntm
	e+OMTGAj0GZek6sOv+A6gWTUG1GtUeAoB171dgyq5rjweRSQXhHq/aAg0nyalsimRFe+G/xe4g/Fs
	9mdf2WBa4LFs7P+/knfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcqTS-00000009mgs-3rT5;
	Thu, 25 Jun 2026 20:14:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcqTQ-00000009mgg-3kbY
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 20:14:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 44DE2416FE;
	Thu, 25 Jun 2026 20:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E841F000E9;
	Thu, 25 Jun 2026 20:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782418496;
	bh=cPmr9mqHehuH/8SL5EU6QQ+XWWK8jrMA1RsYVuKM7PE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=fzLhRwL9+cBtKC2y8H6yxrFXyLco1lzXeMjs1ociwQZqMhP/fHHVGqzbmkvmHGM/j
	 8RaL3mJjYI5AWnTuB7x1GNwPjRK6wH1/pVVxAMvlMT9+g8Ikj2qLqYq5t7eYcKdn3w
	 B2PikCanp9CecXtcTQBQ7JhKojFMnbPOU1ATYYcxkGMBO+ghOsWpn3hdGfkivQfqu2
	 E459XqU/tzStlO2WbRYAzF+KpeCV/4FszJXHKgZoHbaRjPTfpTbthezxW6xc07k2AZ
	 HKku2LuVXyux7iGCpEqIKUqeVnNVFbvbCCoOBYMjzR8iUtAZ9o1A1O/MBrFtGM3JRg
	 9kkjLZx5DGlkQ==
Date: Thu, 25 Jun 2026 14:14:54 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Atish Patra <atish.patra@linux.dev>
cc: Ard Biesheuvel <ardb@kernel.org>, 
    Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-efi@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, Atish Patra <atishp@meta.com>
Subject: Re: [PATCH 0/2] riscv: Use EFI runtime services for poweroff and
 restart
In-Reply-To: <20260615-efi_reset_shutdown-v1-0-9414edcbbab0@meta.com>
Message-ID: <0167594c-0c54-cbb0-a981-26df2a5bfb3c@kernel.org>
References: <20260615-efi_reset_shutdown-v1-0-9414edcbbab0@meta.com>
MIME-Version: 1.0
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

On Mon, 15 Jun 2026, Atish Patra wrote:

> Today RISC-V always uses the SBI SRST extension for both poweroff and restart,
> even when UEFI runtime services are available. This series makes RISC-V prefer
> EFI runtime services for both paths when available. The reset via EFI is
> required for EFI capsule updates and also documented as a preferred method
> in BRS 1.0 spec (e.g. URT_030)[1] 
> 
> Behavior on SBI-only (non-EFI) systems is unchanged.
> 
> Tested under QEMU 'virt' with EDK2/UEFI firmware exposing runtime
> ResetSystem().
> 
> [1] https://docs.riscv.org/reference/brs/uefi.html#uefi
> 
> Signed-off-by: Atish Patra <atishp@meta.com>

Thanks, queued for v7.3.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
