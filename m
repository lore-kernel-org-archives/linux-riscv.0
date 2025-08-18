Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25FBCA0ED1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 17:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJCHocm3QOQbKqLVa9juemW6AEUyzkMaIHfnYr9xEqk=; b=oQ/v4d9eRCJTon
	1d7uJ59l4XK7DGStVZ7zhL7N6Vc6xeDSD3edqgm5XtdfP5j+6sFrGTZT75LEcWB78jgHFX7YdegJL
	IPNhm2iz2DvjgMtdYDoYmvk+yJVNdUohQwcEpU36VHULeLRuEXf6virKKYkoxGg3u2vb/V4J6dFD+
	6w0D8+gfpdkih0jWOS67S6axjKsHxE0c/v1jDTHdLL87ceTtCatX4PhyV009zTgOz8crQdSkGmfQS
	5srSrxxEF0UB53iHFE0HUR95e1hx8ohSEOnsR1r/pOaia4SOUEpHav6tYlqa3FPIef6tecQu6q96j
	27H/PfMWC0tXNOnuFeow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3ho-000000089Uo-3keA;
	Mon, 18 Aug 2025 17:31:36 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1HJ-00000007rUC-2Pez
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 14:56:06 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3e66937e452so5855835ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Aug 2025 07:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755528964; x=1756133764; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P9CfNSTuc/uF1qHY5WFP24kXO82FfA15GfsdN/C+IOc=;
        b=BI7gjUIxV38WtfzFVrd3z8JvqRdTmeJePbey68tHQioumn9+eB2Ut03z1WndhOz7jb
         kyFNJPNhNF+HvZ7YyPa1rRlxZJUgqZSzxuRTiSjb2ccfzgGg0WmishvJ6bMMssCaiIbJ
         pcQbYPkIvn8IoD7+d/xhSeAjDmNJIuFOzarWo1gXRGyVwpu5lzgrJgWSOhdyggY1ry8a
         IS6AwRKGxhjj8wLbffNbgpBY7EZcP8j5Ycrd9EhIqDZVQsWXSRpdjazh0h6VpIxVqoGE
         FOJCv0ahu1oTHKCAKpLQKCGvLZa3fXG3LIl37Yx7lMhIq9/b2O9NOvnH+yd1tlMMWl8R
         fz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755528964; x=1756133764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9CfNSTuc/uF1qHY5WFP24kXO82FfA15GfsdN/C+IOc=;
        b=VFFKBgyPfHg6uUVXHltYJaUHdAIWOqfvO46gljNnUGCCFp/L4jSamLF4JeLGKfbPlt
         jhhGS/q6jkCyRuLucnn20r9+/D1rjqeC5shzQJ1S78OUvLmzmwFppV7gRd7MsixMiYwE
         Abjv7Nq3q4CFyO2BYwg2T/SI6u8BArOHsE7K725FmgfdRHT1C17t+y5SpoHkvxnNVzvz
         Yf/roU/5TvC9Iof24O5E5yMKW+WPZLWSYm8RL/y4YiEx/3apcHz7QTxWe6sfRla96tFS
         Bq3c/Aqplwj4mAzlF0uYw92xicqfP4v0Lt7nv3qfhZmxjRepbldZmEUE6cz8GxM8Y9n8
         ZI+A==
X-Forwarded-Encrypted: i=1; AJvYcCVmLqJeyN6okNluEhQHXQba9CosjMTr+8Zf0oa/fH7x5TceayEcoFKLyq4nvqSvX1OSYEXb+Ks2ImB8mg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwT+2TAXRWwpp9ZjK3O8ntPyLwA3SiEiHgRvzpwxNXKQE5ht0p2
	oGz1c+Pl4h1CRNoP3H64QEfBst4Iqzvvxf/xi+8plzTxo9rl9fqLAjMYWzmBbnsUKLU=
X-Gm-Gg: ASbGncv3W4bGz8/hE06ZgoYw19L5pN7C4eSeN3GbeGHPRE1vrGvAcCkmIa3+f+DIj8L
	1CqvYVt1SzidWwjNS2wx8VhwDRlQD/NE8CxexmCCEuXB5DeHKWrfiZiSW5LztP/u95hTKrbqGh+
	XwcIyJaaj1rZ7GNcTrXpbZ5gGAnkCNee5kaaMP+gJDwOLNlhvG96UhGJLzGsXfLcHgv0qjE4s2k
	BxdHbcllmRNHLq9agQ1bgEn+NlOExC7nFdFA4e3ExjpwtASVA0Pm5ZhZoDv8ioXoE4VIubANL9m
	Ob9anD0WNCrNQqn9veWvhjvvJqk6TndqfC0DKSyYkCk4OecpiIl6RzNK09A0JnTlAkbgJ4hDLjs
	V2mGVKK62FPJBuJ4BU8u+FUMoAQvJX/oymCM=
X-Google-Smtp-Source: AGHT+IHKhwEj30JkX2wIaBs2G2ErrpG6q1NBNVHTVwHY/0ZVQYUutUV3YGS8fX1au2IKlXNP3c+x+w==
X-Received: by 2002:a05:6e02:18c6:b0:3e5:3d13:5d80 with SMTP id e9e14a558f8ab-3e57e86aa7amr243594735ab.6.1755528964324;
        Mon, 18 Aug 2025 07:56:04 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c9477ef56sm2565433173.5.2025.08.18.07.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 07:56:03 -0700 (PDT)
Date: Mon, 18 Aug 2025 09:56:03 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v2 2/2] RISC-V: Add common csr_read_num() and
 csr_write_num() functions
Message-ID: <20250818-ba7d5f923321feb836a408db@orel>
References: <20250818143600.894385-1-apatel@ventanamicro.com>
 <20250818143600.894385-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250818143600.894385-3-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_075605_616335_E28F69A4 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 18, 2025 at 08:06:00PM +0530, Anup Patel wrote:
> In RISC-V, there is no CSR read/write instruction which takes CSR
> number via register so add common csr_read_num() and csr_write_num()
> functions which allow accessing certain CSRs by passing CSR number
> as parameter. These common functions will be first used by the
> ACPI CPPC driver and RISC-V PMU driver.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h |   3 +
>  arch/riscv/kernel/Makefile   |   1 +
>  arch/riscv/kernel/csr.c      | 165 +++++++++++++++++++++++++++++++++++
>  drivers/acpi/riscv/cppc.c    |  17 ++--
>  drivers/perf/riscv_pmu.c     |  54 ++----------
>  5 files changed, 184 insertions(+), 56 deletions(-)
>  create mode 100644 arch/riscv/kernel/csr.c
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
