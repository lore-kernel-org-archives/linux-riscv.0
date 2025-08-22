Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38844CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 09:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MSGpIvjme+gJKW3Ox5HzgDRrwce9bEXRr/vGcTYB+Ds=; b=NghILbl6HLezYC
	5Qiqa63SGcr4zwi0Ms3vs5xHz7o0P7tJkbRVDGgoreVsoK7Fim+/8CgopTZ/teaeoqJX1P/a7l6IK
	jpHFC4JvcLLtgR5zzLejncMK12umkQ4b5RdLTnkXW8dThS8jaJn7GYXMo8HLj2kMxQZj5Scgw6beL
	juUWaCtO8ah4rJ+y0viI4lWn6kwXnGJWehxVF2mcNTkXn3LoF2vHXZsODVyL9TCOv+B7Ps+m61CJJ
	i/w+hYCFjJCuMRaPcqxsBKjOB2kbls8g7kS4sgHz+9yynNlaXymyOD34SiFW/z7DDr+jfKEzXKUKl
	xOwHqDCbPuIahEaItgUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkgH-00000004WCs-18nl;
	Sat, 23 Aug 2025 09:37:01 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upaMX-00000003beY-1ABk;
	Fri, 22 Aug 2025 22:35:58 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-76e2eb3726cso1906367b3a.3;
        Fri, 22 Aug 2025 15:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755902156; x=1756506956; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0FwDTbQ/G9GOnQP/jL8VoYGNnb8b98LqDD6ErxzxZ3A=;
        b=I/8k9L2SEuBt6qLyyE56vHqXGy36kJluQ/JAcsoavf44ymkeQbg2fbmp77lo/hxoTq
         yOVwxQpyqDB6KFp9Fxz7o5KkdCOf44dPPtxI/7Y8n6tCdL6D4UAbKN++aRXM96Vm6PXn
         knpO30Waqnn8ZU5LcoN5Uyr3lpRLAluhx7pEqlIcsbrfA3VKOzgvaCxJA/WuWLq6oNNn
         KbNZQKjTg205G0HSh7e3KDzVvlJj5wqyC+U5s226t9Xzq0Md2/SiLyWe3pHVZ+Z57QCu
         Tn9bMqU5og8M/4Y/zsSwzG6lc6muCR8O/k5u3oUUuSiALhiYANkRf5iz76fn6eWJbmpT
         /IwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755902156; x=1756506956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FwDTbQ/G9GOnQP/jL8VoYGNnb8b98LqDD6ErxzxZ3A=;
        b=AInTbUhexS/9beZ+WkX221ks5h740GOA9PioC5u2iWJmT3PxzFEFkMKOdMFn7P/rMN
         QT93oloUKRHnTzDrgnifpxZNhufwHfB+RmGX/dByZU4OycTDVK63B7VrYgtHl0DPo4AS
         CkTL5+BmlK8zLtCNCYZjPmOJdJ5Z7aqsBhgdzWJA34I21bZkRo1f93wAfjRUOargD4+L
         Xgim5xfUDMBd6MZJvEC15jGcLTXnZo6EN4gSBQD01SaRI0vkpxDhYwRbYuZSvmyxEnPb
         DEaN9E7EZFaEFnATTNnWLMtYzuu7DkNaSvlC/9xqaz78AuaXOClaqIqZKtt2aCTp6jX5
         6Vhw==
X-Forwarded-Encrypted: i=1; AJvYcCUj4jjBniRUZ3prae0CcwQ8skuN5DMNSQ48S5AWT588p7KqMygmR2FGpbfPy41ZmuSh2kUQKXaOIMw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy394k9IvnA1S0y2uiAWP8UlOjBDDNsW4MlfZYM3Gk/5MRQAJJj
	0uCaAKRvbAayCrUjWM5Fn0V8CBpQnBOcMAvQRimP4aSAZsMw5gsx7xJD
