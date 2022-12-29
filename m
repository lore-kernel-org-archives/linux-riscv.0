Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670FCC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Dec 2022 16:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=H5hRT5L7rEDiVZ/nqmVGk0qySxadz5pqBIciNdYtPyM=; b=LVYHuIdKOh3a194tx3ymgWarx7
	ogU6QBf+r5s1euzLWyryny6AKGyxSAQr4SyW/zLP8mjl6VqzCp+VBbqWjrPPsktm24xbmlKmD3SJu
	o4N/lBbzKiAjHrAylaEBrYBUDDG7Gn+Rx8IqBb6wBjIGZXFuHYlKGPM+wSxUpPGv5t8XXzjaPiofB
	VDu3SKTWMitZeQxMW1tNtf6uoaUpnQWSc53jzh5A0+OoAvLGImbQuEAhCzkd4EShKyA4SgVqCGQDT
	qQdY7k4fGLXUR0HmUeh62OiRmh3QKdEz1brG2FefMJl/Xud6zc230aq3/+dFm41OWpdbu0cxyeUUF
	xI2G0cOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAvhX-00HQse-8p; Thu, 29 Dec 2022 16:24:15 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAvfr-00HQ0a-4h
	for linux-riscv@lists.infradead.org; Thu, 29 Dec 2022 16:22:36 +0000
Received: by mail-pl1-f172.google.com with SMTP id y19so332526plb.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Dec 2022 08:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJWl3hQjQi1Q2dj4b8EWt43Qd/L5DvONqc85eLA2p84=;
        b=4zYH9voiUehp/MZKaq6EtNACAh0H6KL+NcDR1+JWFT9el9nBtDDy5s/Grp35vcGLTn
         mC4yxUvNQT9ZHM/fnM3ClqhCBAi/pKFY7/Qcu/cmUds0jUkq+e/XBfn4BWaXWCqY8mV0
         SJi5SWKcJyTnLbjM9Coh6TiX5jV0jGo7LzJ8aCPVGuaxSKC5AEbZE9P5wGvOIEplpmyQ
         /B+8dZfJYMOKYTZX0K2rz9JP3kktm/MRb4BQdxtt9nWP/c6GeDq0vU4lcn/xhf45s6Kd
         3BfqoRQirN2XyS81sZAEXUkf0HbsZruvKJkP4Nh6YrifVS51/U4OZ6ZA39eqwDvVSK9n
         qsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJWl3hQjQi1Q2dj4b8EWt43Qd/L5DvONqc85eLA2p84=;
        b=zSAxpHfChJaV2/wUkzAmRlF+RYFcSSjyZdF71jBDPir8TXyASzz1Ne+cJwAF1dKhXM
         Y+2EcPuU2bvXxOx6iJ7xDd/hY50hWINqOTwRgjtAiZFEHf0YQpYQrJO9noMTLiZBXcbu
         AwbdNdhdkIdSMqZ9yxM3dCzqLz/lg2ipFA9h4gYxwk02w+14DeXEO/BFRDtDkJen/qd2
         a2zQGE+ZcI8SavFBLcLALgF+DKAySuD/6IwAboYtsCEDHsb8R5alNlj3I1HFuUJayWte
         r1ASSGc7azfrXI/tz38J+12EuyWPNvrS9LydUnXYS7wBgW+S+LDY00VyZ0ei+6g33Dgx
         ziaw==
X-Gm-Message-State: AFqh2krjtYqr3HgRueFTxxQ/4sQOzBSc34L6fR8JTjvpWEtNCYon0639
	c8Xw/2w6gkJa03LzPY99PIPsPQ==
X-Google-Smtp-Source: AMrXdXusHRJt1gPOTWh0ukRoRRYv3CsTOwvtO5tJuONXzHi84yKZLmsYPBOK0toLmCX+j9QDQYJoeQ==
X-Received: by 2002:a17:902:e2d1:b0:191:cd3:aa6c with SMTP id l17-20020a170902e2d100b001910cd3aa6cmr39371632plc.34.1672330947985;
        Thu, 29 Dec 2022 08:22:27 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id o9-20020a170903210900b001782398648dsm13165941ple.8.2022.12.29.08.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:22:27 -0800 (PST)
Date: Thu, 29 Dec 2022 08:22:27 -0800 (PST)
X-Google-Original-Date: Thu, 29 Dec 2022 07:54:30 PST (-0800)
Subject: Re: [PATCH v2] arch: fix broken BuildID for arm64 and riscv
In-Reply-To: <20221226184537.744960-1-masahiroy@kernel.org>
CC: linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org,
  linux-kernel@vger.kernel.org, ardb@kernel.org, regressions@leemhuis.info, catalin.marinas@arm.com,
  Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
  dennis@ausil.us, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org,
  nicolas@fjasle.eu, Paul Walmsley <paul.walmsley@sifive.com>, masahiroy@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: masahiroy@kernel.org
Message-ID: <mhng-7ae63e3d-9a40-42ed-94c3-72fc9217ac20@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_082231_271989_2121EF55 
X-CRM114-Status: GOOD (  22.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 26 Dec 2022 10:45:37 PST (-0800), masahiroy@kernel.org wrote:
> Dennis Gilmore reports that the BuildID is missing in the arm64 vmlinux
> since commit 994b7ac1697b ("arm64: remove special treatment for the
> link order of head.o").
>
> The issue is that the type of .notes section, which contains the BuildID,
> changed from NOTES to PROGBITS.
>
> Ard Biesheuvel figured out that whichever object gets linked first gets
> to decide the type of a section. The PROGBITS type is the result of the
> compiler emitting .note.GNU-stack as PROGBITS rather than NOTE.
>
> While Ard provided a fix for arm64, I want to fix this globally because
> the same issue is happening on riscv since commit 2348e6bf4421 ("riscv:
> remove special treatment for the link order of head.o"). This problem
> will happen in general for other architectures if they start to drop
> unneeded entries from scripts/head-object-list.txt.
>
> Discard .note.GNU-stack in include/asm-generic/vmlinux.lds.h.
>
> Link: https://lore.kernel.org/lkml/CAABkxwuQoz1CTbyb57n0ZX65eSYiTonFCU8-LCQc=74D=xE=rA@mail.gmail.com/
> Fixes: 994b7ac1697b ("arm64: remove special treatment for the link order of head.o")
> Fixes: 2348e6bf4421 ("riscv: remove special treatment for the link order of head.o")
> Reported-by: Dennis Gilmore <dennis@ausil.us>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - discard .note.GNU-stack before .notes because many architectures
>     call DISCARDS at the end of their linker scripts
>
>  include/asm-generic/vmlinux.lds.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index a94219e9916f..659bf3b31c91 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -891,7 +891,12 @@
>  #define PRINTK_INDEX
>  #endif
>
> +/*
> + * Discard .note.GNU-stack, which is emitted as PROGBITS by the compiler.
> + * Otherwise, the type of .notes section would become PROGBITS instead of NOTES.
> + */
>  #define NOTES								\
> +	/DISCARD/ : { *(.note.GNU-stack) }				\
>  	.notes : AT(ADDR(.notes) - LOAD_OFFSET) {			\
>  		BOUNDED_SECTION_BY(.note.*, _notes)			\
>  	} NOTES_HEADERS							\

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
