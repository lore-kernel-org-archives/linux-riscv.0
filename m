Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7AFCDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 18:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pw50vf0dIBzcxZy4aActvPUQsbpDl87BjnuphDFw0lA=; b=2VwZzWv59kqLbM
	HSUkEiXPyLUyAth7agI+WflJuRc9K0UhiTDe2FGGljfYpFNHXFyrhCRAUSAl/orc+VjxEyu+FOIT0
	wDaQjYLolQdNXLL6i/v/YStx6+KERo7+tIGMoLNIaqCMSc2INDnRro3NMpM0r2CWS0THAwFWTYa1Y
	9eJ70EgNuK7n1KGTx8LR0ceRsUi7UTo74S9hkzpZSTLiscPfsBSlSRVXEsBIuXbXSdK1XKVFOIr9U
	s4L9OfiTj/prC3yc9+3MC1p1hSKmi+11a6cVS0HLeKgpLyRB3vqnl16le5N5TE4dBbBj+RSwnz5fq
	V9+SergVOIr4QdyMK8VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsoxq-00CzZR-0r;
	Tue, 17 Oct 2023 18:38:46 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsoxn-00CzXS-2B
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 18:38:45 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-777719639adso74102385a.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 11:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697567921; x=1698172721; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsaRBkXVnZ5gQ0bfD3LH2OWV/lnyvaLOJpA+t9fKpcs=;
        b=V10+8b3Tt/lvDk1Za7ApGwZKCFcsH4J4G/Q+y6Wj+pq6CT9IVDfs0et2Ne5xUPB4+8
         pI3lomqRKukrjM2uA9bzoQJUsMy4nACRA/Y5s69SxC8NTcveFYxuWxB6fyyVfYY38HQN
         205ua8KUcPDTEBcnNSSH6xE4bvXlbjAyLMre0xOkYencEBPOtxcar9TBJkWGr1gliYU7
         6HcnZ9ZeQsFPLFiN0eQs+bSwf8fy9lLGS3/MrU+KuTSInCOj+b3XQPsPRNO1gq4oxTOt
         ebfLI8W2HJyd8jm6fUrkU/Hrhah8CAviUpe08NzWhD8dv8YF/R7HgnQzZYYd5mkwKet2
         oWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697567921; x=1698172721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsaRBkXVnZ5gQ0bfD3LH2OWV/lnyvaLOJpA+t9fKpcs=;
        b=M7oCIDHnYhgyEeAqw354Y9NYP5TdddXdxbZsSzuvkjQa2+C2qNrfuQJ5Yu9/L5GieL
         /gkMLsoDj2a+a1Ty2FbRnpzluO+LGwGUMAnOvyUNj/mNxZfxNJQnpLGK9TegeTUS9v0l
         JRoEjVnDgcQjx6enNSeiAxC3HzI8wfoqGbcecTCwyq5UKSquZzXK3IJPKvYO0YdGKTW4
         gTPE3EvCZRm0UeMnapzYIAkFOILJeJAGnkjbVCq9elr3mfhBWn/k9zPyZEOJP8UenXNg
         VspBKzQYodRy3Ka5GyT0FD3cMGtD7eyq3x5yoaDrI0eJ/pMBDnzpi8QkuPVSQZzOqj82
         6F1w==
X-Gm-Message-State: AOJu0YyKC38/KB0Hy6glnnABMl7QbmlHV64rE9VxXQNvtx9WkzxaFzfu
	s7j+8lIC7o1cP3IVIw4ZwnavMEGDf4yaK1DUNOIrfw==
X-Google-Smtp-Source: AGHT+IEb4loGMCpPOVn6Ab+wN9cQ9sYm3udk2P0fPAOn+o3REaidWVnlpV97HdQcRaGqmi3sZ0ab3A==
X-Received: by 2002:a05:620a:3951:b0:773:c075:a4e7 with SMTP id qs17-20020a05620a395100b00773c075a4e7mr3115161qkn.11.1697567921072;
        Tue, 17 Oct 2023 11:38:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:95cc:ccc5:95bc:7d2c? ([2600:1700:2000:b002:95cc:ccc5:95bc:7d2c])
        by smtp.gmail.com with ESMTPSA id f9-20020a05620a408900b007677347e20asm866377qko.129.2023.10.17.11.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 11:38:40 -0700 (PDT)
Message-ID: <a65fd79f-e0d3-4618-9579-d4a19ba91302@sifive.com>
Date: Tue, 17 Oct 2023 13:38:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 -next 3/3] RISC-V: cacheflush: Initialize CBO variables
 on ACPI systems
Content-Language: en-US
To: Sunil V L <sunilvl@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>,
 Ard Biesheuvel <ardb@kernel.org>, Len Brown <lenb@kernel.org>
References: <20231016164958.1191529-1-sunilvl@ventanamicro.com>
 <20231016164958.1191529-4-sunilvl@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231016164958.1191529-4-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_113843_718689_E7355AEC 
X-CRM114-Status: UNSURE (   8.11  )
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

On 2023-10-16 11:49 AM, Sunil V L wrote:
> Initialize the CBO variables on ACPI based systems using information in
> RHCT.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/mm/cacheflush.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
