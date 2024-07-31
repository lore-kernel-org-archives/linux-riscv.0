Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2633C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 15:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bwj+GI+vlXOeiGD5zPGYANZGtqIDu0dynRtnqrc6sng=; b=yd344in0nE6QT9
	FdAkWihK1IcB37EPDR5Kg9loelakXdv57zON28uMzGLEFnXhvnnWwpAlHeS+cuSMyhYtXTt14Jq3D
	MAOzAhAIyM7swSCCzabi5Me80UfUjyapKfdYckF0IPVwJDCVg8StZfYqNkDVbDB0RrV4zoLIK5N9V
	A99ZFlLOECRNcYExm9Hs4DQcdet3FvC5OjtlsCwU4/vjsmUJ5lnDgqJqeeyQJaJMmCrkR0eejPjJz
	0eGyQj8vr+JovSI6aNxfev7gIuKnYHkfbclM/kXGJofUqX6XoGIWJmx04E5TBtalGoN5clEQHn/ZB
	qQlVnN0ekEjbTcBPuY9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBSm-00000001l0U-3Z8M;
	Wed, 31 Jul 2024 15:42:04 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBSj-00000001kzh-1snN
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 15:42:03 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a7aa4ca9d72so743246966b.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 08:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722440519; x=1723045319; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UYT2Cc0DbDwz0EHSJcGoeWCUyU6S/hmw9Y4vANMOf9c=;
        b=HmMSY+k4r1yRFtHgjyftcMtnw4rwCSBBoQxeRXMt7fF1bFzA9p7rET0OdM/oC2x9jw
         t9tZQuGfboaKbk9FlPZCKG0EequZ4ppCpPhbiKtjhtqlNxfqiZU/DmUztRPwJyi4jLV+
         SeaxNOrH0RGlcckQ1zAwGwRpZoRdhAcX3Enc5ScXxJFEG6/po+H7mhUchP+UpemDt8Gw
         DQrd+ih5iEr0Ew+GaRpaNre+P7rIEIy70bxbe9wsAU98AibO7BcVEy0QUSpIxNfKejoG
         2IA6gTYOdXzwY8Vo9Y6mB5B39bHNVOoY+Fim1wku/2bQjFwmjfDHbiUAU7YYwyI2OBhe
         LtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722440519; x=1723045319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYT2Cc0DbDwz0EHSJcGoeWCUyU6S/hmw9Y4vANMOf9c=;
        b=YmnSBCrsB9eDozQlSecVbD/YHL1fogU8ZLcT1iNKmA57jb0Vup2BieSuetDwMw8Ecf
         2imPPv1vYHv6MFwprsoO2pDA8d/NeuanGWdPrix24AT+5iUMz6UCHXGXOdYjPqHBVoef
         Fv/JnddabU9P/5GHbl+jyGGSyl5kS/JVcft8XM0YwJ1MSnAqcGOAwP2rKBFhBaw+lRQ8
         7g50OqaMrgz/PJ66t11syAsN7PgpriUaZ6hFpefAP2BO+RhTe4AN1f0YfkKgcMSWm/PH
         ZLzHvqDzCrsLH5qKJkEWpmFB7joEZ8RCwOCW3DK/pvWujNMJ7hhfhsAQmCAQhAsdscv2
         0Wpw==
X-Forwarded-Encrypted: i=1; AJvYcCWQhRvqJpie3KarYHVB0wrp02yjBj4DpzOh98EASuB9fEF04kWCHXc+QseoCHkG75LmNfsTzH54SHMl1hdMDZ8l7e669vilSE82pjZZ4CZg
X-Gm-Message-State: AOJu0Yxc+Aqng17+mXXfnpScOCufroh1+4sL7w+m6BS0b6xn5GyFIaEh
	V0cq4nqkGoAo9thgjDqv5Q4lqNcFD5f8d+9RHwIeSrlwdhGH+D64fd3wAW5mKxs=
X-Google-Smtp-Source: AGHT+IEBk2d0ul2kTsNJSlKbs/TvRwodD3XnxLeAClb0/bTlm8Fcz5PpHV1kex7uf9VNsTgb5Tg1BA==
X-Received: by 2002:a17:907:728c:b0:a7a:a892:8e0b with SMTP id a640c23a62f3a-a7d40015a95mr1067366266b.19.1722440518929;
        Wed, 31 Jul 2024 08:41:58 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acadb82f2sm784530866b.204.2024.07.31.08.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 08:41:58 -0700 (PDT)
Date: Wed, 31 Jul 2024 17:41:57 +0200
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
Subject: Re: [PATCH v4 07/13] riscv: Implement arch_cmpxchg128() using Zacas
Message-ID: <20240731-98a368a296fa83a2e8ff8bec@orel>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-8-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240731072405.197046-8-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_084201_518234_35B92B2C 
X-CRM114-Status: GOOD (  13.31  )
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

On Wed, Jul 31, 2024 at 09:23:59AM GMT, Alexandre Ghiti wrote:
> Now that Zacas is supported in the kernel, let's use the double word
> atomic version of amocas to improve the SLUB allocator.
> 
> Note that we have to select fixed registers, otherwise gcc fails to pick
> even registers and then produces a reserved encoding which fails to
> assemble.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/Kconfig               |  1 +
>  arch/riscv/include/asm/cmpxchg.h | 38 ++++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
