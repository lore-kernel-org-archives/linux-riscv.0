Return-Path: <SRS0=CnAn=LI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8D3C2B9F4
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 13:35:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAB7B6109E
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jun 2021 13:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAB7B6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5uAe02uq1vuWn4JOfmAzi0QOALOhOswzO22iUQe52s=; b=CZXTmp6Msidqqf
	7sF9crrg2RaQCW+hXR3uQKJ6Yn0TsNq34Tq3yhSgqg6CuYrztSdhjxCmQTK05KIEFGm88st+EAkxH
	t43rM0BMz6JxKzItW+nObo3bxe+rNXNysFY2pKt+1PXS8YtFCQA572spOTvbNG1drY2+A0UeRMxi9
	uRw0eIfiifkgpl1HbjThS3zYEXy0R8KGbKXWeBGQw5ZMTonuqYDpo08rCUA33g2K+dHr3kzEBjZOT
	uJhu5QLVQwtcMjqCCOJAmKxvNqObB/lSWA3ODJ79EUS21I74H5q7qZ+JJOb9Mu5yadP36dIgUyM9m
	OmiSWUrUbV3mqpc/I1AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsmkR-00EIWD-2N; Mon, 14 Jun 2021 13:35:27 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsmkM-00EITN-4U
 for linux-riscv@lists.infradead.org; Mon, 14 Jun 2021 13:35:24 +0000
Received: by mail-yb1-f171.google.com with SMTP id p184so15431114yba.11
 for <linux-riscv@lists.infradead.org>; Mon, 14 Jun 2021 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l2CANvuphZSrzl0ZTCZbinBRhj4LvztQqqmEWaSRDg0=;
 b=KoTUuvNEyzlt2nSv9fHlcQl1VR8vNBR53V5fjD/wMvcVrjHpjDE8ogcm0GylBPv/Xd
 6d62ELoGaKGuuPP4XC0t3L+RyxfBDZwfhqMuJYJYXYS1fOY/IVjGCmayExV6mvM2Hbo2
 IKGYsN0NBXbjnEBxr+1hRKFA1+TH+7AMAcMB5EPiZVYgQeAhBM7Ofl5Wjn5MnpcNq1Ke
 /4W3pF8BK0nbtJAPpua0gZH+g0fxBVSei4ust/PtbGCNGzBEQa6DBNfig64IZacds1US
 1rtsLY3oEzmc2uKHdcpIN54kzreRwv5Y95j8tiyJrrvcBbeVDepjxyF8Wx6LN6bx5UL9
 Gifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l2CANvuphZSrzl0ZTCZbinBRhj4LvztQqqmEWaSRDg0=;
 b=ADfcKkV7O/vDKXcsdqRJpBTzr7Y4S7cXaCP4hQsgMsSlxgwEncc4rO8ZXN6KPeN6bk
 C0huSaXgbIyBE5MFV4TmpigiHPItmxq9Jljy9G4ybGi/lG+wmaH14STY0fhQZqIi8djg
 lIAtPycFC3YyhHera4aEqTZd51Nw5LFj2yciHX0m+hDcgnReW7yg+aK52jZsAA7Et4eS
 TWT8ydMPJmT6txVaQGpop8r9Ob3UTAM7J/S310/SlfE2bGDLxosRL6ywmjo7gk2Gc+Zq
 /QH51KjurA+gCj4m9CxxqbHR9lZ4garWE0jT18lC+i/I1r4FzphiQt/WGtJErd5PkJX9
 TJNg==
X-Gm-Message-State: AOAM530GiQCaMa0X91pnMHn2VK/AfarfRVn9Pc0rME01tzvo1wtLuFNy
 9MRYKAF9w9ELDzoeisMZZtuhZXupyzV4uhL+xPU=
X-Google-Smtp-Source: ABdhPJyZWnm9HbeF+owrkleXq8g4uqtOD8ehLmaqnul69zdhZmFi+FmN5c76jOrf062uljYtnDWZj55qRTYSncryD7Y=
X-Received: by 2002:a25:389:: with SMTP id 131mr25399003ybd.306.1623677661526; 
 Mon, 14 Jun 2021 06:34:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210612160422.330705-1-anup.patel@wdc.com>
 <20210612160422.330705-9-anup.patel@wdc.com>
In-Reply-To: <20210612160422.330705-9-anup.patel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Jun 2021 21:34:08 +0800
Message-ID: <CAEUhbmV0CXuFvyDtiTXsV-S_qRa8r-yX_=CU8xDdqneNcxnOiw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 08/10] dt-bindings: timer: Add ACLINT MTIMER
 bindings
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_063522_217136_FA949B82 
X-CRM114-Status: GOOD (  19.20  )
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

On Sun, Jun 13, 2021 at 12:09 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We add DT bindings documentation for the ACLINT MTIMER device
> found on RISC-V SOCs.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  .../bindings/timer/riscv,aclint-mtimer.yaml   | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
>
> diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> new file mode 100644
> index 000000000000..21c718f8ab4c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V ACLINT M-level Timer
> +
> +maintainers:
> +  - Anup Patel <anup.patel@wdc.com>
> +
> +description:
> +  RISC-V SOCs include an implementation of the M-level timer (MTIMER) defined
> +  in the RISC-V Advanced Core Local Interruptor (ACLINT) specification. The
> +  ACLINT MTIMER device is documented in the RISC-V ACLINT specification found
> +  at https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc.
> +
> +  The ACLINT MTIMER device directly connect to the M-level timer interrupt

connects

> +  lines of various HARTs (or CPUs) so the RISC-V per-HART (or per-CPU) local
> +  interrupt controller is the parent interrupt controller for the ACLINT
> +  MTIMER device.
> +
> +  The clock frequency of ACLINT is specified via "timebase-frequency" DT
> +  property of "/cpus" DT node. The "timebase-frequency" DT property is
> +  described in Documentation/devicetree/bindings/riscv/cpus.yaml
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: riscv,aclint-mtimer
> +
> +    description:
> +      Should be "<vendor>,<chip>-aclint-mtimer" and "riscv,aclint-mtimer".
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts-extended:
> +    minItems: 1
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +
> +examples:
> +  - |
> +    timer@2004000 {
> +      compatible = "riscv,aclint-mtimer";
> +      interrupts-extended = <&cpu1intc 7 &cpu2intc 7 &cpu3intc 7 &cpu4intc 7>;
> +      reg = <0x2004000 0x8000>;
> +    };
> +...

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
