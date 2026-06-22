Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AB7CD98F6
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 06:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YY6+X1g0c8rVaoaULmfl3sPR9K6ofK7qAPsAdWADe4w=; b=KqvUqEXD/L7Az2
	iT15yhs3BJwcKIPAO99EKClyrV1a9UdqE4hSYOFsyIHqibKJ4khGffJJjJQC8WTqDtI9aWuPequ93
	lNbbF9H0SS/XJClayvH+Bqk7YtXZ0xadf2lD584PUErrS9O0ubmoaNAQdhxBwJYF+uahttVj91f+f
	MFH6ZRpnObrsyJMJXDm+684UjzzpkBrj1Kx/LuFVlLYcgQANEaFUYndhqbKfGgnljMmFuEwAfax8T
	8AIp9KtQ7U3hMGhkqNngQiSn7NaX0w04jtkkE/+rpmsKdiBUqcuvKmmBF3LaeClMxVnVx+yVJnvHY
	QTGWOTgkzQeY8PeWAVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYNb-00000004Uiv-3oig;
	Mon, 22 Jun 2026 06:43:35 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYNZ-00000004Uht-3tKg
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 06:43:35 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-1384ebe7a10so2328801c88.1
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jun 2026 23:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782110613; x=1782715413; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q/ijfEBLG2GDgKYljJEgtRrqYXmGeXk+QfQobYUMazc=;
        b=MwZSJAWC11H80jLdZH4NQSVeirN2IBjz+haRLy6OjKMi+s8XPpXfBeuGl4pC+Onbuu
         g9OZ8Ffnqf0L7s9quLIc7kjo0cAJVehSla7yxJVKKpKMrVZjwbYT3pQ8ROutgG88Bol4
         5SOJCbaBCOq5sOa4bc0aMx3WlPxrl8dCyRUb7WxDqN6p3vCQMYqQQgukD4CCoR48Geb4
         VkD+eKcngdpstAaOxP/SBYSn8FpZx2KcWUs6HShOyGCUBp9wQ1AhL0cMFVb3Vxsq4YzA
         eMWZccoQJQyQSMjczohY1zd6JHXP7vjglwiQoOeULox8O7cOifQasUbNLUIYLfYVj+O3
         obPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782110613; x=1782715413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/ijfEBLG2GDgKYljJEgtRrqYXmGeXk+QfQobYUMazc=;
        b=VNFuqYe9PMmbdf+m8GAl6Sz37K/Ur6KNFx4C4IXSj7Gersrvegl3NV45UWbz5hT5OB
         tW2nimPoKEKvLB/pO3SQVslhTd51NeUjK8CdtDtWKb9ap7MQeIPzwSeNQ2HANMLu7BId
         KMZZBVTpctfJjC8OtchlJpr9pLyt/ZCbpVhYegrcuRaHBm6lVKXrngrj13FuJ6FLkEdR
         7MYo8wr4Qi3EoyhsS00XpIz36ak0Nzy6Qkesn+QZDaCo0OgSrc8jQtRdfQlkp2hpcEKW
         yes6UQtIVt9kTmVppdN5zJTsIKxDp1MCPSOxvj6uqgzXzdoA2mom0JTJqAKGq+0dzFpQ
         Q4Cg==
X-Forwarded-Encrypted: i=1; AFNElJ88IG8xarhjxts9m71GZi3+Jh6QHfKeqy682t9QRtXIb4io4PsL01c5ePoZ3EpVRHI+fDnVDvAE/6vwSA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/49w9mOiKlbyYYrP37BiMaGkXStxdrB1sL/p8GY+tDwrVmhbE
	LXmoguYcDJZcz1zhQTKSf1SmnTQMoPP9NSo59HVmpVcQAwtl9mOwddHa
X-Gm-Gg: AfdE7ckOvBd6gBeMsmSKAi00VVuHrGE+5sQCxHQ/hoIKrAfHZtVt3sPkMblNJMTBx7F
	lvyQkO6L8pMv6WpaKxnj+7TTjWO1NQn1tkPyop40rLTH2/WzTiRy7oysKFTlLh+KFjA0TxgAZcM
	V/1vgLIO/WNDcqOQVjVZQ86reJgL92MjIWaL38fHl9itfeIJV79M3+isxnequyfg9nD9xomJx23
	R1vSq086NUTfAfJ5GByuu8k9iFrps+YDLktsSNgPUfwrK4NQ38qJSU8ys20/UY22RBMlPp9hPrr
	sZbXMmzyg2rIY/TZ6OomekXy9+RQglz3CUYGAh5u4g7AOIRz8PPsc+syWCYANVcj2DvgJh8dfYt
	G5Z0Y1ww1FeOhPEaCtFFQAIp4vgbRo4NrOHSpHfEsscYKi/Ia27YY++ct15At5zkaTTSGfeEvYr
	7F
