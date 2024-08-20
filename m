Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00475C531DF
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 09:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MAy1+czhm0uO4WC3MN5LqTc7nJAM6GNh7WTRC1Awe5k=; b=MEduubFF4+RkFM
	7i1x3dRx5W7ThE+nh9lIxXBOkP9QXt4mVcYZ2Ze0JIYHJSCHQtT0cc/N47P+zT7a7H1QnpLAAguio
	BMn6cFL4YfBShs23bP0xORbydvgrzrrQXaGqRuTQcR3bpQHx0oY5WpxM57pWBcND3acPIT3dD7Qw/
	gSKi3OHVJVkzqqWAADXWXCNDLT4ctYmmCml42ykXtHRi5QXj0QVM8zVsJ+37QUFDBs7ciYxslYG8z
	QqXBZfR59Rlsni/AENKVoUPXHaQmPRWMjrWJWeY1NnhW0GmPvCcOac3CrXA915lbR7/Y5ihNYmME0
	baU8JtlZcG/0xhv/Ucvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgLHT-00000004bCQ-0L5F;
	Tue, 20 Aug 2024 09:35:59 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgLG7-00000004ajh-1d1y
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 09:34:36 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e115ef5740dso5589996276.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 02:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724146474; x=1724751274; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UDPgJBCq1kxO9wbeFyugQyBH98hbT0XIZ0Mk7Mav/Tk=;
        b=FE4bxbN/gR/09uGVxKftIau4OVwrKgp8OcQvoJSeWVEH9xNIHXTKCTQmN12P0/U9py
         IkynYlbC0Zg9OEiE3Uf0KzGfkiUYxqg3VJqHnJFZy17ZmUt4vqyLVjHeEJo+3ZhPMisd
         LP2rjJ5KOR0rfG0JPWi5X0jntO37P0N49vQTr3OF8MpIbDVdnLud2yxn0JlLfq3RjzYO
         i5sOZ4RITv+Y78duQROARDJ/FZN0i2FZTRJeL47sGFx+Z1n5/HdbctIf1/p+CVFTBkPB
         X4r+uiuJRk/ObCiuwh3m+peKBFcddUTnLTxEd021MOooN4AIqX1LTb1LyPxQNXKcGI2s
         MEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724146474; x=1724751274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDPgJBCq1kxO9wbeFyugQyBH98hbT0XIZ0Mk7Mav/Tk=;
        b=rXeZ/cyzj7dRH0Thg94fEp1l5ZhxmUVRNwjry2aT2ET+BwXpnC4VPZNDO/H9sHTAOg
         y6oxLVM1yjTN26Wm1eriBvdwj8G5zTbLzuhxZgIjCNUpzKZwd2FKiEUlGYzWvUIklWo4
         cpaJ6e/gbXlupXPr+W1Znxy2mWhC5oUM/dx6BdJRH1LKbTkh25HHppsS90iGUHdolOlh
         2f2q/HJrKCjdUFibXgbDgmF3/RC5vus3vspXptJsbMuJy5xneTNuyKL2EdvDg0gzn1H1
         fN5NE0BPUbjA25YzI1KEMug1K5VO6tOWG+v9PlIM8jrt97Wnk+vgCOhAQyAPseQxUFQu
         EW7A==
X-Forwarded-Encrypted: i=1; AJvYcCWaxvupmwbhS8GGrQIA0hbv4AVRw5rCr16GQLW+M3ZGFGh5ECkXye4qygdsc8kZRcogG0FA5AtRwq3n5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwudveKzyMYXcVDcaQp0E2iPtWgDMH27G2T59m7+dxjHSBLREYg
	9DMQz5IFwoP6XVor4a2NaVioeRLHn6RKQRRIi/H889LAu1Df/yzJmAij2CsphKFDIcodKGb87Ud
	MJQusTQK4sZsRMcjKGRG2hVvaO7unSwJ71PgVKQ==
X-Google-Smtp-Source: AGHT+IG+n9FSFEOe1JiKKz3Rk6QBY5s4AnGwrZNnNZD361hchMNJL5Kyar8IXmLLJIBCe/aZ1QdLIcBPSSESXxqy+bQ=
X-Received: by 2002:a25:8204:0:b0:e11:7ecc:3b0b with SMTP id
 3f1490d57ef6-e1180f45d93mr13140044276.14.1724146474273; Tue, 20 Aug 2024
 02:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240816150931.142208-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240816150931.142208-1-krzysztof.kozlowski@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 20 Aug 2024 11:33:58 +0200
Message-ID: <CAPDyKFpVmELdcK8WXe-3OgenF9nHMM1Om4JW=UkSBKycfkQhsQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] cpuidle: psci: Simplify with scoped for each OF child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_023435_461529_B9E2114C 
X-CRM114-Status: GOOD (  18.25  )
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

On Fri, 16 Aug 2024 at 17:09, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index ea28b73ef3fb..146f97068022 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -142,7 +142,6 @@ static const struct of_device_id psci_of_match[] = {
>  static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>  {
>         struct device_node *np = pdev->dev.of_node;
> -       struct device_node *node;
>         bool use_osi = psci_has_osi_support();
>         int ret = 0, pd_count = 0;
>
> @@ -153,15 +152,13 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>          * Parse child nodes for the "#power-domain-cells" property and
>          * initialize a genpd/genpd-of-provider pair when it's found.
>          */
> -       for_each_child_of_node(np, node) {
> +       for_each_child_of_node_scoped(np, node) {
>                 if (!of_property_present(node, "#power-domain-cells"))
>                         continue;
>
>                 ret = psci_pd_init(node, use_osi);
> -               if (ret) {
> -                       of_node_put(node);
> +               if (ret)
>                         goto exit;
> -               }
>
>                 pd_count++;
>         }
> --
> 2.43.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
