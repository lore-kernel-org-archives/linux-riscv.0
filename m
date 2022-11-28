Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3EAC4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 21:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TR2gw1vJ1r1aO/kvkG3ltlSfRdbJ5VMZcLKawh5QpeU=; b=2KVQ6mPIqAXY2O
	3/Q+EoFygzOayk6Iq0sVBY6EP1S0lA6qGxsJ+nRnWR535K9McocAZ9zAi5DgsM8tg3beQSUH3IGJG
	g59/C4xLFZ1IhNbPALw7jlHXFadh9+jH0aM4/PRkcgJsnLKME5j4fFiJnx9tW6x2yPN5/iPzRFM0+
	AXI4ZbBPMPf1fzsv0yGDNRQJCX36kv2I+1tAGZoEaGn3hhx81NPA9AWx7SPVsTPzo4YrBVM7FVw8l
	sxN3Vulkpbie+f1jj9/kfGzaIOhofEE7YDJfdQvTjhKo9/sFIWnoN0zYPpHVF7JFNUZ9gL4FWLYAv
	c/Fjn7nsGDO50TF7dr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlIY-004Qeo-6S; Mon, 28 Nov 2022 21:04:18 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlIU-004QcU-F4
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 21:04:16 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-14263779059so14626599fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 13:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SvghONPmEycpXKEDzwtsdLuUDXpxFtvRPy/fapLeKnM=;
        b=o6Fj92Ju3+pgrUluEjOukrmTz3rwVQBkHUKOWiMh+CCtPK+y6qtR41g5/BWfygTP7H
         xUpRHjDLcG7cuFrbXw8TXr69x1GdvsvseK297FDOzDJJLdDNGwalmuW64gj77vJWPzSN
         azsPUZ4/UR3WJFy8+gam07/CmoMo0RCIaRiwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SvghONPmEycpXKEDzwtsdLuUDXpxFtvRPy/fapLeKnM=;
        b=Rb+LMsy9jpDj/AIuBVSRgT10x34nTgS2H6+q7FRcrK0U85XLejU2O/ay9g3wQ/TKLT
         EYa8+me9uMXvtLfRDWDlxD2xEWw0IEgjjk+jlR8u7xXDZR7T8e94Y0ClzgLCgwJ9tvwy
         d19KmgDstsL1G3NNIvTSbRKEK9MtZQBTK426zMyxcvWoVhC14Kh3uMWE59mQT/MeELsv
         HspUQikQZJ902cRhMFO0Bi9ldZLNZlQ0PrbmXUdY2dWaHvWjfSGWGTjTHvBgPUJaDH3g
         aZ1bQn/WHcMbf0/PhqJ/ixLevvG4WPEvRyFUV4pAV3wZmMIF0ivUzEVlo45KfST+liR9
         qcJA==
X-Gm-Message-State: ANoB5pkStjYu6oJ1tgRx6VegFpIseLDfRf9HnJUCOTqrJm0H53Le+yj9
	d2Ebs7OZ5ZiIEYYJjte6yTfDIENgQURAQA/swq1O
X-Google-Smtp-Source: AA0mqf4co8CqCxZuftAiHxiWs+NzUxhecUpLAKa/YIcGpdqfE6qObE/kk6R8vBF+hyJylgsZJThVh7HMO8M18bmy204=
X-Received: by 2002:a05:6870:c18a:b0:142:870e:bd06 with SMTP id
 h10-20020a056870c18a00b00142870ebd06mr26804666oad.181.1669669452816; Mon, 28
 Nov 2022 13:04:12 -0800 (PST)
MIME-Version: 1.0
References: <20221128161424.608889-1-apatel@ventanamicro.com> <20221128161424.608889-3-apatel@ventanamicro.com>
In-Reply-To: <20221128161424.608889-3-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 28 Nov 2022 13:04:02 -0800
Message-ID: <CAOnJCUKPaFeHfgf2xYaE8tSK6wKqMntMHD-KnMr5n=vLxSC9+w@mail.gmail.com>
Subject: Re: [PATCH 2/9] RISC-V: KVM: Remove redundant includes of asm/kvm_vcpu_timer.h
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_130414_524736_FBC48C9D 
X-CRM114-Status: GOOD (  12.66  )
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

On Mon, Nov 28, 2022 at 8:14 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The asm/kvm_vcpu_timer.h is redundantly included in vcpu_sbi_base.c
> so let us remove it.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_sbi_base.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
> index 48f431091cdb..22b9126e2872 100644
> --- a/arch/riscv/kvm/vcpu_sbi_base.c
> +++ b/arch/riscv/kvm/vcpu_sbi_base.c
> @@ -12,7 +12,6 @@
>  #include <linux/version.h>
>  #include <asm/csr.h>
>  #include <asm/sbi.h>
> -#include <asm/kvm_vcpu_timer.h>
>  #include <asm/kvm_vcpu_sbi.h>
>
>  static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
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
