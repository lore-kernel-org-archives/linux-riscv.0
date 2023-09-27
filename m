Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FD6E80A9B
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 07:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSNp7CwMBsRyIjlnT6wLN94tSEgBRmnUWGXH49zfZLg=; b=ReQ/BebwcEkOT+
	MZ8MML+0xcGMZBFlBB32WbOkBRoTrFATDhNM3IkUl3PgKwVEKrR/J9NkST6nFpV+/E/3+gFdlQ6Z1
	gAY8Oq2xXOPBZ6sxRU2gqbeJILo23C1b3QggP3cVTbY2469lwwLfc895Y7KBIjwyRufvn4Z3Wyf3e
	Z3gKzuPtaL4heFkhUx4vTrXZFgwyr4WqU0Hbx8HMhr6Efri7hr144B2kToDqNhqhDwoGrSuyiK5Sg
	XcFTmifrCsM72Bfxo2WrFxcqU9hKpJpcprNTMylEI+lIzyO7aYnTq8dnVbCKgEmkMSpd9t2SEpAKx
	/PTUTaf+qGchFnlqyl8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlObH-00097G-14;
	Wed, 27 Sep 2023 07:04:47 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlObD-00095l-3B
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 07:04:45 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9b2b53e17feso44288766b.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 00:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695798282; x=1696403082; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mUfHtwwTDrHdk2HONnb9D4bIQEZmaUosI6XyqFoIeCw=;
        b=Qalt1qJ9hpR5vLMl2B/2vYvrx5cNCEYIxCKy5BYAB4+7eZ3x8eXpHTZ5lgXV43UUW0
         IUfqsF9pdMi9kwiiv+nObfTHCQBG2+m6SR37icplSgqk4LAI1QHianq/KDQalh1YD2Nf
         Y2wYnCItTvMN6KdQ3v9GTgJJ+p/mGUUy+59f2czF9czRkk1SIbmUHlg+nOhFiTmNZEUB
         vPDL/n20KC6IzPIQ8Cgy3wibERiD/A31ojLn0v8e89wEYF73f+c/qV2iJGG17xTK2FHn
         Da65eY6ic2O3u0CwAzQOgxiYV/prfPPXT6dio9BSANPLgrb7JW6t8B2L4Q/nh3V87OKt
         5Qhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695798282; x=1696403082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUfHtwwTDrHdk2HONnb9D4bIQEZmaUosI6XyqFoIeCw=;
        b=bWe7bQDzyG3x7zlyoo+nE4cq+Pcj9H4BBrbl2VAuLGKfjSTRqxcUrU7x2t+EZQwsPZ
         6La7NzOs7PGLe9S+/uTokH4qMK48I6vdvH49bY6M/AAuNQDnlyEGH24RvE2kP/c9CJX3
         UwFyE+hqZDy86tDp25x0i7vTlIs6eoJFKPya0yJbK38w/UpnWK0HgMuzPPDHlxH9DiAI
         ztG9tTgDQMp6kP+b7PKF3SfD3l6wxEgHwk7yz8wghN8CXgfLexlFnq+Bm0ZrAGdtZThX
         4gYlnLsjZ2lSfUqCeX914sUSZ/KrRokUvTrcnM7DXqeyVd3NkfDaO8rsSufLb8pg/jcF
         1otA==
X-Gm-Message-State: AOJu0YxkQJEmfpe6UPGYJ1RBgOKpqQRosbOuUN6QtFbK1XDG87FNftl1
	LuDBSIuJ71kXRGHLuquoR7d5yw==
X-Google-Smtp-Source: AGHT+IGPRTkGC4Od1WoatDcn89FvS49OIiWfhQoFMm0Di906wf3KEkkApp3YAheBlq3xlop70aMjRg==
X-Received: by 2002:a17:906:21b:b0:9ae:46c7:90fe with SMTP id 27-20020a170906021b00b009ae46c790femr891826ejd.72.1695798282161;
        Wed, 27 Sep 2023 00:04:42 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id l9-20020a170906230900b00993004239a4sm8743056eja.215.2023.09.27.00.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 00:04:41 -0700 (PDT)
Date: Wed, 27 Sep 2023 09:04:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, tjytimi@163.com, alex@ghiti.fr, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: riscv: Add Svadu Entry
Message-ID: <20230927-d524858b10298a4e338cde02@orel>
References: <20230922085701.3164-1-yongxuan.wang@sifive.com>
 <20230922085701.3164-3-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230922085701.3164-3-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_000444_020356_BA055423 
X-CRM114-Status: GOOD (  16.46  )
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

On Fri, Sep 22, 2023 at 08:56:48AM +0000, Yong-Xuan Wang wrote:
> Add an entry for the Svadu extension to the riscv,isa-extensions property.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index cc1f546fdbdc..b5a0aed0165b 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -147,6 +147,12 @@ properties:
>              ratified at commit 3f9ed34 ("Add ability to manually trigger
>              workflow. (#2)") of riscv-time-compare.
>  
> +        - const: svadu
> +          description: |
> +            The standard Svadu supervisor-level extension for hardware updating
> +            of PTE A/D bits as frozen at commit b65e07c ("move to Frozen
> +            state") of riscv-svadu.
> +
>          - const: svinval
>            description:
>              The standard Svinval supervisor-level extension for fine-grained
> -- 
> 2.17.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
