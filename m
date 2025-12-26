Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F44E8FDB8
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 21:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GClZAtOuZJ9m/1+IjFtQQPhgzKeenq+TihAU77hfP44=; b=eACqqsbFGnSbnF
	gL/VI69Am1tHq42WGXA6AuOtmCB7YPuC2+Rjxtu3BGohipZnsM0KYmVdOlbBuzxMYOcmKChRscNoJ
	HcqUdpWoMCRtnJ9ILwQo9frCvMmQYBsvWSf+4MxIv/VDdJlWOBrotH0uo5ZnFmIb1wFEZ2HPwYLDH
	AGW41oVJkZbdDRaEQiQX/IuqWDsqZqbNMLNmDB7nsExT7EeQEaryKXFmvSY8UA5tmyD14P8woFkG/
	aD17XVM8eHx3xv6jiV8y/D9ftextSCHeSeFvF5sRguikoLM4C8iSaY73+sV3gU0q7s2xPF/sedONq
	L8yQXY9Tn9U/Q5rWQZbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZFMf-00000001TxH-34r8;
	Fri, 26 Dec 2025 21:28:49 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZFMd-00000001Twc-0pDS
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 21:28:48 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4ee0ce50b95so78865331cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Dec 2025 13:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766784525; x=1767389325; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dtRfqPPDGuvZUTAw6kj7CgPqAXEhsP7aAJnNHxSu2A8=;
        b=NGsD/5EUu0vk4Gknj/Z4ndsvQPIya4Pby8Pf4qqazPEnh+dOq1O3mhWnuMQwUWym0n
         x7dg6c2sw6VuVaTgoKlngJdTtwM117xM7fCBjif1u7JxJzXCEMgNcGA2ob9/OCs9gA/6
         KBm919e0fzW3uo8p8dwIkG3tSGOgsWVOfiNGVKUqZaqtCVB81ib335CJ+HjeNceX2hX5
         0HJXHLTw6kJeWSwreCkiRlbkSXiEkrMf4yxsA7Ka68ROZQ0IOj6xK70T9Mk8PFdZzjCJ
         xDFQIEAsLJDgUA3Mcihf/JmKJFHEdpvvrAHzjaH3ARcSsvd3Y2j5Jz3+HVJu0tuUhF82
         GWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766784525; x=1767389325;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtRfqPPDGuvZUTAw6kj7CgPqAXEhsP7aAJnNHxSu2A8=;
        b=E6VFTHQKRNvcQ5yvR+Bf73+C8U5n7eARnidub/wJbRhkhAw5faZIBNrktUlb6WIeua
         lT6nfxolukkKUCidPg9b+446NCLhD8oKNxTNiPo8DeAay4BYpvRi1ydpQYJjwHRoVHjN
         NbClMeLFbTKisYNL/k1mmnlF19AadqAFuhT065xGyNxKRXI1+tTgLIOgS0FLfXjn5RR/
         ZzFY604mLAeCigDLZ7Q8MOOnDGS4tQKkvGwfqk1wHKwbMagrR6iN9Xpw4X5kmiQQeogM
         cx7wpltTqYQzS0s03yR7mVt6ylvQ4kSlJeKsMIWkdk6C8bYWosw2RYsq5NSXnGE39eYz
         LUvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1QT/HlVzP/8x2CRtRjWweLCREkilmW9uckotchEBoTbf2aKIB4OEoK8nT+OOZbiAu7xjYB9kG/xXgyg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4t4oZWhGohkQ3Yhii8Dg2ZYkzfTpcDmTOIKFsBUYGi+TJnyxO
	WcnUlDNRDWxgwTBBbJhRfuAfmgrkHP54Gjqric+C3Qf7Ljc02rjqmxcUMhGS46VjuUI=
