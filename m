Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9B9C44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 11:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lMtXZkaz8uDGIY9yUmk4opn7Ro2R9YRX30wud4vVAU8=; b=NXHBsK9KMAxmAT
	SEFj2CV3Hi86d2pVFkpKP+m0J/aXYTLyhKQhGoVJCBFgxe7Efs843TVBFragYKQT/Qr7zanRMDp9/
	4Zjq47/o6S1YZ5U8J26zhFPsAIRd4o8+pVQIb3IWmceHa5e7emka2tQlABM0+iWjdEhBZGOyPRIXo
	KZqVnnGOWhe4On/qvE1qX0J1qlknOf1Odp7KwJJRdnFT8R28AnQvzxaLj6vbkMm7geOJqHIIfsKcY
	oUdFVUa7Cy1w3bQndmqb8UlQ8ACU8PO+tzEphRpres+M+HyxYKDLpVnkfRraILL5AlwMlj98i+KkN
	mGlLPqjUMaqDwLBg0tTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vit9Z-00000006zcj-01CY;
	Thu, 22 Jan 2026 11:47:09 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vit9W-00000006zbV-1dYd
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 11:47:07 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-45c93313721so285913b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 03:47:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769082424; cv=none;
        d=google.com; s=arc-20240605;
        b=S3w5jdWHmQh8e0awQpqRCqkhhMm2nChQTXM2xTe8rlEt8AkktCtgfZny77WkqeJi+T
         0uwJ1lU6Qc4DuAsHhPkD2uXEi6l2ohzIM8tkgLA+9acdCF41ZbXLD3Z8/WUnLBEWcNT/
         NjWFpNTzbxxHOHisNaeqEwBrrJucm+XiIIaxgnSFmtLG6X3YjEOYLcLJeK81zce5YPiw
         lUSAGqm0RbOvxoPXFrBcfMcBfwarEmeketj0P+J34e2M/93xYPqpAoSNyYC/fZMlMJ++
         ibRMIf0rnYUteVQxqIMqY33q7s11w1aArhvYyPzPLcHPRE7DAJPEY+jfUJ5zSOTlWJyT
         T8lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0GEdFKTShC0ZpJHoWL5oV3syGXTsJmRbqldb2CgIg7Y=;
        fh=HbNgrsWo8LTIA9luB1CAVbbAJpcM1/UQC18RTXKCauA=;
        b=dgXX2fkjmqRNqoy8mD4COSsp0/nPUFL9dPTMb2znH4cPvtaItuWp21UrI/fgbAAe1Y
         vC4F50ai4sz1LmIA9RDpD1as1vVYYPDYdePOrbdtIfzq52A8DhtyxCZh7MKvPiDn7gQ3
         x64S1pe6mXcOtwmB/DLiZhCRN0hzynvwxo0csnr+qmqSH6es2tCGxnNGwkW4iy6yNDa3
         lMShnyKskptEFUcSWclOzmmO1XLr8n9Vu5uVM3F+Tgs8FFNh0klOm04FreJIDjktkZXL
         RjU15NXNRXvyA/DtVG1T8363gq17Zl//2Rdo+KLyywxtitvXVebqPVlxm2rQxo1zEfwk
         PzCQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769082424; x=1769687224; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0GEdFKTShC0ZpJHoWL5oV3syGXTsJmRbqldb2CgIg7Y=;
        b=Dy8p/j3dYMR+JlCR6DxswpLVrfj2ZBrE6f3bVrsko8K07LGOhD9exjfXndFaGHMYyS
         tm7k+KpBxrMTeixQl9t6NjxHGL3wa++Ay5C4O8Ba69WCygnEvXBB+dju8b2aEEcmGGJi
         DYZFBQt7JcHMxUDrZWq0K6OLBn9GEUeRtHUM5E5PE3rJybjxxuwOZ0jMoBiZFAzNLv03
         PkmGdzrF7g33EvCsb8RWDaxMtffWleUYxTofYzQp8C5e0DmzK7bVXcRZG1fG+rqXdwoQ
         6xLIeAfIL5obW6ByaFlAHtdJybaSBBI8Lq8eofkZ6HyD7gGBRLDjAAPZzCoRD4VoUx14
         ajDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769082424; x=1769687224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GEdFKTShC0ZpJHoWL5oV3syGXTsJmRbqldb2CgIg7Y=;
        b=D+xKtE49eSMbHWPuIHSiuxDPD0iP86fLOSbAa9IyNJjwRpBaH/i9h0JLfILQQ6jTn2
         LwVGCpbXlub7BBW708MDsSpj5YIMxFnpq5o3NufU7rPgo5hjHLBCo8nwXTDhHQysjksT
         dBCvUK2LmUGM2L2NKVb5300opgWt6YI+QIatesVXU08nzcXago/lwEWDKeMa691NkjyD
         iYf4DDO5Rk6OTNpuwJDjrKbyjZAznf4GO39ImcHg6MocB4HxJKk3VDM7vl1oGI077heQ
         BaeXBDAxWp8vgG4kxCn6LRj3MYsJhlL3Vw0EaZ/rOvPjaeaQuosdEjMrN3Idu0j6BUNc
         YG9A==
