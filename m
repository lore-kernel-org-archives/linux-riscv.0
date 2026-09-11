Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43DE2C88E4C
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 08:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZXPJX7oSvpt2+JtB4hsgT2gvKvZRmfsLDht51/C3bg=; b=3MkB7MLOSZuTE9
	6Vdd6Yswc6QSpP8Og93xvoRajseAlnkWHy/GZIiHe6ekxLnmQ34ypsUKCNxo5Y0j6bSHgPyzXfHib
	0tDllX5dIRUn4mMsYLNtYDKAGUTMGKu4apUHKS/alG1frZ1J5Y0Xj1MjSl+Yx1D/aA1dKmJy9RO5t
	TP7RXsJ7Eeg1H4QmIUVA5wZsgVTB72fgPTipChLiFl1MUBWpmC4jogUc+LUxmW26pekdlRiT10toP
	mLDAOO7uCOY9b5Y3tyCNSoNPL961qOppUhySQ/nO+KXL/zcvYLa8zsC4n7uNxMI9dK6myp5kYMiPi
	QB6K9ydaOGK8mP/S0Xfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wrB-0000000GALr-17xZ;
	Fri, 11 Sep 2026 08:43:37 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wr6-0000000GALP-2OUH
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 08:43:34 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc147d86bebso831148a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 01:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789116211; x=1789721011; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7nbu7B+bglE3m9s/GZRfFOgm8cRTpe/a1+eyVcACJU=;
        b=QIblIExT9jxZfiG/+mVQdZJOWAXLXRss+HJUdozwBWRxMDnt+Zv9yaDTogUl2OIhRu
         X8HpZCClfC/N/nYiyKUkaGdR4eE2W/gKG0u1vSw5Mk3XOZ8ACqD7hIwrOlttQHEkNAyG
         yNN11R7dFEsONeMjcVEKgQqwKnKEgf35u+dcD3duoxJyr/NVuBNSLUjSItVfZuJ799aj
         Vf+R0HMsKO7NB0eQRhT6KmLkMAAqJStzff4dWXg/noEQVuXBqw4/+/Hoofo6EPMXy/tF
         22Ws08bh7VWoqwiW1mfcN8GRf538eDNIQAWnXO1UAb54myoB2j6ewT6ZaAInAUsqKydF
         Pz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789116211; x=1789721011;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7nbu7B+bglE3m9s/GZRfFOgm8cRTpe/a1+eyVcACJU=;
        b=UytDxKMkODOpjizi1sXVQf6AYusvBpEaBiS1kXT0pe1iJbX6bSmS875BPXarDdMIEz
         EM98pTLCKxOXKCg8YDL4NBm9uaIa9mYbn5yuBkZpMiu7vIVXfGBCa3UT9/zLJ+sh4ydn
         KSylAiHC1C5Py1w1IolYJjbtjxeHxw415GIHL9RK4qrgBzFzZlFjI95TBY2knosJxVdB
         1JuZkjkBg2JVkulD2RgtghV0KIr5lNRuVYOCi/UbUNe0YMLxs5pGzDNkYeoJ7XznE8A/
         Bvqff6uOvTzokEEsjNFhkyrwB5M+00lJ4rKEkNnkNuxDH7lY4MLjYe7SxAZxX0xSxzzb
         XHKA==
X-Forwarded-Encrypted: i=1; AKwUvBwvEKlkIg+7R4tG53sCXJ/he8xMCtLCWsl2POh66goNpmZWREQ2ZdoyvDS00wWThDfL6+EL4PrXQ26fpg==@lists.infradead.org
X-Gm-Message-State: AFuF++kU0tDqtQo6C1q4IZMrLmdWAaH4fhL4r+YF1gKQXGHgsrMUZoZY
	9GlKmtUQ94AoTrSKcrSRyeelf8ymLJneECSubPsrlogAHfjc5O3kP8YH
X-Gm-Gg: AYBFou2Jdqm4UCjZRR4FYU1EuBJw9xI2ukMKl3PJRLHzF243XWuc3XES7caqDqBkG3N
	A4p8IW7p17MubzN80/NlY1gSmym9xXJtIiwyI6HdkuNrGy38m37R5q2eH2tlKPh8npyfkblw5wG
	e7KFFiJImzk8E8yW27g6RgrOdrj+9EicMNSO7sd7GJxhz8hv21EMvUApiwpUYK7n8MwdDmaOYt0
	g7xyGEQ//O3NGGuUEEXUk4nKMkyoRxevdpGkKQ8o/OiKZsng7rvnRrN1gyQlRcloRosYPdg3QLI
	mAmhA5pn5V4ruHZU+Z6kClu0+DPlk2xKv09Q+l19Pr4J/uciDc4f6i2FJrI0OBbin6dpGGxrqrN
	FrHI/a/TtS77YXqPrb4EnuRbeInYF3JMFAXXPd/FxteQ7FVzdJwSz+4iFuyyd7lMTzxWgCqX4hv
	BJagQkBXiWNX54KC7FMZJLHx+jb0TIQDmiP4o/V6RMTRWdVjux1co64/z6bePP1H6ekHqWrglxo
	Q==
X-Received: by 2002:a05:6300:6cd2:10b0:3da:e57d:4a79 with SMTP id adf61e73a8af0-3dae57d4be8mr3715040637.13.1789116211210;
        Fri, 11 Sep 2026 01:43:31 -0700 (PDT)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c657156bsm813945a12.21.2026.09.11.01.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 01:43:30 -0700 (PDT)
