Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85335C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 02:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KR+fat8ELqHe9ulq8PZ36Hdd/XeEcspBwpcUQZXGilU=; b=AMT7Wl19JBgi3M
	Lo+S9a1tPtLQP4XROs5uTPbK0VFLJXcKjCVgbfk6FZ14YDVm59wC4IYz1eamFgmqHCpLlXDRC/Bq6
	HpPDU6NwUrncj3ISUeJKkzuNW5K4As7cPNcjhVgVW8YqTHXBLVXWvMFznVolJSYkGXQd185h0vJSp
	UXAIxoMNBWRmCKn7R4uKWvWCMKvh1GPvTvsEfDeJs6Fqt22izFMx4LbPWaS3AfQrZD7311vG/Q5jv
	8P0fH3UsUt43c+WEPCZOScGzJkfpIF14XKKRcHBUCNHBEr+PTajCMxB50cAymqrTW9avRxhlw79sY
	CMr2vYF0+pPrQ8w54peg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVNyn-000zCw-L8; Fri, 24 Feb 2023 02:38:37 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVNyj-000zBo-TY
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 02:38:35 +0000
Received: by mail-pf1-x430.google.com with SMTP id n5so7255082pfv.11
        for <linux-riscv@lists.infradead.org>; Thu, 23 Feb 2023 18:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JRecAKZcY6IbQwyurCrABIbVaiA2PzBDQV3Z+P3MRuI=;
        b=CNs/JVqajIYC7MgPC9Va/OivfBI1AxWe1NN6i0WgWVrP3aM2ojjh1GNTlvPQaE4sUC
         rbFzdkj1hFdKLdtFkngfOFnh22XWCC6dPlb3l7/bVYcnWsoPsAYHR367jep2wHUi5Q0m
         FXzYJTsE1HdASYCoYJEr398Ubr9lnkPyAEpjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRecAKZcY6IbQwyurCrABIbVaiA2PzBDQV3Z+P3MRuI=;
        b=Y+kye9yh10TPGHb1Z2bZllSzXtey3N18kiafo+BxB8KpiMGIkYsr4TzV+QnahJAJg8
         6/E64BsDPnU3F9AZT19hMYLornIOUsR+Zh6HQ1RmseU0cb9CY54tjVObLs2WcRd9V03Z
         VOAKoKlT9ix45IONPiYUp4ebPw31e3ra28X6IwDMVkXxO3UNzozgsvvXJwM2uWTPisDh
         ZqBaUHO/cLtkGkV4ZPskQh2XZHCJZvnSbyqsKwNpLhymPu9JendpKBHINe0n3oktYcWK
         mOFbBGcssnXp2nXOSKTrVN6xp9K/jXAWp05GLGxZE6USn548OMWoGxMEHWUHtdd573w/
         fNDA==
X-Gm-Message-State: AO0yUKU30Hji26M27hap0WsIg8L2di33OYay0/UZs4TtT/so6fQ/3tTt
	skRwmM3fCoOOYS8v1sCMFw/T+5Dh9BKFW6d3WJqK
X-Google-Smtp-Source: AK7set/Pl4bgDi8YBHtTidAXSP+H3vDftz5DSWh0Vofi7bk5M4UMW7IhUght0gW5AAjqkid9OtVoW7Q3yNNWVKSGijI=
X-Received: by 2002:a62:8704:0:b0:5a8:9872:2b9b with SMTP id
 i4-20020a628704000000b005a898722b9bmr2481602pfe.1.1677206312565; Thu, 23 Feb
 2023 18:38:32 -0800 (PST)
MIME-Version: 1.0
References: <CAOnJCUKHq_8msJtU-H1JvWJ8nY94J0tcarQMBsPNpBZO8sP6HQ@mail.gmail.com>
 <CAK9=C2Uy_0B6D2TGq35sfrGkp9s1Td=cEsidzDPTDhG7Nq5EWw@mail.gmail.com>
