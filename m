Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5775AC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 18:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKv8Fs+xtb1cc8QUI9RWSThVA4JncPJ7JnFmZMdi//U=; b=qVDhRFLmEcHP7r
	t2UeeyqdGA2izLj827sPs+EYV8xK5HZA8aZ9woj5lRtFBLa5r5SMOghIXlEf+cRwxtfP+oE0GXaMD
	TlA2K99+UQmCq7zQsXS4kg08GdE6IRvl198hJy79TQP0ciebPyR+oNp5flfJNJOpXEnC02KaqsN3O
	/R/filXpTl5xsJCf9kOvQk5aARfOqSlN2iEtDfzNGqsPVCQ7PdUxLRqLPHeGNRV635NkY5GmY3yzY
	Bwo7b/vPOJN1dk8G6ST+tUAVNwZuiC5HnMH8wyBgLEAIeHZULZXHhh9fviKmdqV+8JeGD+y8NV4Uu
	isZLd5SG7v6Q/V0CYTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov0Kf-00Dde6-A0; Tue, 15 Nov 2022 18:06:49 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ov0KX-00DdZC-IH
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 18:06:43 +0000
Received: by mail-ej1-x631.google.com with SMTP id f18so5062493ejz.5
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 10:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UxphCWzuw1yf1Ze0H/WEX7HxLj5IaZ78xIqJDGMoOT0=;
        b=oO0oPHW+aVrQA//FKJOT5lGh36xtK8VerYktwnj4pGLjfgHgFM+iXB0NZEJoS2TuTd
         J6n15F55DLclGJ5W503JyX8AOYidHxtIBDSWK4BEjDK3bhlByj8T0v/YW/KBMMpqnJp3
         BRc7R4YPOIbpPtKYWH/UsQwzSOn98UF6oBYgi5r4DDsmmAV5kA+P51W3uJ0BVthoKA45
         0T/8+g3V+aZd7E0x3PQZtGQyl02jGPYM1ziODp0wd49anzmTNZ/7rE9fq2J8X3RIE9JY
         s6MNUgXzQVJADgEnzBDFRg3AYYILJJLUYX8LykNpPbTQmMddp4C27a+J1dYgz+gRDOye
         WA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxphCWzuw1yf1Ze0H/WEX7HxLj5IaZ78xIqJDGMoOT0=;
        b=yrO5I4iNc6gDftO3gn3xqXDW3h/7Dn/B+r3851mXnpo24vqblXVU0+ZhhB7Q1/KbhX
         z4xhfjWbx+6ws9N5J8b90clzzjnSlo3Mu986qml0YWrOehyAy9PPIgkK0rpD47OJQjjR
         Ia25YkF1wChb7mhJAT8D9srysq7qdV7Ykc7tyGyE9bG+Ik2opWqmcJDepooOiKVO5rsd
         8/bE4FEjtC7fkiupfH9Gq05K1vVuqmUnKu2XjlqERq5WGkJB1JFSmf7LJZ4VQ3TRR5Pz
         qUU5TCWjDxueLHDp+N/+und+OKtMgp442GEZF2/GGaFh7HcWzPbt8VgcZo2KwzZyGiDw
         TuQg==
X-Gm-Message-State: ANoB5plldO3rru46HG5i66S04hxIB2RTK8MEv65krKaMhSX55V6pIyL7
	drbQju7FsOTCIgId7tjCaqAJhw==
X-Google-Smtp-Source: AA0mqf4IvSk5Q/p6zfVDaS0JcXWLFOPJwyAtgdgfZZ7iBTZxEMr4vBTrneZWdpvDgLB7FrjIR220Ew==
X-Received: by 2002:a17:907:20db:b0:78a:16ad:8250 with SMTP id qq27-20020a17090720db00b0078a16ad8250mr14814054ejb.747.1668535597272;
        Tue, 15 Nov 2022 10:06:37 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id p9-20020a05640243c900b0046447e4e903sm6478342edc.32.2022.11.15.10.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 10:06:36 -0800 (PST)
Date: Tue, 15 Nov 2022 19:06:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu,
	jan.kiszka@siemens.com, kbingham@kernel.org,
	linux-kernel@vger.kernel.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3] scripts/gdb: add lx_current support for riscv
Message-ID: <20221115180635.crej6pcvokdo3njy@kamzik>
References: <20221115012917.1781185-1-debug@rivosinc.com>
 <20221115084923.1822572-1-debug@rivosinc.com>
 <Y3OkY6myfea00BaK@wendy>
 <CAKC1njRi9C0m3JKpu0ebAFCC25161EST=tFFWiAj1yZBbnak6A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKC1njRi9C0m3JKpu0ebAFCC25161EST=tFFWiAj1yZBbnak6A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_100641_642049_3A18CD43 
X-CRM114-Status: GOOD (  12.93  )
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

On Tue, Nov 15, 2022 at 09:49:10AM -0800, Deepak Gupta wrote:
...
> On Tue, Nov 15, 2022 at 6:38 AM Conor Dooley <conor.dooley@microchip.com>
> wrote:
> 
> > Hey Deepak,
> >
> > On Tue, Nov 15, 2022 at 12:49:23AM -0800, Deepak Gupta wrote:
...
> > > +         if (scratch_reg.cast(utils.get_ulong_type()) >
> > current_tp.cast(utils.get_ulong_type())):
> >                                                           ^^
> > extra space here?
> 
> 
> I don't see the space in the patch. Can you clarify which space you're
> talking about here?

The same one I pointed out in v2. The one after the greater-than sign.
Is your editor not using a monospaced font?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