X-Forwarded-Encrypted: i=1; AJvYcCUDZ3k5+1KlIEDCbBQ+akM+oqcRjxTF74wyXq9qndplLujUQZhVcSQCMIymqo35HP+MfDD12ubIp55fGw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh+Q8Q+Xb68yuyPk4uC6U4w38Pft/ynHvoh9B3UaM56QYashxx
	2Yw73alhzsm+BUjrLfiljwZD+r3bFGVYvGhVrvG7oqVRxoTVaWN7eMBpjIoI48lzTx7MUdLy1UI
	+AYsn53wSwJqFqbJq30AanB7mM/q7FbE=
X-Gm-Gg: AZuq6aKr4NKH7CW5QVqFd7VH+R51o4BGRDyS1Kbwj+m734cLJ44Zi0ByiCR9/rP/gdc
	0kwuRt7ebaRGOo8G+nlZ6KY6rsey0IUonrAEruHNjCRgFvn2UqBErqleATrLgdVc4xctuuCByhP
	FSxHSxntRCokHpr8rwbfW3dBy6vwwiAgcdlYiiwRoej21ACgV8btfA1028zx4/lcJyu1daUpqS4
	x8IuSjOScsHuULOzWXdVJmFysE28TN1iRrQReSDAC2qY3K9yC2MBQoBWdW4wi/Qac2TaNwI
X-Received: by 2002:a05:6808:538d:b0:450:340:2693 with SMTP id
 5614622812f47-45e8aa24273mr3205271b6e.42.1769082424420; Thu, 22 Jan 2026
 03:47:04 -0800 (PST)
MIME-Version: 1.0
References: <20260122073127.375139-1-irogers@google.com> <20260122073127.375139-3-irogers@google.com>
In-Reply-To: <20260122073127.375139-3-irogers@google.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Thu, 22 Jan 2026 17:16:52 +0530
X-Gm-Features: AZwV_QjrC7BYx4_l0qj0u58o9jMWpinoFh5JfqyMmM-71XKtG3yyoT8qR6m_7W0
Message-ID: <CAO9wTFh01Qzn9tAiXf8_eGd7AAJiKzjmHNw-hBBCzcYR9Mb8xg@mail.gmail.com>
Subject: Re: [PATCH v1 02/11] perf annotate: Fix args leak of map_symbol
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
	Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Zecheng Li <zecheng@google.com>, Tianyou Li <tianyou.li@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Julia Lawall <Julia.Lawall@inria.fr>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_034706_436423_B4A997C7 
X-CRM114-Status: GOOD (  11.71  )
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

> @@ -1119,7 +1121,7 @@ static int symbol__parse_objdump_line(struct symbol *sym,
>                                       struct annotate_args *args,
>                                       char *parsed_line, int *line_nr, char **fileloc)
>  {
> -       struct map *map = args->ms.map;
> +       struct map *map = args->ms->map;
>         struct annotation *notes = symbol__annotation(sym);
>         struct disasm_line *dl;
>         char *tmp;
> @@ -1151,7 +1153,7 @@ static int symbol__parse_objdump_line(struct symbol *sym,
>         args->line    = parsed_line;
>         args->line_nr = *line_nr;
>         args->fileloc = *fileloc;
> -       args->ms.sym  = sym;
> +       args->ms->sym  = sym;
>
>         dl = disasm_line__new(args);
>         (*line_nr)++;
> @@ -1172,7 +1174,7 @@ static int symbol__parse_objdump_line(struct symbol *sym,
>                         .ms = { .map = map, },
>                 };
>
> -               if (!maps__find_ams(args->ms.maps, &target) &&
> +               if (!maps__find_ams(args->ms->maps, &target) &&
>                     target.ms.sym->start == target.al_addr)
>                         dl->ops.target.sym = target.ms.sym;
>         }

Hi, a noob here so please correct me if I'm wrong.
Looking at symbol__parse_objdump_line(), shouldn't we be calling
map__get() when initializing the target struct? Since maps__find_ams()
now calls map__put() (after patch 1).
struct addr_map_symbol target = {
    .addr = dl->ops.target.addr,
    .ms = { .map = map__get(map), },
};
This would match the pattern used in call__parse() and jump__parse()
that were fixed in patch 2.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
