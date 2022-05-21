Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9C3C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 21 May 2022 21:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SoV5BCbn0kNl3yqRb4rlhtppxf1xRTgT8zbzl7D1En0=; b=LFVlZvdrpDdTuP
	722EOJyEQ0/f+/Nce8TmNVqWyCiLogXU2hlO1a4EbGMPYQGLQ0IFfzAnjNi8XYq8PPbBdAa847Xnj
	R6gUYqlTJRNrvRrbDEjTnnEI8JyPlhv0pUFS9nRiU65ryD0mNEMY5mMRqxITPFeo6R/A5iRjGCjgh
	UY+EgbMeII66nOPJ3+VbH2qkazT28lJuzxLsxPueqHYV8sCjG9df6BS0khmm2f70tkHETFI6PsgIn
	BdEfdqJx7J5CYWEijTffRfK1GpK2iWRKQE37jPy3WQqynWNh2qzDcDyhPs/wyZ9MJhmX64DzE6FDJ
	UOw9cUOWSOVIeYd2r/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsWvZ-00HaZA-TO; Sat, 21 May 2022 21:46:25 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsWvX-00HaYq-2G
 for linux-riscv@lists.infradead.org; Sat, 21 May 2022 21:46:24 +0000
Received: by mail-ed1-x529.google.com with SMTP id j4so10306993edq.6
 for <linux-riscv@lists.infradead.org>; Sat, 21 May 2022 14:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VHGsf0YyG6Aj9z0V/K+AfvfUR5qIHJefbUxdIwAxb9s=;
 b=JRIVUeUMYlj7uImqOiKv1dkq2kgDlrbKfF7lB39OFLEHl0V0a3mZ44SHijmddwx7KZ
 Hf8JHB8wsNpe45qMnRMq2UcEpFvI3nK2kcA+UoYo29b2h1N7kAba0TqePsaubplmG6Wg
 ljJ1aEY2n38aoXWxbRuo6NMjnSzD7ZoFemLOwoplb3H6ZtHnrmArz2xxKqOMTBaMNh6q
 xM7QPOadHNsguwunliVv4+kGVYbgR3BWoeynECtj77B1TuRw57c4QhfJxVnrO5SWDEFT
 BiSSj7okmnFDnAacEnrS4X+/Ay7s/9O9BsYSR3/lo88HYFaIbA/TcSZG9dR1bYz+Vnbo
 bRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VHGsf0YyG6Aj9z0V/K+AfvfUR5qIHJefbUxdIwAxb9s=;
 b=1m+PjU6qgUosaJ5t6Wp4RYZ9Rjd8i+xS0jzq3MqrDb1LeDqADZMRUwQFTb1raXJVy8
 GDSfpwSvceKcMLz7OE9eT+FM7jpbxWrsKqoiiVgQLaEgASlbYv8x2cYB7mC68vs/P+zw
 wrLaOCQA5SlZhkmVOl0cNMnjKO4qbxBBcJo3g630saI65SgNMEtLkhIHBy8X9Y2WBi5/
 /HCCJsIH5XGQr2kRoz/4FuJWTFDVEVgxN5Yj39/ys3smvFAtSqsKGI+kh5KBBVpRufI5
 iC7S+7lDBxxZ+iazHBgv9Mf29CZN47a/Av46RyCA+bMh0HfK8wKXZB3U/8eOOslik5U+
 h+0Q==
X-Gm-Message-State: AOAM532qsvenyELOvy5JRttWq7FH2yMClAzOGdbf1c5GLe5JUb7Fn7QM
 SkZOgHaMsxxTdar9kfpB1mgRxDedWgc=
X-Google-Smtp-Source: ABdhPJxIQlEX/ftbLHv6wkeMMg7xV2sFqNh3JR9vWGbfjbovtl9HUFZAs9mES9dqn3Jb/wOsFHqDHA==
X-Received: by 2002:aa7:cd70:0:b0:42a:f084:5fba with SMTP id
 ca16-20020aa7cd70000000b0042af0845fbamr17369759edb.351.1653169580906; 
 Sat, 21 May 2022 14:46:20 -0700 (PDT)
Received: from mail (239.125-180-91.adsl-dyn.isp.belgacom.be. [91.180.125.239])
 by smtp.gmail.com with ESMTPSA id
 ig1-20020a1709072e0100b006fe7b0e124esm4625030ejc.18.2022.05.21.14.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 14:46:20 -0700 (PDT)
Date: Sat, 21 May 2022 23:46:18 +0200
From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-sparse@vger.kernel.org, Kito Cheng <kito.cheng@gmail.com>,
 linux-riscv@lists.infradead.org, mkl@pengutronix.de, aurelien@aurel32.net,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 1/6] RISC-V: Respect -Wsparse-error for -march errors
Message-ID: <20220521214618.2i5xokersg3hhzfn@mail>
References: <20220402050041.21302-1-palmer@rivosinc.com>
 <20220402050041.21302-2-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220402050041.21302-2-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_144623_168220_0C31E7B5 
X-CRM114-Status: GOOD (  24.44  )
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

On Fri, Apr 01, 2022 at 10:00:36PM -0700, Palmer Dabbelt wrote:
> Parsing RISC-V ISA strings is extremely complicated: there are many
> extensions, versions of extensions, versions of the ISA string rules,
> and a bunch of unwritten rules to deal with all the bugs that fell out
> of that complexity.
> 
> Rather than forcing users to see an error when the ISA string parsing
> fails, just stop parsing where we get lost.  Changes tend to end up at
> the end of the ISA string, so that's probably going to work (and if
> it doesn't there's a warning to true and clue folks in).
> 
> This does have the oddity in that "-Wsparse-error -march=..." behaves
> differently than "-march... -Wsparse-error", but that's already the case
> for "--arch=... -march=..." and "-march=... --arch=...".  Both
> "-Wsparse-error" and "--arch" are sparse-specific arguments, so they're
> probably both going to be in the same place.
> 
> diff --git a/target-riscv.c b/target-riscv.c
> index 6d9113c1..f5cc6cc3 100644
> --- a/target-riscv.c
> +++ b/target-riscv.c
> @@ -60,7 +61,18 @@ static void parse_march_riscv(const char *arg)
>  			goto ext;
>  		}
>  	}
> -	die("invalid argument to '-march': '%s'\n", arg);
> +
> +unknown:
> +	/*
> +	 * This behaves like do_warn() / do_error(), but we don't have a
> +	 * position so it's just inline here.
> +	 */
> +	fflush(stdout);
> +	fprintf(stderr, "%s: invalid argument to '-march': '%s'\n",
> +		Wsparse_error == FLAG_ON ? "error" : "warning", arg);
> +	if (Wsparse_error == FLAG_ON)
> +		has_error |= ERROR_CURR_PHASE;
> +	return;

I don't like this because:
1) it's way too much intimate with the way options are parsed
   (enum flag_type should stay local to options.c).
2) -Wsparse-error is a kind of hack to ignore -Werror but keep
   a way to invoke its semantic (but I don' think anyone is using it).
3) I don't think -Wsparse-error (or GCC's -Werror) should be concerned
   with the parsing of options.

I think it would be fine, for now, to always simply report a warning,
like Linus' patch (but I would prefer to just handle the correct parsing).
If reporting an error is important, then I would be happy to jut move
this code into an helper defined in "options.c".

Best regards,
-- Luc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
