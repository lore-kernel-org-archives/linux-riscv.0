Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DF2C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 09:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnyl0EEWLM3mjxtfkqTVNKDXk1eBy30kzvARn7nTd5g=; b=rbzCBBEgBFPfjP
	pmIpb3J//JpuFBHb5lku0rczeBUx42Byn7+cIUkChjGyxtmgdQWjDMLettGVc0aCed4SvLxo/w4qh
	14n0ugOAXmp8Hkdb6m3wdaVBAZ4Mb0ge7/LSLQANS9wYATdM+9UaO0QAoi+eeSc/WalJvC+BbV/qz
	dMj5smlWCBySyvSv+upv1Ps2hQ7rNAAQ1vXuQz09IAL+FgdCpfbXinEYIy5RLIFAWt0fbmlXdO1qb
	HbWVwANc29VG/Y/vwV4JlcRodmUU6Mds9XGi1IEHpTSPK+rLZ4HAPfuWRbsXfetSQWbMnYYMfJ6A7
	sSjsb4wq4GnURVivdUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmwH-006zmk-7a; Tue, 31 Jan 2023 09:28:29 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMmtz-006yfS-VY
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 09:26:11 +0000
Received: by mail-pf1-x436.google.com with SMTP id g9so7722031pfk.13
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 01:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iuOgM24FK59+MffbRIrpSxSdYJY4cKp8hxWLQ7aDyK0=;
        b=mDT4gnR+VFMLC+hvEwWESSYsHhM3swOUMRQkP7LTrvMO2H9o2ZwcW4L7joLuD/XQwX
         owIFiUtwX0EGsPgrnDgoORXLCKM8QzfTDMe8BfdRvCFHYRYmBU13DPROvapuJO+ATfiL
         /5nWa+4I5Ki0TZMWoDyQoeXTyxNcprRRb+lSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iuOgM24FK59+MffbRIrpSxSdYJY4cKp8hxWLQ7aDyK0=;
        b=wBOZ+cX/2OGHYuN4rYwbUw/nsHt2Wgse9GQLMcliAzZ72ONrwS6awUH4wrZTP2dkYC
         k0wWc8aTSiNahICAUSQIlVJj/fcCVS8JQ81dgmatuxifhK2ZlXmcK32wkrK2abWcJ0Ty
         1GabTPYYHl4gFFUV0BspnPSJTdd8hdl0AAN0tWrh5RMFsI7E0roYJ/1tJqe4If0siu4R
         wjrF8QGpGJxvkoSV6hfSvifYh49CsLEd1rktaBuEt19X1H6HX4z8nT0SxQwWwbzd6MYm
         1ZGdpmKzorQFqvt+EsAsfmMdwifxKQ/2zksByQQzqwACwEFxVCJ2WPaljnfbFG9O2KYt
         XItg==
X-Gm-Message-State: AO0yUKWY626Ep5o7PE9L545uVh6+zZ00pyrMpNnnK/Sr/oPdJTCrIx2I
	VtEmOsNmlzbFAti7Uc/MJT2YnOIPWWH+HQzZWWUF
X-Google-Smtp-Source: AK7set/MSOrSxz1qNdOEo3o9mrx0RsLwAY3Thk/17kJxDWGdCN+7K9AXDb2PlDva9XbGN0WlRZI59ue/ZbriaRWQtuw=
X-Received: by 2002:a63:510a:0:b0:4da:6df2:f28 with SMTP id
 f10-20020a63510a000000b004da6df20f28mr2526765pgb.36.1675157166777; Tue, 31
 Jan 2023 01:26:06 -0800 (PST)
MIME-Version: 1.0
References: <20230128072737.2995881-1-apatel@ventanamicro.com> <20230128072737.2995881-3-apatel@ventanamicro.com>
In-Reply-To: <20230128072737.2995881-3-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 31 Jan 2023 01:25:55 -0800
Message-ID: <CAOnJCUJnEMxQxjDtzAJe5_0edi=1pQLVE-LDeQtH9bzn7+O4rg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_012608_075103_6BE82681 
X-CRM114-Status: GOOD (  15.41  )
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

On Fri, Jan 27, 2023 at 11:27 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We have two extension names for AIA ISA support: Smaia (M-mode AIA CSRs)
> and Ssaia (S-mode AIA CSRs).
>
> We extend the ISA string parsing to detect Smaia and Ssaia extensions.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 2 ++
>  arch/riscv/kernel/cpu.c        | 2 ++
>  arch/riscv/kernel/cpufeature.c | 2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 86328e3acb02..341ef30a3718 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -59,6 +59,8 @@ enum riscv_isa_ext_id {
>         RISCV_ISA_EXT_ZIHINTPAUSE,
>         RISCV_ISA_EXT_SSTC,
>         RISCV_ISA_EXT_SVINVAL,
> +       RISCV_ISA_EXT_SMAIA,
> +       RISCV_ISA_EXT_SSAIA,
>         RISCV_ISA_EXT_ID_MAX
>  };
>  static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 1b9a5a66e55a..a215ec929160 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -162,6 +162,8 @@ arch_initcall(riscv_cpuinfo_init);
>   *    extensions by an underscore.
>   */
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
> +       __RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> +       __RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>         __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>         __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>         __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 93e45560af30..3c5b51f519d5 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -228,6 +228,8 @@ void __init riscv_fill_hwcap(void)
>                                 SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>                                 SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>                                 SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
> +                               SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
> +                               SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
>                         }
>  #undef SET_ISA_EXT_MAP
>                 }
> --
> 2.34.1
>


Reviewed-by: Atish Patra <atishp@rivosinc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
