Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC84CCD184
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Oct 2025 10:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NfJ8jMRAhlrSQv5VHACfWJ/Ek3sia1ePCV6/9iclM+8=; b=hd6ZX+6FfmH0nH
	0GFowm/wJxIyb6s84qRCUZEA3BCpS8W1n1HXXh9UZfkY+Hj6Ob9NeJZS/moVW021PW7IfdFy26uCS
	ckSMGdCNwNnXAR1AinJ0DocdQvBeaHpERpggd1Izs2HtJys+OwL+zXd2olRp4DydQGLqvg8D9jGos
	gM0olooieaSJYVGoyMLW8QTYEBbQrpdKbqhyKB1WntA2a1QKwFiWE7PUMsBICiUCGkPNBDyVWVS70
	crUVe1tjdg8juKqSDZfc22E3N4Xabqo+T5OT5fLv5XAMEd2BWhg4imHf6ryz2FmV7F34urXCnMlSQ
	Wdasgb1QqCR1L/V3MDww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ssp-0000000BEPE-12OK;
	Sun, 12 Oct 2025 10:00:55 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ssn-0000000BEOb-1Pbi
	for linux-riscv@lists.infradead.org;
	Sun, 12 Oct 2025 10:00:54 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-782e93932ffso3033694b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 12 Oct 2025 03:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760263252; x=1760868052; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOHaWmiMIWsfnsqK/UODnLWGPAfQByTmpbDvN/YjQjo=;
        b=NgjHXtryi0qd1h0RPd1k5M7WoLoVNuzqmImy2PDxqSyWOkmwOjhVGijjEcbSkdawl3
         BwQRulFtlGClyXBEgDbGLp6YqEnnfYd5s9/n/EFaAV9thT/9hdvw7H/NU2kOStM9rjWd
         odfOI48THMuD24Ke5RgKtIE0EhsdPK5RH6DTuLvyx1LI0vkxT3pkeNd4zd2vQELDhJui
         ubk2HwxmPb0LIxQnZYQzD4oz6DUemYsmd72GbXKaux7QF3e873b/kf0oA+ZEUuiBkqJ0
         hwz7A09T20ggMSGAiPoF5f1UdzswIBhvhjLPSf6bVqaE27b642DEeu5bNYF9MDfAVhEm
         0iOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760263252; x=1760868052;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOHaWmiMIWsfnsqK/UODnLWGPAfQByTmpbDvN/YjQjo=;
        b=wsXiTQFn7W9/NayhQHMNFf7eXX1rXaBBwDCzzra2bRodJl5EwxneCl66DUCN40NoTP
         y09Q6xDsgZY+JiboMEohlnLmvcUXN3LMik9VaZ0LC3iti4Wa13oRMUr3ICM4EJRICRIV
         fYBEmsoPKGglEDQyXd7Ac1DbeMG6HkFKk2+aJt3uUMPuwqGRQ9BzjBqOM8A679q4kEAw
         Yq+aJWldN2xRLjxPUg9PRRXomOnzO7q3kYVQNaqLQp87AzkyPcJVSjybv7yaiGXtZ1Aa
         3gFwFnhlumGJ4A1kZJvLFWqbMQB3CeJ2M6shrwKcUg5u4L4zptThWXIQ73EHMWzsJECO
         wEvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoJd8ycu9/s63CTn3OzsrQEKrqmSnS2/eUHQFtUft7hKT2mc2SwFCGKxMnnqUWBkIh+3F/z1w+lIPaBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkVMjBm2N89QRJyWglHYlltFS2L1bN5YtKLD2aUJ23sY82f5XQ
	d6AX8BPouCpzgmKp01WThQcKN7GoG+fvPGSqpDb31HGts90vyh/3ov30
X-Gm-Gg: ASbGnct3qw26zbH1wpiN3uBLk+9gNktfyy5m0W0ztYYDQNxuwn1RQUQ6jT717gS8coX
	+H7xIBqzSoBTOalrP0HaagcvHNxpshqxR+Ye0LyJpq27d/W/xjTQQZE0Br351Vq6iifXT3nzT50
	6dGeYvO8pwQPGWVv+wTGyHKUfzlwgecAPC3LCVqLYn+c/7lhdTKVyvLP5+3xALWSWl1hKLP/wxV
	Ezs3eMjhsdpsaE6EMvO0RFYmsQP/qYmIxy/UNjkuOrNMtwKhgbHNHN3rvoMTTgBICheyjKwRYVr
	SZkTTFoJj6NzsdWdl6h1Zatd4EINVFVT9gBet3QGxL9M3rn1YRdC6qqbUrpUXsKw1AO8wHCh3Yl
	gT/Nk9lgNq4DUvcP71QcB8WIS8/v+oa6tR8j8gE/XUwDpqs4RTvRKxEdVxow=
X-Google-Smtp-Source: AGHT+IGR0V8U3XPFSEQ92xPF/qaoVuLh0K0KP8mjdP0djmlSm75II8OCfN78JtkG44a0dNK+bpvvEw==
X-Received: by 2002:a05:6a00:180c:b0:781:259b:b5f8 with SMTP id d2e1a72fcca58-79385ce2732mr21092716b3a.13.1760263252060;
        Sun, 12 Oct 2025 03:00:52 -0700 (PDT)
Received: from smtpclient.apple ([103.142.140.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d5b820asm7979898b3a.67.2025.10.12.03.00.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Oct 2025 03:00:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.100.1.1.5\))
Subject: Re: [PATCH] RISC-V: Define pgprot_dmacoherent() for non-coherent
 devices
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20250820152316.1012757-1-apatel@ventanamicro.com>
Date: Sun, 12 Oct 2025 18:00:36 +0800
Message-Id: <031395FE-C51C-45A7-85A3-CC4A25EB6066@gmail.com>
References: <20250820152316.1012757-1-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
X-Mailer: Apple Mail (2.3864.100.1.1.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_030053_376930_B1EF62F8 
X-CRM114-Status: GOOD (  19.25  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, "Han Gao \(Revy\)" <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> On Aug 20, 2025, at 23:23, Anup Patel <apatel@ventanamicro.com> wrote:
> 
> The pgprot_dmacoherent() is used when allocating memory for
> non-coherent devices and by default pgprot_dmacoherent() is
> same as pgprot_noncached() unless architecture overrides it.
> 
> Currently, there is no pgprot_dmacoherent() definition for
> RISC-V hence non-coherent device memory is being mapped as
> IO thereby making CPU access to such memory slow.
> 
> Define pgprot_dmacoherent() to be same as pgprot_writecombine()
> for RISC-V so that CPU access non-coherent device memory as
> NOCACHE which is better than accessing it as IO.
> 
> Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
> ---
> arch/riscv/include/asm/pgtable.h | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 91697fbf1f90..00d8bdaf1e8d 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -653,6 +653,8 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
> return __pgprot(prot);
> }
> 
> +#define pgprot_dmacoherent pgprot_writecombine
> +
> /*
>  * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
>  * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
