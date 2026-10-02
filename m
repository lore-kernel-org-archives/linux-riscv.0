Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98610CA5FE0
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 18:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmn7lqE6EsjPbx3o44pBKB8dr8h2ImrYQzUXRIgePNs=; b=FR/qJDkjxDKDGR
	DNfmhe9nrpFDQJNSMUoXH/0iui57V6NTNBPkGOB/Lurk9ESlcNDKrk/AH92ZNLii3HMBOvcoGF36m
	ZuznHi1AEewWcuX3ocedwaM5YXTteVeh45S4zNaEA0mm1AWpwlORqV3yym8GVElg03tJo7MkkKibF
	Y4b0PKpRoWR2T+UDsapuiYHSOplrpx+KyBmRxMjHeVAEnSDcxouUbgWgv3bNKsK4JXxKke9DED+Bg
	WMQ6Q63w3W0zSb5eLmX7IgD8BWi0JKQVhdO9H3dtcuI9XHWXK1zv5MfqpFxRf2SvihwRtFqvMRqlB
	49B3x3HS2SX0MwulRTSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiMV-0000000CIyr-2WXh;
	Fri, 02 Oct 2026 18:52:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiMS-0000000CIx9-0XOU
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 18:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790967119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r0MvWYWwsu7LG0V0ETPW58ud5t6tmXACPDGuesfQVDA=;
	b=HuGmaO/o9vKa496/1RyoY0obRUI20MtNMpCaJAuxSydQfiEWDxwFtoh4z7IgZqcIgp9SZv
	3cwoGbYBSGT2ZyR1Sk8shpZfnHP6+KYrvY/TWozQE9xen09EBkwyHq7apyLNN3XEDE1M8e
	1iWY05iuKJhK3Qevh5otCn34d5olaN4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-Q-SnPMA0NJCLp0pPUqiWyg-1; Fri, 02 Oct 2026 14:51:57 -0400
X-MC-Unique: Q-SnPMA0NJCLp0pPUqiWyg-1
X-Mimecast-MFC-AGG-ID: Q-SnPMA0NJCLp0pPUqiWyg_1790967117
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917b7dd3f1dso3300966d6.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 11:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790967117; x=1791571917;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0MvWYWwsu7LG0V0ETPW58ud5t6tmXACPDGuesfQVDA=;
        b=kzubTAXaMJIbuYCzVM6+zEkzDBvE8BnnrIe6kF7qRtl442jsyPiRg/8g5hJTPZsoex
         +EZD25GrN5sE1n2u60hDfVnU6KuNa1fchN5QNG/+8fJFGLi1oEXiOYMu5c2rgoDz2qaX
         hu/FNNYtDDtGFgNcaWy2lbf/M9b0LIq7IUzbM4Z77s6qGORz2wb0GrpBt8afOjydWCf3
         DUKyE0v79sp3r4bK8lrknw1pzoZlAdhvzu5Sl4LSf9/4KDJ4MSVYVCNkVS/I1GAD74eU
         leD6HhJQaxJCRCjp7Zvc0FZn0L+ZE7uUYz21vGd0L2IUBpW23kt5EDEA+tgSagKrtdJa
         KoUw==
X-Forwarded-Encrypted: i=1; AKwUvBycAijbyN6dRbTg1wiZou9XVNn/gRiTEMlKIix4pH2jSDCEQL7UIQEYgN1xUmHzjg8kX+64D1Hc9gLVeA==@lists.infradead.org
X-Gm-Message-State: AFuF++l9lssnq+kf62+4BQ1agVLAarh2g980F49Ort3R7OakERM2gkb4
	Ahrdw8LLeudN9r2hE3Tm/S4RLJGIXy9LsrftWRsghGuUusam8KAlViSLLGMFrGGrw3yJNyMsNS+
	wHFIcaq1aYzJ05pTfCtPmNhDm2D97puFZlQXZ3XxRKAgApfVWfMHtrZ+89fkZBr3s95dv6A==
