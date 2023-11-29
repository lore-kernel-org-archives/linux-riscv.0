Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA144C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 22:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4sACulzmM8Q+QdUiXP+5t1gf4/Rz/oa4+I51FmkW4Fk=; b=VpVST7QkkIF6ts
	Se795FFdjLe/IDFWTOxXOySlRTKefAH8SxkIRqRJddtuS8qBs02JtDUtyxPAMGem+rxGPeaqMpD+L
	hJp9QezYSVKSnM2VlsBBBfGRzp/AFH6v9/r7CeyMN5LMMLYBJWgDqc1/cNURzjNyx1KXRSe1/JynX
	r3lsxqpOURxNfh7JUpbPvP19vdbY0/3ecvMMkaSKna08MT8FR+QqBspicxFgeTGSnskFa6S6sTowT
	STwbiUA04DLHFPXGctZiyy+1TTis5+1y4khggr8meG+21W6HpvTDXFGGajOkC92fNnol5L8PuYtRA
	ez2C0RfnGA3WSCcMiejQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8THT-009SfX-37;
	Wed, 29 Nov 2023 22:43:43 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8THR-009Sf8-0W
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 22:43:42 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-332f4ad27d4so203053f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 14:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701297819; x=1701902619; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DPlSYieAKeZ1ZlgSPfXPoqg/eW8uKpsVlCNZ8IU+hBA=;
        b=nH783QkZNgm/dsc7jI6ZZZlT44aEqHjqim4ioLyWnb/bifj8tEbnXxNl7XFYFE/bKZ
         UPPEFnxesQ7/pVRHa7PpqrrzPvucOPdAUZrjo8VwHVa6CuqBXpNX/2Xj6gJhiJCdTMsC
         7q//lUqcMnpR1nCaVaFFB+XuR/VDyFI3fwn/EfU0VXdOQKbL1UHl2YkpPOSTDfQ0UvU6
         UkgJeUTIaebHd7B2iQRVGp6wALawM2M94Jc/BgAE5ec0zhzEsNZPFTfYflJRZpa+LQJm
         hfMIpMD6ww99bsoEu7PYyuFZNTFzqq1pP2xGgmRjm0ntpjjxct/GdYpqNVVh1TpWQKTe
         M7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701297819; x=1701902619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPlSYieAKeZ1ZlgSPfXPoqg/eW8uKpsVlCNZ8IU+hBA=;
        b=FQDmSEOq+jyASTAC0w2njVxdUKKMK4F408WAve0dQwE+7qjZlCrFD8WPQL8LJHP9qK
         ZDL58CtFmVl1+amLlWM37GE3hdBBom6MBgo9UhIWVvPoPF0bn/5A7OgRq3DWZbZnhAKM
         mJoG++ab70exyhxz0ckZt0lyD/NVZcGmpuArKXUr4wiNbuqACcLe8H3G41vkX3uR6olO
         lFUoqjcpzwFol6qBJL7TZEZzPztT6eBc1tZtZvDoUxAQBi+IH0khd6irMA5cSGtrhIkV
         vpo0AsNPJtkgv99LosNykBlmegDqQMsavg5yDNkDxbqWKvGAh4Toxq0bE8YiknpUd0p3
         6R7Q==
X-Gm-Message-State: AOJu0YxHCvFOKAVcQuCIr4/4dw3tIH0m3AQks9myP2GibQyt/h27oDwh
	0O/oU0ySr525/3njIazCFj0=
X-Google-Smtp-Source: AGHT+IEUxdkYKt7NZdrpshbCMEE1jShiqAxqEFI/E6ZthNf7BgkK1wK8sSTJSHAgD288i8OAdBQ1Kg==
X-Received: by 2002:a5d:4d01:0:b0:333:f03:4640 with SMTP id z1-20020a5d4d01000000b003330f034640mr4906914wrt.1.1701297819067;
        Wed, 29 Nov 2023 14:43:39 -0800 (PST)
Received: from andrea ([31.189.63.178])
        by smtp.gmail.com with ESMTPSA id l9-20020adffe89000000b003330a1d35a8sm6287307wrr.43.2023.11.29.14.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 14:43:38 -0800 (PST)
Date: Wed, 29 Nov 2023 23:43:34 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: paulmck@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu, mmaas@google.com, hboehm@google.com,
	striker@us.ibm.com, charlie@rivosinc.com, rehn@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] membarrier: riscv: Provide core serializing command
Message-ID: <ZWe+ljzCUQQVu7oD@andrea>
References: <20231127103235.28442-1-parri.andrea@gmail.com>
 <20231127103235.28442-3-parri.andrea@gmail.com>
 <91ab0210-07f9-42c4-af7f-a98799250cf7@efficios.com>
 <ZWYDtB/otYvTMZWd@andrea>
 <0a84c0e0-2571-4c7f-82ae-a429f467a16b@efficios.com>
 <ZWeDF0eHyOc/b9UJ@andrea>
 <53aac2ac-46ae-46b8-9fdf-34527b79a63b@efficios.com>
 <ZWesWCRAPV3rZlx9@andrea>
 <041c83e6-1ca5-4953-bcec-03571135165d@efficios.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <041c83e6-1ca5-4953-bcec-03571135165d@efficios.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_144341_200206_E5EAA8ED 
X-CRM114-Status: GOOD (  15.33  )
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

> > So I should probably stick to 93917ad50972, which apparently selected
> > CONFIG_MEMBARRIER on RISC-V, for the Fixes: tag in question.
> 
> I think it goes further than that, because you can explicitly
> CONFIG_MEMBARRIER=y, see init/Kconfig:
> 
> config MEMBARRIER
>         bool "Enable membarrier() system call" if EXPERT
>         default y
>         help
>           Enable the membarrier() system call that allows issuing memory
>           barriers across all running threads, which can be used to distribute
>           the cost of user-space memory barriers asymmetrically by transforming
>           pairs of memory barriers into pairs consisting of membarrier() and a
>           compiler barrier.
> 
>           If unsure, say Y.
> 
> Before 1464d00b27b2, riscv just happened to set it to =n in the defconfig.
> 
> I suspect the initial port of riscv merged after v4.14 was already broken.

I see.  Oh well, guess I'll have to leave this up to the maintainers then
(I believe I've never managed to build riscv that far), Palmer?


> > I'll look into adding the membarrier feature you mention (as a final/
> > follow-up patch), unless you or someone else want to take care of it.
> 
> I'll be happy to review it :)

Sweet!  :-)

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
