Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EDBC3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 11:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPVXh7mawQxKnJg1cUlnh7bfUueLnc02bqq2e8S9K1w=; b=Z/VMPAq1q5K3ZT
	cGkqUMx8kl4DNfDcwFCNVKy0Dl0pM22z+/zYhriZnybVcu4asSKWkzM9T0pRFLm0l/zwRmXLrcpYw
	OGBjKkLySn5L6Mfc05LQzvsAoR2Tp3jHKRL7sdndB0l6onf5+NrSB12vHGa7+9+rbpCrimVUInmWD
	KdPNZndo/2lsPrmh1eUcuJesGEK8G4d87tOGeT+KIzLg679ppWl9N40QkwbWTW+/srFCkcAP+x4KG
	ogzGzVnkLkKqt3Fh2paJe8Pvf2nWNvF/x+IzZAAtNWHREg0LEsySopgWg82ssXjRu1KN2mf6gLsq7
	gJ+JjeeGCaWAbHFNFNzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pvS-0000000AFNg-3RJu;
	Thu, 10 Apr 2025 11:18:30 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ol9-0000000A1yn-1CzM
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 10:03:48 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so857625e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 03:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744279425; x=1744884225; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuhlYfO+SCuG1tPDw0icZEsvUHv3NYtA5HOyZj159xM=;
        b=GfzS321x5lx6VMC2dMybIIwmsimssQf7DZS1IxFbY1l0ezquG9l/xXpz8O9wPuUPva
         NnwVtZTG5z0Tp0fJPgpTz2mHdx8yM0+YSyBN8ldgfP+1DEu9A20J+n8zCH/jbGMjxcSx
         wqq8y/zB8odOF9BzPcKSdeuwbXJ16so6Ir3R/Y8Q4LEfoqW9Ud+QHfI0QjSP6sm9YV/b
         2OeXd1wTmCWeMu1sLanixy5HqLdyLnd6YLhn0a/bpzfZ+9msFnGG2Wh3dUNbWC3ubl00
         I/f46hlPekETYCiveFovjktl8i5odyhBmXoJpNjrxqo3CnrKCeX1k1wVat16aFHziIuk
         af4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744279425; x=1744884225;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yuhlYfO+SCuG1tPDw0icZEsvUHv3NYtA5HOyZj159xM=;
        b=knldl0YOUp2LfHqVseUcR6eOy0V0ZYPx+cgg9JoP9xjCcDJNXddCQSOJREMkNnehqe
         1oj0kLAtPHDIxLLQwr5IAhnfHol8IusWR79ThwMgrXhGmmeWclfUp+wIFZgGPX/R3Dt6
         AM4VOgMhEz6EIkfvc0wwzujVq+1RAOpLFhmcZGIuBIVITw9Dsz1gbNxQedgawqAjBSoR
         mzVxPPr1235I50HJnpgxWXp8JQamqF3m+8/oTphUQtLJBSLZDfKYRqLcZ+EFZ+OwhrMH
         5HZxb24vt26iIGJkECJZgB98FNLH6gET0b9M1/Kpzx39pTNTFIIKm81DDk+tozyFd7VC
         00GA==
X-Forwarded-Encrypted: i=1; AJvYcCUtvmy1RwoIh1d3eQyKvJZ1aS/VJKfCnO+Vkem/2LUH9rCnWGPkeMytdJH2yLuZlpkya8EnhXm5lN7VXA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5UMbXKWn/tsJl3YKPrOpsnO8G+lw6d3aSzlxrndjTWXH9n+z9
	AOXiNWb/qD4q2vLqawLG8QT0XAJMYcFVmQJqnpUAw7U77vRDINfqKFN7v7aAUq8=
