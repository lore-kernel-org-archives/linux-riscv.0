Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4565EC83F2C
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aGZKaPYOR8b4JZkwAGoenqbcOPKIy/JlDLyGRvjEu+I=; b=03pAjfV7kZnQgB
	HL7gczXCgKZuYtuydvrpVBep1rFMzYqnN0iwHePe29HnbfnEPO1ksnK4ePDXJqYKpqbOTpu1R6fZv
	AE0hr/ZBSXXhk74pp+Y7x67BJZwX5U+pFlRwOe9wGSecXbfNLE9lmJn3h4y0GxphT/x41DStUd6dn
	f1Itw1a+1JIdsLcfUVP+MqajfTN+fDNqi8ukC5j50rEFwA3DrOo8KikwKmNHerAKHGeql5DCKPLF9
	5V0OuKeJypHkmSbViUWlsW9AG/eXW0Q4K5xNr1PsQ3H1dRdB5ZRM5eRmbjU2PB0LUcORYGEu+r3Bw
	CJTrkb9xbm1BdLwp3Apw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdXKt-006D56-1D;
	Tue, 05 Sep 2023 14:47:23 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdXKp-006D3H-0D
	for linux-riscv@lists.infradead.org;
	Tue, 05 Sep 2023 14:47:20 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 911593F545
	for <linux-riscv@lists.infradead.org>; Tue,  5 Sep 2023 14:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1693925230;
	bh=rzFgsndX7w8S+56ebJljaAcGYfZE/RwhA8W/mv/VYpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=c/mXKnKqg0gJQPOVDjUAgT9rHvvtqPndxuDx08oKjvM2Z4ZmhhjP0qZQPxfv4h3Sr
	 q77JaO434hR6qm/OXARrYw7BqQ9LS01n9+uasMNawIEwkT8IBdnbF8W44swD6JNqEV
	 7TyWL5wV7nXYv09K+KtPH5hrTCKaTveFbk9H6vusplABUNT2wSCuupAMtvl7xU5O/X
	 pl9JIbS9BE1Fwi/rsR51KfbBWUM28kJD4SfvSZkI2nRqW5yXaBB84hdHxFGsmtyKL7
	 2sj5CA/UfqNSoBpXfKvxqzn2oo8CUlO3gNrd0iecXyGU/mJXQx5+e+GqP2vHzIu1P1
	 kNfJRmEwtRbkQ==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4131d4bc82dso26394581cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Sep 2023 07:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693925229; x=1694530029;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rzFgsndX7w8S+56ebJljaAcGYfZE/RwhA8W/mv/VYpQ=;
        b=VMV+CguWSw+B6aLzI00+YjafykVO1xJNwlYDIkApAB1LYTkbvSFiY5puiKvofGO0f0
         FC84YR4szFoIZfVZsajqwUE2h/534Z4tsyz3IuhJUbQ8OHZhqrbFvFYvxLIEP3y5hucO
         01P2UIT/XO0yf2akzb/rRv8Zyr+Zzs3UPZcvSJzNcRFSoxXxx9HVmXq8zk8+dALpzn1N
         OLNzC1svyNcSsT2foc14YF52nN2K8v7lG0XZC6dSIJ/mvRbggp8Nrv39xIsEvo3jtUde
         woon3zo+j88qw/9Y09ZczN3p2dl9zBoBiZdtLQriDMxyKG5H8ubckneKRdpIlYl4JKVQ
         mI0Q==
X-Gm-Message-State: AOJu0YxRfVcug+0i2NblFdQg5YSebOd4uClvTbMFDuATMedi7V3v9+O2
	Eb3Tmsro6vHI3i9+IKb/cObr4yra29BYO4JMcv0iaWYSEJXVZPpHBY0yhGiBm3gYq+QPl4GULMZ
	DvMSqGLpAgh/ucRMCB8Kmi4EXgoLorK957pK9cYKxV11GEijdPxlDhOoNOmUuYQ==
X-Received: by 2002:a05:622a:24d:b0:403:e3ce:565b with SMTP id c13-20020a05622a024d00b00403e3ce565bmr15680312qtx.4.1693925229631;
        Tue, 05 Sep 2023 07:47:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzwdOm8ynmTrUyJwK/Cef8pNwzy6prPH4Opu96AVUP4rWCuvwXXxlLGG0Mwy896KMQhh05vlgznBGZ1rDAqao=
X-Received: by 2002:a05:622a:24d:b0:403:e3ce:565b with SMTP id
 c13-20020a05622a024d00b00403e3ce565bmr15680295qtx.4.1693925229374; Tue, 05
 Sep 2023 07:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230726173024.3684-1-jszhang@kernel.org>
In-Reply-To: <20230726173024.3684-1-jszhang@kernel.org>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 5 Sep 2023 16:46:53 +0200
Message-ID: <CAJM55Z-3feN9sw6MSqdHPkG8U-VyosAr7pHRynnQ+nZpbCQKkQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] riscv: vdso.lds.S: some improvement
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_074719_365746_ED97DB2A 
X-CRM114-Status: GOOD (  13.74  )
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

On Wed, 26 Jul 2023 at 19:44, Jisheng Zhang <jszhang@kernel.org> wrote:
> This series renews one of my last year RFC patch[1], tries to improve
> the vdso layout a bit.
>
> patch1 removes useless symbols
> patch2 merges .data section of vdso into .rodata because they are
> readonly
> patch3 is the real renew patch, it removes hardcoded 0x800 .text start
> addr. But I rewrite the commit msg per Andrew's suggestions and move
> move .note, .eh_frame_hdr, and .eh_frame between .rodata and .text to
> keep the actual code well away from the non-instruction data.
>
> Link: https://lore.kernel.org/linux-riscv/20221123161805.1579-1-jszhang@kernel.org/ [1]

Works fine on the VisionFive 2 and Unmatched.
Tested-by: Emil Renner Berthing <emil .renner.berthing@canonical.com>


> Jisheng Zhang (3):
>   riscv: vdso.lds.S: drop __alt_start and __alt_end symbols
>   riscv: vdso.lds.S: merge .data section into .rodata section
>   riscv: vdso.lds.S: remove hardcoded 0x800 .text start addr
>
>  arch/riscv/kernel/vdso/vdso.lds.S | 30 +++++++++++++-----------------
>  1 file changed, 13 insertions(+), 17 deletions(-)
>
> --
> 2.40.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
