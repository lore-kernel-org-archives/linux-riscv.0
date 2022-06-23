Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1972FC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 17:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2Cl5F9t2zivGfNDHOkS+1UrJ4UZz9BOmhtsHMcNKp4=; b=oSEFtl1TEKR2C/
	o45L0TSaiMLXjz198QbdC0HwxIuYkm0FlwJcsRQ5j7wfgfjuql8+AUc/ihCWyI9CAG0yN89paH1lE
	jnyvj9cN9MntWdf0gxBhpYgp2fUS7aj6CBzOdpdhGiATOIo/SUbo5DDbHngKN6Pnu+DrXZuNKLxWR
	s71RApLDhsZz1qajuJbJZbprWKOjq3gLDtIn5z2cPEls14PX8i+Wc/y25PsxFjxzO3vwAw19q2Yh2
	6i8wA0YT9Ay+wHuPQkJ0WzuZg8Oow/ZJdSvWkmGAo9sYngXu48+f2waVb9mRD6FKveEkZT+x0Wjea
	u8s4zwAEwUWrCx+hP/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4QyX-00GBiN-SS; Thu, 23 Jun 2022 17:50:41 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4QyU-00GBh4-Ts
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 17:50:40 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-31772f8495fso1866107b3.4
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 10:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QR3F5Ug2YKiCBYos1Ma+wqwgb4BpkHC98ailsd+Raks=;
        b=WV6ot3EYn+MfIqbsLHBu3z5aakHyzSoiHNCTAmFups3JwINACWpw7LRExzN9iufaWg
         4e2S4AyaqvGdvFxe1u1nCAkt7QAwxNoh9VuoWfmqGPdWKqubd9ZcAcK7bxmz8ENalrLy
         HHPUnbj6Lha23LMWeF3ocGNYMmwFI4lZOzCgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QR3F5Ug2YKiCBYos1Ma+wqwgb4BpkHC98ailsd+Raks=;
        b=kUnF+cGuUSd7sTJgTQrpqiODQ8m/ypAihCj6rdZI01LOQfomVNVU6awLDfHXm78wKx
         9am+qbN76KiDm52UJgw9x49HmUmxD695fghUCH0m4mn1JE04BBPinQ9kY9jRpi6YvdkI
         r+im5Yj+q3+gvK/hgNLDNxxpwhZII8nkdwGgarUBmCdS+bFa/m4ndI1/l/Cg/AAHn+bJ
         D2XY6g+BRtkJm5Ylv6NFnZXxg9chcCGmNMfQ/1Q1/l64KIstK3qzj0cAnQYyuKbMp0XL
         ctk7fECMl9HdjlTMgjPBg1MDG8s1NsO/TwGRIVgsXngP6HrZltFDnsIpo/drN2o2Wq9x
         K9Ow==
X-Gm-Message-State: AJIora+KOsIjAgk1ljKSiRNRnJuPZhtsW7SUgvNK0qMB8jv1yPDjsuBn
	bBtLn0OV2z+MVrcGH9aQOLlBVrxExl3EQKfBf8tEt2oN906w
X-Google-Smtp-Source: AGRyM1uAcq8inIfo7nwtblh79IAiwjYes86fCsSHIzML4fs3gLm+QYDmm8ey1sBhYOtpM4Ja6bYdHcatci0/FSgXRW0=
X-Received: by 2002:a0d:cbc8:0:b0:317:95ef:399e with SMTP id
 n191-20020a0dcbc8000000b0031795ef399emr12089904ywd.340.1656006637396; Thu, 23
 Jun 2022 10:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220623112735.357093-1-geomatsi@gmail.com> <20220623112735.357093-2-geomatsi@gmail.com>
In-Reply-To: <20220623112735.357093-2-geomatsi@gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 23 Jun 2022 10:50:26 -0700
Message-ID: <CAOnJCULorBMqCSjV8+s_5EhfNUgz7yS_BO-etC=7_NmTF8Sf1w@mail.gmail.com>
Subject: Re: [PATCH 1/3] perf: RISC-V: fix access beyond allocated array
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, Anup Patel <anup@brainfault.org>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_105039_231914_0F9E5E72 
X-CRM114-Status: GOOD (  19.03  )
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

On Thu, Jun 23, 2022 at 4:27 AM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
>
> Both OpenSBI and Linux driver explicitly assume that pmu counter IDs are
> not expected to be contiguous. Namely, there is no hardware counter with
> index 1: hardware uses that bit for TM control. However counter array is
> allocated without that assumption. As a result, memory beyond allocated
> array is accessed. Fix this by adding unused array element for index 1.
>
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index dca3537a8dcc..3e0ea564b9b8 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -453,7 +453,7 @@ static int pmu_sbi_get_ctrinfo(int nctr)
>         int i, num_hw_ctr = 0, num_fw_ctr = 0;
>         union sbi_pmu_ctr_info cinfo;
>
> -       pmu_ctr_list = kcalloc(nctr, sizeof(*pmu_ctr_list), GFP_KERNEL);
> +       pmu_ctr_list = kcalloc(nctr + 1, sizeof(*pmu_ctr_list), GFP_KERNEL);
>         if (!pmu_ctr_list)
>                 return -ENOMEM;
>
> --
> 2.36.1
>

instead of this, get_info for loop should be restricted nctr as it
should be zero indexed.

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index f9cf6c62aaea..0722fe2869aa 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -491,7 +491,7 @@ static int pmu_sbi_get_ctrinfo(int nctr, int *num_hw_ctrs)
        if (!pmu_ctr_list)
                return -ENOMEM;

-       for (i = 0; i <= nctr; i++) {
+       for (i = 0; i < nctr; i++) {
                ret = sbi_ecall(SBI_EXT_PMU,
SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
                if (ret.error)
                        /* The logical counter ids are not expected to
be contiguous */


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
