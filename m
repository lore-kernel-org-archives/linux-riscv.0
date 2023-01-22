Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC21C27C76
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jan 2023 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I0hLdJ+FUyuvRi5HLPCCKnT0KRXMg2hl9/OM01top5A=; b=nEhDQAUXT6DaxF
	KarQRdfCV9WmPsLsyN7QKYxICE3CW1Ml9dRrSWdPjFyEtDmAxy2YrtQ9uxjPZRxsCCbiDmqZx7uGJ
	0v+TQTJOOo6ZoGj1m9WRs/T/new5pw2P82ozDhtg2eP+crvkiA62g3RZxBp4oRefeIhnWpfPjMmxV
	vOgQtvAer1TooOCxSz8HZX8NWcVU0rHlkUTdsTwWE0drxAHx8BFviYD/K/GqJbLWviL2SRMJzmf4i
	tHYYiOqXaNensnTpd7SaCgPf+3RuqK0axkMsdRSPl6eGZsoE/p32M/CnP0Gb62awc9Jfa56/M9d2s
	XBLG7xyQXDnyW4y+3KLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJYqy-00FFNR-W0; Sun, 22 Jan 2023 11:49:41 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJYqv-00FFMX-UB
	for linux-riscv@lists.infradead.org; Sun, 22 Jan 2023 11:49:39 +0000
Received: by mail-wr1-x42f.google.com with SMTP id bk16so8441759wrb.11
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jan 2023 03:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L18XUoVuVYI0pnqHwuAZ/a/gl46rC1ac5Z5pGu4tjjA=;
        b=caIlICVgjiM2KQmWSw2+dwCmFwH/QmHP5Tpt6H6wVsFqVFanIJ1vuRkXD5LMYCDALE
         NRjmF+0baehzfnLLnyNncgVe/LMpVF+yHU61SKAbBoH7z61KGzW5m7flF/bFqihPw1Fn
         O2fP7zc3nkMy81LxNCpHIWtu94zfu5UQvaOFSsNE8v5AYfQqfr8/s8K8Erb8fkRN+yAG
         wkyY17RV1LAoGfa7M6MaWtFsVRYyBEJ/Cn1lnFbJ+7C3TkgZU6XRz0KkmJz40bv2YJcl
         sWZRDoQaWXDOf5NedqV2uevyts9HBVC/g4grs5Il5oF6YrOPf4Yvjvay3LwHgph5/uVF
         hkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L18XUoVuVYI0pnqHwuAZ/a/gl46rC1ac5Z5pGu4tjjA=;
        b=q7QikYYirGDnQ1Dr0d2DSNw129cPf/zakjEOipPiMPx90jjlTa4KSS+9Rl2qssgiBq
         VYFX5qXTwI6erUqDY9waIyx9Y9nxvSB7wOupfrNZulBpCPP+pgzVZWceYY9AcUB1/NQa
         7RT7Kxqflfgi3fDY4RcFEhPA/tQPIpFnifO7MZ9mjn1D8bmATo8+QBfCzwLjBg0qkziq
         IzGbSLSGwIOR5MLSljJnBiw/H0SLOvG0fg3yk1hpfQpPLnN4zYUxSE45mtRIz/NPZjI+
         NxGuhry5S6f/o6wo82U50X2RwBsx9s4JQdD9ALZhWUiqtWoG9BDSTke+H5Tfsv2kW0a5
         eH0g==
X-Gm-Message-State: AFqh2kqWmI1AVdEpc9La5CdYd+RX12hwvVgf5aIR36H3dPqHSpw/dS6B
	A63f51VVP/MyznHLB3V2x2toEw==
X-Google-Smtp-Source: AMrXdXuO4A8xyx6+67tnt5vSccGnQfMst13iHm3i0RgTmN8zIeWyW0hP20D/R/sapznzyBbbSLIUpw==
X-Received: by 2002:adf:f606:0:b0:24b:b74d:8012 with SMTP id t6-20020adff606000000b0024bb74d8012mr17321312wrp.18.1674388176056;
        Sun, 22 Jan 2023 03:49:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m8-20020adfa3c8000000b00236545edc91sm1740479wrb.76.2023.01.22.03.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 03:49:35 -0800 (PST)
Message-ID: <c8f7294d-6522-40f6-7923-c379ec8ca6bb@linaro.org>
Date: Sun, 22 Jan 2023 12:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 05/31] Documentation: Add binding for
 kalray,coolidge-itgen
