Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAD8C433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 04:34:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36EFB64F58
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 04:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36EFB64F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z7MvvxQiYmsd4aCoB/xewAq2PXggemHFujxEIIlUZcc=; b=NuBJ4bHRF0SKcdr0m01Gdk+ki
	rUqSTpF+7VhI6ub6UYNaew/8dT1A8uBrd3IKfklGyr27WDoJJ1+IW/WpSUw0ff7Q6eYOW4iEky9bM
	qStcUnJd1tDSqW8d0eFSEUXBG55q5rSJ4pPMTpatgxnkZIAQirBLRsLhTRAjxsbezRf0haJeiKABy
	hNtmUJP2kGct0OO5SCKSojICl1fEdygaRa3uumjEUX9eCKAY5egqpzhFrwkeSptrSfZfZ8DkibVYp
	byrvaDehw5hElL74AWgpwn0kfyiPuYsqB44U3rK89jk2lo0r+LmSvv8SS/Qnd52aAk85m4UfAdMYp
	KA2KeZ9Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7spE-00078r-Py; Fri, 05 Feb 2021 04:34:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7spC-00077y-BJ
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 04:34:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id f16so4881101wmq.5
 for <linux-riscv@lists.infradead.org>; Thu, 04 Feb 2021 20:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jAica2vDP1q/VnsGptZCUgryouD6m2iuWm5pWmo73/8=;
 b=IwIwEkWboYIh/T9gL0Ri0alGJIf2LkWSUw2UpU5d/TWfOyKAM6tDTkiYfq9mPClxhG
 RNezv+J7lfWK0WB/wOJkoD2TooHSCFt8H8IbuHQBBbXw9xxyut/vPS8312H+TVjwoK9z
 /sjo807gnmdvBLnRPH8AQEA6SIBrwHkDQEV7oAEDfuePo96XUe4bneKsuzC5bQoUI4hC
 DEyvmts7/qQMdzDH8BQVY7B7NTHS8RdGsq910p7w8o6BcN6c/xMlVGOUuRVYhUqYFMlK
 5BDTnOKZcc7WFOYxhuA49wNtl+fSevbSKO0eAZHc/K3Cwy9CjK3vY3wvnz0mLtgcN51p
 8iWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jAica2vDP1q/VnsGptZCUgryouD6m2iuWm5pWmo73/8=;
 b=NSJZcVszVXmOkRz6nm3qmLWIfkdJdckte1KCyjilHk5SJwiesY3tG2Kw9F0ekoI6UZ
 Qt/YS2E3gTu0SUnXyNKoaBJ2nsoJFhpr68UgyPEf7/XszkHe2B1DcSi0H+9ur1HGZhZ0
 NvQYsSKUL0EMR8VBRDU0HBxwdpmWbh1poGi7CLC6hehAwa8vQlw/o3kka3+jqYR5QPXg
 SiD2tQeTCPZ+iwRcJw24E/GxVQ70qArM6uPoiptlrf/s/dxaRiJ8wLIgW0s+vzoHWSRX
 LQEdNp16bj4QzXK8RgF+U6GOySZz9xDKEs9dD8MY2BHbNz7aSHZlRiYWj2cfTsP01EOu
 Qpsg==
X-Gm-Message-State: AOAM531wyiKgndPht3dVAoVcC5u062VrZQYystGhMi7P3oeGLl2qRm2D
 ty+I0+irJJIwProGhwrJe0gXOwOQXIYKpPPRJRmrIA==
X-Google-Smtp-Source: ABdhPJx54wFfqNAcNeeb/Q3cD6Rxwuo54eE3SxXFvBomyMvyvBq3l5OQNBOA+LkQ1blV19pt3+PGMe6q9Z6It1v87To=
X-Received: by 2002:a1c:1b12:: with SMTP id b18mr1766706wmb.157.1612499668935; 
 Thu, 04 Feb 2021 20:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20210203125913.390949-1-damien.lemoal@wdc.com>
 <20210203125913.390949-4-damien.lemoal@wdc.com>
In-Reply-To: <20210203125913.390949-4-damien.lemoal@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Feb 2021 10:04:17 +0530
Message-ID: <CAAhSdy3VCxjijSDrKmHAXN5LqV6N93Q=cZR86ai_whVc71Y=3Q@mail.gmail.com>
Subject: Re: [PATCH v15 03/16] dt-bindings: update risc-v cpu properties
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_233430_401397_9FD3F272 
X-CRM114-Status: GOOD (  17.51  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 3, 2021 at 6:29 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> The Canaan Kendryte K210 SoC CPU cores are based on a rocket chip
> version using a draft verion of the RISC-V ISA specifications. To avoid
> any confusion with CPU cores using stable specifications, add the
> compatible string "canaan,k210" for this SoC CPU cores.
>
> Also add the "riscv,none" value to the mmu-type property to allow a DT
> to indicate that the CPU being described does not have an MMU or that
> it has an MMU that is not usable (which is the case for the K210 SoC).
>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
> index eb6843f69f7c..e534f6a7cfa1 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
> @@ -39,6 +39,7 @@ properties:
>                - sifive,u74
>                - sifive,u5
>                - sifive,u7
> +              - canaan,k210
>            - const: riscv
>        - const: riscv    # Simulator only
>      description:
> @@ -56,6 +57,7 @@ properties:
>        - riscv,sv32
>        - riscv,sv39
>        - riscv,sv48
> +      - riscv,none
>
>    riscv,isa:
>      description:
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
