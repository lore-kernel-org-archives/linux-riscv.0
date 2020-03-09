Return-Path: <SRS0=yxlK=42=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20A5C10F27
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2020 11:59:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B85942051A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2020 11:59:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RcdDtN9C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="0lWcvhhe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B85942051A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HKmPOFNtNKhOUxrBtZH5/PcOP5JpmW7NzOHUh/0ofj4=; b=RcdDtN9C4sp3Kg6nRXacQPBN4
	At7XL8KbR3wuaiCx45OSdnXA02cyUmMjS2uE1MAAob1By+roiXEO1Q4TQsFQxbBiYlNto4HiP68tp
	twoIAkO6JJyOE2YxiI1uM/lNzkmbX0/FjLQdiWNtdoaipCP3G/g64aij6xeatabzfKOiF9ku/wWoN
	xg8arm7gTKPANIA+mNFeyoUos7616JLD1oqNSzezXL7PVsnNJ94SDdiA02WJnCtsvViTrQBBgn7gh
	0L/5c0PhtMBs2k5BhKfDOEGCfe86k8j0zDdbCxRksKHiQL5eHXkH78VZNSVskPIUDcKrWvqItR4ZE
	YLHrpnclA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBH3t-0001SG-Rz; Mon, 09 Mar 2020 11:59:09 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBH3r-0001Rn-Nt
 for linux-riscv@lists.infradead.org; Mon, 09 Mar 2020 11:59:09 +0000
Received: by mail-wr1-x444.google.com with SMTP id v4so10723035wrs.8
 for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2020 04:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HKmPOFNtNKhOUxrBtZH5/PcOP5JpmW7NzOHUh/0ofj4=;
 b=0lWcvhhenS7r9ioqD+cOH8VnAb/YTLj+dpwAVIlaLYoxMjz7tp2ZXBtMlNiJz81A3Y
 d2e1cUD205lLiuRQlTy879Qklwo3HwDmlpp4hyL2b7pVyyeFuo0w30VFwpE0SWU4pioR
 Kn8VsJbJQmBbnGv8sSsYq+n0lMtokU4rBDqHj18lVIYq87OqrGLhF/cGJnRgcFRSAkeY
 e+RUHW7V/6WZGW+MyshvLcbmpwfSLTtaHp6K1cAvGodnDMSBcfMmoowXKe2ndUIXuKJC
 Mp+rzoB/UYi8LdFW+KvUVTY1JU/RL4hWWMQzgOf6OUrZD587JvE9icooAHDb9Pps9H6D
 2B6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HKmPOFNtNKhOUxrBtZH5/PcOP5JpmW7NzOHUh/0ofj4=;
 b=pz5BavjHuYr3THge9jN9U87IUt0PAGt8P+L8HILB4fs4b6TBWuYwN/by2vixrBycpY
 sAwsjuzMxT06ErtEnH4C+o5tSfHVlXthz+e9ko5Envzkj6h0JRp/SMW1LdIausTeBxNS
 clx/nqlkhrH06T7nFUIQ4wiEo8OLjcdIaa86FlG4NsdJe18O1mzRzyqx8oW4lfoft1EO
 DlqFHM2Zt8R4nqrR1WD40tx7Cy16ze3htt5bPv1cZNIPIrG5Ttun5FHscGqUqI2Wr5ci
 dHWj92nbc243PoTSpIqCJwwENiWgjWnwYwJuvlLJXXB5MhmyMv7Z6rr/mgFcDcdiV8+T
 rOng==
X-Gm-Message-State: ANhLgQ3qMdQGy4D8CZhrDuCx+1eMQcAspXV4hi9T0kSAZzlj0kE4g8Aa
 0r9T84K69gPvyNIYrmcB2cSS5yuO9JWSvX+tyiM96A==
