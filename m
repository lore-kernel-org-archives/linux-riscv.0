Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFD0C02183
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ri/V+sW1/NKOFOjktDf8pwGJmpAfvYngyzxVHi74SW8=; b=CEQ5nton1jqR7R
	wElsbigeKBXzacG8EBZs3SGKwy1exL/DnrKIuyEqDwOeJ30oLMM22ZiKU9aiJvPs1czI3S0uHWTpx
	RT1nan0NfLXOh8nUG4sRQz6H1DuPaoB0Nr0wMZPcG4eaEzEdp1ipt1J9QcN6dh2CigITzWj1YX1NU
	oXIib/WvJ8PgZf+mZB/Nn9GT24zi5ZtHT75AUZMIB6Np5FZRUXUqt793dXE0ipgqCPvN7W7u+NSYy
	GKTwujyLSlKpIwgwxMjAB8uM2LuGh17fcm8lfvJw9MGYgNGENYALhQKMrV1ibLOZ1Q2pJQDMLyius
	t0FU8mHCl+LU2diQVp6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzc4-0000000BISY-3EFd;
	Wed, 15 Jan 2025 09:23:00 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzWX-0000000BGEH-1XRq
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 09:17:18 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43635796b48so3648255e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jan 2025 01:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736932636; x=1737537436; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPR0vSrKJLMo0r7/wQPbLykYZGu5on6q/CBisXInbBg=;
        b=nW+1DdUABYL96OSloVTF/k65v+chOxWEuPIwdpfWbfh2F7KTCUEx67PoCnZTfCMBhv
         yb8d2KPF2NPkiqTsyWFT8TQKhFCovVE47OkgJRRNvuEyBRaLcXfrCazo3tNomMMxV6X0
         xd2iaZoAL/YqobhwBOl1ATcx3WkOMGQNORcCoJrFSZZp4HjIQN/i9ChGnJxz0Mx+8AZj
         nTu2gmpN2T/glLu7P0HlOgxWKbHgMz0CZCFgQuQVuBGRy/RDbEqtH67mweT7DK9iXpMc
         GAJCtTlQ/JkbF/XbfuUQK8gPkruW9nblnvvvc/WURD7/KJPth4HlPNvSqjDhkBGkCzK1
         LPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736932636; x=1737537436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPR0vSrKJLMo0r7/wQPbLykYZGu5on6q/CBisXInbBg=;
        b=Rq3tpPY7isG6X9lIugSd93Z305xQmjFUL/gDjhE4DGPrASXNU2KHXOScY3gjKNtN1X
         Vdf1VHqP3okdil7mOudr4zNXwbOGx4Jl32TBPslXzq2nmabrMKSesLFgoOFmLc3NG473
         gOhoAsSnwIUjgEZc97Xf0Puoax1mznzjDNcfRrRsCa1A1bjO1C20Rs/K0tTVLpqhg5IB
         6bhbVGC2q2NT5bBm/CA5uTMv3SiTEMAZVAGG8tTVe7vj+QhGcdYQYblid/MV59cIgUT2
         xDe6itmDA/0+foxzuzL2FRwozbKNoujoXpEqRvwUk/eeP1vhyjM9sA/POlp/GUSLdN2d
         rNeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXllxA0oOGinMNDI3FfKMNfsSNdjKB27O33QTB0++KVMk8fsZnvHMsfxjFxsFNj9MTdcD9Urs2CoIZWdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZMXzlP/068EgcNfNjWeTmlZzNinYaANcn84nBBwxRjFfkfRfu
	baSP1COmA2IlBMSX/cB/sAMkKf3lUAT0ztK/9HRUJhavCfNdaqiIWKWi6QuXZRw=
X-Gm-Gg: ASbGncs0WBgPijv4WP9X9RUM3JUjWmUFW3jjAcGDiMeEVUUlOO4wQYSTdNh4iAEvgP2
	H369c5F66soRAS8M8884aCwSrjPbUbw7pFpAjnFKZkOM8VoNoIPAMvwEZ9faKxMTQj5XhH/Bk0L
	NVvYwBQSVgeoFLlUEba7gx/99AJaW1hWI2zMRmnssOOvZGNW2s8DZifSWn5g86oxAtukoN776Xm
	RAV+KAckckzyHl/dCgkHrtrJpPEhEOytzvyNs6+5Tf/w4z2rL2FQ8TIt/yaa+HgkGdv8Z5JZMKb
	Vp1ru5AxCbmEexarpReS6fwvwRUQT/3f8M6j3DLqdA==
X-Google-Smtp-Source: AGHT+IEKwUbajcfYL3oDiXKeywStAiA7ujSjd3p63sWc1z3chviVk4GQ+jyIXySBHFmI84rSHpJJ0Q==
X-Received: by 2002:a05:600c:c06:b0:434:fe3c:c662 with SMTP id 5b1f17b1804b1-437c6b26e74mr15223725e9.12.1736932635833;
        Wed, 15 Jan 2025 01:17:15 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ad59fsm16180155e9.16.2025.01.15.01.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 01:17:15 -0800 (PST)
Date: Wed, 15 Jan 2025 10:17:14 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	samuel.holland@sifive.com, shuah@kernel.org
Subject: Re: [PATCH v5 2/3] RISC-V: hwprobe: Expose Zicbom extension and its
 block size
Message-ID: <20250115-6a3da5301a44634ae704491f@orel>
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
 <20250115024024.84365-3-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250115024024.84365-3-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_011717_400950_94C34272 
X-CRM114-Status: UNSURE (   9.54  )
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

On Wed, Jan 15, 2025 at 10:40:23AM +0800, Yunhui Cui wrote:
> Expose Zicbom through hwprobe and also provide a key to extract its
> respective block size.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>  arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
>  4 files changed, 15 insertions(+), 1 deletion(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
