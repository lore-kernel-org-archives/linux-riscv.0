Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47522C52D1F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 09:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=262KIR50xI6qtp+A+pSnHZwe1BOe2HC2MrqUbRuUFoY=; b=c5sE4qeWGW3R9/
	SJZluRkEcOBF3gO5dW+psBI4GHBzsRE/XfXK/bmbpUwruHPvwCzsKmRY3ckntQ4qYXYMgmeSH8LZY
	3Bp38VHblgrr2Gi2mA8biBg6Ni7svwKwVF5zeQUhNiWFV9KgWIo6fGf1VA0EaDPTF0ZedvhBInXJG
	wCt9ucJUMqyOZlb4bSfv3SjzLVUY1P2sl57fKkkyh+f0y/kxsWYZJB40fZER4a1poh60Obg3Ze6h+
	346xk0B7N9qEB7Fr5h64/jL4bT2bIlKy0An3PxPNeGkj4GmVXoq8986XzSMvAH5gp6IN0kuvL9WX0
	xZX65hrSqPZPTzZ0CajA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ5WI-00000000TcR-0gs8;
	Wed, 31 Jul 2024 09:21:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ5WF-00000000Tah-2Ydw
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 09:21:17 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3687f91af40so2998032f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 02:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722417674; x=1723022474; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u/qpTJRAl+gvdV7bUrhFzBBY9zM/wQim6oqoBtynaYM=;
        b=WQvch597a54jtegiK22zuozuoCtjMmx9FDxTuQA/InVAK2GiVwq1HRdwaaT0tmsTN2
         f3ia1+GeDS75AFtc95Vz1TA3XvFgB1yWBtiTVYk8UYtMDafeEnPJ7wsqin7Ot2odP3B7
         gW9szIakaXshAtyq3aHHeNHI8kZ7ymUKjTtRTxiXloie4PkQT/k1SWJcPOm0mB2IDMPV
         TLLhjd556etZC0SwEy5TlryZTctb/gtOv4Yfp8DVhnB9/DMJtxptLX7fEW/Hg3EhnAwV
         5/djdvlV+HpXBv2aH89kxMAYOOQDVYEke2y/i7tozdFWyOqLr9EJQKIPxXdfvLhd4zQ5
         Yv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722417674; x=1723022474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/qpTJRAl+gvdV7bUrhFzBBY9zM/wQim6oqoBtynaYM=;
        b=gEa9S38e3FG+TMCkzYiwVpSp5EFhqMKwYuUZzIKOpMCpXvmfbtAZM4/teAkoxTif54
         ZjnU7KzIKrfpWEhuAM7+uUaVFNkGbLWpwb3BsZJLrvt1s9Aqps3VABskE2+ebgXr9ORD
         04Vr876APClxly0rhDqPZHLNhtQ8nA6iz1nZnHx7H+sZeODAeGZIRmxl+5QJE+yKBHEV
         7L+3RiQ+vvfnkUuFS8Ldk3A+aTuXOOtzRhhMSoSJ5pxTB0/HdO3jLdebkCIbf/3onuI2
         WMenyITKcgW7OB6jSIK/6R1M25o5oG8CqxbT2FER7N0l8aOi/X8XTzCn3I5QmxnGpXUG
         aX1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUldq0ezk0/BssG93v8iotqpohgtIjXIjGkZjAyAC3YhRi/n0ijd7lXIpWH2Pmv3bKqhElv9NWDaCcj8G9fi5U5PHwhIgthYjGgaWllscWc
X-Gm-Message-State: AOJu0YxbBJgqwn43dFyZUdHeKAP6Hc8qjBcU0p+QSkoV3lHt/+uR12mE
	FZJe2KyJo+m6aMNEdu1QIgvFcHO1a9/OwH0QC5731xIQ66Rox5+UfIAOTQw1kA4=
X-Google-Smtp-Source: AGHT+IFNedUVNOOS5mp++68QmWlLVDtW+9dpvo4dm4U/i/Dgou2+lFIJYCAAaKRlPzCMYiIRYjEZww==
X-Received: by 2002:a5d:6787:0:b0:362:d382:2569 with SMTP id ffacd0b85a97d-36b5d08f68bmr8441211f8f.44.1722417673355;
        Wed, 31 Jul 2024 02:21:13 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36416e2esm16592253f8f.0.2024.07.31.02.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 02:21:12 -0700 (PDT)
Date: Wed, 31 Jul 2024 11:21:12 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 03/13] riscv: Implement cmpxchg32/64() using Zacas
Message-ID: <20240731-a49ee87a149ba9bf333378d0@orel>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240731072405.197046-4-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_022115_672978_C6A644FA 
X-CRM114-Status: GOOD (  11.07  )
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

On Wed, Jul 31, 2024 at 09:23:55AM GMT, Alexandre Ghiti wrote:
> This adds runtime support for Zacas in cmpxchg operations.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/Kconfig               | 16 +++++++++++
>  arch/riscv/Makefile              |  3 ++
>  arch/riscv/include/asm/cmpxchg.h | 48 +++++++++++++++++++++-----------
>  3 files changed, 50 insertions(+), 17 deletions(-)

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
