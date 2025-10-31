Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5B7CCF9EE
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 06:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iy15iRX4b8TsMmzrNzyS4nsNtR9pLfHuj/zLImDUsw=; b=Swh4XVsZsme5Sz
	mhQYBFiyyXEiOlnFtfAgEwKPebJuM+bgyYy/LoONOpMmI+OlqYVEWHNA/ywvEaJJH6p/GPUuwkOOg
	mfKi/b/rYHLT0isKkKtqbg+cQm7Dm+wXLSQEWmi4IVZXOxk4mcXQoV8XV0sqXoajWaFDTHyYLOc18
	5nNjbx2mO//xU6WJ+iDm8H27HX7xTWh9aNwqP0SbNFc/hJe7EehpI3VkzkIFm61ukDsZtW/OcSn8z
	z2lYYzQo3xaXO40XTAOXrzr4GYT5hrLq7lMuUMRmFuiJjUCobWtccrz0OETsz/rQF8e8Y2BTTHRcO
	g2EodbLUG544/fLsoNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEizu-00000005UnR-0iK1;
	Fri, 31 Oct 2025 06:52:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEizq-00000005Un5-38LR
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 06:52:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7F3444D41
	for <linux-riscv@lists.infradead.org>; Fri, 31 Oct 2025 06:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99ACFC116D0
	for <linux-riscv@lists.infradead.org>; Fri, 31 Oct 2025 06:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761893544;
	bh=ksx4g+Jh2oVtltJZWL+FIC5BrFeq4u4rjwvhozEkK1U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ev8bWVRC1tbtlXw/rhWi9pOl0IDaJ4iq9Kfdw7R+PaAuYXp/MdcoYuZ7mTkrooNNK
	 N48R+m2bU+huj2o9GITfLGpO17xhbgRaPQKHoVPsaaLTfch0TQCV6mZNBubWGGCSh7
	 dc5/9uCluvY72tU3dZt42zcfOBp7N9UFBuDwa/c1aikOy+6sdcyy00zgNGTF92+zUi
	 tVK934J0IB5ndU1tvQOAsqw/Cdzdp1UdD6tKz+tfQxV/l+Nvhd/g0OLzC+puGkqLL0
	 Tn2EhcLlbYcomRlD2OUeVZj6X0Q4wgZOEQF6yIa0vexIUdlqXamd+6X5EIvpElhbsv
	 8d9YwWpqB5Jog==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-592f29e273bso1826671e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 23:52:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVHZgAh7osbcKWCI5JJ9GFEOqusY0iDgvAxhFXPe1GxRns8mi5TEwhI1EX+kcD4NYtX7tHD84Nj5474bQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWlMgeRwcWUqJ/FqxU0vZI7SfmrKL6NKxXYyKD2gI0CzLDX9uL
	G6hjw9uK7N39OOmucW0ZCPwF7vDV+eBEvk4z84rQzc0vYNwqN6LDWHPpdvFqD4oQ1u6AgLpptjA
	WFqj35WGPzpx1HrooxilXo8hrbrK53I8=
X-Google-Smtp-Source: AGHT+IGNsOV4X6EuU2Cx9uru+UgCvt2SHFfMKSEOF6DN6EwXXCSpNdERHV1a1hygRioO3zt9qFaRgV8Lq6fjNY7CVCE=
X-Received: by 2002:a05:6512:238c:b0:579:fb2b:d280 with SMTP id
 2adb3069b0e04-5941d56502fmr862097e87.42.1761893542935; Thu, 30 Oct 2025
 23:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251031024328.735161-1-maqianga@uniontech.com> <aQQ3KUap1cB73HOm@pie>
In-Reply-To: <aQQ3KUap1cB73HOm@pie>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 31 Oct 2025 07:52:10 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGxP_8FhZgD42iD-7pnnZgjez3mXkTZz69YAc5FPkLBMA@mail.gmail.com>
X-Gm-Features: AWmQ_bkTKSyKxtWJ5rxc0jSzCLTGDjPaQTsOxTi8sBWFe8oDoA4aQMGWz-6rHWs
Message-ID: <CAMj1kXGxP_8FhZgD42iD-7pnnZgjez3mXkTZz69YAc5FPkLBMA@mail.gmail.com>
Subject: Re: [PATCH] efi/riscv: Remove the useless failure return message print
To: Yao Zi <ziyao@disroot.org>
Cc: Qiang Ma <maqianga@uniontech.com>, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-efi@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_235226_856336_865F8B31 
X-CRM114-Status: GOOD (  10.50  )
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

On Fri, 31 Oct 2025 at 05:12, Yao Zi <ziyao@disroot.org> wrote:
>
> On Fri, Oct 31, 2025 at 10:43:28AM +0800, Qiang Ma wrote:
> > In the efi_create_mapping() in arch/riscv/kernel/efi.c,
> > the return value is always 0, and this debug message
> > is unnecessary. So, remove it.
>
> Should we make efi_create_mapping() return void at the same time, if it
> will never fail?
>

No.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
