Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E263C606A336
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 23:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fqhGKsh5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20260707.gappssmtp.com header.i=@dabbelt-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qSxG0q8P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ak+TcwHuiNVg2/Dmo8iQr2Kq5hiqa/8RKNcvcLjCbmc=; b=fqhGKsh52RDf7WRpak5SoCzWqM
	fpjk8JZ7kRLNPOEtHS2e7BYv47XAyB6nM9yrhkqV0fFpIXbaLgPg4KpunFyMNgLUwbaVz7pUfBDPw
	R8l4mgwQTvK3Ue+5G4cTUiWauhuvVEAoPeAES5fAbOC6rnxyU8Ni3KIVXFIkDPUyja67RDIj/tNXw
	+nTS3GYZ3DStroV0EfG1ArA1twBfix4Gb5OIKEtrC0raQqm/G0eZAAl97UaTJ0mhaAl2B2Y3+QFFB
	xQpThvZhD8hy4NBMyCmQ6vDqbFvo+V4+N//L3qROe3COWR1isJkZ7PS3kdSjZdIggVTZ1V/kcn0QK
	PWvtQM/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdAx-000000058At-32bK;
	Mon, 23 Nov 2026 23:10:19 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdAj-0000000585s-2nU7
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 23:10:07 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-38564b4b017so4110457eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 15:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20260707.gappssmtp.com; s=20260707; t=1795475405; x=1796080205; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1b1ocgQtSvefIuPciX0StsHzdHu/105xpXIeUHjXub4=;
        b=qSxG0q8POS1BcfMYY8WNylWaR4GJO62Qyk+lYQZH0leTriQDiKT8jXm+RHeRNcY2Hi
         LjOx+MQaw1yx9eEitz64IZc63S5IT0MDa4Tvr8C6cELpb+x5UdUNlKD80QqMLkG6Obc8
         /a/jrai0lBcNomtzZVfgt6/ibFv4UlBKfn24wKRL2kb5RR37N5Y0jQJJEMWnmRUnLwiO
         jTKVHyRwrTo9mROxwpQXMGq/10RqdC3lIP7V3+Db8J6q/lz0VadIxgOiv6ytIMO6XFG+
         Dcs1tQSYq/ySsh+UA9jAPrNN1hNDQXifKOK5hZ6pp5j2GP0L+o34j6I1ChkABR25IPA3
         acCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475405; x=1796080205;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1b1ocgQtSvefIuPciX0StsHzdHu/105xpXIeUHjXub4=;
        b=SDDKUyoOvg7whsqHsMeHJBhfD1jZo4lm11BKdQv3qTPr7EnIJWqV2vxJwe8qaTnSUQ
         yB5SOrcyOdTh7IxY8WIEI3DdEE0ElIlW85HGGwLMlB6c1/6BA6mj4l/jnh/J0VU2DvO5
         Lp8XPgF2aMmanFITK85dR57h8WQ6AS3GzopG+D4L+h0FJTSZt9Df4Gl40JbnaMPzsocc
         jQv66s1d4GtiLzeptdwLFQER/m+RvUQwyBVHrN/E6SnefnhLFE1oKOqq1+XCGxtPc53W
         bYZhflr/0NwnF+qjAqVaMHnN1ZMneSiLkngYNMZ7JUX15PZuX5YwLBOlJQTNYKARDYBc
         5u2g==
X-Forwarded-Encrypted: i=1; AL+hErG6GQcckWxhVrhabRlI5JHoulicDXoSn7yGNA8CswP7yVYBPtGFtaNKoEFbXAEQQ4YvI783pSguIS++AQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9BWUH1Y0khgeTSJDzTelun1nmEPV0iguV06IV5aoLFW0CDfw0p
	EVdeC8OuCMmzlbrx7L1a5vTwuwZP7QPxsUiJfipD6WR/XUQmNU6nGJBP84oMpS3KyDs=
