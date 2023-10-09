Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6BAE95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 14:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Mypbs1ivEJsnsi79q+UERxkQcxP2zr95npn842RyO0=; b=AkdxQEGr055eE9
	pFTSaP30KQbiGkILh8mUJRmNLPowAYXZ48V2/AnAWsKG2Y8lawrz7Dqjkq0nyOVi06qdh96q0XSHv
	V/GCPM7cc6HI4Lh9ZkmMuEGYIKMi2CIgwTvQpV8JNX9h7pbRjywc7QFoJGQ3mf7uK8NNcfkKAYsxv
	5B915W7uTRPnUnYZqMpbXmojSGaLAvIq6eHgHeQGgpW23bRIzSIfoMw3XW7aln9FCkI8u4qJ2w+Wz
	sCIV42yt25WfLy4jWbCKoYnnUthJ3DVdRqN4iIlMWj9o62/9jo0oKoAWQZ/BezZkmQTg7QEq0embM
	P3zDs1V2zjJn19QfiRlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpr39-00Au7h-0n;
	Mon, 09 Oct 2023 14:15:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpr36-00Au1m-2R
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 14:15:58 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5344d996bedso8136381a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 07:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696860935; x=1697465735; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l08xKTo2R5OD/YfzbkiAxNbFfHhJ1rYvOcybx89PnNU=;
        b=aCv5Xjuu1UyTT4hWmyZeqwjO84ypWgQmT8NUzZY4p5Xgc8guos8S3EFSiMv83RuRdr
         cI4z1rYG6NPTTGLaFve4hh1/9vRJJ1jE2ZanMNV/GZLYljciHt8R3MfT6EBgt4AUG77n
         ACuunHD8oDxFa7I5PTxs9vnhqzJHYiwCBpKIo4rTkMU70Qy2cLJwCL/CYPG2x5KDFlqG
         MlTznxwy6s/jginJnWCe4lJzinhzepTbXr7uNcRybKrbG/TPjz7t13R3Y8nqJwpaSqjF
         WV0a+nOPDlhFzBtZyZBoUmbZq5FIjVeCcGFfLwuNrBbUQ48epOVkW39jsg6Be0fe4jX3
         uXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696860935; x=1697465735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l08xKTo2R5OD/YfzbkiAxNbFfHhJ1rYvOcybx89PnNU=;
        b=AF9by5B4/qkP16jdZuwxwTFh1aeO2zhP4kkjskVhEdZR8Q+eG2bmXS6SROk4GTRm3U
         JGRqWO4oKwk9Fk2INUMbEH/z9YM8Xci2LdP6GW3385HDB+ENrqTolaaOLVpHQ5W7rWzJ
         v38W2M7kgBQA7XSmqcjK+fJwPS47eGV/MTXX3lTdDqMbrBnITnYPHuVtijsJSnY00hj1
         89uPwnQFBg1zlIfBoOYRUsSTohYGi5WEquptj6SH0VMjS8ZHT8jAC1dnRlDuRgw9U2IL
         aNHcqN6XZg46d3VL78GhhkN5lDsqasNUHhKK+6UKsh5qLaieUV56wDr5Xb4JVHOwOmm3
         futA==
X-Gm-Message-State: AOJu0Yyfgm2VGFfkcUS242ylJ2NCV1LVVAhDpeYm/KrJlKfApp5vCjZx
	ES0Q9f+/BjMY0qycJtF9P8A93A==
X-Google-Smtp-Source: AGHT+IHqh/I/lFaIYQBO7E8ikZ2mrEKNRnUqmyAADIByO5Z0KidashBTP0wioKG17qum6fL6pBYihA==
X-Received: by 2002:a17:906:530b:b0:9a9:9c6c:c4ef with SMTP id h11-20020a170906530b00b009a99c6cc4efmr14077491ejo.23.1696860934861;
        Mon, 09 Oct 2023 07:15:34 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a6-20020a1709062b0600b009b29553b648sm6768624ejg.206.2023.10.09.07.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 07:15:34 -0700 (PDT)
Date: Mon, 9 Oct 2023 16:15:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Evan Green <evan@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, apatel@ventanamicro.com
Subject: Re: [RFC PATCH 3/5] RISC-V: hwprobe: Introduce which-cpus flag
Message-ID: <20231009-457989feaaa5d23bf660b7e4@orel>
References: <20230921125518.175428-10-ajones@ventanamicro.com>
 <mhng-6cbe4501-1a87-4ec4-9f80-bcfe256ac1ba@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-6cbe4501-1a87-4ec4-9f80-bcfe256ac1ba@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_071556_798811_E921DF74 
X-CRM114-Status: GOOD (  11.53  )
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

On Mon, Sep 25, 2023 at 04:23:32AM -0700, Palmer Dabbelt wrote:
> Kind of a meta-comment here, but we should add the key type to each key
> number in the docs.  I suppose maybe it should be obvious which is which
> from the meaning of the keys, but can't hurt to be explicit about it.
>

I was just about to do this task, but I see it's already written this
way. The doc uses "Contains the value of ..." and "An unsigned int..."
for value types and "A bitmask..." for bitmask types. As long as we
stay consistent with that as more are added, then I think we're good to
go.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
