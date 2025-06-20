Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F35C7115C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 21:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFQXmNa7nyOcUb8/zLHJ/nNt3yip2ON7y82zfa94tQs=; b=oKKaHUP3WG6nQ7
	Epj3zK9CYAspx26povqjKvxYtHDHc+l52dJoLGPds3GJAQE56Mu5x/Cg+7HykpRyaUfvPo3V/dFJV
	z8meF1UEp+oiW7oPdG4DRJGTxEI2+J4k0X+MGKjmP8cf7LYNmQWev1OGSn3xNqNFJiEPJEZFIeWir
	4T+3vba2P4qIqRa8GcflH2oJLAfXRZRqeKpdtgUXAVx13DVL5r6ctOinDqpQDh57wbDerP+w6fJFB
	AImvTHeQ94/Rn5cYGmFaae7mCmM2OX4riTJc0cU9bevapOvvmHn1jE91A17Jb5Zxp7mCJwCsEJp+v
	UBYMJLPRoomSOiHSfvsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjcE-0000000GeY0-3GP0;
	Fri, 20 Jun 2025 21:49:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjIG-0000000GcMN-2Ifv;
	Fri, 20 Jun 2025 21:29:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9998C6155F;
	Fri, 20 Jun 2025 21:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F16C4CEE3;
	Fri, 20 Jun 2025 21:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750454943;
	bh=ps9ILEhzF10vdX7dPy5yWB5StkYw8T+IpOw27+HOqYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FC6E1Xcsnro+YOpDn8hTu0nsIFn++h4KBl0QuHYkEldKj/k+d4y6w6M6qTq1srOEb
	 nphAh45+luPlOza9k/LIGiTbnucAbyiaYQKu35fCeF/4UeE6qHizoUNUQ651lcrwy2
	 9B8AsOSU/IbiYESK+VnWwIDmkYyfPuZfhcxVI5jvUSzpyHXAwU3LfPV8cdlkFSPdBF
	 xMjNdQkGjmPO1/cWgdHC1ud81t7SJsdgZ+qBWAEQ83ndAMnkuPMMUOkbXi61DBaRZC
	 OYic/USnxpBjVMFFaIQ2ObMgL4xYVKNxAVGs0qognj4+skHnKSZZYyuLE926HJgkeW
	 3AzWwoBcF1kOA==
Date: Fri, 20 Jun 2025 14:29:01 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 0/9] lib/crypto: move arch/$(ARCH)/lib/crypto/ to
 lib/crypto/$(ARCH)/
Message-ID: <20250620212901.GC5460@quark>
References: <20250619191908.134235-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
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

On Thu, Jun 19, 2025 at 12:18:59PM -0700, Eric Biggers wrote:
> This series applies on top of
> https://lore.kernel.org/r/20250616014019.415791-1-ebiggers@kernel.org/
> and is also available in git at:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git arch-to-lib-crypto-v2

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

But as always, additional reviews and acks would be appreciated.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
