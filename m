Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABB7C38145
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 23:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uYwj9P8nffvNkUXlNKYN8xoAaDes5AQkiyDSSumLVj8=; b=SllGzxsL/zGTrm
	zMk5W5kkRKGWnUcrAaPQxmQmXlHN4KHVeSbR5d9JsZb8Xk9nouo9vyGlrJb7mWYE4wBzEb0nb0snW
	eMDGcWYgAw1weOfxJ/jRNLmfhXo2QlzqsUwKtWPfCgMPRpbY7jGbp1nzTWpqJtNI7onsXbCsBCwNq
	kRfJKUdxX3a5m7JM/LDf/SRO7qChhIlesNMEONGCxkx/bRpXPPpVmnVZSM68dglCPeIkVI3fOlWmF
	CcDMYR0kiLvQfQEZc46CRoGdaIDMlo0JIgodsOgr3SLE//ixcuQfetDsQCZ10cDNQyUsnQP8LKvzn
	zEqBxXQ5e/rr6OnppLQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW4K1-00BLlp-DG; Wed, 07 Sep 2022 23:19:05 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW4Jy-00BLjW-IE
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 23:19:03 +0000
Received: by mail-io1-xd2e.google.com with SMTP id 10so12762565iou.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Sep 2022 16:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=5s+/z3LbG16phtl9JO7vOWUQlm5jNkM0JFVTs4xEW9s=;
        b=GPQ3jJEEy5M5EX1xdIrIdhDRh7M+5SaaxpNluTRX0qdq8pZH/NFDUkT1E1cya2Gudi
         6SYA6TWH5qyszXcE9MYGBKRGqN3dkLxtG6AZomv0IThffRJr6gYSugm54lcFzbm7HVNT
         82Hl7LGUfM4jElD+9WDa56y8MqJqqMmiNBaF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5s+/z3LbG16phtl9JO7vOWUQlm5jNkM0JFVTs4xEW9s=;
        b=UUe/ORR5uDcgh7j/X0mqs3UmOXwaHZ/c3v3w1V7iRI+MxydH3C/iEhMHu8JoOg9glJ
         a6763z2Imu7+ENOEY+o1Fd5rtrCGL18uf5vvCRPMfusbKrea3+LsUdX8+1HP7KQUUWGs
         rr/xEMvzKlmz0s8O6Lwbb0eCCOp9xZ7ek9dCsVvTECOzdeYmL8KPpDC0W75RVd5tWikq
         nF8n27kmz/JRyC1HfjnjtWI8ae+X2vxmjZAnnc03GIrSMZjuCEKnkVmRie56Avfty1dZ
         cRLL5HevMu0870n4VD5SSL0C/UVGFrlHL0vpXJFb0XCufpNlK1+FezPDX4kecPHk/4RB
         0tLQ==
X-Gm-Message-State: ACgBeo2gpmNcgOtR2Xu2hxGH84tCss5GmgMuO7Op5CHSGgFPUaT89Y9h
	8dpMU+nfTEr9feVhbtbd+fOnkX4pZIg0/N3/f2eM
X-Google-Smtp-Source: AA6agR4qVC6K53oiD5S2CXD4kDmiPRnlO9iJamA6NEcnBmtjeBcMDgfblyBkIw2bVgVaD5cRhH8CGSB3WRcauTPh+90=
X-Received: by 2002:a6b:c504:0:b0:68b:6802:2bfe with SMTP id
 v4-20020a6bc504000000b0068b68022bfemr2925600iof.22.1662592741648; Wed, 07 Sep
 2022 16:19:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220903161309.32848-1-apatel@ventanamicro.com> <20220903161309.32848-2-apatel@ventanamicro.com>
In-Reply-To: <20220903161309.32848-2-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 7 Sep 2022 16:18:51 -0700
Message-ID: <CAOnJCUJb0cYe=fcpAi4cnNatH6ukvFP+GgEQZhmx7t=niFLcng@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] RISC-V: Clear SIP bit only when using SBI IPI operations
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_161902_621540_3DEEC975 
X-CRM114-Status: GOOD (  17.43  )
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

On Sat, Sep 3, 2022 at 9:13 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The software interrupt pending (i.e. [M|S]SIP) bit is writeable for
> S-mode but read-only for M-mode so we clear this bit only when using
> SBI IPI operations.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> ---
>  arch/riscv/kernel/sbi.c | 8 +++++++-
>  arch/riscv/kernel/smp.c | 2 --
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 775d3322b422..fc614650a2e3 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -643,8 +643,14 @@ static void sbi_send_cpumask_ipi(const struct cpumask *target)
>         sbi_send_ipi(target);
>  }
>
> +static void sbi_ipi_clear(void)
> +{
> +       csr_clear(CSR_IP, IE_SIE);
> +}
> +
>  static const struct riscv_ipi_ops sbi_ipi_ops = {
> -       .ipi_inject = sbi_send_cpumask_ipi
> +       .ipi_inject = sbi_send_cpumask_ipi,
> +       .ipi_clear = sbi_ipi_clear
>  };
>
>  void __init sbi_init(void)
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index 760a64518c58..c56d67f53ea9 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -83,8 +83,6 @@ void riscv_clear_ipi(void)
>  {
>         if (ipi_ops && ipi_ops->ipi_clear)
>                 ipi_ops->ipi_clear();
> -
> -       csr_clear(CSR_IP, IE_SIE);
>  }
>  EXPORT_SYMBOL_GPL(riscv_clear_ipi);
>
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
