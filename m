Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5BB606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 03:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1A8qy1Oh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UoYi5Mv7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PW3zvagNl0DtjgD9z6fjmsjXaBWI93FqswfMM91fqII=; b=1A8qy1OhBGBz4D6zn3Gb75EFqE
	VBNzS0Dza3SnyUPQupxuRgO5j/uKcxb4o9HVQuHn9NKyf9UhBGCiYIA30QP7IEx9vgvHw18zHOryP
	C5/zIgdb3iFvXmB6+M5qOf0Wsw4Qzj2nBHvsxfG2VmSexvU0IihCf5X2vC5k+s4anjX8+IvTe+Eay
	38TqCgvlGU1ow/+Wjpx5diHZQmEF83ecKEmSvYNOa0gjlx5b6mYtKoyw6H0U03VawspA3+2sMUexA
	cLFOFab4xjY1xAsTa3KRmWoCEqYE4SBB3D6skmuL1yue0+ksycPvRdFXum2/5r7+w8PWOwADP2OtA
	Z+cbuzLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3uq-00000008JV1-2OLg;
	Wed, 25 Nov 2026 03:43:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW3uo-00000008JUr-0pa3
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 03:43:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C99A44080;
	Wed, 25 Nov 2026 03:43:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D5E1F000CF;
	Wed, 25 Nov 2026 03:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795578205;
	bh=t9W2Gk10DZjEPSXH6hcneTKP4KaRBynMS3mjwYq/Ysk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=UoYi5Mv79jgFAkNJrDo303k06YX6w5EXqixUl5ya1oUFWdmbhdWfFjVB1ImbTQQvb
	 hBfHx0ZKyfmPfXIjD8QwNJ9GFDmRvRH+/yD6/LgPJjq8N7dZLR5VOkOFnIOhlCy4jW
	 3uIwMoLve9Qm8kIf65hhGjnzhH2CH8/H6dw02B2d4JGZwMqd1j/3M39zitM02y5Ilo
	 gv3As7JUg18/mS8/YB2OurUxvpJf3QW6Wxplk8Sg4a5Y8jwLHWikVNojB0SWX8VmsL
	 lHMP3P69EzvcFy7euUtSnbvnUNDroqHlbcs9fsc+BTa6ivffHE/+sGp7YjF/3ppaa0
	 FRCtNW1XBacyw==
Date: Tue, 24 Nov 2026 20:43:21 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: pi: validate early bootargs before string use
In-Reply-To: <20260403143003.3-riscv-pi-bootargs-pengpeng@iscas.ac.cn>
Message-ID: <bda6c38f-a3fe-5dd4-3fe3-29f3069a9b42@kernel.org>
References: <20260403143003.3-riscv-pi-bootargs-pengpeng@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 3 Apr 2026, Pengpeng Hou wrote:

> get_early_cmdline() fetches bootargs directly from the FDT and
> immediately passes the raw property pointer to strlen() before copying
> it into the early command-line buffer. Flat DT properties are external
> boot input, and this path does not prove that bootargs is
> NUL-terminated within its declared bounds.
> 
> Use fdt_stringlist_get() so malformed unterminated bootargs are
> rejected before any C-string helpers walk them.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Sashiko points out that this could cause a regression in the 
CONFIG_CMDLINE_FALLBACK-related code, later in get_early_cmdline().  The 
CONFIG_CMDLINE_FALLBACK-related code only tests for fdt_cmdline_size == 0, 
but fdt_stringlist_get() could pass back a negative error code in 
fdt_cmdline_size under some error conditions.  

Care to fix that and resubmit?

thanks,


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