X-Gm-Gg: AY/fxX7Ohb+he4LncGAnnLTHY1Cy4cl9GQFm3dbHhbgc27EDvi+AlkAmjwlE2fK7feK
	hWvh2xchNJo/7+MkNO0NV/XcBdjlbDCiKHCbIMDA6fki03I9NbNnX5eLvCdWi2Tk+9ZuO91qPTI
	wrLQMZ0WYIT5BOXR3Foy1u9h0ocEIOqTzY76qxdvYzW5ntn8pLx1PYN9ml9t0WPKt37oIVBnovk
	o0ofqvsnKPNvSNAmXy5TmzisIejmkNS1Cu1KrwiPd+WXx1r729aO6pqqA3NKxjl0rIJI7C91fVA
	zCIGc53uDw2U0B6nBkJ6pmAA8QAztuk7ioyY2hxFmiJialUgTtHAL3Xi2XoSaSKqW0NUbsGk5/F
	TsCIwORf7BHzOTCv72eU7pdmavPwV+rTDcQuWdECGsd+Jro8yrj2+SIRODOTvp3cD5fGgCr4yNH
	xMPdL71chaBDEllBQm6YnyNfUkzhxO2l5NzmEsbg28GcDRNrr5of6dXvHprHmwKQ==
X-Google-Smtp-Source: AGHT+IEgQaXtB6pefcXFw8ZLO2uqzZJ5RfQKofkgNYUG4z74++kdJEHCFun2ZDS/ec+O2+xR1vyGRQ==
X-Received: by 2002:ac8:7fd6:0:b0:4f3:4b53:a914 with SMTP id d75a77b69052e-4f35f3a051dmr439171691cf.9.1766784525385;
        Fri, 26 Dec 2025 13:28:45 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7d5f4sm176833206d6.40.2025.12.26.13.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 13:28:45 -0800 (PST)
Message-ID: <0253c25d-f5fd-46f1-b4d3-ec56909d5eac@riscstar.com>
Date: Fri, 26 Dec 2025 15:28:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] dt-bindings: riscv: Add Sha and its comprised
 extensions
To: Guodong Xu <guodong@riscstar.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley
 <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-10-3af3f3cd0f8a@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-10-3af3f3cd0f8a@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_132847_264306_16C6566D 