Message-ID: <0f82c603-0ddd-4d01-bf48-56d0ffcd29b0@gmail.com>
Date: Fri, 11 Sep 2026 01:43:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] spacemit: k3: Replace bad CLINT node with ACLINT
 nodes
To: Junhui Liu <junhui.liu@pigmoral.tech>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>,
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_014332_624744_AA853A2B 
X-CRM114-Status: GOOD (  20.33  )
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

Hi Junhui,

Thanks for your patch. This would give me more clarity while reviewing
the OpenSBI patchset from Troy, and I was wondering why Troy sent this
https://lore.kernel.org/opensbi/20260908-ipi-clear-all-v1-1-b1bd5d016eb6@linux.dev/T/#u

Now it's much clearer -- K3 has two ways to do IPI, ACLINT and IMSIC.

One thing that may help us further: Can you clarify on the exact meaning
of "M-mode only"? OpenSBI would use PMP to protect those MSWI/MTIMER
regions, so I wonder if you meant that it's enforced by the PMP settings,
or it's *actually* enforced by the device itself (or fabric)? AFAIK, to
achieve this, the device must have a way to distinguish the privilege-
level of the CPU at the time it initiated the MMIO request. Hence, the
core must be putting the privilege level as some kind of attribute in the
MMIO request. Is that the case in k3? Can you confirm with SpacemiT?

On 9/8/26 09:28, Junhui Liu wrote:
> When testing OpenSBI with the upstream Device Tree, the CLINT controller
> failed to function properly with the irqchip.riscv_imsic_noipi boot
> parameter:
> 
>    Platform IPI Device         : aclint-mswi
>    Platform Timer Device       : aclint-mtimer @ 24000000Hz
>    
>    Domain0 Region03            : 0x00000000e081c000-0x00000000e081ffff M: (I,R,W) S/U: ()
>    
>    [    0.091014] smp: Bringing up secondary CPUs ...
>    [   10.104917] CPU1 failed to report alive state
>    [   20.118689] CPU2 failed to report alive state
>    [   30.132288] CPU3 failed to report alive state
>    [   40.145953] CPU4 failed to report alive state
>    [   50.159604] CPU5 failed to report alive state
>    [   60.173212] CPU6 failed to report alive state
>    [   70.186981] CPU7 failed to report alive state
>    [   70.191411] smp: Brought up 1 node, 1 CPU
> 
> Through exploring and testing, I discovered that the K3 actually
> provides all three complete ACLINT components, and subsequent
> confirmation with the vendor yielded the following information:
> 
> The ACLINT controllers are mapped to two physical memory regions:
> secure (0xf1810000-0xf1820000) and non-secure (0xe0810000-0xe0820000),
> with varying accessibility per controller and execution mode:
> 
> +---------+--------+------------------------+-----------------------+
> | Offset  | Module | Secure Region          | Non-Secure Region     |
> +---------+--------+------------------------+-----------------------+
> | +0x0000 | MSWI   | 0xf1810000-0xf1813fff  | 0xe0810000-0xe0813fff |
> |         |        | (M-mode only)          | (Inaccessible)        |
> +---------+--------+------------------------+-----------------------+
> | +0x4000 | MTIMER | 0xf1814000-0xf181bfff  | 0xe0814000-0xe081bfff |
> |         |        | (M-mode only)          | (Inaccessible)        |
> +---------+--------+------------------------+-----------------------+
> | +0xc000 | SSWI   | 0xf181c000-0xf181ffff  | 0xe081c000-0xe081ffff |
> |         |        | (M-mode only if efused)| (M/S-mode Accessible) |
> +---------+--------+------------------------+-----------------------+
> 
> Taking these constraints into account, we choose the secure region
> (0xf1810000-0xf181bfff) for the M-mode ACLINT components (MSWI and
> MTIMER), and the non-secure region (0xe081c000-0xe081ffff) for the
> S-mode SSWI component.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
> Changes in v2:
> - Drop the generic riscv,aclint-* fallback compatibles and use only
>    SpacemiT K3-specific compatibles.
> - Match spacemit,k3-aclint-sswi directly in the SSWI driver.
> - Squash the ACLINT MSWI and MTIMER DT additions into the patch that
>    replaces the incorrect CLINT node.
> - Link to v1: https://patch.msgid.link/20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech
> 
> ---
> Junhui Liu (6):
>        dt-bindings: timer: thead,c900-aclint-mtimer: Add SpacemiT K3
>        dt-bindings: interrupt-controller: thead,c900-aclint-mswi: Add SpacemiT K3
>        dt-bindings: interrupt-controller: thead,c900-aclint-sswi: Add SpacemiT K3
>        dt-bindings: timer: sifive,clint: Deprecate spacemit,k3-clint
>        irqchip/aclint-sswi: Add support for SpacemiT K3
>        riscv: dts: spacemit: k3: Replace incorrect CLINT node with ACLINT nodes
> 
>   .../thead,c900-aclint-mswi.yaml                    |  1 +
>   .../thead,c900-aclint-sswi.yaml                    |  5 +--
>   .../devicetree/bindings/timer/sifive,clint.yaml    |  5 ++-
>   .../bindings/timer/thead,c900-aclint-mtimer.yaml   |  1 +
>   arch/riscv/boot/dts/spacemit/k3.dtsi               | 37 ++++++++++++++++------
>   drivers/irqchip/irq-aclint-sswi.c                  |  1 +
>   6 files changed, 37 insertions(+), 13 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260729-k3-aclint-94ca9d3f818f
> 
> Best regards,
> --
> Junhui Liu <junhui.liu@pigmoral.tech>
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Bo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
