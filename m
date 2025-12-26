Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE59E8FDB8
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 21:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJWhl2hFXtKmODcEmuDxR2bfi1aiO2gRUZlPLB/KR5w=; b=Gt5CZENSk4LJoy
	lepYuMJsN4Ux2TuQ2qBGRcwkoAz3AEApVx+JfQLm8VRJWoKI6P1b9ABqSJT3EhPs3aITV+4VSgVMv
	2PZsWdaImCRFubX1luJm41RcP/KV2wkW8IgIHbbukx+WevJ64Ai9QP63f0cfZwMaChiDtsyk0wOIb
	U3yLdnKdC9A+GtG7fxUz7nEi7qHE9sKCasC1F6kAjWZOahW40akKbHqQOwgMD+1m5d6qLx/7pSpAB
	VtJQnGv4jGP3KIzgugyHA3T4ccf832hvEC/INzxu2E7NKEB/kTgwOlm2eCIOLt03nzvJxoeOKBGxw
	fwduAr6Puu28wepeLsrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZFMb-00000001TwK-1eLz;
	Fri, 26 Dec 2025 21:28:45 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZFMY-00000001Tvf-3J7D
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 21:28:44 +0000
Received: by mail-qk1-x743.google.com with SMTP id af79cd13be357-8b5ed9e7500so520363385a.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Dec 2025 13:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766784520; x=1767389320; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GPFEcRLa6bpej+0ne5q5GKQT+KIJ6FmG8KY9UAp494Q=;
        b=LokjE5h8JTheXDf8ooinYQDsx78zSBebkVxwZH/+FkhOYuK4cSVgCD3H2606B+pqx3
         KVorHqiNHOM1k59I8nwXZMjHLkY/DzofT9WIIur+yuxXuPK8SvPXgoReX4kxuKkoJQWD
         dgx5+CZNLiAepWIkWUIUfb9EXXXEuSWfM+ZUsUsJ4g+vfxbw48uzt1kduCb9h+uzLHKG
         HnxQCFfoCq2OIG/6tvpRisyL9Pv0f9BA6XTKQ/ZX9raxKtF8TuqcEbvuww6mJC9ch2JQ
         xbUJL/pJaF5bg+3IByNYVPr/G1KE3yet5tYZK3utFZ24REEa1jv2EWzrQN47SVDBa48Y
         8Rrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766784520; x=1767389320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPFEcRLa6bpej+0ne5q5GKQT+KIJ6FmG8KY9UAp494Q=;
        b=FfAtU+Ct1TiNIPc5MW6OA8tKHUK/EQjteCR3z0dfON5fX/l4VgsFvgxGohb0f7ScBo
         FN4JgxLvItMM/VV+V+9Peps6nwuBDWo6bHuF14NtlWoYHqc6Lmiz9WzbEi2K8bltEsMI
         gPH4vvpJaJmKsopQiMO9reKAf6vqv/A5R9R9qM/AjOA2CVkKYEx3KvvhqJdjuvWkhDZ6
         DWRYsDiBU/zXSmlViw1D/xsKIo9mXCRE9IH65Pp1Nl8i4N1uK+ULYKoib0N27VPXFdUr
         YMNjOetwdkGTyS8F2Od/XneOkhQaVCh/qPyQddUgDAzDquPdrqWfFPtU9NP0BD3Lde7t
         4wLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx7fk6RPAzlixipCuGQ5WJDZQ3qzbvRJkbYTIFKQC0mduhSYRGlymOx/garu0Hn9E3ePXbBTBKcbwQVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXShR0CJTbSFPVSVKup3MhMugjPKhoDyJC1+G2qbSrF1awdsbX
	QP2RBTeI646WnfScTxhkIHc91EEWFX9nY07Vu39gdpGuWFrUkhIIr+luxRAZhXnaMC4=
X-Gm-Gg: AY/fxX7y8rj5FbNNl4pxaT7VzoYpigW1YdHZaU69QwSon7B1vuQPHXC+VECPL4CN9ec
	4BKJ4OfFsc0Fn8bjLy80Df/TYOazuECKpstSvQEA99r3IrC69TVMp26shqkJ6rgvxBHvSXypBKK
	loq02xDwk+t887XZuTwuHiuOWTs4m5Ty0VcTJhagQ6qNqGRb+Flv/HqoyMMtdTkgEb5blBTgxgV
	gLpAZGcTMR72gc2zU41ShdZ1YhId3e9um0VuA2JaDjV1WaEsAS3pHiEwOQUIw+WWEDvZkvsSvZe
	NyMlfRG803wgx21BiCtiTw1aRs4MtoTI4CcW5+eRBaadkteXrKX002tCalJW6s+rMMho90+wHYG
	trG6vfmw18t6bDS5O2EIT/ybjWiLMLTuYo//FVN6I3rCmObZraGHidL/J3XmoPN3qr7Qu/STz9h
	ClGpfoVRxjXwrDNAcWkH4zpwbwhk5j0g8Ax+RW60Co1XwazpD1eO8=