X-Gm-Gg: AYBFou1Yh1/y2TtNGcVBPf5sXtZTEE68RafwJNu2ctzMTTbpcbIQFB4oFs+LuzaWFCi
	wFE7284rDACY+zrt6VwzQ7whCND6QeBnUHckZKMYQmNAS2ZDfDYG0vqcW8tTj8hM38M4PSngD6I
	1+F4/qCgiQaAm20RVpthM/JNRHEYxmuKeTb9nXVk88NWST9z8feeNjnFXzEmxBvPfYYgBiwbEkk
	AUi6zeAae6Jxv6IyRyJ1740PHBqmqEVHk6CQpvwU02bx8rO6ktEAJotMmrFB/nqLHaEaK6HPM40
	9E6GNjK2si9Da8oZM9HDBqNUk6EDkt1D1F0VtUaIQYRjqUGBojvpbBmFy+EYZRe4U94FHQ0as4h
	Lgp3rUU75+RFPBg==
X-Received: by 2002:a05:620a:7105:b0:93a:824:ac8d with SMTP id af79cd13be357-93e5102406amr48500785a.27.1790967116782;
        Fri, 02 Oct 2026 11:51:56 -0700 (PDT)
X-Received: by 2002:a05:620a:7105:b0:93a:824:ac8d with SMTP id af79cd13be357-93e5102406amr48495985a.27.1790967116138;
        Fri, 02 Oct 2026 11:51:56 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb ([2600:382:7723:4eba:66b1:961f:1a2d:af55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca03a1bbsm290352485a.1.2026.10.02.11.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:51:55 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v5 11/23] dt-bindings: clock: Add StarFive JHB100
 Peripheral-0 clock and reset generator
From: Brian Masney <bmasney@redhat.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Emil Renner Berthing <kernel@esmil.dk>, 
 Kees Cook <kees@kernel.org>, 
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-hardening@vger.kernel.org, 
 netdev@vger.kernel.org, Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20260930124317.5648-12-changhuang.liang@starfivetech.com>
References: <20260930124317.5648-1-changhuang.liang@starfivetech.com>
 <20260930124317.5648-12-changhuang.liang@starfivetech.com>
Date: Fri, 02 Oct 2026 14:51:13 -0400
Message-Id: <179096707365.821688.14329539857628581125.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1426; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=d+7Dzq3mPeyFPY32y86AvdtMGs9/cR+SwwsFl7j1jgU=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL2/7Wx/KcQOOltnNfPrdMX3LuT/HC+0e60NpG6lD1rZ
 17q/rvbvKOUhUGMi0FWTJFlSa5RQUTqKtt7dzRZYOawMoEMYeDiFICJ/DvF8JvNMflnwRuHRRt/
 inec9nG6u3qLz7SmebNcL5042au9L+cTw28Wm8MCxyYbZ0apt67dn7TKUV08XMTt6JZbavvlIy/
 UbmYAAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V4lxThhprBHK4SHUfVcFpJgmHJnnabXQsw6HJI-FDRA_1790967117
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_115200_249564_F3F50C87 
X-CRM114-Status: GOOD (  12.31  )
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

Hi Changhuang,

> Add bindings for the Peripheral-0 clock and reset generator (PER0CRG)
> on the JHB100 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jhb100-per0crg.yaml b/Documentation/devicetree/bindings/clock/starfive,jhb100-per0crg.yaml
> new file mode 100644
> index 000000000000..db43e03fd60c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jhb100-per0crg.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jhb100-per0crg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 Peripheral-0 Clock and Reset Generator
> +
> +maintainers:
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jhb100-per0crg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Main Oscillator (25 MHz)
> +      - description: PLL6
> +      - description: Configure 400MHz
> +      - description: Configure 800MHZ

There's a mismatch here in the casing of the units. One line has MHz and
the other has MHZ.

Brian

-- 
Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