X-Google-Smtp-Source: ADFU+vv9DD16vHL5eDuYyG5Zfo7yZZUS+CSxVSUAykezHxmSIhC6p8Dq342GwdWFZ4WDvxJ2o4h4bAHnsmZC3HgcdWI=
X-Received: by 2002:a05:6000:4a:: with SMTP id
 k10mr19657020wrx.381.1583755146375; 
 Mon, 09 Mar 2020 04:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200309110211.91130-1-anup.patel@wdc.com>
 <20200309110211.91130-3-anup.patel@wdc.com>
In-Reply-To: <20200309110211.91130-3-anup.patel@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 Mar 2020 17:28:54 +0530
Message-ID: <CAAhSdy23nKn+DqVmmG+4Q4LXZ2qE8eLLUu=si9zO3y8usdA=HA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] RISC-V: Rename and move plic_find_hart_id() to
 arch directory
To: Anup Patel <anup.patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_045907_786656_3AB22A65 
X-CRM114-Status: GOOD (  17.14  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Fixed Marc's email address.

On Mon, Mar 9, 2020 at 4:33 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> The plic_find_hart_id() can be useful to other interrupt controller
> drivers (such as RISC-V local interrupt driver) so we rename this
> function to riscv_of_parent_hartid() and place it in arch directory
> along with riscv_of_processor_hartid().
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/include/asm/processor.h |  1 +
>  arch/riscv/kernel/cpu.c            | 16 ++++++++++++++++
>  drivers/irqchip/irq-sifive-plic.c  | 16 +---------------
>  3 files changed, 18 insertions(+), 15 deletions(-)
>
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 3ddb798264f1..b1efd840003c 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -75,6 +75,7 @@ static inline void wait_for_interrupt(void)
>
>  struct device_node;
>  int riscv_of_processor_hartid(struct device_node *node);
> +int riscv_of_parent_hartid(struct device_node *node);
>
>  extern void riscv_fill_hwcap(void);
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 40a3c442ac5f..6d59e6906fdd 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -44,6 +44,22 @@ int riscv_of_processor_hartid(struct device_node *node)
>         return hart;
>  }
>
> +/*
> + * Find hart ID of the CPU DT node under which given DT node falls.
> + *
> + * To achieve this, we walk up the DT tree until we find an active
> + * RISC-V core (HART) node and extract the cpuid from it.
> + */
> +int riscv_of_parent_hartid(struct device_node *node)
> +{
> +       for (; node; node = node->parent) {
> +               if (of_device_is_compatible(node, "riscv"))
> +                       return riscv_of_processor_hartid(node);
> +       }
> +
> +       return -1;
> +}
> +
>  #ifdef CONFIG_PROC_FS
>
>  static void print_isa(struct seq_file *f, const char *isa)
> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> index c34fb3ae0ff8..be05d13e30e8 100644
> --- a/drivers/irqchip/irq-sifive-plic.c
> +++ b/drivers/irqchip/irq-sifive-plic.c
> @@ -236,20 +236,6 @@ static void plic_handle_irq(struct pt_regs *regs)
>         csr_set(CSR_IE, IE_EIE);
>  }
>
> -/*
> - * Walk up the DT tree until we find an active RISC-V core (HART) node and
> - * extract the cpuid from it.
> - */
> -static int plic_find_hart_id(struct device_node *node)
> -{
> -       for (; node; node = node->parent) {
> -               if (of_device_is_compatible(node, "riscv"))
> -                       return riscv_of_processor_hartid(node);
> -       }
> -
> -       return -1;
> -}
> -
>  static void plic_set_threshold(struct plic_handler *handler, u32 threshold)
>  {
>         /* priority must be > threshold to trigger an interrupt */
> @@ -328,7 +314,7 @@ static int __init plic_init(struct device_node *node,
>                 if (parent.args[0] != RV_IRQ_EXT)
>                         continue;
>
> -               hartid = plic_find_hart_id(parent.np);
> +               hartid = riscv_of_parent_hartid(parent.np);
>                 if (hartid < 0) {
>                         pr_warn("failed to parse hart ID for context %d.\n", i);
>                         continue;
> --
> 2.17.1
>

