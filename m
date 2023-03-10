Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71206C64EC4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 17:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zSRzSTMmE4vlzLNlM7hN8v3ZmxjaJ13jwmfQ9DXdoE=; b=j2gCRbHA+HpHK0
	GqLrv/uHkprQ1N9rgplRTaOMk2kZF7RmDL2iEx5B+vuqYKmjuOzam4JrZ3GIa7Nvz/mjIkEFV2GyV
	4yhgTOMJHT/PIvHTmn5l4ZblRr7s5OojlIpLlIXQqOFQXuPRcRVs74+RUbGvf5JHys2I+UjHDO2O+
	i9IxgD/n/3fWqGCUMRQz7cydoOudyrvAKSjYxQmNhYO07u51aIbWKVSTMc5HClmczlWoYYi4PDRbc
	13lYlBSELnoLALwxtplgW6fOqbriwsoFyS1MfF9iPF4hOsu9cpH+f7lfGa1OxnqVZ7m4jDZ03cGOm
	UZx8qQnnx/v7jgNLZxSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pagqJ-00FezH-2E; Fri, 10 Mar 2023 17:47:47 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pagqC-00Feuv-2d
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 17:47:41 +0000
Received: by mail-pl1-x62a.google.com with SMTP id h8so6392831plf.10
        for <linux-riscv@lists.infradead.org>; Fri, 10 Mar 2023 09:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678470457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cxGEPKOwr+tmbFiOp83p4hK/QKt7HqPKsBOKDzMhBlo=;
        b=H8XP1MoNcr9KjteVGhX7zomURyl8s+0CZ8OFezv1JoRblg1566OYEafcR01mg4DhWw
         36uFcnFShxOwidS6iMe0fCiWfQegp8tsjuegktg2Q7jSVKuJmQ6S3PfNecL3zUmaUUaU
         V2bj7a00LdpAgDfhvKB28e4PvPKY28lcG1+bnG4KShTw6fhx9t8dL9DKOLzELjHL/b0u
         bY3MV78r5K5zGnHB7DFYPn5rsmyMz5SdahEiQFPAluhXDrjz+YySUyEmsqckqImvHejX
         0mK20SbzE9qKWWtoUa7cMhFkDmyMvEQyIhrEEUkrnFDeYMK9ILOuPscqxi7lbtyPfUD9
         Q/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678470457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxGEPKOwr+tmbFiOp83p4hK/QKt7HqPKsBOKDzMhBlo=;
        b=aNPDOBCIvcgxU2+26WymqZB7Cjf9WDPvsJbpjUQSTLim8Pr+JL6OYzJ59r6vtMMIcL
         YvFJh6EIIz1e10Kd+uYgOH1QXFiVsHldHfc62Cfphi0I6YNs3V/KdL828CfMBzjpGefw
         PzyRQCpWhs5hh4I97cVG5y1d8f+/wxuF6h7DpC1PslSiNiyJ/c4tPhZwIi49vxwksaTz
         8KAQUWm0ws3s4yN4TALyDR3pPKi1fMCbjPQBnZXAwZJn6d1vxAwuzlmfQHqh9ZGfIpCo
         xf60q20+eOy0JRSTZrYca9Am63K0+c9+c5su7CI4aT8rlss6O81REbR+hPYVhgcox9xK
         mMKg==
X-Gm-Message-State: AO0yUKUqYfIXi4cBmCHVmaqDFY5cwvVmbglA18PIWbaUsyrXVV5QwR5e
	8wh1WjiuFlY8XZRJoUEUAbY+9ak6Tfpri4YbvZlCeQ==
X-Google-Smtp-Source: AK7set9qlzyfJQkPmeS1QvtKn+DzHcVEf//e44mpadhloRlsZ0QlMRrI+kEDfbQXl075/XuicaWTao1yhsQc5P/VAV8=
X-Received: by 2002:a17:902:edc2:b0:19a:9834:bb2c with SMTP id
 q2-20020a170902edc200b0019a9834bb2cmr10491816plk.11.1678470456953; Fri, 10
 Mar 2023 09:47:36 -0800 (PST)
MIME-Version: 1.0
References: <20230310144703.1541888-1-robh@kernel.org>
In-Reply-To: <20230310144703.1541888-1-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 10 Mar 2023 18:46:59 +0100
Message-ID: <CAPDyKFoVUQEmseNT+dZFJDfwh7ijTwUs5_NckpZLhRQ=VuFpFQ@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: Use of_property_present() for testing DT
 property presence
To: Rob Herring <robh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_094740_156378_A8D75C26 
X-CRM114-Status: GOOD (  18.93  )
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

On Fri, 10 Mar 2023 at 15:47, Rob Herring <robh@kernel.org> wrote:
>
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Rafael, can you please pick this via your tree.

Kind regards
Uffe

> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 2 +-
>  drivers/cpuidle/cpuidle-riscv-sbi.c   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index 6ad2954948a5..e875ddadc51b 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -165,7 +165,7 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>          * initialize a genpd/genpd-of-provider pair when it's found.
>          */
>         for_each_child_of_node(np, node) {
> -               if (!of_find_property(node, "#power-domain-cells", NULL))
> +               if (!of_property_present(node, "#power-domain-cells"))
>                         continue;
>
>                 ret = psci_pd_init(node, use_osi);
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
> index be383f4b6855..1fab1abc6eb6 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -497,7 +497,7 @@ static int sbi_genpd_probe(struct device_node *np)
>          * initialize a genpd/genpd-of-provider pair when it's found.
>          */
>         for_each_child_of_node(np, node) {
> -               if (!of_find_property(node, "#power-domain-cells", NULL))
> +               if (!of_property_present(node, "#power-domain-cells"))
>                         continue;
>
>                 ret = sbi_pd_init(node);
> @@ -548,8 +548,8 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
>         for_each_possible_cpu(cpu) {
>                 np = of_cpu_device_node_get(cpu);
>                 if (np &&
> -                   of_find_property(np, "power-domains", NULL) &&
> -                   of_find_property(np, "power-domain-names", NULL)) {
> +                   of_property_present(np, "power-domains") &&
> +                   of_property_present(np, "power-domain-names")) {
>                         continue;
>                 } else {
>                         sbi_cpuidle_use_osi = false;
> --
> 2.39.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
