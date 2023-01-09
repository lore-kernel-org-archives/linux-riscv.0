Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAC4C5479D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 08:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02jZ6IwTeKXteAC7IL07BXVD2PbYiUIgkwjkHPOkPVk=; b=arQXV7bbeqW6MK
	v8/6DYR6R6FW5dFO+qU/3RMK7SynDH1YTaRFVm9bPchS+hKfWv5g+KjLGbZwRWl02XkyQdaDMbt0F
	8N/TP4dwQUcRDalY56GEdyCYEkphgywtaWk44ebR7VMQ0IXvo0/vUwFZmZW2vTInbA4Ukd+O17pyi
	lpQTQHfQQnNmlcAJCY7rd8Ic35zMHmQFcEm8uIHVWJcLjCHAQjmu/5shpmT2K0ezYgaxR2C/A7R/V
	yk3AUh17kHCDEn0BmZajXjwMLdTsh1r+SIqBmgeW0C9CI6ScDcFQDZcbEjjKiESHcFp5ysXz8f5D0
	LSSiAH6OPzZz8+/lOOtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEn74-000JW2-P0; Mon, 09 Jan 2023 08:02:35 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEn70-000JTV-1L
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 08:02:32 +0000
Received: by mail-pj1-x102a.google.com with SMTP id z4-20020a17090a170400b00226d331390cso8565086pjd.5
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jan 2023 00:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gzWfkg4ZC7kc3QEtk+OYVwq1uaceASK3hTBpAc94uQ0=;
        b=dTXSsdMcCi67LNWErLwMapGj/WTi4uejeFaA7SJH2fnn1vCcR8dZdoMFteHa0nR/F8
         kh+oCK+ztYw5Rf4gKv4TV5Gdah2TQm8k+XL62wM3ueN5p/GVMw+ZxiAACMfUSzIVYbOS
         Xs/nMno96/ZqDQeh4Ni75wvFBhmTroKQxcbhm4q51cwo2RV7y5bjDGNUrbcVui5pdBIO
         maly1bWQ5ih++hsQEb8M2G7xGXr3oBPVCCk3T43pqAWK62Nn+VOQIWNnXhpyxUBBHkNU
         nfmOSpXVUGQYU4xxVcOQgeMSNx1UD0P+L7qHDevVACiS1B0xvaGy9HU6baIVxrjTdUnG
         7qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzWfkg4ZC7kc3QEtk+OYVwq1uaceASK3hTBpAc94uQ0=;
        b=eV3cxKlCInrO63ozSZVtdrSvsNYRgcdRuQwqQ4dtBn6ISLL7V1KLBwXAhhcGMyYJvd
         65YYML2jnBMciehAkWs86+UdPV2JyubPRZCP+Qfh+/A+FzM+2a0DzA9j6C/t6Af1SMvv
         biTYTbTmL/30ynsidkFt33nT2yKQ8uN6Z8hiarQsMVdpD+eUgooxsxOZiMwK54nr6xDV
         HBBkRPnYLv7CDgIIi9EtEAxRP7ds56uF8ie/MU8TVjQI64MfLMxmz9SAm9htOXCsNTo5
         o6faDYFteSMW33mIsdNcjrPHlgBBFLl2raWxU6TlPblvrsJJO5dyZykTkvi3lNyG/5YK
         Ns7A==
X-Gm-Message-State: AFqh2koOx4R60+nldXnm64QksoRQzCf8rgE3yJNR7oGqB2FZYlA8HuWv
	RSIvlqM9sBimSF5QOQ9Z5pCgL4a+guoKMAFtFQffMw==
X-Google-Smtp-Source: AMrXdXuftWpX5mTStYap+1P6OPLCG3xf/3GpmVYY9n9/X2wdAH3VchswgQCSQ8KEuwHPflydKDj31E8wKJDgPlqWB90=
X-Received: by 2002:a17:90a:db53:b0:227:208f:65f with SMTP id
 u19-20020a17090adb5300b00227208f065fmr119951pjx.32.1673251347239; Mon, 09 Jan
 2023 00:02:27 -0800 (PST)
MIME-Version: 1.0
References: <20230102165551.1564960-1-conor@kernel.org> <20230103092816.w6hknvd4caeahdo4@orel>
 <Y7s2+McYXLeEMNck@spud>
In-Reply-To: <Y7s2+McYXLeEMNck@spud>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 9 Jan 2023 00:02:16 -0800
Message-ID: <CAHBxVyHUPPakb3djAuJMkRjXOew9+PC6nARv+RT-GrMWPdCRGw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: riscv: add SBI PMU event mappings
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	Conor Dooley <conor.dooley@microchip.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	apatel@ventanamicro.com, will@kernel.org, mark.rutland@arm.com, 
	opensbi@lists.infradead.org, samuel@sholland.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_000230_300929_C8353A02 
X-CRM114-Status: GOOD (  26.15  )
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

On Sun, Jan 8, 2023 at 1:34 PM Conor Dooley <conor@kernel.org> wrote:
>
> Drew, Atish,
>
> Mainly just a question about the OpenSBI doc at the end. Gonna fix up
> the rest of the wording and resend in a few.
>
> On Tue, Jan 03, 2023 at 10:28:16AM +0100, Andrew Jones wrote:
> > On Mon, Jan 02, 2023 at 04:55:51PM +0000, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > The SBI PMU extension requires a firmware to be aware of the event to
> > > counter/mhpmevent mappings supported by the hardware. OpenSBI may use
> > > DeviceTree to describe the PMU mappings. This binding is currently
> > > described in markdown in OpenSBI (since v1.0 in Dec 2021) & used by QEMU
> > > since v7.2.0.
> > >
> > > Import the binding for use while validating dtb dumps from QEMU and
> > > upcoming hardware (eg JH7110 SoC) that will make use of the event
> > > mapping.
> > >
> > > Link: https://github.com/riscv-software-src/opensbi/blob/master/docs/pmu_support.md
> > > Link: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc # Performance Monitoring Unit Extension
> > > Co-developed-by: Atish Patra <atishp@rivosinc.com>
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>
> > > +  riscv,event-to-mhpmevent:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > > +    description:
> > > +      Represents an ONE-to-ONE mapping between a PMU event and the event
> > > +      selector value that platform expects to be written to the MHPMEVENTx CSR
> >                             ^ the
>
> I think this one is arguable, it makes sense both ways IMO. I don't care
> since it's not my prose though ;)
>
> > > +      for that event.
> > > +      The mapping is encoded in an matrix format where each element represents
> > > +      an event.
> > > +      This property shouldn't encode any raw hardware event.
> > > +    items:
> > > +      items:
> > > +        - description: event_idx, a 20-bit wide encoding of the event type and
> > > +            code. Refer to the SBI specification for a complete description of
> > > +            the event types and codes.
> > > +        - description: upper 32 bits of the event selector value for MHPMEVENTx
> > > +        - description: lower 32 bits of the event selector value for MHPMEVENTx
> >
> > > +     * codes, U74 uses a bitfield for events encoding, so several U74 events
> > > +     * can be bound to single perf id.
> >                                 ^ a   ID
> >
> > > +     * See SBI PMU hardware id's in OpenSBI's include/sbi/sbi_ecall_interface.h
> >
> > IDs
>
> Most of this stuff comes directly from the doc in OpenSBI that I
> copy-pasted. Atish, what do you wanna do once the binding is upstream
> about the original doc?
>

I will fixup the doc based on the final version of the binding once it
is upstream.

> Thanks,
> Conor.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