X-Google-Smtp-Source: AGHT+IHxk83GWhcfAeMb/H9cfylA1VgJA5ej5ei+26m7wuK7chT230ft6Z8P14rw6S5mJmDD/1J6GA==
X-Received: by 2002:a05:620a:2699:b0:892:7dd2:9f0f with SMTP id af79cd13be357-8c08fbde5b5mr3491225285a.19.1766784520424;
        Fri, 26 Dec 2025 13:28:40 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7d5f4sm176833206d6.40.2025.12.26.13.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 13:28:40 -0800 (PST)
Message-ID: <6925aa57-874c-479f-9f5b-f0fd6ede685b@riscstar.com>
Date: Fri, 26 Dec 2025 15:28:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] dt-bindings: riscv: Add Ssccptr, Sscounterenw,
 Sstvala, Sstvecd, Ssu64xl
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
 <20251222-k3-basic-dt-v2-9-3af3f3cd0f8a@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-9-3af3f3cd0f8a@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_132842_950596_BA78BEFE 
X-CRM114-Status: GOOD (  18.95  )
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
> Add descriptions for five new extensions: Ssccptr, Sscounterenw, Sstvala,
> Sstvecd, and Ssu64xl. These extensions are ratified in RISC-V Profiles
> Version 1.0 (commit b1d806605f87 "Updated to ratified state.").
> 
> They are introduced as new extension names for existing features and
> regulate implementation details for RISC-V Profile compliance. According
> to RISC-V Profiles Version 1.0 and RVA23 Profiles Version 1.0, their
> requirement status are:
> 
>   - Ssccptr: Mandatory in RVA20S64, RVA22S64, RVA23S64
>   - Sscounterenw: Mandatory in RVA22S64, RVA23S64
>   - Sstvala: Mandatory in RVA20S64, RVA22S64, RVA23S64
>   - Sstvecd: Mandatory in RVA20S64, RVA22S64, RVA23S64
>   - Ssu64xl: Optional in RVA20S64, RVA22S64; Mandatory in RVA23S64

Again, I did not verify your statements about where these are
optional and mandatory, but I assume they're correct.

> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: New patch.
> ---
>   .../devicetree/bindings/riscv/extensions.yaml      | 32 ++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index a6b9d7e3edf86ecfb117ba72e295ef097bdc9831..ed7a88c0ab3b7dc7ad4a4d2fd300d6fb33ef050c 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -160,12 +160,26 @@ properties:
>               behavioural changes to interrupts as frozen at commit ccbddab
>               ("Merge pull request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
>   
> +        - const: ssccptr
> +          description: |
> +            The standard Ssccptr extension for main memory (cacheability and
> +            coherence) hardware page-table reads, as ratified in RISC-V
> +            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
> +            ratified state.")
> +
>           - const: sscofpmf
>             description: |
>               The standard Sscofpmf supervisor-level extension for count overflow
>               and mode-based filtering as ratified at commit 01d1df0 ("Add ability
>               to manually trigger workflow. (#2)") of riscv-count-overflow.
>   
> +        - const: sscounterenw
> +          description: |
> +            The standard Sscounterenw extension for support writable enables
> +            in scounteren for any supported counter, as ratified in RISC-V
> +            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
> +            ratified state.")

Maybe you should just copy the text from the RVA23 specification
for all of these.  So something like:

   For any hpmcounter that is not read-only zero, the corresponding
   bit in scounteren must be writable.  This was ratified in the
   RISC-V Profiles specification version 1.0, with commit ...

> +
>           - const: ssnpm
>             description: |
>               The standard Ssnpm extension for next-mode pointer masking as
> @@ -178,6 +192,24 @@ properties:
>               ratified at commit 3f9ed34 ("Add ability to manually trigger
>               workflow. (#2)") of riscv-time-compare.
>   
> +        - const: sstvala
> +          description: |
> +            The standard Sstvala extension for stval provides all needed values
> +            as ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
> +            ("Updated to ratified state.")

Or alternative to the full text in the spec, you could copy over
the abbreviated description listed in the glossary at the end
instead.  Something like:

   stval provides all needed values.  This was ratified in...

					-Alex

> +
> +        - const: sstvecd
> +          description: |
> +            The standard Sstvecd extension for stvec supports Direct mode as
> +            ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
> +            ("Updated to ratified state.")
> +
> +        - const: ssu64xl
> +          description: |
> +            The standard Ssu64xl extension for UXLEN=64 must be supported, as
> +            ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
> +            ("Updated to ratified state.")
> +
>           - const: svade
>             description: |
>               The standard Svade supervisor-level extension for SW-managed PTE A/D
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
