Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F68DC3ABC0
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 18:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcCkrSCodWfKYDaWEVLLb4VtirtgfGGcNP6Kos2IRNs=; b=ZWVML1y+llfJVd
	ALllMGO5nJ0pALTm0e4iYPXHEJnzJnbLMbwsAxHftkxNJqubh9FwK0b4y6AXRKu6UO5Ae6yLgHekE
	lxY7/Eaw5r1LZJwwkDX9RnCnMYMbqS6EqpGejp4SUdpbHK6o4RfD6EtA0F/piKCEjlRHhUDWllyj3
	r4vTkbZ8z59vWUakFWwOzEW0qSJC8xuoWekjRju9x2URLSCQQigCIIhLZWz419PwKgq6PvZXLgAnJ
	j/hLAaXEInYcN9h35Y9dZ2K/DR0jiPQ9MB9WkG5cCxTMCrFRpNcZ8vPbHQ9+AiiYxWBjCM2uF++fg
	OV9t9tDP9eJN9SO3noOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjgj-0000000GVhL-47CQ;
	Wed, 07 May 2025 18:40:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjPY-0000000GTEy-22u8;
	Wed, 07 May 2025 18:22:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 865D6629DA;
	Wed,  7 May 2025 18:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDE8C4CEE2;
	Wed,  7 May 2025 18:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746642147;
	bh=YMcr7kQ9TGaTP6WhqfZiDNaymUksVxM7RBsyZue/exk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kArIe70suXHlXZo0TV+JN/3u2UOxD+7Wnj5//RanirT8XGGST48Cq2TG35hw0Z7Fr
	 UWNR5TDLpwEXsfC33lcbuzTDQ5f+O8bD4Gn6w3Jr7YaUIwSJbQOnJtxUocmVtFxNVE
	 aGFiRZTyZMpNd4jGQ8kI7pxc7mQl2pXAnSMeBC1cuqrgDCb4JAP1cdDy3JpM43jACf
	 BKpvKrUq9hDaiqZVf5uNcwhpLrXdarNIGqD7pouUa9gW0iKYyxFgeHW5Tf8aNXVgZF
	 1gAz0R8tZedOmkHmd2KIOUhjmzVIorHzuYLnK5oe7p42v2BpEpmlsIQCM356k+k3RT
	 /Hti7w7Bm9udg==
Date: Wed, 7 May 2025 12:22:22 -0600
From: Keith Busch <kbusch@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/8] nvme-pci: Make nvme_pci_npages_prp() __always_inline
Message-ID: <aBuk3nBDOv_6wFCT@kbusch-mbp.dhcp.thefacebook.com>
References: <20250507180852.work.231-kees@kernel.org>
 <20250507181615.1947159-1-kees@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250507181615.1947159-1-kees@kernel.org>
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

On Wed, May 07, 2025 at 11:16:07AM -0700, Kees Cook wrote:
> Force it to be __always_inline to make sure it is always available for
> use with BUILD_BUG_ON().

Reviewed-by: Keith Busch <kbusch@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
