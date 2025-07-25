Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88896C87FCF
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jul 2025 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SlK5tNjntZFshpueJa7q1DjKLfLkrHbLRmEktiaVZ8s=; b=mAP4Z/2jHl2cqw
	hnfZQp73/ZGUZgAPbt8dusDinfl+4AMdWYOZBx0zy13krpHSG8QHnaA64NDuaonf7HLhMsNxIx93r
	zqoGfEkvSpscCCoTh64wyTQsmyGnn284R4TwH5EehNq26u3Ny5m5xQbOutllV521li/j/qcNX2MUz
	3IuinU4/L1fiHzaBsiIZlqhLzwMHcGM69ey0sQCGB8Wpm/WmCpuhiv5BRIWJGh7w2jYxTakadyTRT
	OIOwGkgRCjXwSRq7lM0dUwfsIlWA1SJVoHMjZJWw+b9ZpiWCU11F//7gup34ezALasif5dixa/Kkj
	9/hF7FY2n/tugDDQIkPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKQq-0000000A7B8-0Z0h;
	Fri, 25 Jul 2025 15:34:00 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKQo-0000000A7Ag-0Qot
	for linux-riscv@lists.infradead.org;
	Fri, 25 Jul 2025 15:33:59 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-237f18108d2so205635ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Jul 2025 08:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753457637; x=1754062437; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IMrTLQB9tEMEJbnJ/xHH9mm9yGwT1IOyIE5qrsMa5ek=;
        b=nprWyiC4z20gMTTKMFyJsMZYN8djvKg8s0jLxb6sxONFc/neO5TsDohHFlE6xwjBm6
         LAwimXfY6ubJNbDM1AQyt2R0De27vAUbtL8Y2rIgSeub8vaJ1p/LvJoM4TXsEcDgTA1/
         GpjApksGFleVSX7ho+w1djlwAwKaZEdfoy5wp9om/46zVYLv6EfymjD0GT352RbsHaM5
         hJ+4ICXs1c0AP/uxfArlgl5XCYAv68P9s1ERhuoUvTKBM7FTRSoTeOVdSHjurfT2wWO8
         sIM4frRfWhfxIsazbGB/UkbPohZhXy7eXa9dnxK77wNrhC2jF5hTjJgJElT/7C/6Bh79
         JY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753457637; x=1754062437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMrTLQB9tEMEJbnJ/xHH9mm9yGwT1IOyIE5qrsMa5ek=;
        b=aHpKPAM61RW8U7QQQEa3gAVmpJHCk+/+PKu6A9CeH7k4FLzw/PMvVd+mptLJv8CGcK
         tVFl94o/AtHtmEg7USLWVkGEVXQhxsr2zTiZJryJsVjPzRIX9OZlEumJnev5vlbidDXL
         hmuXGZ1cvGH2lMyq63EesZ3NhXeeZSlViuotlbGxI9VSanMZUrGTcGfFimzlQd+q+3f2
         M5HPJexnvY0VxAhXoUEUocowwFs2vWE1Yv/mvdo2yuchZMtiLS6bzRhvvKnDF9m2dC8k
         DmZya3yo5+U/jaRWbSYGASs0dhNJ2IkuPCFoVKwIKIUmQxKv8w0mjP7nLR5iPEcxTbE7
         xhxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuyG2h5t4RsHzEH+dVIzeqWUjxYY7ChTXOtgLM0kdKRmgMzqMeuJBqkZZ6IhYnb8hRB6pwaYjUi/7Z1w==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk/LeHYvOFTFxtKtoj7Bqth080xO3wnc+JRykcqMWtG23GjItL
	GHBqDwQl6ubfxhWoCqQnT62rFv6bHEZWihZx70QcMlgU+eRJ1x4T0v3JBkkiuLwWdQ==
X-Gm-Gg: ASbGnctretavnp+IXRJa61zEFkhOOm2GnMrNTSsZK9YvfiHKl/W0jd4mhbP44isNApD
	H5RAY39o1VtAbUClaRfAeZvU5/IJTv1mHjheQulP0kXRn6w2uzScOPDvjKDtNmgVTEFCc7hF444
	QQHnTr3orofuBcZc2gmjBhUyYGRQwh7Ng1uww/XnBTb8il57QHViwRDWOPcwCedHtvIs832RaSc
	ZOr31cguFKN0/1+wF7jYCfSotrMimKaIgk4YSTvBNqP7bow4DII7K79LC7XaHC1v08qfwDkY1bF
	VxwWSXrqd0uAVKCt0YsOPW0RZ3dOrZb+H0wEZF0Fq4mYVX3COv6WeCbNZ/5KuQVVlEfvz6h81sT
	PBBgNdsMRCal448W7d7t7490Uo63pAYbyGFL29c8YSvTj4vk+RiehJMKKfNcIY7L8Ag==
X-Google-Smtp-Source: AGHT+IGqwy+SyKapfsDhV0SCrakv4CqrxfO6vBXV3nKCxXlckVrSgte7qwyPNubIbBY6dQEWJppRvg==
X-Received: by 2002:a17:903:2d1:b0:223:fd7e:84ab with SMTP id d9443c01a7336-23fadb22253mr3447835ad.24.1753457636899;
        Fri, 25 Jul 2025 08:33:56 -0700 (PDT)
Received: from google.com (106.81.125.34.bc.googleusercontent.com. [34.125.81.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe4fd692sm86545ad.91.2025.07.25.08.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:33:56 -0700 (PDT)
Date: Fri, 25 Jul 2025 15:33:51 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 02/11] riscv: update asm call site in `call_on_irq_stack`
 to setup correct label
Message-ID: <20250725153351.GB1724026@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_083358_141386_78E8C1D2 
X-CRM114-Status: GOOD (  16.58  )
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

On Thu, Jul 24, 2025 at 04:36:55PM -0700, Deepak Gupta wrote:
> Call sites written in asm performing indirect call, they need to setup
> label register (t2/x7) with correct label.
> 
> Currently first kernel was compiled with `-save-temps` option and
> normalized function signature string is captured and then placed at the
> asm callsite.
> 
> TODO: to write a macro wrapper with toolchain support.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/kernel/entry.S | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 2660faf52232..598e17e800ae 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -389,6 +389,7 @@ SYM_FUNC_START(call_on_irq_stack)
>  	load_per_cpu t0, irq_stack_ptr, t1
>  	li	t1, IRQ_STACK_SIZE
>  	add	sp, t0, t1
> +	lui t2, %lpad_hash("FvP7pt_regsE")

Ah, I see. The plan is to hardcode the signatures in assembly code and
keep them manually in sync with C code. When we implemented KCFI, we
thought this would become extremely tedious to maintain after a while.
Do you have any plans to add KCFI-style __kcfi_typeid_<function> symbols
that would allow labels to be determined from C type signatures instead?

Sami

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
