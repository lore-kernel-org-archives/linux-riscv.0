Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3969E8FDB9
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 21:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nyPXl5Je3v1FfRG0rL+8urSs4i1UkJI+vzdUsEe81r4=; b=mgnB83EBJ0pX23
	Xe+09+QaPGqn1UtiS4IJeDUHpkGn2XyN8GGag4uOfvuUcU7c62kM7Zjb4v5XMsSaIFHkRDAORlabB
	etjB33JzhlCRlRR8xm9ENICi8J+Aq8v7dLowqX++BLUTToBEv5cLbnUtkjI03ZZnAFc1ccrRqf1wu
	0sMrfBoB9bd5NGYjzIGyNWgxiyh4r20Ahli6IKwbqFf84TO7SohAHZxg2HbJaGtmYDZghb0NikECU
	CKYtyyXYSMUKndRoK3vPhxr4xUgXymp/J4cWk8e5bxuzke7V8fUQlkLrWKlYyOi+fp5FQ5oWMf0YK
	CPwd4nSfj3obmQsTGysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZFMU-00000001Tv3-40WQ;
	Fri, 26 Dec 2025 21:28:38 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZFMS-00000001Tu7-0Vm0
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 21:28:37 +0000
Received: by mail-qv1-xf41.google.com with SMTP id 6a1803df08f44-88a3d2f3299so90565126d6.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Dec 2025 13:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766784515; x=1767389315; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fm5dxyjoGTgLB5EfhliAJ+8GZyHW/7sdxpOXkZhyc4Q=;
        b=AYxR5BmccAMYkHA94Xp2i0nXOY1k8kXcBPn96MhepJtrAkRC/OaDW8wvXZo6+dEAHU
         JBItqkgVnPB86eLqZXtAUcQL08trKIUFCZA2J2bHb/oP9wvnngszpvYs02MopvWKigrp
         k6orE6gYQGcZ8Q9w4UXBqo95UQ9qlId4o/Ez1O/FuHxSwJwrV5DJ3bZyinP62k1fWONt
         uDMBOequyF5C20GlCMKoQSAyT1t1l73eR1+N0kLkiu594Dl0jRjEH7Ay5ExD67gkX0zT
         Z9cL5liYR7NEmkyfvCWVExY4Zm+ya4BKEqGVpLPPvOB9B1JC8y0ILtNL2oYrMxJVI+uW
         QYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766784515; x=1767389315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fm5dxyjoGTgLB5EfhliAJ+8GZyHW/7sdxpOXkZhyc4Q=;
        b=lBRLFuod6T0bZPZox8GVdo8OlpoI84MmLkaoQWUnO+xFbt0LT2pmE/SvJ1Or7JZP9E
         vJLGR8P5XCDRP7Mm1iBuoRjhYE/Vg/dScp5wZwIfav2BJDbJyXOiO+TLOeomIz1qdfoR
         lw2NX+C7sC/I24v8QgJDRXEWNmzh8InGoqD4qdD5CMd2yd96vgh8GYinxms6JF0Wdp4y
         Oef4pl/zw/C0vA0F4UsG3ODig0+bYtvS/8sgjVIxGUjT2HYpFiTgmXj/22Ns5re82XnG
         ktY0MwcI2BlJdCGVR0bBfxoB4VlQir9lTToiHkjcs6FF9Hh7zJ/0K5teonU6baqNFxXe
         AcJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmfheRP7DENZGXnNAevDxL6djkAEul1Xz39RjM9KnXG7MFSPiisftEroL/HmvfxR7edP+dsTjPOahjLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxB3LAECDZACXYvZJK65XfhzTWsjYxVgtkwXcJs7moty+UJAPwU
	IfKJhjUVh3yF1UjhaBfsHJRy34TD0/3m1lF/jDGPUywbkUN7BPhj2ve87iZIiKJnhko=
X-Gm-Gg: AY/fxX7ORgiH8rWbKkPnC1EJqZ7WhV2o/fZ14lLlwhBYHPOkD7vTh2g8msMZeF4Uu93
	25jFRq2lhNik5NskeQx0LQd29DzePGxOCCCC5lL0pQAIB8oMEdK8iNbDioou1ahBYfnbY3ggHyD
	9XEJ+Zuri8c9ZJ8GL/1LCRa08DmY+XqsBZ+nJwsu2U74vUaNxm8f9F+f3od/1bB5LhQIOQnF8qq
	lQQmAA8ElgKgzxSffwb/W4QeYCC4l5+46/5ca+2lDgwjWrLgDsPq5lee8Vmpn7V+h431dDEIVec
	TZ8Xj4Roj0gN1wVQp3Zduke6Xc2bQFnPZBsODLgPFBm68DkJHpInf3dUjHagC/7HBW7F9AjuGkh
	ysUA3nVdxO4C9qugbMuUvZwWA6L0z5D+1zjiu4xNIq1Qqlw3Kr4n5v30nrT5/L9JEVNpkvRJM1E
	/OINlugMRKPOm4yBNV3EPOR/bpY47UBdKx+NzGxhX91N1PEoiv8Ic=