X-Gm-Gg: ASbGnct6qsozHYLle3x0wKmro5Q5uJ8uHrevyPzeo/HnGASsM6VqRRoWfP5QJGxMYCk
	wJdnSWE1HsvAumZHSQsFelhSWvLBQ5WMWU7D/lgfwwef3zSYaNP0g96ES8v4nUlFyw8GX/wGz1+
	dMh/73uNC6kmf+aEEwrFwl1PVNmsLOEfc1KJyAUzq4BXUSrvAVuZE+DUS9WJPR6wApOG9Wnx1xU
	OfZ+Nsjus2Jlh3DzhkjfMVwK4ID8snm8nc2oeIe4DoNvdBM96Clor5Ck3lP2DeeAN3J3BaSVqFO
	0ABreZmiMkzufwXTRAO6w1O8S5Q+T4gR6fh4X/TGMCsu/5zdgCW6CRSHW1V7HKyYtvMtPRaVBks
	7lQBXZH6/1qJPq8fJdRdtaQ==
X-Google-Smtp-Source: AGHT+IEYCh8C0L6ZZn0L/gbp+7wJ7PcWlxjsVE+Dj4tzEhoWhx2t2CE2bxPom3RqYKmnOJkBIwjJZA==
X-Received: by 2002:a05:6a21:32a8:b0:240:3c3:7ffa with SMTP id adf61e73a8af0-24340dc8405mr7563526637.43.1755902156183;
        Fri, 22 Aug 2025 15:35:56 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3254aa4f9e6sm802727a91.16.2025.08.22.15.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 15:35:55 -0700 (PDT)
Date: Sat, 23 Aug 2025 06:34:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, anup@brainfault.org, 
	pbonzini@redhat.com, shuah@kernel.org, cyan.yang@sifive.com, cleger@rivosinc.com, 
	charlie@rivosinc.com, cuiyunhui@bytedance.com, samuel.holland@sifive.com, 
	namcao@linutronix.de, jesse@rivosinc.com, inochiama@gmail.com, 
	yongxuan.wang@sifive.com, ajones@ventanamicro.com, parri.andrea@gmail.com, 
	mikisabate@gmail.com, yikming2222@gmail.com, thomas.weissschuh@linutronix.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v1 RESEND 1/5] dt-bidings: riscv: add Zilsd and Zclsd
 extension descriptions
Message-ID: <znik7dcyeipf57xerlm5gwjszcaaeujoukr7g4a7wt7lsfu366@skany6k7agt4>
References: <20250821140131.225756-1-pincheng.plct@isrc.iscas.ac.cn>
 <20250821140131.225756-2-pincheng.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250821140131.225756-2-pincheng.plct@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_153557_315892_8CD9DBCC 
X-CRM114-Status: GOOD (  17.56  )
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

On Thu, Aug 21, 2025 at 10:01:27PM +0800, Pincheng Wang wrote:
> Add descriptions for the Zilsd (Load/Store pair instructions) and
> Zclsd (Compressed Load/Store pair instructions) ISA extensions
> which were ratified in commit f88abf1 ("Integrating load/store
> pair for RV32 with the main manual") of the riscv-isa-manual.
> 
> Signed-off-by: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index ede6a58ccf53..d72ffe8f6fa7 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -366,6 +366,20 @@ properties:
>              guarantee on LR/SC sequences, as ratified in commit b1d806605f87
>              ("Updated to ratified state.") of the riscv profiles specification.
>  
> +        - const: zilsd
> +          description:
> +            The standard Zilsd extension which provides support for aligned
> +            register-pair load and store operations in 32-bit instruction
> +            encodings, as ratified in commit f88abf1 ("Integrating
> +            load/store pair for RV32 with the main manual") of riscv-isa-manual.
> +
> +        - const: zclsd
> +          description:
> +            The Zclsd extension implements the compressed (16-bit) version of the
> +            Load/Store Pair for RV32. As with Zilsd, this extension was ratified
> +            in commit f88abf1 ("Integrating load/store pair for RV32 with the
> +            main manual") of riscv-isa-manual.
> +
>          - const: zk
>            description:
>              The standard Zk Standard Scalar cryptography extension as ratified
> @@ -847,6 +861,16 @@ properties:
>              anyOf:
>                - const: v
>                - const: zve32x

> +      # Zclsd depends on Zilsd and Zca
> +      - if:
> +          contains:
> +            anyOf:
> +              - const: zclsd
> +        then:
> +          contains:
> +            anyOf:
> +              - const: zilsd
> +              - const: zca
>  

Should be allOf? I see the comment says "Zclsd" requires both "Zilsd"
and "Zca".

Regards,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
