Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFCDCA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 02:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wtxyxK/SXWYfHQFq04/p4DydWBiPl/gELAvgS4QEbbs=; b=Y3koztmSDXN/A2
	dkL+lvDbBb6cOs4PwrY3D2k6n2ICHJ9g9NHwkaS9SvX3+jddcMCkedZ7EbKwCWkjpFhKWbT/u0J79
	qjE3oKZ8zI0ViD1AgNj9L88GKp2Qr/FZTNKHGYrJJ5K2/GQCz9G66FQtGvQBAaqkJUiF7jC/Kpm61
	oj8uM+jDUxF8NRD4LoVDE8tfpuIlB//KVvfDjZRUhVddEUPWM4/iiUC3UxZJPs9RMivHwVQkfLWOi
	awTqUJdJA1hW3pSBCguQXHxR5mcQVzQNNKxVyfG9OuzKCP9DuFqQurgNDVdCOBkKF+68cT0mfSYYb
	Xl6SWYHPX+bsmzzHafzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5kK-0000000DepC-2Qy3;
	Wed, 27 Aug 2025 02:18:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur5iV-0000000DecQ-3X2t
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 02:16:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25FF440C37;
	Wed, 27 Aug 2025 02:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FA1C4CEF1;
	Wed, 27 Aug 2025 02:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756261011;
	bh=eDcnJCa93Xe3vxBW0ZfBX8WQI8Q3WYp0DM/g3zZt1X0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMrdH3wQ73KH16B2mWQKpADZU9EJelPjqrVz8uwbk1UXIqcjU3eZLTUtQc9YSV/cw
	 8yfTYJsdTcwfAgie0JzfQ/v72kcAcuEIk1CwhprXAsl7qoICZ2fsu05rGgKMasYr8L
	 hVlxymar9e0J9SiHHpk7gq4sCx0YdPe42OTFPPiOKZ3sGexuVULTW3MI0Tmdr2bcFk
	 lsIDAJ+QxCSEKNpiXG2w4zHg9iVODxbqRvucvgucw1Du6bZhSa7Kwp5BXoNQlMu4Lm
	 1Adqp8bed4u6GC+aPwrCl4gEo1iH3KmF0EBFyz7c5hT+r2JdqV04dnZZ1bA8/mgmUf
	 gMpNSm0rhFRSQ==
Date: Tue, 26 Aug 2025 20:16:46 -0600
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Andy Polyakov <appro@cryptogams.org>
Subject: Re: [PATCH v2 0/3] Consolidate Poly1305 code and add RISC-V
 optimization
Message-ID: <20250827021646.GA62136@quark>
References: <20250824025736.148576-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250824025736.148576-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_191651_899890_E037601D 
X-CRM114-Status: GOOD (  12.50  )
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

On Sat, Aug 23, 2025 at 10:57:33PM -0400, Eric Biggers wrote:
> This series is targeting libcrypto-next.  It can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git poly1305-v2
> 
> This series simplifies and optimizes the organization of the Poly1305
> code by consolidating it into a single module.  This follows the example
> of SHA-1, SHA-256, SHA-512, CRC32, etc.
> 
> Since the RISC-V Poly1305 patch has had a moving target, I also rebased
> it on top of this series and included it as patch 3.
> 
> Changed in v2:
> - Added missing 'FORCE' to the make rules for mips/poly1305-core.S
>   and riscv/poly1305-core.S
> 
> Eric Biggers (2):
>   lib/crypto: poly1305: Remove unused function
>     poly1305_is_arch_optimized()
>   lib/crypto: poly1305: Consolidate into single module
> 
> Zhihang Shao (1):
>   lib/crypto: riscv/poly1305: Import OpenSSL/CRYPTOGAMS implementation

FYI, I applied this series to
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

But as always, reviews and acks would be greatly appreciated!

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
