Return-Path: <SRS0=AX01=6O=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEC3C47247
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2020 18:23:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E88A92064A
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2020 18:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mpd7htfo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="FSwI7Ok+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E88A92064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vzID6dyyEtHnb8W3jUC+1MMjyOI0QnfADZmAC1ounFo=; b=mpd7htfoVYYIvp2ReMfuNQ4gQ
	6/i4ET7S8ryteSoeDzXvwqtiVIhgpfv64uz8I+uqHauAnim+7MPPYuxlYlvOGNrqgoUzxhtjBXTs6
	fHFr4hpdGpZrhDANKKsMba3IQC6S71EcgkjNMDgeNRqdNYQSLd4cQLHYJdPLWxTPkUU+uhoS6/hZ/
	sm44a2cQlDGQ4shcizEwTXDrA8V4XVtxlgcebaM/uqQxftyIUnugi5jpf+Cb2Kdz4yyqP5hVE3lS7
	6HAucJRC2gBqlLYDq1Qu2HYFBgjK8VbdyHBRMttSmltal/u/2EhUySLO+Dj29a5Tce4kEJE/vLeOh
	OxiVkNUlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUDqc-0004m5-K6; Thu, 30 Apr 2020 18:23:46 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUDqZ-0004kZ-GW
 for linux-riscv@lists.infradead.org; Thu, 30 Apr 2020 18:23:45 +0000
Received: by mail-wm1-x344.google.com with SMTP id u16so3135985wmc.5
 for <linux-riscv@lists.infradead.org>; Thu, 30 Apr 2020 11:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vzID6dyyEtHnb8W3jUC+1MMjyOI0QnfADZmAC1ounFo=;
 b=FSwI7Ok+WljTVqHuemSfgBv/l0IPhqe998/WQWww0qZd4jkx/oFKkGXTNi4jWZwtti
 MRho365ZHO1V33E5E1q6Y2VY+PO5wNd5GVfdPXWEK/V8/zY2Owg+oW/HR3pGcU30Mq/Z
 vo3ZN2VBw7fklcpV/jZgKkSyrG8KCx4b6K10I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vzID6dyyEtHnb8W3jUC+1MMjyOI0QnfADZmAC1ounFo=;
 b=t80cAAjCZtHzceXi7HgE+3EEcyL2XOjj+t5gq0vKaQtosc6OiPIeGUjVYAQgPmYwZf
 IdcbWZgChs7IB0hqurSVBG2TSNqTHG4Sj6LU2VbOa/C3a2HcFgoNcmaZBZHR8ly+hpaN
 QPsvbAYpQ5T1IGARXlMayV8gQk8DFQguOnCeMESlFhqOibvG+9T4Y4w/U5z9aJzXJeGT
 gZWKLbMgZJJc6TEgOp8r1TVRlZ7l35+cGeOv3EDPO7IY0b4ik68DXyzFq4kk4EG6LMnq
 0hqpL/ngaUhc3bBE+AQGVknp4VfXqZSXTOmIS++hkObtforoHUC3fv+ntqUE96l+l49A
 POLw==
X-Gm-Message-State: AGi0PuYaFtPiQ5cbVU98L+HQHT7RgS2TiRBbJvKgca2AnPrFRa87d/6R
 hi9jnIFWman2Q8Zsngmp4l67BHXImINTZUPAZvBW
X-Google-Smtp-Source: APiQypILI/sgZPbbAbvkcpFWeJGx8Ba1qT+Ddq2hduj1iLMhXXXt/vK891UT4CSsJL6MxfikcWFDtk05fG+dazKB6/c=
X-Received: by 2002:a7b:c38b:: with SMTP id s11mr4348218wmj.55.1588270990928; 
 Thu, 30 Apr 2020 11:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200430095325.111441-1-zong.li@sifive.com>
In-Reply-To: <20200430095325.111441-1-zong.li@sifive.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 30 Apr 2020 11:22:59 -0700
Message-ID: <CAOnJCUJBJ3wrY-KY3YgD-qJfr7dsWzdA83fxFYmOTmjsrYgOfA@mail.gmail.com>
Subject: Re: [PATCH] riscv: force __cpu_up_ variables to put in data section
To: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_112343_599667_5470D5D5 
X-CRM114-Status: GOOD (  14.24  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 30, 2020 at 2:53 AM Zong Li <zong.li@sifive.com> wrote:
>
> Put __cpu_up_stack_pointer and __cpu_up_task_pointer in data section.
> Currently, these two variables are put in bss section, there is a
> potential risk that secondary harts get the uninitialized value before
> main hart finishing the bss clearing. In this case, all secondary
> harts would go through the waiting loop and enable the MMU before
> main hart set up the page table.
>

That would be only true if you are using random booting protocol with
SBI v0.1 implementation.
With HSM extension in place, all the secondary cores are waiting in
firmware. The booting core
will bring them up one by one from cpu_up method.

The HSM extension is already available in OpenSBI v0.7 and Linux
kernel 5.7-rc1 onwards.

> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/kernel/cpu_ops.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
> index c4c33bf02369..0ec22354018c 100644
> --- a/arch/riscv/kernel/cpu_ops.c
> +++ b/arch/riscv/kernel/cpu_ops.c
> @@ -15,8 +15,8 @@
>
>  const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
>
> -void *__cpu_up_stack_pointer[NR_CPUS];
> -void *__cpu_up_task_pointer[NR_CPUS];
> +void *__cpu_up_stack_pointer[NR_CPUS] __section(.data);
> +void *__cpu_up_task_pointer[NR_CPUS] __section(.data);
>
>  extern const struct cpu_operations cpu_ops_sbi;
>  extern const struct cpu_operations cpu_ops_spinwait;
> --
> 2.26.1
>
>


-- 
Regards,
Atish