X-Gm-Gg: ASbGncuf2qldTj4neK6Ulcxcf66MrXYq1dp941QSUW6ieAqHJ06mug+ksBH8Oz6a6+6
	bjvdcYvPPkoOYgThM3f0Ja0k3SZuhvJgA0JL+FvrQDKqbjeB7y1ylZ/H8qOWeMHMH9TzGtjG4Bk
	V5ctS2p0jlkwC2tOKzIXIqY+7x4FqPiXYkAIe++ojsaRqEH2yCwTlYZRqggixPret7u4/3CjRCZ
	Ys5yyv4/jtLOaNr3Ni/NpO4lF+pjxdfUP6tPDZ4v6uZTmppefiU2Gmr4k0stEtLLqMWWM0oTFuG
	lZyxH9MrFVO+kyNGUQBWFbKUA6vGFxjvG+ykTJqvzrQZbptm
X-Google-Smtp-Source: AGHT+IFucTZsmmGzPkhUaQ2Z/vAwZtrI/ji5V2QIPWKukl3A8249XbRp5GqSbF4sFE7Q2Qv5hdQlbA==
X-Received: by 2002:a05:600c:3d0c:b0:439:a1ce:5669 with SMTP id 5b1f17b1804b1-43f1ed4a7a9mr22097145e9.5.1744279425469;
        Thu, 10 Apr 2025 03:03:45 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:7d22:13bb:e539:15ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893773a0sm4273653f8f.25.2025.04.10.03.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:03:45 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 10 Apr 2025 12:03:44 +0200
Message-Id: <D92VG9GT3W5D.2B71FBI67EYJ6@ventanamicro.com>
Subject: Re: [PATCH v12 06/28] riscv/mm : ensure PROT_WRITE leads to VM_READ
 | VM_WRITE
Cc: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arch@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <alistair.francis@wdc.com>, <richard.henderson@linaro.org>,
 <jim.shu@sifive.com>, <andybnac@gmail.com>, <kito.cheng@sifive.com>,
 <charlie@rivosinc.com>, <atishp@rivosinc.com>, <evan@rivosinc.com>,
 <cleger@rivosinc.com>, <alexghiti@rivosinc.com>, <samitolvanen@google.com>,
 <broonie@kernel.org>, <rick.p.edgecombe@intel.com>, "Zong Li"
 <zong.li@sifive.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>, "Thomas Gleixner"
 <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov"
 <bp@alien8.de>, "Dave Hansen" <dave.hansen@linux.intel.com>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Arnd Bergmann"
 <arnd@arndb.de>, "Christian Brauner" <brauner@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Oleg Nesterov" <oleg@redhat.com>, "Eric Biederman"
 <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <shuah@kernel.org>, "Jann Horn"
 <jannh@google.com>, "Conor Dooley" <conor+dt@kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-6-e51202b53138@rivosinc.com>
In-Reply-To: <20250314-v5_user_cfi_series-v12-6-e51202b53138@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_030347_324582_DE445D54 
X-CRM114-Status: GOOD (  12.13  )
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

2025-03-14T14:39:25-07:00, Deepak Gupta <debug@rivosinc.com>:
> diff --git a/arch/riscv/include/asm/mman.h b/arch/riscv/include/asm/mman.h
> +static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
> +						   unsigned long pkey __always_unused)
> +{
> +	unsigned long ret = 0;
> +
> +	/*
> +	 * If PROT_WRITE was specified, force it to VM_READ | VM_WRITE.
> +	 * Only VM_WRITE means shadow stack.
> +	 */

This function also changes PROT_WX to VM_RWX, which is effectively not
changing anything, but I think it deserves an explicit intent.
(At least in the commit message.)

> +	if (prot & PROT_WRITE)
> +		ret = (VM_READ | VM_WRITE);
> +	return ret;
> +}
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> @@ -16,6 +17,15 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
> +	/*
> +	 * If PROT_WRITE is specified then extend that to PROT_READ
> +	 * protection_map[VM_WRITE] is now going to select shadow stack encodings.
> +	 * So specifying PROT_WRITE actually should select protection_map [VM_WRITE | VM_READ]
> +	 * If user wants to create shadow stack then they should use `map_shadow_stack` syscall.
> +	 */
> +	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
> +		prot |= PROT_READ;

Why isn't the previous hunk be enough?  (Or why don't we do just this?)

riscv_sys_mmap() eventually calls arch_calc_vm_prot_bits(), so I'd
rather fix each code path just once.

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
