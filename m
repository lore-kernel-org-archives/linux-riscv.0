Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99203C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 12:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+JQSfgv6TOWWhcHpPwWVfSUcivoyhS6KZSRI+fwaKxY=; b=OXN+szFTJ7Iitb
	k2Yl0DC4D04ab409sdbE5H6z5xzWYSGU63inuLhnHh1SDjbh2jaR1Gzzvp5A5esaSDWzebWRQdpyW
	rbu1OktdPgZ2QmFV1cCcCDYdZsBuY8dUN3ijqjSZ870mpKQf6bLcHQTcSy9q0BYH6qdsyg6pP5qaq
	5aJO256R8jxPajECTPE9gRNYTe4MQaRUWQT7i4QqMh8Z6mwFe9K1L23zrbKYbB3JioGoGqOASVuv4
	HSLsM/ic0J70pPMlbKRm5sBzrMkaORLmmkjjEV0NOgSAHTCcsfPfIhLYnMc0FDiCoUU6OnbeEO0a0
	RhGVGEsUNNRZI5ok2PgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZsN5-00000009FlC-3S0A;
	Tue, 13 Feb 2024 12:58:47 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZsN2-00000009FkZ-3COT
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 12:58:46 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a29c4bbb2f4so565610166b.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 04:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707829122; x=1708433922; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g4agJ1A7KZIyEQouGbFZaSxgaZc9xYgjCUppDYmRrYw=;
        b=jAqSi4ffprOX2Kk2sVnLNfS7kZ7fFSgmIv1PgRpk/Yn57C6APa1Jraw25UXltqiLxc
         I1kQJVUy7Km3m8ytpx44PW+pOl7i3EwSCG5GmD0mbpiVm6aRiNiQBLJR/33oUmNRV8UA
         5EAoEniTNtCABt38lCOWim254IqOD4JUtNlxJ1PLMwWfPLmykc90xPgh6ejQiN2OeZHo
         27TwLx+iGa9OGkUQDMUCpaRY3EU0q9X0emJ6LCvDVWYeyuP0LHHbgHExddXSQDjMDYTg
         mKJHfOxRnlCI/BAxGZiC0/y825aimHlfMJTSlDNOKnVTSBy3I6+iAwDhsHiwq4RMA9xj
         JBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707829122; x=1708433922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4agJ1A7KZIyEQouGbFZaSxgaZc9xYgjCUppDYmRrYw=;
        b=hi2Wj7n1y5pWHcj3xGV1Y7B0JT97+CTM0M52QI/Gxg7v28hDEHgilMgTulOOTuDxlA
         mS1pUXcsIgwa3ax0wakVq2b6lTs4RoXG5K/FdY/rXGkh4J2787KggIi+0wgvwjtnu+eW
         foLyMnR0U0aI0aZYv3ibjlTtTU7edCoPk76fl2ZaPbzBjnYlOKbsuTZUNQr/XomL3I0p
         3UdOnfpF4oknzgxZRNqGrKegxOzimZ0bN7/AH+rZw2x5mjJA/YHOBbA48aH+qBb6cjXw
         eiV6ei78YHRF7/eaKJ5QfhSzi71ltXSNpzzVFobHf4NU74doLqjOuwVKjKCPjqsjnQJN
         U54w==
X-Gm-Message-State: AOJu0YxK3jvMm5p0bML+DCjcp8pPb4Te0TU+pEcJXhduK22i5Iov66PG
	FKGquypYzAq1GD922++/EBkOsL4n3sSbrXv96azN4c4Nfk3NUjv7
X-Google-Smtp-Source: AGHT+IHLPgXjndJjue7JZCBb/Obkgqkz3O5ORbVsw7IyIJPKIogN2/XvGhQzDXSxhNqngAW1Otj59Q==
X-Received: by 2002:a17:906:5f86:b0:a36:f314:d8be with SMTP id a6-20020a1709065f8600b00a36f314d8bemr6544824eju.38.1707829122035;
        Tue, 13 Feb 2024 04:58:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW8GmVWpVtXsv9CUGlgzj9xI5iu34FvcBpV3uY1aOPlxcvXc+l3iWpei19GntcgFFyJIg2eg7P6LnYOufUi2XZcFkCkXD3BSw3RWQv60Qn5r/uEtnk1rJEhwmPWmK7IoRsQdPF18sCyHtt0m/09EbqN0KyTZYU++MkE7E0J4Hd08q0jlw2xmMF1bPJzSXtuUt+sayp5fR/ZXOzO+ioJELvmcu20PDMAgyIsjqsho9ZbYV1fzIWfgP+dAZoFn8cu1nMGcwv2Oi82XHAJa3ZpM/tyRpUXmdmUBAIpysqGsCzhWbmiqhPnWHf1KoSyXSQxzFcmvtNGR2/RF1ivkSR7reT44XXl9/iSjUBuq0rmxYY7+75GWVKdYCb/lhjEJeV1UjS+exhDKGBihw==
Received: from andrea ([31.189.95.98])
        by smtp.gmail.com with ESMTPSA id st10-20020a170907c08a00b00a3c5e6515d0sm1267324ejc.24.2024.02.13.04.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 04:58:41 -0800 (PST)
Date: Tue, 13 Feb 2024 13:58:37 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>, bpf@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: Re: [PATCH 0/7] riscv: Various text patching improvements
Message-ID: <ZctnfZWWO3HCiXe5@andrea>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240212025529.1971876-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_045844_862762_1061FE1D 
X-CRM114-Status: GOOD (  12.24  )
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

Hi Samuel,

On Sun, Feb 11, 2024 at 06:55:11PM -0800, Samuel Holland wrote:
> Here are a few changes to minimize calls to stop_machine() and
> flush_icache_*() in the various text patching functions, as well as
> to simplify the code.
> 
> 
> Samuel Holland (7):
>   riscv: jump_label: Batch icache maintenance
>   riscv: jump_label: Simplify assembly syntax
>   riscv: kprobes: Use patch_text_nosync() for insn slots
>   riscv: Simplify text patching loops
>   riscv: Pass patch_text() the length in bytes
>   riscv: Use offset_in_page() in text patching functions
>   riscv: Remove extra variable in patch_text_nosync()

This does look like a nice clean-up.  Just curious (a "teach me"-like question),
how did you test these changes? kselftests, micro-benchmarks, other?

BTW, I recall a parallel work from Alex and Bjorn [1] that might have some minor
conflict with these changes; + both of them to Cc: for further sync.

  Andrea

[1] https://lore.kernel.org/lkml/20240206204607.527195-1-alexghiti@rivosinc.com/



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