X-Received: by 2002:a05:7022:f689:b0:12d:b993:c68f with SMTP id a92af1059eb24-139a4eb3fe3mr6345562c88.4.1782110612828;
        Sun, 21 Jun 2026 23:43:32 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add73a44sm6680306c88.13.2026.06.21.23.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:43:32 -0700 (PDT)
Date: Sun, 21 Jun 2026 23:43:29 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anup Patel <anup@brainfault.org>,
	Namhyung Kim <namhyung@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ian Rogers <irogers@google.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 07/21] RISC-V: Add Sscfg extension CSR definition
Message-ID: <ajjZkRxoh2F3vUAS@blinky>
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
 <20260608-counter_delegation-v6-7-285b72ed65a9@meta.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608-counter_delegation-v6-7-285b72ed65a9@meta.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_234333_970395_03631DAE 
X-CRM114-Status: GOOD (  19.25  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 08, 2026 at 11:01:21PM -0700, Atish Patra wrote:
> From: Kaiwen Xue <kaiwenx@rivosinc.com>
> =

> This adds the scountinhibit CSR definition and S-mode accessible hpmevent
> bits defined by smcdeleg/ssccfg. scountinhibit allows S-mode to start/stop
> counters directly from S-mode without invoking SBI calls to M-mode. It is
> also used to figure out the counters delegated to S-mode by the M-mode as
> well.
> =

> Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> Reviewed-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> =

> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index b4551a6cf7cb..26cb78dee2fd 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -241,6 +241,31 @@
>  #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
>  #define SMSTATEEN0_SSTATEEN0_SHIFT	63
>  #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
> +/* HPMEVENT bits. These are accessible in S-mode via Smcdeleg/Ssccfg */
> +#ifdef CONFIG_64BIT
> +#define HPMEVENT_OF			(BIT_ULL(63))
> +#define HPMEVENT_MINH			(BIT_ULL(62))
> +#define HPMEVENT_SINH			(BIT_ULL(61))
> +#define HPMEVENT_UINH			(BIT_ULL(60))
> +#define HPMEVENT_VSINH			(BIT_ULL(59))
> +#define HPMEVENT_VUINH			(BIT_ULL(58))
> +#else
> +#define HPMEVENTH_OF			(BIT_ULL(31))
> +#define HPMEVENTH_MINH			(BIT_ULL(30))
> +#define HPMEVENTH_SINH			(BIT_ULL(29))
> +#define HPMEVENTH_UINH			(BIT_ULL(28))
> +#define HPMEVENTH_VSINH			(BIT_ULL(27))
> +#define HPMEVENTH_VUINH			(BIT_ULL(26))

Since these are rv32 bits for a 32-bit register, I think these should be
BIT() instead of BIT_ULL()

> +
> +#define HPMEVENT_OF			(HPMEVENTH_OF << 32)
> +#define HPMEVENT_MINH			(HPMEVENTH_MINH << 32)
> +#define HPMEVENT_SINH			(HPMEVENTH_SINH << 32)
> +#define HPMEVENT_UINH			(HPMEVENTH_UINH << 32)
> +#define HPMEVENT_VSINH			(HPMEVENTH_VSINH << 32)
> +#define HPMEVENT_VUINH			(HPMEVENTH_VUINH << 32)

These definitions are identical to the rv64 ones, can these be removed
and can you move the rv64 definitions to be global?

- Charlie

> +#endif
> +
> +#define SISELECT_SSCCFG_BASE		0x40
>  =

>  /* mseccfg bits */
>  #define MSECCFG_PMM			ENVCFG_PMM
> @@ -322,6 +347,7 @@
>  #define CSR_SCOUNTEREN		0x106
>  #define CSR_SENVCFG		0x10a
>  #define CSR_SSTATEEN0		0x10c
> +#define CSR_SCOUNTINHIBIT	0x120
>  #define CSR_SSCRATCH		0x140
>  #define CSR_SEPC		0x141
>  #define CSR_SCAUSE		0x142
> =

> -- =

> 2.53.0-Meta
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
