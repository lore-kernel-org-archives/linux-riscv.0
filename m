Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1B6C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Apr 2022 15:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjTaJdoiKSe/1jmheFrkT6KgsvGxsl/Idb/a7lgGdrg=; b=EgFuteFDpX1VQE
	A5qYIkfaO/ix4v8X1oEh7m3Cipz2Bdeg10w0aJrJ2yyI48hAXQK+e/MQfsJG5innAPFoRVTgtNc4R
	WUsYyeBVok8rV80wcnDCHLko5ngqkBIAzS3vKGz+U3Mpkys6zkWfxU1rbIzFLFPD/GVJELp1AyofW
	OY4c8vQovKD9tf5a06bvL6KBDrSVRh1WkPF5ceqgDQuhHLUq0OkMDMSonepsL81UwOqGPFPKeNnJM
	kEQqZIxKfUJeE1YDXvobLDvTRvncASm13FKbeDgokhaugJQh98L+5khac0hOrgnWNljM383YycI2e
	CMhb3TZND37aa2kFqI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndZHa-0052gy-2j; Sun, 10 Apr 2022 15:15:18 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndZHW-0052g1-W6
 for linux-riscv@lists.infradead.org; Sun, 10 Apr 2022 15:15:16 +0000
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso14708630fac.9
 for <linux-riscv@lists.infradead.org>; Sun, 10 Apr 2022 08:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AykdxVkfek06fjXsLB9I2IRHzCOJ6nIrMbEtU2HTEq0=;
 b=A/nT1N5myhjcL/iH9Bw8eSo2yqIZp8xF1pBJy3wtyHqPNG0WBG5cVpRDBWUYwMadtc
 b6qXuao0UknR6L+QodumzaDlSmugfdvmQP65aTADnopUAQXHTAOPV0n5bGv3V96CxbbR
 V7P3W3C0wdGHBaxOMjM5uS1J1SN5DIw0YcSgR7XqrtddyoBNzZgcTQBQvdE/DQxMLYn/
 up01o53v/D+e1NyNX24m3Ff3TVZxISLbThUtbw7CnWvIPL36ujBBVMqKm9CwPuNnMJbN
 SzW9907FEjhnSyXOfFmBNbSiD1OxjakTAJsNxqr6cE6JXGrwYQdSRcegbFqdhUXYJdyE
 YGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AykdxVkfek06fjXsLB9I2IRHzCOJ6nIrMbEtU2HTEq0=;
 b=Ozli7xGBW1vIeYzu/KcvdNkX7OqmPH97i8aRQ0e6tU3PHHhCAHwe0ibgYAQ43+Mr4c
 baObxAX9tJm0GEK1eBS7gkFx3Out096PMC4IzBfE5Lb014VfK7z6QxJQZXopTvME4MBx
 3N+U/5NLjmHe2lkHX5htRnUqjWiiIsZgvPnJa6noXg176qdftdOZ2Pt7OinKq8cLiKi/
 IlFOdp6JWfoO0kLrsS/LC3nuqCRrFRJBUOS05vBkSqRrRv/RSS8oioTMRN7WxtUm3sP7
 TEs56V65wILotT/6ia5c0Ozas4I9oS6aAJp1K1Ebnl/AhyvZOzg65Gs7127rbv+DnG7G
 nKug==
X-Gm-Message-State: AOAM530tb5UpPb3R563XF2iKg00YyDidtP+KZnK8rTYSRkU35w3Q6JSv
 9muNv8Ca8TE2DLLDHq0UTsSIFFnY72rlW1K71Th9KA==
X-Google-Smtp-Source: ABdhPJw4JlX7XrQmjaKV9AkjsvEklgyp/+SYdmSxL3OSV1KqjDA84a+/qb1G0521cTO8XAEfbAt1IhBKhpUfEDvvMME=
X-Received: by 2002:a05:6870:b021:b0:e1:dc43:9000 with SMTP id
 y33-20020a056870b02100b000e1dc439000mr12076705oae.172.1649603713127; Sun, 10
 Apr 2022 08:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220406142606.18464-1-eric.lin@sifive.com>
 <20220406142606.18464-2-eric.lin@sifive.com>
 <YlGgro3TupbOEnJC@kernel.org>
In-Reply-To: <YlGgro3TupbOEnJC@kernel.org>
From: Eric Lin <eric.lin@sifive.com>
Date: Sun, 10 Apr 2022 23:15:01 +0800
Message-ID: <CAPqJEFrh71h-UZF1=TQKWTrsL84R=nzoBTieAw6rtoyBbu7kRQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] perf jitdump: Add riscv64 support.
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, jolsa@kernel.org, 
 Namhyung Kim <namhyung@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu, 
 iii@linux.ibm.com, linux-perf-users@vger.kernel.org, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_081515_112222_D489D7DC 
X-CRM114-Status: GOOD (  17.46  )
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

Hi Arnaldo,

On Sat, Apr 9, 2022 at 11:05 PM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Em Wed, Apr 06, 2022 at 10:26:06PM +0800, Eric Lin escreveu:
> > Signed-off-by: Eric Lin <eric.lin@sifive.com>
>
> Can you plese provide some series of commands demonstrating the usage of
> this functionality on riscv?
>
> A dump, for instance.
>
> - Arnaldo
>

OK, I got it. I'll show the series of commands in the commit message
in v2 patch.
Thanks.

> > ---
> >  tools/perf/arch/riscv/Makefile | 1 +
> >  tools/perf/util/genelf.h       | 3 +++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/tools/perf/arch/riscv/Makefile b/tools/perf/arch/riscv/Makefile
> > index 1aa9dd772489..a8d25d005207 100644
> > --- a/tools/perf/arch/riscv/Makefile
> > +++ b/tools/perf/arch/riscv/Makefile
> > @@ -2,3 +2,4 @@ ifndef NO_DWARF
> >  PERF_HAVE_DWARF_REGS := 1
> >  endif
> >  PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET := 1
> > +PERF_HAVE_JITDUMP := 1
> > diff --git a/tools/perf/util/genelf.h b/tools/perf/util/genelf.h
> > index 3db3293213a9..ae138afe6c56 100644
> > --- a/tools/perf/util/genelf.h
> > +++ b/tools/perf/util/genelf.h
> > @@ -38,6 +38,9 @@ int jit_add_debug_info(Elf *e, uint64_t code_addr, void *debug, int nr_debug_ent
> >  #elif defined(__s390x__)
> >  #define GEN_ELF_ARCH EM_S390
> >  #define GEN_ELF_CLASS        ELFCLASS64
> > +#elif defined(__riscv) && __riscv_xlen == 64
> > +#define GEN_ELF_ARCH EM_RISCV
> > +#define GEN_ELF_CLASS        ELFCLASS64
> >  #else
> >  #error "unsupported architecture"
> >  #endif
> > --
> > 2.35.1
>
> --
>
> - Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