X-CRM114-Status: GOOD (  24.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 12/22/25 7:04 AM, Guodong Xu wrote:
> Add descriptions for the Sha extension and the seven extensions it
> comprises: Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala, Shvstvecd,
> and Ssstateen.
> 
> Sha is ratified in the RVA23 Profiles Version 1.0 (commit 0273f3c921b6
> "rva23/rvb23 ratified") as a new profile-defined extension that captures
> the full set of features that are mandated to be supported along with
> the H extension.
> 
> Extensions Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala, Shvstvecd,
> and Ssstateen are ratified in the RISC-V Profiles Version 1.0 (commit
> b1d806605f87 "Updated to ratified state").
> 
> The requirement status for Sha and its comprised extension in RISC-V
> Profiles are:
>   - Sha: Mandatory in RVA23S64
>   - H: Optional in RVA22S64; Mandatory in RVA23S64
>   - Shcounterenw: Optional in RVA22S64; Mandatory in RVA23S64
>   - Shgatpa: Optional in RVA22S64; Mandatory in RVA23S64
>   - Shtvala: Optional in RVA22S64; Mandatory in RVA23S64
>   - Shvsatpa: Optional in RVA22S64; Mandatory in RVA23S64
>   - Shvstvala: Optional in RVA22S64; Mandatory in RVA23S64
>   - Shvstvecd: Optional in RVA22S64; Mandatory in RVA23S64
>   - Ssstateen: Optional in RVA22S64; Mandatory in RVA23S64
> 
> Add schema checks to enforce that Sha implies the presence of all its
> comprised extensions.

Like patch 7 in your series, I *think* what you're doing
in trying to imply the presence of these other extensions
is actually requiring all those extensions to be present
*in addition* to just "Sha".  I don't think that's what
we want.

					-Alex

> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: New patch.
> ---
>   .../devicetree/bindings/riscv/extensions.yaml      | 79 ++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index ed7a88c0ab3b7dc7ad4a4d2fd300d6fb33ef050c..1066b7e65dab89704dbac449db4aa5605c95b9d3 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -128,6 +128,57 @@ properties:
>               version of the privileged ISA specification.
>   
>           # multi-letter extensions, sorted alphanumerically
> +        - const: sha
> +          description: |
> +            The standard Sha extension for augmented hypervisor extension as
> +            ratified in RVA23 Profiles Version 1.0, with commit 0273f3c921b6
> +            ("rva23/rvb23 ratified").
> +
> +            Sha captures the full set of features that are mandated to be
> +            supported along with the H extension. Sha comprises the following
> +            extensions: H, Shcounterenw, Shgatpa, Shtvala, Shvsatpa, Shvstvala,
> +            Shvstvecd, and Ssstateen.
> +
> +        - const: shcounterenw
> +          description: |
> +            The standard Shcounterenw extension for support writable enables
> +            in hcounteren for any supported counter, as ratified in RISC-V
> +            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
> +            ratified state.")
> +
> +        - const: shgatpa
> +          description: |
> +            The standard Shgatpa extension indicates that for each supported
> +            virtual memory scheme SvNN supported in satp, the corresponding
> +            hgatp SvNNx4 mode must be supported. The hgatp mode Bare must
> +            also be supported. It is ratified in RISC-V Profiles Version 1.0,
> +            with commit b1d806605f87 ("Updated to ratified state.")
> +
> +        - const: shtvala
> +          description: |
> +            The standard Shtvala extension for htval be written with the
> +            faulting guest physical address in all circumstances permitted by
> +            the ISA. It is ratified in RISC-V Profiles Version 1.0, with
> +            commit b1d806605f87 ("Updated to ratified state.")
> +
> +        - const: shvsatpa
> +          description: |
> +            The standard Shvsatpa extension for vsatp supporting all translation
> +            modes supported in satp, as ratified in RISC-V Profiles Version 1.0,
> +            with commit b1d806605f87 ("Updated to ratified state.")
> +
> +        - const: shvstvala
> +          description: |
> +            The standard Shvstvala extension for vstval provides all needed
> +            values as ratified in RISC-V Profiles Version 1.0, with commit
> +            b1d806605f87 ("Updated to ratified state.")
> +
> +        - const: shvstvecd
> +          description: |
> +            The standard Shvstvecd extension for vstvec supporting Direct mode,
> +            as ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
> +            ("Updated to ratified state.")
> +
>           - const: smaia
>             description: |
>               The standard Smaia supervisor-level extension for the advanced
> @@ -186,6 +237,12 @@ properties:
>               ratified at commit d70011dde6c2 ("Update to ratified state")
>               of riscv-j-extension.
>   
> +        - const: ssstateen
> +          description: |
> +            The standard Ssstateen extension for supervisor-mode view of the
> +            state-enable extension, as ratified in RISC-V Profiles Version 1.0,
> +            with commit b1d806605f87 ("Updated to ratified state.")
> +
>           - const: sstc
>             description: |
>               The standard Sstc supervisor-level extension for time compare as
> @@ -813,6 +870,28 @@ properties:
>                   const: zbb
>               - contains:
>                   const: zbs
> +      # sha comprises the following extensions
> +      - if:
> +          contains:
> +            const: sha
> +        then:
> +          allOf:
> +            - contains:
> +                const: h
> +            - contains:
> +                const: shcounterenw
> +            - contains:
> +                const: shgatpa
> +            - contains:
> +                const: shtvala
> +            - contains:
> +                const: shvsatpa
> +            - contains:
> +                const: shvstvala
> +            - contains:
> +                const: shvstvecd
> +            - contains:
> +                const: ssstateen
>         # Zcb depends on Zca
>         - if:
>             contains:
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
