Return-Path: <SRS0=pdFK=IN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD95AC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 16:52:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33D5A64F34
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Mar 2021 16:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33D5A64F34
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GJwSOOzV3QRL2Qy6dX+3Uw20XxzahXte/GwKpj/KYOs=; b=Iod1hWu4t92NjES0d3GkfIZNp
	BNsBT8IgafbarsL8CJhuFtghqLtT2WZd/PapJAZTuwGX/+YAhHFOOptYGMTIJfnVM1RX/FDTJ+Sjc
	zIeWc0XGNkvfzw5x8OwLTLkRYMRkYm7IELQGjxEYRv3ph9ZbNgtFd6sSF0hqa/I/aoQSmmqqwkAAy
	X4haMquwcyT9SlCrBSd2Zdp8LfFpzossFY62HNse/pKOzihCVrgCZ1FZnbM4vIqHpsshlo+gr0zUX
	1sPER5PiDIRSxC0EoA2FnGUzp4d+IB+tqhwhwE8Tn1V2ebDdP8kN4NLgXoO8H8jKuOCPyrD+rnQe5
	Ijr7IZknw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLqSJ-00GOsC-9Y; Mon, 15 Mar 2021 16:52:35 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLqSE-00GOrp-5I
 for linux-riscv@lists.infradead.org; Mon, 15 Mar 2021 16:52:32 +0000
Received: by mail-il1-x130.google.com with SMTP id p10so9997539ils.9
 for <linux-riscv@lists.infradead.org>; Mon, 15 Mar 2021 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I0fio/Xr/Ly6DyTgEWQynoHoUq6FwgIyQD271+C3RNY=;
 b=UQ19CCehLZ660g3s3UPDiQx535TvUiWgMD5fu/qA3K/dzYjT77TFq13R9EOTAezL9q
 ISwnWhv8I/A1AYTKjs3nImttMkCOF8Wrocgf318Wu0nARlPajUeNMhagGDQeKJ/Qfcy8
 8qhveUh5V9mYbrLh6juQLBttB7iYNlU6XKfrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I0fio/Xr/Ly6DyTgEWQynoHoUq6FwgIyQD271+C3RNY=;
 b=lWKsO/Lp4QK0lcs27TjqvalvxVMUCnx8fYqfPegxr+2eX1n66eUQp1iGMeYX42E90W
 3r/SUqbw7KM7S7pmKiLE6+qHbT+DMBX3R51S40FYpcISpbWCS+vEyKSVns4PmXfr0b7Z
 ToOz3kcWIFazc+dylJknIqqhb7+Q8vaPrekODltdNqi5ReDf1g3RKeYYHDJ7cvxUeXHp
 RCo7bh7VL1kYP4SV5SrTstz0EgSQjZ2UQlXnZqmVs5OZuYuu/ren4PgrshdE+aeC1pU0
 nt41t/4qVliVvinwqeIdNrRO7FKOHjb+hZryBU6D+vyOUcubRbC0Pa7gmYNDo5C5RZuu
 8uNg==
X-Gm-Message-State: AOAM532M/NeJqnDUBWVomT3vHgeeAcPScFly1Kro8q3WSEBuit5cKurc
 xYOxMant9BaB81L7b7TAgmvhA5PQw9fWBBzh5IEzQ2olNg==
X-Google-Smtp-Source: ABdhPJxtAb/xjNeIJFH1q/5hHI/w3CXBjeigYEpLIX9eKpoGGREben0fqn6/MiMpnQWd0Va6CG7RJR/CgkxudOaAjcU=
X-Received: by 2002:a05:6e02:1524:: with SMTP id
 i4mr395752ilu.147.1615827147940; 
 Mon, 15 Mar 2021 09:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210315110500.802897-1-anup.patel@wdc.com>
 <20210315110500.802897-2-anup.patel@wdc.com>
In-Reply-To: <20210315110500.802897-2-anup.patel@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 15 Mar 2021 09:52:17 -0700
Message-ID: <CAOnJCUKnU_dzfT39vnxhwHi9Yea-i7oZ2NmHU4L22rzv8VmW8g@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] RISC-V: Don't print SBI version for all detected
 extensions
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_165230_403764_12F9A090 
X-CRM114-Status: GOOD (  16.57  )
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

On Mon, Mar 15, 2021 at 4:07 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The sbi_init() already prints SBI version before detecting
> various SBI extensions so we don't need to print SBI version
> for all detected SBI extensions.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/kernel/sbi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index f4a7db3d309e..c0dcebdd30ec 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -577,19 +577,19 @@ void __init sbi_init(void)
>                         sbi_get_firmware_id(), sbi_get_firmware_version());
>                 if (sbi_probe_extension(SBI_EXT_TIME) > 0) {
>                         __sbi_set_timer = __sbi_set_timer_v02;
> -                       pr_info("SBI v0.2 TIME extension detected\n");
> +                       pr_info("SBI TIME extension detected\n");
>                 } else {
>                         __sbi_set_timer = __sbi_set_timer_v01;
>                 }
>                 if (sbi_probe_extension(SBI_EXT_IPI) > 0) {
>                         __sbi_send_ipi  = __sbi_send_ipi_v02;
> -                       pr_info("SBI v0.2 IPI extension detected\n");
> +                       pr_info("SBI IPI extension detected\n");
>                 } else {
>                         __sbi_send_ipi  = __sbi_send_ipi_v01;
>                 }
>                 if (sbi_probe_extension(SBI_EXT_RFENCE) > 0) {
>                         __sbi_rfence    = __sbi_rfence_v02;
> -                       pr_info("SBI v0.2 RFENCE extension detected\n");
> +                       pr_info("SBI RFENCE extension detected\n");
>                 } else {
>                         __sbi_rfence    = __sbi_rfence_v01;
>                 }
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
