Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DBCC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 20:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sfx62K2vp1ZV8vTfxmcIzDmrzzeEmqcGUZs3IP9t8BI=; b=ODWwr+b+y8+8zt
	DteEacEcox7w8P2396T7XdG7czwUUu9HBwdfasTCLpgg+snQ7O5Ru8KNKWYtChk7g84Ou1NIDDxGN
	DA0eWTtnN9tNYBZ1AfvmeE6lJFftusUCzNvEmVVhcN3S0yColduASFHhlRFSycPDtJPj0eZ1IrYwI
	Cv3+d4rNQ4ycTBLAZ3B123Xh2YVJLUWbo2gl657AVJke8RJPkIfV7lg3zay3nfmbTP6fLHaONTi44
	yA73QP+bRU+dFs+3xJJQJpn4MKFYY4LDjBBiaaRmyeirkwUWUUGjZH53feb+fZfM9bK+TiW4eM7rJ
	3uP/rx2jMgZVcZj9XbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAyVy-00BDku-17;
	Wed, 06 Dec 2023 20:29:02 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAyVv-00BDix-1m
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 20:29:01 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5c2066accc5so113411a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 12:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701894532; x=1702499332; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XTBTLAqDXor1l6sg34c9kbUSBjJSEI8UiBBYr9CwL2Q=;
        b=AdEJI5ras5aiObCEqGiMlOgyn7wZlxurtCKbrhtSf/NC+2J1dnjrO0l01inZwaqcpS
         8P8/PSxOZNMvG9dU0j8qMc6Vg+bALqEsQdX73ff7NhkpaYi9T6uNsWvAu5S39pdTfHIj
         dFRi7alrzwyIKktDP6DCOg5KQNtTBI9A8qUz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701894532; x=1702499332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTBTLAqDXor1l6sg34c9kbUSBjJSEI8UiBBYr9CwL2Q=;
        b=mSP2PvhkQt6l4pyWOC3MElaCgowhAjPNnY1wv+Pk23yQNeOxZjtlInb1YAwk3xASE0
         LbdEyITeodz9Mcs/6f/QIR0cGsHjh31uVDFCN/scTpnqkG57EB4LMO55CQZZKbnV7kgU
         Wb2Mc/HOKvg6Dk+h+uEBsJhWp0XHZUcjqbriOMj7bWTouwV/aLGq8mP+NMa2Ory4y65W
         vAZmVntgaKAHwkFM9B8u5CJrSxO/HJyr0Uui4PSN09Jlku+bx475tdAXIgzYzgd0hD85
         YiWnzY1UJqnXcsnQebl+8Di9Vjp8rcFIh9nFIkatqnG6+BJQjqFIei1EKFf1iV1x3y9n
         XAYA==
X-Gm-Message-State: AOJu0YyXs7PD+k0gDtCqW0yE/DYO5Yk8gfgJHK29ano2JKaqv8vL9AR9
	yRbGbSKEY0bJ/cHIx1X58wx/Jg==
X-Google-Smtp-Source: AGHT+IGCJW9aAT/9l5dWk1euSiHsIcWqvf5+MSkN2kUSEvXz1J47cG2MljPvGZxmFTZ5NhzqTZhnjg==
X-Received: by 2002:a17:90a:d796:b0:286:d42d:e7e with SMTP id z22-20020a17090ad79600b00286d42d0e7emr1213709pju.3.1701894532050;
        Wed, 06 Dec 2023 12:28:52 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id fz20-20020a17090b025400b00280a2275e4bsm280195pjb.27.2023.12.06.12.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 12:28:51 -0800 (PST)
Date: Wed, 6 Dec 2023 12:28:50 -0800
From: Kees Cook <keescook@chromium.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: samitolvanen@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: Increase mmap_rnd_bits_max on Sv48/57
Message-ID: <202312061228.B953DE8CA@keescook>
References: <20230929211155.3910949-4-samitolvanen@google.com>
 <mhng-f0a257c6-a1f5-41db-b1c4-c178a77a79e9@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-f0a257c6-a1f5-41db-b1c4-c178a77a79e9@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_122859_586652_08FD6FC1 
X-CRM114-Status: GOOD (  16.00  )
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

On Wed, Dec 06, 2023 at 05:14:26AM -0800, Palmer Dabbelt wrote:
> On Fri, 29 Sep 2023 14:11:56 PDT (-0700), samitolvanen@google.com wrote:
> > Hi all,
> > 
> > We noticed that 64-bit RISC-V kernels limit mmap_rnd_bits to 24
> > even if the hardware supports a larger virtual address space size
> > [1]. These two patches allow mmap_rnd_bits_max to be changed during
> > init, and bumps up the maximum randomness if we end up setting up
> > 4/5-level paging at boot.
> 
> Sorry for missing this, I'm just poking through old stuff in patchwork.  As
> far as I can tell this is still relevant, the discussions are just on the
> mmap() bits (but we'd already screwed that one up and have since fixed it).
> 
> So
> 
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> in case someone else wants to take it, but I'm OK taking that MM patch with
> Kees' review.

Yes, thanks! Please do. I already +1ed it:
https://lore.kernel.org/all/202309291454.436E19663@keescook

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
