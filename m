Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72371CA0FF0
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Aug 2025 00:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQPbTiJutjupcHkSbAs6YFZNjWeYAvZsKpNeVVKl1b8=; b=JGov1znhtFSJqb
	Ra0TlysvyGOZQhasvJHZKH7ieUDZAAchOBARtzmltzQY+iyvE2JFGYbg2iMmnLHsufdWBDBpU56T4
	/nh8BLgEtmUMS0356IrtQGO5L9CAttaFPjocAK0Kmg0bFf3EVnr1s7IzNYcR+otF8I3kUi5jo7xLj
	lpx0NIM57YLWXAIg7tZAV21DoW7+uJqqlc4lN0OW+NHHpnNWhxk6JHDEon3ddIksp2Zxhjd3X2Qzf
	4Xv6/aYHYMd3pak805JJ7GkpbWWHyzagpAhQtl5dHZvCElDN9uHjNBFRCxikYJEGTx4D+ivJWVCiQ
	m8A4QaL75/JdqqOdeVpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9kr-000000079hv-3fki;
	Sat, 30 Aug 2025 00:47:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us26p-00000006QK4-0Zy1
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 16:37:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D0B6444E17
	for <linux-riscv@lists.infradead.org>; Fri, 29 Aug 2025 16:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD495C4AF09
	for <linux-riscv@lists.infradead.org>; Fri, 29 Aug 2025 16:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756485470;
	bh=fiQj3uu5qngcYi46mmPDjoITF7Gt3V5Fs4N0MfKDFtc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h52r/ulljkiYJSMK7XBsmmx/2QiBhdt4PCSXJ+LwR2yHL2KfLEFAGkJmiTMbGTtpZ
	 GKAgApxjMsOaI3uME9WkEyZ4AikThQzqV8jBOk7XkKN3HhZB9vzVwyUeDdWxEyPILm
	 PP3ak0uCyntjz7fa9b8bV0PjbOoEBu0dCGtg+Iv2HLcwssKB6E+vl3F9GesAnTtieN
	 iEdZriDCXxfIJaEyAV/jUn+4OL7/1pmxLa86h1kWq8uwXR3P1JEf7FZblSAhZZayKI
	 zFlp8cO3/JRyjJDh6xKaUYmsnGmW3/pkplv4aWyt3pM/8O7R0xa/lWjwA3jZYi9dfI
	 RTTaU+JWWZ2SA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55f6bb0a364so771236e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 Aug 2025 09:37:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwNTwsVzWNijhEkJ91NOXxMecxtAuueIPgxe15dbfklN1nwG5ABSgwcJqr8/HKh0MPOA6OGeYTN8P4Sw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyItVBAS67lDpVLY1PpSz9sVd9+rwjHQKMC5cFC1cuV6qUAxSTk
	u/NtTmAgnooa2CvzZZtRHu+Za2KHRsOHGu8lyf7MeYSc1gN/COhSd4lXbTSgcaVqIEDsz6F7sgi
	S2EKAkD4RK9Cj54eAYF4p5QSblq2pUMM=
X-Google-Smtp-Source: AGHT+IGASJCP/xFodrz/Fa9AjwsrrzHLMiL29p4vUyw4mzQBfOk9KwY2Yi8ywguFIbG4etYvoUMGLoWiu2qvLGDzrBM=
X-Received: by 2002:a05:6512:304b:b0:55f:3e8f:ac0b with SMTP id
 2adb3069b0e04-55f3e8fb025mr6445063e87.6.1756485468968; Fri, 29 Aug 2025
 09:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250829152513.92459-1-ebiggers@kernel.org>
In-Reply-To: <20250829152513.92459-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 29 Aug 2025 18:37:37 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH0N4tBOVupP27UADDrPy4_0WTXX6ihr8X6LfbhjE3F3w@mail.gmail.com>
X-Gm-Features: Ac12FXxWcprNszC_x2jB4UeYCch8Y0qrkFs5mIDQU9brPhw8YWIKfVp-NAk3GKs
Message-ID: <CAMj1kXH0N4tBOVupP27UADDrPy4_0WTXX6ihr8X6LfbhjE3F3w@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Consolidate Poly1305 code and add RISC-V optimization
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Zhihang Shao <zhihang.shao.iscas@gmail.com>, Andy Polyakov <appro@cryptogams.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_093751_201706_3AD7DB81 
X-CRM114-Status: GOOD (  13.67  )
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

On Fri, 29 Aug 2025 at 17:26, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series is targeting libcrypto-next.  It can also be retrieved from:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git poly1305-v3
>
> This series simplifies and optimizes the organization of the Poly1305
> code by consolidating it into a single module.  This follows the example
> of SHA-1, SHA-256, SHA-512, CRC32, etc.
>
> Since the RISC-V Poly1305 patch has had a moving target, I also rebased
> it on top of this series and included it as patch 3.
>
> Changed in v3:
> - Added mips/poly1305-core.S and riscv/poly1305-core.S to 'targets'.
>   This fixed a bug where the perlasm build step was always running.
>
> Changed in v2:
> - Added missing 'FORCE' to the make rules for mips/poly1305-core.S
>   and riscv/poly1305-core.S.
>
> Eric Biggers (2):
>   lib/crypto: poly1305: Remove unused function
>     poly1305_is_arch_optimized()
>   lib/crypto: poly1305: Consolidate into single module
>
> Zhihang Shao (1):
>   lib/crypto: riscv/poly1305: Import OpenSSL/CRYPTOGAMS implementation
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