X-Google-Smtp-Source: AGHT+IHacwFIf7+7Gu6DCHAGNcJqj4mIg/TsHnBOgw2K659NvhFpRoQ/eMLaH970LQj3miK0Jz/+jQ==
X-Received: by 2002:a05:6214:1403:b0:88a:2578:9fa9 with SMTP id 6a1803df08f44-88d84528e20mr297151096d6.2.1766784514736;
        Fri, 26 Dec 2025 13:28:34 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7d5f4sm176833206d6.40.2025.12.26.13.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 13:28:34 -0800 (PST)
Message-ID: <8851c155-300a-4241-a5be-5163ba54e47c@riscstar.com>
Date: Fri, 26 Dec 2025 15:28:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] dt-bindings: riscv: Add descriptions for Za64rs,
 Ziccamoa, Ziccif, and Zicclsm
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
 <20251222-k3-basic-dt-v2-8-3af3f3cd0f8a@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-8-3af3f3cd0f8a@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_132836_218126_99F4CE86 
X-CRM114-Status: GOOD (  26.76  )
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
> Add descriptions for four extensions: Za64rs, Ziccamoa, Ziccif, and
> Zicclsm. These extensions are ratified in RISC-V Profiles Version 1.0
> (commit b1d806605f87 "Updated to ratified state.").

I think stating the RISC-V profiles commit ID here (in the commit 
header) is good.

I do *not* think it's necessary to include it in the descriptions
for the extensions, below, but I seem to be late to the party in
expressing this opinion...

That commit ID is related to this repository:
   https://github.com/riscv/riscv-profiles.git

I have a few other comments below but generally I think what you
did looks good.  I have one overall question though.

> They are introduced as new extension names for existing features and
> regulate implementation details for RISC-V Profile compliance. According
> to RISC-V Profiles Version 1.0 and RVA23 Profiles Version 1.0, they are
> mandatory for the following profiles:
> 
>   - za64rs: Mandatory in RVA22U64, RVA23U64
>   - ziccamoa: Mandatory in RVA20U64, RVA22U64, RVA23U64
>   - ziccif: Mandatory in RVA20U64, RVA22U64, RVA23U64
>   - zicclsm: Mandatory in RVA20U64, RVA22U64, RVA23U64

I did not verify your statements about where these are
optional and mandatory, but I assume they're correct.

> Since Ziccamoa depends on the 'A' extension, add a schema check to
> enforce this dependency.

All of these extensions are related to atomic operations, right?
Don't *all* of them (not just Ziccamoa) depend on the A extension?
Furthermore, the A extension is already mandated by RVA23U64, so
is it really necessary to add this logic?


> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: New patch.
> ---
>   .../devicetree/bindings/riscv/extensions.yaml      | 34 ++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 385e1deb23996d294e7662693f1257f910a6e129..a6b9d7e3edf86ecfb117ba72e295ef097bdc9831 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -237,6 +237,12 @@ properties:
>               as ratified at commit 4a69197e5617 ("Update to ratified state") of
>               riscv-svvptc.
>   
> +        - const: za64rs
> +          description:
> +            The standard Za64rs extension for reservation set size of at most
> +            64 bytes, as ratified in RISC-V Profiles Version 1.0, with commit
> +            b1d806605f87 ("Updated to ratified state.")

The more complete description says:

     Reservation sets are contiguous, naturally aligned, and a maximum
     of 64 bytes.

But as I read on (below) I suppose using the more succinct description
from the glossary might be best, forcing people who care to go look
at the reference documents.

> +
>           - const: zaamo
>             description: |
>               The standard Zaamo extension for atomic memory operations as
> @@ -378,6 +384,27 @@ properties:
>               in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
>               riscv-isa-manual.
>   
> +        - const: ziccamoa
> +          description:
> +            The standard Ziccamoa extension for main memory (cacheability and
> +            coherence) must support all atomics in A, as ratified in RISC-V
> +            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
> +            ratified state.")

Similar comment here (but also with a similar caveat):

   Main memory regions with both the cacheability and coherence PMAs
   must support all atomics in A.

And I might say "the A extension", but maybe that's a bad idea.

> +
> +        - const: ziccif
> +          description:
> +            The standard Ziccif extension for main memory (cacheability and
> +            coherence) instruction fetch atomicity, as ratified in RISC-V
> +            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
> +            ratified state.")
> +
> +        - const: zicclsm
> +          description:
> +            The standard Zicclsm extension for main memory (cacheability and
> +            coherence) must support misaligned loads and stores, as ratified
> +            in RISC-V Profiles Version 1.0, with commit b1d806605f87 ("Updated
> +            to ratified state.")
> +
>           - const: ziccrse
>             description:
>               The standard Ziccrse extension which provides forward progress
> @@ -795,6 +822,13 @@ properties:
>           then:
>             contains:
>               const: f
> +      # Ziccamoa depends on A

Maybe more than just depends on the A extension.

					-Alex

> +      - if:
> +          contains:
> +            const: ziccamoa
> +        then:
> +          contains:
> +            const: a
>         # Zvfbfmin depends on V or Zve32f
>         - if:
>             contains:
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