Content-Language: en-US
To: Yann Sionneau <ysionneau@kalray.eu>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Oleg Nesterov <oleg@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Paul Moore <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>,
 Christian Brauner <brauner@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jules Maselbas <jmaselbas@kalray.eu>,
 Guillaume Thouvenin <gthouvenin@kalray.eu>,
 Clement Leger <clement@clement-leger.fr>,
 Vincent Chardon <vincent.chardon@elsys-design.com>,
 =?UTF-8?Q?Marc_Poulhi=c3=a8s?= <dkm@kataplop.net>,
 Julian Vetter <jvetter@kalray.eu>, Samuel Jones <sjones@kalray.eu>,
 Ashley Lesdalons <alesdalons@kalray.eu>, Thomas Costis <tcostis@kalray.eu>,
 Marius Gligor <mgligor@kalray.eu>, Jonathan Borne <jborne@kalray.eu>,
 Julien Villette <jvillette@kalray.eu>, Luc Michel <lmichel@kalray.eu>,
 Louis Morhet <lmorhet@kalray.eu>, Julien Hascoet <jhascoet@kalray.eu>,
 Jean-Christophe Pince <jcpince@gmail.com>,
 Guillaume Missonnier <gmissonnier@kalray.eu>, Alex Michon
 <amichon@kalray.eu>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <git@xen0n.name>, Shaokun Zhang <zhangshaokun@hisilicon.com>,
 John Garry <john.garry@huawei.com>,
 Guangbin Huang <huangguangbin2@huawei.com>,
 Bharat Bhushan <bbhushan2@marvell.com>, Bibo Mao <maobibo@loongson.cn>,
 Atish Patra <atishp@atishpatra.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Qi Liu <liuqi115@huawei.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 Janosch Frank <frankja@linux.ibm.com>, Alexey Dobriyan <adobriyan@gmail.com>
Cc: Benjamin Mugnier <mugnier.benjamin@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mm@kvack.org, linux-arch@vger.kernel.org, linux-audit@redhat.com,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-6-ysionneau@kalray.eu>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120141002.2442-6-ysionneau@kalray.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_034938_026203_C89F1D3D 
X-CRM114-Status: GOOD (  20.84  )
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

On 20/01/2023 15:09, Yann Sionneau wrote:
> From: Jules Maselbas <jmaselbas@kalray.eu>
> 
> Add documentation for `kalray,coolidge-itgen` binding.
> 
> Co-developed-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>

The same comments apply plus more...

> ---
> 
> Notes:
>     V1 -> V2: new patch
> 
>  .../kalray,coolidge-itgen.yaml                | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/kalray,coolidge-itgen.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/kalray,coolidge-itgen.yaml b/Documentation/devicetree/bindings/interrupt-controller/kalray,coolidge-itgen.yaml
> new file mode 100644
> index 000000000000..47b503bff1d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/kalray,coolidge-itgen.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license. Checkpatch should complain about this - did you run it?

This applies to all your other patches (both, run checkpatch and use
proper license).


> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/kalray,coolidge-itgen#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kalray Coolidge SoC Interrupt Generator (ITGEN)
> +
> +description: |
> +  The Interrupt Generator (ITGEN) is an interrupt controller block.
> +  It's purpose is to convert IRQ lines coming from SoC peripherals into writes
> +  on the AXI bus. The ITGEN intended purpose is to write into the APIC mailboxes.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: kalray,coolidge-itgen
> +

So why suddenly this patch has proper blank lines...

Missing reg.

> +  "#interrupt-cells":
> +    const: 2
> +    description: |
> +      - 1st cell is for the IRQ number
> +      - 2nd cell is for the trigger type as defined dt-bindings/interrupt-controller/irq.h
> +
> +  interrupt-controller: true
> +
> +  msi-parent: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#interrupt-cells"
> +  - interrupt-controller
> +  - msi-parent
> +
> +examples:
> +  - |
> +    itgen: interrupt-controller@27000000 {
> +        compatible = "kalray,coolidge-itgen";
> +        reg = <0 0x27000000 0 0x1104>;
> +        #interrupt-cells = <2>;
> +        interrupt-controller;
> +        msi-parent = <&apic_mailbox>;
> +    };
> +
> +...

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
