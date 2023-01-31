Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850BFC38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 10:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/iBADvAR2UT1DPJakeGvWIB1eriW7zBjp5bMjumd8Cc=; b=ZLccj0orkWJdhE
	uEDDKUQVLBXbqPy+n274CPvvk3eiYpNoE5YNIP+CEOPhTNF4m+chDxva7pt1JZH57BO+/QTHk0ppT
	JNjkA6Fzs6A0dkuj3lVpisTMpBWvTbREyPLaPRiGz0wLKClKyUsYhF0d3jHhIXnQxMfCZjB7UIWVU
	1ZhEG+aEz3KiTCM96Zpm8dtAx7EfX5Cxe4gUjaqX2ltwhLOqBs5xQ7WLB0nk+DTb2XOneoVHq3eEI
	tkmkF7iShIoqiQreW9/XcH/fzUUccFuyNun/J7KUQBCxky03EiToAkWEjoIMvtSk06LOtXMJknj28
	hpGDIEEwRLBbw355uBNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMoKX-007bJq-25; Tue, 31 Jan 2023 10:57:37 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMoK5-007b7N-3t
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 10:57:10 +0000
Received: by mail-ed1-x529.google.com with SMTP id u21so13986986edv.3
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 02:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCW7Bu9eM7Tat1zvwvNXuene7Qwc0Ic2NetBKSDb5lA=;
        b=IB5YW3tMphygyoW35dbhvsJagt+V4nl8gnggOzRzcwiwUJKuS03OwZQM96Qcmp5auA
         nkXs07K3LzBqRJm+PIy1alYvQZhfWsLwUpwPqY+2KJ/Xp45TFcXVqOAZQzxuVbEtJma7
         ZAjX+NRVmx9/FpKAyGkt4LK4VOdDS4eqza6W4nmkhKkoBvGB4Dv7DS61994oJdlcGhrF
         OGneu9IcsCtsAQ16Z45I9/RSVneMD7MDpzOh4xwNDz0HiViTIL364JBwzGpZ6ZWAtw+n
         nmnu1vhvkk8CnT/vpv1lH54K8vzKE7QtUiDNGz1cpWk+eumX0gFra56tS4c7fnQ06aOF
         EMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCW7Bu9eM7Tat1zvwvNXuene7Qwc0Ic2NetBKSDb5lA=;
        b=OGu2sRZYNAkJ/nZVzxqAfTHv7qKzGpbaIdX5Iz/k5JrofpD8XSR22lAIVm+rQFgqQP
         lQPP01W5ZxOUYZ8a7KKVV0Gf+W7uaP5IhphJGIMQgvVlJpvy9FmwnKWOQ0gL14k9Phw0
         CvJ3qAvXhRRY9JrD1hY5gTNKN0aJJdSaD+OGJJ5i7Lyqgov525h1OkuWz8KsBwMJdr7b
         Pu3ByNC5Cz/kjie7oKI9WY9wSuSVlvi8aIwAt4fiXAb+v1TyWuBoMTwtT2nUAv2fVZdk
         9eX80Pcyvhd9TAif4jiE2kIQpzIiMWC3pQon5HeP/c5M1dZs8n8a33v6LdGo02dHaFPO
         leLw==
X-Gm-Message-State: AO0yUKXlhf7mycVHw1pT8mTG0z3FtKKddyjQs7YXBHg83gBV9jqONAZc
	idOnZaBI96qEPibxr6x8trN+K4O/f1oo3FRByRhvcg==
X-Google-Smtp-Source: AK7set9UFmwGXPdeCq6K+KaR/sZcUX1pu6+EKFrwMv8J9ojvjFho/vQGJNN/hbB17DYlI0ycOuX/PQ==
X-Received: by 2002:a50:cd91:0:b0:4a2:4ed3:c14c with SMTP id p17-20020a50cd91000000b004a24ed3c14cmr5800925edi.39.1675162624165;
        Tue, 31 Jan 2023 02:57:04 -0800 (PST)
Received: from andrea ([217.9.231.172])
        by smtp.gmail.com with ESMTPSA id d22-20020a50f696000000b00495f4535a33sm5222045edn.74.2023.01.31.02.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 02:57:03 -0800 (PST)
Date: Tue, 31 Jan 2023 11:56:59 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	"liaochang (A)" <liaochang1@huawei.com>, palmer@dabbelt.com,
	paul.walmsley@sifive.com, mhiramat@kernel.org,
	conor.dooley@microchip.com, penberg@kernel.org,
	mark.rutland@arm.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
Message-ID: <Y9jz+zUDebQ4VLlF@andrea>
References: <20230126161559.1467374-1-guoren@kernel.org>
 <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTQZWO8Ubi60nHn-J-8czqBnsp1Kdyoim3uLNkjbYd-H8Q@mail.gmail.com>
 <87ilgntdef.fsf@all.your.base.are.belong.to.us>
 <CAJF2gTTaartwjVdmtmsm1FqmYVuAq5_nGYU5zc6nkdTtCm200A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTaartwjVdmtmsm1FqmYVuAq5_nGYU5zc6nkdTtCm200A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_025709_192865_E1079062 
X-CRM114-Status: GOOD (  10.07  )
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

> > It's the concurrent modification that I was referring to (removing
> > stop_machine()). You're saying "it'll always work", I'm saying "I'm not
> > so sure". :-) E.g., writing c.ebreak on an 32b insn. Can you say that
> Software must ensure write c.ebreak on the head of an 32b insn.
> 
> That means IFU only see:
>  - c.ebreak + broken/illegal insn.
> or
>  - origin insn
> 
> Even in the worst case, such as IFU fetches instructions one by one:
> If the IFU gets the origin insn, it will skip the broken/illegal insn.
> If the IFU gets the c.ebreak + broken/illegal insn, then an ebreak
> exception is raised.
> 
> Because c.ebreak would raise an exception, I don't see any problem.

That's the problem, this discussion is:

Reviewer: "I'm not sure, that's not written in our spec"
Submitter: "I said it, it's called -accurate atomicity-"

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
