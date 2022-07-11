Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788E9C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 07:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lfnYcbVzEiDHqBe5SAd2zA4+jCHnaNfqbFPey98GgDE=; b=LbBe7yWqBl/MvT
	LuCkIvIm8WDcjZE/vepU5z2eWuLMlbBIOP2QWugPym+k1gp7QM5L8GAIrbqjiNnIcyaGoSPF7ocwI
	/CY62T0Bi3sSaJFRWw9J2j4wHckuMbFJzqgJT2INBFzC2PWx6QL0iMnwF+TqBeHvKcUqXE1GPHFdH
	49ZkG64Jf5tWCOXZD6OSvi8eIFRjIA0YjU+MbNF8PrQO2FfJS60GEv5nUtLVDWn3jvSAZfA3LFw0P
	SuEjwV///0E+UuAl8VRfMy53Ip3obuGkktFftgE3etofA1YofM26MXbmyvmqo8uB75NO6dqVLvslX
	AB15RCiXVEjsmqRlKGiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAnrm-00Gpef-SP; Mon, 11 Jul 2022 07:30:03 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAnke-00GmDY-Db
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 07:22:41 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-31c8bb90d09so40075077b3.8
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 00:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y8trC8rSj8LJJnC93dLqX+chDcPnfdwwMyl4Nzbuadg=;
        b=Dc2EP4Vjl7k5H/A+bV2LnIUm3ZNrpRfsH6U8wYuu07edvJLuOchj4OqafcymLJmIaq
         vIthG4t9ROW40Pdf4YoMYT++Aqer7J/xcTEHD/KQcv4kny2Sup7b0Gbaoq88jO8unqf5
         mlfiY8sRl0DSYlRlXYJEoS0/tJzaSTmzAsQrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y8trC8rSj8LJJnC93dLqX+chDcPnfdwwMyl4Nzbuadg=;
        b=nbbpae/j+bTlmtQtRBSZFF5fqdl8Fp5v5VqPYiyS85n2lOIBYWgG8Ody1tgasm7OXz
         s2GAHuOjEp5q23r3ocNkwndDRODizc9qAR8M5r5jrHV98FCIQ81L5yMWdJ/rb+Z83y6v
         dBnzvDENSOz+Ms7jAyqpf9ie1zPakmEnyRbbL2nkxnRirTFw5ff1g02O7Fo0F3tTwOM2
         /R39CoVpm+0yI1Pn29rvSP5nfQv8OYdC5E2ZB97h7Y3SinOCdutYyz2jefwlmH6ijZt4
         Qrfs3icsGNg8KiHUv3BHak1TeXzFRZ43ST1otST0mzylMg8R0WntSa0uVKjlMNXOAyed
         ae0g==
X-Gm-Message-State: AJIora9ZytT7Onu+SejjX6c3WtkXIBAysFAmXnYRBW0/gz+6W6X3TyYq
	ZscwKt9aUjAz5UrWFB36zmKE9CI6h2TFbGaBKb36
X-Google-Smtp-Source: AGRyM1vw4YMd2eR9eidznqyIKXsLjeX3DDvFbFUCJ65Ovb0ZMGPZgUY0YxGECoFq+xVB2uO8jemps2+YvVlZSLo30g0=
X-Received: by 2002:a81:9acd:0:b0:31d:2fd7:3331 with SMTP id
 r196-20020a819acd000000b0031d2fd73331mr15499839ywg.145.1657524158378; Mon, 11
 Jul 2022 00:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220624135902.520748-1-geomatsi@gmail.com> <20220624135902.520748-2-geomatsi@gmail.com>
In-Reply-To: <20220624135902.520748-2-geomatsi@gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 11 Jul 2022 00:22:27 -0700
Message-ID: <CAOnJCUJq1TL+52QFCrmSBWQ2rPKb9yK63mjaAJ54NL3ABN1=-w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] perf: RISC-V: fix access beyond allocated array
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, Anup Patel <anup@brainfault.org>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_002240_684533_F9D0043F 
X-CRM114-Status: GOOD (  22.33  )
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

On Fri, Jun 24, 2022 at 6:59 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
>
> The root cause could be related to the interpretation of the number of
> counters reported by SBI firmware. For instance, if we assume that unused
> timer counter with index 1 is not reported, then the range is correct
> and larger array needs to be allocated.
>
> This is not the case though since SBI firmware is supposed to report the
> total number of firmware and hardware counters including special or
> unused ones like the timer counter. So just fix the range in for-loop.
>
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index dca3537a8dcc..a5d25b51beac 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -457,7 +457,7 @@ static int pmu_sbi_get_ctrinfo(int nctr)
>         if (!pmu_ctr_list)
>                 return -ENOMEM;
>
> -       for (i = 0; i <= nctr; i++) {
> +       for (i = 0; i < nctr; i++) {
>                 ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
>                 if (ret.error)
>                         /* The logical counter ids are not expected to be contiguous */
> --
> 2.36.1
>
LGTM.

Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
