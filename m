Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CC4C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 17:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42zw+7NQ93OZNpw0bj4rVzYJqR1eFqlirOVLh22YgrM=; b=bkddSjqW91vlZa
	IHU/zROiPiWGNYbBVAFkALcanZUTU5XE3ptuzCU2aOAJVVIklrAfJYdJ5cb8Tt0aqXIUjYd8sckPR
	hoXmsWTHwiHPgyzyLQL/IyK3sRlev+FxjaHsywq2spL8q/k6PUs+Id2+7G9BGFu4ngmrEkrj/Qise
	e1I8w2l6YW+whfK1Gi7YTL8FBClQJ2L//FxQVJAFTk4ZxyKH9yeV7OyJ1z1jlmi04aVcjC7Q32vPi
	eGsB0aLIIpis7cJS0sIIZD4AncXTNZctns4sJHn+68x2SB1opnEWp7D94PSdOm7ar6e8Tu7MXrh85
	3pcDQtut5gEXh+ZTJoMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mkn-0037QR-AE; Fri, 24 Jun 2022 17:05:57 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mkc-0037Ni-Dj
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 17:05:48 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id x38so5487352ybd.9
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jun 2022 10:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZIPazKmSsD26XWJDudnBcSzWESOQebME2fbkS0xWFAE=;
        b=ZT8/bZUMdVEcLuC1UUVyX3uDPk7EQ1xFxdjgEIyJolBUUEmp91wMIr7tSMXYICg7O3
         aiDzcAiFvFvcQqxElKgz+8FHfBjpwSjJIGbwBK1ZyH9tvCAfGp7EuRH+AHlIpT0Nov6o
         SaRWF/Es+NNu2GAFCPfW+KJ5+8LLrmhmxsfYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZIPazKmSsD26XWJDudnBcSzWESOQebME2fbkS0xWFAE=;
        b=ZoD7Pg75hwcqx3YPW4ZIkxfkgyUk+gThlYC/PJ2oBON35D0kcyq3zFbfLBObFxrqQ+
         PvaTtoKRsy3e4SUI4WKc6w7eh2mkZg6yP7jtiJh7ZbjJtQ+CcqB+yVKEFaND2V0hYsE6
         w+ILzvvmZn01UTYaRbim1ZJuEFT2tkF6hi9lVbI+AkfM6mx0lu/0C2V4k6jkD0rwYI9u
         tCrdCNP5rU2ltgV67j6pPnM6ED8z4Ozq4h36201xg5ojVGq7ziAsNyfOpdXD70LfvstQ
         VVYU3GlkJ1sfZ0m6dzskBzOoeItCrXNw5b9f7DE2daQFmbkyWWlFgs3qOC/20FqKiDqb
         MSUQ==
X-Gm-Message-State: AJIora/WA7GSctJJBbGv7lrjAB9dP/g3SgFGeYy0ieDh75a0+SVsYNlJ
	uPP28Z6eIBGcr5sqB8Zwh8wPZj82SoCaAQiHlTFx
X-Google-Smtp-Source: AGRyM1sHDc2cW7clSCW0XylBGUiRR0RTkYDBhReAvtAFsWXBx2x2LeTFy4BM0fMgkJ61RgRmxJo/gZaREWNynpNDYpE=
X-Received: by 2002:a5b:c4:0:b0:669:15d4:8b68 with SMTP id d4-20020a5b00c4000000b0066915d48b68mr122544ybp.473.1656090344842;
 Fri, 24 Jun 2022 10:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220624160117.3206-1-nikita.shubin@maquefel.me>
In-Reply-To: <20220624160117.3206-1-nikita.shubin@maquefel.me>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 24 Jun 2022 10:05:34 -0700
Message-ID: <CAOnJCU+2mOMj7MPzLKVZQ46gRs=ghxP6FK6oWkss0DfN_si3DQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] RISC-V: Create unique identification for SoC PMU
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Anup Patel <anup@brainfault.org>, 
	=?UTF-8?B?Sm/Do28gTcOhcmlvIERvbWluZ29z?= <joao.mario@tecnico.ulisboa.pt>, 
	linux <linux@yadro.com>, Nikita Shubin <n.shubin@yadro.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Namhyung Kim <namhyung@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_100546_500107_FFE2E7A1 
X-CRM114-Status: GOOD (  18.28  )
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

On Fri, Jun 24, 2022 at 9:01 AM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> This series aims to provide matching vendor SoC with corresponded JSON bindings.
>
> The ID string is proposed to be in form of MVENDORID-MARCHID-MIMPID, for example
> for Sifive Unmatched the corresponding string will be:
>
> 0x489-0x8000000000000007-0x[[:xdigit:]]+,v1,sifive/u74,core
>
> Where MIMPID can vary as all impl supported the same number of events, this might not
> be true for all future SoC however.
>
> Also added 3 counters which are standart for all RISC-V implementations and SBI firmware
> events prerry names, as any firmware that supports SBI PMU should also support firmare
> events.
>
> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc
> Link: https://patchwork.kernel.org/project/linux-riscv/list/?series=648017
> ---
> v3->v4:
> - drop pmuid in riscv_pmu_sbi, we are using /proc/cpuinfo
> - rework util/header.c to use /proc/cpuinfo
> - add SBI firmware events
> - add firmware and std arch events to U74 pmu bindings
> - change U74 id string and description in mapfile.csv
> ---
> Nikita Shubin (5):
>   drivers/perf: riscv_pmu_sbi: perf format
>   perf tools riscv: Add support for get_cpuid_str function
>   perf arch events: riscv arch std event files
>   perf arch events: riscv sbi firmare std event files
>   perf vendor events riscv: add Sifive U74 JSON file
>
>  drivers/perf/riscv_pmu_sbi.c                  |  20 +++
>  tools/perf/arch/riscv/util/Build              |   1 +
>  tools/perf/arch/riscv/util/header.c           | 109 ++++++++++++++
>  tools/perf/pmu-events/arch/riscv/mapfile.csv  |  17 +++
>  .../pmu-events/arch/riscv/riscv-generic.json  |  20 +++
>  .../arch/riscv/riscv-sbi-firmware.json        | 134 ++++++++++++++++++
>  .../arch/riscv/sifive/u74/firmware.json       |  68 +++++++++
>  .../arch/riscv/sifive/u74/generic.json        |  11 ++
>  .../arch/riscv/sifive/u74/instructions.json   |  92 ++++++++++++
>  .../arch/riscv/sifive/u74/memory.json         |  32 +++++
>  .../arch/riscv/sifive/u74/microarch.json      |  57 ++++++++
>  11 files changed, 561 insertions(+)
>  create mode 100644 tools/perf/arch/riscv/util/header.c
>  create mode 100644 tools/perf/pmu-events/arch/riscv/mapfile.csv
>  create mode 100644 tools/perf/pmu-events/arch/riscv/riscv-generic.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/generic.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/instructions.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/memory.json
>  create mode 100644 tools/perf/pmu-events/arch/riscv/sifive/u74/microarch.json
>
> --
> 2.35.1
>

Thanks Nikita for reworking on the patches. It is good to specify that
this series now depends
on Anup's patch[1] that adds the mvendorid/mimpid to the /proc/cpuinfo.

[1] https://lkml.org/lkml/2022/6/20/498

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
