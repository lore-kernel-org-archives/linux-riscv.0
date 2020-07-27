Return-Path: <SRS0=GA+h=BG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3177C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 13:13:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5B30206D8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 13:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oxLPbOF+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="NCT/HgeB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5B30206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FpsE6nyKF4KtpxqXCpab9JerLcPmMNLuoaA66in+rTI=; b=oxLPbOF+OGEvP3uAgSghmTVNp
	VsJGxu0QlvQ3Q4/cfTBCn94zVhIclNfLIOH/imxPEMXvyc4pKcnKi4TQ4ST9tzk8nzvxiEi2EQm6d
	OeYxSmiBCwRxXBERop1l5uOhMnxAUQ5n3LqGpefyLveS0f5lUhVNo6gmDoiuZMmGSW6xjSJ+zJi0d
	veaqoVBl3JEHb/ltsIxcvU1jyKFsErUTzuCabCxeZ9hhUjCnaiT3miOrmpzAq1jnRc/JvAtbJ+Eii
	6Yxy1SbXwfStHul+SDMIwBexCdvYH8HuDdDz+/jlg3DzJzTdT3408ovrXM3D3TBeiTTIC2lu+vSqD
	oBLXWqQAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k02wQ-0003si-NC; Mon, 27 Jul 2020 13:13:18 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k02wO-0003rx-Rs
 for linux-riscv@lists.infradead.org; Mon, 27 Jul 2020 13:13:17 +0000
Received: by mail-wr1-x442.google.com with SMTP id 88so14842348wrh.3
 for <linux-riscv@lists.infradead.org>; Mon, 27 Jul 2020 06:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g4i/nZmoIHgwQy9k4TlqY2STkIhHTH3UyXg9heo329E=;
 b=NCT/HgeBpzcXJ8puF1nv3nenzUG16+57U7u2hsX/ElnWZiLQ6Kum4UKNXc/xuoHTWN
 t8bR1GuOeow8jlFQ7mWb+XP4d6doNRy/yJHOhiOv9rzHFD54J48VLia/wvW86YFqZPvz
 UsdN9gZjCf7U7JsPpr3NBLznFlXZBZZ/THciTJgrc2VvmW8MhD+Dk8afEq93fpNdHM4E
 4fHXvEgpqUTX1JpOayAYDyVpl0Kewf/HsMnm6hToJ8VouWvw6O3XwWXWYDTN/v71ljQt
 qdv19Ke4HU2f1EFt1VCYB1jH978pJhmKfDvvFhdALxQE/PvSeTjJOiHs+rF/gdJgXDSc
 6DwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4i/nZmoIHgwQy9k4TlqY2STkIhHTH3UyXg9heo329E=;
 b=eXE+gT7EEuoaMk7LrLwzx8u5PJK06CJvBv24O7FhC+TvVzLOHF7daGUZhgsXXRey8f
 i09Co7j5/5Pibvs3ju4327W8IOZtKvxJF9yztH9Eg99Qc24T2X6X6EvPtWjQbqAaPDOt
 tpj+SDPT6PBnYmKouaFoaZR1iQy3l2Wa0LwSu+fzOjZYGLik7uUMvUKUazKoTXRxtzcE
 lkUU2ChriqSdpYQLjWo5JWeHg/+aB+N8Obv17Y86g0FHV/vGBsNjTwYXmRQ2z0pYDDc2
 O3Yt3WhPnqBGAGa6zWNoiFcWNhZsAXviPJ0d2q+HDdVFgeK8wvqs4uADUORfd1cJt8ON
 gYhA==
X-Gm-Message-State: AOAM532Z7fGGrFUgU0rvOhwiRc5aYDshcQJvgckXCz0b7gQ+qusxT+mx
 amN1pouA9FuoqUlkXHKhqPwO8cGHxovxDVko5+B/SA==
X-Google-Smtp-Source: ABdhPJxVH+67k5w750MLOs3qmI9ttAa1To4qXnnN1vha35aXv13xtoZGB+q5ZG8RxsIeIaTBADA+aJQDAfB5AFVoVRA=
X-Received: by 2002:adf:bb52:: with SMTP id x18mr19976623wrg.325.1595855593608; 
 Mon, 27 Jul 2020 06:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <a08d725612aac35f30b3c422d3617bc4c733d8c7.1595838303.git.zong.li@sifive.com>
In-Reply-To: <a08d725612aac35f30b3c422d3617bc4c733d8c7.1595838303.git.zong.li@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Jul 2020 18:43:02 +0530
Message-ID: <CAAhSdy2gSVZcvx0jVgEC7BGDwix62JCVvZeR5-vGWT7MRwf=AA@mail.gmail.com>
Subject: Re: [RFC PATCH] dt-bindings: riscv: Add YAML documentation for PMU
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_091317_019758_B8277A8A 
X-CRM114-Status: GOOD (  22.62  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 27, 2020 at 1:57 PM Zong Li <zong.li@sifive.com> wrote:
>
> Add device tree bindings for performance monitor unit. It passes the
> dt_binding_check verification.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  .../devicetree/bindings/riscv/pmu.yaml        | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/pmu.yaml
>
> diff --git a/Documentation/devicetree/bindings/riscv/pmu.yaml b/Documentation/devicetree/bindings/riscv/pmu.yaml
> new file mode 100644
> index 000000000000..0c49039a5d3b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/pmu.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Performance Monitor Units
> +
> +maintainers:
> +  - Zong Li <zong.li@sifive.com>
> +  - Paul Walmsley <paul.walmsley@sifive.com>
> +  - Palmer Dabbelt <palmer@dabbelt.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: riscv,pmu
> +
> +  riscv,width-hpmcntr:
> +    description: The width of hpmcounter CSRs. Default is 64.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  riscv,n-hpmcntr:
> +    description: The number of hpmcounter CSRs. Default is zero.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  riscv,hw-event-map:
> +    description: The mapping of generic hardware events to values of hpmcounter.
> +      The key is the encoding of generic hardware events, and the value is the
> +      actual value which is implemented by platform. If there is no a key-value
> +      pair for specific generic hardware event, view the generic hardware event
> +      as not supported. CYCLE and INSTRET be mapped by default, so we shouldn't
> +      list PERF_COUNT_HW_CPU_CYCLES and PERF_COUNT_HW_INSTRUCTIONS here.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  riscv,hw-cache-event-map:
> +    description: The mapping of generic hardware cache events to values of
> +      hpmcounter. The key is encoding of generic hardware cache events, and the
> +      value is the actual value which is implemented by platform. If there is no
> +      a key-value pair for specific generic hardware cache event, view the
> +      generic hardware cache event as not supported.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  riscv,hpmcntr-of-event:
> +    description: The mapping of platform hardware events to allowed hmpcounters.
> +      The key is the platform hardware event, and the value is the bitmap for
> +      hmpcounters which support this event. If there is no a key-value pair for
> +      specific platform hardware events, view the platform hardware events as
> +      supported by all hpmcounters.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmu {
> +      compatible = "riscv,pmu";
> +      riscv,width-hpmcntr = <40>;
> +      riscv,n-hpmcntr = <2>;
> +      riscv,hw-event-map = <0x3 0x0202
> +                            0x4 0x4000>;
> +      riscv,hw-cache-event-map = <0x010201 0x0102
> +                                  0x010204 0x0802>;
> +      riscv,hpmcntr-of-event = <0x100 0x18
> +                                0x400 0x10>;
> +    };
> +
> +...
> --
> 2.27.0
>

I don't see the point of sending DT bindings documents
until the SBI PMU extension is defined and accepted
by everyone.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
