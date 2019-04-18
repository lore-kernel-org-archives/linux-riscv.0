Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F831C10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 04:32:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDA052184B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 04:32:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="THl+Q7DF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BwFdgFLF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDA052184B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTMpyQ+iy46We8vD2Y58HhjjLehCeYpE95v3We9Ot2c=; b=THl+Q7DFIo2JPX
	siW/JQuDsLoxgr4InmQZmMCekZKcZuzyglCGsQknNXJ6v3/IZlbSrXWvWx//p/7L5WTCaHj9qixA8
	AccvbA11qG4yHoj2YdqzIJllRV63VMua/8RuDd7xYDcEANMi04JhszyQhp0SBCZQ/xqpAoYhseEM7
	3UIHG1JtfFLSUiynjaBHvYosjZ2Su6h8X/ZWd0jNPiqUA+Fmeu75d+ULx5qCoEnLVl2P0/vu4P7d+
	5ea3LWgGQ3q6HvBG+499YNCML8s5Ck9UHtk+H02hyTkncA5kb9ZR4Kq6nn+to/y6IyhNriMq7Tkqc
	wsUCHPqNp0BmCo1DN+1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGyj4-000682-ER; Thu, 18 Apr 2019 04:32:42 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGyiw-0005tl-CK
 for linux-riscv@lists.infradead.org; Thu, 18 Apr 2019 04:32:35 +0000
Received: by mail-ua1-x943.google.com with SMTP id k32so358201uae.3
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 21:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=emqG7/19kpW5wZ57vs/jCWwiZdoRZXGDohb1D974Avc=;
 b=BwFdgFLFNee7q4d/odil7gkB/UOuVM/QIlnvE7TGVcPxV0znLQ4z7fs87fH9FD/p2Q
 QIWn2YByOZWf2cz5EWUgLnTt8H1YHdlzqE3vWASVSstFIxPSA4Jhvnkwf4hkz5pNBDia
 3hMlCG7M0QDEQlArREt5/8jUB1Ed/r+jW9qXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=emqG7/19kpW5wZ57vs/jCWwiZdoRZXGDohb1D974Avc=;
 b=ROKSuM/MbDSO2MAiHGZi+sEaG8ufCzUEkI4jijhLPNreicQJWaHthl/vj7rT0teEzc
 5A3gbDyKWbBPRb31MzcWzmCWjL6A2qgYAMxEUWQL1xA/Lh45JFXOgqVrT9v3eHblguuF
 MKa4mJAXKYV8vboNNaoZXBH41Ydql81tSTZU60UkJ0MeI1Ld5Sp0efWDaw+7OXgp0UrD
 ssi7jU3jRFQxNVuruxiqQzxxpgOV96/HzayZXr5xN/0sBuIpw4kJ7g0Ibhbv6Bp2TX/q
 E+Bc4Oj56jx4Wb/UEZWhtI7V6VhOnAlxIt28zt22mw58uDaRJlIa+cet6qyafDPJKhzG
 87ow==
X-Gm-Message-State: APjAAAWaVm23GPO5pGTrE83ajpr6IVqmi31kHUNRvSJnXDv7GNE2Fbqm
 ZG6Zq0LsTxihkd+82qPzAqNEcbnScFs=
X-Google-Smtp-Source: APXvYqwAJFu6EVI5qYenc4wdsXYggVGuAVW7BKvXFH+L5s2FOLWiIFzQfV7tEIjcsDqILejv0D/qxg==
X-Received: by 2002:ab0:4870:: with SMTP id c45mr20741140uad.21.1555561951862; 
 Wed, 17 Apr 2019 21:32:31 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53])
 by smtp.gmail.com with ESMTPSA id t201sm331156vke.15.2019.04.17.21.32.29
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 21:32:30 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id g187so447558vsc.8
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 21:32:29 -0700 (PDT)
X-Received: by 2002:a67:bc13:: with SMTP id t19mr2517845vsn.222.1555561949440; 
 Wed, 17 Apr 2019 21:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-3-alex@ghiti.fr>
In-Reply-To: <20190417052247.17809-3-alex@ghiti.fr>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 17 Apr 2019 23:32:17 -0500
X-Gmail-Original-Message-ID: <CAGXu5jKVa2YgAkWH1e26kxd2j6C4WsJ38+Z3K1z7JRvr_jDX6Q@mail.gmail.com>
Message-ID: <CAGXu5jKVa2YgAkWH1e26kxd2j6C4WsJ38+Z3K1z7JRvr_jDX6Q@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] arm64: Make use of is_compat_task instead of
 hardcoding this test
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_213234_471907_2C4A5FBA 
X-CRM114-Status: GOOD (  16.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Burton <paul.burton@mips.com>,
 linux-riscv@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 James Hogan <jhogan@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 17, 2019 at 12:25 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Each architecture has its own way to determine if a task is a compat task,
> by using is_compat_task in arch_mmap_rnd, it allows more genericity and
> then it prepares its moving to mm/.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  arch/arm64/mm/mmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
> index 842c8a5fcd53..ed4f9915f2b8 100644
> --- a/arch/arm64/mm/mmap.c
> +++ b/arch/arm64/mm/mmap.c
> @@ -54,7 +54,7 @@ unsigned long arch_mmap_rnd(void)
>         unsigned long rnd;
>
>  #ifdef CONFIG_COMPAT
> -       if (test_thread_flag(TIF_32BIT))
> +       if (is_compat_task())
>                 rnd = get_random_long() & ((1UL << mmap_rnd_compat_bits) - 1);
>         else
>  #endif
> --
> 2.20.1
>


-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
