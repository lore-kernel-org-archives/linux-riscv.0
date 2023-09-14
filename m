Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908FFEDE98F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 07:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RG+5risuPtuV9Nkygr2AqdHwAVZkeWlcIsNInE7fN5E=; b=C4kzuattxQQlOv
	2cbkiLfyUTwBwlXVaL2Ph2nOe7atzMttec0enYOOgNz4hWD9qo6CCp3JkikU0/JllvRW0fiJDuo5x
	c1vHphPVtuMHEdIqd8d6BEwyDJQf088YKBpTo8rHxMxWx49ojXjWHMt1PORziJKgCvLoBK/kGmKn2
	GNfLQicwL3SII6kdMMCYXEgp7wHuf7ZJgqQqIkyxXvsamxqWHUc5jqYYOK++YlftMFLv3dxVDDzX6
	wpfWA/Iz4s4g6EHmkEaQe222dz1+TyjVRpHVKQy3x5kxi8iHL7J2JmMcMA8hKKpq8aYIrMgkywhf/
	U1rm8Y0P4SUINC4qpcjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qghEh-007dL2-0d;
	Thu, 14 Sep 2023 07:58:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qghEe-007dJc-0z;
	Thu, 14 Sep 2023 07:58:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DC16261CD1;
	Thu, 14 Sep 2023 07:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0DAC433CB;
	Thu, 14 Sep 2023 07:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694678278;
	bh=w97jgCxmnIaSV+4bbnSk1R7YKOaENxmwU85CS3tNcPo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZhVxi3ng0SyBcUTeBMQePKCqcaLd8ethtP02v1fL+sfnyUaoKqHkq9ju2Mb2DzGmx
	 12cPbr6KS37U3XQdfYDg39fefRxRGPkNAt0JcrqNuLoRrMOChzJNI4I+30xyF/Z+DO
	 9uUgJtnDdJgF7nEXzChIzKYS5cn58Peg6JMWClVEEmyT8kN2TvcDY5+cWznkmtlWEO
	 c1HUPT6VfSprEw7p42m6MzIVjlX2UkH0Kd4+Pu+jggh68f29rTsOMA5jm7wh31KLCT
	 cO/FDvorrtEl5TBHSc2NBxToKVfMI9e/jz1tApeqdW/ft0iWrkGBooY5qJ9zwbp4IC
	 8ehDh8M7Vy3CQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2bcbfb3705dso9666691fa.1;
        Thu, 14 Sep 2023 00:57:58 -0700 (PDT)
X-Gm-Message-State: AOJu0YywziF0aG6bQiiWf7fGqiwheUpR8kveKReTmPcepKS5Jfwqy/Zn
	tQngwvtYRGcKo/vczq+k0vG846+mIXOQxDu/Vxk=
X-Google-Smtp-Source: AGHT+IFuQtEiIDjo1DdCQY9KR6JQVDNyxLjSiMxhcLunotHqZWQic/fNmbjkP5sAIxtK7RWx3KWbiGw4//GC4psRyfI=
X-Received: by 2002:a2e:a172:0:b0:2bc:db70:b563 with SMTP id
 u18-20020a2ea172000000b002bcdb70b563mr4235801ljl.32.1694678276384; Thu, 14
 Sep 2023 00:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230913163823.7880-1-james.morse@arm.com> <20230913163823.7880-28-james.morse@arm.com>
In-Reply-To: <20230913163823.7880-28-james.morse@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 14 Sep 2023 09:57:44 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHRAt7ecB9p_dm3MjDL5wZkAsVh30hMY2SV_XUe=bm6Vg@mail.gmail.com>
Message-ID: <CAMj1kXHRAt7ecB9p_dm3MjDL5wZkAsVh30hMY2SV_XUe=bm6Vg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 27/35] ACPICA: Add new MADT GICC flags fields [code first?]
To: James Morse <james.morse@arm.com>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	Salil Mehta <salil.mehta@huawei.com>, Russell King <linux@armlinux.org.uk>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_005800_427649_633B0DB9 
X-CRM114-Status: GOOD (  19.24  )
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

Hello James,

On Wed, 13 Sept 2023 at 18:41, James Morse <james.morse@arm.com> wrote:
>
> Add the new flag field to the MADT's GICC structure.
>
> 'Online Capable' indicates a disabled CPU can be enabled later.
>

Why do we need a bit for this? What would be the point of describing
disabled CPUs that cannot be enabled (and are you are aware of
firmware doing this?).

So why are we not able to assume that this new bit can always be treated as '1'?


> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> This patch probably needs to go via the upstream acpica project,
> but is included here so the feature can be testd.
> ---
>  include/acpi/actbl2.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
> index 3751ae69432f..c433a079d8e1 100644
> --- a/include/acpi/actbl2.h
> +++ b/include/acpi/actbl2.h
> @@ -1046,6 +1046,7 @@ struct acpi_madt_generic_interrupt {
>  /* ACPI_MADT_ENABLED                    (1)      Processor is usable if set */
>  #define ACPI_MADT_PERFORMANCE_IRQ_MODE  (1<<1) /* 01: Performance Interrupt Mode */
>  #define ACPI_MADT_VGIC_IRQ_MODE         (1<<2) /* 02: VGIC Maintenance Interrupt mode */
> +#define ACPI_MADT_GICC_CPU_CAPABLE      (1<<3) /* 03: CPU is online capable */
>
>  /* 12: Generic Distributor (ACPI 5.0 + ACPI 6.0 changes) */
>
> --
> 2.39.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