In-Reply-To: <CAK9=C2Uy_0B6D2TGq35sfrGkp9s1Td=cEsidzDPTDhG7Nq5EWw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 23 Feb 2023 18:38:21 -0800
Message-ID: <CAOnJCU+EdF3sCpcNoOiPOCNwwX7bguJghqZccY=cUmku+Ak0=A@mail.gmail.com>
Subject: Re: Perf event to counter mapping question
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-perf-users@vger.kernel.org, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
	"mark.rutland@arm.com" <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Beeman Strong <beeman@rivosinc.com>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_183833_959862_6B565C02 
X-CRM114-Status: GOOD (  36.53  )
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

On Wed, Feb 22, 2023 at 6:55 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Thu, Feb 23, 2023 at 5:58 AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > Hi All,
> > We are trying to figure out what is the best approach to define the
> > perf event to programmable counter mappings in RISC-V.
> > Until recently, all the programmable counter/event selector registers
> > were writable in M-mode (highest privilege mode) only. The firmware
> > residing in M-mode
> > would discover the mapping from device tree[1] and the perf driver
> > relies on SBI PMU[2] interface to discover the mapping between event &
> > counters.
> >
> > There are new ISA extensions being proposed to make counters /event
> > selector register in supervisor mode as well. Thus, a pmu driver
> > can directly program the event selectors without relying on firmware.
> > However, the kernel needs to be aware of counter mapping to do that.
> >
> > AFAIK, ARM64 allows all-to-all mapping in pmuv3[1]. That makes life
> > much easier. It just needs to pick the next available counter.
> > On the other hand, x86 allows selective counter mapping which is
> > discovered from the json file and maintained in per event
> > constraints[4].
> > There may be some legacy reasons why it was done in x86 this way[5].
> > Please correct me if I am wrong in my understanding/assumption.
> >
> > Here are a few approaches that can be used to solve it in RISC-V.
> >
> > 1. Continue to use device tree bindings
> > Cons: We have to define similar entries for ACPI. It makes
> > virtualization difficult as the VMM has to discover and update the
> > device tree/ACPI as well.
> >
> > 2. Mandate all-to-all mapping similar to ARM64.
> > Note: This is only for programmable counters. If the platform supports
> > any fixed counters (i.e. can monitor
> > only a specific event), that needs to be provisioned via some other
> > method. IIRC the fixed counters(apart from cycle) in ARM64 are part of
> > AMU not PMU.
> >
> > 3. All platforms need to define which subset of events can be
> > monitored using a subset of counters. The platform specific perf json
> > file can specify that.
> > This approach provides more flexibility but makes the code path a bit
> > more complex as the counter mask constraint needs to be maintained per
> > event basis.
> >
> > 4. Any other approach ?
>
> I suggest a 4th approach where by default the kernel assumes all-to-all
> mappings and optionally perf json file can be used to override mappings
> for certain counters. This approach is more like a hybrid approach between

Do you mean override counter mapping for certain events ? I don't
think we should split counter space as platforms may want
to choose random encounters between hpmcounter3-hpmcounte31.

We can always do this. If the counter mask is not set in the event
attributes, assume that the event
can be monitored by all the counters. x86 does something similar as well.

> approach #2 and #3. It work fine with KVM RISC-V as well because Guest/VM
> will assume all-to-all mapping for logical HW counters whereas Host can have
> specific counter mappings.
>
> >
> > Any thoughts on what would be the best approach for RISC-V. It would
> > be great to repeat any past mistakes in RISC-V by learning from
> > experience from the community.
> >
> > [1] https://lore.kernel.org/lkml/Y6tS959TaY2EBAdn@spud/T/
> > [2] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc#function-find-and-configure-a-matching-counter-fid-2
> > [3] https://elixir.bootlin.com/linux/v6.2/source/arch/arm64/kernel/perf_event.c#L899
> > [4] https://elixir.bootlin.com/linux/latest/source/arch/x86/events/core.c#L876
> > [5] https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1978937.html
> > --
> > Regards,
> > Atish
>
> Regards,
> Anup



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