X-Gm-Gg: AZFdTZdnuObWh6WG7JgLmA/jmE/4Ui2pxJg5ralLklLkvmqQ9STEOIqEa7/uAWZdYfV
	VIxdSc5WanqKQ6zZK1GQcUu3Kn3YcridV1r2yBHjq0A9OhMgEx18gigtw74rZBoT5mjbDvzMrdm
	ntQCF2ZbsKIFSaxuAb4zjSUxpBrVQZghy49DK8GR+FBSNDK6GtU7VfI+0pEJzZZg2UBiALbiX8U
	TAlrOUk8vlOpXofrlD0C3U0SbGE23G9vD5/D0e3EP33A34lTsGTSHqPuodH704uJrrBERo0OB5x
	OfufN/nICKo7h1pL+kuW0tMGf4D5TJwyETtxJYEIsdQpiQDAbTNreSI0kz5OER0CbMU1d08JPEJ
	Z0Kq4y5RDBYqDH6wFX5X+BMlWq3i8rHg2zXnteZg4nvcmhU44vGbmIFA8qFdpyaza6zNKKEmZrm
	fJ4iWjUJcIL+/wMFodd9qw1YZRbreHmPMrh9n8E0ZSgFPSk6Z6PYfa4sBUjbYpVVCnIjp63grP0
	MdvVUWH33AniLu1BqyMWVV1XGO5f8s5+XDbAvplIF+/bgKdFaHKpHBXLd5pgmUb7mjEHzmpCDzs
	CTLO6QeeWSym2BMgJdYGLg96tejYPmP2L32ymivjCFXu0VrXmf/d/9nPSVw3zkzdcnE681squsB
	CbS2lPWFK4oDbJzS2Hs2zMRAZ6Dg=
X-Received: by 2002:a05:7022:296:10b0:1b4:facd:5311 with SMTP id a92af1059eb24-1b5524972dbmr12954441c88.8.1795475404449;
        Mon, 23 Nov 2026 15:10:04 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm43512853c88.14.2026.11.23.15.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:10:04 -0800 (PST)
Date: Mon, 23 Nov 2026 15:10:04 -0800 (PST)
X-Google-Original-Date: Mon, 23 Nov 2026 15:09:28 PST (-0800)
Subject: Re: [PATCH v4 03/19] riscv: Make _text point to the start of the kernel image
In-Reply-To: <20261118182105.1633603-24-ardb+git@google.com>
CC: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  Ard Biesheuvel <ardb@kernel.org>, jgg@nvidia.com, pjw@kernel.org, aou@eecs.berkeley.edu, chenhuacai@kernel.org,
  loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ardb+git@google.com
Message-ID: <mhng-FE6551A0-F38D-4B01-9727-CAB9CE10B667@Palmers-Mini.rwc.dabbelt.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_151005_718657_DA5F2AE2 
X-CRM114-Status: GOOD (  26.28  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 10:21:09 PST (-0800), ardb+git@google.com wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> On RISC-V, _text currently refers to the start of the .text output
> section, which is placed after the image header (.head.text), and is
> therefore equal to _stext. On other architectures such as arm64, _text
> refers to the start of the image, and is used as such by generic code,
> e.g., to describe the kernel mapping in /proc/kcore and in the ELF
> headers of the vmcore, and by the EFI stub.
>
> Now that arch/riscv no longer uses _text to refer to the start of the
> kernel code, move it to the start of the image so that it is equal to
> _start, and the distinction between _text and _stext is the same as on
> other architectures.
>
> This also means that the image header is no longer omitted from the
> /proc/kcore and vmcore kernel text mappings. Other users of _text, such
> as kallsyms and ftrace, only use it as a reference point to calculate
> relative offsets, and are not affected by this change.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/riscv/kernel/vmlinux.lds.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index 1f4f8496941a..9849a3e4d102 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -28,11 +28,11 @@ SECTIONS
>  	/* Beginning of code and text segment */
>  	. = LOAD_OFFSET;
>  	_start = .;
> +	_text = .;
>  	HEAD_TEXT_SECTION
>  	. = ALIGN(PAGE_SIZE);
>
>  	.text : {
> -		_text = .;
>  		_stext = .;
>  		TEXT_TEXT
>  		SCHED_TEXT

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
