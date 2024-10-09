Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C90CED619
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 07:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDH1+J910hKsSyhuRyAGRp5hiBlN6R6pDpqhjTFyo4w=; b=O9Basg3P7Z/DpQ
	Ajg5sGWKm57PdVhNI809Ag0m9C1HTV/QobbXugUuiM7KE63+58if0mPwSjlGbw2TceNMi3kNWaXZ5
	rA/yV8X+Yma6sIxUAx+WY/Tsp6CcLM2iNaokkIpoaS0YKOsmuKVM+3yqmJ5zLuRxq4aZEUtcYi49S
	5oMeFWpHBVH2OhV+ELv5p8knKeCidQrdb3leee53uh/sNwF1h7Akv43xhB4wQyHce8QdcGA5rhxqD
	9gfHBLIJAaz7YqbKmH+er+ngiUqPVuDBT0XAuNV3HBzzHBjM7GQ4oFzxJrWEbSrAjslWDOIGI6w7L
	VQcrRpQmfQ154PpMHhPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syRHe-00000008GWa-3U9C;
	Wed, 09 Oct 2024 07:38:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syRHS-00000008GU2-3pr8
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 07:38:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0E2B8A40EDF
	for <linux-riscv@lists.infradead.org>; Wed,  9 Oct 2024 07:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF25C4CED0
	for <linux-riscv@lists.infradead.org>; Wed,  9 Oct 2024 07:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728459525;
	bh=2RyF8nwj/cvj+E/yNHIotQjQzUIGEOP30JiIx6mgg60=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y68iUmg4iTAoNbzCOIRIx2DkZgcWD53ucRl+6P7R7YQIBRiWytzrL7ms8GP+wsOV2
	 Umvowb3hgIeSM4AEKMEdw8V8VxkV5RClShLG8ApzvPueaDCFN/5rAY0sc9jsxgNOaz
	 jUyeJJDCLn1rnAY9A5RYHW+XhhNdOleQs9Dc3hjvphYV0zgE2+50Y6LX+sEKGhcjOa
	 jVHI0vWLNIpGJlUrXC3Ada421ZdRDvx9IZYFXWXZGpUFUdAbr66T6Qli4nMXlg7ZiV
	 QnuSwuUtqhp/nqJBnTYg0n8qy/XcyR+CLg2bNHYyJMnJEG1HT7urY56LZD/5An+u4d
	 p04k+y94Sht1Q==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5399041167cso10356315e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 00:38:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAJR16n3YCWluMlzY6gG4oK4FSYRk+//JMOxBTql1ZhQk+EacjlTEkuqZWkXwZg8YvnK3jwFOW+/xJug==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMYuofyH8JdLyPo6IClnJgbivfuv3zCNF4PPqRivrQT8lluzYD
	260KVbjquBoiqk6+5lqq+KyC1pGDar1DkGdGSEckEmNoFBhnXyjgIULkM4fQh4hWSzCUYRX1r3E
	ZR7XT5mttpyIpTUCr/KtcdEkv0c8=
X-Google-Smtp-Source: AGHT+IFxOX0737Ws11iCI0Sk/iqlwtLiRNezGiQM/0njq7wd5LtZKlh9lMt9mdRUL9ZhtXZxXaQ5G6n6C3s2PZdsI6o=
X-Received: by 2002:a05:6512:224b:b0:539:8fbd:5218 with SMTP id
 2adb3069b0e04-539c4968223mr1196233e87.56.1728459523690; Wed, 09 Oct 2024
 00:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240929140233.211800-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20240929140233.211800-1-heinrich.schuchardt@canonical.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 9 Oct 2024 09:38:31 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFs=z6AYJm=2La5C28snjz5DSq24tApBDReQEbk1eAOhQ@mail.gmail.com>
Message-ID: <CAMj1kXFs=z6AYJm=2La5C28snjz5DSq24tApBDReQEbk1eAOhQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] riscv: efi: Set NX compat flag in PE/COFF header
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_003847_099254_7FEF4326 
X-CRM114-Status: GOOD (  18.06  )
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

On Sun, 29 Sept 2024 at 16:02, Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> The IMAGE_DLLCHARACTERISTICS_NX_COMPAT informs the firmware that the
> EFI binary does not rely on pages that are both executable and
> writable.
>
> The flag is used by some distro versions of GRUB to decide if the EFI
> binary may be executed.
>
> As the Linux kernel neither has RWX sections nor needs RWX pages for
> relocation we should set the flag.
>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Acked-by: Ard Biesheuvel <ardb@kernel.org>


> ---
>  arch/riscv/kernel/efi-header.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/efi-header.S b/arch/riscv/kernel/efi-header.S
> index 515b2dfbca75..c5f17c2710b5 100644
> --- a/arch/riscv/kernel/efi-header.S
> +++ b/arch/riscv/kernel/efi-header.S
> @@ -64,7 +64,7 @@ extra_header_fields:
>         .long   efi_header_end - _start                 // SizeOfHeaders
>         .long   0                                       // CheckSum
>         .short  IMAGE_SUBSYSTEM_EFI_APPLICATION         // Subsystem
> -       .short  0                                       // DllCharacteristics
> +       .short  IMAGE_DLL_CHARACTERISTICS_NX_COMPAT     // DllCharacteristics
>         .quad   0                                       // SizeOfStackReserve
>         .quad   0                                       // SizeOfStackCommit
>         .quad   0                                       // SizeOfHeapReserve
> --
> 2.45.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
