Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8ABC531DF
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 09:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xsQicBdkdrVkOADP6jLKRL27fLb9zFbhvnGeNMACn1I=; b=xHCj9KhcNKBDFm
	SoJ/Ayo6KdUS9VnsGwBteyD4aVhL+H3Iyd7z64njZTT8Pw8wmphi/9Ir84xOVD0QuJEVwjatixdMP
	/Jhvfm7NrZ+XDdB5WqE3ONmJmsxwqblzKz65kY9ZDu3ICjOtCiQ2iGzBC3cWlAKMjHdOyOktet2eO
	Yeu9fmxS7tOIXeyHxwu0BpI49NrAd+rp+YYsCjsvBSYlWUf0YLZdVyonmdRHyjHmI5rJJXvJOMGOS
	V7Q5F4ZuDvlPtSr/vYYHUG5eBlEsykOjppSvVEH+niHZrUoRmjph2D6JPD2M8Z611MAHFsZyn/rF9
	RKHsuJ8TY8pMUGp0d60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgLIm-00000004ba3-1Waw;
	Tue, 20 Aug 2024 09:37:20 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgLGA-00000004akn-3UIf
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 09:34:40 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e1659e9a982so257729276.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 02:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724146478; x=1724751278; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ByHOgOffZ4FCUab4oBWyAbW75LpWNmQMey2scrFqOl4=;
        b=S0yLdPDgIipZya1G1Gbh4GuhTXTgxQlloqwhxZrzWT4DogS6/dthjui4srFDbMoV09
         eOIETjCyMHqY0ZdPeTxPUoK99luTkD0nyozShzaEt8t+/+MBgA2lR0CwX2yWQFBFVb0g
         GU/ptFyOhCqPD34Id9YodzAbHqJ4J7TQfnBVN0/XD4mvWtr5+Hvgp3+DZDuxwKlToSIX
         tj06uJ0mcDYCF38a1vCPQMUC+L1vbquKJoUwGcayS3Rxl5GAG8ZQYgNfgvP16WDhIGhu
         EKAMI2cH+shsR8yX6qqryUEZQ7ISi3rozLS7A/2oWVTB9s6qcTcdDb0jNDMqYO+3w8l2
         9wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724146478; x=1724751278;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByHOgOffZ4FCUab4oBWyAbW75LpWNmQMey2scrFqOl4=;
        b=WUd/NpTidGn+Td7GhoqmkTuOAeE/3XKThdNgyIpz6MfBtI7t/2psCatXdPHjyqAEv6
         kr1qbCc/5Vr8ciMn9SpwHf9fmz1V2xbyGwN0sFFeUhbMjpa2jQp0ZvmVSVxTxY3sIPAF
         BrrTa+QF5DM8BcN4QG42wdOPAMNvc5PUGbKp3EfNrocXXFArRMItSYAz6OgD1w6pj2AR
         84WkJnOYzcBInVw2CSHSpTrETmTm4j36AgB1aBJHCvHWKfgvuZlNwnCkT/YiNSABOtU1
         d1yKddo8sMiYnF8bKy+FW7Fp+oHo7C20hTQKVq6YzukNG62Z0gbnA+qefWvyhPhZ8hEh
         FCbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwn4Fe/FMI7B3wEmnw/+57ot/8r2XH3ZUvpYR6EyhDlg7+AZK8lidW4YyxmaaKQBuGQcK93TcdXCWyLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWU4Y6WveT50Zz0zZutSkVqzdhrizh7l7UzhDXJ3umLDU46Sm0
	vgv3M0D54IulHPnWY/2mwIxAmzSpG2i6d90wcIoUDsjBugN4kc1U+lJcnQUtK0NTtovJjf+uf7U
	oxoMY9SngbPm2LxcE/3C+uWrtVtmYImENiuJG9A==
X-Google-Smtp-Source: AGHT+IEbxH4GptztooNFuoXDju48XVH90lm30Q/Q0dq7s90J5WvHI8CWcxOQbTh1Wo9JikFSeK8fTVrWlAsuHtUWMNg=
X-Received: by 2002:a05:6902:2183:b0:e11:5e69:37a2 with SMTP id
 3f1490d57ef6-e16513bf2femr2009936276.40.1724146477730; Tue, 20 Aug 2024
 02:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240816150931.142208-1-krzysztof.kozlowski@linaro.org> <20240816150931.142208-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240816150931.142208-4-krzysztof.kozlowski@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 20 Aug 2024 11:34:02 +0200
Message-ID: <CAPDyKFrh4hUrw65SurJpZh=oqq31E1FsJOpV8i30uqceAD2bfg@mail.gmail.com>
Subject: Re: [PATCH 4/4] cpuidle: dt_idle_genpd: Simplify with scoped for each
 OF child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_023438_896010_8B46E9AB 
X-CRM114-Status: GOOD (  14.71  )
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
>  drivers/cpuidle/dt_idle_genpd.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/cpuidle/dt_idle_genpd.c b/drivers/cpuidle/dt_idle_genpd.c
> index 1af63c189039..203e9b754aea 100644
> --- a/drivers/cpuidle/dt_idle_genpd.c
> +++ b/drivers/cpuidle/dt_idle_genpd.c
> @@ -130,11 +130,10 @@ struct generic_pm_domain *dt_idle_pd_alloc(struct device_node *np,
>
>  int dt_idle_pd_init_topology(struct device_node *np)
>  {
> -       struct device_node *node;
>         struct of_phandle_args child, parent;
>         int ret;
>
> -       for_each_child_of_node(np, node) {
> +       for_each_child_of_node_scoped(np, node) {
>                 if (of_parse_phandle_with_args(node, "power-domains",
>                                         "#power-domain-cells", 0, &parent))
>                         continue;
> @@ -143,10 +142,8 @@ int dt_idle_pd_init_topology(struct device_node *np)
>                 child.args_count = 0;
>                 ret = of_genpd_add_subdomain(&parent, &child);
>                 of_node_put(parent.np);
> -               if (ret) {
> -                       of_node_put(node);
> +               if (ret)
>                         return ret;
> -               }
>         }
>
>         return 0;
> @@ -154,11 +151,10 @@ int dt_idle_pd_init_topology(struct device_node *np)
>
>  int dt_idle_pd_remove_topology(struct device_node *np)
>  {
> -       struct device_node *node;
>         struct of_phandle_args child, parent;
>         int ret;
>
> -       for_each_child_of_node(np, node) {
> +       for_each_child_of_node_scoped(np, node) {
>                 if (of_parse_phandle_with_args(node, "power-domains",
>                                         "#power-domain-cells", 0, &parent))
>                         continue;
> @@ -167,10 +163,8 @@ int dt_idle_pd_remove_topology(struct device_node *np)
>                 child.args_count = 0;
>                 ret = of_genpd_remove_subdomain(&parent, &child);
>                 of_node_put(parent.np);
> -               if (ret) {
> -                       of_node_put(node);
> +               if (ret)
>                         return ret;
> -               }
>         }
>
>         return 0;
> --
> 2.43.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
