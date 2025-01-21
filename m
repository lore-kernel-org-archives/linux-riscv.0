Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F85C02182
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 15:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNBDao0k7FdfbWANp2wIyY/32BpKZ/GZkcY1ZYYaWdM=; b=MwRtda67GQ6AK8
	UOIUBesCpuAc1AmeAqgDCNWsK3B9VXOh/JN8gPokjioYM++o+bpAz2IhngJ8N/8hIuFUICY+hOcmF
	+iYpzJIgKakEnB24SLGLnB1GaoNkb7y54TlkFf4o0DJRs6DwY49dco8UelFOHEmnNsHIxUo4oUWfu
	33hTcF57IuXhE8veRlSqz75nrzOfvekaf1q4hktmkBCpkYJw22mGH8YjED4D5RHSK7TF1tAE84iIm
	QwYCfxNKbuO2gtCQLUT079I/T5ITm6na0um+MJ7NrZB762e0J6WTIOZ7iaM1ajVyGk54yJToOfVhi
	dUMZQbVqJSU5BDqJvrCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taGCt-00000008E3s-0Aoy;
	Tue, 21 Jan 2025 15:30:23 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taGC5-00000008DpB-2gPa
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 15:29:34 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso40455515e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jan 2025 07:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1737473371; x=1738078171; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A+SyMEFDuiz5jdFoFAlcZaoDQi4XryVJWeWGSbZvojI=;
        b=FS6xQk4ddFlBEJTZZVtutWvS4L0+3OybwXeqMgMFKctW1UkhSKJVoZiFhX7BpEw8Za
         6x6+Ke46un0FwnBOWEDZ5DZ91LA2m8L2mF0U6/EsgqU9oXT/4ySfMRPP11qeSyhHP1Ph
         9bJFBwsFWc/EnhocM2A3t5wvP6JGwZcSILcRdfizOZ+Il5RgA2NUl8bP4BrXZfOYGVsx
         vmDuJiKSQ91E3iYHk84fNunPjWz6OnHnFKGmjhIsL5WTo5+NyIetZs1ODFnyTVNfIbpN
         DVqJMrnPL6Se2CyKZBaGEp4toHdwKHNC5dy7BkoXYGGOVlgbb0yDTuQmqeW/l7d6vVde
         h/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737473371; x=1738078171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+SyMEFDuiz5jdFoFAlcZaoDQi4XryVJWeWGSbZvojI=;
        b=SuYiTKWlnNyXKshNLytwfV5EhLmRF+R/4h5nKVLRSoZJTk4ryuPLVvze+UJDalGhBq
         DUXF/Tpf8osvremGHK0h6pQQo3qyYqnbXYv6TnFR0oMpe/HIZoZVyt5KmBAN87tGokg3
         7clfHk0Iq8UDVJgk5akeYPACsyJ2UeoHEIRlwJyarW5NiJ9fkec9II0QqyTJ1RNLJ04d
         2YnhMfx7uxuRrnozzpfowJAJYN4rVncNFgDtJYTnYfu0QrwXwWaZrh7krKINh0xos5fB
         1VopvP+KGIKEhxr0dpra5p9wZFrXnKKRsJnKYYJZZJCR1RCU7UWELvZpZSc7Ah1R2zq2
         wCZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmyDURu2PSFzzQkO9pUcMAuK+SdV1LExepVoHMKI/e96B0pgOCDnCiBhGN/z0d6bveoIMOrXOqKfwJYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yytdj9AWEz5rsPTyzNu7eNH6dcwmicIQKpLfpZ0jNcVc6SqLPkG
	2II/BDvlvNJmjGtXVa7wsPZlihESYMlqgIShoMWDR4TJ6oZwEyYAWn9cQ9WbEEQ=
X-Gm-Gg: ASbGncstIpZKqrinhenRfnet6w3ilMw8zW6WrrwZfF/w7kg3jsJzLP/Rf8gqdmL3u1d
	rcZue/kt2Ktl86NYSgsK0O7nioCotFr6fHGA52/rGKp3cVGGqe/AB6f0zoTsyGyKnjsWvgpixVp
	DRKxtTj2gZhXcpV+6gqj56eELPR3VQQKuqLvXVy7Elf+8rsuhSN/Zq878KummwERvaguahqEBr0
	qYI0qBqcV+t5d5MkeNRbDLy41n/Vvd+8DJ2JW7XfQlagw3S8Knc70x14APtfdSHq2mhpZnmu/zC
	jruTbhoiKe8pp42ByWOTF1J7EjViTb55NBDRih+BiNCnFjLLCPzjNpg=
X-Google-Smtp-Source: AGHT+IGl2rjI0Z/X1fO7b4lQu7Bz/+RhZRQdSmN7QWCPax7hXw3N4uwdbUK9AcP8ky1wqh1l9HCJJA==
X-Received: by 2002:a05:600c:4e08:b0:434:a4a6:51f8 with SMTP id 5b1f17b1804b1-438912d4a3bmr183994855e9.0.1737473371456;
        Tue, 21 Jan 2025 07:29:31 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499821sm242856925e9.2.2025.01.21.07.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 07:29:31 -0800 (PST)
Date: Tue, 21 Jan 2025 16:29:30 +0100
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
Message-ID: <20250121-4990d96a861a4ddd304abc33@orel>
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
 <20250115024024.84365-3-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250115024024.84365-3-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_072933_681371_6D97570B 
X-CRM114-Status: GOOD (  12.48  )
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

As the bot points out, we need to add the following to this patch.

Thanks,
drew

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cb93adfffc48..6b5b24b399c3 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -160,7 +160,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
        pair->value &= ~missing;
 }

-static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long ext)
+static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 {
        struct riscv_hwprobe pair;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
