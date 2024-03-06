Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E93C5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DkG5PARpo7VXwORZ5NbXsU/V5ujowPdBMyG4jycG7/0=; b=CG3Fo6/MPKtAMy
	Yy6oI/+oZJ2b9NHNx4Jl9Nq4LchNVoeCRphPEtgHfJuN8ZlrQfFHzNR2Hut5RnnTABwrvH9F12gEp
	KH0880E0NVoQ9ItA8TDG5IAzzCnIV9NBOwBSb/5jj8CTkgRbuP+oeBTpONvTU+H1KtQzP/TIPYWI9
	yL51oTvBoXtawtcyw//jP2jOW3fLtMIhisGEm5pJ5uJBtGCgaqZsgcZCkI1HITcN2u7BLrPZeNFvu
	tBgKIYyKZ0Av2b7S0aHlGdF4HBmEqRUKUkb9cykYB5xTHp8nKJHiyyibacefy2lk6urCv5s+Vwc5H
	16TG6E4dClvd6rXbut7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnjA-0000000HC5a-2A75;
	Wed, 06 Mar 2024 09:38:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnj8-0000000HC4h-3mka
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 09:38:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DAFD61967
	for <linux-riscv@lists.infradead.org>; Wed,  6 Mar 2024 09:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91D6C433F1
	for <linux-riscv@lists.infradead.org>; Wed,  6 Mar 2024 09:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709717897;
	bh=/zob1SUIARO/VzvgSwuB1+L/ZOE8hSegEZPs5jeGJ5s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e/Xrv7mFP94LYjTU1Bk/SjtCfbIGeno8KVLzstlewUFSknQzRKuxHSrH7U1f4VJSk
	 h5JxvCVz0VUjNhCs3RGvmESG+ln9DOUwdGkiz++81Q6uEqC3lm3j4qYHGqfQEU5yxr
	 C5ip0R0sEf5kovRQxslDIvhGynoImqvLHzcuEuDYetyiePasfh/CsSr9qB2tS/mqLt
	 8fq5SaoiDGkRY7E1wZ29P/q8q9OBmE7oZTv3UuHORgvYn2UIhERSP3etS0sGruoXVS
	 eM3jWWhsZBglaaMdN5NBiwJ5enUPShIqM1Ga5Z+hdSqARVmyWQCSGu3oEs5fAz/Dm8
	 BClRsdTy+X4yg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5135486cfccso2133679e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 01:38:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVRhNegM/UbGc923GYmvFgOrIcT2mQPACMTDzoCk0UN7stbBJFFtu5b65kGcJVS8749R/bQC3w8mNS/rB3uj8CHmFwORmlJD+3irg8hlVXo
X-Gm-Message-State: AOJu0YwCAP0PcDtpC7VSZleZqFLf+KmMyaZzLaX+klPBnzuUZMOQHQTY
	Za2bs/KOFfF9fyBBbsEoww3PGT+5Eab6PFgOWFgJhW/mmc3h/oTQVx6JF2bu7QWaY3FJ8oF3/vu
	+96DY06O0lF6PVYw3EnhaobM8Jjc=
X-Google-Smtp-Source: AGHT+IHwgXrP9x0X4xUM5Z3Jn3F723E5zE3hNEQl/1jzIw1B7cvBXWZrrUm6tUYEa01iU5avfoxDPYOFfwuWy2sTCq8=
X-Received: by 2002:a05:6512:3493:b0:513:5873:1a29 with SMTP id
 v19-20020a056512349300b0051358731a29mr1996339lfr.54.1709717896006; Wed, 06
 Mar 2024 01:38:16 -0800 (PST)
MIME-Version: 1.0
References: <20240306085622.87248-1-cuiyunhui@bytedance.com> <20240306-zippy-magazine-9a4ecfe1758a@wendy>
In-Reply-To: <20240306-zippy-magazine-9a4ecfe1758a@wendy>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 6 Mar 2024 10:38:05 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG6k5SZDYwdxhoJDiNxUuAqBOqqANUiys4YTCk_HCF5AQ@mail.gmail.com>
Message-ID: <CAMj1kXG6k5SZDYwdxhoJDiNxUuAqBOqqANUiys4YTCk_HCF5AQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] Revert "riscv/efistub: Ensure GP-relative addressing
 is not used"
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Yunhui Cui <cuiyunhui@bytedance.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, xuzhipeng.1973@bytedance.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, bp@alien8.de, xiao.w.wang@intel.com, 
	jan.kiszka@siemens.com, kirill.shutemov@linux.intel.com, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_013819_016870_413C839F 
X-CRM114-Status: UNSURE (   7.48  )
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

On Wed, 6 Mar 2024 at 10:03, Conor Dooley <conor.dooley@microchip.com> wrote:
>
> On Wed, Mar 06, 2024 at 04:56:20PM +0800, Yunhui Cui wrote:
> > This reverts commit afb2a4fb84555ef9e61061f6ea63ed7087b295d5.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>
> Reverts are commits too. You still need to write commit messages
> justifying the revert.
>

Indeed. Also, please revert them in the right [reverse] order so we
don't inadvertently break bisect.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
