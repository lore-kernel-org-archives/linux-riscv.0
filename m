Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD4BC3ABDD
	for <linux-riscv@archiver.kernel.org>; Tue, 20 May 2025 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Viw84d+iA4Woi1izAdR7KGAg96nH+Uz4/roQdYt1bdc=; b=LNgKd6q9XLKw/U
	fpPz3lPOti4l1EaD/wfNj5iQprPT+Gsd0QXzAJSADlX8SQ1zU+G2DISkncKu248+UXpsT1B9LMyw8
	KyQYTjG2hndfBOyovN/9hKljaDq5FiFAj60hAImiUx/2xikv5QAtcQN1xnSaIwYQ9uGkmv8QnvSnj
	x2/NnCjV53kX+J4UrCfaOKk9uyRAomhwyHWga/Brs30hIuR2VZiGmho+WjeHR1eCDgLaIsP6BEB2r
	pIA22BsoJOufBJ9qmhqQ/ENVANFqYKaFZx1qxm4CwslhrOYjVItENWot0U5dh/dkZoGaqP24Ah/Ef
	K8NXiWEphXwOZzkIRy8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJSG-0000000CDrJ-1XE4;
	Tue, 20 May 2025 09:40:12 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJFO-0000000CBnJ-1MaJ
	for linux-riscv@lists.infradead.org;
	Tue, 20 May 2025 09:26:55 +0000
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52617ceae0dso1434690e0c.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 May 2025 02:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747733212; x=1748338012;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I35pJzfJnVpM8mnqD+jIZ0IpwIQDyk5+35hdygHMvDU=;
        b=uCHxXJjl1rVuCJKS5Vfb22bNrLIkEKoxPgzy9DBZNdu1URBc+YngaGs0pSaYHTxGdW
         E+CXbSf1EblP1z/YuxEr1ZjUxXIZ/Wr1yMfBEAIVD48qc9yL9G4ShI3Fp0/pV50bnjio
         yZjuUkRUsq86iBDpQpqVXGvZEGS5tGZJqmA3cRtUZovSLlnRWO349P+1zjjEXRBdH1iw
         xBgp06NECeFQeNbYkMqA9LKt5eFKQMf6cZUE7D064yHIzcr8B/A4669gUFPvKQL5gJ0y
         PYqUCa0Ok4YcABR2BNh0ULGCRw+peZUkQoOi1uoY8qlcnrZFadKEzS7Ea3pwkfKaaMCL
         bK2g==
X-Forwarded-Encrypted: i=1; AJvYcCUwzq6jKSoZkF/pWrwgmXAWQ1ldJ2yPxfTjFJsWyoivJgxFQzJZsjulmeQFkT09xYH07SJPUOOHiIAYZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcRDQwaotz8gwebY//z0wRlMGfV7furiFS6XW0BoNha5oj0+Lh
	FZlJr0OkMOLZTpQmtKsoAn7WxFc3ddKk9mZqV23U7kBz7FhoUoG/y6PWw8Uogu5X
X-Gm-Gg: ASbGncuQCpVKBKTLNda30xXiaAFJ9HfiKcunFyX7pWHcDmevutEjNoCgGMQ4TpRsyRc
	+sBsVFCAyaAup+1N7OMt5PUc7bxQd60R6HNDAYRjSyZX3o3RT/z/WJ8RRq5yasnNQiAM7s9rZ7O
	wQNyOmfo9e3YnX1m4uw9fy+n/oP7ucZxO8263ucrCFYKf+CwCLjGXjBtHRBP2S33wM6xU2Sc+vd
	pjWwa7kb/EesdAd7/G1ma/H7tlTM4YMV6xv5WPgL5ELJePd8t1r6cyNE7/55vMAv4zj6VGMEv4A
	IGoOA0+odlPFC98ZcdPBs8suu41X+7LVeUnsRt2FWnUioaoDg2TSfiKtjQ0y8gtYHrM55I0zg6g
	dP9I273oWq6H+TCICcA==
X-Google-Smtp-Source: AGHT+IHUtAgZMaogkyonpS/UP271HF2JVHApSW0XOi97rIsgMd6Nct4wcfIsnc/BJNb6+vvf/zN72w==
X-Received: by 2002:a05:6122:4b11:b0:52c:4eb0:118d with SMTP id 71dfb90a1353d-52dbcceb24fmr12097554e0c.4.1747733211570;
        Tue, 20 May 2025 02:26:51 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4ebddsm8101566e0c.33.2025.05.20.02.26.50
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:26:51 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-52617ceae0dso1434655e0c.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 May 2025 02:26:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWysVdGOHAPS18POG7HtnZ/NNGsrieH9KDUyaR1a5PtfmhUbRixsvTnmLXHHvVOv1ktsffwSPofuy1gSw==@lists.infradead.org
X-Received: by 2002:a05:6122:d16:b0:529:be0:8353 with SMTP id
 71dfb90a1353d-52dbcc563e6mr14351261e0c.2.1747733210548; Tue, 20 May 2025
 02:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250516030310.16950-1-cyan.yang@sifive.com> <20250516030310.16950-3-cyan.yang@sifive.com>
In-Reply-To: <20250516030310.16950-3-cyan.yang@sifive.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 May 2025 11:26:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVoUx99rK3bZZnpTh699fQouVfmTfzvuM_UfGS=PAvW2Q@mail.gmail.com>
X-Gm-Features: AX0GCFszGmUcQtLoTyNNFovF2YojcjcAcPR9b8MIsnl3CFxsjuc5ApH7U3El6W8
Message-ID: <CAMuHMdVoUx99rK3bZZnpTh699fQouVfmTfzvuM_UfGS=PAvW2Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq
 vendor extensions
To: Cyan Yang <cyan.yang@sifive.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, samuel.holland@sifive.com, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_022654_369603_5EE5DB59 
X-CRM114-Status: GOOD (  24.00  )
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

Hi Cyan,

On Fri, 16 May 2025 at 05:07, Cyan Yang <cyan.yang@sifive.com> wrote:
> Add SiFive vendor extension support to the kernel with the target of
> "xsfvqmaccdod" and "xsfvqmaccqoq".
>
> Signed-off-by: Cyan Yang <cyan.yang@sifive.com>

Thanks for your patch, which is now commit 2d147d77ae6e96c1 ("riscv:
Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions")
in riscv/for-next.

> --- a/arch/riscv/Kconfig.vendor
> +++ b/arch/riscv/Kconfig.vendor
> @@ -16,6 +16,19 @@ config RISCV_ISA_VENDOR_EXT_ANDES
>           If you don't know what to do here, say Y.
>  endmenu
>
> +menu "SiFive"
> +config RISCV_ISA_VENDOR_EXT_SIFIVE
> +       bool "SiFive vendor extension support"
> +       select RISCV_ISA_VENDOR_EXT
> +       default y

I guess this has no dependency on ARCH_SIFIVE and does not default
to ARCH_SIFIVE because this extension can be present on non-Sifive
SoCs, too?

Probably I should have asked this when the other RISCV_ISA_VENDOR_EXT_*
were introduced, but at least for ANDES I already know the answer.

> +       help
> +         Say N here if you want to disable all SiFive vendor extension
> +         support. This will cause any SiFive vendor extensions that are
> +         requested by hardware probing to be ignored.
> +
> +         If you don't know what to do here, say Y.
> +endmenu
> +
>  menu "T-Head"
>  config RISCV_ISA_VENDOR_EXT_THEAD
>         bool "T-Head vendor extension support"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
